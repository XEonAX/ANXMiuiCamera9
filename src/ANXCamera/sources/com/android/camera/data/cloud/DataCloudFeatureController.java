package com.android.camera.data.cloud;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.util.Log;
import com.android.camera.CameraAppImpl;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import java.util.Collection;

public class DataCloudFeatureController implements DataCloud$CloudFeature {
    private static final String TAG = DataCloudFeatureController.class.getSimpleName();
    private SharedPreferences mPreferences;
    private boolean mReady;

    private SharedPreferences getSharedPreferences() {
        if (this.mPreferences == null) {
            initPreferences();
        }
        return this.mPreferences;
    }

    private void initPreferences() {
        this.mPreferences = CameraAppImpl.getAndroidContext().getSharedPreferences(provideKey(), 0);
    }

    public SupportedConfigs filterFeature(SupportedConfigs configs) {
        if (!this.mReady) {
            return configs;
        }
        SupportedConfigs filteredConfigs = new SupportedConfigs();
        SharedPreferences sharedPreferences = getSharedPreferences();
        for (int i = 0; i < configs.getLength(); i++) {
            int config = configs.getConfig(i);
            boolean enable = true;
            try {
                enable = sharedPreferences.getBoolean(SupportedConfigFactory.getConfigKey(config), true);
            } catch (RuntimeException e) {
                Log.w(TAG, "unknown config " + config);
            }
            if (enable) {
                filteredConfigs.add(config);
            }
        }
        return filteredConfigs;
    }

    public Collection<String> getAllDisabledFeatures() {
        return getSharedPreferences().getAll().keySet();
    }

    public Editor editor() {
        return getSharedPreferences().edit();
    }

    public void setReady(boolean ready) {
        this.mReady = ready;
    }

    public String provideKey() {
        return "cloud_feature";
    }
}
