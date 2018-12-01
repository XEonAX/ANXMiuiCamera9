package com.android.camera.data.cloud;

import android.content.SharedPreferences.Editor;
import android.os.Build;
import android.provider.MiuiSettings.SettingsCloudData;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.data.DataRepository;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import io.reactivex.Completable;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.schedulers.Schedulers;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DataCloudMgr implements DataCloud$CloudManager {
    private DataCloudFeatureController mDataCloudFeatureController;
    private DataCloudItemGlobal mDataCloudGlobal = new DataCloudItemGlobal();
    private SparseArray<DataCloudItemConfig> mDataCloudItemConfigs = new SparseArray(2);

    public DataCloud$CloudItem provideDataCloudGlobal() {
        if (this.mDataCloudGlobal == null) {
            this.mDataCloudGlobal = new DataCloudItemGlobal();
        }
        return this.mDataCloudGlobal;
    }

    public DataCloud$CloudItem provideDataCloudConfig(int cameraId) {
        DataCloudItemConfig dataCloudItemConfig = (DataCloudItemConfig) this.mDataCloudItemConfigs.get(cameraId);
        if (dataCloudItemConfig != null) {
            return dataCloudItemConfig;
        }
        dataCloudItemConfig = new DataCloudItemConfig(cameraId);
        this.mDataCloudItemConfigs.put(cameraId, dataCloudItemConfig);
        return dataCloudItemConfig;
    }

    public DataCloud$CloudFeature DataCloudFeature() {
        if (this.mDataCloudFeatureController == null) {
            this.mDataCloudFeatureController = new DataCloudFeatureController();
        }
        return this.mDataCloudFeatureController;
    }

    private static void checkLastUpdateTimeFormat() {
        try {
            getCloudDataLastUpdateTime();
        } catch (Exception e) {
            Log.w("DataCloudMgr", "get cloud_data_last_update long value failed, try String type");
            try {
                String strValue = DataRepository.dataItemGlobal().getString("cloud_data_last_update", "0");
                Log.i("DataCloudMgr", "try to convert the string value type to long for field [cloud_data_last_update]");
                DataRepository.dataItemGlobal().editor().remove("cloud_data_last_update").putLong("cloud_data_last_update", TextUtils.isEmpty(strValue) ? 0 : Long.parseLong(strValue)).commit();
            } catch (Exception e2) {
                Log.w("DataCloudMgr", "get cloud_data_last_update string value failed");
            }
        }
    }

    public void fillCloudValues() {
        long now = System.currentTimeMillis();
        checkLastUpdateTimeFormat();
        if (now - getCloudDataLastUpdateTime() < 86400000) {
            this.mDataCloudGlobal.setReady(true);
            DataCloudFeature().setReady(true);
            provideDataCloudConfig(Camera2DataContainer.getInstance().getFrontCameraId()).setReady(true);
            provideDataCloudConfig(Camera2DataContainer.getInstance().getMainBackCameraId()).setReady(true);
            return;
        }
        setCloudDataLastUpdateTime(now);
        Completable.create(new CompletableOnSubscribe() {
            public void subscribe(@NonNull CompletableEmitter e) throws Exception {
                DataCloudMgr.this.fillPreference();
            }
        }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe();
    }

    private void fillPreference() {
        DataCloud$CloudItem frontCloud = provideDataCloudConfig(Camera2DataContainer.getInstance().getFrontCameraId());
        DataCloud$CloudItem backCloud = provideDataCloudConfig(Camera2DataContainer.getInstance().getMainBackCameraId());
        String commonVersion = getCloudDataString("camera_settings_v3", "version", null);
        String nowCommonVersion = getCloudDataCommonVersion();
        String deviceVersion = getCloudDataString("camera_settings_v3_" + Build.DEVICE, "version", null);
        String nowDeviceVersion = getCloudDataDeviceVersion();
        this.mDataCloudGlobal.setReady(false);
        DataCloudFeature().setReady(false);
        frontCloud.setReady(false);
        backCloud.setReady(false);
        if (!((commonVersion == null || (commonVersion.equals(nowCommonVersion) ^ 1) == 0) && (deviceVersion == null || (deviceVersion.equals(nowDeviceVersion) ^ 1) == 0))) {
            this.mDataCloudGlobal.editor().clear().apply();
            DataCloudFeature().editor().clear().apply();
            frontCloud.editor().clear().apply();
            backCloud.editor().clear().apply();
            Log.d("DataCloudMgr", "updateSettingsFromCloudData common version " + nowCommonVersion + " -> " + commonVersion);
            setCloudDataCommonVersion(commonVersion);
            updateSettingsFromCloudData("camera_settings_v3");
            Log.d("DataCloudMgr", "updateSettingsFromCloudData device version " + nowDeviceVersion + " -> " + deviceVersion);
            setCloudDataDeviceVersion(deviceVersion);
            updateSettingsFromCloudData("camera_settings_v3_" + Build.DEVICE);
        }
        this.mDataCloudGlobal.setReady(true);
        DataCloudFeature().setReady(true);
        frontCloud.setReady(true);
        backCloud.setReady(true);
    }

    private void updateSettingsFromCloudData(String moduleName) {
        try {
            JSONArray content;
            int i;
            Editor editor;
            String data = getCloudDataString(moduleName, "content", null);
            if (!TextUtils.isEmpty(data)) {
                content = new JSONArray(data);
                for (i = 0; i < content.length(); i++) {
                    DataCloudItemBase cloudItem = this.mDataCloudGlobal;
                    JSONObject setting = content.getJSONObject(i);
                    if (setting.has("type")) {
                        String type = setting.getString("type");
                        if (type.equals("front")) {
                            cloudItem = (DataCloudItemBase) this.mDataCloudItemConfigs.get(Camera2DataContainer.getInstance().getFrontCameraId());
                        } else if (type.equals("back")) {
                            cloudItem = (DataCloudItemBase) this.mDataCloudItemConfigs.get(Camera2DataContainer.getInstance().getMainBackCameraId());
                        }
                    }
                    String key = setting.getString("key");
                    editor = cloudItem.editor();
                    Object value = setting.get("value");
                    if (value instanceof Boolean) {
                        editor.putBoolean(key, ((Boolean) value).booleanValue());
                    } else if (value instanceof Integer) {
                        editor.putInt(key, ((Integer) value).intValue());
                    } else if (value instanceof Long) {
                        editor.putLong(key, ((Long) value).longValue());
                    } else if (value instanceof Float) {
                        editor.putFloat(key, ((Float) value).floatValue());
                    } else if (value instanceof String) {
                        editor.putString(key, (String) value);
                    } else {
                        Log.e("DataCloudMgr", "Wrong camera setting type " + key + ": " + value);
                    }
                    editor.apply();
                }
            }
            data = getCloudDataString(moduleName, "feature", null);
            if (!TextUtils.isEmpty(data)) {
                editor = DataCloudFeature().editor();
                content = new JSONArray(data);
                for (i = 0; i < content.length(); i++) {
                    JSONObject feature = content.getJSONObject(i);
                    editor.putBoolean(feature.getString("key"), feature.getBoolean("value"));
                }
                editor.apply();
            }
        } catch (JSONException e) {
            Log.e("DataCloudMgr", "JSONException when get camera settings !", e);
        }
    }

    private static final String getCloudDataString(String moduleName, String key, String defValue) {
        return SettingsCloudData.getCloudDataString(CameraAppImpl.getAndroidContext().getContentResolver(), moduleName, key, defValue);
    }

    private static String getCloudDataCommonVersion() {
        return DataRepository.dataItemGlobal().getString("cloud_data_version", null);
    }

    private static String getCloudDataDeviceVersion() {
        return DataRepository.dataItemGlobal().getString("cloud_data_device_version", null);
    }

    private static void setCloudDataCommonVersion(String version) {
        DataRepository.dataItemGlobal().editor().putString("cloud_data_version", version).apply();
    }

    private static void setCloudDataDeviceVersion(String version) {
        DataRepository.dataItemGlobal().editor().putString("cloud_data_device_version", version).apply();
    }

    private static long getCloudDataLastUpdateTime() {
        return DataRepository.dataItemGlobal().getLong("cloud_data_last_update", 0);
    }

    private static void setCloudDataLastUpdateTime(long time) {
        DataRepository.dataItemGlobal().editor().putLong("cloud_data_last_update", time).apply();
    }
}
