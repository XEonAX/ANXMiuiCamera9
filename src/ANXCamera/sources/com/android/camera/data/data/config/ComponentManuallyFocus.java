package com.android.camera.data.data.config;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyFocus extends ComponentData {
    public ComponentManuallyFocus(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_qc_focus_position_title;
    }

    public String getKey(int mode) {
        return "pref_focus_position_key";
    }

    public String getDefaultValue(int currentMode) {
        return "1000";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> items = new ArrayList();
        items.add(new ComponentDataItem(-1, -1, R.string.pref_camera_focusmode_entry_auto, "1000"));
        items.add(new ComponentDataItem(-1, -1, R.string.pref_camera_focusmode_entry_auto, "manual"));
        return items;
    }

    @StringRes
    public int getValueDisplayString(int mode) {
        if (Integer.valueOf(getComponentValue(mode)).intValue() == 1000) {
            return R.string.pref_camera_focusmode_entry_auto;
        }
        return -2;
    }

    @DrawableRes
    public int getValueSelectedDrawable(int mode) {
        int focus = Integer.valueOf(getComponentValue(mode)).intValue();
        if (focus == 1000) {
            return -1;
        }
        if (((double) focus) >= 600.0d) {
            return R.drawable.ic_focusmode_macro;
        }
        if (((double) focus) >= 200.0d) {
            return R.drawable.ic_focusmode_normal;
        }
        return R.drawable.ic_focusmode_infinity;
    }
}
