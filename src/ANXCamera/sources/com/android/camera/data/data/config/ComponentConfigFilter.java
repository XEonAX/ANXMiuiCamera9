package com.android.camera.data.data.config;

import android.util.SparseBooleanArray;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.FilterInfo;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigFilter extends ComponentData {
    private SparseBooleanArray mIsClosed;

    public ComponentConfigFilter(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public boolean isClosed(int mode) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        return this.mIsClosed.get(mode);
    }

    public void setClosed(boolean close, int mode) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        this.mIsClosed.put(mode, close);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_coloreffect_title;
    }

    public String getKey(int mode) {
        return "pref_camera_shader_coloreffect_key";
    }

    public String getDefaultValue(int currentMode) {
        return String.valueOf(FilterInfo.FILTER_ID_NONE);
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getComponentValue(int mode) {
        if (isClosed(mode)) {
            return String.valueOf(FilterInfo.FILTER_ID_NONE);
        }
        return super.getComponentValue(mode);
    }

    public void mapToItems(ArrayList<FilterInfo> filterInfoArrayList) {
        this.mItems = new ArrayList(filterInfoArrayList.size());
        for (FilterInfo filterInfo : filterInfoArrayList) {
            this.mItems.add(new ComponentDataItem(filterInfo.getIconResId(), filterInfo.getIconResId(), filterInfo.getNameResId(), String.valueOf(filterInfo.getId())));
        }
    }
}
