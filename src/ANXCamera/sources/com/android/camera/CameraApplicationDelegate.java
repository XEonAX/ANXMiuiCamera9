package com.android.camera;

import android.app.Activity;
import android.content.Context;
import com.android.camera.statistic.CameraStat;
import java.util.Stack;
import miui.external.ApplicationDelegate;

public class CameraApplicationDelegate extends ApplicationDelegate {
    private static CameraAppImpl sContext;
    private Stack<Activity> mActivities;
    private boolean mMainIntentActivityLaunched = false;
    private boolean mRestoreSetting = false;

    public CameraApplicationDelegate(CameraAppImpl cameraAppImpl) {
        sContext = cameraAppImpl;
    }

    public void onCreate() {
        super.onCreate();
        Util.initialize(this);
        CameraStat.initialize(getAndroidContext());
        this.mActivities = new Stack();
        this.mRestoreSetting = true;
    }

    public synchronized Activity getActivity(int index) {
        if (index >= 0) {
            if (index < getActivityCount()) {
                return (Activity) this.mActivities.get(index);
            }
        }
        return null;
    }

    public static Context getAndroidContext() {
        return sContext;
    }

    public synchronized int getActivityCount() {
        return this.mActivities.size();
    }

    public synchronized void addActivity(Activity activity) {
        if (activity != null) {
            if ("android.intent.action.MAIN".equals(activity.getIntent().getAction())) {
                this.mMainIntentActivityLaunched = true;
            }
            this.mActivities.push(activity);
        }
    }

    public synchronized void removeActivity(Activity activity) {
        if (activity != null) {
            if ("android.intent.action.MAIN".equals(activity.getIntent().getAction())) {
                this.mMainIntentActivityLaunched = false;
            }
            this.mActivities.remove(activity);
        }
    }

    public synchronized void closeAllActivitiesBut(Activity current) {
        int i = 0;
        for (int j = 0; j < getActivityCount(); j++) {
            Activity activity = getActivity(i);
            if (activity == current || ("android.intent.action.MAIN".equals(activity.getIntent().getAction()) ^ 1) == 0) {
                i++;
            } else {
                activity.finish();
                this.mActivities.remove(activity);
            }
        }
    }
}
