package com.android.camera.module;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.CaptureResult;
import android.os.Bundle;
import android.os.SystemProperties;
import android.support.annotation.CallSuper;
import android.support.annotation.StringRes;
import android.support.annotation.WorkerThread;
import android.view.KeyEvent;
import android.view.Window;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraErrorCallbackImpl;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.JpegEncodingQualityMappings;
import com.android.camera.MutexModeManager;
import com.android.camera.MutexModeManager.MutexCallBack;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.preferences.SettingsOverrider;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$DualController;
import com.android.camera.protocol.ModeProtocol$EvChangedProtocol;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.protocol.ModeProtocol.ZoomProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.FocusView.ExposureViewListener;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CaptureResultParser;
import io.reactivex.Completable;
import io.reactivex.CompletableEmitter;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

public abstract class BaseModule implements Module, ExposureViewListener, CameraMetaDataCallback, ModeProtocol$EvChangedProtocol, ZoomProtocol, MutexCallBack, Consumer<int[]> {
    public static final int[] CAMERA_MODES = new int[]{0, 2, 4, 6};
    protected static final boolean DEBUG = Util.isDebugOsBuild();
    protected boolean isZooming;
    protected Camera mActivity;
    protected int mActualCameraId;
    protected boolean mAeLockSupported;
    protected boolean mAwbLockSupported;
    protected int mBogusCameraId;
    protected Camera2Proxy mCamera2Device;
    protected CameraCapabilities mCameraCapabilities;
    protected boolean mCameraDisabled;
    protected int mCameraDisplayOrientation;
    protected boolean mCameraHardwareError;
    private int mCameraState = 0;
    protected ContentResolver mContentResolver;
    protected boolean mContinuousFocusSupported;
    protected float mDeviceRotation = -1.0f;
    protected Rect mDisplayRect;
    protected int mDisplayRotation = -1;
    protected CameraErrorCallbackImpl mErrorCallback;
    private int mEvState;
    private int mEvValue;
    protected String mFlashAutoModeState;
    protected boolean mFocusAreaSupported;
    protected CompletableEmitter mHandlerFinishEmitter;
    protected boolean mIgnoreFocusChanged;
    private boolean mIgnoreTouchEvent;
    private AtomicBoolean mIsCreated = new AtomicBoolean(false);
    private AtomicBoolean mIsDeparted = new AtomicBoolean(false);
    private AtomicBoolean mIsFrameAvailable = new AtomicBoolean(false);
    private Disposable mLensDirtyDetectDisposable;
    private Disposable mLensDirtyDetectHintDisposable;
    protected ModeProtocol$MainContentProtocol mMainProtocol;
    protected long mMainThreadId = Thread.currentThread().getId();
    protected int mMaxFaceCount;
    protected boolean mMeteringAreaSupported;
    protected int mModuleIndex;
    protected MutexModeManager mMutexModePicker;
    protected boolean mObjectTrackingStarted;
    protected boolean mOpenCameraFail;
    protected int mOrientation = -1;
    protected int mOrientationCompensation = 0;
    protected boolean mPaused;
    protected CameraSize mPictureSize;
    protected CameraSize mPreviewSize;
    protected SettingsOverrider mSettingsOverrider = new SettingsOverrider();
    protected int mTriggerMode = 10;
    protected int mUIStyle = -1;
    private Disposable mUpdateWorkThreadDisposable;
    private ObservableEmitter<int[]> mUpdateWorkThreadEmitter;
    protected float mZoomMaxRatio = 1.0f;
    private float mZoomScaled;
    protected boolean mZoomSupported;
    protected float mZoomValue = 1.0f;

    protected abstract void openSettingActivity();

    public boolean isDeparted() {
        return this.mIsDeparted.get();
    }

    public void setFrameAvailable(boolean available) {
        this.mIsFrameAvailable.set(available);
    }

    public boolean isFrameAvailable() {
        return this.mIsFrameAvailable.get();
    }

    public void setDeparted() {
        if (this.mUpdateWorkThreadDisposable != null) {
            this.mUpdateWorkThreadDisposable.dispose();
        }
        if (this.mLensDirtyDetectDisposable != null) {
            this.mLensDirtyDetectDisposable.dispose();
        }
        if (this.mLensDirtyDetectHintDisposable != null) {
            this.mLensDirtyDetectHintDisposable.dispose();
        }
        if (this.mActivity != null) {
            this.mActivity.hideLensDirtyDetectedHint();
        }
        this.mIsDeparted.set(true);
    }

