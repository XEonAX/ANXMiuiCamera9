package com.android.camera.data.data.config;

import android.support.v7.recyclerview.R;
import android.util.SparseBooleanArray;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigBeauty extends ComponentData {
    public static final String BEAUTY_CLOSE = BeautyConstant.LEVEL_CLOSE;
    public static final String BEAUTY_DEEP = BeautyConstant.LEVEL_XXXHIGH;
    public static final String BEAUTY_DEEP_LEGACY = BeautyConstant.LEVEL_HIGH;
    public static final String BEAUTY_LOW = BeautyConstant.LEVEL_HIGH;
    public static final String BEAUTY_LOW_LEGACY = BeautyConstant.LEVEL_LOW;
    private static final String TAG = ComponentConfigBeauty.class.getSimpleName();
    private SparseBooleanArray mIsClosed;

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

    public ComponentConfigBeauty(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_off, R.string.pref_camera_beauty, BEAUTY_CLOSE));
        if (Device.isLegacyFaceBeauty()) {
            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_low, R.string.pref_camera_beauty, BEAUTY_LOW_LEGACY));
            this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_height, R.string.pref_camera_beauty_deep, BEAUTY_DEEP_LEGACY));
            return;
        }
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_low, R.string.pref_camera_beauty, BEAUTY_LOW));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_height, R.string.pref_camera_beauty_deep, BEAUTY_DEEP));
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public boolean isSwitchOn(int mode) {
        return getComponentValue(mode).equals(BEAUTY_CLOSE) ^ 1;
    }

    public String getKey(int mode) {
        return "pref_camera_face_beauty_key";
    }

    public String getDefaultValue(int currentMode) {
        return BEAUTY_CLOSE;
    }

    public String getComponentValue(int mode) {
        if (isClosed(mode)) {
            return BEAUTY_CLOSE;
        }
        String value = super.getComponentValue(mode);
        if (Device.isLegacyFaceBeauty()) {
            if (BeautyConstant.LEVEL_MEDIUM.equals(value)) {
                value = BEAUTY_DEEP_LEGACY;
            } else if (BeautyConstant.LEVEL_XHIGH.equals(value) || BeautyConstant.LEVEL_XXHIGH.equals(value) || BeautyConstant.LEVEL_XXXHIGH.equals(value)) {
                String defaultValue = CameraSettings.getFaceBeautyDefaultValue();
                Log.e(TAG, "reset invalid beauty level " + value + " to " + defaultValue);
                value = defaultValue;
            }
        } else if (BeautyConstant.LEVEL_LOW.equals(value) || BeautyConstant.LEVEL_MEDIUM.equals(value)) {
            value = BEAUTY_LOW;
        } else if (BeautyConstant.LEVEL_XHIGH.equals(value) || BeautyConstant.LEVEL_XXHIGH.equals(value)) {
            value = BEAUTY_DEEP;
        }
        return value;
    }

    public String getPersistValue(int mode) {
        return super.getComponentValue(mode);
    }

    public void setComponentValue(int mode, String newValue) {
        setClosed(false, mode);
        super.setComponentValue(mode, newValue);
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getNextValue(int mode) {
        String value = getComponentValue(mode);
        if (Device.isLegacyFaceBeauty()) {
            if (BEAUTY_CLOSE.equals(value)) {
                return BEAUTY_LOW_LEGACY;
            }
            if (BEAUTY_LOW_LEGACY.equals(value)) {
                return BEAUTY_DEEP_LEGACY;
            }
            if (BEAUTY_DEEP.equals(value)) {
                return BEAUTY_CLOSE;
            }
        } else if (BEAUTY_CLOSE.equals(value)) {
            return BEAUTY_LOW;
        } else {
            if (BEAUTY_LOW.equals(value)) {
                return BEAUTY_DEEP;
            }
            if (BEAUTY_DEEP.equals(value)) {
                return BEAUTY_CLOSE;
            }
        }
        return BEAUTY_CLOSE;
    }

    public void clearClosed() {
        if (this.mIsClosed != null) {
            this.mIsClosed.clear();
        }
    }
}
