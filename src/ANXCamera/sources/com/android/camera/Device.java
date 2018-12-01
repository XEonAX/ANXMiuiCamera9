package com.android.camera;

import android.os.SystemProperties;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;
import miui.os.Build;
import miui.util.FeatureParser;

public class Device {
    public static final String BUILD_DEVICE = Build.DEVICE;
    public static final boolean IS_A1 = "gemini".equals(BUILD_DEVICE);
    public static final boolean IS_A10 = "aqua".equals(BUILD_DEVICE);
    public static final boolean IS_A12 = "land".equals(BUILD_DEVICE);
    public static final boolean IS_A13 = "santoni".equals(BUILD_DEVICE);
    public static final boolean IS_A1Pro = "gold".equals(BUILD_DEVICE);
    public static final boolean IS_A4 = "scorpio".equals(BUILD_DEVICE);
    public static final boolean IS_A7 = "capricorn".equals(BUILD_DEVICE);
    public static final boolean IS_A8 = "lithium".equals(BUILD_DEVICE);
    public static final boolean IS_A9 = "ido".equals(BUILD_DEVICE);
    public static final boolean IS_B3 = "hydrogen".equals(BUILD_DEVICE);
    public static final boolean IS_B3_PRO = "helium".equals(BUILD_DEVICE);
    public static final boolean IS_B5 = BUILD_DEVICE.startsWith("mark");
    public static final boolean IS_B6 = BUILD_DEVICE.startsWith("nike");
    public static final boolean IS_B7 = "natrium".equals(BUILD_DEVICE);
    public static final boolean IS_C1 = "sagit".equals(BUILD_DEVICE);
    public static final boolean IS_C2 = "centaur".equals(BUILD_DEVICE);
    public static final boolean IS_C2Q = "achilles".equals(BUILD_DEVICE);
    public static final boolean IS_C3A = "rolex".equals(BUILD_DEVICE);
    public static final boolean IS_C5 = BUILD_DEVICE.startsWith("prada");
    public static final boolean IS_C6 = BUILD_DEVICE.startsWith("mido");
    public static final boolean IS_C8 = "jason".equals(BUILD_DEVICE);
    public static final boolean IS_CM_TEST = Build.IS_CM_CUSTOMIZATION_TEST;
    public static final boolean IS_D2 = "tiffany".equals(BUILD_DEVICE);
    public static final boolean IS_D3 = "ulysse".equals(BUILD_DEVICE);
    public static final boolean IS_D4 = "oxygen".equals(BUILD_DEVICE);
    public static final boolean IS_D5 = "chiron".equals(BUILD_DEVICE);
    public static final boolean IS_D5X = "polaris".equals(BUILD_DEVICE);
    public static final boolean IS_D6S = "ugg".equals(BUILD_DEVICE);
    public static final boolean IS_E1 = "dipper".equals(BUILD_DEVICE);
    public static final boolean IS_E10 = "beryllium".equals(BUILD_DEVICE);
    public static final boolean IS_E2 = "sirius".equals(BUILD_DEVICE);
    public static final boolean IS_E7 = "vince".equals(BUILD_DEVICE);
    public static final boolean IS_E7S = "whyred".equals(BUILD_DEVICE);
    public static final boolean IS_E8 = "ursa".equals(BUILD_DEVICE);
    public static final boolean IS_H2XLTE;
    public static final boolean IS_H2X_LC = Build.IS_HONGMI_TWOX_LC;
    public static final boolean IS_H3C = "omega".equals(BUILD_DEVICE);
    public static final boolean IS_HM;
    public static final boolean IS_HM2;
    public static final boolean IS_HM2A = Build.IS_HONGMI_TWO_A;
    public static final boolean IS_HM2S = Build.IS_HONGMI_TWO_S;
    public static final boolean IS_HM2S_LTE = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean IS_HM3 = Build.IS_HONGMI_THREE;
    public static final boolean IS_HM3A = "kenzo".equals(BUILD_DEVICE);
    public static final boolean IS_HM3B = "kate".equals(BUILD_DEVICE);
    public static final boolean IS_HM3LTE = "dior".equals(BUILD_DEVICE);
    public static final boolean IS_HM3X = "gucci".equals(BUILD_DEVICE);
    public static final boolean IS_HM3Y = "hermes".equals(BUILD_DEVICE);
    public static final boolean IS_HM3Z = "hennessy".equals(BUILD_DEVICE);
    public static final boolean IS_HONGMI = FeatureParser.getBoolean("is_hongmi", false);
    public static final boolean IS_MI2 = Build.IS_MITWO;
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_MI3;
    public static final boolean IS_MI3TD = "pisces".equals(BUILD_DEVICE);
    public static final boolean IS_MI3W = ("cancro".equals(BUILD_DEVICE) ? Build.MODEL.startsWith("MI 3") : false);
    public static final boolean IS_MI4 = Build.IS_MIFOUR;
    public static final boolean IS_NEXUS5 = "hammerhead".equals(BUILD_DEVICE);
    public static final boolean IS_PAD1 = Build.IS_MIPAD;
    public static final boolean IS_STABLE = Build.IS_STABLE_VERSION;
    public static final boolean IS_X11 = "libra".equals(BUILD_DEVICE);
    public static final boolean IS_X3TD = "pisces".equals(BUILD_DEVICE);
    public static final boolean IS_X5 = Build.IS_MIFIVE;
    public static final boolean IS_X7 = "leo".equals(BUILD_DEVICE);
    public static final boolean IS_X9 = "ferrari".equals(BUILD_DEVICE);
    public static final boolean IS_XIAOMI = FeatureParser.getBoolean("is_xiaomi", false);
    public static final String MODULE = Build.MODEL;
    private static ArrayList<String> sFpNavEventNameList;

