package com.android.camera.module.loader;

import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.data.DataRepository;
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigBokeh;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.module.BaseModule;
import com.android.camera.permission.PermissionManager;
import io.reactivex.annotations.NonNull;

public class FunctionCameraPrepare extends Func1Base<Camera, BaseModule> {
    private BaseModule baseModule;
    private int mResetType;

    public FunctionCameraPrepare(int currentMode, int resetType, BaseModule baseModule) {
        super(currentMode);
        this.mResetType = resetType;
        this.baseModule = baseModule;
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<Camera> cameraNullHolder) throws Exception {
        if (!cameraNullHolder.isPresent()) {
            return NullHolder.ofNullable(null, 234);
        }
        if (!PermissionManager.checkCameraLaunchPermissions()) {
            return NullHolder.ofNullable(null, 229);
        }
        Camera cameraActivity = (Camera) cameraNullHolder.get();
        if (cameraActivity.isFinishing()) {
            return NullHolder.ofNullable(null, 235);
        }
        cameraActivity.changeRequestOrientation();
        if (this.baseModule.isDeparted()) {
            return NullHolder.ofNullable(this.baseModule, 225);
        }
        reconfigureData();
        return NullHolder.ofNullable(this.baseModule);
    }

    private void reconfigureData() {
        CameraSettings.upgradeGlobalPreferences();
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        int lastCameraId = dataItemGlobal.getLastCameraId();
        ComponentConfigFlash componentConfigFlash = dataItemConfig.getComponentFlash();
        ProviderEditor configEditor = dataItemConfig.editor();
        DataBackUp dataBackUp = DataRepository.getInstance().backUp();
        configEditor.remove("pref_camera_zoom_key").remove("pref_camera_exposure_key");
        String flashValue = componentConfigFlash.getPersistValue(this.mTargetMode);
        if (!componentConfigFlash.isValidFlashValue(flashValue)) {
            configEditor.remove(componentConfigFlash.getKey(this.mTargetMode));
        } else if (flashValue.equals("2")) {
            configEditor.putString(componentConfigFlash.getKey(this.mTargetMode), componentConfigFlash.getDefaultValue(this.mTargetMode));
        }
        if (!Device.isSupportedManualFunction()) {
            configEditor.remove("pref_focus_position_key");
            configEditor.remove("pref_qc_camera_exposuretime_key");
        }
        if (!(dataItemGlobal.getBoolean("pref_camera_lab_option_key_visible", false) || (dataItemGlobal.getBoolean("pref_camera_facedetection_key", true) ^ 1) == 0)) {
            dataItemGlobal.editor().remove("pref_camera_facedetection_key").apply();
        }
        switch (this.mResetType) {
            case 1:
                dataBackUp.revertRunning(dataItemRunning, dataItemGlobal.getDataBackUpKey(this.mTargetMode), dataItemGlobal.getCurrentCameraId());
                if (componentConfigFlash.getPersistValue(this.mTargetMode).equals("2")) {
                    configEditor.putString(componentConfigFlash.getKey(this.mTargetMode), componentConfigFlash.getDefaultValue(this.mTargetMode));
                }
                if (this.mTargetMode == 163 || this.mTargetMode == 165 || this.mTargetMode == 171) {
                    BeautyParameters.getInstance().initBeauty(dataItemGlobal.getCurrentCameraId(), this.mTargetMode, configEditor);
                    break;
                }
            case 2:
            case 6:
                DataItemConfig anotherConfig;
                resetFlash(componentConfigFlash, configEditor);
                resetHdr(dataItemConfig.getComponentHdr(), configEditor);
                resetBokeh(dataItemConfig.getComponentBokeh(), configEditor);
                if (dataItemGlobal.getCurrentCameraId() == 0) {
                    resetBeauty(dataItemConfig.getComponentConfigBeauty(), configEditor);
                    anotherConfig = (DataItemConfig) DataRepository.provider().dataConfig(1);
                } else {
                    anotherConfig = (DataItemConfig) DataRepository.provider().dataConfig(0);
                }
                ProviderEditor anotherEditor = anotherConfig.editor();
                resetFlash(anotherConfig.getComponentFlash(), anotherEditor);
                resetHdr(anotherConfig.getComponentHdr(), anotherEditor);
                resetBokeh(anotherConfig.getComponentBokeh(), anotherEditor);
                anotherEditor.apply();
                dataItemRunning.resetAll();
                dataBackUp.clearBackUp();
                switch (this.mTargetMode) {
                    case 163:
                    case 165:
                    case 171:
                        BeautyParameters.getInstance().initBeauty(dataItemGlobal.getCurrentCameraId(), this.mTargetMode, configEditor);
                        break;
                }
                break;
            case 3:
            case 5:
                int cameraId;
                switch (this.mTargetMode) {
                    case 161:
                        cameraId = dataItemGlobal.getCurrentCameraId();
                        break;
                    case 162:
                    case 168:
                    case 169:
                    case 170:
                        cameraId = dataItemGlobal.getCurrentCameraId();
                        break;
                    case 166:
                        cameraId = 0;
                        break;
                    case 167:
                        cameraId = 0;
                        break;
                    case 171:
                        if (Device.isSupportedFrontPortrait()) {
                            cameraId = dataItemGlobal.getCurrentCameraId();
                        } else {
                            cameraId = 0;
                        }
                        BeautyParameters.getInstance().initBeauty(cameraId, this.mTargetMode, configEditor);
                        break;
                    default:
                        cameraId = dataItemGlobal.getCurrentCameraId();
                        BeautyParameters.getInstance().initBeauty(cameraId, this.mTargetMode, configEditor);
                        break;
                }
                dataItemGlobal.setCameraIdTransient(cameraId);
                dataBackUp.revertRunning(dataItemRunning, dataItemGlobal.getDataBackUpKey(this.mTargetMode), cameraId);
                break;
        }
        boolean enableLensDirtyDetect = Device.isSupportLensDirtyDetect();
        if (this.mResetType == 3 && lastCameraId == dataItemGlobal.getCurrentCameraId()) {
            enableLensDirtyDetect = false;
        }
        if (enableLensDirtyDetect) {
            configEditor.putBoolean("pref_lens_dirty_detect_enabled_key", true);
        }
        configEditor.apply();
    }

