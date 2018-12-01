package com.android.camera.data.data.runing;

import com.android.camera.data.data.DataItemBase;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.log.Log;

public class DataItemRunning extends DataItemBase {
    private ComponentRunningTiltValue componentRunningTiltValue;
    private ComponentConfigFilter mComponentConfigFilter;
    private ComponentRunningSceneValue mComponentRunningSceneValue;
    private ComponentRunningTimer mComponentRunningTimer;
    private int mLastUiStyle;
    private int mUiStyle;

    public boolean isSwitchOn(String key) {
        return getBoolean(key, false);
    }

    public boolean triggerSwitchAndGet(String key) {
        if (isSwitchOn(key)) {
            switchOff(key);
            return false;
        }
        switchOn(key);
        return true;
    }

    public void switchOn(String key) {
        putBoolean(key, true);
    }

    public void switchOff(String key) {
        putBoolean(key, false);
    }

    public String provideKey() {
        return "camera_running";
    }

    public boolean isTransient() {
        return true;
    }

    public ComponentRunningTimer getComponentRunningTimer() {
        if (this.mComponentRunningTimer == null) {
            this.mComponentRunningTimer = new ComponentRunningTimer(this);
        }
        return this.mComponentRunningTimer;
    }

    public ComponentRunningSceneValue getComponentRunningSceneValue() {
        if (this.mComponentRunningSceneValue == null) {
            this.mComponentRunningSceneValue = new ComponentRunningSceneValue(this);
        }
        return this.mComponentRunningSceneValue;
    }

    public ComponentRunningTiltValue getComponentRunningTiltValue() {
        if (this.componentRunningTiltValue == null) {
            this.componentRunningTiltValue = new ComponentRunningTiltValue(this);
        }
        return this.componentRunningTiltValue;
    }

    public ComponentConfigFilter getComponentConfigFilter() {
        if (this.mComponentConfigFilter == null) {
            this.mComponentConfigFilter = new ComponentConfigFilter(this);
        }
        return this.mComponentConfigFilter;
    }

    public String getVideoSpeed() {
        if (isSwitchOn("pref_video_speed_fast_key")) {
            return "fast";
        }
        if (isSwitchOn("pref_video_speed_slow_key")) {
            return "slow";
        }
        if (isSwitchOn("pref_video_speed_hfr_key")) {
            return "hfr";
        }
        return "normal";
    }

    public int getUiStyle() {
        return this.mUiStyle;
    }

    public int getLastUiStyle() {
        return this.mLastUiStyle;
    }

    public void setUiStyle(int uiStyle) {
        Log.d("DataItemRunning", "setUiStyle: " + uiStyle);
        this.mLastUiStyle = this.mUiStyle;
        this.mUiStyle = uiStyle;
    }

    public void resetAll() {
        getValues().clear();
    }
}
