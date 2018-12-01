package com.android.camera.module;

import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.params.Face;
import android.location.Location;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.support.v4.view.MotionEventCompat;
import android.support.v7.recyclerview.R;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Toast;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.ChangeManager;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.RotateDialogController;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$PlayVideoProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public abstract class VideoBase extends BaseModule implements FaceDetectionCallback, FocusCallback, CameraPreviewCallback, Listener, ModeProtocol$CameraAction, ModeProtocol$PlayVideoProtocol {
    protected static String TAG;
    protected AudioManager mAudioManager;
    protected String mBaseFileName;
    protected CameraCaptureSession mCurrentSession;
    protected String mCurrentVideoFilename;
    protected Uri mCurrentVideoUri;
    protected ContentValues mCurrentVideoValues;
    private AlertDialog mDialog;
    protected boolean mFaceDetectionEnabled;
    protected boolean mFaceDetectionStarted;
    protected FocusManager2 mFocusManager;
    protected Handler mHandler;
    protected boolean mInStartingFocusRecording;
    protected long mIntentRequestSize;
    private boolean mIsSessionReady;
    private boolean mIsVideoCaptureIntent;
    protected long mLastBackPressedTime;
    protected int mMaxVideoDurationInMs;
    protected volatile boolean mMediaRecorderRecording;
    protected boolean mMediaRecorderRecordingPaused;
    private int mMessageId;
    protected long mOnResumeTime;
    protected int mOrientationCompensationAtRecordStart;
    protected int mOriginalMusicVolume;
    protected int mOutputFormat;
    protected final PhoneStateListener mPhoneStateListener = new PhoneStateListener() {
        public void onCallStateChanged(int state, String incomingNumber) {
            if (state == 2 && VideoBase.this.mMediaRecorderRecording) {
                Log.w(VideoBase.TAG, "CALL_STATE_OFFHOOK");
                VideoBase.this.onStop();
            }
            super.onCallStateChanged(state, incomingNumber);
        }
    };
    protected boolean mPreviewing;
    private BroadcastReceiver mReceiver;
    protected long mRecordingStartTime;
    protected SensorStateListener mSensorStateListener = new SensorStateListener() {
        public void onDeviceBecomeStable() {
            Log.v(VideoBase.TAG, "onDeviceBecomeStable");
        }

        public boolean isWorking() {
            return VideoBase.this.mPreviewing;
        }

        public void onDeviceKeepMoving(double a) {
            if (!VideoBase.this.mMainProtocol.isEvAdjusted(true) && (VideoBase.this.mPaused ^ 1) != 0 && Util.isTimeout(System.currentTimeMillis(), VideoBase.this.mTouchFocusStartingTime, 3000) && VideoBase.this.mFocusManager != null && VideoBase.this.mFocusManager.isNeedCancelAutoFocus() && !VideoBase.this.isVideoRecording()) {
                VideoBase.this.mFocusManager.onDeviceKeepMoving(a);
            }
        }

        public void onDeviceBeginMoving() {
        }

        public void onDeviceOrientationChanged(float orientation, boolean isLying) {
        }

        public void notifyDevicePostureChanged() {
            VideoBase.this.mActivity.getEdgeShutterView().onDevicePostureChanged();
        }
    };
    protected boolean mSnapshotInProgress;
    protected StereoSwitchThread mStereoSwitchThread;
    protected TelephonyManager mTelephonyManager;
    private int mTitleId;
    protected long mTouchFocusStartingTime;
    protected ParcelFileDescriptor mVideoFileDescriptor;
    protected String mVideoFocusMode;
    protected CameraSize mVideoSize;

    private class MainHandler extends Handler {
        /* synthetic */ MainHandler(VideoBase this$0, MainHandler -this1) {
            this();
        }

        private MainHandler() {
        }

        public void handleMessage(Message msg) {
            boolean z = true;
            if (!VideoBase.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (VideoBase.this.getActivity() != null) {
                switch (msg.what) {
                    case 2:
                        break;
                    case 4:
                        if (!(Util.getDisplayRotation(VideoBase.this.mActivity) == VideoBase.this.mDisplayRotation || (VideoBase.this.mMediaRecorderRecording ^ 1) == 0)) {
                            VideoBase.this.startPreview();
                        }
                        if (SystemClock.uptimeMillis() - VideoBase.this.mOnResumeTime < 5000) {
                            VideoBase.this.mHandler.sendEmptyMessageDelayed(4, 100);
                            break;
                        }
                        break;
                    case 9:
                        VideoBase.this.onPreviewStart();
                        VideoBase.this.mStereoSwitchThread = null;
                        break;
                    case 10:
                        VideoBase.this.stopVideoRecording(true, false);
                        VideoBase.this.mOpenCameraFail = true;
                        VideoBase.this.onCameraException();
                        break;
                    case MotionEventCompat.AXIS_LTRIGGER /*17*/:
                        VideoBase.this.mHandler.removeMessages(17);
                        VideoBase.this.mHandler.removeMessages(2);
                        VideoBase.this.getWindow().addFlags(128);
                        VideoBase.this.mHandler.sendEmptyMessageDelayed(2, (long) VideoBase.this.getScreenDelay());
                        break;
                    case MotionEventCompat.AXIS_GAS /*22*/:
                        if (!VideoBase.this.isSelectingCapturedVideo()) {
                            VideoBase.this.enableCameraControls(true);
                            break;
                        }
                        break;
                    case MotionEventCompat.AXIS_GENERIC_4 /*35*/:
                        VideoBase videoBase = VideoBase.this;
                        boolean z2 = msg.arg1 > 0;
                        if (msg.arg2 <= 0) {
                            z = false;
                        }
                        videoBase.handleUpdateFaceView(z2, z);
                        break;
                    case MotionEventCompat.AXIS_GENERIC_9 /*40*/:
                        if (CameraSettings.isStereoModeOn()) {
                            VideoBase.this.updateTipMessage(6, R.string.dual_camera_use_hint, 2);
                            break;
                        }
                        break;
                    case MotionEventCompat.AXIS_GENERIC_11 /*42*/:
                        VideoBase.this.updateRecordingTime();
                        break;
                    case MotionEventCompat.AXIS_GENERIC_12 /*43*/:
                        VideoBase.this.restoreMusicSound();
                        break;
                    case MotionEventCompat.AXIS_GENERIC_14 /*45*/:
                        VideoBase.this.setActivity(null);
                        break;
                    case MotionEventCompat.AXIS_GENERIC_15 /*46*/:
                        VideoBase.this.onWaitStopCallbackTimeout();
                        break;
                    case MotionEventCompat.AXIS_GENERIC_16 /*47*/:
                        if (VideoBase.this.mHandlerFinishEmitter != null) {
                            VideoBase.this.mHandlerFinishEmitter.onComplete();
                            VideoBase.this.mHandlerFinishEmitter = null;
                            break;
                        }
                        break;
                    case 51:
                        VideoBase.this.stopVideoRecording(true, false);
                        if (!VideoBase.this.mActivity.isActivityPaused()) {
                            VideoBase.this.mOpenCameraFail = true;
                            VideoBase.this.onCameraException();
                            break;
                        }
                        break;
                    default:
                        if (!VideoBase.DEBUG) {
                            Log.e(VideoBase.TAG, "no consumer for this message: " + msg.what);
                            break;
                        }
                        throw new RuntimeException("no consumer for this message: " + msg.what);
                }
                VideoBase.this.getWindow().clearFlags(128);
            }
        }
    }

    protected class MyBroadcastReceiver extends BroadcastReceiver {
        protected MyBroadcastReceiver() {
        }

        /* JADX WARNING: Missing block: B:4:0x0010, code:
            return;
     */
        public void onReceive(android.content.Context r5, android.content.Intent r6) {
            /*
            r4 = this;
            r1 = com.android.camera.module.VideoBase.this;
            r1 = r1.mActivity;
            if (r1 == 0) goto L_0x0010;
        L_0x0006:
            r1 = com.android.camera.module.VideoBase.this;
            r1 = r1.mActivity;
            r1 = r1.isFinishing();
            if (r1 == 0) goto L_0x0011;
        L_0x0010:
            return;
        L_0x0011:
            r1 = r6.getData();
            r1 = com.android.camera.storage.Storage.isRelatedStorage(r1);
            if (r1 != 0) goto L_0x001c;
        L_0x001b:
            return;
        L_0x001c:
            r0 = r6.getAction();
            r1 = com.android.camera.module.VideoBase.TAG;
            r2 = new java.lang.StringBuilder;
            r2.<init>();
            r3 = "onReceive: action=";
            r2 = r2.append(r3);
            r2 = r2.append(r0);
            r2 = r2.toString();
            com.android.camera.log.Log.v(r1, r2);
            r1 = "android.intent.action.MEDIA_EJECT";
            r1 = r0.equals(r1);
            if (r1 == 0) goto L_0x0053;
        L_0x0042:
            r1 = com.android.camera.storage.Storage.isCurrentStorageIsSecondary();
            if (r1 == 0) goto L_0x0052;
        L_0x0048:
            com.android.camera.storage.Storage.switchToPhoneStorage();
            r1 = com.android.camera.module.VideoBase.this;
            r2 = 1;
            r3 = 0;
            r1.stopVideoRecording(r2, r3);
        L_0x0052:
            return;
        L_0x0053:
            r1 = "android.intent.action.MEDIA_MOUNTED";
            r1 = r0.equals(r1);
            if (r1 == 0) goto L_0x0073;
        L_0x005c:
            r1 = com.android.camera.module.VideoBase.this;
            r1 = r1.mActivity;
            r1 = r1.getScreenHint();
            r1.updateHint();
            r1 = com.android.camera.module.VideoBase.this;
            r1 = r1.mActivity;
            r1 = r1.getThumbnailUpdater();
            r1.getLastThumbnail();
            goto L_0x0052;
        L_0x0073:
            r1 = "android.intent.action.MEDIA_UNMOUNTED";
            r1 = r0.equals(r1);
            if (r1 == 0) goto L_0x0088;
        L_0x007c:
            r1 = com.android.camera.module.VideoBase.this;
            r1 = r1.mActivity;
            r1 = r1.getScreenHint();
            r1.updateHint();
            goto L_0x0052;
        L_0x0088:
            r1 = "android.intent.action.MEDIA_SCANNER_STARTED";
            r1 = r0.equals(r1);
            if (r1 == 0) goto L_0x009a;
        L_0x0091:
            r1 = com.android.camera.module.VideoBase.TAG;
            r2 = "media scanner started";
            com.android.camera.log.Log.d(r1, r2);
            goto L_0x0052;
        L_0x009a:
            r1 = "android.intent.action.MEDIA_SCANNER_FINISHED";
            r1 = r0.equals(r1);
            if (r1 == 0) goto L_0x0052;
        L_0x00a3:
            r1 = com.android.camera.module.VideoBase.this;
            r1 = r1.mActivity;
            r1 = r1.getScreenHint();
            r1.updateHint();
            goto L_0x0052;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoBase.MyBroadcastReceiver.onReceive(android.content.Context, android.content.Intent):void");
        }
    }

    protected class StereoSwitchThread extends Thread {
        private volatile boolean mCancelled;
        final /* synthetic */ VideoBase this$0;

        public void cancel() {
            this.mCancelled = true;
        }

        public void run() {
            this.this$0.closeCamera();
            if (!this.mCancelled) {
                this.this$0.openCamera();
                if (this.this$0.hasCameraException()) {
                    this.this$0.onCameraException();
                } else if (!this.mCancelled) {
                    CameraSettings.resetZoom();
                    CameraSettings.resetExposure();
                    this.this$0.onCameraOpened();
                    this.this$0.readVideoPreferences();
                    this.this$0.resizeForPreviewAspectRatio();
                    if (!this.mCancelled) {
                        this.this$0.startPreview();
                        this.this$0.onPreviewStart();
                        this.this$0.mHandler.sendEmptyMessage(9);
                    }
                }
            }
        }
    }

    private void handleUpdateFaceView(boolean visible, boolean clearFaces) {
        boolean mirror = isFrontCamera();
        if (!visible) {
            this.mMainProtocol.updateFaceView(visible, clearFaces, mirror, false, -1);
        } else if (this.mFaceDetectionStarted && this.mCamera2Device != null && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(visible, true, mirror, true, this.mCameraDisplayOrientation);
        }
    }

    public static String convertOutputFormatToMimeType(int outputFileFormat) {
        if (outputFileFormat == 2) {
            return "video/mp4";
        }
        return "video/3gpp";
    }

    public static String convertOutputFormatToFileExt(int outputFileFormat) {
        if (outputFileFormat == 2) {
            return ".mp4";
        }
        return ".3gp";
    }

    protected static String millisecondToTimeString(long milliSeconds, boolean displayCentiSeconds) {
        long seconds = milliSeconds / 1000;
        long minutes = seconds / 60;
        long hours = minutes / 60;
        long remainderMinutes = minutes - (60 * hours);
        long remainderSeconds = seconds - (60 * minutes);
        StringBuilder timeStringBuilder = new StringBuilder();
        if (hours > 0) {
            if (hours < 10) {
                timeStringBuilder.append('0');
            }
            timeStringBuilder.append(hours).append(':');
        }
        if (remainderMinutes < 10) {
            timeStringBuilder.append('0');
        }
        timeStringBuilder.append(remainderMinutes).append(':');
        if (remainderSeconds < 10) {
            timeStringBuilder.append('0');
        }
        timeStringBuilder.append(remainderSeconds);
        if (displayCentiSeconds) {
            timeStringBuilder.append('.');
            long remainderCentiSeconds = (milliSeconds - (1000 * seconds)) / 10;
            if (remainderCentiSeconds < 10) {
                timeStringBuilder.append('0');
            }
            timeStringBuilder.append(remainderCentiSeconds);
        }
        return timeStringBuilder.toString();
    }

    public VideoBase(String tag) {
        TAG = tag;
        this.mHandler = new MainHandler(this, null);
    }

    protected void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(3, this.mCameraCapabilities.getSupportedFocusModes());
    }

    public void onPreviewSizeChanged(int width, int height) {
        Log.v(TAG, String.format(Locale.ENGLISH, "onPreviewSizeChanged: %dx%d", new Object[]{Integer.valueOf(width), Integer.valueOf(height)}));
        if (this.mFocusManager != null) {
            this.mFocusManager.setPreviewSize(width, height);
        }
    }

    public void onResume() {
        super.onResume();
        if (!isVideoRecording() && !this.mOpenCameraFail && !this.mCameraDisabled && (PermissionManager.checkCameraLaunchPermissions() ^ 1) == 0) {
            updateStereoSettings(true);
            if (!this.mPreviewing) {
                startPreview();
            }
            this.mHandler.sendEmptyMessage(9);
            keepScreenOnAwhile();
            registerReceiver();
            onSettingsBack();
            if (this.mPreviewing) {
                this.mOnResumeTime = SystemClock.uptimeMillis();
                this.mHandler.sendEmptyMessageDelayed(4, 100);
            }
        }
    }

    public void setFrameAvailable(boolean available) {
        super.setFrameAvailable(available);
        if (CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(1);
            this.mActivity.loadCameraSound(0);
            this.mActivity.loadCameraSound(2);
            this.mActivity.loadCameraSound(3);
        }
    }

    public boolean isCaptureIntent() {
        return this.mIsVideoCaptureIntent;
    }

    protected void setCaptureIntent(boolean captureIntent) {
        this.mIsVideoCaptureIntent = captureIntent;
    }

    protected void parseIntent(Intent intent) {
        if (intent.getExtras() != null) {
            this.mIntentRequestSize = this.mActivity.getCameraIntentManager().getRequestSize();
            Uri saveUri = this.mActivity.getCameraIntentManager().getExtraSavedUri();
            if (saveUri != null) {
                try {
                    this.mVideoFileDescriptor = this.mContentResolver.openFileDescriptor(saveUri, "rw");
                    this.mCurrentVideoUri = saveUri;
                    Log.d(TAG, "parseIntent: outputUri=" + saveUri);
                } catch (FileNotFoundException ex) {
                    Log.e(TAG, ex.getMessage());
                }
            }
        }
    }

    protected void registerReceiver() {
        IntentFilter intentFilter = new IntentFilter("android.intent.action.MEDIA_MOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_EJECT");
        intentFilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_STARTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_FINISHED");
        intentFilter.addDataScheme("file");
        this.mReceiver = new MyBroadcastReceiver();
        this.mActivity.registerReceiver(this.mReceiver, intentFilter);
    }

    protected void unregisterReceiver() {
        if (this.mReceiver != null) {
            this.mActivity.unregisterReceiver(this.mReceiver);
            this.mReceiver = null;
        }
    }

    public void checkDisplayOrientation() {
        if (isCreated()) {
            super.checkDisplayOrientation();
            if (this.mFocusManager != null) {
                this.mFocusManager.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
            if (this.mCamera2Device != null) {
                this.mCamera2Device.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
            this.mMainProtocol.setCameraDisplayOrientation(this.mCameraDisplayOrientation);
        }
    }

    protected void keepScreenOnAwhile() {
        this.mHandler.sendEmptyMessageDelayed(17, 1000);
    }

    protected void keepScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
        getWindow().addFlags(128);
    }

    protected void resetScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
    }

    protected void performVolumeKeyClicked(int repeatCount, boolean pressed) {
        if (repeatCount == 0 && pressed) {
            restoreBottom();
            if (isIgnoreTouchEvent()) {
                Log.w(TAG, "ignore volume key");
                return;
            }
            onShutterButtonClick(20);
        }
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        boolean z = false;
        if (this.mPaused) {
            return true;
        }
        switch (keyCode) {
            case MotionEventCompat.AXIS_DISTANCE /*24*/:
            case MotionEventCompat.AXIS_TILT /*25*/:
            case 87:
            case 88:
                if (keyCode == 24) {
                    z = true;
                } else if (keyCode == 88) {
                    z = true;
                }
                if (handleVolumeKeyEvent(z, true, event.getRepeatCount())) {
                    return true;
                }
                break;
            case 27:
            case 66:
                if (event.getRepeatCount() == 0) {
                    restoreBottom();
                    if (!Util.isFingerPrintKeyEvent(event)) {
                        onShutterButtonClick(40);
                    } else if (CameraSettings.isFingerprintCaptureEnable()) {
                        onShutterButtonClick(30);
                    }
                    return true;
                }
                break;
        }
        return super.onKeyDown(keyCode, event);
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 4:
                if (((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
                    return true;
                }
                break;
            case 27:
            case 66:
                return true;
        }
        return super.onKeyUp(keyCode, event);
    }

    public boolean isVideoRecording() {
        return this.mMediaRecorderRecording;
    }

    public boolean shouldReleaseLater() {
        return !isVideoRecording() ? isSelectingCapturedVideo() : true;
    }

    public void notifyError() {
        super.notifyError();
        if (currentIsMainThread()) {
            stopVideoRecording(true, false);
            if (this.mPaused) {
                closeCamera();
            }
        }
    }

    public void stopVideoRecording(boolean stopRecorder, boolean fromRelease) {
    }

    protected void onWaitStopCallbackTimeout() {
    }

    protected void updateRecordingTime() {
    }

    public void closeCamera() {
        Log.v(TAG, "closeCamera");
        this.mPreviewing = false;
        this.mSnapshotInProgress = false;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setFocusCallback(null);
            this.mCamera2Device.setErrorCallback(null);
            this.mCamera2Device = null;
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

    protected void onSettingsBack() {
        ChangeManager cm = CameraSettings.sCameraChangeManager;
        if (cm.check(3)) {
            cm.clear(3);
            restorePreferences();
        } else if (cm.check(1)) {
            cm.clear(1);
            onSharedPreferenceChanged();
        }
    }

    private void restorePreferences() {
        if (isZoomSupported()) {
            setZoomValue(1.0f);
        }
        onSharedPreferenceChanged();
    }

    protected boolean isZoomEnabled() {
        return !CameraSettings.isStereoModeOn() ? CameraSettings.isFrontCamera() ^ 1 : false;
    }

    protected void readVideoPreferences() {
    }

    public void playVideo() {
        startPlayVideoActivity();
    }

    private void startPlayVideoActivity() {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setDataAndType(this.mCurrentVideoUri, convertOutputFormatToMimeType(this.mOutputFormat));
        intent.setFlags(1);
        try {
            this.mActivity.startActivity(intent);
        } catch (ActivityNotFoundException ex) {
            Log.e(TAG, "failed to view video " + this.mCurrentVideoUri, ex);
        }
    }

    public void onShutterButtonClick(int mode) {
    }

    public boolean onShutterButtonLongClick() {
        Log.v(TAG, "onShutterButtonLongClick");
        return false;
    }

    public void onShutterButtonFocus(boolean pressed, int from) {
    }

    public void onShutterButtonLongClickCancel(boolean in) {
        onShutterButtonFocus(false, 2);
    }

    public boolean isDoingAction() {
        return this.mMediaRecorderRecording ? this.mMediaRecorderRecordingPaused ^ 1 : false;
    }

    @OnClickAttr
    public void onThumbnailClicked(View v) {
        if (!this.mMediaRecorderRecording && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    @OnClickAttr
    public void onReviewDoneClicked() {
        doReturnToCaller(true);
    }

    @OnClickAttr
    public void onReviewCancelClicked() {
        if (isSelectingCapturedVideo()) {
            deleteCurrentVideo();
            hideAlert();
            return;
        }
        stopVideoRecording(true, false);
        doReturnToCaller(false);
    }

    private boolean isSelectingCapturedVideo() {
        if (isCaptureIntent() && ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).getActiveFragment(R.id.bottom_action) == 4083) {
            return true;
        }
        return false;
    }

    private Bitmap getReviewBitmap() {
        Bitmap bitmap = null;
        if (this.mVideoFileDescriptor != null) {
            bitmap = Thumbnail.createVideoThumbnailBitmap(this.mVideoFileDescriptor.getFileDescriptor(), this.mMainProtocol.getPreviewWidth());
        } else if (this.mCurrentVideoFilename != null) {
            bitmap = Thumbnail.createVideoThumbnailBitmap(this.mCurrentVideoFilename, this.mMainProtocol.getPreviewWidth());
        }
        if (bitmap != null) {
            return Util.rotateAndMirror(bitmap, -this.mOrientationCompensationAtRecordStart, isFrontCamera());
        }
        return bitmap;
    }

    protected void showAlert() {
        pausePreview();
        this.mMainProtocol.showReviewViews(getReviewBitmap());
        enableCameraControls(false);
        ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    private void hideAlert() {
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
        this.mMainProtocol.hideReviewViews();
        enableCameraControls(true);
        ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    protected void doReturnToCaller(boolean valid) {
        int resultCode;
        Intent resultIntent = new Intent();
        if (valid) {
            resultCode = -1;
            resultIntent.setData(this.mCurrentVideoUri);
            resultIntent.setFlags(1);
        } else {
            resultCode = 0;
        }
        this.mActivity.setResult(resultCode, resultIntent);
        this.mActivity.finish();
    }

    protected int getCameraRotation() {
        return ((this.mOrientationCompensation - this.mDisplayRotation) + 360) % 360;
    }

    protected ContentValues genContentValues(int outputFileFormat, int fileNo) {
        long dateTaken = System.currentTimeMillis();
        String title = createName(dateTaken, fileNo);
        if (fileNo > 0) {
            title = title + String.format(Locale.ENGLISH, "_%d", new Object[]{Integer.valueOf(fileNo)});
        }
        String filename = title + convertOutputFormatToFileExt(outputFileFormat);
        String mime = convertOutputFormatToMimeType(outputFileFormat);
        String path = Storage.DIRECTORY + '/' + filename;
        Log.v(TAG, "genContentValues: path=" + path);
        ContentValues values = new ContentValues(8);
        values.put("title", title);
        values.put("_display_name", filename);
        values.put("datetaken", Long.valueOf(dateTaken));
        values.put("mime_type", mime);
        values.put("_data", path);
        values.put("resolution", Integer.toString(this.mVideoSize.width) + "x" + Integer.toString(this.mVideoSize.height));
        Location loc = LocationManager.instance().getCurrentLocation();
        if (!(loc == null || (loc.getLatitude() == 0.0d && loc.getLongitude() == 0.0d))) {
            values.put("latitude", Double.valueOf(loc.getLatitude()));
            values.put("longitude", Double.valueOf(loc.getLongitude()));
        }
        return values;
    }

    private String createName(long dateTaken, int fileNo) {
        if (fileNo > 0) {
            return this.mBaseFileName;
        }
        this.mBaseFileName = new SimpleDateFormat(getString(R.string.video_file_name_format), Locale.ENGLISH).format(new Date(dateTaken));
        return this.mBaseFileName;
    }

    protected void cleanupEmptyFile() {
        if (this.mCurrentVideoFilename != null) {
            File f = new File(this.mCurrentVideoFilename);
            if (!f.exists()) {
                Log.d(TAG, "no video file: " + this.mCurrentVideoFilename);
                this.mCurrentVideoFilename = null;
            } else if (f.length() == 0 && f.delete()) {
                Log.d(TAG, "delete empty video file: " + this.mCurrentVideoFilename);
                this.mCurrentVideoFilename = null;
            }
        }
    }

    protected void animateHold() {
    }

    private void deleteCurrentVideo() {
        if (this.mCurrentVideoFilename != null) {
            deleteVideoFile(this.mCurrentVideoFilename);
            this.mCurrentVideoFilename = null;
            if (this.mCurrentVideoUri != null) {
                Util.safeDelete(this.mCurrentVideoUri, null, null);
                this.mCurrentVideoUri = null;
            }
        }
        this.mActivity.getScreenHint().updateHint();
    }

    protected void deleteVideoFile(String fileName) {
        Log.v(TAG, "delete invalid video " + fileName);
        if (!new File(fileName).delete()) {
            Log.v(TAG, "fail to delete " + fileName);
        }
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra("from_where", this.mModuleIndex);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void enterMutexMode(int mode) {
        setZoomValue(1.0f);
        this.mSettingsOverrider.overrideSettings("pref_camera_whitebalance_key", null, "pref_camera_coloreffect_key", null);
        onSharedPreferenceChanged();
    }

    public void exitMutexMode(int mode) {
        this.mSettingsOverrider.restoreSettings();
        onSharedPreferenceChanged();
    }

    protected void closeVideoFileDescriptor() {
        if (this.mVideoFileDescriptor != null) {
            try {
                this.mVideoFileDescriptor.close();
            } catch (IOException e) {
                Log.e(TAG, "fail to close fd", e);
            }
            this.mVideoFileDescriptor = null;
        }
    }

    protected void silenceSounds() {
        if (this.mAudioManager == null) {
            this.mAudioManager = (AudioManager) this.mActivity.getSystemService("audio");
        }
        this.mAudioManager.requestAudioFocus(null, 3, 2);
        this.mOriginalMusicVolume = this.mAudioManager.getStreamVolume(3);
        if (this.mOriginalMusicVolume != 0) {
            this.mAudioManager.setStreamMute(3, true);
            this.mHandler.sendEmptyMessageDelayed(43, 3000);
        }
    }

    protected void restoreMusicSound() {
        if (this.mOriginalMusicVolume != 0 && this.mAudioManager.getStreamVolume(3) == 0) {
            this.mAudioManager.setStreamMute(3, false);
        }
        this.mOriginalMusicVolume = 0;
        this.mHandler.removeMessages(43);
    }

    protected void setPreviewFrameLayoutAspectRatio() {
        if (this.mPreviewSize != null) {
            this.mMainProtocol.setPreviewAspectRatio(CameraSettings.getPreviewAspectRatio(this.mPreviewSize.width, this.mPreviewSize.height));
        }
    }

    protected void updateVideoFocusMode() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateVideoFocusMode: null camera device");
            return;
        }
        int[] supportedFocusMode = this.mCameraCapabilities.getSupportedFocusModes();
        int focusMode = AutoFocus.convertToFocusMode(this.mVideoFocusMode);
        if (Util.isSupported(focusMode, supportedFocusMode)) {
            this.mCamera2Device.setFocusMode(focusMode);
            updateMotionFocusManager();
            updateFocusCallback();
        }
    }

    protected void updateMotionFocusManager() {
        this.mActivity.getSensorStateManager().setFocusSensorEnabled("auto".equals(this.mVideoFocusMode));
    }

    protected void updateFocusArea() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateFocusArea: null camera device");
            return;
        }
        Rect cropRegion = getCropRegion();
        this.mActivity.getSensorStateManager().setFocusSensorEnabled(this.mFocusManager.getMeteringAreas(cropRegion) != null);
        this.mCamera2Device.setAERegions(this.mFocusManager.getMeteringAreas(cropRegion));
        if (this.mFocusAreaSupported) {
            this.mCamera2Device.setAFRegions(this.mFocusManager.getMeteringAreas(cropRegion));
        } else {
            this.mCamera2Device.resumePreview();
        }
    }

    protected void updateFace() {
        boolean faceDetection = enableFaceDetection();
        if (this.mMainProtocol != null) {
            this.mMainProtocol.setSkipDrawFace(faceDetection ^ 1);
        }
        if (faceDetection) {
            if (!this.mFaceDetectionEnabled) {
                this.mFaceDetectionEnabled = true;
                startFaceDetection();
            }
        } else if (this.mFaceDetectionEnabled) {
            stopFaceDetection(true);
            this.mFaceDetectionEnabled = false;
        }
    }

    protected boolean enableFaceDetection() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_facedetection_key", getResources().getBoolean(R.bool.pref_camera_facedetection_default));
    }

    public void updateFlashPreference() {
        if (!(this.mMutexModePicker.isNormal() || (this.mMutexModePicker.isSupportedFlashOn() ^ 1) == 0 || (this.mMutexModePicker.isSupportedTorch() ^ 1) == 0)) {
            resetMutexModeManually();
        }
        setFlashMode(DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex));
    }

    protected void initializeFocusManager() {
        this.mFocusManager = new FocusManager2(this.mCameraCapabilities, this, isFrontCamera(), this.mActivity.getMainLooper());
        Rect rect = null;
        if (this.mActivity.getCameraScreenNail() != null) {
            rect = this.mActivity.getCameraScreenNail().getRenderRect();
        }
        if (rect == null || rect.width() <= 0) {
            this.mFocusManager.setRenderSize(Util.sWindowWidth, Util.sWindowHeight);
            this.mFocusManager.setPreviewSize(Util.sWindowWidth, Util.sWindowHeight);
            return;
        }
        this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
        this.mFocusManager.setPreviewSize(rect.width(), rect.height());
    }

    public boolean isMeteringAreaOnly() {
        return !this.mFocusAreaSupported ? this.mMeteringAreaSupported : false;
    }

    protected void startVideoRecording() {
    }

    protected void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    protected void resizeForPreviewAspectRatio() {
    }

    protected void onPreviewStart() {
    }

    protected void waitStereoSwitchThread() {
        try {
            if (this.mStereoSwitchThread != null) {
                this.mStereoSwitchThread.cancel();
                this.mStereoSwitchThread.join();
                this.mStereoSwitchThread = null;
            }
        } catch (InterruptedException e) {
            Log.e(TAG, e.getMessage(), e);
        }
    }

    protected void updateStereoSettings(boolean open) {
        if (!CameraSettings.isStereoModeOn()) {
            return;
        }
        if (open) {
            this.mSettingsOverrider.overrideSettings("pref_camera_video_flashmode_key", String.valueOf(0));
            return;
        }
        this.mSettingsOverrider.restoreSettings();
    }

    protected void setVideoFocusMode(String mode) {
        if (this.mCamera2Device != null) {
            this.mVideoFocusMode = mode;
            updateVideoFocusMode();
        }
    }

    protected void updateFocusCallback() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateFocusCallback: null camera device");
            return;
        }
        if (this.mContinuousFocusSupported && "continuous-video".equals(this.mVideoFocusMode)) {
            this.mCamera2Device.setFocusCallback(this);
        }
    }

    protected void showConfirmMessage(int title, int message) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            if (this.mTitleId != title && this.mMessageId != message) {
                this.mDialog.dismiss();
            } else {
                return;
            }
        }
        this.mTitleId = title;
        this.mMessageId = message;
        this.mDialog = RotateDialogController.showSystemAlertDialog(this.mActivity, this.mActivity.getString(title), this.mActivity.getString(message), this.mActivity.getString(17039370), null, null, null);
    }

    protected boolean checkCallingState() {
        if (2 != this.mTelephonyManager.getCallState()) {
            return true;
        }
        showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_calling_alert);
        return false;
    }

    protected boolean isSessionReady() {
        return this.mIsSessionReady;
    }

    protected void setSessionReady(boolean ready) {
        this.mIsSessionReady = ready;
    }

    public void onPreviewSessionSuccess(CameraCaptureSession session) {
        Log.d(TAG, "onPreviewSessionSuccess: " + session);
        if (session != null && isAlive()) {
            this.mCurrentSession = session;
            setSessionReady(true);
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession session) {
        Log.d(TAG, "onPreviewSessionFailed: " + session);
        if (this.mCurrentSession != null && this.mCurrentSession.equals(session)) {
            this.mCurrentSession = null;
            setSessionReady(false);
        }
        this.mHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession session) {
        Log.d(TAG, "onPreviewSessionClosed: " + session);
        if (this.mCurrentSession != null && this.mCurrentSession.equals(session)) {
            this.mCurrentSession = null;
            setSessionReady(false);
        }
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            Log.v(TAG, "startFocus");
            if (this.mFocusAreaSupported) {
                setVideoFocusMode("auto");
                this.mCamera2Device.startFocus(FocusTask.create(1), this.mModuleIndex);
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    public void cancelFocus(boolean resetFocusMode) {
        if (!isDeviceAlive()) {
            return;
        }
        if (!isSessionReady()) {
            Log.e(TAG, "cancelFocus: null session");
        } else if (isFrameAvailable()) {
            Log.v(TAG, "cancelFocus: " + resetFocusMode);
            if (resetFocusMode) {
                setVideoFocusMode("continuous-video");
            }
            this.mCamera2Device.cancelFocus(this.mModuleIndex);
        }
    }

    public boolean onWaitingFocusFinished() {
        Log.v(TAG, "capture");
        if (!this.mInStartingFocusRecording) {
            return false;
        }
        this.mInStartingFocusRecording = false;
        startVideoRecording();
        return true;
    }

    public boolean multiCapture() {
        Log.v(TAG, "multiCapture");
        return false;
    }

    /* JADX WARNING: Missing block: B:6:0x0010, code:
            return;
     */
    public void startFaceDetection() {
        /*
        r1 = this;
        r0 = r1.mFaceDetectionEnabled;
        if (r0 == 0) goto L_0x0010;
    L_0x0004:
        r0 = r1.mFaceDetectionStarted;
        if (r0 != 0) goto L_0x0010;
    L_0x0008:
        r0 = r1.isAlive();
        r0 = r0 ^ 1;
        if (r0 == 0) goto L_0x0011;
    L_0x0010:
        return;
    L_0x0011:
        r0 = r1.mMaxFaceCount;
        if (r0 <= 0) goto L_0x0026;
    L_0x0015:
        r0 = r1.mCamera2Device;
        if (r0 == 0) goto L_0x0026;
    L_0x0019:
        r0 = 1;
        r1.mFaceDetectionStarted = r0;
        r0 = r1.mCamera2Device;
        r0.setFaceDetectionCallback(r1);
        r0 = r1.mCamera2Device;
        r0.startFaceDetection();
    L_0x0026:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.VideoBase.startFaceDetection():void");
    }

    public void stopFaceDetection(boolean clearFaces) {
        if (this.mFaceDetectionEnabled && (this.mFaceDetectionStarted ^ 1) == 0) {
            this.mFaceDetectionStarted = false;
            if (this.mCamera2Device != null) {
                this.mCamera2Device.stopFaceDetection();
                this.mCamera2Device.setFaceDetectionCallback(null);
            }
        }
    }

    public void onFaceDetected(Face[] faces, FaceAnalyzeInfo faceInfo, Camera2Proxy camera) {
    }

    public void stopObjectTracking(boolean realStop) {
    }

    public void notifyFocusAreaUpdate() {
        updatePreferenceTrampoline(3);
    }

    public void playSound(int soundId) {
        if (!isNeedMute()) {
            playCameraSound(soundId);
        }
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isCreated() && !isDeparted()) {
            switch (focusTask.getFocusTrigger()) {
                case 1:
                    Log.v(TAG, "focusTime=" + focusTask.getElapsedTime() + "ms focused=" + focusTask.isSuccess() + " waitForRecording=" + this.mFocusManager.isFocusingSnapOnFinish());
                    this.mMainProtocol.setFocusViewType(true);
                    this.mFocusManager.onFocusResult(focusTask);
                    this.mActivity.getSensorStateManager().reset();
                    break;
                case 2:
                    if (!this.mMediaRecorderRecording) {
                        this.mMainProtocol.setFocusViewType(false);
                        this.mFocusManager.onFocusResult(focusTask);
                        break;
                    }
                    break;
            }
        }
    }

    protected void doLaterReleaseIfNeed() {
        if (this.mActivity != null && (this.mActivity.isActivityPaused() ^ 1) == 0) {
            Log.d(TAG, "doLaterRelease");
            if (this.mActivity != null) {
                this.mActivity.pause();
                this.mActivity.releaseAll(true);
            }
        }
    }
}
