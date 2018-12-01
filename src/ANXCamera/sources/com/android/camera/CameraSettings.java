package com.android.camera;

import android.content.Context;
import android.hardware.input.InputManager;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.provider.Settings.System;
import android.support.v7.recyclerview.R;
import android.util.Range;
import android.util.Size;
import android.util.SparseArray;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.provider.DataProvider;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import java.io.File;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import miui.reflect.Method;

public class CameraSettings {
    public static int BOTTOM_CONTROL_HEIGHT;
    public static final int SURFACE_LEFT_MARGIN_MDP_QUALITY_480P = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_surface_view_left_margin_mdp_render_quality_480p);
    public static final int SURFACE_LEFT_MARGIN_MDP_QUALITY_LOW = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_surface_view_left_margin_mdp_render_quality_low);
    public static final int TOP_CONTROL_HEIGHT = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.bottom_control_upper_panel_height);
    public static final ChangeManager sCameraChangeManager = new ChangeManager();
    public static boolean sCroppedIfNeeded = false;
    private static boolean sEdgePhotoEnable = false;
    private static SparseArray<String> sFaceBeautyLevelToValue = new SparseArray();
    private static boolean sGoolgeLensAvilability = false;
    public static ArrayList<String> sRemindMode = new ArrayList();
    private static HashMap<String, String> sSceneToFlash = new HashMap(11);

    @Retention(RetentionPolicy.SOURCE)
    public @interface UiStyle {
    }

    static {
        sSceneToFlash.put("auto", null);
        sSceneToFlash.put("portrait", null);
        sSceneToFlash.put("landscape", "0");
        sSceneToFlash.put("sports", null);
        sSceneToFlash.put("night", "0");
        sSceneToFlash.put("night-portrait", "1");
        sSceneToFlash.put("beach", "0");
        sSceneToFlash.put("snow", "0");
        sSceneToFlash.put("sunset", "0");
        sSceneToFlash.put("fireworks", "0");
        sSceneToFlash.put("backlight", "0");
        sSceneToFlash.put("flowers", "0");
        sRemindMode.add("pref_camera_mode_settings_key");
        sRemindMode.add("pref_camera_magic_mirror_key");
        if (Device.isSupportGroupShot()) {
            sRemindMode.add("pref_camera_groupshot_mode_key");
        }
        if (Device.isLegacyFaceBeauty()) {
            sFaceBeautyLevelToValue.put(0, BeautyConstant.LEVEL_CLOSE);
            sFaceBeautyLevelToValue.put(1, BeautyConstant.LEVEL_LOW);
            sFaceBeautyLevelToValue.put(2, BeautyConstant.LEVEL_MEDIUM);
            sFaceBeautyLevelToValue.put(3, BeautyConstant.LEVEL_HIGH);
        } else {
            sFaceBeautyLevelToValue.put(0, BeautyConstant.LEVEL_CLOSE);
            sFaceBeautyLevelToValue.put(1, BeautyConstant.LEVEL_MEDIUM);
            sFaceBeautyLevelToValue.put(2, BeautyConstant.LEVEL_HIGH);
            sFaceBeautyLevelToValue.put(3, BeautyConstant.LEVEL_XHIGH);
            sFaceBeautyLevelToValue.put(4, BeautyConstant.LEVEL_XXHIGH);
            sFaceBeautyLevelToValue.put(5, BeautyConstant.LEVEL_XXXHIGH);
        }
    }

    public static boolean isFrontCamera() {
        return DataRepository.dataItemGlobal().getCurrentCameraId() == Camera2DataContainer.getInstance().getFrontCameraId();
    }

    public static boolean isBackCamera() {
        return DataRepository.dataItemGlobal().getCurrentCameraId() == Camera2DataContainer.getInstance().getMainBackCameraId();
    }

    public static String getPictureSize(String defaultValue) {
        if (ModuleManager.isSquareModule()) {
            return "4x3";
        }
        return DataRepository.dataItemConfig().getString("pref_camera_picturesize_key", defaultValue);
    }

    public static float getPreviewAspectRatio(int width, int height) {
        if (Math.abs((((double) width) / ((double) height)) - 1.3333333333333333d) <= Math.abs((((double) width) / ((double) height)) - 1.7777777777777777d)) {
            return 1.3333334f;
        }
        if (Math.abs((((double) width) / ((double) height)) - 1.7777777777777777d) > Math.abs((((double) width) / ((double) height)) - 2.0d)) {
            return 2.0f;
        }
        return 1.7777778f;
    }

    public static int getRenderAspectRatio(int width, int height) {
        return getAspectRatio(width, height);
    }

    public static int getAspectRatio(int width, int height) {
        if (isNearRatio16_9(width, height)) {
            return 1;
        }
        if (isNearRatio18_9(width, height)) {
            return 3;
        }
        return 0;
    }

    public static boolean isAspectRatio4_3(int width, int height) {
        if (width < height) {
            int tmp = width;
            width = height;
            height = tmp;
        }
        if (Math.abs((((double) width) / ((double) height)) - 1.3333333333333333d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static boolean isAspectRatio16_9(int width, int height) {
        if (width < height) {
            int tmp = width;
            width = height;
            height = tmp;
        }
        if (Math.abs((((double) width) / ((double) height)) - 1.7777777777777777d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static boolean isAspectRatio18_9(int width, int height) {
        if (width < height) {
            int tmp = width;
            width = height;
            height = tmp;
        }
        if (Math.abs((((double) width) / ((double) height)) - 2.0d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static int getStrictAspectRatio(int width, int height) {
        if (isAspectRatio16_9(width, height)) {
            return 1;
        }
        if (isAspectRatio4_3(width, height)) {
            return 0;
        }
        if (isAspectRatio1_1(width, height)) {
            return 2;
        }
        return -1;
    }

    public static boolean isNearAspectRatio(int width1, int height1, int width2, int height2) {
        return getAspectRatio(width1, height1) == getAspectRatio(width2, height2);
    }

    public static boolean isAspectRatio1_1(int width, int height) {
        return width == height;
    }

    public static boolean isNearRatio16_9(int width, int height) {
        if (width < height) {
            int tmp = width;
            width = height;
            height = tmp;
        }
        double ratio = ((double) width) / ((double) height);
        if ((Math.abs(ratio - 1.3333333333333333d) > Math.abs(ratio - 1.7777777777777777d) || Math.abs(ratio - 1.5d) < 0.02d) && Math.abs(ratio - 1.7777777777777777d) <= Math.abs(ratio - 2.0d)) {
            return true;
        }
        return false;
    }

    public static boolean isNearRatio18_9(int width, int height) {
        if (width < height) {
            int tmp = width;
            width = height;
            height = tmp;
        }
        double ratio = ((double) width) / ((double) height);
        if ((Math.abs(ratio - 1.3333333333333333d) > Math.abs(ratio - 1.7777777777777777d) || Math.abs(ratio - 1.5d) < 0.02d) && Math.abs(ratio - 1.7777777777777777d) > Math.abs(ratio - 2.0d)) {
            return true;
        }
        return false;
    }

    public static String getHfrSetting() {
        return DataRepository.dataItemConfig().getString("pref_video_hfr_key", getString(R.string.pref_video_hfr_entryvalue_default));
    }

    public static int getVideoQuality() {
        if (isStereoModeOn()) {
            return 6;
        }
        return getPreferVideoQuality();
    }

    public static int getSkipFrameNumber() {
        if (isFrontCamera()) {
            return CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.camera_skip_frame_num);
        }
        return 0;
    }

    public static int getPreferVideoQuality() {
        String defaultQuality = getString(getDefaultPreferenceId(R.string.pref_video_quality_default));
        ProviderEditor editor;
        if (DataRepository.dataItemConfig().contains("pref_video_quality_key")) {
            String qualityStr = DataRepository.dataItemConfig().getString("pref_video_quality_key", defaultQuality);
            if (!(defaultQuality.equals(qualityStr) || (Util.isStringValueContained((Object) qualityStr, (int) R.array.pref_video_quality_entryvalues) ^ 1) == 0)) {
                Log.e("CameraSettings", "reset invalid video quality " + qualityStr);
                qualityStr = defaultQuality;
                editor = DataRepository.dataItemConfig().editor();
                editor.putString("pref_video_quality_key", defaultQuality);
                editor.apply();
            }
            return Integer.parseInt(qualityStr);
        }
        if (!CamcorderProfile.hasProfile(getCameraId(), Integer.parseInt(defaultQuality))) {
            defaultQuality = Integer.toString(1);
        }
        editor = DataRepository.dataItemConfig().editor();
        editor.putString("pref_video_quality_key", defaultQuality);
        editor.apply();
        return Integer.parseInt(defaultQuality);
    }

    public static int getVideoEncoder() {
        if ("h265".equals(DataRepository.dataItemGlobal().getString("pref_video_encoder_key", getString(R.string.pref_video_encoder_default)))) {
            return 5;
        }
        return 2;
    }

    public static int getExposureMeteringMode() {
        return Util.parseInt(DataRepository.dataItemGlobal().getString("pref_camera_autoexposure_key", getString(R.string.pref_camera_autoexposure_default)), 1);
    }

    public static boolean getBool(int resId) {
        return CameraAppImpl.getAndroidContext().getResources().getBoolean(resId);
    }

    public static String getString(int resId) {
        return CameraAppImpl.getAndroidContext().getString(resId);
    }

    public static void upgradeGlobalPreferences() {
        int i = 0;
        DataItemGlobal pref = DataRepository.dataItemGlobal();
        int version = pref.getInt("pref_version_key", 0);
        if (version < 4) {
            DataRepository.dataItemGlobal().editor().clear().apply();
            int[] intentTypes = new int[]{0, 1};
            int length = intentTypes.length;
            while (i < length) {
                int intentType = intentTypes[i];
                int cameraId = Camera2DataContainer.getInstance().getMainBackCameraId();
                DataProvider provider = DataRepository.provider();
                provider.dataConfig(cameraId, intentType).editor().clear().apply();
                provider.dataConfig(Camera2DataContainer.getInstance().getFrontCameraId(), intentType).editor().clear().apply();
                i++;
            }
            pref.editor().putInt("pref_version_key", 4).apply();
            if (version == 1) {
                deleteObsoletePreferences();
            }
        }
    }

    private static void deleteObsoletePreferences() {
        File file;
        int[] cameraIds = new int[]{0, 1};
        String parent = "/data/data/" + CameraAppImpl.getAndroidContext().getPackageName().toString() + "/shared_prefs";
        for (int mode : BaseModule.CAMERA_MODES) {
            if (mode != 0) {
                for (int cameraId : cameraIds) {
                    file = new File(parent, ("camera_settings_simple_mode_local_" + BaseModule.getPreferencesLocalId(cameraId, mode)) + ".xml");
                    if (file.exists()) {
                        file.delete();
                    }
                }
            }
        }
        file = new File(parent, "camera_settings_simple_mode_global.xml");
        if (file.exists()) {
            file.delete();
        }
    }

    public static int readPreferredCameraId() {
        return DataRepository.dataItemGlobal().getCurrentCameraId();
    }

    public static int getCameraId() {
        return DataRepository.dataItemGlobal().getCurrentCameraId();
    }

    public static int readExposure() {
        return Util.parseInt(DataRepository.dataItemConfig().getString("pref_camera_exposure_key", "0"), 0);
    }

    public static void writeExposure(int value) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString("pref_camera_exposure_key", Integer.toString(value));
        editor.apply();
    }

    public static void resetExposure() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.remove("pref_camera_exposure_key");
        editor.apply();
    }

    public static float readZoom() {
        String zoom = DataRepository.dataItemConfig().getString("pref_camera_zoom_key", "1");
        try {
            return Float.parseFloat(zoom);
        } catch (Exception e) {
            Log.e("CameraSettings", "Invalid zoom: " + zoom);
            return 0.0f;
        }
    }

    public static void writeZoom(float value) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString("pref_camera_zoom_key", Float.toString(value));
        editor.apply();
    }

    public static void resetZoom() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.remove("pref_camera_zoom_key");
        editor.apply();
    }

    public static int get4kProfile() {
        if (Device.isSupportedVideoQuality4kUHD()) {
            return Integer.parseInt(getString(R.string.pref_video_quality_entry_value_4kuhd));
        }
        return -1;
    }

    public static boolean is4KHigherVideoQuality(int quality) {
        boolean z = false;
        if (!Device.isSupportedVideoQuality4kUHD()) {
            return false;
        }
        if (get4kProfile() <= quality) {
            z = true;
        }
        return z;
    }

    public static ArrayList<String> getSupportedVideoQuality(int cameraId) {
        ArrayList<String> supported = new ArrayList();
        List<CameraSize> sizes = Camera2DataContainer.getInstance().getCapabilities(cameraId).getSupportedOutputSize(MediaRecorder.class);
        int quality4k = get4kProfile();
        if (Device.isSupportedVideoQuality4kUHD() && sizes.contains(new CameraSize(3840, 2160)) && CamcorderProfile.hasProfile(cameraId, quality4k)) {
            supported.add(Integer.toString(quality4k));
        }
        if (sizes.contains(new CameraSize(1920, 1080)) && CamcorderProfile.hasProfile(cameraId, 6)) {
            supported.add(Integer.toString(6));
        }
        if (sizes.contains(new CameraSize(1280, 720)) && CamcorderProfile.hasProfile(cameraId, 5)) {
            supported.add(Integer.toString(5));
        }
        if (sizes.contains(new CameraSize(720, 480)) && CamcorderProfile.hasProfile(cameraId, 4)) {
            supported.add(Integer.toString(4));
        }
        if (CamcorderProfile.hasProfile(cameraId, 11)) {
            supported.add(Integer.toString(11));
        }
        if (CamcorderProfile.hasProfile(cameraId, 10)) {
            supported.add(Integer.toString(10));
        }
        if (CamcorderProfile.hasProfile(cameraId, 9)) {
            supported.add(Integer.toString(9));
        }
        return supported;
    }

    public static ArrayList<String> getSupportedHfrSettings(int cameraId) {
        ArrayList<String> supported = new ArrayList();
        CameraCapabilities cc = Camera2DataContainer.getInstance().getCapabilities(cameraId);
        for (Size size : cc.getSupportedHighSpeedVideoSize()) {
            if (size.getWidth() == 1920 || size.getWidth() == 1280) {
                for (Range<Integer> range : cc.getSupportedHighSpeedVideoFPSRange(size)) {
                    String value = String.format(Locale.ENGLISH, "%dx%d:%d", new Object[]{Integer.valueOf(size.getWidth()), Integer.valueOf(size.getHeight()), range.getUpper()});
                    if (!supported.contains(value)) {
                        supported.add(value);
                    }
                }
            }
        }
        return supported;
    }

    public static long updateOpenCameraFailTimes() {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        long openCameraFail = DataRepository.dataItemGlobal().getLong("open_camera_fail_key", 0) + 1;
        editor.putLong("open_camera_fail_key", openCameraFail);
        editor.apply();
        return openCameraFail;
    }

    public static boolean isVideoCaptureVisible() {
        if ((Device.isMTKPlatform() ? isStereoModeOn() : false) || (!Device.isHFRVideoCaptureSupported() && ("slow".equals(DataRepository.dataItemRunning().getVideoSpeed()) || ("hfr".equals(DataRepository.dataItemRunning().getVideoSpeed()) ^ 1) == 0))) {
            return false;
        }
        if (!Device.isSupportedVideoQuality4kUHD()) {
            return true;
        }
        int i;
        if (Device.IS_MI4) {
            i = 1;
        } else {
            i = Device.IS_X5;
        }
        if ((i ^ 1) != 0 || getVideoQuality() <= 6) {
            return true;
        }
        return false;
    }

    public static int getDefaultPreferenceId(int prefId) {
        switch (prefId) {
            case R.bool.pref_camera_auto_chroma_flash_default /*2131492867*/:
                if (Device.IS_X5 || Device.IS_X7) {
                    return R.bool.pref_camera_auto_chroma_flash_virgo_default;
                }
            case R.string.pref_video_quality_default /*2131689502*/:
                if (Device.isFrontVideoQualityShouldBe1080P() && isFrontCamera()) {
                    return R.string.pref_mi_front_video_quality_default;
                }
            case R.string.pref_camera_antibanding_default /*2131689645*/:
                if (Util.isAntibanding60()) {
                    return R.string.pref_camera_antibanding_entryvalue_60hz;
                }
                break;
        }
        return prefId;
    }

    public static boolean isRecordLocation() {
        if (Device.isSupportedGPS()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_camera_recordlocation_key", false);
        }
        return false;
    }

    public static boolean isCameraSoundOpen() {
        if (Device.isSupportedMuteCameraSound()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_camerasound_key", true);
        }
        return true;
    }

    public static boolean isTimeWaterMarkOpen() {
        return DataRepository.dataItemGlobal().getBoolean("pref_watermark_key", false);
    }

    public static void setDualCameraWaterMarkOpen(boolean open) {
        if (isSupportedDualCameraWaterMark() && isBackCamera()) {
            DataRepository.dataItemGlobal().editor().putBoolean("pref_dualcamera_watermark", open).apply();
        }
    }

    public static void setAiSceneOpen(boolean open) {
        DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_ai_scene_mode_key", open).apply();
    }

    public static boolean getAiSceneOpen() {
        if (isFrontCamera()) {
            return false;
        }
        if (ModuleManager.isCameraModule() || ModuleManager.isSquareModule()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_camera_ai_scene_mode_key", false);
        }
        return false;
    }

    public static boolean isDualCameraWaterMarkOpen() {
        if (isSupportedDualCameraWaterMark() && isBackCamera()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_dualcamera_watermark", getBool(R.bool.pref_dualcamera_watermark_default));
        }
        return false;
    }

    public static boolean retainCameraMode() {
        return DataRepository.dataItemGlobal().getBoolean("pref_retain_camera_mode_key", false);
    }

    public static boolean isProximityLockOpen() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_proximity_lock_key", true);
    }

    public static boolean isFrontMirror() {
        DataItemGlobal configGlobal = DataRepository.dataItemGlobal();
        String value = configGlobal.getString("pref_front_mirror_key", getString(R.string.pref_front_mirror_default));
        if ("auto".equals(value)) {
            configGlobal.editor().remove("pref_front_mirror_key").apply();
        }
        return getString(R.string.pref_front_mirror_entryvalue_on).equals(value);
    }

    public static boolean isMovieSolidOn() {
        if (Device.isSupportedMovieSolid()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_camera_movie_solid_key", Boolean.valueOf(getString(R.string.pref_camera_movie_solid_default)).booleanValue());
        }
        return false;
    }

    public static boolean showGenderAge() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_show_gender_age_key");
    }

    public static boolean isMagicMirrorOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_magic_mirror_key");
    }

    public static boolean isScanQRCode(Context context) {
        if (isFrontCamera() || !isQRCodeReceiverAvailable(context)) {
            return false;
        }
        return DataRepository.dataItemGlobal().getBoolean("pref_scan_qrcode_key", Boolean.valueOf(getString(R.string.pref_scan_qrcode_default)).booleanValue());
    }

    public static boolean isQRCodeReceiverAvailable(Context context) {
        return Util.isPackageAvailable(context, "com.xiaomi.scanner");
    }

    public static boolean checkLensAvailability(Context context) {
        boolean z = false;
        if (!DataRepository.dataItemGlobal().getBoolean("pref_camera_ai_detect_enable_key", Boolean.valueOf(getString(R.bool.pref_ai_detect_enable)).booleanValue())) {
            return false;
        }
        if (!Util.isGlobalVersion()) {
            return Util.isPackageAvailable(context, "com.xiaomi.lens");
        }
        if (Util.isPackageAvailable(context, "com.google.ar.lens")) {
            z = sGoolgeLensAvilability;
        }
        return z;
    }

    public static void setGoogleLensAvailability(boolean availability) {
        sGoolgeLensAvilability = availability;
    }

    public static boolean isBurstShootingEnable() {
        if (Device.isSupportedLongPressBurst()) {
            return "burst".equals(DataRepository.dataItemGlobal().getString("pref_camera_long_press_shutter_feature_key", getString(R.string.pref_camera_long_press_shutter_feature_default)));
        }
        return false;
    }

    public static boolean isAEAFLockSupport() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_ae_af_lock_support_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_AEAF_lock_support));
    }

    public static int getUIStyleByPreview(int width, int height) {
        if (Device.isPad()) {
            return 0;
        }
        if (sCroppedIfNeeded) {
            return 1;
        }
        int index = 0;
        double ratio = ((double) width) / ((double) height);
        if (Device.isMDPRender() && Math.abs(ratio - 1.5d) < 0.02d) {
            index = 2;
        } else if (Math.abs(ratio - 1.3333333333333333d) > Math.abs(ratio - 1.7777777777777777d) || Math.abs(ratio - 1.5d) < 0.02d) {
            if (Math.abs(ratio - 1.7777777777777777d) > Math.abs(ratio - 2.0d)) {
                index = 3;
            } else {
                index = 1;
            }
        }
        return index;
    }

    public static boolean isSwitchOn(String key) {
        if (isTransient(key)) {
            return DataRepository.dataItemRunning().isSwitchOn(key);
        }
        if (isCameraSpecific(key)) {
            return "on".equals(DataRepository.dataItemConfig().getString(key, "off"));
        }
        return "on".equals(DataRepository.dataItemGlobal().getString(key, "off"));
    }

    public static boolean isPortraitModeBackOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_portrait_mode_key");
    }

    public static boolean isStereoModeOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_stereo_mode_key");
    }

    public static boolean isGroupShotOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_groupshot_mode_key");
    }

    public static boolean isGradienterOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_gradienter_key");
    }

    public static boolean isTiltShiftOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_tilt_shift_mode");
    }

    public static int getKValue() {
        return DataRepository.dataItemConfig().getInt("pref_qc_manual_whitebalance_k_value_key", 5500);
    }

    public static String getMappingFocusMode(int focusPosition) {
        return focusPosition == 1000 ? "continuous-picture" : "manual";
    }

    public static String getFocusMode() {
        if (isSwitchOn("pref_camera_manual_mode_key")) {
            return getMappingFocusMode(getFocusPosition());
        }
        if (ModuleManager.isVideoModule() || ModuleManager.isFunModule()) {
            return getString(R.string.pref_video_focusmode_entryvalue_default);
        }
        return getString(R.string.pref_camera_focusmode_value_default);
    }

    public static void setFocusModeSwitching(boolean value) {
        DataRepository.dataItemConfig().editor().putBoolean("pref_qc_focus_mode_switching_key", value).apply();
    }

    public static boolean isFocusModeSwitching() {
        return DataRepository.dataItemConfig().getBoolean("pref_qc_focus_mode_switching_key", false);
    }

    public static void setShaderEffect(int value) {
        DataRepository.dataItemRunning().getComponentConfigFilter().setComponentValue(DataRepository.dataItemGlobal().getCurrentMode(), String.valueOf(value));
    }

    public static int getShaderEffect() {
        return Util.parseInt(DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(DataRepository.dataItemGlobal().getCurrentMode()), FilterInfo.FILTER_ID_NONE);
    }

    public static int getFocusPosition() {
        return Integer.parseInt(DataRepository.dataItemConfig().getManuallyFocus().getComponentValue(167));
    }

    public static boolean isAdvancedBeautyOn() {
        return BeautyConstant.LEVEL_ADVANCED.equals(getFaceBeautifyValue());
    }

    public static String getFlashModeByScene(String sceneMode) {
        return (String) sSceneToFlash.get(sceneMode);
    }

    public static int getCountDownTimes() {
        return DataRepository.dataItemRunning().getComponentRunningTimer().getTimer();
    }

    public static String getFaceBeautySwitch() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        String value = dataItemConfig.getString("pref_camera_face_beauty_switch_key", "pref_camera_face_beauty_key");
        if (Device.isLegacyFaceBeauty() || !"pref_camera_face_beauty_advanced_key".equals(value)) {
            return value;
        }
        Log.w("CameraSettings", "reset beauty switch");
        dataItemConfig.editor().remove("pref_camera_face_beauty_switch_key").apply();
        return "pref_camera_face_beauty_key";
    }

    public static void setFaceBeautySwitch(String value) {
        DataRepository.dataItemConfig().editor().putString("pref_camera_face_beauty_switch_key", value).apply();
    }

    public static void setFaceBeautyLevel(int level) {
        DataRepository.dataItemConfig().editor().putString("pref_camera_face_beauty_key", beautyLevelToIntelligentValue(level)).apply();
    }

    public static int getFaceBeautyRatio(String key, int defaultRatio) {
        return DataRepository.dataItemConfig().getInt(key, defaultRatio);
    }

    public static void setFaceBeautyRatio(String key, int ratio) {
        DataRepository.dataItemConfig().editor().putInt(key, ratio).apply();
    }

    public static String getFaceBeautyDefaultValue() {
        if (isBackCamera()) {
            return BeautyConstant.LEVEL_CLOSE;
        }
        return Device.isLegacyFaceBeauty() ? BeautyConstant.LEVEL_MEDIUM : BeautyConstant.LEVEL_XHIGH;
    }

    public static String getFaceBeautifyValue() {
        if (!Device.isSupportedSkinBeautify()) {
            return BeautyConstant.LEVEL_CLOSE;
        }
        if (Device.isLegacyFaceBeauty() && "pref_camera_face_beauty_advanced_key".equals(getFaceBeautySwitch())) {
            return BeautyConstant.LEVEL_ADVANCED;
        }
        String defaultBeauty = getFaceBeautyDefaultValue();
        String faceBeautyValue = DataRepository.dataItemConfig().getString("pref_camera_face_beauty_key", defaultBeauty);
        if (!(defaultBeauty.equals(faceBeautyValue) || (isFaceBeautyValid(faceBeautyValue) ^ 1) == 0)) {
            Log.e("CameraSettings", "reset invalid face beauty value: " + faceBeautyValue);
            DataRepository.dataItemConfig().editor().remove("pref_camera_face_beauty_key").apply();
            faceBeautyValue = defaultBeauty;
        }
        return faceBeautyValue;
    }

    public static String getFaceBeautyCloseValue() {
        return BeautyConstant.LEVEL_CLOSE;
    }

    private static String beautyLevelToIntelligentValue(int beautyLevel) {
        String value = (String) sFaceBeautyLevelToValue.get(beautyLevel);
        if (value != null) {
            return value;
        }
        Log.e("CameraSettings", "invalid faceBeautyLevel: " + beautyLevel);
        return BeautyConstant.LEVEL_CLOSE;
    }

    public static int intelligentValueToBeautyLevel(String value) {
        int index = Util.stringSparseArraysIndexOf(sFaceBeautyLevelToValue, value);
        if (index < 0) {
            Log.e("CameraSettings", "invalid faceBeautyValue: " + value);
            index = 0;
        }
        return sFaceBeautyLevelToValue.keyAt(index);
    }

    public static boolean isFaceBeautyValid(String value) {
        boolean z = true;
        if (BeautyConstant.LEVEL_ADVANCED.equals(value)) {
            return true;
        }
        if (Util.stringSparseArraysIndexOf(sFaceBeautyLevelToValue, value) < 0) {
            z = false;
        }
        return z;
    }

    public static int getBeautifyDefaultValue(String key) {
        int resId = 0;
        if ("pref_beautify_skin_color_ratio_key".equals(key)) {
            resId = R.string.pref_skin_beautify_color_default;
        } else if ("pref_beautify_slim_face_ratio_key".equals(key)) {
            resId = R.string.pref_skin_beautify_slim_default;
        } else if ("pref_beautify_skin_smooth_ratio_key".equals(key)) {
            resId = R.string.pref_skin_beautify_smooth_default;
        } else if ("pref_beautify_enlarge_eye_ratio_key".equals(key)) {
            resId = R.string.pref_skin_beautify_eye_default;
        }
        return Util.parseInt(getString(resId), 0);
    }

    public static int[] getBeautifyValueRange() {
        if (Device.isMTKPlatform()) {
            return new int[]{-12, 12};
        }
        if (Device.isNvPlatform()) {
            return new int[]{0, 7};
        }
        return new int[]{0, 10};
    }

    public static void setPriorityStoragePreference(boolean externalPriority) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean("pref_priority_storage", externalPriority);
        editor.apply();
    }

    public static boolean isPressDownCapture() {
        if (!Device.isSupportedFastCapture()) {
            return false;
        }
        return !isFrontCamera() ? "focus".equals(DataRepository.dataItemGlobal().getString("pref_camera_long_press_shutter_feature_key", getString(R.string.pref_camera_long_press_shutter_feature_default))) ^ 1 : true;
    }

    public static boolean isEdgePhotoEnable() {
        return Device.isSupportedEdgeTouch() ? sEdgePhotoEnable : false;
    }

    public static int getSystemEdgeMode(Context context) {
        if (Device.isSupportedEdgeTouch() && (((System.getInt(context.getContentResolver(), "edge_handgrip", 0) | System.getInt(context.getContentResolver(), "edge_handgrip_clean", 0)) | System.getInt(context.getContentResolver(), "edge_handgrip_back", 0)) | System.getInt(context.getContentResolver(), "edge_handgrip_screenshot", 0)) == 1) {
            return 2;
        }
        return 0;
    }

    public static void readEdgePhotoSetting(Context context) {
        boolean z = true;
        if (Device.isSupportedEdgeTouch()) {
            if (System.getInt(context.getContentResolver(), "edge_handgrip_photo", 0) != 1) {
                z = false;
            }
            sEdgePhotoEnable = z;
        }
    }

    public static void setEdgeMode(Context context, boolean enable) {
        int i = 1;
        if (context != null) {
            if (enable) {
                readEdgePhotoSetting(context);
            }
            if (isEdgePhotoEnable()) {
                InputManager im = (InputManager) context.getSystemService("input");
                Class<?>[] ownerClazz = new Class[]{InputManager.class};
                Method method = Util.getMethod(ownerClazz, "switchTouchEdgeMode", "(I)V");
                if (method != null) {
                    Class cls = ownerClazz[0];
                    Object[] objArr = new Object[1];
                    if (!enable) {
                        i = getSystemEdgeMode(context);
                    }
                    objArr[0] = Integer.valueOf(i);
                    method.invoke(cls, im, objArr);
                }
            }
        }
    }

    public static String getJpegQuality(boolean burst) {
        String jpegQuality = DataRepository.dataItemConfig().getString("pref_camera_jpegquality_key", getString(R.string.pref_camera_jpegquality_default));
        String maxQuality = "high";
        if (burst) {
            maxQuality = "normal";
        }
        if (JpegEncodingQualityMappings.getQualityNumber(jpegQuality) < JpegEncodingQualityMappings.getQualityNumber(maxQuality)) {
            return jpegQuality;
        }
        return maxQuality;
    }

    public static String getMiuiSettingsKeyForStreetSnap(String snapValue) {
        if (snapValue.equals(getString(R.string.pref_camera_snap_value_take_picture))) {
            return "Street-snap-picture";
        }
        if (snapValue.equals(getString(R.string.pref_camera_snap_value_take_movie))) {
            return "Street-snap-movie";
        }
        return "none";
    }

    public static boolean isSwitchCameraZoomMode() {
        return !ModuleManager.isPanoramaModule() ? ModuleManager.isManualModule() : true;
    }

    public static String getCameraZoomMode(int module) {
        return DataRepository.dataItemConfig().getManuallyDualLens().getComponentValue(module);
    }

    public static boolean isLabOptionsVisible() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_lab_option_key_visible", false);
    }

    public static void setLabOptionsVisible(boolean visible) {
        DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_lab_option_key_visible", visible).apply();
    }

    public static boolean isCameraPortraitWithFaceBeauty() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_portrait_with_facebeauty_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_portrait_with_facebeauty_default));
    }

    public static boolean isCameraFaceDetectionAutoHidden() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_facedetection_auto_hidden_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_facedetection_auto_hidden_default));
    }

    public static boolean isDualCameraEnable() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_dual_enable_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_dual_enable_default));
    }

    public static boolean isDualCameraSatEnable() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_dual_sat_enable_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_dual_sat_enable_default));
    }

    public static boolean isMfnrSatEnable() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_mfnr_sat_enable_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_mfnr_sat_enable_default));
    }

    public static boolean isOptimizedFlashEnable() {
        return DataRepository.dataItemGlobal().getBoolean("pref_camera_optimized_flash_enable_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_optimized_flash_enable_default));
    }

    public static boolean isSREnable() {
        if (Device.isSupportSuperResolution()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_camera_sr_enable_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_sr_enable_default));
        }
        return false;
    }

    public static boolean isCameraParallelProcessEnable() {
        return isSupportParallelProcess() ? DataRepository.dataItemGlobal().getBoolean("pref_camera_parallel_process_enable_key", CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_parallel_process_enable_default)) : false;
    }

    public static boolean isSupportedOpticalZoom() {
        return Device.isSupportedOpticalZoom() ? Camera2DataContainer.getInstance().hasMuxCamera() : false;
    }

    public static boolean isSupportedPortrait() {
        return Device.isSupportedPortrait() ? Camera2DataContainer.getInstance().hasMuxCamera() : false;
    }

    public static boolean isSupportParallelProcess() {
        return Device.isSupportParallelProcess();
    }

    public static boolean isSupportedDualCameraWaterMark() {
        return Device.supportPictureWaterMark();
    }

    public static boolean isSupportedMetadata() {
        return !Device.isSupportedASD() ? isSupportedPortrait() : true;
    }

    public static boolean isEnableDNG() {
        return false;
    }

    public static boolean isFingerprintCaptureEnable() {
        return DataRepository.dataItemGlobal().getBoolean("pref_fingerprint_capture_key", false);
    }

    public static boolean isFovcEnabled() {
        return false;
    }

    public static String getSaturation() {
        String defaultValue = getString(R.string.pref_camera_saturation_default);
        Object saturation = DataRepository.dataItemGlobal().getString("pref_qc_camera_saturation_key", defaultValue);
        if (defaultValue.equals(saturation) || (Util.isStringValueContained(saturation, (int) R.array.pref_camera_saturation_entryvalues) ^ 1) == 0) {
            return saturation;
        }
        Log.e("CameraSettings", "reset invalid saturation " + saturation);
        resetSaturation();
        return defaultValue;
    }

    public static String getContrast() {
        String defaultValue = getString(R.string.pref_camera_contrast_default);
        Object contrast = DataRepository.dataItemGlobal().getString("pref_qc_camera_contrast_key", defaultValue);
        if (defaultValue.equals(contrast) || (Util.isStringValueContained(contrast, (int) R.array.pref_camera_contrast_entryvalues) ^ 1) == 0) {
            return contrast;
        }
        Log.e("CameraSettings", "reset invalid contrast " + contrast);
        resetContrast();
        return defaultValue;
    }

    public static String getSharpness() {
        String defaultValue = getString(R.string.pref_camera_sharpness_default);
        Object sharpness = DataRepository.dataItemGlobal().getString("pref_qc_camera_sharpness_key", defaultValue);
        if (defaultValue.equals(sharpness) || (Util.isStringValueContained(sharpness, (int) R.array.pref_camera_sharpness_entryvalues) ^ 1) == 0) {
            return sharpness;
        }
        Log.e("CameraSettings", "reset invalid sharpness " + sharpness);
        resetSharpness();
        return defaultValue;
    }

    public static void resetSaturation() {
        DataRepository.dataItemGlobal().editor().remove("pref_qc_camera_saturation_key").apply();
    }

    public static void resetContrast() {
        DataRepository.dataItemGlobal().editor().remove("pref_qc_camera_contrast_key").apply();
    }

    public static void resetSharpness() {
        DataRepository.dataItemGlobal().editor().remove("pref_qc_camera_sharpness_key").apply();
    }

    public static String getAntiBanding() {
        return DataRepository.dataItemGlobal().getString("pref_camera_antibanding_key", getString(getDefaultPreferenceId(R.string.pref_camera_antibanding_default)));
    }

    public static boolean isEvAdjustable() {
        return isTiltShiftOn() ^ 1;
    }

    public static boolean isPopupTipBeautyIntroEnable() {
        if (!Device.isSupport3DFaceBeauty() || (DataRepository.dataItemGlobal().getBoolean("pref_popup_tip_beauty_intro_clicked_key", false) ^ 1) == 0 || DataRepository.dataItemGlobal().getInt("pref_popup_tip_beauty_intro_show_times_key", 0) >= 3) {
            return false;
        }
        return true;
    }

    public static void addPopupTipBeautyIntroShowTimes() {
        DataRepository.dataItemGlobal().editor().putInt("pref_popup_tip_beauty_intro_show_times_key", DataRepository.dataItemGlobal().getInt("pref_popup_tip_beauty_intro_show_times_key", 0) + 1).apply();
    }

    public static void setPopupTipBeautyIntroClicked() {
        DataRepository.dataItemGlobal().editor().putBoolean("pref_popup_tip_beauty_intro_clicked_key", true).apply();
    }

    public static boolean isBeautyRemodelingClicked() {
        return DataRepository.dataItemGlobal().getBoolean("pref_beauty_remodeling_clicked_key", false);
    }

    public static void setBeautyRemodelingClicked() {
        DataRepository.dataItemGlobal().editor().putBoolean("pref_beauty_remodeling_clicked_key", true).apply();
    }

    public static boolean isLensDirtyDetectEnabled() {
        return DataRepository.dataNormalItemConfig().getBoolean("pref_lens_dirty_detect_enabled_key", true);
    }

    public static boolean shouldShowLensDirtyDetectHint() {
        boolean z = true;
        long now = System.currentTimeMillis();
        Calendar today = Calendar.getInstance();
        today.setTimeInMillis(now);
        Calendar lastDate = Calendar.getInstance();
        lastDate.setTimeInMillis(DataRepository.dataNormalItemConfig().getLong("pref_lens_dirty_detect_date_key", now));
        if (today.get(1) != lastDate.get(1) || today.get(2) != lastDate.get(2) || today.get(5) != lastDate.get(5)) {
            return true;
        }
        if (DataRepository.dataNormalItemConfig().getInt("pref_lens_dirty_detect_times_key", 0) >= 3) {
            z = false;
        }
        return z;
    }

    public static void setLensDirtyDetectEnable(boolean enable) {
        DataRepository.dataNormalItemConfig().editor().putBoolean("pref_lens_dirty_detect_enabled_key", enable).apply();
    }

    public static void addLensDirtyDetectedTimes() {
        ProviderEditor editor = DataRepository.dataNormalItemConfig().editor();
        editor.putBoolean("pref_lens_dirty_detect_enabled_key", false);
        long now = System.currentTimeMillis();
        Calendar today = Calendar.getInstance();
        today.setTimeInMillis(now);
        Calendar lastDate = Calendar.getInstance();
        lastDate.setTimeInMillis(DataRepository.dataNormalItemConfig().getLong("pref_lens_dirty_detect_date_key", now));
        int times = 1;
        if (today.get(1) == lastDate.get(1) && today.get(2) == lastDate.get(2) && today.get(5) == lastDate.get(5)) {
            times = DataRepository.dataNormalItemConfig().getInt("pref_lens_dirty_detect_times_key", 0) + 1;
        }
        editor.putInt("pref_lens_dirty_detect_times_key", times);
        editor.putLong("pref_lens_dirty_detect_date_key", now);
        editor.apply();
        Log.i("CameraSettings", "add lens dirty detected times: " + times);
    }

    public static boolean isCameraSpecific(String key) {
        return (key.equals("pref_camera_picturesize_key") || key.equals("pref_camera_jpegquality_key") || key.equals("pref_video_quality_key") || key.equals("pref_video_hfr_key") || key.equals("pref_sticker_path_key") || key.equals("pref_camera_flashmode_key") || key.equals("pref_camera_video_flashmode_key") || key.equals("pref_camera_hdr_key") || key.equals("pref_video_hdr_key") || key.equals("pref_camera_whitebalance_key") || key.equals("pref_qc_manual_whitebalance_k_value_key") || key.equals("pref_focus_position_key") || key.equals("pref_qc_camera_exposuretime_key") || key.equals("pref_qc_camera_iso_key") || key.equals("pref_camera_zoom_mode_key") || key.equals("pref_camera_manually_lens") || key.equals("pref_camera_face_beauty_key") || key.equals("pref_camera_face_beauty_switch_key") || key.equals("pref_beautify_slim_face_ratio_key") || key.equals("pref_beautify_skin_smooth_ratio_key") || key.equals("pref_beautify_skin_color_ratio_key")) ? true : key.equals("pref_beautify_enlarge_eye_ratio_key");
    }

    public static boolean isTransient(String key) {
        return (key.equals("pref_delay_capture_mode") || key.equals("pref_camera_shader_coloreffect_key") || key.equals("pref_camera_scenemode_key") || key.equals("pref_camera_scenemode_setting_key") || key.equals("pref_camera_gradienter_key") || key.equals("pref_camera_ubifocus_key") || key.equals("pref_camera_magic_mirror_key") || key.equals("pref_camera_groupshot_mode_key") || key.equals("pref_camera_super_resolution_key") || key.equals("pref_camera_tilt_shift_key") || key.equals("pref_camera_tilt_shift_mode") || key.equals("pref_camera_hand_night_key") || key.equals("pref_video_speed_fast_key") || key.equals("pref_video_speed_slow_key") || key.equals("pref_video_speed_hfr_key") || key.equals("pref_camera_portrait_mode_key") || key.equals("pref_camera_manual_mode_key") || key.equals("pref_camera_square_mode_key") || key.equals("pref_camera_show_gender_age_key") || key.equals("pref_camera_peak_key")) ? true : key.equals("pref_camera_stereo_mode_key");
    }

    public static void setPanoramaMoveDirection(int direction) {
        DataRepository.dataItemRunning().putInt("pref_panorana_move_direction_key", direction);
    }

    public static int getPanoramaMoveDirection() {
        return DataRepository.dataItemRunning().getInt("pref_panorana_move_direction_key", 4);
    }
}
