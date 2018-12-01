package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.util.Range;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

@TargetApi(21)
public class ComponentManuallyISO extends ComponentData {
    private ComponentDataItem[] mFullItems;

    public ComponentManuallyISO(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_iso_title;
    }

    public String getKey(int mode) {
        return "pref_qc_camera_iso_key";
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

    protected boolean checkValueValid(String value) {
        return Util.isStringValueContained((Object) value, (int) R.array.pref_camera_iso_entryvalues);
    }

    protected void resetComponentValue(int mode) {
        setComponentValue(mode, getDefaultValue(mode));
    }

    public String getComponentValue(int mode) {
        String value = super.getComponentValue(mode);
        List<ComponentDataItem> currentItems = getItems();
        if (currentItems.isEmpty()) {
            return value;
        }
        String maxValue = ((ComponentDataItem) currentItems.get(currentItems.size() - 1)).mValue;
        if (Integer.parseInt(value) > Integer.parseInt(maxValue)) {
            return maxValue;
        }
        return value;
    }

    private List<ComponentDataItem> initItems() {
        CameraCapabilities cc = Camera2DataContainer.getInstance().getCurrentCameraCapabilities();
        List<ComponentDataItem> resultItems = new ArrayList();
        ComponentDataItem[] fullItems = getFullItems();
        resultItems.add(fullItems[0]);
        Range<Integer> range = cc.getIsoRange();
        if (range != null) {
            int minIso = ((Integer) range.getLower()).intValue();
            int maxIso = ((Integer) range.getUpper()).intValue();
            for (int i = 1; i < fullItems.length; i++) {
                ComponentDataItem componentDataItem = fullItems[i];
                int entryValue = Integer.parseInt(componentDataItem.mValue);
                if (i == 0 || (minIso <= entryValue && entryValue <= maxIso)) {
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
        this.mFullItems = new ComponentDataItem[]{new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_auto, "0"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso100, "100"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso200, "200"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso400, "400"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso800, "800"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso1600, "1600"), new ComponentDataItem(-1, -1, R.string.pref_camera_iso_entry_iso3200, "3200")};
        return this.mFullItems;
    }
}
