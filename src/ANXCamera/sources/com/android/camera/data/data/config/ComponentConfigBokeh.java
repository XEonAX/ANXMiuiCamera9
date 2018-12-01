package com.android.camera.data.data.config;

import com.android.camera.Device;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigBokeh extends ComponentData {
    private boolean mIsClosed;

    public ComponentConfigBokeh(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void setClosed(boolean close) {
        this.mIsClosed = close;
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_bokeh_title;
    }

    public String getKey(int mode) {
        return "pref_camera_bokeh_key";
    }

    public String getDefaultValue(int currentMode) {
        return "off";
    }

    public String getComponentValue(int mode) {
        if (isClosed()) {
            return "off";
        }
        if (isEmpty()) {
            return "off";
        }
        return super.getComponentValue(mode);
    }

    public String getPersistValue(int mode) {
        return super.getComponentValue(mode);
    }

    public void setComponentValue(int mode, String newValue) {
        setClosed(false);
        super.setComponentValue(mode, newValue);
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public List<ComponentDataItem> reInit(int currentMode, int cameraId, CameraCapabilities p) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        if (!p.isSupportBokeh()) {
            return this.mItems;
        }
        if (cameraId == Camera2DataContainer.getInstance().getFrontCameraId() && (Device.isSupportedFrontPortrait() ^ 1) != 0) {
            this.mItems.add(new ComponentDataItem(R.drawable.ic_portrait_button_normal, R.drawable.ic_portrait_button_normal, R.string.pref_camera_front_bokeh_entry_off, "off"));
            this.mItems.add(new ComponentDataItem(R.drawable.ic_portrait_button_normal, R.drawable.ic_portrait_button_on, R.string.pref_camera_front_bokeh_entry_on, "on"));
        }
        return this.mItems;
    }

    public void toggle(int mode) {
        if ("on".equals(getComponentValue(mode))) {
            setComponentValue(mode, "off");
        } else {
            setComponentValue(mode, "on");
        }
    }

    public void clearClosed() {
        this.mIsClosed = false;
    }
}
