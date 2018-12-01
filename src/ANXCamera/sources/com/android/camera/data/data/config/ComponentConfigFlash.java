package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

@TargetApi(21)
public class ComponentConfigFlash extends ComponentData {
    private boolean mIsClosed;

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void setClosed(boolean close) {
        this.mIsClosed = close;
    }

    public ComponentConfigFlash(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_off, R.drawable.ic_config_flash_off, R.string.pref_camera_flashmode_entry_off, "0"));
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_flashmode_title;
    }

    public String getKey(int mode) {
        switch (mode) {
            case 160:
                throw new RuntimeException("unspecified flash");
            case 161:
            case 162:
            case 168:
            case 169:
            case 170:
                return "pref_camera_video_flashmode_key";
            default:
                return "pref_camera_flashmode_key";
        }
    }

    public String getDefaultValue(int mode) {
        return "0";
    }

    public String getComponentValue(int mode) {
        if (isClosed()) {
            return "0";
        }
        if (isEmpty()) {
            return "0";
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
        switch (currentMode) {
            case 166:
            case 171:
                if (cameraId == 0) {
                    return this.mItems;
                }
                break;
        }
        if (p.isFlashSupported()) {
            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_off, R.drawable.ic_config_flash_off, R.string.pref_camera_flashmode_entry_off, "0"));
            switch (currentMode) {
                case 161:
                case 162:
                case 168:
                case 169:
                case 170:
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_torch, R.drawable.ic_config_flash_torch, R.string.pref_camera_flashmode_entry_torch, "2"));
                    break;
                default:
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_auto, R.drawable.ic_config_flash_auto, R.string.pref_camera_flashmode_entry_auto, "3"));
                    if (CameraSettings.isBackCamera()) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_on, R.drawable.ic_config_flash_on, R.string.pref_camera_flashmode_entry_on, "1"));
                    }
                    if (!CameraSettings.isFrontCamera() || !Device.isSupportFrontFlash()) {
                        if (Device.isSupportedTorchCapture()) {
                            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_torch, R.drawable.ic_config_flash_torch, R.string.pref_camera_flashmode_entry_torch, "2"));
                            break;
                        }
                    }
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_on, R.drawable.ic_config_flash_on, R.string.pref_camera_flashmode_entry_on, "2"));
                    break;
                    break;
            }
            return this.mItems;
        }
        if (cameraId == 1 && Device.isSupportScreenLight() && (currentMode == 163 || currentMode == 165 || currentMode == 171)) {
            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_off, R.drawable.ic_config_flash_off, R.string.pref_camera_flashmode_entry_off, "0"));
            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_auto, R.drawable.ic_config_flash_auto, R.string.pref_camera_flashmode_entry_auto, "103"));
            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_flash_on, R.drawable.ic_config_flash_on, R.string.pref_camera_flashmode_entry_on, "101"));
        }
        return this.mItems;
    }

    public int getValueSelectedDrawableIgnoreClose(int mode) {
        int i = R.drawable.ic_config_flash_on;
        String value = getComponentValue(mode);
        if ("1".equals(value)) {
            return R.drawable.ic_config_flash_on;
        }
        if ("3".equals(value)) {
            return R.drawable.ic_config_flash_auto;
        }
        if ("0".equals(value)) {
            return R.drawable.ic_config_flash_off;
        }
        if ("2".equals(value)) {
            if (!CameraSettings.isFrontCamera()) {
                i = R.drawable.ic_config_flash_torch;
            }
            return i;
        } else if ("103".equals(value)) {
            return R.drawable.ic_config_flash_auto;
        } else {
            if ("101".equals(value)) {
                return R.drawable.ic_config_flash_on;
            }
            return -1;
        }
    }

    public void clearClosed() {
        this.mIsClosed = false;
    }

    public int getValueSelectedStringIdIgnoreClose(int mode) {
        int i = R.string.accessibility_flash_on;
        String value = getComponentValue(mode);
        if ("1".equals(value)) {
            return R.string.accessibility_flash_on;
        }
        if ("3".equals(value)) {
            return R.string.accessibility_flash_auto;
        }
        if ("0".equals(value)) {
            return R.string.accessibility_flash_off;
        }
        if ("2".equals(value)) {
            if (!CameraSettings.isFrontCamera()) {
                i = R.string.accessibility_flash_torch;
            }
            return i;
        } else if ("103".equals(value)) {
            return R.string.accessibility_flash_auto;
        } else {
            if ("101".equals(value)) {
                return R.string.accessibility_flash_on;
            }
            return -1;
        }
    }

    public boolean isValidFlashValue(String value) {
        return value.matches("^[0-9]+$");
    }
}
