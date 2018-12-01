package com.android.camera.backup;

import android.content.Context;
import android.content.SharedPreferences;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.xiaomi.settingsdk.backup.ICloudBackup;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper.PrefEntry;
import java.util.ArrayList;
import java.util.List;

public class CameraSettingsBackupImpl implements ICloudBackup {
    private static final PrefEntry[] PREF_ENTRIES = CameraBackupSettings.PREF_ENTRIES;

    interface BackupRestoreHandler {
        void handle(SharedPreferences sharedPreferences, DataPackage dataPackage, PrefEntry[] prefEntryArr);
    }

    private static String getCloudPrefixByCameraIdAndMode(int cameraId, int mode) {
        if (checkCameraId(cameraId)) {
            int backCameraId = Camera2DataContainer.getInstance().getMainBackCameraId();
            int frontCameraId = Camera2DataContainer.getInstance().getFrontCameraId();
            if (cameraId == backCameraId) {
                cameraId = 0;
            } else if (cameraId == frontCameraId) {
                cameraId = 1;
            }
        }
        return "camera_settings_simple_mode_local_" + BaseModule.getPreferencesLocalId(cameraId, mode);
    }

    private static String getSharedPreferencesName(int cameraId, int intentType) {
        return "camera_settings_simple_mode_local_" + DataItemConfig.provideLocalId(cameraId, intentType);
    }

    private static String getCloudPrefix(int cameraId, int intentType) {
        if (checkCameraId(cameraId)) {
            int backCameraId = Camera2DataContainer.getInstance().getMainBackCameraId();
            int frontCameraId = Camera2DataContainer.getInstance().getFrontCameraId();
            if (cameraId == backCameraId) {
                cameraId = 0;
            } else if (cameraId == frontCameraId) {
                cameraId = 1;
            }
        }
        return "camera_settings_simple_mode_local_" + DataItemConfig.provideLocalId(cameraId, intentType);
    }

    private static boolean checkCameraId(int cameraId) {
        if (cameraId < 0) {
            return false;
        }
        if (cameraId < 2) {
            return true;
        }
        throw new IllegalArgumentException("cameraId is invalid: " + cameraId);
    }

    public void onBackupSettings(Context context, DataPackage dataPackage) {
        Log.d("CameraSettingsBackup", "backup version " + getCurrentVersion(context));
        handleBackupOrRestore(context, dataPackage, new BackupRestoreHandler() {
            public void handle(SharedPreferences sharedPref, DataPackage dataPackage, PrefEntry[] entries) {
                PrefsBackupHelper.backup(sharedPref, dataPackage, entries);
            }
        });
    }

    public void onRestoreSettings(Context context, DataPackage dataPackage, int cloudVersion) {
        int currentVersion = getCurrentVersion(context);
        if (cloudVersion > currentVersion) {
            Log.w("CameraSettingsBackup", "skip restore due to cloud version " + cloudVersion + " is higher than local version " + currentVersion);
            return;
        }
        Log.d("CameraSettingsBackup", "restore version " + cloudVersion);
        if (4 <= cloudVersion) {
            handleBackupOrRestore(context, dataPackage, new BackupRestoreHandler() {
                public void handle(SharedPreferences sharedPref, DataPackage dataPackage, PrefEntry[] entries) {
                    PrefsBackupHelper.restore(sharedPref, dataPackage, entries);
                }
            });
        } else if (3 == cloudVersion) {
            restoreFromVersion3(context, dataPackage);
        } else if (1 == cloudVersion) {
            restoreFromVersion1(context, dataPackage);
        }
    }

    private void restoreFromVersion1(Context context, DataPackage dataPackage) {
        SharedPreferences globalSharedPref = context.getSharedPreferences("camera_settings_global", 0);
        int[] intentTypes = new int[]{0, 1};
        List<Integer> availableCameraIds = getAvailableCameraIds();
        for (int intentType : intentTypes) {
            for (Integer intValue : availableCameraIds) {
                int cameraId = intValue.intValue();
                SharedPreferences sharedPref = context.getSharedPreferences(getSharedPreferencesName(cameraId, intentType), 0);
                if (sharedPref != null) {
                    PrefEntry[] entriesWithPrefix = addPrefixToEntries(PREF_ENTRIES, getCloudPrefixByCameraIdAndMode(cameraId, intentType == 0 ? 0 : 2));
                    CameraBackupHelper.restoreSettings(sharedPref, dataPackage, entriesWithPrefix, false);
                    if (intentType == 0 && cameraId == 0) {
                        CameraBackupHelper.restoreSettings(globalSharedPref, dataPackage, entriesWithPrefix, true);
                    }
                }
            }
        }
        CameraBackupHelper.restoreSettings(globalSharedPref, dataPackage, addPrefixToEntries(PREF_ENTRIES, "camera_settings_global"), true);
    }

