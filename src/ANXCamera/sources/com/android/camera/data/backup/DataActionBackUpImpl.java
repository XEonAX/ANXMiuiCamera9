package com.android.camera.data.backup;

import android.support.v4.util.SimpleArrayMap;
import android.util.SparseArray;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.FilterInfo;

public class DataActionBackUpImpl implements DataBackUp {
    private SparseArray<SparseArray<SimpleArrayMap>> mBackupArrays;

    public void backupRunning(DataItemRunning itemRunning, int key, int backupCameraId, boolean needClear) {
        if (this.mBackupArrays == null) {
            this.mBackupArrays = new SparseArray();
        }
        SparseArray<SimpleArrayMap> modeBackups = (SparseArray) this.mBackupArrays.get(key);
        if (modeBackups == null) {
            modeBackups = new SparseArray();
        }
        modeBackups.put(backupCameraId, itemRunning.cloneValues());
        this.mBackupArrays.put(key, modeBackups);
        if (needClear) {
            itemRunning.resetAll();
        }
    }

    public void revertRunning(DataItemRunning itemRunning, int key, int currentCameraId) {
        itemRunning.resetAll();
        if (this.mBackupArrays != null) {
            SparseArray<SimpleArrayMap> modeBackups = (SparseArray) this.mBackupArrays.get(key);
            if (!(modeBackups == null || modeBackups.get(currentCameraId) == null)) {
                SimpleArrayMap<String, Object> backupValues = (SimpleArrayMap) modeBackups.get(currentCameraId);
                itemRunning.getValues().clear();
                itemRunning.getValues().putAll(backupValues);
            }
        }
    }

    public void clearBackUp() {
        if (this.mBackupArrays != null) {
            this.mBackupArrays.clear();
        }
    }

    public SimpleArrayMap getBackupRunning(int key, int backupCameraId) {
        if (this.mBackupArrays == null) {
            return null;
        }
        SparseArray<SimpleArrayMap> modeBackups = (SparseArray) this.mBackupArrays.get(key);
        if (modeBackups == null) {
            return null;
        }
        return (SimpleArrayMap) modeBackups.get(backupCameraId);
    }

    public boolean isLastVideoFastMotion() {
        SimpleArrayMap simpleArrayMap = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(169), 0);
        if (simpleArrayMap == null) {
            return false;
        }
        Boolean state = (Boolean) simpleArrayMap.get("pref_video_speed_fast_key");
        if (state == null) {
            return false;
        }
        return state.booleanValue();
    }

    public boolean isLastVideoSlowMotion() {
        SimpleArrayMap simpleArrayMap = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(168), 0);
        if (simpleArrayMap == null) {
            return false;
        }
        Boolean state = (Boolean) simpleArrayMap.get("pref_video_speed_slow_key");
        if (state == null) {
            return false;
        }
        return state.booleanValue();
    }

    public boolean isLastVideoHFRMode() {
        SimpleArrayMap simpleArrayMap = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(170), 0);
        if (simpleArrayMap == null) {
            return false;
        }
        Boolean state = (Boolean) simpleArrayMap.get("pref_video_speed_hfr_key");
        if (state == null) {
            return false;
        }
        return state.booleanValue();
    }

    public String getBackupFilter(int mode, int backupCameraId) {
        SimpleArrayMap simpleArrayMap = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(mode), backupCameraId);
        if (simpleArrayMap == null) {
            return String.valueOf(FilterInfo.FILTER_ID_NONE);
        }
        String filter = (String) simpleArrayMap.get("pref_camera_shader_coloreffect_key");
        if (filter == null) {
            filter = String.valueOf(FilterInfo.FILTER_ID_NONE);
        }
        return filter;
    }
}