    public int getModuleIndex() {
        return this.mModuleIndex;
    }

    protected void openCamera() {
    }

    public Camera getActivity() {
        return this.mActivity;
    }

    public void setActivity(Camera activity) {
        this.mActivity = activity;
    }

    public void onCreate(int moduleIndex, int cameraId) {
        Log.d("BaseModule", "onCreate moduleIndex->" + moduleIndex + ", cameraId->" + cameraId);
        this.mModuleIndex = moduleIndex;
        this.mBogusCameraId = cameraId;
        this.mContentResolver = this.mActivity.getContentResolver();
        this.mErrorCallback = new CameraErrorCallbackImpl(this.mActivity);
        this.mMainProtocol = (ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        this.mMutexModePicker = new MutexModeManager(this);
        this.mUpdateWorkThreadDisposable = Observable.create(new ObservableOnSubscribe<int[]>() {
            public void subscribe(ObservableEmitter<int[]> observableEmitter) throws Exception {
                BaseModule.this.mUpdateWorkThreadEmitter = observableEmitter;
            }
        }).observeOn(GlobalConstant.sCameraSetupScheduler).subscribe((Consumer) this);
        if (Device.isSupportLensDirtyDetect() && CameraSettings.isLensDirtyDetectEnabled()) {
            this.mLensDirtyDetectDisposable = Completable.complete().delay(15000, TimeUnit.MILLISECONDS, GlobalConstant.sCameraSetupScheduler).doOnComplete(new Action() {
                public void run() throws Exception {
                    CameraSettings.setLensDirtyDetectEnable(false);
                    BaseModule.this.updateLensDirtyDetect(true);
                }
            }).subscribe();
        }
        setCreated(true);
    }

    private void setCreated(boolean created) {
        this.mIsCreated.set(created);
    }

    public boolean isCreated() {
        return this.mIsCreated.get();
    }

    public void onDestroy() {
        setCreated(false);
        Log.d("BaseModule", "onDestroy");
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return false;
    }

    public void registerProtocol() {
        Log.d("BaseModule", "registerProtocol");
        ModeCoordinatorImpl.getInstance().attachProtocol(170, this);
    }

    public void unRegisterProtocol() {
        Log.d("BaseModule", "unRegisterProtocol");
        ModeCoordinatorImpl.getInstance().detachProtocol(170, this);
    }

    public void onEvChanged(int value, int state) {
        if (isAlive()) {
            this.mEvValue = value;
            this.mEvState = state;
            if (state == 1) {
                CameraSettings.writeExposure(value);
                updateStatusBar(1);
            }
            updatePreferenceInWorkThread(12);
        }
    }

    @WorkerThread
    protected final void setEvValue() {
        if (isAlive()) {
            if (this.mEvState == 2) {
                this.mCamera2Device.setAWBLock(false);
            } else if (this.mEvState == 1) {
                this.mCamera2Device.setExposureCompensation(this.mEvValue);
                this.mCamera2Device.setAWBLock(true);
            }
        }
    }

    public void resetEvValue() {
        if (isDeviceAlive()) {
            this.mCamera2Device.setExposureCompensation(0);
            this.mCamera2Device.setAWBLock(false);
            CameraSettings.resetExposure();
            this.mCamera2Device.resumePreview();
        }
    }

    public void notifyZooming(boolean started) {
        this.isZooming = started;
    }

    public void notifyDualZoom(boolean isTo2X) {
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setOpticalZoomToTele(isTo2X);
            this.mCamera2Device.resumePreview();
        }
    }

    public void onZoomRatioChanged(float newRatio, boolean sync) {
        onZoomValueChanged(newRatio, sync);
    }

    public void onResume() {
        Log.d("BaseModule", "onResume");
        this.mPaused = false;
    }

