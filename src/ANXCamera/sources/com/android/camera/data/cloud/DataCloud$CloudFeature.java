package com.android.camera.data.cloud;

import android.content.SharedPreferences.Editor;
import com.android.camera.data.data.config.SupportedConfigs;
import java.util.Collection;

public interface DataCloud$CloudFeature {
    Editor editor();

    SupportedConfigs filterFeature(SupportedConfigs supportedConfigs);

    Collection<String> getAllDisabledFeatures();

    void setReady(boolean z);
}
