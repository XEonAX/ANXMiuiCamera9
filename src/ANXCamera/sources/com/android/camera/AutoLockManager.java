package com.android.camera;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemProperties;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import com.android.camera.log.Log;
import java.util.WeakHashMap;

public class AutoLockManager {
    public static int HIBERNATION_TIMEOUT = 8;
    private static long MILLIS_IN_MINUTE = 60000;
    private static final String TAG = AutoLockManager.class.getSimpleName();
    private static WeakHashMap<Context, AutoLockManager> sMap = new WeakHashMap();
    private boolean mCameraAlwaysKeepScreenOn = false;
    private Context mContext;
    private Handler mHandler;
    private long mHibernationTimeOut;
    private boolean mPaused;
    private long mScreenOffTimeOut = 15000;

    private AutoLockManager(Context context) {
        this.mContext = context;
        int timeoutSeconds = SystemProperties.getInt("camera.debug.hibernation_timeout_seconds", 0);
        this.mCameraAlwaysKeepScreenOn = SystemProperties.getBoolean("camera_always_keep_screen_on", false);
        if (timeoutSeconds > 0) {
            this.mHibernationTimeOut = ((long) timeoutSeconds) * 1000;
        } else {
            this.mHibernationTimeOut = MILLIS_IN_MINUTE * ((long) Device.getHibernationTimeout());
        }
        updateScreenOffTimeout(context);
    }

    private void updateScreenOffTimeout(Context context) {
        try {
            this.mScreenOffTimeOut = (long) System.getInt(context.getContentResolver(), "screen_off_timeout");
        } catch (SettingNotFoundException e) {
            Log.e(TAG, e.getMessage());
        }
    }

    public static AutoLockManager getInstance(Context context) {
        AutoLockManager instance = (AutoLockManager) sMap.get(context);
        if (instance != null) {
            return instance;
        }
        instance = new AutoLockManager(context);
        sMap.put(context, instance);
        return instance;
    }

    public static void removeInstance(Context context) {
        AutoLockManager instance = (AutoLockManager) sMap.remove(context);
        if (instance != null && instance.mHandler != null) {
            instance.mHandler.getLooper().quit();
        }
    }

    public void onPause() {
        this.mPaused = true;
        removeMessage();
    }

    public void onResume() {
        this.mPaused = false;
        updateScreenOffTimeout(this.mContext);
    }

    public void onUserInteraction() {
        hibernateDelayed();
    }

    private void initHandler() {
        if (this.mHandler == null) {
            HandlerThread handlerThread = new HandlerThread("my_handler_thread");
            handlerThread.start();
            this.mHandler = new Handler(handlerThread.getLooper()) {
                public void dispatchMessage(Message msg) {
                    if (msg.what == 0) {
                        AutoLockManager.this.lockScreen();
                    } else if (1 == msg.what) {
                        AutoLockManager.this.hibernate();
                    }
                }
            };
        }
    }

    private void hibernate() {
        ((Camera) this.mContext).onHibernate();
    }

    private void lockScreen() {
        if (!this.mPaused) {
            this.mContext.sendBroadcast(new Intent("com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_LOCK"));
        }
    }

    public void removeMessage() {
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void hibernateDelayed() {
        if (!this.mCameraAlwaysKeepScreenOn && this.mHibernationTimeOut < this.mScreenOffTimeOut) {
            initHandler();
            if (this.mHandler != null) {
                this.mHandler.removeMessages(1);
                if (!((Camera) this.mContext).isVideoRecording()) {
                    this.mHandler.sendEmptyMessageDelayed(1, this.mHibernationTimeOut);
                }
            }
        }
    }
}
