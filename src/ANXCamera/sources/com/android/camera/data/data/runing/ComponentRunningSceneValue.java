package com.android.camera.data.data.runing;

import android.support.v7.recyclerview.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningSceneValue extends ComponentData {
    public ComponentRunningSceneValue(DataItemRunning dataItemBase) {
        super(dataItemBase);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_scenemode_title;
    }

    public String getKey(int mode) {
        return "pref_camera_scenemode_key";
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

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> componentDataItemList = new ArrayList();
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_auto_normal, R.drawable.ic_scene_mode_auto_normal, R.string.pref_camera_scenemode_entry_auto, "0"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_portrait_normal, R.drawable.ic_scene_mode_portrait_normal, R.string.pref_camera_scenemode_entry_portrait, "3"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_landscape_normal, R.drawable.ic_scene_mode_landscape_normal, R.string.pref_camera_scenemode_entry_landscape, "4"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_sports_normal, R.drawable.ic_scene_mode_sports_normal, R.string.pref_camera_scenemode_entry_sports, "13"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_night_normal, R.drawable.ic_scene_mode_night_normal, R.string.pref_camera_scenemode_entry_night, "5"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_night_portrait_normal, R.drawable.ic_scene_mode_night_portrait_normal, R.string.pref_camera_scenemode_entry_night_portrait, "6"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_beach_normal, R.drawable.ic_scene_mode_beach_normal, R.string.pref_camera_scenemode_entry_beach, "8"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_snow_normal, R.drawable.ic_scene_mode_snow_normal, R.string.pref_camera_scenemode_entry_snow, "9"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_sunset_normal, R.drawable.ic_scene_mode_sunset_normal, R.string.pref_camera_scenemode_entry_sunset, "10"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_fireworks_normal, R.drawable.ic_scene_mode_fireworks_normal, R.string.pref_camera_scenemode_entry_fireworks, "12"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_backlight_normal, R.drawable.ic_scene_mode_backlight_normal, R.string.pref_camera_scenemode_entry_backlight, "backlight"));
        componentDataItemList.add(new ComponentDataItem(R.drawable.ic_scene_mode_flowers_normal, R.drawable.ic_scene_mode_flowers_normal, R.string.pref_camera_scenemode_entry_flowers, "flowers"));
        return componentDataItemList;
    }
}
