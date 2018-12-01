package com.android.camera.preferences;

import android.content.SharedPreferences.Editor;
import java.util.HashMap;

public class SettingsOverrider {
    private HashMap<String, String> mRestoredMap = new HashMap();

    public void overrideSettings(String... keyValues) {
        CameraSettingPreferences preferences = CameraSettingPreferences.instance();
        Editor editor = preferences.edit();
        synchronized (this.mRestoredMap) {
            this.mRestoredMap.clear();
            for (int i = 0; i < keyValues.length; i += 2) {
                String key = keyValues[i];
                String overrideValue = keyValues[i + 1];
                this.mRestoredMap.put(key, preferences.getString(key, null));
                if (overrideValue == null) {
                    editor.remove(key);
                } else {
                    editor.putString(key, overrideValue);
                }
            }
            editor.apply();
        }
    }

    public boolean restoreSettings() {
        CameraSettingPreferences preferences = CameraSettingPreferences.instance();
        Editor editor = preferences.edit();
        boolean change = false;
        synchronized (this.mRestoredMap) {
            for (String key : this.mRestoredMap.keySet()) {
                String overrideValue = preferences.getString(key, null);
                String restoreValue = (String) this.mRestoredMap.get(key);
                if (restoreValue == null) {
                    editor.remove(key);
                    if (overrideValue != null) {
                        change = true;
                    }
                } else {
                    editor.putString(key, restoreValue);
                    if (!restoreValue.equals(overrideValue)) {
                        change = true;
                    }
                }
            }
            this.mRestoredMap.clear();
        }
        editor.apply();
        return change;
    }
}
