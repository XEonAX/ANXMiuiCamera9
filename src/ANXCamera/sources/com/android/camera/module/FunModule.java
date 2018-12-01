package com.android.camera.module;

import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.support.annotation.MainThread;
import android.support.v4.view.MotionEventCompat;
import android.telephony.TelephonyManager;
import android.util.Range;
import android.view.Surface;
import com.android.camera.AutoLockManager;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.MediaAudioEncoder;
import com.android.camera.module.encoder.MediaEncoder;
import com.android.camera.module.encoder.MediaEncoder.MediaEncoderListener;
import com.android.camera.module.encoder.MediaMuxerWrapper;
import com.android.camera.module.encoder.MediaVideoEncoder;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$FilterProtocol;
import com.android.camera.protocol.ModeProtocol$StickerProtocol;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.storage.Storage;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.GLCanvasImpl;
import java.io.FileDescriptor;
import java.io.IOException;
import java.util.ArrayList;

public class FunModule extends VideoBase implements ModeProtocol$FilterProtocol, ModeProtocol$StickerProtocol {
    private V6CameraGLSurfaceView mCameraView;
    private CountDownTimer mCountDownTimer;
    private MediaMuxerWrapper mLastMuxer;
    private final MediaEncoderListener mMediaEncoderListener;
    private MediaMuxerWrapper mMuxer;
    private ArrayList<SaveVideoTask> mPendingSaveTaskList;
    private long mRequestStartTime;

    private final class SaveVideoTask {
        public ContentValues contentValues;
        public String videoPath;

        public SaveVideoTask(String videoPath, ContentValues values) {
            this.videoPath = videoPath;
            this.contentValues = values;
        }
    }