    static {
        boolean z;
        boolean z2 = true;
        if (IS_MI3W) {
            z = true;
        } else {
            z = IS_MI3TD;
        }
        IS_MI3 = z;
        if (!Build.IS_HONGMI_TWO || (Build.IS_HONGMI_TWO_A ^ 1) == 0) {
            z = false;
        } else {
            z = Build.IS_HONGMI_TWO_S ^ 1;
        }
        IS_HM = z;
        if (IS_HM) {
            z = true;
        } else {
            z = IS_HM2S;
        }
        IS_HM2 = z;
        if (!Build.IS_HONGMI_TWOX) {
            z2 = "HM2014816".equals(BUILD_DEVICE);
        }
        IS_H2XLTE = z2;
    }

    public static boolean isSupportedMovieSolid() {
        return FeatureParser.getBoolean("support_camera_movie_solid", false);
    }

    public static boolean isSupportedShaderEffect() {
        return FeatureParser.getBoolean("support_camera_shader_effect", false);
    }

    public static boolean isSupportedMuteCameraSound() {
        return isCameraSoundEnforced() ^ 1;
    }

    public static boolean isCameraSoundEnforced() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        String prop = SystemProperties.get("ro.miui.region");
        if (TextUtils.isEmpty(prop)) {
            return TextUtils.equals(Locale.getDefault().getCountry(), "KR");
        }
        return TextUtils.equals(prop, "KR");
    }

    public static boolean isSupportedLongPressBurst() {
        return FeatureParser.getBoolean("support_camera_burst_shoot", false);
    }

    public static boolean isSupportedSkinBeautify() {
        return FeatureParser.getBoolean("support_camera_skin_beauty", false);
    }

    public static boolean isSupportedAgeDetection() {
        return !Build.IS_INTERNATIONAL_BUILD ? FeatureParser.getBoolean("support_camera_age_detection", false) : false;
    }

    public static boolean isSupportedGPS() {
        return FeatureParser.getBoolean("support_camera_record_location", false);
    }

    public static boolean is18x9RatioScreen() {
        return FeatureParser.getBoolean("is_18x9_ratio_screen", false);
    }

    public static boolean isSupportedTimeWaterMark() {
        return FeatureParser.getBoolean("support_camera_water_mark", false);
    }

    public static boolean isSupportedNewStyleTimeWaterMark() {
        return FeatureParser.getBoolean("support_camera_new_style_time_water_mark", false);
    }

    public static boolean isSupportedVideoPause() {
        return FeatureParser.getBoolean("support_camera_video_pause", false);
    }

    public static boolean adjustScreenLight() {
        return !IS_CM_TEST ? FeatureParser.getBoolean("support_camera_boost_brightness", false) : false;
    }

    public static boolean isQcomPlatform() {
        return "qcom".equals(FeatureParser.getString("vendor"));
    }

    public static boolean isNvPlatform() {
        return "nvidia".equals(FeatureParser.getString("vendor"));
    }

    public static boolean isMTKPlatform() {
        return "mediatek".equals(FeatureParser.getString("vendor"));
    }

    public static boolean isSupportedSecondaryStorage() {
        return FeatureParser.getBoolean("support_dual_sd_card", false);
    }

    public static boolean isResetToCCAFAfterCapture() {
        return false;
    }

    public static boolean isSupportedAoHDR() {
        return FeatureParser.getBoolean("support_camera_aohdr", false);
    }

    public static boolean isSupportedHFR() {
        return FeatureParser.getBoolean("support_camera_hfr", false);
    }

    public static boolean isSupportedChromaFlash() {
        return FeatureParser.getBoolean("support_chroma_flash", false);
    }

    public static boolean isSupportedObjectTrack() {
        return FeatureParser.getBoolean("support_object_track", false);
    }

    public static boolean isSupportedVideoQuality4kUHD() {
        return FeatureParser.getBoolean("support_camera_4k_quality", false);
    }

    public static boolean isSupportedAsdFlash() {
        if ((FeatureParser.getInteger("camera_supported_asd", 0) & 1) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isSupportedASD() {
        if ((FeatureParser.getInteger("camera_supported_asd", 0) & 15) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isSupportedAsdHdr() {
        if ((FeatureParser.getInteger("camera_supported_asd", 0) & 2) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isSupportAiScene() {
        return FeatureParser.getBoolean("camera_supported_ai_scene", true);
    }

    public static boolean isSupportedAsdNight() {
        return false;
    }

    public static boolean isSupportedManualFunction() {
        return FeatureParser.getBoolean("support_camera_manual_function", false);
    }

    public static boolean isFrontVideoQualityShouldBe1080P() {
        int i = 1;
        if (!(IS_HM2A || IS_H2X_LC || Build.IS_HONGMI_TWOX || IS_MI3W || IS_HM3 || IS_HM || IS_HM2S || IS_HM2S_LTE || IS_MI2 || IS_MI2A || IS_MI3)) {
            i = FeatureParser.getBoolean("is_front_video_quality_1080p", true) ^ 1;
        }
        return i ^ 1;
    }

    public static boolean isSupportedFastCapture() {
        return false;
    }

    public static boolean isSupportedTorchCapture() {
        return FeatureParser.getBoolean("support_camera_torch_capture", false);
    }

    public static boolean isThirdDevice() {
        return (!IS_XIAOMI ? IS_HONGMI : 1) ^ 1;
    }

    public static boolean isHoldBlurBackground() {
        return FeatureParser.getBoolean("is_camera_hold_blur_background", false);
    }

    public static boolean isSupportedPeakingMF() {
        return FeatureParser.getBoolean("support_camera_peaking_mf", false);
    }

    public static boolean isVideoSnapshotSizeLimited() {
        int i = 1;
        if (!(IS_HM2A || IS_H2X_LC || Build.IS_HONGMI_TWOX || IS_MI3W || IS_HM3 || IS_HM || IS_HM2S || IS_HM2S_LTE || IS_MI2 || IS_MI2A || IS_MI3 || IS_MI4)) {
            i = FeatureParser.getBoolean("is_video_snapshot_size_limit", true) ^ 1;
        }
        return i ^ 1;
    }

    public static boolean isSurfaceSizeLimited() {
        return FeatureParser.getBoolean("is_surface_size_limit", false);
    }

    public static boolean isSupportGradienter() {
        return FeatureParser.getBoolean("support_camera_gradienter", false);
    }

    public static int getHibernationTimeout() {
        return FeatureParser.getInteger("camera_hibernation_timeout_in_minutes", AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean isLowPowerQRScan() {
        return FeatureParser.getBoolean("is_camera_lower_qrscan_frequency", false);
    }

    public static boolean isSubThreadFrameListener() {
        return FeatureParser.getBoolean("is_camera_preview_with_subthread_looper", false);
    }

    public static boolean isMDPRender() {
        return false;
    }

    public static boolean isEffectWatermarkFilted() {
        return FeatureParser.getBoolean("is_camera_app_water_mark", false);
    }

    public static boolean isSupportedEdgeTouch() {
        return FeatureParser.getBoolean("support_edge_handgrip", false);
    }

    public static boolean isSupportedTiltShift() {
        return FeatureParser.getBoolean("support_camera_tilt_shift", false);
    }

    public static boolean isSupportedQuickSnap() {
        return !Build.IS_INTERNATIONAL_BUILD ? FeatureParser.getBoolean("support_camera_quick_snap", false) : false;
    }

    public static boolean isPad() {
        return FeatureParser.getBoolean("is_pad", false);
    }

    public static boolean isHalDoesCafWhenFlashOn() {
        return FeatureParser.getBoolean("is_hal_does_caf_when_flash_on", false);
    }

    public static boolean isSupportedMagicMirror() {
        if (Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        return FeatureParser.getBoolean("support_camera_magic_mirror", false);
    }

    public static boolean isHFRVideoCaptureSupported() {
        int i;
        if (FeatureParser.getBoolean("is_hrf_video_capture_support", false)) {
            i = 1;
        } else {
            i = isMTKPlatform();
        }
        return i ^ 1;
    }

    public static boolean isSupportedStereo() {
        return FeatureParser.getBoolean("is_support_stereo", false);
    }

    public static boolean isSupportedOpticalZoom() {
        return FeatureParser.getBoolean("is_support_optical_zoom", false);
    }

    public static boolean isSupportedPortrait() {
        return FeatureParser.getBoolean("is_support_portrait", false);
    }

    public static boolean isSupportedFrontPortrait() {
        return FeatureParser.getBoolean("camera_is_support_portrait_front", false);
    }

    public static ArrayList<String> getFpNavEventNameList() {
        if (sFpNavEventNameList == null) {
            sFpNavEventNameList = new ArrayList();
            String[] strArray = FeatureParser.getStringArray("fp_nav_event_name_list");
            if (strArray != null) {
                Collections.addAll(sFpNavEventNameList, strArray);
            }
        }
        return sFpNavEventNameList;
    }

    public static boolean isSupportGroupShot() {
        return FeatureParser.getBoolean("support_camera_groupshot", false);
    }

    public static boolean isISPRotated() {
        return FeatureParser.getBoolean("is_camera_isp_rotated", true);
    }

    public static boolean isFrontCameraAtBottom() {
        return (IS_A8 || IS_D5) ? true : IS_D5X;
    }

    public static boolean isIndiaBeautyFilter() {
        if (IS_E7S || IS_E10) {
            return "india".equalsIgnoreCase(SystemProperties.get("ro.boot.hwc"));
        }
        return false;
    }

    public static boolean isSupportPSensorPocketMode() {
        return FeatureParser.getBoolean("support_psensor_pocket_mode", true);
    }

    public static boolean isRGB888EGLPreferred() {
        return FeatureParser.getBoolean("is_rgb888_egl_prefer", false);
    }

    public static boolean isSupportFrontFlash() {
        return FeatureParser.getBoolean("support_front_flash", false);
    }

    public static boolean isLegacyFaceBeauty() {
        return FeatureParser.getBoolean("is_legacy_face_beauty", true);
    }

    public static boolean isFrontFingerSensor() {
        return FeatureParser.getBoolean("front_fingerprint_sensor", false);
    }

    public static boolean isBackFingerSensor() {
        if (isFrontFingerSensor() || IS_E8 || getFpNavEventNameList() == null || (getFpNavEventNameList().isEmpty() ^ 1) == 0) {
            return false;
        }
        return true;
    }

    public static boolean isSupportScreenLight() {
        return FeatureParser.getBoolean("support_screen_light", false);
    }

    public static boolean isSupportDynamicLightSpot() {
        return FeatureParser.getBoolean("support_camera_dynamic_light_spot", false);
    }

    public static boolean isSupportParallelProcess() {
        return FeatureParser.getBoolean("support_parallel_process", false);
    }

    public static boolean isSupportFrontBeautyMFNR() {
        return FeatureParser.getBoolean("support_front_beauty_mfnr", false);
    }

    public static boolean isSupportVideoHFRMode() {
        return FeatureParser.getBoolean("support_video_hfr_mode", false);
    }

    public static boolean isSupport3DFaceBeauty() {
        return FeatureParser.getBoolean("support_3d_face_beauty", false);
    }

    public static boolean isSupportMiFaceBeauty() {
        return FeatureParser.getBoolean("support_mi_face_beauty", false);
    }

    public static boolean isSupportNewFaceBeauty() {
        return !isSupport3DFaceBeauty() ? isSupportMiFaceBeauty() : true;
    }

    public static boolean isSupportLensDirtyDetect() {
        return FeatureParser.getBoolean("support_lens_dirty_detect", false);
    }

    public static boolean enableAlgorithmInFileSuffix() {
        return FeatureParser.getBoolean("enable_algorithm_in_file_suffix", false);
    }

    public static boolean isSupportSuperResolution() {
        return FeatureParser.getBoolean("support_super_resolution", false);
    }

    public static boolean supportPictureWaterMark() {
        return FeatureParser.getBoolean("support_picture_watermark", false);
    }

    public static boolean supportNewBrightness() {
        return !IS_E1 ? IS_D5X : true;
    }
}
