package com.android.camera.data.data.global;

import com.android.camera.Device;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentModuleList extends ComponentData {
    private int mIntentType;

    public ComponentModuleList(DataItemGlobal dataItemGlobal) {
        super(dataItemGlobal);
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String getKey(int mode) {
        return "pref_camera_mode_key_intent_" + this.mIntentType;
    }

    public String getDefaultValue(int currentMode) {
        return null;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public void reInit() {
    }

    private List<ComponentDataItem> initItems() {
        if (this.mIntentType == -1) {
            throw new RuntimeException("parse intent first!");
        }
        List<ComponentDataItem> items = new ArrayList();
        if (this.mIntentType == 0) {
            items.add(new ComponentDataItem(-1, -1, R.string.module_name_fun, String.valueOf(161)));
        }
        if (this.mIntentType == 2 || this.mIntentType == 0) {
            items.add(new ComponentDataItem(-1, -1, R.string.module_name_video, String.valueOf(162)));
        }
        if (this.mIntentType == 3) {
            items.add(new ComponentDataItem(-1, -1, R.string.module_name_capture, String.valueOf(163)));
        } else if (this.mIntentType == 1 || this.mIntentType == 0) {
            items.add(new ComponentDataItem(-1, -1, R.string.module_name_capture, String.valueOf(163)));
            if (Device.isSupportedPortrait()) {
                items.add(new ComponentDataItem(-1, -1, R.string.module_name_portrait, String.valueOf(171)));
            }
            items.add(new ComponentDataItem(-1, -1, R.string.module_name_square, String.valueOf(165)));
            if (this.mIntentType == 0) {
                items.add(new ComponentDataItem(-1, -1, R.string.module_name_panorama, String.valueOf(166)));
            }
            items.add(new ComponentDataItem(-1, -1, R.string.module_name_manual, String.valueOf(167)));
        }
        return items;
    }

    public int getMode(int position) {
        return Integer.valueOf(((ComponentDataItem) this.mItems.get(position)).mValue).intValue();
    }

    public void setIntentType(int intentType) {
        this.mIntentType = intentType;
        if (this.mItems != null) {
            this.mItems.clear();
        }
        this.mItems = initItems();
    }
}
