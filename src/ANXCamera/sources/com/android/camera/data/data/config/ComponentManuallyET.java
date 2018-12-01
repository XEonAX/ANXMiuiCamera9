package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.util.Range;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyET extends ComponentData {
    private static final String TAG = ComponentManuallyET.class.getSimpleName();
    private ComponentDataItem[] mFullItems;

    public ComponentManuallyET(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_manual_exposure_title;
    }

    public String getKey(int mode) {
        return "pref_qc_camera_exposuretime_key";
    }

    public String getDefaultValue(int currentMode) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public int getValueDisplayString(int mode) {
        String value = getComponentValue(mode);
        for (ComponentDataItem dataItem : getFullItems()) {
            if (dataItem.mValue.equals(value)) {
                return dataItem.mDisplayNameRes;
            }
        }
        throw new IllegalArgumentException("invalid value");
    }

    public String getComponentValue(int mode) {
        String value = super.getComponentValue(mode);
        List<ComponentDataItem> currentItems = getItems();
        if (currentItems.isEmpty()) {
            return value;
        }
        String maxValue = ((ComponentDataItem) currentItems.get(currentItems.size() - 1)).mValue;
        if (Long.parseLong(value) <= Long.parseLong(maxValue)) {
            return value;
        }
        setComponentValue(mode, maxValue);
        return maxValue;
    }

    @TargetApi(21)
    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> resultItems = new ArrayList();
        Range<Long> timeRange = Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getExposureTimeRange();
        ComponentDataItem[] fullItems = getFullItems();
        resultItems.add(fullItems[0]);
        if (timeRange != null) {
            long minExposure = ((Long) timeRange.getLower()).longValue();
            long maxExposure = ((Long) timeRange.getUpper()).longValue();
            for (int i = 1; i < fullItems.length; i++) {
                ComponentDataItem componentDataItem = fullItems[i];
                long entryValue = Long.parseLong(componentDataItem.mValue);
                if (minExposure <= entryValue && entryValue <= maxExposure) {
                    resultItems.add(componentDataItem);
                }
            }
        }
        return resultItems;
    }

    private ComponentDataItem[] getFullItems() {
        if (this.mFullItems != null) {
            return this.mFullItems;
        }
        this.mFullItems = new ComponentDataItem[]{new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_auto, "0"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_1000, "1000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_500, "2000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_250, "4000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_125, "8000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_60, "16667000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_30, "33333000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_15, "66667000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_8, "125000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_4, "250000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_2, "500000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_1, "1000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_0_5, "2000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_4s, "4000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_8s, "8000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_16s, "16000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_32s, "32000000000")};
        return this.mFullItems;
    }
}
