package com.android.camera.data.data.config;

import android.support.v7.recyclerview.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import java.util.List;

public class ComponentManuallyDualZoom extends ComponentData {
    public ComponentManuallyDualZoom(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_zoom_value_title;
    }

    public String getKey(int mode) {
        return "pref_camera_zoom_dual_key";
    }

    public String getDefaultValue(int currentMode) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }
}
