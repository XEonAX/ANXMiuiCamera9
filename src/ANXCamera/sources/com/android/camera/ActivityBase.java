package com.android.camera;

import android.app.AlertDialog;
import android.app.KeyguardManager;
import android.app.NotificationManager;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.UiThread;
import android.support.v4.app.FragmentActivity;
import android.support.v7.recyclerview.R;
import android.view.Display;
import android.view.KeyEvent;
import android.widget.TextView;
import com.android.camera.CameraScreenNail.NailListener;
import com.android.camera.CameraScreenNail.RequestRenderListener;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.loader.SurfaceStateListener;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.CameraRootView;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.ScreenHint;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera.ui.V9EdgeShutterView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

public abstract class ActivityBase extends FragmentActivity implements AppController, SurfaceStateListener {
    protected boolean mActivityPaused;
    protected long mAppStartTime;
    protected CameraAppImpl mApplication;
    protected CameraBrightness mCameraBrightness;
    private boolean mCameraErrorShown;
    public CameraIntentManager mCameraIntentManager;
    protected CameraRootView mCameraRootView;
    protected CameraScreenNail mCameraScreenNail;
    private MiuiCameraSound mCameraSound;
    private Thread mCloseActivityThread;
    protected Module mCurrentModule;
    private int mCurrentSurfaceState = 1;
    protected TextView mDebugInfoView;
    protected int mDisplayRotation;
    protected V9EdgeShutterView mEdgeShutterView;
    private AlertDialog mErrorDialog;
    protected V6CameraGLSurfaceView mGLView;
    private boolean mGalleryBack;
    private boolean mGalleryLocked = false;
    protected final Handler mHandler = new ActivityHandler(this);
    private boolean mIsFinishInKeyguard = false;
    private boolean mIsSwitchingModule;
    private int mJumpFlag = 0;
    protected boolean mJumpedToGallery;
    private KeyguardManager mKeyguardManager;
    private boolean mKeyguardSecureLocked = false;
    private LocationManager mLocationManager;
    protected int mOrientation = -1;
    protected int mOrientationCompensation = 0;
    protected ScreenHint mScreenHint;
    private ArrayList<Uri> mSecureUriList;
    private boolean mStartFromKeyguard = false;
    private ThumbnailUpdater mThumbnailUpdater;

    private static class ActivityHandler extends Handler {
        private final WeakReference<ActivityBase> mActivity;

        public ActivityHandler(ActivityBase activity) {
            this.mActivity = new WeakReference(activity);
        }

        public void handleMessage(Message msg) {
            ActivityBase activity = (ActivityBase) this.mActivity.get();
            if (activity != null) {
                switch (msg.what) {
                    case 0:
                        if (!activity.isActivityPaused()) {
                            activity.showDebugInfo((String) msg.obj);
                            break;
                        }
                        break;
                    case 1:
                        Log.d("ActivityBase", "handleMessage:  set mIsFinishInKeyguard = true;");
                        activity.mIsFinishInKeyguard = true;
                        break;
                    case R.styleable.ToggleSwitch_textOffColor /*10*/:
                        int exception = msg.arg1;
                        Log.d("ActivityBase", "msg = " + msg + ", exception = " + exception);
                        switch (exception) {
                            case 226:
                            case 228:
                            case 230:
                            case 231:
                                int i;
                                if (Util.isInVideoCall(activity)) {
                                    i = R.string.cannot_connect_camera_volte_call;
                                } else if (CameraSettings.updateOpenCameraFailTimes() > 1) {
                                    i = R.string.cannot_connect_camera_twice;
                                } else {
                                    i = R.string.cannot_connect_camera_once;
                                }
                                Util.showErrorAndFinish(activity, i);
                                activity.showErrorDialog();
                                break;
                            case 227:
                                Util.showErrorAndFinish(activity, R.string.camera_disabled);
                                activity.showErrorDialog();
                                break;
                        }
                        break;
                }
            }
        }
    }

    @UiThread
    protected abstract void notifyOnFirstFrameArrived(int i);

    public boolean couldShowErrorDialog() {
        return this.mCameraErrorShown ^ 1;
    }

    public void showErrorDialog() {
        this.mCameraErrorShown = true;
    }

    public void setErrorDialog(AlertDialog errorDialog) {
        this.mErrorDialog = errorDialog;
    }

    public void showDebugInfo(String info) {
        if (this.mDebugInfoView != null) {
            this.mDebugInfoView.setText(info);
        }
    }

    public V9EdgeShutterView getEdgeShutterView() {
        return this.mEdgeShutterView;
    }

