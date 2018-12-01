package com.android.camera.snap;

import android.app.Notification;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.PowerManager;
import android.os.Vibrator;
import android.support.v7.recyclerview.R;
import android.view.ViewConfiguration;
import com.android.camera.ProximitySensorLock;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.snap.SnapCamera.SnapStatusListener;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;

public class SnapTrigger implements SnapStatusListener {
    private static final String TAG = SnapTrigger.class.getSimpleName();
    private static SnapTrigger sInstance;
    private int mBurstCount = 0;
    private SnapCamera mCamera = null;
    private boolean mCameraOpened;
    private Context mContext;
    private Handler mHandler;
    private final Runnable mLongPressRunnable = new Runnable() {
        public void run() {
            SnapTrigger.this.initCamera();
            if (SnapTrigger.this.mHandler == null || !SnapTrigger.this.mCameraOpened) {
                Log.d(SnapTrigger.TAG, "wait camera");
            } else {
                SnapTrigger.this.mHandler.postDelayed(SnapTrigger.this.mSnapRunnable, (long) (SnapTrigger.this.mCamera.isCamcorder() ? 100 : 200));
            }
        }
    };
    private PowerManager mPowerManager = null;
    private ProximitySensorLock mProximityLock;
    private final Runnable mSnapRunnable = new Runnable() {
        public void run() {
            if (SnapTrigger.this.mCamera != null) {
                if (SnapTrigger.this.mPowerManager != null && SnapTrigger.this.mPowerManager.isScreenOn()) {
                    Log.d(SnapTrigger.TAG, "isScreenOn is true, stop take snap");
                    SnapTrigger.this.mHandler.removeMessages(101);
                } else if (!SnapTrigger.this.shouldQuitSnap() && Storage.getAvailableSpace() >= 52428800) {
                    if (SnapTrigger.this.mCamera.isCamcorder()) {
                        SnapTrigger.this.shutdownWatchDog();
                        SnapTrigger.this.vibratorShort();
                        SnapTrigger.this.mCamera.startCamcorder();
                        Log.d(SnapTrigger.TAG, "take movie");
                        CameraStatUtil.trackSnapInfo(true);
                    } else {
                        SnapTrigger.this.triggerWatchdog(false);
                        SnapTrigger.this.mCamera.takeSnap();
                        SnapTrigger snapTrigger = SnapTrigger.this;
                        snapTrigger.mBurstCount = snapTrigger.mBurstCount + 1;
                        Log.d(SnapTrigger.TAG, "take snap");
                        CameraStatUtil.trackSnapInfo(false);
                    }
                }
            }
        }
    };

    public static SnapTrigger getInstance() {
        if (sInstance == null) {
            sInstance = new SnapTrigger();
        }
        return sInstance;
    }

    public synchronized boolean init(Context context, Handler handler) {
        this.mContext = context;
        this.mHandler = handler;
        this.mPowerManager = (PowerManager) context.getSystemService("power");
        if (ProximitySensorLock.enabled() && (Util.isNonUIEnabled() ^ 1) != 0) {
            this.mProximityLock = new ProximitySensorLock(this.mContext);
            Log.d(TAG, "init, create a new instance -> " + this.mProximityLock);
            this.mProximityLock.startWatching();
        }
        return isRunning();
    }

    private void onDestroy() {
        if (this.mProximityLock != null) {
            this.mProximityLock.destroy();
        }
        this.mProximityLock = null;
    }

    public synchronized boolean isRunning() {
        boolean z = false;
        synchronized (this) {
            if (!(this.mContext == null || this.mHandler == null)) {
                z = true;
            }
        }
        return z;
    }

    public static synchronized void destroy() {
        synchronized (SnapTrigger.class) {
            if (sInstance != null) {
                sInstance.onDestroy();
                sInstance.mBurstCount = 0;
                if (sInstance.mCamera != null) {
                    sInstance.mCamera.release();
                    sInstance.mCamera = null;
                }
                sInstance.mHandler = null;
                sInstance.mContext = null;
                sInstance = null;
            }
        }
    }

