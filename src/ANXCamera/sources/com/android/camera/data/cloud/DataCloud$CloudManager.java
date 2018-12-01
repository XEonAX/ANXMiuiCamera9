package com.android.camera.data.cloud;

public interface DataCloud$CloudManager {
    DataCloud$CloudFeature DataCloudFeature();

    void fillCloudValues();

    DataCloud$CloudItem provideDataCloudConfig(int i);

    DataCloud$CloudItem provideDataCloudGlobal();
}
