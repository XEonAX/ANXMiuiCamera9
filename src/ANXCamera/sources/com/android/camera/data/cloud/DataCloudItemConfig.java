package com.android.camera.data.cloud;

public class DataCloudItemConfig extends DataCloudItemBase {
    private int mCameraId;

    public DataCloudItemConfig(int cameraId) {
        this.mCameraId = cameraId;
    }

    public String provideKey() {
        return "cloud_item_" + this.mCameraId;
    }
}