    private void resetFlash(ComponentConfigFlash componentConfigFlash, ProviderEditor configEditor) {
        if (!componentConfigFlash.getPersistValue(this.mTargetMode).equals("3")) {
            configEditor.putString(componentConfigFlash.getKey(this.mTargetMode), componentConfigFlash.getDefaultValue(this.mTargetMode));
        }
    }

    private void resetHdr(ComponentConfigHdr componentConfigHdr, ProviderEditor configEditor) {
        String hdrValue = componentConfigHdr.getPersistValue(this.mTargetMode);
        if (!hdrValue.equals("auto") && (hdrValue.equals("off") ^ 1) != 0) {
            configEditor.putString(componentConfigHdr.getKey(this.mTargetMode), componentConfigHdr.getDefaultValue(this.mTargetMode));
        }
    }

    private void resetBokeh(ComponentConfigBokeh componentConfigBokeh, ProviderEditor configEditor) {
        if (componentConfigBokeh.getPersistValue(this.mTargetMode).equals("on")) {
            configEditor.putString(componentConfigBokeh.getKey(this.mTargetMode), componentConfigBokeh.getDefaultValue(this.mTargetMode));
        }
    }

    private void resetBeauty(ComponentConfigBeauty componentConfigBeauty, ProviderEditor configEditor) {
        if (!componentConfigBeauty.getPersistValue(this.mTargetMode).equals(ComponentConfigBeauty.BEAUTY_CLOSE)) {
            configEditor.putString(componentConfigBeauty.getKey(this.mTargetMode), componentConfigBeauty.getDefaultValue(this.mTargetMode));
        }
    }
}
