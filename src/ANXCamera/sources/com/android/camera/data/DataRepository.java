package com.android.camera.data;

import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.backup.DataBackUpMgr;
import com.android.camera.data.cloud.DataCloud$CloudManager;
import com.android.camera.data.cloud.DataCloudMgr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.feature.DataItemFeature;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider;
import com.android.camera.data.provider.DataProviderMgr;
import com.android.camera.data.restore.DataRestoreMgr;

public class DataRepository {
    private static DataRepository sInstance;
    private DataBackUpMgr mDataBackUp = new DataBackUpMgr();
    private DataCloud$CloudManager mDataCloudMgr = new DataCloudMgr();
    private DataProviderMgr mDataProvider = new DataProviderMgr(this.mDataCloudMgr);
    private DataRestoreMgr mDataRestore = new DataRestoreMgr();

    public static DataRepository getInstance() {
        if (sInstance == null) {
            synchronized (DataRepository.class) {
                if (sInstance == null) {
                    sInstance = new DataRepository();
                }
            }
        }
        return sInstance;
    }

    public DataBackUp backUp() {
        return this.mDataBackUp.backUp();
    }

    public static DataProvider provider() {
        return getInstance().mDataProvider.provider();
    }

    public static DataItemRunning dataItemRunning() {
        return (DataItemRunning) provider().dataRunning();
    }

    public static DataItemGlobal dataItemGlobal() {
        return (DataItemGlobal) provider().dataGlobal();
    }

    public static DataItemConfig dataItemConfig() {
        return (DataItemConfig) provider().dataConfig();
    }

    public static DataItemConfig dataNormalItemConfig() {
        return (DataItemConfig) provider().dataNormalConfig();
    }

    public static DataCloud$CloudManager dataCloudMgr() {
        return getInstance().mDataCloudMgr;
    }

    public static DataItemFeature dataItemFeature() {
        return (DataItemFeature) provider().dataFeature();
    }
}
