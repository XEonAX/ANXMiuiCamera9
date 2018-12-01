package com.android.camera.data.data.config;

import android.support.v7.recyclerview.R;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigHdr extends ComponentData {
    private boolean mAutoSupported;
    private boolean mIsClosed;

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void setClosed(boolean close) {
        this.mIsClosed = close;
    }

    public ComponentConfigHdr(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_hdr_off, R.drawable.ic_config_hdr_off, R.string.pref_camera_hdr_entry_off, "off"));
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_hdr_title;
    }

    public String getKey(int mode) {
        switch (mode) {
            case 160:
                throw new RuntimeException("unspecified hdr");
            case 162:
            case 168:
            case 169:
            case 170:
                return "pref_video_hdr_key";
            default:
                return "pref_camera_hdr_key";
        }
    }

    public String getDefaultValue(int currentMode) {
        if (isClosed()) {
            return "off";
        }
        if (isEmpty()) {
            return "off";
        }
        if (CameraSettings.isFrontCamera()) {
            return "off";
        }
        if (this.mAutoSupported) {
            return "auto";
        }
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
        this.mAutoSupported = false;
        if (!p.isSupportHdr()) {
            return this.mItems;
        }
        switch (currentMode) {
            case 163:
            case 165:
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_hdr_off, R.drawable.ic_config_hdr_off, R.string.pref_camera_hdr_entry_off, "off"));
                if (p.isSupportAutoHdr()) {
                    this.mAutoSupported = true;
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_hdr_auto, R.drawable.ic_config_hdr_auto, R.string.pref_camera_hdr_entry_auto, "auto"));
                }
                if (!Device.IS_MI2 && (Device.isSupportedAoHDR() ^ 1) == 0) {
                    if (!Device.IS_MI2A) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_hdr_normal, R.drawable.ic_config_hdr_normal, R.string.pref_camera_hdr_entry_normal, "normal"));
                    }
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_hdr_live, R.drawable.ic_config_hdr_live, R.string.pref_camera_hdr_entry_live, "live"));
                    break;
                }
                this.mItems.add(new ComponentDataItem(R.drawable.ic_config_hdr_normal, R.drawable.ic_config_hdr_normal, R.string.pref_simple_hdr_entry_on, "normal"));
                break;
        }
        return this.mItems;
    }

    public int getValueSelectedDrawableIgnoreClose(int mode) {
        String value = getComponentValue(mode);
        if ("off".equals(value)) {
            return R.drawable.ic_config_hdr_off;
        }
        if ("auto".equals(value)) {
            return R.drawable.ic_config_hdr_auto;
        }
        if ("normal".equals(value)) {
            return R.drawable.ic_config_hdr_normal;
        }
        if ("live".equals(value)) {
            return R.drawable.ic_config_hdr_live;
        }
        if ("on".equals(value)) {
            return R.drawable.ic_config_hdr_normal;
        }
        return -1;
    }

    public void clearClosed() {
        this.mIsClosed = false;
    }

    public int getValueSelectedStringIdIgnoreClose(int mode) {
        String value = getComponentValue(mode);
        if ("off".equals(value)) {
            return R.string.accessibility_hdr_off;
        }
        if ("auto".equals(value)) {
            return R.string.accessibility_hdr_auto;
        }
        if ("normal".equals(value)) {
            return R.string.accessibility_hdr_on;
        }
        if ("live".equals(value)) {
            return R.string.accessibility_hdr_live;
        }
        if ("on".equals(value)) {
            return R.string.accessibility_hdr_on;
        }
        return -1;
    }
}