    public void onCreate(Bundle icicle) {
        CameraPerformanceTracker.onEvent(0);
        if (Util.isNotchDevice) {
            getWindow().addExtraFlags(1792);
        }
        getWindow().addFlags(1024);
        if ((getIntent().getFlags() & 8388608) == 0) {
            getWindow().addFlags(2097152);
        }
        super.onCreate(icicle);
        setVolumeControlStream(1);
        this.mScreenHint = new ScreenHint(this);
        this.mThumbnailUpdater = new ThumbnailUpdater(this);
        this.mKeyguardManager = (KeyguardManager) getSystemService("keyguard");
        this.mStartFromKeyguard = getKeyguardFlag();
        if (this.mStartFromKeyguard) {
            this.mKeyguardSecureLocked = this.mKeyguardManager.isKeyguardSecure();
        }
        this.mApplication.addActivity(this);
        this.mCameraBrightness = new CameraBrightness(this);
        this.mLocationManager = LocationManager.instance();
        this.mCloseActivityThread = new Thread(new Runnable() {
            public void run() {
                ActivityBase.this.mApplication.closeAllActivitiesBut(ActivityBase.this);
            }
        });
        try {
            this.mCloseActivityThread.start();
        } catch (IllegalThreadStateException e) {
            Log.e("ActivityBase", e.getMessage());
        }
    }

    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        checkGalleryLock();
        checkKeyguardFlag();
    }

    protected void onResume() {
        boolean z = true;
        CameraPerformanceTracker.onEvent(2);
        super.onResume();
        if (this.mJumpFlag != 1) {
            z = false;
        }
        this.mGalleryBack = z;
        this.mJumpFlag = 0;
        checkGalleryLock();
        checkKeyguardFlag();
        resume();
    }

    protected boolean getKeyguardFlag() {
        if (this.mKeyguardManager == null || !getIntent().getBooleanExtra("StartActivityWhenLocked", false)) {
            return false;
        }
        return this.mKeyguardManager.isKeyguardLocked();
    }

    private void checkGalleryLock() {
        this.mGalleryLocked = Util.isAppLocked(this, "com.miui.gallery");
    }

    private void checkKeyguardFlag() {
        this.mStartFromKeyguard = getKeyguardFlag();
        if (this.mStartFromKeyguard && (this.mIsFinishInKeyguard ^ 1) != 0) {
            getWindow().addFlags(524288);
            this.mKeyguardSecureLocked = this.mKeyguardManager.isKeyguardSecure();
            DataRepository.dataItemGlobal().setStartFromKeyguard(this.mKeyguardSecureLocked);
            this.mIsFinishInKeyguard = false;
            this.mHandler.sendEmptyMessageDelayed(1, 100);
        }
        if (!this.mKeyguardSecureLocked && !isGalleryLocked()) {
            this.mSecureUriList = null;
        } else if (this.mSecureUriList == null) {
            this.mSecureUriList = new ArrayList();
        }
        Log.v("ActivityBase", "checkKeyguard: fromKeyguard=" + this.mStartFromKeyguard + " keyguardSecureLocked=" + this.mKeyguardSecureLocked + " secureUriList is " + (this.mSecureUriList == null ? "null" : "not null"));
    }

    protected void onPause() {
        CameraPerformanceTracker.onEvent(1);
        super.onPause();
        if (this.mErrorDialog != null) {
            this.mErrorDialog.dismiss();
        }
        pause();
        if (this.mJumpFlag == 0 && (startFromSecureKeyguard() || isGalleryLocked())) {
            this.mSecureUriList = null;
            this.mThumbnailUpdater.setThumbnail(null, true, false);
        } else if (this.mJumpFlag == 1) {
            clearNotification();
        }
        this.mHandler.removeMessages(1);
    }

    public void resume() {
        if (this.mCameraSound == null) {
            this.mCameraSound = new MiuiCameraSound(this);
        }
        this.mLocationManager.recordLocation(CameraSettings.isRecordLocation());
        this.mCameraBrightness.onResume();
    }

    public void pause() {
        this.mGLView.onPause();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mCameraBrightness.onPause();
        if (this.mCloseActivityThread != null) {
            try {
                this.mCloseActivityThread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.mCloseActivityThread = null;
        }
        if (this.mLocationManager != null) {
            this.mLocationManager.recordLocation(false);
        }
        if (startFromKeyguard() && this.mIsFinishInKeyguard) {
            getWindow().clearFlags(2097152);
            if (this.mJumpFlag == 0) {
                finish();
            }
        }
        if (this.mThumbnailUpdater != null) {
            this.mThumbnailUpdater.saveThumbnailToFile();
            this.mThumbnailUpdater.cancelTask();
        }
    }

    public V6CameraGLSurfaceView getGLView() {
        return this.mGLView;
    }

    public ScreenHint getScreenHint() {
        return this.mScreenHint;
    }

    public boolean onSearchRequested() {
        return false;
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 84 && event.isLongPress()) {
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onSaveInstanceState(outState);
        }
    }

    protected void onDestroy() {
        PopupManager.removeInstance(this);
        this.mApplication.removeActivity(this);
        if (this.mCameraSound != null) {
            this.mCameraSound.release();
            this.mCameraSound = null;
        }
        super.onDestroy();
    }

    public void createCameraScreenNail(boolean getPictures, boolean recreate) {
        if (this.mCameraScreenNail == null) {
            this.mCameraScreenNail = new CameraScreenNail(new NailListener() {
                public void onPreviewTextureCopied() {
                }

                public void onPreviewPixelsRead(byte[] pixels, int width, int height) {
                    ActivityBase.this.mCurrentModule.onPreviewPixelsRead(pixels, width, height);
                }

                public void onFrameAvailable(int arrivedType) {
                    CameraPerformanceTracker.onEvent(5);
                    if (1 == arrivedType && ActivityBase.this.mAppStartTime != 0) {
                        try {
                            long cost = System.currentTimeMillis() - ActivityBase.this.mAppStartTime;
                            CameraStatUtil.trackStartAppCost(cost);
                            Log.d("ActivityBase", "onFrameAvailable: trackStartAppCost: " + cost);
                        } catch (IllegalArgumentException e) {
                            Log.w("ActivityBase", e.getMessage() + ", start time: " + ActivityBase.this.mAppStartTime + ", now: " + System.currentTimeMillis());
                        }
                        ActivityBase.this.mAppStartTime = 0;
                    }
                    ActivityBase.this.notifyOnFirstFrameArrived(arrivedType);
                }

                public boolean isKeptBitmapTexture() {
                    return ActivityBase.this.mCurrentModule.isKeptBitmapTexture();
                }
            }, new RequestRenderListener() {
                public void requestRender() {
                    ActivityBase.this.mGLView.requestRender();
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.requestRender();
                    }
                }
            });
        }
        initCameraScreenNail();
    }

    public void initCameraScreenNail() {
        Log.d("ActivityBase", "initCameraScreenNail");
        if (this.mCameraScreenNail != null && this.mCameraScreenNail.getSurfaceTexture() == null) {
            Display display = getWindowManager().getDefaultDisplay();
            Point point = new Point();
            display.getSize(point);
            this.mCameraScreenNail.setPreviewSize(point.x, point.y);
        }
    }

    protected void releaseCameraScreenNail() {
        if (this.mCameraScreenNail != null) {
            this.mCameraScreenNail.releaseSurfaceTexture();
        }
    }

    public void onLayoutChange(Rect rect) {
        this.mCameraScreenNail.setRenderArea(rect);
        if (Util.getDisplayRotation(this) % 180 == 0) {
            this.mCameraScreenNail.setPreviewFrameLayoutSize(rect.width(), rect.height());
        } else {
            this.mCameraScreenNail.setPreviewFrameLayoutSize(rect.height(), rect.width());
        }
    }

    public ThumbnailUpdater getThumbnailUpdater() {
        return this.mThumbnailUpdater;
    }

    public void addSecureUri(Uri uri) {
        if (this.mSecureUriList != null) {
            if (this.mSecureUriList.size() == 100) {
                this.mSecureUriList.remove(0);
            }
            this.mSecureUriList.add(uri);
        }
    }

    public boolean startFromSecureKeyguard() {
        return this.mKeyguardSecureLocked;
    }

    public boolean isGalleryLocked() {
        return this.mGalleryLocked;
    }

    public boolean startFromKeyguard() {
        return this.mStartFromKeyguard;
    }

    public CameraScreenNail getCameraScreenNail() {
        return this.mCameraScreenNail;
    }

    public void playCameraSound(int soundId) {
        this.mCameraSound.playSound(soundId);
    }

    public void loadCameraSound(int soundId) {
        if (this.mCameraSound != null) {
            this.mCameraSound.load(soundId);
        }
    }

    public void gotoGallery() {
        if (!isActivityPaused()) {
            Thumbnail t = this.mThumbnailUpdater.getThumbnail();
            if (t != null) {
                Uri uri = t.getUri();
                if (uri == null) {
                    Log.e("ActivityBase", "Uri null!");
                    if (!t.isWaitingForUri()) {
                        getThumbnailUpdater().getLastThumbnailUncached();
                    }
                } else if (Util.isUriValid(uri, getContentResolver())) {
                    try {
                        Intent intent = new Intent("com.android.camera.action.REVIEW", uri);
                        intent.setPackage("com.miui.gallery");
                        intent.putExtra("from_MiuiCamera", true);
                        if (Device.adjustScreenLight()) {
                            if (!Device.supportNewBrightness()) {
                                intent.putExtra("camera-brightness", this.mCameraBrightness.getCurrentBrightness());
                            } else if (this.mCameraBrightness.getCurrentBrightnessManual() != -1) {
                                intent.putExtra("camera-brightness-manual", this.mCameraBrightness.getCurrentBrightnessManual());
                            } else {
                                intent.putExtra("camera-brightness-auto", this.mCameraBrightness.getCurrentBrightnessAuto());
                            }
                        }
                        if (startFromKeyguard()) {
                            intent.putExtra("StartActivityWhenLocked", true);
                        }
                        if (Util.isAppLocked(this, "com.miui.gallery")) {
                            intent.putExtra("skip_interception", true);
                        }
                        if (this.mSecureUriList != null) {
                            intent.putParcelableArrayListExtra("SecureUri", this.mSecureUriList);
                        }
                        startActivity(intent);
                        this.mJumpFlag = 1;
                        this.mJumpedToGallery = true;
                        if (this.mCurrentModule != null) {
                            this.mCurrentModule.enableCameraControls(false);
                            CameraStatUtil.trackGotoGallery(this.mCurrentModule.getModuleIndex());
                        }
                    } catch (ActivityNotFoundException e) {
                        try {
                            startActivity(new Intent("android.intent.action.VIEW", uri));
                        } catch (ActivityNotFoundException e2) {
                            Log.e("ActivityBase", "review image fail. uri=" + uri, e2);
                        }
                    }
                } else {
                    Log.e("ActivityBase", "Uri invalid. uri=" + uri);
                }
            }
        }
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        this.mCurrentModule.onActivityResult(requestCode, resultCode, data);
    }

    public Module getCurrentModule() {
        return this.mCurrentModule;
    }

    public ArrayList<Uri> getSecureUriList() {
        return this.mSecureUriList;
    }

    public boolean isGotoGallery() {
        return this.mJumpFlag == 1;
    }

    public boolean isGalleryBack() {
        return this.mGalleryBack;
    }

    public void setJumpFlag(int flag) {
        this.mJumpFlag = flag;
    }

    public void dismissKeyguard() {
        if (this.mStartFromKeyguard) {
            sendBroadcast(new Intent("xiaomi.intent.action.SHOW_SECURE_KEYGUARD"));
        }
    }

    public boolean isSwitchingModule() {
        return this.mIsSwitchingModule;
    }

    public void setSwitchingModule(boolean switching) {
        this.mIsSwitchingModule = switching;
    }

    public boolean isActivityPaused() {
        return this.mActivityPaused;
    }

    private void clearNotification() {
        NotificationManager manager = (NotificationManager) getSystemService("notification");
        if (manager != null) {
            manager.cancelAll();
        }
    }

    /* JADX WARNING: Missing block: B:6:0x0008, code:
            return false;
     */
    public synchronized boolean hasSurface() {
        /*
        r2 = this;
        r1 = 0;
        monitor-enter(r2);
        r0 = r2.mCurrentSurfaceState;	 Catch:{ all -> 0x0023 }
        switch(r0) {
            case 2: goto L_0x001d;
            case 3: goto L_0x0007;
            case 4: goto L_0x0009;
            default: goto L_0x0007;
        };
    L_0x0007:
        monitor-exit(r2);
        return r1;
    L_0x0009:
        r0 = r2.getCameraScreenNail();	 Catch:{ all -> 0x0023 }
        r0 = r0.getSurfaceTexture();	 Catch:{ all -> 0x0023 }
        if (r0 != 0) goto L_0x001a;
    L_0x0013:
        r0 = r2.mGLView;	 Catch:{ all -> 0x0023 }
        r0.onResume();	 Catch:{ all -> 0x0023 }
        monitor-exit(r2);
        return r1;
    L_0x001a:
        r0 = 1;
        monitor-exit(r2);
        return r0;
    L_0x001d:
        r0 = r2.mGLView;	 Catch:{ all -> 0x0023 }
        r0.onResume();	 Catch:{ all -> 0x0023 }
        goto L_0x0007;
    L_0x0023:
        r0 = move-exception;
        monitor-exit(r2);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.ActivityBase.hasSurface():boolean");
    }

    public synchronized void updateSurfaceState(int newState) {
        Log.d("ActivityBase", "updateSurfaceState: " + newState);
        this.mCurrentSurfaceState = newState;
    }

    public void resetStartTime() {
        this.mAppStartTime = 0;
    }

    public CameraIntentManager getCameraIntentManager() {
        if (this.mCameraIntentManager == null) {
            this.mCameraIntentManager = CameraIntentManager.getInstance(getIntent());
        }
        return this.mCameraIntentManager;
    }
}
