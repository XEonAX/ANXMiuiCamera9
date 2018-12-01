package com.android.camera.preferences;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import java.util.Map;
import java.util.Set;

public class CameraSettingPreferences implements SharedPreferences {
    private static CameraSettingPreferences sPreferences = new CameraSettingPreferences();

    private class MyEditor implements Editor {
        private ProviderEditor mEditorConfig = DataRepository.dataItemConfig().editor();
        private ProviderEditor mEditorGlobal = DataRepository.dataItemGlobal().editor();
        private ProviderEditor mEditorRunning = DataRepository.dataItemRunning().editor();

        MyEditor() {
        }

        public boolean commit() {
            return this.mEditorGlobal.commit() ? this.mEditorConfig.commit() : false;
        }

        public void apply() {
            this.mEditorGlobal.apply();
            this.mEditorConfig.apply();
        }

        public Editor clear() {
            this.mEditorGlobal.clear();
            this.mEditorConfig.clear();
            this.mEditorRunning.clear();
            return this;
        }

        public Editor remove(String key) {
            this.mEditorGlobal.remove(key);
            this.mEditorConfig.remove(key);
            this.mEditorRunning.remove(key);
            return this;
        }

        public Editor putString(String key, String value) {
            if (CameraSettings.isCameraSpecific(key)) {
                this.mEditorConfig.putString(key, value);
            } else if (CameraSettings.isTransient(key)) {
                this.mEditorRunning.putString(key, value);
            } else {
                this.mEditorGlobal.putString(key, value);
            }
            return this;
        }

        public Editor putInt(String key, int value) {
            if (CameraSettings.isCameraSpecific(key)) {
                this.mEditorConfig.putInt(key, value);
            } else if (CameraSettings.isTransient(key)) {
                this.mEditorRunning.putInt(key, value);
            } else {
                this.mEditorGlobal.putInt(key, value);
            }
            return this;
        }

        public Editor putLong(String key, long value) {
            if (CameraSettings.isCameraSpecific(key)) {
                this.mEditorConfig.putLong(key, value);
            } else if (CameraSettings.isTransient(key)) {
                this.mEditorRunning.putLong(key, value);
            } else {
                this.mEditorGlobal.putLong(key, value);
            }
            return this;
        }

        public Editor putFloat(String key, float value) {
            if (CameraSettings.isCameraSpecific(key)) {
                this.mEditorConfig.putFloat(key, value);
            } else if (CameraSettings.isTransient(key)) {
                this.mEditorRunning.putFloat(key, value);
            } else {
                this.mEditorGlobal.putFloat(key, value);
            }
            return this;
        }

        public Editor putBoolean(String key, boolean value) {
            if (CameraSettings.isCameraSpecific(key)) {
                this.mEditorConfig.putBoolean(key, value);
            } else if (CameraSettings.isTransient(key)) {
                this.mEditorRunning.putBoolean(key, value);
            } else {
                this.mEditorGlobal.putBoolean(key, value);
            }
            return this;
        }

        public Editor putStringSet(String key, Set<String> set) {
            throw new UnsupportedOperationException();
        }
    }

    private CameraSettingPreferences() {
    }

    public static synchronized CameraSettingPreferences instance() {
        CameraSettingPreferences cameraSettingPreferences;
        synchronized (CameraSettingPreferences.class) {
            cameraSettingPreferences = sPreferences;
        }
        return cameraSettingPreferences;
    }

    public Map<String, ?> getAll() {
        return null;
    }

    public String getString(String key, String defValue) {
        if (CameraSettings.isCameraSpecific(key)) {
            return DataRepository.dataItemConfig().getString(key, defValue);
        }
        if (CameraSettings.isTransient(key)) {
            return DataRepository.dataItemRunning().getString(key, defValue);
        }
        return DataRepository.dataItemGlobal().getString(key, defValue);
    }

    public int getInt(String key, int defValue) {
        if (CameraSettings.isCameraSpecific(key)) {
            return DataRepository.dataItemConfig().getInt(key, defValue);
        }
        if (CameraSettings.isTransient(key)) {
            return DataRepository.dataItemRunning().getInt(key, defValue);
        }
        return DataRepository.dataItemGlobal().getInt(key, defValue);
    }

    public long getLong(String key, long defValue) {
        if (CameraSettings.isCameraSpecific(key)) {
            return DataRepository.dataItemConfig().getLong(key, defValue);
        }
        if (CameraSettings.isTransient(key)) {
            return DataRepository.dataItemRunning().getLong(key, defValue);
        }
        return DataRepository.dataItemGlobal().getLong(key, defValue);
    }

    public float getFloat(String key, float defValue) {
        if (CameraSettings.isCameraSpecific(key)) {
            return DataRepository.dataItemConfig().getFloat(key, defValue);
        }
        if (CameraSettings.isTransient(key)) {
            return DataRepository.dataItemRunning().getFloat(key, defValue);
        }
        return DataRepository.dataItemGlobal().getFloat(key, defValue);
    }

    public boolean getBoolean(String key, boolean defValue) {
        if (CameraSettings.isCameraSpecific(key)) {
            return DataRepository.dataItemConfig().getBoolean(key, defValue);
        }
        if (CameraSettings.isTransient(key)) {
            return DataRepository.dataItemRunning().getBoolean(key, defValue);
        }
        return DataRepository.dataItemGlobal().getBoolean(key, defValue);
    }

    public Set<String> getStringSet(String key, Set<String> set) {
        throw new UnsupportedOperationException();
    }

    public boolean contains(String key) {
        if (CameraSettings.isCameraSpecific(key)) {
            return DataRepository.dataItemConfig().contains(key);
        }
        if (CameraSettings.isTransient(key)) {
            return DataRepository.dataItemRunning().contains(key);
        }
        return DataRepository.dataItemGlobal().contains(key);
    }

    public Editor edit() {
        return new MyEditor();
    }

    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
    }

    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {
    }
}
