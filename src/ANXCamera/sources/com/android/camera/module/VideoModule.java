package com.android.camera.module;

import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.utils.SurfaceUtils;
import android.location.Location;
import android.media.CamcorderProfile;
import android.media.CameraProfile;
import android.media.MediaCodec;
import android.media.MediaRecorder;
import android.media.MediaRecorder.OnErrorListener;
import android.media.MediaRecorder.OnInfoListener;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.support.annotation.MainThread;
import android.support.v4.view.MotionEventCompat;
import android.telephony.TelephonyManager;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import android.widget.Toast;
import com.android.camera.AutoLockManager;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.Exif;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.RotateTextToast;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.VideoRecordStateCallback;
import io.reactivex.Single;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class VideoModule extends VideoBase implements VideoRecordStateCallback, OnErrorListener, OnInfoListener, ObjectViewListener {
    private static final HashMap<String, Integer> HEVC_VIDEO_ENCODER_BITRATE = new HashMap();
    public static final long VIDEO_MIN_SINGLE_FILE_SIZE = Math.min(8388608, 52428800);
    private boolean mCaptureTimeLapse;
    private volatile int mCurrentFileNumber;
    private boolean mFovcEnabled;
    private int mHfrFPSLower;
    private int mHfrFPSUpper;
    private final Object mLock = new Object();
    private MediaRecorder mMediaRecorder;
    private String mNextVideoFileName;
    private ContentValues mNextVideoValues;
    private long mPauseClickTime = 0;
    private volatile boolean mPendingStopRecorder;
    private CamcorderProfile mProfile;
    private int mQuality = 5;
    private boolean mQuickCapture;
    private Surface mRecorderSurface;
    private String mRecordingTime;
    private boolean mRecordingTimeCountsDown;
    private boolean mSnapshotInProgress;
    private String mSpeed = "normal";
    private boolean mSplitWhenReachMaxSize;
    private CountDownLatch mStopRecorderDone;
    private int mTimeBetweenTimeLapseFrameCaptureMs = 0;
    private ModeProtocol$TopAlert mTopAlert;
    private long mVideoRecordTime = 0;
    private long mVideoRecordedDuration;

    private final class JpegPictureCallback implements PictureCallback {
        Location mLocation;

        public JpegPictureCallback(Location loc) {
            this.mLocation = loc;
        }

        public void onPictureTaken(byte[] jpegData, Camera2Proxy camera) {
            Log.v(VideoModule.TAG, "onPictureTaken");
            VideoModule.this.mSnapshotInProgress = false;
            if (!VideoModule.this.mPaused) {
                storeImage(jpegData, this.mLocation);
            }
        }

        public void onPictureTakenFailed() {
        }

        public void onPictureBurstFinished(boolean success) {
        }

        private void storeImage(byte[] data, Location loc) {
            long dateTaken = System.currentTimeMillis();
            int orientation = Exif.getOrientation(data);
            VideoModule.this.mActivity.getImageSaver().addImage(data, VideoModule.this.needImageThumbnail(12), Util.createJpegName(dateTaken), System.currentTimeMillis(), null, loc, VideoModule.this.mPictureSize.width, VideoModule.this.mPictureSize.height, null, orientation, false, false, true, false);
        }
    }

    static {
        HEVC_VIDEO_ENCODER_BITRATE.put("3840x2160:30", Integer.valueOf(38500000));
        HEVC_VIDEO_ENCODER_BITRATE.put("1920x1080:30", Integer.valueOf(15400000));
        HEVC_VIDEO_ENCODER_BITRATE.put("1280x720:30", Integer.valueOf(10780000));
        HEVC_VIDEO_ENCODER_BITRATE.put("720x480:30", Integer.valueOf(1379840));
    }

    public VideoModule() {
        super(VideoModule.class.getSimpleName());
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        Log.v(TAG, "onPreviewLayoutChanged: " + rect);
        this.mActivity.onLayoutChange(rect);
        if (this.mFocusManager != null && this.mActivity.getCameraScreenNail() != null) {
            this.mActivity.getCameraScreenNail().setRenderArea(rect);
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public List<String> getSupportedSettingKeys() {
        List<String> keys = new ArrayList();
        if (isBackCamera()) {
            keys.add("pref_video_speed_fast_key");
            if (Device.isSupportedHFR()) {
                keys.add("pref_video_speed_slow_key");
            }
        }
        return keys;
    }

    public void onCreate(int moduleIndex, int cameraId) {
        super.onCreate(moduleIndex, cameraId);
        changeConflictPreference();
        setCaptureIntent(this.mActivity.getCameraIntentManager().isVideoCaptureIntent());
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mQuickCapture = this.mActivity.getCameraIntentManager().isQuickCapture().booleanValue();
        this.mMainProtocol.setObjectViewListener(this);
        enableCameraControls(false);
        this.mTelephonyManager = (TelephonyManager) this.mActivity.getSystemService("phone");
        this.mVideoFocusMode = "continuous-video";
        initRecorderSurface();
        onCameraOpened();
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        readVideoPreferences();
        initializeFocusManager();
        setPreviewFrameLayoutAspectRatio();
        updatePreferenceTrampoline(UpdateConstant.VIDEO_TYPES_INIT);
        if (!initializeRecorder()) {
            startPreviewSession();
        } else if (isHFRMode() || isSlowMode()) {
            startHighSpeedRecordSession();
        } else {
            startRecordSession();
        }
    }

    private void initRecorderSurface() {
        this.mRecorderSurface = MediaCodec.createPersistentInputSurface();
    }

    private void releaseRecorderSurface() {
        if (this.mRecorderSurface != null) {
            this.mRecorderSurface.release();
        }
    }

    public boolean onBackPressed() {
        if (!isCreated()) {
            return false;
        }
        if (this.mPaused) {
            return true;
        }
        if (this.mStereoSwitchThread != null) {
            return false;
        }
        if (this.mMediaRecorderRecording) {
            long now = System.currentTimeMillis();
            if (now - this.mLastBackPressedTime > 3000) {
                this.mLastBackPressedTime = now;
                Toast.makeText(this.mActivity, getString(R.string.record_back_pressed_hint), 0).show();
            } else {
                stopVideoRecording(true, false);
            }
            return true;
        } else if (CameraSettings.isStereoModeOn()) {
            return true;
        } else {
            return super.onBackPressed();
        }
    }

    public void onShutterButtonFocus(boolean pressed, int from) {
    }

    public void onShutterButtonClick(int mode) {
        Log.v(TAG, "onShutterButtonClick isRecording=" + this.mMediaRecorderRecording + " inStartingFocusRecording=" + this.mInStartingFocusRecording);
        this.mInStartingFocusRecording = false;
        if (isIgnoreTouchEvent()) {
            Log.w(TAG, "onShutterButtonClick: ignore touch event");
            return;
        }
        if (this.mMediaRecorderRecording) {
            stopVideoRecording(true, false);
        } else if (checkCallingState()) {
            this.mActivity.getScreenHint().updateHint();
            if (Storage.isLowStorageAtLastPoint()) {
                ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
                return;
            }
            setTriggerMode(mode);
            enableCameraControls(false);
            playCameraSound(2);
            this.mTopAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (this.mFocusManager.canRecord()) {
                startVideoRecording();
            } else {
                Log.v(TAG, "wait for autoFocus");
                this.mInStartingFocusRecording = true;
            }
        } else {
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
        }
    }

    private void startPreviewAfterRecord() {
        if (isDeviceAlive() && !isCaptureIntent()) {
            if (isHFRMode() || isSlowMode()) {
                this.mCamera2Device.startHighSpeedRecordPreview();
            } else {
                this.mCamera2Device.startRecordPreview();
            }
        }
    }

    public void onSharedPreferenceChanged() {
        if (!this.mPaused && this.mCamera2Device != null) {
            int lastWidth = this.mProfile.videoFrameWidth;
            int lastHeight = this.mProfile.videoFrameHeight;
            readVideoPreferences();
            if (!(this.mProfile.videoFrameWidth == lastWidth && this.mProfile.videoFrameHeight == lastHeight)) {
                Log.d(TAG, String.format(Locale.ENGLISH, "profile size changed [%d %d]->[%d %d]", new Object[]{Integer.valueOf(lastWidth), Integer.valueOf(lastHeight), Integer.valueOf(this.mProfile.videoFrameWidth), Integer.valueOf(this.mProfile.videoFrameHeight)}));
                updatePreferenceTrampoline(1);
            }
        }
    }

    protected void readVideoPreferences() {
        int quality = CameraSettings.getVideoQuality();
        try {
            if (getActivity().getCameraIntentManager().getVideoQuality() > 0) {
                quality = 1;
            } else {
                quality = 0;
            }
        } catch (RuntimeException e) {
        }
        this.mSpeed = DataRepository.dataItemRunning().getVideoSpeed();
        this.mTimeBetweenTimeLapseFrameCaptureMs = 0;
        this.mCaptureTimeLapse = false;
        if ("fast".equals(this.mSpeed)) {
            this.mTimeBetweenTimeLapseFrameCaptureMs = Integer.parseInt(DataRepository.dataItemGlobal().getString("pref_video_time_lapse_frame_interval_key", getString(R.string.pref_video_time_lapse_frame_interval_default)));
            this.mCaptureTimeLapse = this.mTimeBetweenTimeLapseFrameCaptureMs != 0;
            if (this.mCaptureTimeLapse) {
                quality += 1000;
                if (quality < 1000 || quality > 1008) {
                    quality -= 1000;
                    this.mCaptureTimeLapse = false;
                    forceToNormalMode();
                    RotateTextToast.getInstance(this.mActivity).show(R.string.time_lapse_error, this.mOrientation);
                }
            }
            this.mQuality = quality % 1000;
        } else if (isHFRMode() || isSlowMode()) {
            String hfrSetting = getHfrSetting();
            String[] splitValues = hfrSetting.split(":");
            if (isSlowMode()) {
                this.mQuality = convertSizeToQuality(splitValues[0]);
            } else {
                quality = Math.max(Math.min(quality, 6), 5);
                this.mQuality = quality;
            }
            if (this.mQuality == -1) {
                Log.e(TAG, "invalid hfr setting: " + hfrSetting);
                forceToNormalMode();
                this.mQuality = quality;
            } else {
                Size size;
                quality = this.mQuality;
                if (6 == quality) {
                    size = new Size(1920, 1080);
                } else {
                    size = new Size(1280, 720);
                }
                int upperFps = Util.parseInt(splitValues[1], 120);
                if (isHFRMode()) {
                    List<Integer> fpsList = this.mCameraCapabilities.getSupportedHFRVideoFPSList(size);
                    if (fpsList.contains(Integer.valueOf(120))) {
                        upperFps = 120;
                    } else {
                        upperFps = ((Integer) fpsList.get(0)).intValue();
                    }
                }
                updateHfrFPSRange(size, upperFps);
            }
        } else {
            this.mQuality = quality;
        }
        if (!(this.mProfile == null || this.mProfile.quality % 1000 == this.mQuality)) {
            stopObjectTracking(false);
        }
        this.mProfile = fetchProfile(this.mBogusCameraId, quality);
        this.mProfile.videoCodec = CameraSettings.getVideoEncoder();
        this.mOutputFormat = this.mProfile.fileFormat;
        Log.d(TAG, String.format(Locale.ENGLISH, "frameRate=%d profileSize=%dx%d codec=%d", new Object[]{Integer.valueOf(this.mProfile.videoFrameRate), Integer.valueOf(this.mProfile.videoFrameWidth), Integer.valueOf(this.mProfile.videoFrameHeight), Integer.valueOf(this.mProfile.videoCodec)}));
        try {
            this.mMaxVideoDurationInMs = this.mActivity.getCameraIntentManager().getVideoDurationTime() * 1000;
        } catch (RuntimeException e2) {
            if (!CameraSettings.is4KHigherVideoQuality(this.mQuality) || (this.mCaptureTimeLapse ^ 1) == 0) {
                this.mMaxVideoDurationInMs = 0;
            } else {
                this.mMaxVideoDurationInMs = 480000;
            }
        }
        if (this.mMaxVideoDurationInMs != 0 && this.mMaxVideoDurationInMs < 1000) {
            this.mMaxVideoDurationInMs = 1000;
        }
    }

    private String getHfrSetting() {
        String hfrSetting = CameraSettings.getHfrSetting();
        ArrayList<String> supportedHfr = CameraSettings.getSupportedHfrSettings(this.mBogusCameraId);
        if (supportedHfr == null || (supportedHfr.contains(hfrSetting) ^ 1) == 0) {
            return hfrSetting;
        }
        return (String) supportedHfr.get(0);
    }

    private void updateHfrFPSRange(Size size, int upperFps) {
        Range candidateRange = null;
        for (Range<Integer> range : this.mCameraCapabilities.getSupportedHighSpeedVideoFPSRange(size)) {
            if (((Integer) range.getUpper()).intValue() == upperFps && (candidateRange == null || ((Integer) candidateRange.getLower()).intValue() < ((Integer) range.getLower()).intValue())) {
                candidateRange = range;
            }
        }
        this.mHfrFPSLower = ((Integer) candidateRange.getLower()).intValue();
        this.mHfrFPSUpper = ((Integer) candidateRange.getUpper()).intValue();
    }

    private void forceToNormalMode() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString("pref_video_speed_key", "normal");
        editor.apply();
        this.mSpeed = "normal";
    }

    private boolean isSlowMode() {
        return "slow".equals(this.mSpeed);
    }

    private boolean isHFRMode() {
        return "hfr".equals(this.mSpeed);
    }

    private boolean isNormalMode() {
        return "normal".equals(this.mSpeed);
    }

    private int convertSizeToQuality(String size) {
        if (size.equals("1920x1080")) {
            return 6;
        }
        if (size.equals("1280x720")) {
            return 5;
        }
        Log.e(TAG, "unexpected hfr video size " + size);
        return -1;
    }

    protected CamcorderProfile fetchProfile(int cameraId, int quality) {
        return CamcorderProfile.get(cameraId, quality);
    }

    protected void resizeForPreviewAspectRatio() {
        if (((this.mCameraCapabilities.getSensorOrientation() - Util.getDisplayRotation(this.mActivity)) + 360) % 180 == 0) {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mVideoSize.height) / ((float) this.mVideoSize.width));
        } else {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mVideoSize.width) / ((float) this.mVideoSize.height));
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mFovcEnabled && this.mCamera2Device != null) {
            this.mCamera2Device.notifyVideoStreamEnd();
        }
        waitStereoSwitchThread();
        unregisterReceiver();
        stopObjectTracking(false);
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
        this.mHandler.removeCallbacksAndMessages(null);
    }

    public void onDestroy() {
        super.onDestroy();
        releaseRecorderSurface();
        this.mHandler.sendEmptyMessage(45);
    }

    private void startRecordSession() {
        boolean z = false;
        Log.d(TAG, "startRecordSession: mode=" + this.mSpeed);
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.setVideoSnapshotSize(this.mPictureSize);
            int operatingMode = 61456;
            if (this.mQuality == 0) {
                operatingMode = 0;
            } else if (isEisOn()) {
                operatingMode = 32772;
            }
            if (CameraSettings.isFovcEnabled()) {
                if (operatingMode != 0) {
                    z = true;
                }
                this.mFovcEnabled = z;
            }
            this.mCamera2Device.startRecordSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), this.mRecorderSurface, true, operatingMode, this);
            this.mFocusManager.resetFocused();
            this.mPreviewing = true;
        }
    }

    private void startHighSpeedRecordSession() {
        Log.d(TAG, "startHighSpeedRecordSession");
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.startHighSpeedRecordSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), this.mRecorderSurface, new Range(Integer.valueOf(this.mHfrFPSLower), Integer.valueOf(this.mHfrFPSUpper)), this);
            this.mFocusManager.resetFocused();
            showSurfaceInfo(this.mRecorderSurface);
        }
    }

    private void startPreviewSession() {
        Log.d(TAG, "startPreviewSession");
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), false, false, 0, this);
        }
    }

    public void startPreview() {
        Log.v(TAG, "startPreview: previewing=" + this.mPreviewing);
        checkDisplayOrientation();
        this.mPreviewing = true;
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mPreviewing = false;
        if (currentIsMainThread()) {
            stopObjectTracking(false);
        }
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
            updateMutexModePreference();
            this.mHandler.removeMessages(22);
            this.mHandler.sendEmptyMessageDelayed(22, 100);
            enableCameraControls(true);
            onShutterButtonFocus(true, 3);
            startVideoRecordingIfNeeded();
        }
    }

    private void startVideoRecordingIfNeeded() {
        if (CameraIntentManager.checkCallerLegality(this.mActivity)) {
            if (this.mActivity.getCameraIntentManager().isOpenOnly()) {
                this.mActivity.getIntent().removeExtra("android.intent.extra.TIMER_DURATION_SECONDS");
            } else {
                this.mActivity.getIntent().removeExtra("android.intent.extra.CAMERA_OPEN_ONLY");
                int durationTime = this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
                if (durationTime > 60) {
                    Log.e(TAG, "Caller delivered a wrong duration time large as 60s!");
                    return;
                }
                int i;
                Handler handler = this.mHandler;
                Runnable anonymousClass1 = new Runnable() {
                    public void run() {
                        VideoModule.this.onShutterButtonClick(VideoModule.this.getTriggerMode());
                    }
                };
                if (durationTime == -1) {
                    i = 1500;
                } else {
                    i = durationTime * 1000;
                }
                handler.postDelayed(anonymousClass1, (long) i);
            }
        }
    }

    private boolean initializeRecorder() {
        Log.d(TAG, "initializeRecorder>>");
        long start = System.currentTimeMillis();
        if (getActivity() == null) {
            Log.w(TAG, "initializeRecorder: null host");
            return false;
        }
        closeVideoFileDescriptor();
        cleanupEmptyFile();
        if (isCaptureIntent()) {
            parseIntent(this.mActivity.getIntent());
        }
        if (this.mVideoFileDescriptor == null) {
            this.mCurrentVideoValues = genContentValues(this.mOutputFormat, this.mCurrentFileNumber);
            this.mCurrentVideoFilename = this.mCurrentVideoValues.getAsString("_data");
        }
        if (this.mStopRecorderDone != null) {
            long waitStart = System.currentTimeMillis();
            try {
                this.mStopRecorderDone.await(1000, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Log.d(TAG, "initializeRecorder: waitTime=" + (System.currentTimeMillis() - waitStart));
        }
        long t1 = System.currentTimeMillis();
        boolean success = true;
        synchronized (this.mLock) {
            if (this.mMediaRecorder == null) {
                this.mMediaRecorder = new MediaRecorder();
            } else {
                this.mMediaRecorder.reset();
                if (DEBUG) {
                    Log.v(TAG, "initializeRecorder: t1=" + (System.currentTimeMillis() - t1));
                }
            }
        }
        setupRecorder(this.mMediaRecorder);
        this.mMediaRecorder.setInputSurface(this.mRecorderSurface);
        try {
            t1 = System.currentTimeMillis();
            this.mMediaRecorder.prepare();
            this.mMediaRecorder.setOnErrorListener(this);
            this.mMediaRecorder.setOnInfoListener(this);
            if (DEBUG) {
                Log.v(TAG, "initializeRecorder: t2=" + (System.currentTimeMillis() - t1));
            }
        } catch (IOException e2) {
            Log.e(TAG, "prepare failed for " + this.mCurrentVideoFilename, e2);
            success = false;
            releaseMediaRecorder();
        }
        if (DEBUG) {
            showSurfaceInfo(this.mRecorderSurface);
        }
        Log.d(TAG, "initializeRecorder<<time=" + (System.currentTimeMillis() - start));
        return success;
    }

    private void showSurfaceInfo(Surface surface) {
        boolean isValid = surface.isValid();
        boolean isForHwVideoEncoder = SurfaceUtils.isSurfaceForHwVideoEncoder(surface);
        Size size = SurfaceUtils.getSurfaceSize(surface);
        Log.d(TAG, "showSurfaceInfo: " + surface + "|" + isValid + "|" + size + "|" + SurfaceUtils.getSurfaceFormat(surface) + "|" + isForHwVideoEncoder);
    }

    private void setupRecorder(MediaRecorder mediaRecorder) {
        int bitrate;
        boolean isNormal = isNormalMode();
        boolean isHFR = isHFRMode();
        boolean recordAudio = !isNormal ? isHFR : true;
        mediaRecorder.setVideoSource(2);
        if (recordAudio) {
            mediaRecorder.setAudioSource(5);
        }
        mediaRecorder.setOutputFormat(this.mProfile.fileFormat);
        mediaRecorder.setVideoEncoder(this.mProfile.videoCodec);
        mediaRecorder.setVideoSize(this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
        mediaRecorder.setVideoFrameRate(this.mProfile.videoFrameRate);
        if (5 == this.mProfile.videoCodec) {
            bitrate = getHevcVideoEncoderBitRate(this.mProfile);
            Log.d(TAG, "H265 bitrate: " + bitrate);
        } else {
            bitrate = this.mProfile.videoBitRate;
            Log.d(TAG, "H264 bitrate: " + bitrate);
        }
        mediaRecorder.setVideoEncodingBitRate(bitrate);
        if (recordAudio) {
            mediaRecorder.setAudioEncodingBitRate(this.mProfile.audioBitRate);
            mediaRecorder.setAudioChannels(this.mProfile.audioChannels);
            mediaRecorder.setAudioSamplingRate(this.mProfile.audioSampleRate);
            mediaRecorder.setAudioEncoder(this.mProfile.audioCodec);
        }
        if (this.mCaptureTimeLapse) {
            mediaRecorder.setCaptureRate(1000.0d / ((double) this.mTimeBetweenTimeLapseFrameCaptureMs));
        } else if (!isNormal) {
            if (isHFR) {
                mediaRecorder.setVideoFrameRate(this.mHfrFPSUpper);
                mediaRecorder.setVideoEncodingBitRate((int) ((((long) bitrate) * ((long) this.mHfrFPSUpper)) / 30));
            }
            mediaRecorder.setCaptureRate((double) this.mHfrFPSUpper);
        }
        mediaRecorder.setMaxDuration(this.mMaxVideoDurationInMs);
        Location loc = LocationManager.instance().getCurrentLocation();
        if (loc != null) {
            mediaRecorder.setLocation((float) loc.getLatitude(), (float) loc.getLongitude());
        }
        if (this.mVideoFileDescriptor != null) {
            mediaRecorder.setOutputFile(this.mVideoFileDescriptor.getFileDescriptor());
        } else {
            mediaRecorder.setOutputFile(this.mCurrentVideoFilename);
        }
        int debugSize = SystemProperties.getInt("camera.debug.video_max_size", 0);
        long maxFileSize = getRecorderMaxFileSize(debugSize);
        if (maxFileSize > 0) {
            Log.v(TAG, "maxFileSize=" + maxFileSize);
            mediaRecorder.setMaxFileSize(maxFileSize);
        }
        if (debugSize > 0 || maxFileSize == 3670016000L) {
            setSplitWhenReachMaxSize(true);
        } else {
            setSplitWhenReachMaxSize(false);
        }
        mediaRecorder.setOrientationHint(getRecorderOrientationHint());
        this.mOrientationCompensationAtRecordStart = this.mOrientationCompensation;
    }

    private int getHevcVideoEncoderBitRate(CamcorderProfile profile) {
        String key = profile.videoFrameWidth + "x" + profile.videoFrameHeight + ":" + profile.videoFrameRate;
        if (HEVC_VIDEO_ENCODER_BITRATE.containsKey(key)) {
            return ((Integer) HEVC_VIDEO_ENCODER_BITRATE.get(key)).intValue();
        }
        Log.d(TAG, "no pre-defined bitrate for " + key);
        return profile.videoBitRate;
    }

    private long getRecorderMaxFileSize(int debugSize) {
        long maxFileSize = Storage.getLeftSpace() - 52428800;
        if (debugSize > 0 && ((long) debugSize) < maxFileSize) {
            maxFileSize = (long) debugSize;
        }
        if (maxFileSize > 3670016000L) {
            maxFileSize = 3670016000L;
        } else if (maxFileSize < VIDEO_MIN_SINGLE_FILE_SIZE) {
            maxFileSize = VIDEO_MIN_SINGLE_FILE_SIZE;
        }
        if (this.mIntentRequestSize <= 0 || this.mIntentRequestSize >= maxFileSize) {
            return maxFileSize;
        }
        return this.mIntentRequestSize;
    }

    private void setSplitWhenReachMaxSize(boolean split) {
        this.mSplitWhenReachMaxSize = split;
    }

    private boolean isSplitWhenReachMaxSize() {
        return this.mSplitWhenReachMaxSize;
    }

    private int getRecorderOrientationHint() {
        int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
        if (this.mOrientation == -1) {
            return sensorOrientation;
        }
        if (isFrontCamera()) {
            return ((sensorOrientation - this.mOrientation) + 360) % 360;
        }
        return (this.mOrientation + sensorOrientation) % 360;
    }

    private void releaseMediaRecorder() {
        MediaRecorder recorder;
        Log.v(TAG, "releaseRecorder");
        synchronized (this.mLock) {
            recorder = this.mMediaRecorder;
            this.mMediaRecorder = null;
        }
        if (recorder != null) {
            cleanupEmptyFile();
            long start = System.currentTimeMillis();
            recorder.reset();
            Log.v(TAG, "releaseRecorder: t1=" + (System.currentTimeMillis() - start));
            start = System.currentTimeMillis();
            recorder.release();
            Log.v(TAG, "releaseRecorder: t2=" + (System.currentTimeMillis() - start));
        }
    }

    public void onError(MediaRecorder mr, int what, int extra) {
        Log.e(TAG, "MediaRecorder error. what=" + what + " extra=" + extra);
        if (what == 1) {
            if (this.mMediaRecorderRecording) {
                stopVideoRecording(true, false);
            }
            this.mActivity.getScreenHint().updateHint();
        }
    }

    public void onInfo(MediaRecorder mr, int what, int extra) {
        if (this.mMediaRecorderRecording) {
            if (what == 800) {
                stopVideoRecording(true, false);
            } else if (what == 801) {
                Log.w(TAG, "reached max size. fileNumber=" + this.mCurrentFileNumber);
                stopVideoRecording(true, false);
                if (!this.mActivity.getScreenHint().isScreenHintVisible()) {
                    Toast.makeText(this.mActivity, R.string.video_reach_size_limit, 1).show();
                }
            } else if (what == 802) {
                boolean split = isSplitWhenReachMaxSize();
                Log.d(TAG, "max file size is approaching. split: " + split);
                if (split) {
                    this.mCurrentFileNumber++;
                    ContentValues nextVideoValues = genContentValues(this.mOutputFormat, this.mCurrentFileNumber);
                    String nextVideoPath = nextVideoValues.getAsString("_data");
                    Log.d(TAG, "nextVideoPath: " + nextVideoPath);
                    if (CompatibilityUtils.setNextOutputFile(this.mMediaRecorder, nextVideoPath)) {
                        this.mNextVideoValues = nextVideoValues;
                        this.mNextVideoFileName = nextVideoPath;
                    }
                }
            } else if (what == 803) {
                Log.d(TAG, "next output file started");
                onMaxFileSizeReached();
                this.mCurrentVideoValues = this.mNextVideoValues;
                this.mCurrentVideoFilename = this.mNextVideoFileName;
                this.mNextVideoValues = null;
                this.mNextVideoFileName = null;
            }
            return;
        }
        Log.w(TAG, "onInfo: ignore event " + what);
    }

    private void onMaxFileSizeReached() {
        if (this.mCurrentVideoFilename != null) {
            saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, false, false);
            this.mCurrentVideoValues = null;
            this.mCurrentVideoFilename = null;
        }
    }

    private Uri saveVideo(String videoPath, ContentValues values, boolean isFinal, boolean sync) {
        if (this.mActivity != null) {
            Log.w(TAG, "saveVideo: path=" + videoPath + " isFinal=" + isFinal);
            if (sync) {
                return this.mActivity.getImageSaver().addVideoSync(videoPath, values, false);
            }
            this.mActivity.getImageSaver().addVideo(videoPath, values, isFinal);
            return null;
        }
        Log.w(TAG, "saveVideo: failed to save " + videoPath);
        return null;
    }

    protected void startVideoRecording() {
        Log.v(TAG, "startVideoRecording: mode=" + this.mSpeed);
        if (isDeviceAlive()) {
            ScenarioTrackUtil.trackStartVideoRecordStart(this.mSpeed, isFrontCamera());
            this.mCurrentFileNumber = isCaptureIntent() ? -1 : 0;
            silenceSounds();
            if (startRecorder()) {
                ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
                updatePreferenceTrampoline(UpdateConstant.VIDEO_TYPES_RECORD);
                if (isHFRMode() || isSlowMode()) {
                    this.mCamera2Device.startHighSpeedRecording();
                } else {
                    this.mCamera2Device.startRecording();
                }
                Log.v(TAG, "startVideoRecording process done");
                ScenarioTrackUtil.trackStartVideoRecordEnd();
                onStartRecorderSucceed();
                return;
            }
            onStartRecorderFail();
        }
    }

    private boolean startRecorder() {
        if (!initializeRecorder()) {
            return false;
        }
        try {
            this.mMediaRecorder.start();
            return true;
        } catch (IllegalStateException e) {
            Log.e(TAG, "could not start recorder", e);
            if (e instanceof IllegalStateException) {
                showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_recorder_busy_alert);
            }
            return false;
        }
    }

    private void onStartRecorderFail() {
        enableCameraControls(true);
        releaseMediaRecorder();
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
    }

    private void onStartRecorderSucceed() {
        enableCameraControls(true);
        this.mActivity.sendBroadcast(new Intent("com.android.camera.action.start_video_recording"));
        this.mMediaRecorderRecording = true;
        this.mMediaRecorderRecordingPaused = false;
        this.mRecordingStartTime = SystemClock.uptimeMillis();
        this.mPauseClickTime = SystemClock.uptimeMillis();
        this.mRecordingTime = "";
        this.mTelephonyManager.listen(this.mPhoneStateListener, 32);
        Log.v(TAG, "listen call state");
        updateRecordingTime();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
        trackGeneralInfo(1, false);
        if (this.mCamera2Device != null) {
            CameraStatUtil.trackVideoRecording(isFrontCamera(), this.mSpeed, this.mQuality, this.mCamera2Device.getFlashMode(), this.mTimeBetweenTimeLapseFrameCaptureMs);
        }
    }

    public void stopVideoRecording(boolean stopRecorder, boolean fromRelease) {
        VideoRecordStateCallback videoRecordStateCallback = null;
        Log.v(TAG, "stopVideoRecording>>" + this.mMediaRecorderRecording + "|" + stopRecorder);
        if (this.mMediaRecorderRecording) {
            long start = System.currentTimeMillis();
            this.mMediaRecorderRecording = false;
            enableCameraControls(false);
            if (this.mCamera2Device != null) {
                Camera2Proxy camera2Proxy = this.mCamera2Device;
                if (!stopRecorder) {
                    Object videoRecordStateCallback2 = this;
                }
                camera2Proxy.stopRecording(videoRecordStateCallback2);
            }
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFinish();
            if (isHFRMode()) {
                CameraStatUtil.trackVideoModeRecorded(this.mSpeed, this.mQuality, this.mHfrFPSUpper, this.mVideoRecordTime);
            }
            this.mVideoRecordTime = 0;
            if (stopRecorder) {
                stopRecorder();
                startPreviewAfterRecord();
            } else {
                this.mPendingStopRecorder = true;
                this.mHandler.sendEmptyMessageDelayed(46, 300);
            }
            AutoLockManager.getInstance(this.mActivity).hibernateDelayed();
            Log.v(TAG, "stopVideoRecording<<time=" + (System.currentTimeMillis() - start));
        }
    }

    protected void onWaitStopCallbackTimeout() {
        stopRecorder();
        startPreviewAfterRecord();
    }

    private void stopRecorder() {
        this.mPendingStopRecorder = false;
        this.mHandler.removeMessages(46);
        Single.create(new SingleOnSubscribe<Boolean>() {
            public void subscribe(SingleEmitter<Boolean> emitter) throws Exception {
                VideoModule.this.mStopRecorderDone = new CountDownLatch(1);
                long start = System.currentTimeMillis();
                ScenarioTrackUtil.trackStopVideoRecordStart(VideoModule.this.mSpeed, VideoModule.this.isFrontCamera());
                try {
                    VideoModule.this.mMediaRecorder.setOnErrorListener(null);
                    VideoModule.this.mMediaRecorder.setOnInfoListener(null);
                    VideoModule.this.mMediaRecorder.stop();
                } catch (RuntimeException e) {
                    Log.e(VideoModule.TAG, "failed to stop media recorder", e);
                    if (VideoModule.this.mCurrentVideoFilename != null) {
                        VideoModule.this.deleteVideoFile(VideoModule.this.mCurrentVideoFilename);
                        VideoModule.this.mCurrentVideoFilename = null;
                    }
                }
                if (!VideoModule.this.mPaused) {
                    VideoModule.this.playCameraSound(3);
                }
                VideoModule.this.releaseMediaRecorder();
                VideoModule.this.mStopRecorderDone.countDown();
                Log.d(VideoModule.TAG, "releaseTime=" + (System.currentTimeMillis() - start));
                emitter.onSuccess(Boolean.TRUE);
            }
        }).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Boolean>() {
            public void accept(Boolean aBoolean) throws Exception {
                VideoModule.this.onMediaRecorderReleased();
            }
        });
    }

    private void onMediaRecorderReleased() {
        Log.d(TAG, "onMediaRecorderReleased>>");
        long start = System.currentTimeMillis();
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        if (isCaptureIntent() && (this.mPaused ^ 1) != 0) {
            if (this.mCurrentVideoUri == null && this.mCurrentVideoFilename != null) {
                this.mCurrentVideoUri = saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, true, true);
                Log.d(TAG, "onMediaRecorderReleased: outputUri=" + this.mCurrentVideoUri);
            }
            boolean succeed = this.mCurrentVideoUri != null;
            if (this.mQuickCapture) {
                doReturnToCaller(succeed);
            } else if (succeed) {
                showAlert();
            }
        }
        if (this.mCurrentVideoFilename != null) {
            if (!isCaptureIntent()) {
                saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, true, false);
            }
            this.mCurrentVideoFilename = null;
            this.mCurrentVideoValues = null;
        } else if (!this.mPaused) {
            this.mActivity.getThumbnailUpdater().getLastThumbnail();
        }
        this.mActivity.sendBroadcast(new Intent("com.android.camera.action.stop_video_recording"));
        this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
        Log.v(TAG, "listen none");
        enableCameraControls(true);
        if (!"continuous-video".equals(this.mVideoFocusMode)) {
            this.mFocusManager.resetFocusStateIfNeeded();
            if (!this.mPaused) {
                this.mMainProtocol.clearFocusView(2);
                setVideoFocusMode("continuous-video");
                if (this.mCamera2Device != null && this.mCamera2Device.isSessionReady()) {
                    this.mCamera2Device.resumePreview();
                }
            }
        }
        keepScreenOnAwhile();
        Log.d(TAG, "onMediaRecorderReleased<<time=" + (System.currentTimeMillis() - start));
        ScenarioTrackUtil.trackStopVideoRecordEnd();
        doLaterReleaseIfNeed();
    }

    protected void updateRecordingTime() {
        if (this.mMediaRecorderRecording) {
            String text;
            long delta = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            if (this.mMediaRecorderRecordingPaused) {
                delta = this.mVideoRecordedDuration;
            }
            boolean countdownRemainingTime = this.mMaxVideoDurationInMs != 0 && delta >= ((long) (this.mMaxVideoDurationInMs - 60000));
            long deltaAdjusted = delta;
            if (countdownRemainingTime) {
                deltaAdjusted = Math.max(0, ((long) this.mMaxVideoDurationInMs) - deltaAdjusted) + 999;
            }
            long targetNextUpdateDelay = 1000;
            if (isNormalMode() || isHFRMode()) {
                this.mVideoRecordTime = deltaAdjusted / 1000;
                text = VideoBase.millisecondToTimeString(deltaAdjusted, false);
            } else {
                double timeBetweenFrameMs = 0.0d;
                if ("fast".equals(this.mSpeed)) {
                    timeBetweenFrameMs = (double) this.mTimeBetweenTimeLapseFrameCaptureMs;
                    targetNextUpdateDelay = (long) timeBetweenFrameMs;
                } else if (isSlowMode() && isShowHFRDuration()) {
                    timeBetweenFrameMs = 1000.0d / ((double) this.mHfrFPSUpper);
                    targetNextUpdateDelay = (long) (30000 / this.mHfrFPSUpper);
                }
                if (timeBetweenFrameMs != 0.0d) {
                    text = VideoBase.millisecondToTimeString(getSpeedRecordVideoLength(delta, timeBetweenFrameMs), "fast".equals(this.mSpeed));
                    if (text.equals(this.mRecordingTime)) {
                        targetNextUpdateDelay = (long) timeBetweenFrameMs;
                    }
                } else {
                    text = VideoBase.millisecondToTimeString(deltaAdjusted, false);
                }
            }
            if (this.mTopAlert != null) {
                this.mTopAlert.updateRecordingTime(text);
            }
            this.mRecordingTime = text;
            if (this.mRecordingTimeCountsDown != countdownRemainingTime) {
                this.mRecordingTimeCountsDown = countdownRemainingTime;
            }
            long actualNextUpdateDelay = 500;
            if (!this.mMediaRecorderRecordingPaused) {
                actualNextUpdateDelay = targetNextUpdateDelay - (delta % targetNextUpdateDelay);
            }
            this.mHandler.sendEmptyMessageDelayed(42, actualNextUpdateDelay);
        }
    }

    protected boolean isShowHFRDuration() {
        return true;
    }

    protected int getNormalVideoFrameRate() {
        if (isHFRMode() || (isSlowMode() ^ 1) == 0 || this.mProfile == null) {
            return 30;
        }
        return this.mProfile.videoFrameRate;
    }

    private long getSpeedRecordVideoLength(long deltaMs, double timeBetweenFrameMs) {
        if (timeBetweenFrameMs == 0.0d) {
            return 0;
        }
        return (long) (((((double) deltaMs) / timeBetweenFrameMs) / ((double) getNormalVideoFrameRate())) * 1000.0d);
    }

    private void updateVideoStabilization() {
        if (isDeviceAlive()) {
            if (isEisOn()) {
                Log.d(TAG, "videoStabilization: EIS");
                this.mCamera2Device.setEnableEIS(true);
                this.mCamera2Device.setEnableOIS(false);
                this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(true);
            } else {
                Log.d(TAG, "videoStabilization: OIS");
                this.mCamera2Device.setEnableEIS(false);
                this.mCamera2Device.setEnableOIS(true);
                this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
            }
        }
    }

    private boolean isEisOn() {
        if (this.mQuality == 0 || (CameraSettings.is4KHigherVideoQuality(this.mQuality) ^ 1) == 0 || !isBackCamera() || !CameraSettings.isMovieSolidOn()) {
            return false;
        }
        return isNormalMode();
    }

    private void setJpegQuality() {
        if (isDeviceAlive()) {
            int jpegQuality = CameraProfile.getJpegEncodingQualityParameter(this.mBogusCameraId, 2);
            Log.d(TAG, "jpegQuality=" + jpegQuality);
            this.mCamera2Device.setJpegQuality(jpegQuality);
        }
    }

    private void updateMutexModePreference() {
        if ("on".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex))) {
            this.mMutexModePicker.setMutexMode(2);
        }
    }

    public void onSingleTapUp(int x, int y) {
        if (!this.mPaused && !this.mSnapshotInProgress && (isInTapableRect(x, y) ^ 1) == 0) {
            if (!isSessionReady()) {
                Log.w(TAG, "onSingleTapUp: null session");
            } else if (isFrameAvailable() && !((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(x, y)) {
                if (this.mObjectTrackingStarted) {
                    stopObjectTracking(false);
                }
                this.mMainProtocol.setFocusViewType(true);
                this.mTouchFocusStartingTime = System.currentTimeMillis();
                Point point = new Point(x, y);
                mapTapCoordinate(point);
                this.mFocusManager.onSingleTapUp(point.x, point.y);
            }
        }
    }

    public boolean isNeedMute() {
        if (super.isNeedMute() || this.mObjectTrackingStarted) {
            return true;
        }
        return this.mMediaRecorderRecording ? this.mMediaRecorderRecordingPaused ^ 1 : false;
    }

    public boolean onGestureTrack(RectF rectF, boolean up) {
        if (this.mInStartingFocusRecording || !isBackCamera() || !Device.isSupportedObjectTrack() || (CameraSettings.is4KHigherVideoQuality(this.mQuality) ^ 1) == 0 || (isCaptureIntent() ^ 1) == 0) {
            return false;
        }
        return initializeObjectTrack(rectF, up);
    }

    private boolean initializeObjectTrack(RectF rectF, boolean up) {
        mapTapCoordinate(rectF);
        stopObjectTracking(false);
        return this.mMainProtocol.initializeObjectTrack(rectF, up);
    }

    /* JADX WARNING: Missing block: B:6:0x0010, code:
            return false;
     */
    public boolean takeVideoSnapShoot() {
        /*
        r7 = this;
        r6 = 1;
        r5 = 0;
        r3 = r7.mPaused;
        if (r3 != 0) goto L_0x0010;
    L_0x0006:
        r3 = r7.mSnapshotInProgress;
        if (r3 != 0) goto L_0x0010;
    L_0x000a:
        r3 = r7.mMediaRecorderRecording;
        r3 = r3 ^ 1;
        if (r3 == 0) goto L_0x0011;
    L_0x0010:
        return r5;
    L_0x0011:
        r3 = r7.isDeviceAlive();
        if (r3 != 0) goto L_0x0018;
    L_0x0017:
        return r5;
    L_0x0018:
        r3 = com.android.camera.storage.Storage.isLowStorageAtLastPoint();
        if (r3 == 0) goto L_0x002b;
    L_0x001e:
        r3 = TAG;
        r4 = "capture: low storage";
        com.android.camera.log.Log.w(r3, r4);
        r2 = 1;
        r7.stopVideoRecording(r2, r5);
        return r5;
    L_0x002b:
        r3 = r7.mActivity;
        r3 = r3.getImageSaver();
        r3 = r3.shouldStopShot();
        if (r3 == 0) goto L_0x004c;
    L_0x0037:
        r3 = TAG;
        r4 = "capture: ImageSaver is full";
        com.android.camera.log.Log.w(r3, r4);
        r3 = r7.mActivity;
        r3 = com.android.camera.ui.RotateTextToast.getInstance(r3);
        r4 = 2131689867; // 0x7f0f018b float:1.9008761E38 double:1.053194731E-314;
        r3.show(r4, r5);
        return r5;
    L_0x004c:
        r3 = r7.mBogusCameraId;
        r4 = r7.mOrientation;
        r0 = com.android.camera.Util.getJpegRotation(r3, r4);
        r3 = r7.mCamera2Device;
        r3.setJpegRotation(r0);
        r3 = com.android.camera.LocationManager.instance();
        r1 = r3.getCurrentLocation();
        r3 = r7.mCamera2Device;
        r3.setGpsLocation(r1);
        r7.setJpegQuality();
        r3 = com.android.camera.Device.isMDPRender();
        if (r3 == 0) goto L_0x008b;
    L_0x006f:
        r3 = TAG;
        r4 = "capture: start";
        com.android.camera.log.Log.v(r3, r4);
        r3 = r7.mCamera2Device;
        r4 = new com.android.camera.module.VideoModule$JpegPictureCallback;
        r4.<init>(r1);
        r3.captureVideoSnapshot(r4);
        r7.mSnapshotInProgress = r6;
        r3 = r7.isFrontCamera();
        com.android.camera.statistic.CameraStatUtil.trackVideoSnapshot(r3);
        return r6;
    L_0x008b:
        r3 = r7.mActivity;
        r3 = r3.getCameraScreenNail();
        r4 = r7.getCameraRotation();
        r3.animateCapture(r4);
        goto L_0x006f;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoModule.takeVideoSnapShoot():boolean");
    }

    public void startObjectTracking() {
        Log.d(TAG, "startObjectTracking: started=" + this.mObjectTrackingStarted);
    }

    public void onObjectStable() {
    }

    public void stopObjectTracking(boolean restartFD) {
        Log.d(TAG, "stopObjectTracking: started=" + this.mObjectTrackingStarted);
    }

    public void onPauseButtonClick() {
        Log.d(TAG, "onPauseButtonClick: isRecordingPaused=" + this.mMediaRecorderRecordingPaused + " isRecording=" + this.mMediaRecorderRecording);
        long now = System.currentTimeMillis();
        if (this.mMediaRecorderRecording && now - this.mPauseClickTime >= 500) {
            this.mPauseClickTime = now;
            ModeProtocol$ActionProcessing actionProcessing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
            if (this.mMediaRecorderRecordingPaused) {
                try {
                    if (VERSION.SDK_INT >= 24) {
                        CompatibilityUtils.resumeMediaRecorder(this.mMediaRecorder);
                    } else {
                        this.mMediaRecorder.start();
                    }
                    this.mRecordingStartTime = SystemClock.uptimeMillis() - this.mVideoRecordedDuration;
                    this.mVideoRecordedDuration = 0;
                    this.mMediaRecorderRecordingPaused = false;
                    this.mHandler.removeMessages(42);
                    this.mRecordingTime = "";
                    updateRecordingTime();
                    actionProcessing.processingResume();
                } catch (IllegalStateException e) {
                    Log.e(TAG, "failed to resume media recorder", e);
                    releaseMediaRecorder();
                    actionProcessing.processingFinish();
                }
            } else {
                pauseVideoRecording();
                CameraStatUtil.trackPauseVideoRecording(isFrontCamera());
                actionProcessing.processingPause();
            }
            Log.d(TAG, "onPauseButtonClick");
        }
    }

    private void pauseVideoRecording() {
        Log.d(TAG, "pauseVideoRecording");
        if (this.mMediaRecorderRecording && (this.mMediaRecorderRecordingPaused ^ 1) != 0) {
            try {
                pauseMediaRecorder(this.mMediaRecorder);
            } catch (IllegalStateException e) {
                Log.e(TAG, "failed to pause media recorder");
            }
            this.mVideoRecordedDuration = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            this.mMediaRecorderRecordingPaused = true;
            this.mHandler.removeMessages(42);
            updateRecordingTime();
        }
    }

    protected void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        CompatibilityUtils.pauseMediaRecorder(mediaRecorder);
    }

    private void releaseResources() {
        closeCamera();
        releaseMediaRecorder();
    }

    public void consumePreference(@UpdateType int... updateTypes) {
        for (int type : updateTypes) {
            switch (type) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case 3:
                    updateFocusArea();
                    break;
                case 5:
                    updateFace();
                    break;
                case 9:
                    String antiBanding;
                    if (Device.isSupportedHFR() && (isHFRMode() || isSlowMode())) {
                        antiBanding = "0";
                    } else {
                        antiBanding = CameraSettings.getAntiBanding();
                    }
                    updateAntiBanding(antiBanding);
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
                case MotionEventCompat.AXIS_GENERIC_2 /*33*/:
                    if (this.mCamera2Device == null) {
                        break;
                    }
                    this.mCamera2Device.setVideoSnapshotSize(this.mPictureSize);
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
        double videoAspectRatio = ((double) this.mProfile.videoFrameWidth) / ((double) this.mProfile.videoFrameHeight);
        CameraSize videoSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(MediaRecorder.class), videoAspectRatio, this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
        this.mVideoSize = videoSize;
        Log.d(TAG, "videoSize: " + videoSize.toString());
        int maxWidth = Integer.MAX_VALUE;
        int maxHeight = Integer.MAX_VALUE;
        if (Device.isVideoSnapshotSizeLimited()) {
            maxWidth = videoSize.width;
            maxHeight = videoSize.height;
        }
        CameraSize pictureSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256), videoAspectRatio, maxWidth, maxHeight);
        this.mPictureSize = pictureSize;
        Log.d(TAG, "pictureSize: " + pictureSize);
        if (videoSize.width > Util.sWindowHeight || videoSize.width < 720) {
            maxWidth = Util.sWindowHeight;
            maxHeight = Util.sWindowWidth;
        } else {
            maxWidth = videoSize.width;
            maxHeight = videoSize.height;
        }
        this.mPreviewSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), videoAspectRatio, maxWidth, maxHeight);
        Log.d(TAG, "previewSize: " + this.mPreviewSize);
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    protected boolean enableFaceDetection() {
        return (isHFRMode() || (isSlowMode() ^ 1) == 0) ? false : DataRepository.dataItemGlobal().getBoolean("pref_camera_facedetection_key", getResources().getBoolean(R.bool.pref_camera_facedetection_default));
    }

    private void updateFpsRange() {
        if (isDeviceAlive()) {
            if (isHFRMode() || isSlowMode()) {
                this.mCamera2Device.setVideoFpsRange(new Range(Integer.valueOf(this.mHfrFPSLower), Integer.valueOf(this.mHfrFPSUpper)));
            } else {
                Range<Integer>[] availableFpsRange = this.mCameraCapabilities.getSupportedFpsRange();
                Range<Integer> bestRange = availableFpsRange[0];
                for (Range<Integer> r : availableFpsRange) {
                    if (((Integer) bestRange.getUpper()).intValue() < ((Integer) r.getUpper()).intValue()) {
                        bestRange = r;
                    } else if (bestRange.getUpper() == r.getUpper() && ((Integer) bestRange.getLower()).intValue() < ((Integer) r.getLower()).intValue()) {
                        bestRange = r;
                    }
                }
                this.mCamera2Device.setVideoFpsRange(bestRange);
            }
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession session) {
        super.onPreviewSessionSuccess(session);
        if (isCreated()) {
            Log.d(TAG, "onPreviewSessionSuccess: session=" + session);
            this.mFaceDetectionEnabled = false;
            updatePreferenceInWorkThread(UpdateConstant.VIDEO_TYPES_ON_PREVIEW_SUCCESS);
            enableCameraControls(true);
            return;
        }
        Log.w(TAG, "onPreviewSessionSuccess: module is not ready");
        enableCameraControls(true);
    }

    public void onPreviewSessionFailed(CameraCaptureSession session) {
        super.onPreviewSessionFailed(session);
        enableCameraControls(true);
    }

    public void onVideoRecordStopped() {
        Log.d(TAG, "onVideoRecordStopped: " + this.mPendingStopRecorder);
        if (this.mPendingStopRecorder) {
            stopRecorder();
            startPreviewAfterRecord();
        }
    }

    private boolean needImageThumbnail(int saveType) {
        switch (saveType) {
            case 12:
                return false;
            default:
                return true;
        }
    }
}
