package com.android.camera;

import android.app.Activity;
import android.content.Context;
import com.miui.filtersdk.BeautificationSDK;
import miui.external.Application;

public class CameraAppImpl extends Application {
    private static CameraApplicationDelegate sApplicationDelegate;
    private boolean sLaunched = true;

    public CameraApplicationDelegate onCreateApplicationDelegate() {
        if (sApplicationDelegate == null) {
            sApplicationDelegate = new CameraApplicationDelegate(this);
        }
        CrashHandler.getInstance().init(this);
        BeautificationSDK.init(this);
        return sApplicationDelegate;
    }

    public static Context getAndroidContext() {
        return CameraApplicationDelegate.getAndroidContext();
    }

    public void addActivity(Activity activity) {
        sApplicationDelegate.addActivity(activity);
    }

    public void removeActivity(Activity activity) {
        sApplicationDelegate.removeActivity(activity);
    }

    public void closeAllActivitiesBut(Activity current) {
        sApplicationDelegate.closeAllActivitiesBut(current);
    }

    public boolean isApplicationFirstLaunched() {
        if (!this.sLaunched) {
            return this.sLaunched;
        }
        this.sLaunched ^= 1;
        return this.sLaunched ^ 1;
    }
}