    private void restoreFromVersion3(Context context, DataPackage dataPackage) {
        int[] intentTypes = new int[]{0, 1};
        List<Integer> availableCameraIds = getAvailableCameraIds();
        for (int intentType : intentTypes) {
            for (Integer intValue : availableCameraIds) {
                int cameraId = intValue.intValue();
                SharedPreferences sharedPref = context.getSharedPreferences(getSharedPreferencesName(cameraId, intentType), 0);
                if (sharedPref != null) {
                    CameraBackupHelper.restoreSettings(sharedPref, dataPackage, addPrefixToEntries(PREF_ENTRIES, getCloudPrefix(cameraId, intentType)), false);
                }
            }
        }
        CameraBackupHelper.restoreSettings(context.getSharedPreferences("camera_settings_global", 0), dataPackage, addPrefixToEntries(PREF_ENTRIES, "camera_settings_global"), true);
    }

    private void handleBackupOrRestore(Context context, DataPackage dataPackage, BackupRestoreHandler handler) {
        int[] intentTypes = new int[]{0, 1};
        List<Integer> availableCameraIds = getAvailableCameraIds();
        for (int intentType : intentTypes) {
            for (Integer intValue : availableCameraIds) {
                int cameraId = intValue.intValue();
                SharedPreferences sharedPref = context.getSharedPreferences(getSharedPreferencesName(cameraId, intentType), 0);
                if (sharedPref != null) {
                    handler.handle(sharedPref, dataPackage, addPrefixToEntries(PREF_ENTRIES, getCloudPrefix(cameraId, intentType)));
                }
            }
        }
        handler.handle(context.getSharedPreferences("camera_settings_global", 0), dataPackage, addPrefixToEntries(PREF_ENTRIES, "camera_settings_global"));
    }

    private static List<Integer> getAvailableCameraIds() {
        List<Integer> availableCameraIds = new ArrayList();
        int backCameraId = Camera2DataContainer.getInstance().getMainBackCameraId();
        int frontCameraId = Camera2DataContainer.getInstance().getFrontCameraId();
        if (checkCameraId(backCameraId)) {
            availableCameraIds.add(Integer.valueOf(backCameraId));
        }
        if (checkCameraId(frontCameraId)) {
            availableCameraIds.add(Integer.valueOf(frontCameraId));
        }
        return availableCameraIds;
    }

    private static PrefEntry[] addPrefixToEntries(PrefEntry[] prefEntries, String cloudPrefix) {
        PrefEntry[] entriesWithPrefix = new PrefEntry[prefEntries.length];
        for (int i = 0; i < prefEntries.length; i++) {
            PrefEntry entry = prefEntries[i];
            Class<?> valueClass = entry.getValueClass();
            String cloudKey = cloudPrefix + "::" + entry.getCloudKey();
            String localKey = entry.getLocalKey();
            Object defaultValue = entry.getDefaultValue();
            PrefEntry entryWithPrefix = null;
            if (valueClass.equals(Integer.class)) {
                if (defaultValue == null) {
                    entryWithPrefix = PrefEntry.createIntEntry(cloudKey, localKey);
                } else {
                    entryWithPrefix = PrefEntry.createIntEntry(cloudKey, localKey, ((Integer) defaultValue).intValue());
                }
            } else if (valueClass.equals(Boolean.class)) {
                if (defaultValue == null) {
                    entryWithPrefix = PrefEntry.createBoolEntry(cloudKey, localKey);
                } else {
                    entryWithPrefix = PrefEntry.createBoolEntry(cloudKey, localKey, ((Boolean) defaultValue).booleanValue());
                }
            } else if (valueClass.equals(String.class)) {
                if (defaultValue == null) {
                    entryWithPrefix = PrefEntry.createStringEntry(cloudKey, localKey);
                } else {
                    entryWithPrefix = PrefEntry.createStringEntry(cloudKey, localKey, (String) defaultValue);
                }
            } else if (valueClass.equals(Long.class)) {
                if (defaultValue == null) {
                    entryWithPrefix = PrefEntry.createLongEntry(cloudKey, localKey);
                } else {
                    entryWithPrefix = PrefEntry.createLongEntry(cloudKey, localKey, ((Long) defaultValue).longValue());
                }
            }
            entriesWithPrefix[i] = entryWithPrefix;
        }
        return entriesWithPrefix;
    }

    public int getCurrentVersion(Context context) {
        return 4;
    }
}
