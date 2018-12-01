package com.android.camera.data.data.runing;

import android.support.v7.recyclerview.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningTimer extends ComponentData {
    public ComponentRunningTimer(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_delay_capture_title;
    }

    public String getKey(int mode) {
        return "pref_delay_capture_mode";
    }

    public String getDefaultValue(int currentMode) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> items = new ArrayList();
        items.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_delay_capture_title, "0"));
        items.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer_3s, R.string.pref_camera_delay_capture_entry_3s, "3"));
        items.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer_5s, R.string.pref_camera_delay_capture_entry_5s, "5"));
        return items;
    }

    public boolean isSwitchOn() {
        return getComponentValue(160).equals("0") ^ 1;
    }

    public int getTimer() {
        return Integer.valueOf(getComponentValue(160)).intValue();
    }

    public String getNextValue() {
        String value = getComponentValue(160);
        if ("0".equals(value)) {
            return "3";
        }
        if ("3".equals(value)) {
            return "5";
        }
        if ("5".equals(value)) {
            return "0";
        }
        return "0";
    }
}
