package com.android.camera.data.provider;

import android.util.SparseArray;
import com.android.camera.data.cloud.DataCloud$CloudManager;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.feature.DataItemFeature;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;

public class DataProviderMgr {
    private DataProvider mDataProvider;

    private final class DataProviderImpl implements DataProvider {
        private DataCloud$CloudManager mDataCloudManager;
        private DataItemGlobal mDataGlobal = new DataItemGlobal();
        private SparseArray<DataItemConfig> mDataItemConfigs;
        private DataItemFeature mDataItemFeature;
        private DataItemRunning mDataRunning;

        public DataProviderImpl(DataCloud$CloudManager dataCloudManager) {
            this.mDataCloudManager = dataCloudManager;
            this.mDataGlobal.injectCloud(dataCloudManager.provideDataCloudGlobal());
            this.mDataItemConfigs = new SparseArray(4);
            this.mDataRunning = new DataItemRunning();
            this.mDataItemFeature = new DataItemFeature();
        }

        public DataItemConfig dataConfig(int cameraId, int intentType) {
            int localId = DataItemConfig.provideLocalId(cameraId, intentType);
            DataItemConfig dataItemConfig = (DataItemConfig) this.mDataItemConfigs.get(localId);
            if (dataItemConfig != null) {
                return dataItemConfig;
            }
            dataItemConfig = new DataItemConfig(cameraId, intentType);
            dataItemConfig.injectCloud(this.mDataCloudManager.provideDataCloudConfig(cameraId));
            this.mDataItemConfigs.put(localId, dataItemConfig);
            return dataItemConfig;
        }

        public DataItemGlobal dataGlobal() {
            return this.mDataGlobal;
        }

        public DataItemConfig dataConfig() {
            return dataConfig(dataGlobal().getCurrentCameraId(), dataGlobal().getIntentType());
        }

        public DataItemConfig dataNormalConfig() {
            return dataConfig(dataGlobal().getCurrentCameraId(), 0);
        }

        public DataItemRunning dataRunning() {
            return this.mDataRunning;
        }

        public DataItemConfig dataConfig(int cameraId) {
            return dataConfig(cameraId, dataGlobal().getIntentType());
        }

        public DataItemFeature dataFeature() {
            return this.mDataItemFeature;
        }
    }

    public DataProviderMgr(DataCloud$CloudManager dataCloudMgr) {
        this.mDataProvider = new DataProviderImpl(dataCloudMgr);
    }

    public DataProvider provider() {
        return this.mDataProvider;
    }
}
