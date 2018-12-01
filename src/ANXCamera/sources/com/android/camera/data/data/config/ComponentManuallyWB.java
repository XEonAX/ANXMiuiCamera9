package com.android.camera.data.data.config;

import android.support.v7.recyclerview.R;
import com.android.camera.Device;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyWB extends ComponentData {
    public ComponentManuallyWB(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_whitebalance_title;
    }

    public String getKey(int mode) {
        return "pref_camera_whitebalance_key";
    }

    public String getDefaultValue(int currentMode) {
        return "1";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        ArrayList arrayList = new ArrayList();
        List<ComponentDataItem> items = new ArrayList();
        items.add(new ComponentDataItem(-1, -1, R.string.pref_camera_whitebalance_entry_auto, "1"));
        items.add(new ComponentDataItem(R.drawable.bg_white_balance_incandescent, R.drawable.ic_white_balance_incandescent, -2, "2"));
        items.add(new ComponentDataItem(R.drawable.bg_white_balance_sunlight, R.drawable.ic_white_balance_sunlight, -2, "5"));
        items.add(new ComponentDataItem(R.drawable.bg_white_balance_fluorescent, R.drawable.ic_white_balance_fluorescent, -2, "3"));
        items.add(new ComponentDataItem(R.drawable.bg_white_balance_cloudy, R.drawable.ic_white_balance_cloudy, -2, "6"));
        if (Device.isSupportedManualFunction()) {
            items.add(new ComponentDataItem(R.drawable.bg_white_balance_manual, R.drawable.ic_white_balance_manual, -2, "manual"));
        }
        return items;
    }

    public void setCustomWB(int value) {
        this.mParentDataItem.editor().putInt("pref_qc_manual_whitebalance_k_value_key", value).apply();
    }

    public int getCustomWB() {
        return this.mParentDataItem.getInt("pref_qc_manual_whitebalance_k_value_key", 4300);
    }
}
