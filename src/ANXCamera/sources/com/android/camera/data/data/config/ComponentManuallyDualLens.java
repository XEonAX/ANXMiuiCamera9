package com.android.camera.data.data.config;

import android.support.v7.recyclerview.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyDualLens extends ComponentData {
    public ComponentManuallyDualLens(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_zoom_mode_title;
    }

    public String getKey(int mode) {
        switch (mode) {
            case 167:
                return "pref_camera_manually_lens";
            default:
                return "pref_camera_zoom_mode_key";
        }
    }

    public String getDefaultValue(int currentMode) {
        return "wide";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> items = new ArrayList();
        items.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_wide, "wide"));
        items.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_tele, "tele"));
        return items;
    }
}
