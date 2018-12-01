package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IPowerManager;
import android.os.IPowerManager.Stub;
import android.os.Message;
import android.os.ServiceManager;
import android.support.v4.app.ActivityCompat.OnRequestPermissionsResultCallback;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v7.recyclerview.R;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.TextView;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.effect.EffectController;
import com.android.camera.fragment.BaseFragmentDelegate;
import com.android.camera.fragment.dialog.AiSceneNewbieDialogFragment;
import com.android.camera.fragment.dialog.FrontRotateNewbieDialogFragment;
import com.android.camera.fragment.dialog.HibernationFragment;
import com.android.camera.fragment.dialog.LensDirtyDetectDialogFragment;
import com.android.camera.fragment.dialog.PortraitNewbieDialogFragment;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.VideoBase;
import com.android.camera.module.impl.ImplFactory;
import com.android.camera.module.loader.FunctionCameraLegacySetup;
import com.android.camera.module.loader.FunctionCameraPrepare;
import com.android.camera.module.loader.FunctionDataSetup;
import com.android.camera.module.loader.FunctionModuleSetup;
import com.android.camera.module.loader.FunctionResumeModule;
import com.android.camera.module.loader.FunctionUISetup;
import com.android.camera.module.loader.NullHolder;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.android.camera.module.loader.camera2.Camera2OpenOnSubScribe;
import com.android.camera.module.loader.camera2.Camera2Result;
import com.android.camera.module.loader.camera2.CompletablePreFixCamera2Setup;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.ImageSaver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.CameraRootView;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera.ui.V6GestureRecognizer;
import com.android.camera.ui.V9EdgeShutterView;
import com.sensetime.stmobile.STCommon;
import io.reactivex.Completable;
import io.reactivex.Single;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import java.util.Locale;
import miui.hardware.display.DisplayFeatureManager;