    public void onPause() {
        Log.d("BaseModule", "onPause");
        this.mPaused = true;
        this.mUpdateWorkThreadDisposable.dispose();
        if (this.mLensDirtyDetectDisposable != null) {
            this.mLensDirtyDetectDisposable.dispose();
        }
        if (this.mLensDirtyDetectHintDisposable != null) {
            this.mLensDirtyDetectHintDisposable.dispose();
        }
        if (this.mCamera2Device.getMetaDataCallback() == this) {
            this.mCamera2Device.setMetaDataCallback(null);
        }
        if (this.mActivity != null) {
            this.mActivity.hideLensDirtyDetectedHint();
        }
    }

    public void onWindowFocusChanged(boolean hasFocus) {
        if (hasFocus) {
            this.mIgnoreFocusChanged = false;
        }
    }

    public boolean onBackPressed() {
        return false;
    }

    public boolean isVideoRecording() {
        return false;
    }

    public boolean shouldReleaseLater() {
        return false;
    }

    protected boolean currentIsMainThread() {
        return this.mMainThreadId == Thread.currentThread().getId();
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (keyCode == 82 && (this.mActivity.startFromSecureKeyguard() ^ 1) != 0) {
            openSettingActivity();
        }
        return false;
    }

    private void setIgnoreTouchEvent(boolean ignore) {
        this.mIgnoreTouchEvent = ignore;
    }

    public boolean isIgnoreTouchEvent() {
        return this.mIgnoreTouchEvent;
    }

    public List<String> getSupportedSettingKeys() {
        return new ArrayList();
    }

    public boolean onScaleBegin(float focusX, float focusY) {
        this.mZoomScaled = Float.MIN_VALUE;
        return true;
    }

    public boolean onScale(float focusX, float focusY, float scale) {
        Log.v("BaseModule", "isZoomEnabled() = " + isZoomEnabled());
        if (isZoomEnabled()) {
            this.mZoomScaled += (scale - 1.0f) / 4.0f;
            if (scaleZoomValue(this.mZoomScaled)) {
                this.mZoomScaled = Float.MIN_VALUE;
                return true;
            }
        }
        return false;
    }

    public void onScaleEnd() {
    }

    protected boolean isZoomEnabled() {
        return true;
    }

    protected boolean isZoomSupported() {
        return this.mZoomSupported;
    }

    public boolean scaleZoomValue(float contrast) {
        float delta = this.mZoomMaxRatio * contrast;
        if (Math.abs(delta) < 0.01f) {
            return false;
        }
        return onZoomValueChanged(this.mZoomValue + delta);
    }

    protected void onCameraException() {
        if (currentIsMainThread()) {
            Log.e("BaseModule", "onCameraException: " + this.mModuleIndex + " | " + this.mBogusCameraId);
            if (DataRepository.dataItemGlobal().isRetriedIfCameraError() || (this.mActivity.isActivityPaused() ^ 1) == 0) {
                if ((this.mOpenCameraFail || this.mCameraHardwareError) && ((!this.mActivity.isActivityPaused() || this.mOpenCameraFail) && this.mActivity.couldShowErrorDialog())) {
                    int i;
                    DataRepository.dataItemGlobal().setRetriedIfCameraError(false);
                    Activity activity = this.mActivity;
                    if (Util.isInVideoCall(this.mActivity)) {
                        i = R.string.cannot_connect_camera_volte_call;
                    } else if (CameraSettings.updateOpenCameraFailTimes() > 1) {
                        i = R.string.cannot_connect_camera_twice;
                    } else {
                        i = R.string.cannot_connect_camera_once;
                    }
                    Util.showErrorAndFinish(activity, i);
                    this.mActivity.showErrorDialog();
                }
                if (this.mCameraDisabled && this.mActivity.couldShowErrorDialog()) {
                    DataRepository.dataItemGlobal().setRetriedIfCameraError(false);
                    Util.showErrorAndFinish(this.mActivity, R.string.camera_disabled);
                    this.mActivity.showErrorDialog();
                }
            } else {
                Log.e("BaseModule", "onCameraException: retry1");
                DataRepository.dataItemGlobal().setRetriedIfCameraError(true);
                this.mActivity.onModeSelected(StartControl.create(this.mModuleIndex).setNeedViewAnimation(false).setNeedBlurAnimation(false).setNeedReConfigureCamera(true));
                return;
            }
        }
        sendOpenFailMessage();
    }

    protected void sendOpenFailMessage() {
    }

