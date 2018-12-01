package com.android.camera.data.data.config;

import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.data.cloud.DataCloud$CloudFeature;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public class SupportedConfigFactory {
    public static final int[] MUTEX_MENU_CONFIGS = new int[]{229, 236, 235, 228, 230, 241, 234, 195, 238, 199};

    @Retention(RetentionPolicy.SOURCE)
    public @interface ConfigItem {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface MutexElement {
    }

    public static boolean isMutexConfig(int selectedItem) {
        for (int item : MUTEX_MENU_CONFIGS) {
            if (item == selectedItem) {
                return true;
            }
        }
        return false;
    }

    public static String getConfigKey(int configItem) {
        switch (configItem) {
            case 195:
                return "pref_camera_portrait_mode_key";
            case 199:
                return "pref_camera_peak_key";
            case 201:
                return "pref_camera_ai_scene_mode_key";
            case 228:
                return "pref_camera_tilt_shift_mode";
            case 229:
                return "pref_camera_gradienter_key";
            case 230:
                return "pref_camera_hand_night_key";
            case 234:
                return "pref_camera_scenemode_setting_key";
            case 235:
                return "pref_camera_groupshot_mode_key";
            case 236:
                return "pref_camera_magic_mirror_key";
            case 238:
                return "pref_camera_show_gender_age_key";
            case 241:
                return "pref_camera_super_resolution_key";
            default:
                throw new RuntimeException("unknown config item");
        }
    }

    public static final SupportedConfigs getSupportedTopConfigs(int currentMode, DataItemConfig dataItemConfig, int cameraId, CameraCapabilities p) {
        dataItemConfig.reInitComponent(currentMode, p);
        List<Integer> supports = new ArrayList();
        if (dataItemConfig.supportFlash()) {
            supports.add(Integer.valueOf(193));
        }
        switch (currentMode) {
            case 161:
                supports.add(Integer.valueOf(196));
                supports.add(Integer.valueOf(225));
                break;
            case 162:
            case 168:
            case 169:
            case 170:
                if (cameraId != Camera2DataContainer.getInstance().getMainBackCameraId()) {
                    supports.add(Integer.valueOf(225));
                    break;
                }
                if (dataItemConfig.supportHdr()) {
                    supports.add(Integer.valueOf(194));
                }
                if (Device.isSupportedHFR() && Device.isSupportVideoHFRMode()) {
                    supports.add(Integer.valueOf(202));
                }
                supports.add(Integer.valueOf(197));
                break;
            case 165:
                if (dataItemConfig.supportHdr()) {
                    supports.add(Integer.valueOf(194));
                }
                if (Device.isSupportAiScene() && cameraId == Camera2DataContainer.getInstance().getMainBackCameraId()) {
                    supports.add(Integer.valueOf(201));
                }
                if (dataItemConfig.supportBokeh()) {
                    supports.add(Integer.valueOf(200));
                }
                supports.add(Integer.valueOf(196));
                supports.add(Integer.valueOf(197));
                break;
            case 166:
                supports.clear();
                supports.add(Integer.valueOf(225));
                break;
            case 167:
                ComponentManuallyFocus manuallyFocus = dataItemConfig.getManuallyFocus();
                if (Device.isSupportedPeakingMF() && (manuallyFocus.getComponentValue(currentMode).equals(manuallyFocus.getDefaultValue(currentMode)) ^ 1) != 0) {
                    supports.add(Integer.valueOf(199));
                }
                supports.add(Integer.valueOf(196));
                supports.add(Integer.valueOf(197));
                break;
            case 171:
                supports.add(Integer.valueOf(196));
                supports.add(Integer.valueOf(197));
                break;
            default:
                if (dataItemConfig.supportHdr()) {
                    supports.add(Integer.valueOf(194));
                }
                if (Device.isSupportAiScene() && cameraId == Camera2DataContainer.getInstance().getMainBackCameraId()) {
                    supports.add(Integer.valueOf(201));
                }
                if (dataItemConfig.supportBokeh()) {
                    supports.add(Integer.valueOf(200));
                }
                supports.add(Integer.valueOf(196));
                supports.add(Integer.valueOf(197));
                break;
        }
        SupportedConfigs configs = new SupportedConfigs(7);
        switch (supports.size()) {
            case 0:
                configs.add(198, 198, 198, 198, 198, 198, 198);
                break;
            case 1:
                configs.add(198, 198, 198, 198, 198, 198, ((Integer) supports.get(0)).intValue());
                break;
            case 2:
                if (((Integer) supports.get(0)).intValue() != 196) {
                    configs.add(((Integer) supports.get(0)).intValue(), 198, 198, 198, 198, 198, ((Integer) supports.get(1)).intValue());
                    break;
                }
                configs.add(198, 198, 198, ((Integer) supports.get(0)).intValue(), 198, 198, ((Integer) supports.get(1)).intValue());
                break;
            case 3:
                configs.add(((Integer) supports.get(0)).intValue(), 198, 198, ((Integer) supports.get(1)).intValue(), 198, 198, ((Integer) supports.get(2)).intValue());
                break;
            case 4:
                configs.add(((Integer) supports.get(0)).intValue(), 198, ((Integer) supports.get(1)).intValue(), 198, ((Integer) supports.get(2)).intValue(), 198, ((Integer) supports.get(3)).intValue());
                break;
            case 5:
                configs.add(((Integer) supports.get(0)).intValue(), ((Integer) supports.get(1)).intValue(), 198, ((Integer) supports.get(2)).intValue(), 198, ((Integer) supports.get(3)).intValue(), ((Integer) supports.get(4)).intValue());
                break;
        }
        return configs;
    }

    public static final SupportedConfigs getSupportedExtraConfigs(int currentMode, int cameraId, DataCloud$CloudFeature cloudFeature, CameraCapabilities p) {
        SupportedConfigs configs = new SupportedConfigs();
        switch (currentMode) {
            case 162:
            case 168:
            case 169:
            case 170:
                switch (cameraId) {
                    case 0:
                        configs.add(225).add(233);
                        if (Device.isSupportedHFR()) {
                            configs.add(232);
                            break;
                        }
                        break;
                }
                break;
            case 167:
                configs.add(225).add(226);
                break;
            case 171:
                configs.add(225).add(226);
                if (cameraId == 1 && Device.isSupportedFrontPortrait()) {
                    if (Device.isSupportedAgeDetection() && Device.isSupportedSkinBeautify()) {
                        configs.add(238);
                    }
                    if (Device.isSupportedMagicMirror()) {
                        configs.add(236);
                        break;
                    }
                }
                break;
            default:
                configs.add(225).add(226);
                switch (cameraId) {
                    case 0:
                        if (Device.isSupportedTiltShift()) {
                            configs.add(228);
                        }
                        if (Device.isSupportGradienter()) {
                            configs.add(229);
                        }
                        if (Device.IS_HONGMI) {
                            configs.add(234);
                        }
                        if (currentMode != 165 && Device.isSupportGroupShot()) {
                            configs.add(235);
                        }
                        if ((currentMode == 165 || currentMode == 163) && Device.isSupportedSkinBeautify()) {
                            configs.add(239);
                        }
                        if (CameraSettings.checkLensAvailability(CameraAppImpl.getAndroidContext())) {
                            configs.add(242);
                            break;
                        }
                        break;
                    case 1:
                        if (Device.isSupportGroupShot() && currentMode != 165) {
                            configs.add(235);
                        }
                        if (currentMode == 165 || currentMode == 163) {
                            if (Device.isSupportedAgeDetection() && Device.isSupportedSkinBeautify()) {
                                configs.add(238);
                            }
                            if (Device.isSupportedMagicMirror()) {
                                configs.add(236);
                                break;
                            }
                        }
                        break;
                }
                break;
        }
        return cloudFeature.filterFeature(configs);
    }
}