public class Camera extends ActivityBase implements OnRequestPermissionsResultCallback, BaseLifecycleListener, ModeProtocol$BaseProtocol {
    private static final String TAG = Camera.class.getSimpleName();
    private BaseFragmentDelegate mBaseFragmentDelegate;
    private Camera2OpenOnSubScribe mCamera2OpenOnSubScribe;
    private BiFunction mCameraOpenResult = new BiFunction<NullHolder<BaseModule>, Camera2Result, NullHolder<BaseModule>>() {
        public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> baseModuleNullHolder, @NonNull Camera2Result camera2Result) throws Exception {
            switch (camera2Result.getResult()) {
                case 3:
                    ((BaseModule) baseModuleNullHolder.get()).setDeparted();
                    Camera.this.showCameraError(camera2Result.getCameraError());
                    break;
            }
            return baseModuleNullHolder;
        }
    };
    private Disposable mCameraPendingSetupDisposable;
    private Consumer<NullHolder<BaseModule>> mCameraSetupConsumer = new Consumer<NullHolder<BaseModule>>() {
        public void accept(@NonNull NullHolder<BaseModule> baseModuleNullHolder) throws Exception {
            if (baseModuleNullHolder.isPresent()) {
                V6GestureRecognizer.getInstance(Camera.this).setCurrentModule((Module) baseModuleNullHolder.get());
            } else {
                Camera.this.showCameraError(baseModuleNullHolder.getException());
                Camera.this.mCurrentModule = null;
            }
            Camera.this.getCameraScreenNail().resetFrameAvailableFlag();
            Camera.this.setSwitchingModule(false);
            Camera.this.mCameraSetupDisposable = null;
            DataRepository.dataCloudMgr().fillCloudValues();
            AutoLockManager.getInstance(Camera.this).hibernateDelayed();
            Camera.this.showFirstUseHintIfNeeded();
            Log.d(Camera.TAG, "cameraSetupConsumer#accept switch module done.");
        }
    };
    private Disposable mCameraSetupDisposable;
    private LogThread mDebugThread;
    private boolean mDelayReleaseCamera;
    private boolean mDidRegister;
    private DisplayFeatureManager mDisplayFeatureManager;
    private ImageSaver mImageSaver;
    private ImplFactory mImplFactory;
    private int mLastIgnoreKey = -1;
    private long mLastKeyEventTime = 0;
    private MyOrientationEventListener mOrientationListener;
    private IPowerManager mPowerManager;
    private ProximitySensorLock mProximitySensorLock;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (!Camera.this.mCurrentModule.isDeparted()) {
                Camera.this.mCurrentModule.onBroadcastReceived(context, intent);
            }
        }
    };
    private SensorStateManager mSensorStateManager;
    private ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName name, IBinder service) {
        }

        public void onServiceDisconnected(ComponentName name) {
        }
    };
    private StartControl mStartControl;
    private int mTick;
    private Thread mWatchDog;
    private final Runnable tickerRunnable = new Runnable() {
        public void run() {
            Camera.this.mTick = (Camera.this.mTick + 1) % 10;
        }
    };

    class LogThread extends Thread {
        private boolean mRunFlag = true;

        LogThread() {
        }

        public void setRunFlag(boolean run) {
            this.mRunFlag = run;
        }

        public void run() {
            while (this.mRunFlag) {
                try {
                    Thread.sleep(10);
                    if (!Camera.this.isActivityPaused()) {
                        Camera.this.mHandler.obtainMessage(0, Util.getDebugInfo()).sendToTarget();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return;
                }
            }
        }
    }

    private class MyOrientationEventListener extends OrientationEventListener {
        public MyOrientationEventListener(Context context) {
            super(context);
        }

        public void onOrientationChanged(int orientation) {
            if (orientation != -1) {
                Camera.this.mOrientation = Util.roundOrientation(orientation, Camera.this.mOrientation);
                int displayRotation = Util.getDisplayRotation(Camera.this);
                if (displayRotation != Camera.this.mDisplayRotation) {
                    Camera.this.mDisplayRotation = displayRotation;
                    Camera.this.onDisplayRotationChanged();
                }
                Camera.this.mOrientationCompensation = (Camera.this.mOrientation + Camera.this.mDisplayRotation) % 360;
                if (Camera.this.mCurrentModule != null) {
                    Camera.this.mCurrentModule.onOrientationChanged(Camera.this.mOrientation, Camera.this.mOrientationCompensation);
                }
                Camera.this.mBaseFragmentDelegate.getAnimationComposite().disposeRotation(Camera.this.mOrientationCompensation);
            }
        }
    }

    private class WatchDogThread extends Thread {
        /* synthetic */ WatchDogThread(Camera this$0, WatchDogThread -this1) {
            this();
        }

        private WatchDogThread() {
        }

        public void run() {
            setName("ANR-WatchDog");
            while (!isInterrupted()) {
                Log.v("WatchDogThread", "watch dog run " + Thread.currentThread().getId());
                int lastTick = Camera.this.mTick;
                Camera.this.mHandler.post(Camera.this.tickerRunnable);
                try {
                    Thread.sleep(5000);
                    if (Camera.this.mTick == lastTick) {
                        CameraSettings.setEdgeMode(Camera.this, false);
                        Camera.this.setBrightnessRampRate(-1);
                        Camera.this.setScreenEffect(false);
                        return;
                    }
                } catch (InterruptedException e) {
                    Log.e("WatchDogThread", "watch dog InterruptedException " + Thread.currentThread().getId());
                    return;
                }
            }
        }
    }

    public void onCreate(Bundle state) {
        Log.d(TAG, "onCreate start");
        this.mApplication = (CameraAppImpl) getApplication();
        ScenarioTrackUtil.trackAppLunchTimeStart(this.mApplication.isApplicationFirstLaunched());
        this.mAppStartTime = System.currentTimeMillis();
        this.mCameraIntentManager = CameraIntentManager.getInstance(getIntent());
        if (CompatibilityUtils.isInMultiWindowMode(this)) {
            super.onCreate(null);
            ToastUtils.showToast((Context) this, (int) R.string.multi_window_mode_not_supported);
            Log.d(TAG, "isInMultiWindowMode call finish");
            finish();
        } else if (!"android.media.action.VOICE_COMMAND".equals(getIntent().getAction()) || CameraIntentManager.checkCallerLegality(this)) {
            boolean isCaptureIntent;
            if (CameraIntentManager.checkCallerLegality(this)) {
                CameraStatUtil.trackVoiceControl(getIntent());
            }
            super.onCreate(state);
            CameraScreenNail cameraScreenNail = null;
            Completable.create(new CompletablePreFixCamera2Setup(null, false, cameraScreenNail, getIntent(), startFromSecureKeyguard(), CameraIntentManager.checkCallerLegality(this))).subscribeOn(GlobalConstant.sCameraSetupScheduler).subscribe();
            if (ProximitySensorLock.enabled() && isFromKeyguard()) {
                if (!Util.isNonUIEnabled() || !getCameraIntentManager().isFromVolumeKey().booleanValue()) {
                    this.mProximitySensorLock = new ProximitySensorLock(this);
                    this.mProximitySensorLock.startWatching();
                } else if (Util.isNonUI()) {
                    CameraStatUtil.track("counter", "pocket_mode_enter", "方式", "NonUI音量键");
                    Log.d(TAG, "Finish from NonUI mode.");
                    finish();
                    return;
                }
            }
            EffectController.releaseInstance();
            setContentView(R.layout.v9_main);
            getWindow().setBackgroundDrawable(null);
            this.mGLView = (V6CameraGLSurfaceView) findViewById(R.id.v6_gl_surface_view);
            this.mDebugInfoView = (TextView) findViewById(R.id.camera_debug_content);
            this.mEdgeShutterView = (V9EdgeShutterView) findViewById(R.id.v9_edge_shutter_view);
            this.mCameraRootView = (CameraRootView) findViewById(R.id.camera_app_root);
            createCameraScreenNail(false, false);
            this.mCamera2OpenOnSubScribe = new Camera2OpenOnSubScribe(this);
            registerProtocol();
            if (!getKeyguardFlag()) {
                PermissionManager.requestCameraRuntimePermissions(this);
            }
            Util.updateCountryIso(this);
            this.mPowerManager = Stub.asInterface(ServiceManager.getService("power"));
            if (Device.isSupportScreenLight()) {
                this.mDisplayFeatureManager = DisplayFeatureManager.getInstance();
            }
            this.mSensorStateManager = new SensorStateManager(this, getMainLooper());
            this.mOrientationListener = new MyOrientationEventListener(this);
            if (getCameraIntentManager().isImageCaptureIntent()) {
                isCaptureIntent = true;
            } else {
                isCaptureIntent = getCameraIntentManager().isVideoCaptureIntent();
            }
            this.mImageSaver = new ImageSaver(this, this.mHandler, isCaptureIntent);
            setTranslucentNavigation(true);
            EffectChangedListenerController.setHoldKey(hashCode());
            showDebug();
            Log.d(TAG, "onCreate end");
        } else {
            Log.e(TAG, "An illegal caller:" + CameraIntentManager.getCaller(this) + " use VOICE_CONTROL_INTENT!");
            super.onCreate(null);
            finish();
        }
    }

    private void showCameraError(int error) {
        if (DataRepository.dataItemGlobal().isRetriedIfCameraError()) {
            int cameraId = Camera2OpenManager.getInstance().getPendingCameraId();
            CameraStatUtil.trackOpenCameraFail(cameraId, "Failed to open camera (id = " + cameraId + ", error = " + error + ")");
            Message msg = Message.obtain();
            msg.what = 10;
            msg.arg1 = error;
            this.mHandler.sendMessage(msg);
            return;
        }
        Log.e(TAG, "onCameraException: retry0");
        DataRepository.dataItemGlobal().setRetriedIfCameraError(true);
        setupCamera(this.mStartControl);
    }

    public ImplFactory getImplFactory() {
        return this.mImplFactory;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.forceDestroy();
        ModeCoordinatorImpl.create(hashCode());
        EffectChangedListenerController.setHoldKey(hashCode());
        this.mImplFactory = new ImplFactory();
        this.mImplFactory.initBase(this, 171);
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        getCameraIntentManager();
        dataItemGlobal.parseIntent(getIntent(), Boolean.valueOf(CameraIntentManager.checkCallerLegality(this)), startFromSecureKeyguard(), false);
        int resetType = 1;
        if (dataItemGlobal.isTimeOut()) {
            resetType = 2;
        }
        onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(resetType));
    }

    public void unRegisterProtocol() {
        if (this.mImplFactory != null) {
            this.mImplFactory.release();
        }
        if (this.mBaseFragmentDelegate != null) {
            this.mBaseFragmentDelegate.unRegisterProtocol();
            this.mBaseFragmentDelegate = null;
        }
        ModeCoordinatorImpl.destroyAll(hashCode());
    }

    public void onLifeStart(String tag) {
        Log.d(TAG, "onLifeStart " + tag);
    }

    public void onLifeAlive() {
        Log.d(TAG, String.format(Locale.ENGLISH, "onLifeAlive module 0x%x, need anim %b, need blur %b need reconfig %b reset type %d", new Object[]{Integer.valueOf(this.mStartControl.mTargetMode), Boolean.valueOf(this.mStartControl.mNeedViewAnimation), Boolean.valueOf(this.mStartControl.mNeedBlurAnimation), Boolean.valueOf(this.mStartControl.mNeedReConfigureCamera), Integer.valueOf(this.mStartControl.mResetType)}));
        setupCamera(this.mStartControl);
    }

    public void onLifeStop(String tag) {
        Log.d(TAG, "onLifeStop " + tag);
    }

    public void onLifeDestroy(String tag) {
        Log.d(TAG, "onLifeDestroy " + tag);
    }

    private void setupCamera(StartControl startControl) {
        closeCameraSetup();
        FunctionCameraPrepare functionCameraPrepare = new FunctionCameraPrepare(startControl.mTargetMode, startControl.mResetType, (BaseModule) this.mCurrentModule);
        FunctionModuleSetup functionModuleSetup = new FunctionModuleSetup(startControl.mTargetMode);
        FunctionDataSetup dataSetup = new FunctionDataSetup(startControl.mTargetMode);
        FunctionUISetup uiSetup = new FunctionUISetup(startControl.mTargetMode, startControl.mNeedReConfigureView);
        this.mCameraSetupDisposable = Single.just(NullHolder.ofNullable(this)).observeOn(GlobalConstant.sCameraSetupScheduler).map(functionCameraPrepare).zipWith(Single.create(this.mCamera2OpenOnSubScribe).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(GlobalConstant.sCameraSetupScheduler), this.mCameraOpenResult).map(functionModuleSetup).map(dataSetup).observeOn(uiSetup.getWorkThread()).map(uiSetup).subscribe(this.mCameraSetupConsumer);
    }

    public void resumeCurrentMode(int currentModuleIndex) {
        closeCameraSetup();
        setSwitchingModule(true);
        FunctionCameraLegacySetup functionCameraLegacySetup = new FunctionCameraLegacySetup(currentModuleIndex);
        this.mCameraSetupDisposable = Single.just(NullHolder.ofNullable((BaseModule) this.mCurrentModule)).observeOn(GlobalConstant.sCameraSetupScheduler).map(functionCameraLegacySetup).zipWith(Single.create(this.mCamera2OpenOnSubScribe).observeOn(GlobalConstant.sCameraSetupScheduler), this.mCameraOpenResult).map(new FunctionResumeModule(currentModuleIndex)).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mCameraSetupConsumer);
    }

    protected void releaseCameraScreenNail() {
        super.releaseCameraScreenNail();
    }

    public boolean isVideoRecording() {
        return isCurrentModuleAlive() ? this.mCurrentModule.isVideoRecording() : false;
    }

    private boolean shouldReleaseLater() {
        return isCurrentModuleAlive() ? this.mCurrentModule.shouldReleaseLater() : false;
    }

    public boolean isCurrentModuleAlive() {
        return this.mCurrentModule != null ? this.mCurrentModule.isCreated() : false;
    }

    private void setTranslucentNavigation(boolean on) {
        if (Util.checkDeviceHasNavigationBar(this)) {
            Window win = getWindow();
            win.getDecorView().setSystemUiVisibility(768);
            win.addFlags(Integer.MIN_VALUE);
        }
    }

    private boolean isFromKeyguard() {
        boolean z = false;
        Intent intent = getIntent();
        if (intent == null) {
            return false;
        }
        if (TextUtils.equals(intent.getAction(), "android.media.action.STILL_IMAGE_CAMERA")) {
            z = getKeyguardFlag();
        }
        return z;
    }

    private void resumeCamera() {
        if (!isSwitchingModule()) {
            if (ModeCoordinatorImpl.isAlive(hashCode())) {
                DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
                int resetType = 1;
                if (this.mJumpedToGallery) {
                    this.mJumpedToGallery = false;
                } else {
                    int lastType = dataItemGlobal.getIntentType();
                    dataItemGlobal.parseIntent(getIntent(), Boolean.valueOf(CameraIntentManager.checkCallerLegality(this)), startFromSecureKeyguard(), false);
                    int currentType = dataItemGlobal.getIntentType();
                    if (lastType != 0) {
                        boolean captureFinish = this.mBaseFragmentDelegate.getActiveFragment(R.id.bottom_action) == 4083;
                        if (lastType == currentType && captureFinish) {
                            resumeCurrentMode(dataItemGlobal.getCurrentMode());
                            return;
                        } else if (captureFinish) {
                            this.mBaseFragmentDelegate.delegateEvent(6);
                        }
                    } else if (this.mDelayReleaseCamera) {
                        this.mDelayReleaseCamera = false;
                        return;
                    }
                    if (dataItemGlobal.isTimeOut()) {
                        resetType = 2;
                    }
                }
                if (isCurrentModuleAlive()) {
                    this.mCurrentModule.onStop();
                    this.mCurrentModule.onDestroy();
                }
                onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(resetType));
            } else {
                unRegisterProtocol();
                registerProtocol();
            }
        }
    }

    protected void onNewIntent(Intent intent) {
        Log.d(TAG, "onNewIntent start");
        setIntent(intent);
        super.onNewIntent(intent);
        this.mCameraIntentManager.destroy();
        this.mCameraIntentManager = CameraIntentManager.getInstance(intent);
        this.mJumpedToGallery = false;
        resumeCamera();
        Log.d(TAG, "onNewIntent end");
    }

    public void onResume() {
        boolean isCaptureIntent;
        Log.d(TAG, "onResume start");
        if (getKeyguardFlag() && (PermissionManager.checkCameraLaunchPermissions() ^ 1) != 0) {
            finish();
        }
        if (Util.sIsFullScreenNavBarHidden != Util.isFullScreenNavBarHidden(this)) {
            Util.initialize(this);
        }
        AutoLockManager.getInstance(this).onResume();
        if (this.mProximitySensorLock != null) {
            this.mProximitySensorLock.onResume();
        }
        CameraStat.recordPageStart(this, "CameraActivity");
        Util.checkLockedOrientation(this);
        this.mActivityPaused = false;
        switchEdgeFingerMode(true);
        Storage.initStorage(this);
        this.mOrientationListener.enable();
        super.onResume();
        if (getScreenHint() != null) {
            getScreenHint().updateHint();
        }
        registerReceiver();
        resumeCamera();
        setBlurFlag(false);
        if (getCameraIntentManager().isImageCaptureIntent()) {
            isCaptureIntent = true;
        } else {
            isCaptureIntent = getCameraIntentManager().isVideoCaptureIntent();
        }
        this.mImageSaver.onHostResume(isCaptureIntent);
        Log.d(TAG, "onResume end");
        bindGalleryService();
    }

    protected void onRestart() {
        super.onRestart();
        ScenarioTrackUtil.trackAppLunchTimeStart(false);
        this.mAppStartTime = System.currentTimeMillis();
    }

    public void resume() {
        if (!isVideoRecording()) {
            super.resume();
        }
    }

    public void pause() {
        if (!isVideoRecording()) {
            super.pause();
        }
    }

    public void onPause() {
        Log.d(TAG, "onPause start");
        this.mAppStartTime = 0;
        this.mActivityPaused = true;
        switchEdgeFingerMode(false);
        this.mOrientationListener.disable();
        AutoLockManager.getInstance(this).onPause();
        hideHibernationFragment();
        closeCameraSetup();
        setBrightnessRampRate(-1);
        setScreenEffect(false);
        setSwitchingModule(false);
        getWindow().clearFlags(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
        if (this.mDidRegister) {
            unregisterReceiver(this.mReceiver);
            this.mDidRegister = false;
        }
        super.onPause();
        if (getScreenHint() != null) {
            getScreenHint().cancelHint();
        }
        if (this.mCameraRootView != null) {
            this.mCameraRootView.enableTouchEvent();
        }
        this.mImageSaver.onHostPause();
        CameraStat.recordPageEnd();
        this.mDelayReleaseCamera = false;
        if (isGotoGallery() || shouldReleaseLater()) {
            this.mDelayReleaseCamera = true;
        } else {
            releaseAll(false);
        }
        Log.d(TAG, "onPause end");
        unbindGalleryService();
    }

    public void onStop() {
        Log.d(TAG, "onStop start");
        super.onStop();
        if (this.mDelayReleaseCamera) {
            if (isGotoGallery()) {
                this.mDelayReleaseCamera = false;
                releaseAll(true);
            } else if (isVideoRecording()) {
                ((VideoBase) this.mCurrentModule).stopVideoRecording(true, true);
            }
        }
        Log.d(TAG, "onStop end");
    }

    public void onDestroy() {
        Log.d(TAG, "onDestroy start");
        super.onDestroy();
        AutoLockManager.removeInstance(this);
        closeCameraSetup();
        unRegisterProtocol();
        if (this.mDelayReleaseCamera) {
            this.mDelayReleaseCamera = false;
            releaseAll(true);
        }
        if (this.mImageSaver != null) {
            this.mImageSaver.onHostDestroy();
        }
        if (this.mSensorStateManager != null) {
            this.mSensorStateManager.onDestroy();
        }
        this.mPowerManager = null;
        this.mDisplayFeatureManager = null;
        V6GestureRecognizer.onDestroy(this);
        EffectChangedListenerController.removeEffectChangedListenerMap(hashCode());
        if (this.mDebugThread != null) {
            this.mDebugThread.setRunFlag(false);
        }
        if (this.mProximitySensorLock != null) {
            this.mProximitySensorLock.destroy();
        }
        if (this.mCameraIntentManager != null) {
            this.mCameraIntentManager.destroy();
            this.mCameraIntentManager = null;
        }
        if (getScreenHint() != null) {
            getScreenHint().dismissSystemChoiceDialog();
        }
        CameraIntentManager.removeAllInstance();
        Log.d(TAG, "onDestroy end");
    }

    private Module createNewModule(int newMode) {
        Module module = ModuleManager.getModuleByIndex(newMode);
        if (module == null) {
            throw new RuntimeException("invalid module index " + newMode);
        }
        module.setActivity(this);
        module.preTransferOrientation(this.mOrientation, this.mOrientationCompensation);
        return module;
    }

    public void releaseAll(boolean isLaterRelease) {
        this.mDelayReleaseCamera = false;
        if (this.mCurrentModule != null) {
            this.mCurrentModule.setDeparted();
        }
        GlobalConstant.sCameraSetupScheduler.scheduleDirect(new Runnable() {
            public void run() {
                if (Camera.this.isCurrentModuleAlive()) {
                    Module module = Camera.this.mCurrentModule;
                    DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), DataRepository.dataItemGlobal().getDataBackUpKey(Camera.this.getCurrentModuleIndex()), DataRepository.dataItemGlobal().getCurrentCameraId(), false);
                    if (ModeCoordinatorImpl.isAlive(Camera.this.hashCode())) {
                        module.unRegisterProtocol();
                    }
                    module.onPause();
                    module.onStop();
                    module.onDestroy();
                }
                Camera2OpenManager.getInstance().release(false);
                Camera.this.releaseCameraScreenNail();
                DataRepository.dataItemGlobal().resetTimeOut();
            }
        });
    }

    public void onBackPressed() {
        Log.d(TAG, "onBackPressed");
        if (!isCurrentModuleAlive() || (this.mCurrentModule.onBackPressed() ^ 1) != 0) {
            super.onBackPressed();
        }
    }

    public boolean dispatchKeyEvent(KeyEvent event) {
        if (this.mProximitySensorLock == null || !this.mProximitySensorLock.intercept(event)) {
            return super.dispatchKeyEvent(event);
        }
        return true;
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (event.getRepeatCount() == 0 && (keyCode == 66 || keyCode == 27 || keyCode == 88 || keyCode == 87 || keyCode == 24 || keyCode == 25)) {
            if (Util.isTimeout(event.getEventTime(), this.mLastKeyEventTime, 150)) {
                this.mLastIgnoreKey = -1;
            } else {
                this.mLastIgnoreKey = keyCode;
                return true;
            }
        } else if (event.getRepeatCount() > 0 && keyCode == this.mLastIgnoreKey) {
            this.mLastIgnoreKey = -1;
        }
        if (isCurrentModuleAlive()) {
            boolean z;
            if (this.mCurrentModule.onKeyDown(keyCode, event)) {
                z = true;
            } else {
                z = super.onKeyDown(keyCode, event);
            }
            return z;
        }
        switch (keyCode) {
            case 24:
            case 25:
            case 27:
            case 66:
            case 80:
            case 87:
            case 88:
                return true;
            default:
                return super.onKeyDown(keyCode, event);
        }
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        boolean z = true;
        if (keyCode == this.mLastIgnoreKey) {
            this.mLastKeyEventTime = 0;
            this.mLastIgnoreKey = -1;
            return true;
        }
        this.mLastKeyEventTime = event.getEventTime();
        if (!isCurrentModuleAlive()) {
            return super.onKeyUp(keyCode, event);
        }
        if (!this.mCurrentModule.onKeyUp(keyCode, event)) {
            z = super.onKeyUp(keyCode, event);
        }
        return z;
    }

    public void onWindowFocusChanged(boolean hasFocus) {
        Log.d(TAG, "onWindowFocusChanged hasFocus->" + hasFocus);
        super.onWindowFocusChanged(hasFocus);
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onWindowFocusChanged(hasFocus);
            if (this.mCameraBrightness != null) {
                this.mCameraBrightness.onWindowFocusChanged(hasFocus);
            }
            if (hasFocus) {
                Util.checkLockedOrientation(this);
                this.mCurrentModule.checkActivityOrientation();
                if (this.mSensorStateManager != null) {
                    this.mSensorStateManager.register();
                }
            } else if (this.mSensorStateManager != null) {
                this.mSensorStateManager.unregister(15);
            }
        }
    }

    public boolean dispatchTouchEvent(MotionEvent event) {
        boolean z = true;
        if (this.mProximitySensorLock != null && this.mProximitySensorLock.active()) {
            return true;
        }
        if (this.mCurrentModule == null || this.mActivityPaused) {
            return super.dispatchTouchEvent(event);
        }
        if (!super.dispatchTouchEvent(event)) {
            z = V6GestureRecognizer.getInstance(this).onTouchEvent(event);
        }
        return z;
    }

    public boolean onEdgeTouchEvent(MotionEvent event) {
        if (Device.isSupportedEdgeTouch()) {
            return V6GestureRecognizer.getInstance(this).onEdgeTouchEvent(event);
        }
        return true;
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        AutoLockManager.getInstance(this).onUserInteraction();
    }

    public int getCurrentModuleIndex() {
        return isCurrentModuleAlive() ? this.mCurrentModule.getModuleIndex() : 160;
    }

    public void onModeSelected(StartControl startControl) {
        CameraPerformanceTracker.onEvent(3);
        int currentModuleId = getCurrentModuleIndex();
        Log.d(TAG, String.format(Locale.ENGLISH, "onModeSelected from 0x%x to 0x%x", new Object[]{Integer.valueOf(currentModuleId), Integer.valueOf(startControl.mTargetMode)}));
        if (!(currentModuleId == 160 || (CameraStatUtil.modeIdToName(currentModuleId).equals(CameraStatUtil.modeIdToName(startControl.mTargetMode)) ^ 1) == 0)) {
            ScenarioTrackUtil.trackSwitchModeStart(currentModuleId, startControl.mTargetMode, CameraSettings.isFrontCamera());
        }
        closeCameraSetup();
        this.mStartControl = startControl;
        ModuleManager.setActiveModuleIndex(startControl.mTargetMode);
        if (startControl.mNeedReConfigureCamera) {
            if (this.mBaseFragmentDelegate != null) {
                this.mBaseFragmentDelegate.getAnimationComposite().setClickEnable(false);
            }
            setSwitchingModule(true);
            if (!isCurrentModuleAlive()) {
                startControl.mNeedBlurAnimation = false;
                getWindow().clearFlags(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
            }
            V6GestureRecognizer.getInstance(this).setCurrentModule(null);
            BaseModule lastModule = this.mCurrentModule;
            if (lastModule != null) {
                lastModule.setDeparted();
            }
            this.mCurrentModule = createNewModule(startControl.mTargetMode);
            if (this.mBaseFragmentDelegate == null) {
                this.mBaseFragmentDelegate = new BaseFragmentDelegate(this);
                this.mBaseFragmentDelegate.init(getSupportFragmentManager(), startControl.mTargetMode, this);
            } else {
                this.mCameraPendingSetupDisposable = this.mBaseFragmentDelegate.delegateMode(Completable.create(new CompletablePreFixCamera2Setup(lastModule, startControl.mNeedBlurAnimation, getCameraScreenNail(), null, startFromSecureKeyguard(), CameraIntentManager.checkCallerLegality(this))).subscribeOn(GlobalConstant.sCameraSetupScheduler), startControl, this);
            }
            return;
        }
        this.mBaseFragmentDelegate.delegateMode(null, startControl, null);
    }

    private void onDisplayRotationChanged() {
        if (Device.isFrontCameraAtBottom()) {
            FrontRotateNewbieDialogFragment dialogFragment = (FrontRotateNewbieDialogFragment) getSupportFragmentManager().findFragmentByTag("RotateHint");
            if (dialogFragment != null) {
                dialogFragment.animateOut(0);
            }
        }
    }

    public ImageSaver getImageSaver() {
        return this.mImageSaver;
    }

    public SensorStateManager getSensorStateManager() {
        return this.mSensorStateManager;
    }

    public void setBlurFlag(boolean blurred) {
    }

    public boolean isStable() {
        return this.mSensorStateManager.isStable();
    }

    public int getCapturePosture() {
        return this.mSensorStateManager.getCapturePosture();
    }

    private void switchEdgeFingerMode(boolean enable) {
        if (Device.isSupportedEdgeTouch()) {
            CameraSettings.setEdgeMode(this, enable);
            if (enable) {
                this.mWatchDog = new WatchDogThread(this, null);
                this.mWatchDog.start();
            } else if (this.mWatchDog != null) {
                this.mWatchDog.interrupt();
                this.mWatchDog = null;
            }
        }
    }

    private void showDebug() {
        if (Util.isShowDebugInfo()) {
            if (this.mDebugInfoView != null) {
                this.mDebugInfoView.setVisibility(0);
            }
            this.mDebugThread = new LogThread();
            this.mDebugThread.start();
        }
    }

    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == PermissionManager.getCameraRuntimePermissionRequestCode()) {
            if (!PermissionManager.isCameraLaunchPermissionsResultReady(permissions, grantResults)) {
                finish();
            }
            if (!isActivityPaused() && PermissionManager.isCameraLocationPermissionsResultReady(permissions, grantResults)) {
                LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
            }
        }
    }

    public void changeRequestOrientation() {
        if (Device.isFrontCameraAtBottom()) {
            if (CameraSettings.isFrontCamera()) {
                setRequestedOrientation(7);
            } else {
                setRequestedOrientation(1);
            }
        }
    }

    private boolean closeCameraSetup() {
        if (!(this.mCameraPendingSetupDisposable == null || (this.mCameraPendingSetupDisposable.isDisposed() ^ 1) == 0)) {
            this.mCameraPendingSetupDisposable.dispose();
            this.mCameraPendingSetupDisposable = null;
        }
        if (this.mCameraSetupDisposable == null || (this.mCameraSetupDisposable.isDisposed() ^ 1) == 0) {
            return false;
        }
        this.mCameraSetupDisposable.dispose();
        this.mCameraSetupDisposable = null;
        return true;
    }

    public boolean showNewBie(int newBieType) {
        DialogFragment dialogFragment;
        switch (newBieType) {
            case 1:
                dialogFragment = new PortraitNewbieDialogFragment();
                dialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add(dialogFragment, "PortraitHint").commitAllowingStateLoss();
                return true;
            case 2:
                dialogFragment = new FrontRotateNewbieDialogFragment();
                dialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add(dialogFragment, "RotateHint").commitAllowingStateLoss();
                return true;
            case 3:
                this.mHandler.postDelayed(new Runnable() {
                    public void run() {
                        if (!Camera.this.isActivityPaused()) {
                            DialogFragment aiSceneFragment = new AiSceneNewbieDialogFragment();
                            aiSceneFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                            Camera.this.getSupportFragmentManager().beginTransaction().add(aiSceneFragment, "AiSceneHint").commitAllowingStateLoss();
                            DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_first_ai_scene_use_hint_shown_key", false).apply();
                        }
                    }
                }, 500);
                return true;
            default:
                return false;
        }
    }

    public boolean isNewBieAlive(int newBieType) {
        boolean z = false;
        String tag = null;
        switch (newBieType) {
            case 1:
                tag = "PortraitHint";
                break;
            case 2:
                tag = "RotateHint";
                break;
            case 3:
                tag = "AiSceneHint";
                break;
        }
        if (tag == null) {
            return false;
        }
        if (getSupportFragmentManager().findFragmentByTag(tag) != null) {
            z = true;
        }
        return z;
    }

    public synchronized void updateSurfaceState(int newState) {
        super.updateSurfaceState(newState);
        if (newState == 4) {
            this.mCamera2OpenOnSubScribe.onGlSurfaceCreated();
        }
    }

    protected void notifyOnFirstFrameArrived(int arrivedType) {
        if (this.mCurrentModule != null) {
            getCameraScreenNail().clearAnimation();
            this.mBaseFragmentDelegate.getAnimationComposite().notifyAfterFirstFrameArrived(arrivedType);
            this.mCurrentModule.enableCameraControls(true);
            this.mCurrentModule.setFrameAvailable(true);
            if ((getCurrentModuleIndex() == 165 || getCurrentModuleIndex() == 163) && Device.isFrontCameraAtBottom() && CameraSettings.isFrontCamera() && this.mDisplayRotation == 0 && DataRepository.dataItemGlobal().getBoolean("pref_front_camera_first_use_hint_shown_key", true)) {
                DataRepository.dataItemGlobal().editor().putBoolean("pref_front_camera_first_use_hint_shown_key", false).apply();
                showNewBie(2);
            }
        }
    }

    private void bindGalleryService() {
        try {
            Intent intent = new Intent("com.miui.gallery.action.BIND_SERVICE");
            intent.setPackage("com.miui.gallery");
            bindService(intent, this.mServiceConnection, 5);
        } catch (Exception e) {
            Log.w(TAG, "bindGalleryService error.", e);
        }
    }

    private void unbindGalleryService() {
        unbindService(this.mServiceConnection);
    }

    private void showFirstUseHintIfNeeded() {
        if (DataRepository.dataItemGlobal().getBoolean("pref_camera_first_use_hint_shown_key", true)) {
            if (this.mCameraRootView != null) {
                this.mCameraRootView.disableTouchEvent();
            }
            this.mHandler.postDelayed(new Runnable() {
                public void run() {
                    if (!Camera.this.isActivityPaused()) {
                        Camera.this.getScreenHint().showFirstUseHint();
                        if (Camera.this.mCameraRootView != null) {
                            Camera.this.mCameraRootView.enableTouchEvent();
                        }
                    }
                }
            }, 1000);
        }
    }

    private void setBrightnessRampRate(int rate) {
        CompatibilityUtils.setBrightnessRampRate(this.mPowerManager, rate);
    }

    private void setScreenEffect(boolean enable) {
        if (this.mDisplayFeatureManager != null) {
            this.mDisplayFeatureManager.setScreenEffect(14, enable ? 1 : 0);
        }
    }

    public void setWindowBrightness(int brightness) {
        setBrightnessRampRate(0);
        setScreenEffect(true);
        LayoutParams localLayoutParams = getWindow().getAttributes();
        localLayoutParams.screenBrightness = ((float) brightness) / 255.0f;
        getWindow().setAttributes(localLayoutParams);
    }

    public void restoreWindowBrightness() {
        float brightness = -1.0f;
        if (this.mCameraBrightness != null) {
            int origin = this.mCameraBrightness.getCurrentBrightness();
            if (origin > 0) {
                brightness = ((float) origin) / 255.0f;
            }
        }
        LayoutParams localLayoutParams = getWindow().getAttributes();
        localLayoutParams.screenBrightness = brightness;
        getWindow().setAttributes(localLayoutParams);
        setBrightnessRampRate(-1);
        setScreenEffect(false);
    }

    private void registerReceiver() {
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.media.action.VOICE_COMMAND");
        registerReceiver(this.mReceiver, filter);
        this.mDidRegister = true;
    }

    public void onHibernate() {
        Log.d(TAG, "onHibernate");
        if (isCurrentModuleAlive()) {
            this.mCurrentModule.setDeparted();
        }
        showHibernationFragment();
        getCameraScreenNail().requestHibernate();
        Camera2OpenManager.getInstance().release(true);
    }

    public void onAwaken() {
        Log.d(TAG, "onAwaken");
        getCameraScreenNail().requestAwaken();
        onModeSelected(this.mStartControl);
    }

    private void showHibernationFragment() {
        DialogFragment dialogFragment = new HibernationFragment();
        dialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
        getSupportFragmentManager().beginTransaction().add(dialogFragment, "Hibernation").commitAllowingStateLoss();
    }

    private void hideHibernationFragment() {
        Fragment fragment = getSupportFragmentManager().findFragmentByTag("Hibernation");
        if (fragment != null && (fragment instanceof DialogFragment)) {
            ((DialogFragment) fragment).dismissAllowingStateLoss();
        }
    }

    public void showLensDirtyDetectedHint() {
        if (getSupportFragmentManager().findFragmentByTag("LensDirtyDetectDialog") == null) {
            DialogFragment dialogFragment = new LensDirtyDetectDialogFragment();
            dialogFragment.setStyle(2, R.style.LensDirtyDetectDialogFragment);
            getSupportFragmentManager().beginTransaction().add(dialogFragment, "LensDirtyDetectDialog").commitAllowingStateLoss();
        }
    }

    public void hideLensDirtyDetectedHint() {
        Fragment fragment = getSupportFragmentManager().findFragmentByTag("LensDirtyDetectDialog");
        if (fragment != null && (fragment instanceof DialogFragment)) {
            ((DialogFragment) fragment).dismissAllowingStateLoss();
        }
    }
}
