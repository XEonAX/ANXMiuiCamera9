package com.android.camera;

import android.content.Context;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.log.Log;
import java.lang.Thread.UncaughtExceptionHandler;
import java.lang.ref.WeakReference;
import java.util.Locale;
import miui.external.Application;

public class CrashHandler implements UncaughtExceptionHandler {
    private static CrashHandler sInstance = new CrashHandler();
    private WeakReference<Application> mContextRef;
    private UncaughtExceptionHandler mDefaultHandler;

    private CrashHandler() {
    }

    public static CrashHandler getInstance() {
        return sInstance;
    }

    public void init(Application ctx) {
        this.mContextRef = new WeakReference(ctx);
        if (this.mDefaultHandler == null) {
            this.mDefaultHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(this);
        }
    }

    public void uncaughtException(Thread thread, Throwable ex) {
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        Log.e("CameraFCHandler", String.format(Locale.ENGLISH, "Camera FC, @Module = %d And @CameraId = %d", new Object[]{Integer.valueOf(dataItemGlobal.getCurrentMode()), Integer.valueOf(dataItemGlobal.getCurrentCameraId())}));
        Log.e("CameraFCHandler", "Camera FC, msg=" + ex.getMessage());
        if (this.mContextRef != null) {
            CameraSettings.setEdgeMode((Context) this.mContextRef.get(), false);
            Util.setBrightnessRampRate(-1);
            Util.setScreenEffect(false);
            this.mContextRef = null;
        }
        if (this.mDefaultHandler != null) {
            Log.e("CameraFCHandler", "mDefaultHandler=" + this.mDefaultHandler);
            this.mDefaultHandler.uncaughtException(thread, ex);
            this.mDefaultHandler = null;
        }
    }
}