    protected boolean hasCameraException() {
        return (this.mCameraDisabled || this.mOpenCameraFail) ? true : this.mCameraHardwareError;
    }

    public void requestRender() {
    }

    public void onLongPress(int x, int y) {
    }

    public void onPreviewPixelsRead(byte[] pixels, int width, int height) {
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
    }

    public void onOrientationChanged(int orientation, int orientationCompensation) {
        if (orientation != -1) {
            this.mOrientation = orientation;
            EffectController.getInstance().setOrientation(Util.getShootOrientation(this.mActivity, this.mOrientation));
            checkActivityOrientation();
            if (this.mOrientationCompensation != orientationCompensation) {
                this.mOrientationCompensation = orientationCompensation;
            }
        }
    }

    public void checkActivityOrientation() {
        if (isDeviceAlive() && this.mDisplayRotation != Util.getDisplayRotation(this.mActivity)) {
            checkDisplayOrientation();
        }
    }

    public void checkDisplayOrientation() {
        this.mDisplayRotation = Util.getDisplayRotation(this.mActivity);
        this.mCameraDisplayOrientation = Util.getDisplayOrientation(this.mDisplayRotation, this.mBogusCameraId);
        Log.v("BaseModule", "checkDisplayOrientation: " + this.mDisplayRotation + " | " + this.mCameraDisplayOrientation);
        if (this.mActivity.getCameraScreenNail() != null) {
            this.mActivity.getCameraScreenNail().setDisplayOrientation(this.mDisplayRotation);
        }
    }

    public void onStop() {
    }

    public void onSharedPreferenceChanged() {
    }

    public void preTransferOrientation(int orientation, int orientationCompensation) {
        this.mOrientation = orientation;
        this.mOrientationCompensation = orientationCompensation;
    }

    public String getString(int resId) {
        return CameraAppImpl.getAndroidContext().getString(resId);
    }

    public Resources getResources() {
        return this.mActivity.getResources();
    }

    public Window getWindow() {
        return this.mActivity.getWindow();
    }