    public void handleKeyEvent(int keyCode, int keyAction, long keyEventTime) {
        if (isRunning()) {
            boolean immediately = false;
            if (keyCode == 25) {
                if (keyAction == 0) {
                    this.mHandler.postDelayed(this.mLongPressRunnable, ViewConfiguration.getGlobalActionKeyTimeout());
                } else if (keyAction == 1) {
                    this.mHandler.removeCallbacks(this.mLongPressRunnable);
                    this.mHandler.removeCallbacks(this.mSnapRunnable);
                    immediately = true;
                }
            } else if (keyCode == 26) {
                this.mHandler.removeCallbacks(this.mLongPressRunnable);
                this.mHandler.removeCallbacks(this.mSnapRunnable);
                immediately = true;
            }
            triggerWatchdog(immediately);
        }
    }

    private boolean shouldQuitSnap() {
        boolean z = false;
        if (ProximitySensorLock.enabled() && Util.isNonUIEnabled()) {
            boolean isNonUI = Util.isNonUI();
            Log.d(TAG, "shouldQuitSnap isNonUI = " + isNonUI);
            if (isNonUI) {
                CameraStatUtil.track("counter", "pocket_mode_enter", "方式", "NonUI街拍");
            }
            return isNonUI;
        }
        if (this.mProximityLock != null) {
            z = this.mProximityLock.shouldQuitSnap();
        }
        return z;
    }

    private void triggerWatchdog(boolean immediately) {
        if (this.mHandler != null) {
            Log.d(TAG, "watch dog On -" + immediately);
            this.mHandler.removeMessages(101);
            this.mHandler.sendEmptyMessageDelayed(101, (long) (immediately ? 0 : 5000));
        }
    }

    private void shutdownWatchDog() {
        if (this.mHandler != null) {
            Log.d(TAG, "watch dog Off");
            this.mHandler.removeMessages(101);
        }
    }

    private void initCamera() {
        if (this.mCamera == null) {
            this.mCameraOpened = false;
            this.mCamera = new SnapCamera(this.mContext, this);
        }
    }

    public void onDone(Uri uri) {
        if (isRunning()) {
            triggerWatchdog(false);
            vibratorShort();
            if (!this.mCamera.isCamcorder() && this.mBurstCount < 100) {
                this.mHandler.postDelayed(this.mSnapRunnable, 200);
            }
            if (uri != null) {
                notifyForDetail(this.mContext, uri, this.mContext.getString(R.string.camera_snap_mode_title), this.mContext.getString(R.string.camera_snap_mode_title_detail), this.mCamera.isCamcorder());
            }
        }
    }

    public void onCameraOpened() {
        if (isRunning()) {
            Log.d(TAG, "onCameraOpened");
            this.mCameraOpened = true;
            if (this.mHandler != null) {
                this.mHandler.post(this.mSnapRunnable);
            }
            return;
        }
        Log.w(TAG, "onCameraOpened: exit");
    }

    private void vibratorShort() {
        vibrator(new long[]{10, 20});
    }

    private void vibrator(long[] pattern) {
        try {
            ((Vibrator) this.mContext.getSystemService("vibrator")).vibrate(pattern, -1);
        } catch (Exception e) {
        }
    }

    public static void notifyForDetail(Context context, Uri uri, String title, String content, boolean isVideo) {
        try {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.VIEW");
            intent.setDataAndType(uri, isVideo ? "video/*" : "image/*");
            Notification notification = new Builder(context).setContentTitle(title).setContentText(content).setContentIntent(PendingIntent.getActivity(context, 0, intent, 0)).setSmallIcon(17301569).setWhen(System.currentTimeMillis()).build();
            notification.flags |= 16;
            notification.extraNotification.setMessageCount(0);
            ((NotificationManager) context.getSystemService("notification")).notify(0, notification);
        } catch (NullPointerException e) {
        }
    }
}