    public FunModule() {
        super(FunModule.class.getSimpleName());
        this.mPendingSaveTaskList = new ArrayList();
        this.mMediaEncoderListener = new MediaEncoderListener() {
            public void onPrepared(MediaEncoder encoder) {
                Log.v(FunModule.TAG, "onPrepared: encoder=" + encoder);
                if (encoder instanceof MediaVideoEncoder) {
                    FunModule.this.mCameraView.setVideoEncoder((MediaVideoEncoder) encoder);
                }
            }

            public void onStopped(MediaEncoder encoder, boolean muxerStopped) {
                Log.v(FunModule.TAG, "onStopped: encoder=" + encoder);
                if (encoder instanceof MediaVideoEncoder) {
                    FunModule.this.mCameraView.setVideoEncoder(null);
                }
                if (muxerStopped) {
                    FunModule.this.executeSaveTask(true);
                }
            }
        };
        this.mOutputFormat = 2;
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(178, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(178, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        Log.v(TAG, "onPreviewLayoutChanged: " + rect);
        this.mActivity.onLayoutChange(rect);
        if (this.mFocusManager != null) {
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public void onFilterChanged(int category, int newIndex) {
        updatePreferenceTrampoline(2);
        this.mMainProtocol.updateEffectViewVisible();
    }

    public void onStickerChanged(String newSticker) {
        Log.v(TAG, "onStickerChanged: " + newSticker);
        if (this.mCameraView != null) {
            GLCanvas glCanvas = this.mCameraView.getGLCanvas();
            if (glCanvas instanceof GLCanvasImpl) {
                ((GLCanvasImpl) glCanvas).setSticker(newSticker);
            }
        }
    }

    public void onCreate(int moduleIndex, int cameraId) {
        super.onCreate(moduleIndex, cameraId);
        changeConflictPreference();
        setCaptureIntent(this.mActivity.getCameraIntentManager().isVideoCaptureIntent());
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mCameraView = this.mActivity.getGLView();
        enableCameraControls(false);
        this.mTelephonyManager = (TelephonyManager) this.mActivity.getSystemService("phone");
        this.mVideoFocusMode = "continuous-video";
        onCameraOpened();
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        readVideoPreferences();
        initializeFocusManager();
        setPreviewFrameLayoutAspectRatio();
        updatePreferenceTrampoline(UpdateConstant.FUN_TYPES_INIT);
        startPreview();
    }

    public void onShutterButtonFocus(boolean pressed, int from) {
    }

    public void onShutterButtonClick(int mode) {
        Log.v(TAG, "onShutterButtonClick  isRecording=" + this.mMediaRecorderRecording + " inStartingFocusRecording=" + this.mInStartingFocusRecording);
        this.mInStartingFocusRecording = false;
        if (isIgnoreTouchEvent()) {
            Log.w(TAG, "onShutterButtonClick: ignore touch event");
            return;
        }
        ModeProtocol$ActionProcessing actionProcessing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing != null && actionProcessing.isShowFilter()) {
            actionProcessing.showOrHideFilter();
        }
        if (this.mMediaRecorderRecording) {
            stopVideoRecording(true, false);
        } else if (checkCallingState()) {
            this.mActivity.getScreenHint().updateHint();
            if (Storage.isLowStorageAtLastPoint()) {
                actionProcessing.processingFailed();
                return;
            }
            setTriggerMode(mode);
            enableCameraControls(false);
            playCameraSound(2);
            this.mRequestStartTime = System.currentTimeMillis();
            if (this.mFocusManager.canRecord()) {
                startVideoRecording();
            } else {
                Log.v(TAG, "wait for autoFocus");
                this.mInStartingFocusRecording = true;
            }
        } else {
            actionProcessing.processingFailed();
        }
    }

    public void onSharedPreferenceChanged() {
        if (!this.mPaused && this.mCamera2Device != null) {
            readVideoPreferences();
        }
    }

    protected void readVideoPreferences() {
        this.mMaxVideoDurationInMs = 10450;
    }

    protected void resizeForPreviewAspectRatio() {
        if (((this.mCameraCapabilities.getSensorOrientation() - Util.getDisplayRotation(this.mActivity)) + 360) % 180 == 0) {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mPreviewSize.height) / ((float) this.mPreviewSize.width));
        } else {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mPreviewSize.width) / ((float) this.mPreviewSize.height));
        }
    }

    public void onPause() {
        super.onPause();
        waitStereoSwitchThread();
        unregisterReceiver();
        releaseResources();
        updateStereoSettings(false);
        closeVideoFileDescriptor();
        this.mActivity.getSensorStateManager().reset();
        stopFaceDetection(true);
        resetScreenOn();
        this.mHandler.removeCallbacksAndMessages(null);
        if (!this.mActivity.isActivityPaused() && (CameraSettings.isStereoModeOn() ^ 1) != 0) {
            PopupManager.getInstance(this.mActivity).notifyShowPopup(null, 1);
        }
    }

    public void onStop() {
        super.onStop();
        EffectController.getInstance().setCurrentSticker(null);
    }

    public void onDestroy() {
        super.onDestroy();
        this.mHandler.sendEmptyMessage(45);
    }

    private void setVideoSize(int width, int height) {
        if (this.mCameraDisplayOrientation % 180 == 0) {
            this.mVideoSize = new CameraSize(width, height);
        } else {
            this.mVideoSize = new CameraSize(height, width);
        }
    }

    public void startPreview() {
        Log.d(TAG, "startPreview: " + this.mPreviewing);
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            setVideoSize(this.mPreviewSize.width, this.mPreviewSize.height);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), false, false, 0, this);
            this.mFocusManager.resetFocused();
            this.mPreviewing = true;
        }
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mPreviewing = false;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.pausePreview();
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.resetFocused();
        }
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mPreviewing = true;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.resumePreview();
        }
    }

    @MainThread
    protected void onPreviewStart() {
        if (this.mPreviewing) {
            this.mMainProtocol.initializeFocusView(this);
            this.mHandler.removeMessages(22);
            this.mHandler.sendEmptyMessageDelayed(22, 100);
            enableCameraControls(true);
            onShutterButtonFocus(true, 3);
        }
    }

    private void initializeRecorder() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "initializeRecorder: null camera");
            return;
        }
        String path;
        Log.v(TAG, "initializeRecorder");
        closeVideoFileDescriptor();
        if (isCaptureIntent()) {
            parseIntent(this.mActivity.getIntent());
        }
        if (this.mVideoFileDescriptor != null) {
            path = convertToFilePath(this.mVideoFileDescriptor.getFileDescriptor());
        } else {
            this.mCurrentVideoValues = genContentValues(this.mOutputFormat, -1);
            this.mCurrentVideoFilename = this.mCurrentVideoValues.getAsString("_data");
            path = this.mCurrentVideoFilename;
        }
        try {
            releaseLastMediaRecorder();
            this.mMuxer = new MediaMuxerWrapper(path);
            MediaVideoEncoder mediaVideoEncoder = new MediaVideoEncoder(this.mMuxer, this.mMediaEncoderListener, this.mVideoSize.width, this.mVideoSize.height);
            MediaAudioEncoder mediaAudioEncoder = new MediaAudioEncoder(this.mMuxer, this.mMediaEncoderListener);
            this.mMuxer.prepare();
            Log.d(TAG, "rotation: " + this.mOrientationCompensation);
            this.mMuxer.setOrientationHint(this.mOrientationCompensation);
        } catch (IOException e) {
            Log.e(TAG, e.getMessage(), e);
        }
        this.mOrientationCompensationAtRecordStart = this.mOrientationCompensation;
    }

    private String convertToFilePath(FileDescriptor fd) {
        return null;
    }

    private void releaseLastMediaRecorder() {
        Log.d(TAG, "releaseLastMediaRecorder " + (this.mLastMuxer != null));
        if (this.mLastMuxer != null) {
            this.mLastMuxer.join();
            this.mLastMuxer = null;
        }
    }

    private void releaseMediaRecorder() {
        Log.v(TAG, "releaseMediaRecorder");
        if (this.mMuxer != null) {
            this.mLastMuxer = this.mMuxer;
            cleanupEmptyFile();
            this.mMuxer = null;
        }
    }

    private void addSaveTask(String videoPath, ContentValues values) {
        SaveVideoTask task = new SaveVideoTask(videoPath, values);
        synchronized (this) {
            this.mPendingSaveTaskList.add(task);
        }
    }

    private void executeSaveTask(boolean justOne) {
        synchronized (this) {
            do {
                if (this.mPendingSaveTaskList.isEmpty()) {
                    break;
                }
                SaveVideoTask task = (SaveVideoTask) this.mPendingSaveTaskList.remove(0);
                Log.d(TAG, "executeSaveTask: " + task.videoPath);
                this.mActivity.getImageSaver().addVideo(task.videoPath, task.contentValues, true);
            } while (!justOne);
            doLaterReleaseIfNeed();
        }
    }

    protected void startVideoRecording() {
        Log.v(TAG, "startVideoRecording");
        this.mCurrentVideoUri = null;
        silenceSounds();
        if (startRecorder()) {
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
            Log.v(TAG, "startVideoRecording process done");
            onStartRecorderSucceed();
            return;
        }
        onStartRecorderFail();
    }

    private boolean startRecorder() {
        initializeRecorder();
        if (this.mMuxer == null) {
            Log.e(TAG, "fail to initialize recorder");
            return false;
        }
        long startOffset = 450 - (System.currentTimeMillis() - this.mRequestStartTime);
        if (startOffset < 0) {
            startOffset = 0;
        }
        boolean started = this.mMuxer.startRecording(startOffset);
        if (!started) {
            this.mMuxer.stopRecording();
            showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_recorder_busy_alert);
            releaseMediaRecorder();
        }
        return started;
    }

    private void onStartRecorderFail() {
        enableCameraControls(true);
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        ModeProtocol$ActionProcessing actionProcessing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing != null) {
            actionProcessing.processingFailed();
        }
    }

    private void onStartRecorderSucceed() {
        enableCameraControls(true);
        this.mActivity.sendBroadcast(new Intent("com.android.camera.action.start_video_recording"));
        this.mMediaRecorderRecording = true;
        this.mRecordingStartTime = SystemClock.uptimeMillis();
        this.mTelephonyManager.listen(this.mPhoneStateListener, 32);
        Log.v(TAG, "listen call state");
        updateRecordingTime();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
        trackGeneralInfo(1, false);
    }

    public void stopVideoRecording(boolean stopRecorder, boolean fromRelease) {
        if (this.mMediaRecorderRecording) {
            this.mMediaRecorderRecording = false;
            long videoDuration = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            this.mMuxer.stopRecording();
            if (!this.mPaused) {
                playCameraSound(3);
            }
            releaseMediaRecorder();
            boolean emptyVideo = this.mCurrentVideoFilename == null;
            if (!emptyVideo && videoDuration < 1000) {
                emptyVideo = true;
                deleteVideoFile(this.mCurrentVideoFilename);
            }
            if (!emptyVideo) {
                addSaveTask(this.mCurrentVideoFilename, this.mCurrentVideoValues);
            }
            this.mActivity.sendBroadcast(new Intent("com.android.camera.action.stop_video_recording"));
            this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
            Log.v(TAG, "listen none");
            animateHold();
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
            if (!(fromRelease || ("continuous-video".equals(this.mVideoFocusMode) ^ 1) == 0)) {
                this.mMainProtocol.clearFocusView(2);
                setVideoFocusMode("continuous-video");
                if (this.mCamera2Device != null && this.mCamera2Device.isSessionReady()) {
                    this.mCamera2Device.resumePreview();
                }
            }
            this.mAudioManager.abandonAudioFocus(null);
            restoreMusicSound();
            keepScreenOnAwhile();
            AutoLockManager.getInstance(this.mActivity).hibernateDelayed();
        }
    }

    protected void updateRecordingTime() {
        if (this.mMediaRecorderRecording) {
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            this.mCountDownTimer = new CountDownTimer((long) this.mMaxVideoDurationInMs, 1000) {
                public void onTick(long millisUntilFinished) {
                    ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateRecordingTime(VideoBase.millisecondToTimeString((950 + millisUntilFinished) - 450, false));
                }

                public void onFinish() {
                    FunModule.this.stopVideoRecording(true, false);
                }
            };
            this.mCountDownTimer.start();
        }
    }

    private void updateVideoStabilization() {
        if (isDeviceAlive()) {
            this.mCamera2Device.setEnableEIS(false);
            this.mCamera2Device.setEnableOIS(true);
            this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
        }
    }

    public void onSingleTapUp(int x, int y) {
        if (!this.mPaused && !this.mSnapshotInProgress && (isInTapableRect(x, y) ^ 1) == 0) {
            if (!isSessionReady()) {
                Log.w(TAG, "onSingleTapUp: null session");
            } else if (isFrameAvailable() && !((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(x, y)) {
                this.mMainProtocol.setFocusViewType(true);
                this.mTouchFocusStartingTime = System.currentTimeMillis();
                Point point = new Point(x, y);
                mapTapCoordinate(point);
                this.mFocusManager.onSingleTapUp(point.x, point.y);
            }
        }
    }

    public boolean isNeedMute() {
        return !super.isNeedMute() ? this.mMediaRecorderRecording : true;
    }

    private void releaseResources() {
        closeCamera();
        releaseMediaRecorder();
        releaseLastMediaRecorder();
    }

    public void consumePreference(@UpdateType int... updateTypes) {
        for (int type : updateTypes) {
            switch (type) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case 2:
                    updateFilter();
                    break;
                case 3:
                    updateFocusArea();
                    break;
                case 5:
                    updateFace();
                    break;
                case 9:
                    updateAntiBanding(CameraSettings.getAntiBanding());
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                case MotionEventCompat.AXIS_RUDDER /*20*/:
                case 30:
                case MotionEventCompat.AXIS_GENERIC_3 /*34*/:
                    break;
                case 12:
                    setEvValue();
                    break;
                case 14:
                    updateVideoFocusMode();
                    break;
                case 19:
                    updateFpsRange();
                    break;
                case MotionEventCompat.AXIS_DISTANCE /*24*/:
                    setZoomRatio(getZoomValue());
                    break;
                case MotionEventCompat.AXIS_TILT /*25*/:
                    focusCenter();
                    break;
                case 29:
                    updateExposureMeteringMode();
                    break;
                case 31:
                    updateVideoStabilization();
                    break;
                default:
                    if (!DEBUG) {
                        Log.w(TAG, "no consumer for this updateType: " + type);
                        break;
                    }
                    throw new RuntimeException("no consumer for this updateType: " + type);
            }
        }
    }

    private void updatePictureAndPreviewSize() {
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(16, 9));
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        Log.d(TAG, "previewSize: " + this.mPreviewSize);
    }

    private void updateFilter() {
        int effect = CameraSettings.getShaderEffect();
        Log.v(TAG, "updateFilter: 0x" + Integer.toHexString(effect));
        EffectController.getInstance().setEffect(effect);
    }

    private void updateFpsRange() {
        this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
    }

    public void onPreviewSessionSuccess(CameraCaptureSession session) {
        super.onPreviewSessionSuccess(session);
        if (isCreated()) {
            Log.d(TAG, "onPreviewSessionSuccess: " + session);
            this.mFaceDetectionEnabled = false;
            updatePreferenceInWorkThread(UpdateConstant.FUN_TYPES_ON_PREVIEW_SUCCESS);
            return;
        }
        Log.w(TAG, "onPreviewSessionSuccess: module is not ready");
    }
}