    protected boolean handleVolumeKeyEvent(boolean up, boolean pressed, int repeatCount) {
        if (!isAlive()) {
            return true;
        }
        String function = DataRepository.dataItemGlobal().getString("pref_camera_volumekey_function_key", getString(R.string.pref_camera_volumekey_function_default));
        if (function.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_shutter))) {
            performVolumeKeyClicked(repeatCount, pressed);
            return true;
        } else if (ModuleManager.isPanoramaModule() || !function.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_zoom)) || !isZoomSupported() || !pressed) {
            return false;
        } else {
            if (!isZoomEnabled()) {
                return true;
            }
            boolean zoomChanged;
            if (up) {
                zoomChanged = addZoom(0.1f);
            } else {
                zoomChanged = addZoom(-0.1f);
            }
            if (repeatCount == 0 && zoomChanged) {
                CameraStatUtil.trackZoomAdjusted("音量键");
            }
            return true;
        }
    }

    protected void initializeCapabilities() {
        this.mAeLockSupported = this.mCameraCapabilities.isAELockSupported();
        this.mAwbLockSupported = this.mCameraCapabilities.isAWBLockSupported();
        this.mFocusAreaSupported = this.mCameraCapabilities.isAFRegionSupported();
        this.mMeteringAreaSupported = this.mCameraCapabilities.isAERegionSupported();
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
        initializeZoom();
    }

    private void initializeZoom() {
        this.mZoomSupported = this.mCameraCapabilities.isZoomSupported();
        if (this.mZoomSupported) {
            this.mZoomMaxRatio = this.mCameraCapabilities.getMaxZoomRatio();
            Log.d("BaseModule", "zoomMaxRatio: " + this.mZoomMaxRatio);
        }
    }

    protected boolean addZoom(float add) {
        return onZoomValueChanged(this.mZoomValue + add);
    }

    public void enableCameraControls(boolean enable) {
        setIgnoreTouchEvent(enable ^ 1);
    }

    public void exitMutexMode(int mode) {
    }

    public void enterMutexMode(int mode) {
    }

    public MutexModeManager getMutexModePicker() {
        return this.mMutexModePicker;
    }

    /* JADX WARNING: Missing block: B:4:0x000c, code:
            return;
     */
    protected void playCameraSound(int r2) {
        /*
        r1 = this;
        r0 = r1.mActivity;
        if (r0 == 0) goto L_0x000c;
    L_0x0004:
        r0 = r1.mActivity;
        r0 = r0.isActivityPaused();
        if (r0 == 0) goto L_0x000d;
    L_0x000c:
        return;
    L_0x000d:
        r0 = com.android.camera.CameraSettings.isCameraSoundOpen();
        if (r0 == 0) goto L_0x0018;
    L_0x0013:
        r0 = r1.mActivity;
        r0.playCameraSound(r2);
    L_0x0018:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.BaseModule.playCameraSound(int):void");
    }

    public static int getPreferencesLocalId(int cameraId, int mode) {
        return cameraId + mode;
    }

    protected final boolean isFrontCamera() {
        return this.mBogusCameraId == Camera2DataContainer.getInstance().getFrontCameraId();
    }

    protected final boolean isBackCamera() {
        return this.mBogusCameraId == Camera2DataContainer.getInstance().getMainBackCameraId();
    }

    protected final boolean isDualCamera() {
        if (this.mActualCameraId == Camera2DataContainer.getInstance().getMuxCameraId() || this.mActualCameraId == Camera2DataContainer.getInstance().getBokehCameraId()) {
            return true;
        }
        return false;
    }

    public boolean isInTapableRect(int x, int y) {
        if (this.mDisplayRect == null) {
            return false;
        }
        return getTapableRectWithEdgeSlop().contains(x, y);
    }

    protected void mapTapCoordinate(Object object) {
        if (object instanceof Point) {
            Point point = (Point) object;
            point.x -= this.mDisplayRect.left;
            Point point2 = (Point) object;
            point2.y -= this.mDisplayRect.top;
        } else if (object instanceof RectF) {
            RectF rectF = (RectF) object;
            rectF.left -= (float) this.mDisplayRect.left;
            rectF = (RectF) object;
            rectF.right -= (float) this.mDisplayRect.left;
            rectF = (RectF) object;
            rectF.top -= (float) this.mDisplayRect.top;
            RectF rectF2 = (RectF) object;
            rectF2.bottom -= (float) this.mDisplayRect.top;
        }
    }

    private Rect getTapableRectWithEdgeSlop() {
        int edgeSlop;
        Rect rect = new Rect(this.mDisplayRect);
        if (!isVideoRecording()) {
            switch (this.mUIStyle) {
                case 1:
                    rect.bottom -= CameraSettings.BOTTOM_CONTROL_HEIGHT - Util.sNavigationBarHeight;
                    break;
                case 3:
                    rect.bottom -= CameraSettings.BOTTOM_CONTROL_HEIGHT;
                    break;
                default:
                    if (this.mModuleIndex == 165) {
                        int bottomCoverHeight = (((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2;
                        rect.top = ((Util.sWindowHeight - CameraSettings.BOTTOM_CONTROL_HEIGHT) - Util.sWindowWidth) - bottomCoverHeight;
                        rect.bottom -= bottomCoverHeight;
                        break;
                    }
                    break;
            }
        }
        int defaultSlop = Util.calculateDefaultPreviewEdgeSlop(this.mActivity);
        int fromProp = SystemProperties.getInt("camera_touch_edge_slop", -1);
        if (fromProp == -1) {
            edgeSlop = defaultSlop;
        } else {
            edgeSlop = Util.dpToPixel((float) fromProp);
        }
        rect.inset(edgeSlop, edgeSlop);
        return rect;
    }

    private boolean onZoomValueChanged(float value) {
        return onZoomValueChanged(value, false);
    }

    private boolean onZoomValueChanged(float newValue, boolean sync) {
        if (isDeviceAlive()) {
            if (newValue < 1.0f) {
                newValue = 1.0f;
            } else if (newValue > this.mZoomMaxRatio) {
                newValue = this.mZoomMaxRatio;
            }
            if (this.mZoomValue == newValue) {
                return false;
            }
            boolean zoomStateChanged = this.mZoomValue != 1.0f ? newValue == 1.0f : true;
            setZoomValue(newValue);
            if (zoomStateChanged) {
                updatePreferenceTrampoline(11, 34, 30, 20);
            }
            updatePreferenceInWorkThread(24);
            ModeProtocol$DualController dualController = (ModeProtocol$DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
            if (dualController == null || !dualController.isZoomVisible()) {
                updateStatusBar(2);
            } else {
                dualController.updateZoomValue();
            }
            Log.d(getClass().getSimpleName(), "zoom=" + newValue);
            return true;
        }
        Log.v("BaseModule", "onZoomValueChanged isDeviceAlive() = " + isDeviceAlive());
        return false;
    }

    protected void updateStatusBar(int type) {
        ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertUpdateValue(type);
    }

    @WorkerThread
    protected void setZoomValue(float value) {
        this.mZoomValue = value;
        CameraSettings.writeZoom(value);
    }

    protected float getZoomValue() {
        return this.mZoomValue;
    }

    public float getZoomMaxRatio() {
        return this.mZoomMaxRatio;
    }

    public void notifyError() {
        this.mCameraHardwareError = true;
        setCameraState(0);
        if (this.mActivity.isActivityPaused()) {
            this.mActivity.finish();
        } else {
            onCameraException();
        }
    }

    public boolean isNeedMute() {
        return CameraSettings.isCameraSoundOpen() ^ 1;
    }

    public boolean isShowCaptureButton() {
        return false;
    }

    public boolean isShowAeAfLockIndicator() {
        return false;
    }

    public boolean isSupportFocusShoot() {
        return false;
    }

    public boolean isMeteringAreaOnly() {
        return false;
    }

    protected int getCameraRotation() {
        return 0;
    }

    protected void performVolumeKeyClicked(int repeatCount, boolean pressed) {
    }

    public void onSingleTapUp(int x, int y) {
    }

    public boolean onGestureTrack(RectF rectF, boolean up) {
        return true;
    }

    public boolean isKeptBitmapTexture() {
        return false;
    }

    protected int getScreenDelay() {
        return (this.mActivity == null || this.mActivity.startFromKeyguard()) ? 30000 : 60000;
    }

    public void onSaveInstanceState(Bundle outState) {
        outState.putInt("killed-moduleIndex", ModuleManager.getActiveModuleIndex());
    }

    protected void updateCameraScreenNailSize(int previewWidth, int previewHeight) {
        Log.d(getClass().getSimpleName(), "updateCameraScreenNailSize: " + previewWidth + "x" + previewHeight);
        if (!(this.mActivity.getCameraScreenNail().getWidth() == previewWidth && this.mActivity.getCameraScreenNail().getHeight() == previewHeight && !isSquareModeChange())) {
            this.mActivity.getCameraScreenNail().setPreviewSize(previewWidth, previewHeight);
        }
        if (3 == this.mMainProtocol.getActiveIndicator()) {
            this.mMainProtocol.setPreviewSize(previewWidth, previewHeight);
        }
    }

    protected void onCameraOpened() {
        initializeCapabilities();
        this.mCamera2Device.setMetaDataCallback(this);
        updateLensDirtyDetect(false);
    }

    public void onCameraMetaData(CaptureResult result) {
        if (Device.isSupportLensDirtyDetect() && CaptureResultParser.isLensDirtyDetected(result) && CameraSettings.isLensDirtyDetectEnabled()) {
            if (CameraSettings.shouldShowLensDirtyDetectHint()) {
                this.mActivity.showLensDirtyDetectedHint();
            }
            if (this.mLensDirtyDetectDisposable != null) {
                this.mLensDirtyDetectDisposable.dispose();
            }
            Completable.complete().observeOn(GlobalConstant.sCameraSetupScheduler).doOnComplete(new Action() {
                public void run() {
                    CameraSettings.addLensDirtyDetectedTimes();
                    BaseModule.this.updateLensDirtyDetect(true);
                }
            }).subscribe();
            this.mLensDirtyDetectHintDisposable = Completable.complete().delay(8000, TimeUnit.MILLISECONDS, GlobalConstant.sCameraSetupScheduler).doOnComplete(new Action() {
                public void run() {
                    if (BaseModule.this.mActivity != null) {
                        BaseModule.this.mActivity.hideLensDirtyDetectedHint();
                    }
                }
            }).subscribe();
        }
    }

    protected void changeConflictPreference() {
        if (CameraSettings.isStereoModeOn()) {
            List<String> keys = getSupportedSettingKeys();
            if (keys != null) {
                ProviderEditor editor = DataRepository.dataItemConfig().editor();
                for (String key : keys) {
                    if (CameraSettings.isSwitchOn(key)) {
                        editor.remove(key);
                    }
                }
                editor.apply();
            }
        }
    }

    protected boolean isSquareModeChange() {
        boolean z;
        boolean isSquareModule = ModuleManager.isSquareModule();
        if (this.mActivity.getCameraScreenNail().getRenderTargetRatio() == 2) {
            z = true;
        } else {
            z = false;
        }
        if (isSquareModule != z) {
            return true;
        }
        return false;
    }

    protected void updateTipMessage(int tipType, @StringRes int stringResId, int duration) {
        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showTips(tipType, stringResId, duration);
    }

    protected void hideTipMessage(@StringRes int tokenResId) {
        ModeProtocol$BottomPopupTips tips = (ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (tips == null) {
            return;
        }
        if (tokenResId <= 0 || tips.containTips(tokenResId)) {
            tips.directlyHideTips();
        }
    }

    protected void updateAntiBanding(String value) {
        if (isDeviceAlive()) {
            int antiBandingMode = Util.parseInt(value, 3);
            if (Util.isSupported(antiBandingMode, this.mCameraCapabilities.getSupportedAntiBandingModes())) {
                Log.d("BaseModule", "antiBanding: " + value);
                this.mCamera2Device.setAntiBanding(antiBandingMode);
            }
        }
    }

    protected final void updateExposureMeteringMode() {
        if (isDeviceAlive()) {
            this.mCamera2Device.setExposureMeteringMode(CameraSettings.getExposureMeteringMode());
        }
    }

    @CallSuper
    protected void restoreBottom() {
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        ((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        if (baseDelegate.getActiveFragment(R.id.bottom_action) != 241) {
            baseDelegate.delegateEvent(7);
        }
    }

    @CallSuper
    public void resetMutexModeManually() {
        this.mMutexModePicker.resetMutexMode();
    }

    void trackGeneralInfo(int takenNum, boolean isBurst) {
        CameraStatUtil.trackGeneralInfo(takenNum, isBurst, this.mModuleIndex, getTriggerMode(), isFrontCamera(), this.mMutexModePicker, this.mFlashAutoModeState);
    }

    void trackPictureTaken(int takenNum, boolean burst, boolean location) {
        CameraStatUtil.trackPictureTaken(takenNum, burst, this.mModuleIndex, isFrontCamera(), location);
        trackModeCustomInfo(takenNum);
    }

    protected void trackModeCustomInfo(int takenNum) {
    }

    protected int getTriggerMode() {
        return this.mTriggerMode;
    }

    protected void setTriggerMode(int mode) {
        this.mTriggerMode = mode;
    }

    public void setCameraDevice(Camera2Proxy cameraDevice) {
        this.mCamera2Device = cameraDevice;
        this.mCameraCapabilities = cameraDevice.getCapabilities();
        this.mActualCameraId = cameraDevice.getId();
    }

    public Camera2Proxy getCameraDevice() {
        return this.mCamera2Device;
    }

    public int getActualCameraId() {
        return this.mActualCameraId;
    }

    public CameraCapabilities getCameraCapabilities() {
        return this.mCameraCapabilities;
    }

    public CameraSize getPreviewSize() {
        return this.mPreviewSize;
    }

    protected CameraSize getJpegThumbnailSize() {
        return Util.getOptimalJpegThumbnailSize(this.mCameraCapabilities.getSupportedThumbnailSizes(), ((double) this.mPreviewSize.getWidth()) / ((double) this.mPreviewSize.getHeight()));
    }

    public static int getJpegQuality(boolean burst) {
        return JpegEncodingQualityMappings.getQualityNumber(CameraSettings.getJpegQuality(burst));
    }

    @WorkerThread
    public final void updatePreferenceInWorkThread(@UpdateType int... updateTypes) {
        if (!this.mUpdateWorkThreadDisposable.isDisposed()) {
            this.mUpdateWorkThreadEmitter.onNext(updateTypes);
        }
    }

    public final void updatePreferenceTrampoline(@UpdateType int... updateTypes) {
        consumePreference(updateTypes);
    }

    protected void consumePreference(@UpdateType int... updateTypes) {
    }

    public void setDisplayRectAndUIStyle(Rect displayRect, int uiStyle) {
        this.mDisplayRect = displayRect;
        this.mUIStyle = uiStyle;
    }

    public void onPreviewLayoutChanged(Rect rect) {
    }

    public void onPreviewSizeChanged(int width, int height) {
    }

    protected int getCameraState() {
        return this.mCameraState;
    }

    protected void setCameraState(int newState) {
        Log.d("BaseModule", "setCameraState: " + newState);
        this.mCameraState = newState;
    }

    protected void updateLensDirtyDetect(boolean resumePreview) {
        if (!resumePreview || !isDoingAction()) {
            this.mCamera2Device.setLensDirtyDetect(CameraSettings.isLensDirtyDetectEnabled());
            if (resumePreview) {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    protected void setFlashMode(String value) {
        if (isDeviceAlive()) {
            Log.d("BaseModule", "flashMode: " + value);
            int flashMode = Util.parseInt(value, 0);
            this.mCamera2Device.setOptimizedFlash(CameraSettings.isOptimizedFlashEnable());
            this.mCamera2Device.setFlashMode(flashMode);
        }
    }

    protected void setFocusMode(String value) {
        if (isDeviceAlive()) {
            int focusMode = AutoFocus.convertToFocusMode(value);
            if (Util.isSupported(focusMode, this.mCameraCapabilities.getSupportedFocusModes())) {
                this.mCamera2Device.setFocusMode(focusMode);
            }
        }
    }

    protected void setAWBMode(String value) {
        if (isDeviceAlive()) {
            if (value.equals("manual")) {
                this.mCamera2Device.setAWBMode(0);
                this.mCamera2Device.setCustomAWB(CameraSettings.getKValue());
            } else {
                int awbMode = Util.parseInt(value, 1);
                if (Util.isSupported(awbMode, this.mCameraCapabilities.getSupportedAWBModes())) {
                    this.mCamera2Device.setAWBMode(awbMode);
                } else {
                    this.mCamera2Device.setAWBMode(1);
                }
            }
        }
    }

    protected void setZoomRatio(float zoomRatio) {
        this.mCamera2Device.setZoomRatio(zoomRatio);
    }

    protected void focusCenter() {
    }

    protected Rect getCropRegion() {
        Rect activeArraySize = this.mCameraCapabilities.getActiveArraySize();
        Rect activeRegion = activeArraySize;
        int xCenter = activeArraySize.width() / 2;
        int yCenter = activeArraySize.height() / 2;
        int xDelta = (int) (((float) activeArraySize.width()) / (this.mZoomValue * 2.0f));
        int yDelta = (int) (((float) activeArraySize.height()) / (this.mZoomValue * 2.0f));
        new Rect().set(xCenter - xDelta, yCenter - yDelta, xCenter + xDelta, yCenter + yDelta);
        return activeArraySize;
    }

    public void accept(@UpdateType int[] ints) throws Exception {
        if (!this.mUpdateWorkThreadDisposable.isDisposed() && isDeviceAlive()) {
            consumePreference(ints);
            this.mCamera2Device.resumePreview();
        }
    }

    public boolean isAlive() {
        return isCreated() ? isDeparted() ^ 1 : false;
    }

    public void onBroadcastReceived(Context context, Intent intent) {
    }

    public boolean isDeviceAlive() {
        boolean alive = this.mCamera2Device != null ? isAlive() : false;
        if (!alive) {
            String str = "device: %s module: %s|%s";
            Object[] objArr = new Object[3];
            objArr[0] = this.mCamera2Device != null ? "valid" : "invalid";
            objArr[1] = isCreated() ? "created" : "destroyed";
            objArr[2] = isDeparted() ? "departed" : "alive";
            String msg = String.format(str, objArr);
            if (DEBUG) {
                new RuntimeException(msg).printStackTrace();
            } else {
                Log.e("BaseModule", Util.getCallers(1) + "|" + msg);
            }
        }
        return alive;
    }

    protected final void restartModule() {
        this.mActivity.onModeSelected(StartControl.create(this.mModuleIndex).setNeedReConfigureView(false).setNeedViewAnimation(false).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }
}
