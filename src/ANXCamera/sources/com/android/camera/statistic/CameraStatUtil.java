package com.android.camera.statistic;

import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.MutexModeManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.effect.BeautyValues;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.miui.filtersdk.filter.helper.FilterType;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class CameraStatUtil {
    private static final String TAG = CameraStatUtil.class.getSimpleName();
    private static SparseArray<String> sBeautyTypeToName = new SparseArray();
    private static SparseArray<String> sCameraModeIdToName = new SparseArray();
    private static SparseArray<String> sExposureTimeLessThan1sToName = new SparseArray();
    private static SparseArray<String> sFilterTypeToName = new SparseArray();
    private static SparseArray<String> sPictureQualityIndexToName = new SparseArray();
    private static SparseArray<String> sTriggerModeIdToName = new SparseArray();

    static {
        sCameraModeIdToName.put(161, "小视频");
        sCameraModeIdToName.put(163, "拍照");
        sCameraModeIdToName.put(165, "方形");
        sCameraModeIdToName.put(166, "全景");
        sCameraModeIdToName.put(167, "手动");
        sCameraModeIdToName.put(171, "人像");
        sTriggerModeIdToName.put(10, "拍照键");
        sTriggerModeIdToName.put(20, "音量键");
        sTriggerModeIdToName.put(30, "指纹");
        sTriggerModeIdToName.put(40, "相机键");
        sTriggerModeIdToName.put(50, "dpad键");
        sTriggerModeIdToName.put(60, "物体追踪");
        sTriggerModeIdToName.put(70, "声控快门");
        sTriggerModeIdToName.put(80, "长按屏幕");
        sTriggerModeIdToName.put(90, "曝光环");
        sPictureQualityIndexToName.put(0, "最低");
        sPictureQualityIndexToName.put(1, "更低");
        sPictureQualityIndexToName.put(2, "低");
        sPictureQualityIndexToName.put(3, "标准");
        sPictureQualityIndexToName.put(4, "高");
        sPictureQualityIndexToName.put(5, "更高");
        sPictureQualityIndexToName.put(6, "最高");
        sExposureTimeLessThan1sToName.put(0, "auto");
        sExposureTimeLessThan1sToName.put(1000, "1/1000s");
        sExposureTimeLessThan1sToName.put(2000, "1/500s");
        sExposureTimeLessThan1sToName.put(4000, "1/250s");
        sExposureTimeLessThan1sToName.put(5000, "1/250s");
        sExposureTimeLessThan1sToName.put(8000, "1/125s");
        sExposureTimeLessThan1sToName.put(16667, "1/60s");
        sExposureTimeLessThan1sToName.put(33333, "1/30s");
        sExposureTimeLessThan1sToName.put(66667, "1/15s");
        sExposureTimeLessThan1sToName.put(125000, "1/8s");
        sExposureTimeLessThan1sToName.put(250000, "1/4s");
        sExposureTimeLessThan1sToName.put(500000, "1/2s");
        sExposureTimeLessThan1sToName.put(1000000, "1s");
        sExposureTimeLessThan1sToName.put(2000000, "2s");
        sExposureTimeLessThan1sToName.put(4000000, "4s");
        sExposureTimeLessThan1sToName.put(8000000, "8s");
        sExposureTimeLessThan1sToName.put(16000000, "16s");
        sExposureTimeLessThan1sToName.put(32000000, "32s");
        sBeautyTypeToName.put(Type.WHITEN_STRENGTH.ordinal(), "美白");
        sBeautyTypeToName.put(Type.SHRINK_FACE_RATIO.ordinal(), "瘦脸");
        sBeautyTypeToName.put(Type.ENLARGE_EYE_RATIO.ordinal(), "大眼");
        sBeautyTypeToName.put(Type.SMOOTH_STRENGTH.ordinal(), "嫩肤");
        sBeautyTypeToName.put(Type.NOSE_RATIO.ordinal(), "芭比鼻");
        sBeautyTypeToName.put(Type.RISORIUS_RATIO.ordinal(), "苹果肌");
        sBeautyTypeToName.put(Type.LIPS_RATIO.ordinal(), "花瓣唇");
        sBeautyTypeToName.put(Type.CHIN_RATIO.ordinal(), "翘下巴");
        sBeautyTypeToName.put(Type.NECK_RATIO.ordinal(), "天鹅颈");
        sBeautyTypeToName.put(Type.SMILE_RATIO.ordinal(), "微笑");
        sBeautyTypeToName.put(Type.SLIM_NOSE_RATIO.ordinal(), "瘦鼻");
        sFilterTypeToName.put(FilterType.N_BERRY.ordinal(), "浆果");
        sFilterTypeToName.put(FilterType.N_COOKIE.ordinal(), "曲奇");
        sFilterTypeToName.put(FilterType.N_DELICACY.ordinal(), "美味");
        sFilterTypeToName.put(FilterType.N_FADE.ordinal(), "褪色");
        sFilterTypeToName.put(FilterType.N_FILM.ordinal(), "胶片(拍照)");
        sFilterTypeToName.put(FilterType.N_KOIZORA.ordinal(), "恋空");
        sFilterTypeToName.put(FilterType.N_LATTE.ordinal(), "拿铁");
        sFilterTypeToName.put(FilterType.N_LIGHT.ordinal(), "浮光");
        sFilterTypeToName.put(FilterType.N_LIVELY.ordinal(), "生动");
        sFilterTypeToName.put(FilterType.N_QUIET.ordinal(), "静谧");
        sFilterTypeToName.put(FilterType.N_SODA.ordinal(), "汽水");
        sFilterTypeToName.put(FilterType.N_WARM.ordinal(), "暖阳");
        sFilterTypeToName.put(FilterType.B_FAIRYTALE.ordinal(), "童话");
        sFilterTypeToName.put(FilterType.B_JAPANESE.ordinal(), "日系");
        sFilterTypeToName.put(FilterType.B_MINT.ordinal(), "薄荷");
        sFilterTypeToName.put(FilterType.B_MOOD.ordinal(), "心境");
        sFilterTypeToName.put(FilterType.B_NATURE.ordinal(), "自然");
        sFilterTypeToName.put(FilterType.B_PINK.ordinal(), "粉嫩");
        sFilterTypeToName.put(FilterType.B_ROMANCE.ordinal(), "浪漫");
        sFilterTypeToName.put(FilterType.B_MAZE.ordinal(), "迷宫");
        sFilterTypeToName.put(FilterType.B_WHITEANDBLACK.ordinal(), "黑白(人像)");
        sFilterTypeToName.put(FilterType.S_FILM.ordinal(), "胶片(录像)");
        sFilterTypeToName.put(FilterType.S_YEARS.ordinal(), "那些年");
        sFilterTypeToName.put(FilterType.S_POLAROID.ordinal(), "拍立得");
        sFilterTypeToName.put(FilterType.S_FOREST.ordinal(), "小森林");
        sFilterTypeToName.put(FilterType.S_BYGONE.ordinal(), "往事");
        sFilterTypeToName.put(FilterType.S_WHITEANDBLACK.ordinal(), "黑白(录像)");
        sFilterTypeToName.put(FilterType.N_WHITEANDBLACK.ordinal(), "黑白(拍照)");
    }

    private static String filterIdToName(int filterId) {
        if (FilterInfo.FILTER_ID_NONE == filterId) {
            return "none";
        }
        switch (FilterInfo.getCategory(filterId)) {
            case 1:
            case 2:
            case 3:
                String name = (String) sFilterTypeToName.get(FilterInfo.getIndex(filterId));
                if (name != null) {
                    return name;
                }
                break;
        }
        Log.e(TAG, "unexpected filter id: " + Integer.toHexString(filterId));
        return "none";
    }

    public static String modeIdToName(int modeId) {
        String name = (String) sCameraModeIdToName.get(modeId);
        if (name == null) {
            return "录像";
        }
        return name;
    }

    public static String cameraIdToName(boolean isFrontCamera) {
        return isFrontCamera ? "前摄" : "后摄";
    }

    private static String videoQualityToName(String quality) {
        String[] values = CameraAppImpl.getAndroidContext().getResources().getStringArray(R.array.pref_video_quality_entryvalues);
        int index = -1;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(quality)) {
                index = i;
                break;
            }
        }
        switch (index) {
            case 0:
                return "4k";
            case 1:
                return "1080p";
            case 2:
                return "720p";
            case 3:
                return "480p";
            default:
                Log.e(TAG, "unexpected video quality: " + quality);
                return "others";
        }
    }

    public static String faceBeautyRatioToName(int ratio) {
        if (ratio == 0) {
            return "0";
        }
        return divideTo10Section(ratio);
    }

    private static String burstShotNumToName(int num) {
        return divideTo10Section(num);
    }

    private static String divideTo10Section(int num) {
        switch (num > 0 ? (num - 1) / 10 : 0) {
            case 0:
                return "1+";
            case 1:
                return "10+";
            case 2:
                return "20+";
            case 3:
                return "30+";
            case 4:
                return "40+";
            case 5:
                return "50+";
            case 6:
                return "60+";
            case 7:
                return "70+";
            case 8:
                return "80+";
            default:
                return "90+";
        }
    }

    private static String autoExposureToName(String autoExposure) {
        if (autoExposure != null) {
            Resources res = CameraAppImpl.getAndroidContext().getResources();
            if (autoExposure.equals(res.getString(R.string.pref_camera_autoexposure_value_frameaverage))) {
                return "平均测光";
            }
            if (autoExposure.equals(res.getString(R.string.pref_camera_autoexposure_value_centerweighted))) {
                return "中心权重";
            }
            if (autoExposure.equals(res.getString(R.string.pref_camera_autoexposure_value_spotmetering))) {
                return "中点测光";
            }
        }
        Log.e(TAG, "unexpected auto exposure " + autoExposure);
        return "others";
    }

    private static String autoWhiteBalanceToName(String awb) {
        if (awb == null) {
            Log.e(TAG, "null awb");
            return "others";
        } else if (awb.equals("manual")) {
            return awb;
        } else {
            if (awb.equals("1")) {
                return "auto";
            }
            if (awb.equals("2")) {
                return "incandescent";
            }
            if (awb.equals("3")) {
                return "fluorescent";
            }
            if (awb.equals("5")) {
                return "daylight";
            }
            if (awb.equals("6")) {
                return "cloudy-daylight";
            }
            Log.e(TAG, "unexpected awb " + awb);
            return "others";
        }
    }

    private static String exposureTimeToName(String exposure) {
        if (exposure != null) {
            try {
                int exposureInt = (int) (Long.parseLong(exposure) / 1000);
                if (exposureInt < 1000000) {
                    String name = (String) sExposureTimeLessThan1sToName.get(exposureInt);
                    if (name != null) {
                        return name;
                    }
                }
                return (exposureInt / 1000000) + "s";
            } catch (NumberFormatException e) {
                Log.e(TAG, "invalid exposure time " + exposure);
            }
        }
        Log.e(TAG, "unexpected exposure time " + exposure);
        return "auto";
    }

    private static String isoToName(String iso) {
        if (iso != null) {
            if ("auto".equalsIgnoreCase(iso)) {
                return "auto";
            }
            if (iso.toUpperCase(Locale.ENGLISH).indexOf("ISO") > -1) {
                return iso.substring(3);
            }
        }
        return iso;
    }

    private static String focusPositionToName(int value) {
        if (1000 == value) {
            return "auto";
        }
        return divideTo10Section((1000 - value) / 10);
    }

    private static String triggerModeToName(int mode) {
        return (String) sTriggerModeIdToName.get(mode);
    }

    private static String getDualZoomName(int cameraMode) {
        if (!CameraSettings.isSupportedOpticalZoom()) {
            return "none";
        }
        switch (cameraMode) {
            case 163:
            case 165:
                return zoomRatioToName(CameraSettings.readZoom());
            case 166:
            case 167:
                return "tele".equals(CameraSettings.getCameraZoomMode(cameraMode)) ? "2x" : "1x";
            default:
                return "none";
        }
    }

    private static String zoomRatioToName(float zoomRatio) {
        if (1.0f == zoomRatio) {
            return "1x";
        }
        if (2.0f == zoomRatio) {
            return "2x";
        }
        return "others";
    }

    private static String contrastToName(String contrast) {
        return pictureQualityToName(R.array.pref_camera_contrast_entryvalues, contrast);
    }

    private static String saturationToName(String saturation) {
        return pictureQualityToName(R.array.pref_camera_saturation_entryvalues, saturation);
    }

    private static String sharpnessToName(String sharpness) {
        return pictureQualityToName(R.array.pref_camera_sharpness_entryvalues, sharpness);
    }

    private static String antiBandingToName(String antiBanding) {
        if (antiBanding == null) {
            Log.e(TAG, "null antiBanding");
            return "others";
        } else if (antiBanding.equals("0")) {
            return "off";
        } else {
            if (antiBanding.equals("1")) {
                return "50hz";
            }
            if (antiBanding.equals("2")) {
                return "60hz";
            }
            if (antiBanding.equals("3")) {
                return "auto";
            }
            Log.e(TAG, "unexpected antiBanding " + antiBanding);
            return "others";
        }
    }

    private static String pictureQualityToName(int arrayResId, String value) {
        String[] values = CameraAppImpl.getAndroidContext().getResources().getStringArray(arrayResId);
        if (sPictureQualityIndexToName.size() < values.length) {
            throw new RuntimeException("picture quality array size is smaller than values size " + value.length());
        }
        int index = indexOfString(values, value);
        if (index <= -1) {
            return "others";
        }
        return (String) sPictureQualityIndexToName.get(index + ((sPictureQualityIndexToName.size() - values.length) / 2));
    }

    private static int indexOfString(String[] list, String value) {
        if (!(list == null || value == null)) {
            for (int i = 0; i < list.length; i++) {
                if (value.equals(list[i])) {
                    return i;
                }
            }
        }
        return -1;
    }

    private static String flashModeToName(String flashMode) {
        if (flashMode == null) {
            Log.e(TAG, "null flash mode");
            return "others";
        } else if (flashMode.equals("3")) {
            return "auto";
        } else {
            if (flashMode.equals("1")) {
                return "on";
            }
            if (flashMode.equals("103")) {
                return "screen-light-auto";
            }
            if (flashMode.equals("101")) {
                return "screen-light-on";
            }
            if (flashMode.equals("2")) {
                return "torch";
            }
            if (flashMode.equals("0")) {
                return "off";
            }
            Log.e(TAG, "unexpected flash mode " + flashMode);
            return "others";
        }
    }

    private static String addCameraSuffix(String key) {
        if (key == null) {
            return key;
        }
        return key + "_" + (CameraSettings.isFrontCamera() ? "front" : "back");
    }

    public static void trackCameraError(String error) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", CameraSettings.isFrontCamera() ? "前摄" : "后摄");
        params.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        params.put("error", error);
        CameraStat.recordCountEvent("counter", "camera_hardware_error", params);
    }

    public static void trackZoomAdjusted(String mode) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", CameraSettings.isFrontCamera() ? "前摄" : "后摄");
        params.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        params.put("mode", mode);
        CameraStat.recordCountEvent("counter", "zoom_adjusted", params);
    }

    private static String timeLapseIntervalToName(int interval) {
        if (interval < 1000) {
            return String.format(Locale.ENGLISH, "%.2fs", new Object[]{Float.valueOf(((float) interval) / 1000.0f)});
        }
        return String.format(Locale.ENGLISH, "%ds", new Object[]{Integer.valueOf(interval / 1000)});
    }

    public static void track(String category, String key, String... keyValues) {
        boolean z = false;
        if (keyValues.length % 2 == 0) {
            z = true;
        }
        Util.Assert(z);
        Map<String, String> params = new HashMap();
        for (int i = 0; i < keyValues.length; i += 2) {
            params.put(keyValues[i], keyValues[i + 1]);
        }
        CameraStat.recordCountEvent(category, key, params);
    }

    public static void trackTakePictureCost(long timeInMs, boolean isFrontCamera, int moduleIndex) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", isFrontCamera ? "前摄" : "后摄");
        params.put("模式", modeIdToName(moduleIndex));
        CameraStat.recordCalculateEvent("capture", "take_picture_cost", round(timeInMs, 50), params);
    }

    private static long round(long value, int base) {
        if (base <= 0) {
            return value;
        }
        return ((((long) (base / 2)) + value) / ((long) base)) * ((long) base);
    }

    public static void trackStartAppCost(long timeInMs) {
        if (timeInMs < 0 || timeInMs > 10000) {
            throw new IllegalArgumentException("The time cost when start app is illegal: " + timeInMs);
        }
        CameraStat.recordCalculateEvent("capture", "start_app_cost", round(timeInMs, 50));
    }

    public static void trackGeneralInfo(int takenNum, boolean isBurst, int moduleIndex, int triggerMode, boolean isFrontCamera, MutexModeManager mutexModeManager, String flashAutoModeState) {
        DataItemRunning dataRunning = DataRepository.dataItemRunning();
        DataItemConfig dataConfig = DataRepository.dataItemConfig();
        Map<String, String> params = new HashMap();
        int cameraMode = moduleIndex;
        params.put("模式", modeIdToName(moduleIndex));
        String str = "合影优选";
        Object obj = (isBurst || !CameraSettings.isGroupShotOn()) ? "off" : "on";
        params.put(str, obj);
        params.put("触发方式", triggerModeToName(triggerMode));
        String timerValue = "0";
        if (!isBurst) {
            ComponentRunningTimer timerConfig = dataRunning.getComponentRunningTimer();
            if (timerConfig != null) {
                timerValue = timerConfig.getComponentValue(moduleIndex);
            }
        }
        params.put("倒计时", timerValue);
        String flashMode = "0";
        ComponentConfigFlash configFlash = dataConfig.getComponentFlash();
        if (configFlash != null) {
            flashMode = configFlash.getComponentValue(moduleIndex);
            if (isBurst && ("2".equals(flashMode) ^ 1) != 0) {
                flashMode = "0";
            }
        }
        if (flashAutoModeState != null) {
            params.put("闪光灯", flashAutoModeState);
        } else {
            params.put("闪光灯", flashModeToName(flashMode));
        }
        params.put("滤镜", isBurst ? "none" : filterIdToName(EffectController.getInstance().getEffect(false)));
        if (isFrontCamera) {
            params.put("年龄检测", CameraSettings.showGenderAge() ? "on" : "off");
            params.put("魔镜", CameraSettings.isMagicMirrorOn() ? "on" : "off");
            CameraStat.recordCalculateEvent("capture", "front_camera_info", (long) takenNum, params);
            return;
        }
        str = "移轴";
        if (isBurst || !CameraSettings.isTiltShiftOn()) {
            obj = "off";
        } else {
            obj = dataRunning.getComponentRunningTiltValue().getComponentValue(moduleIndex);
        }
        params.put(str, obj);
        str = "水平仪";
        obj = (isBurst || !CameraSettings.isGradienterOn()) ? "off" : "on";
        params.put(str, obj);
        str = "HHT";
        obj = (isBurst || mutexModeManager == null || !mutexModeManager.isHandNight()) ? "off" : "on";
        params.put(str, obj);
        String hdrValue = "off";
        if (!(isBurst || mutexModeManager == null)) {
            boolean hdrOn = mutexModeManager.isHdr();
            ComponentConfigHdr hdrConfig = dataConfig.getComponentHdr();
            if (hdrConfig != null && "auto".equals(hdrConfig.getComponentValue(moduleIndex))) {
                hdrValue = hdrOn ? "auto-on" : "auto-off";
            } else if (hdrOn) {
                hdrValue = "on";
            }
        }
        params.put("HDR", hdrValue);
        str = "超分辨率";
        obj = (isBurst || mutexModeManager == null || !mutexModeManager.isSuperResolution()) ? "off" : "on";
        params.put(str, obj);
        params.put("变焦", getDualZoomName(moduleIndex));
        CameraStat.recordCalculateEvent("capture", "back_camera_info", (long) takenNum, params);
    }

    public static void trackPictureTaken(int takenNum, boolean burst, int moduleIndex, boolean isFrontCamera, boolean location) {
        Map<String, String> params = new HashMap();
        boolean frontCamera = isFrontCamera;
        params.put("前后摄", isFrontCamera ? "前摄" : "后摄");
        int cameraMode = moduleIndex;
        params.put("画幅", 165 == moduleIndex ? "1x1" : CameraSettings.getPictureSize("4x3"));
        params.put("画质", CameraSettings.getJpegQuality(burst));
        params.put("时间水印", CameraSettings.isTimeWaterMarkOpen() ? "on" : "off");
        params.put("双摄水印", CameraSettings.isDualCameraWaterMarkOpen() ? "on" : "off");
        String str = "地理位置";
        Object obj = location ? "有" : CameraSettings.isRecordLocation() ? "无" : "关";
        params.put(str, obj);
        CameraStat.recordCalculateEvent("capture", "picture_taken", (long) takenNum, params);
        if (burst) {
            if (CameraSettings.isPressDownCapture() && takenNum > 1) {
                takenNum--;
            }
            Map<String, String> params2 = new HashMap();
            params2.put("张数", burstShotNumToName(takenNum));
            CameraStat.recordCalculateEvent("capture", "picture_taken_burst", (long) takenNum, params2);
            CameraStat.recordCountEvent("capture", "burst_shot_times", params2);
        }
    }

    public static void trackGotoSettings(int moduleIndex) {
        Map<String, String> params = new HashMap();
        params.put("模式", modeIdToName(moduleIndex));
        CameraStat.recordCountEvent("counter", "goto_settings", params);
    }

    public static void trackGotoGallery(int moduleIndex) {
        Map<String, String> params = new HashMap();
        params.put("模式", modeIdToName(moduleIndex));
        CameraStat.recordCountEvent("counter", "goto_gallery", params);
    }

    public static void trackOpenCameraFail(int cameraId, String reason) {
        Map<String, String> params = new HashMap(2);
        params.put("前后摄", "" + cameraId);
        params.put("reason", reason);
        CameraStat.recordCountEvent("counter", "open_camera_fail", params);
    }

    public static void trackVideoSnapshot(boolean isFrontCamera) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", isFrontCamera ? "前摄" : "后摄");
        CameraStat.recordCountEvent("capture", "video_snapshot", params);
    }

    public static void trackPauseVideoRecording(boolean isFrontCamera) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", isFrontCamera ? "前摄" : "后摄");
        CameraStat.recordCountEvent("capture", "video_pause_recording", params);
    }

    public static void trackVideoRecording(boolean isFrontCamera, String videoMode, int videoQuality, int flashMode, int lapseCaptureTime) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", isFrontCamera ? "前摄" : "后摄");
        params.put("模式", videoMode);
        params.put("画质", videoQualityToName("" + videoQuality));
        params.put("闪光灯", flashMode == 2 ? "torch" : "off");
        CameraStat.recordCountEvent("capture", "video_taken", params);
        if (lapseCaptureTime > 0 && "fast".equals(videoMode)) {
            Map<String, String> params2 = new HashMap();
            params2.put("间隔", timeLapseIntervalToName(lapseCaptureTime));
            CameraStat.recordCountEvent("capture", "video_time_lapse_interval", params2);
        }
    }

    public static void trackEvAdjusted() {
        Map<String, String> params = new HashMap(2);
        params.put("前后摄", CameraSettings.isFrontCamera() ? "前摄" : "后摄");
        params.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent("counter", "ev_adjusted", params);
    }

    public static void trackPocketModeEnter(String event) {
        track("counter", "pocket_mode_enter", "方式", event);
    }

    public static void trackPocketModeExit(String event) {
        track("counter", "pocket_mode_keyguard_exit", "方式", event);
    }

    public static void trackPocketModeSensorDelay() {
        CameraStat.recordCountEvent("counter", "pocket_mode_sensor_delay");
    }

    public static void trackDualZoomChanged(int cameraMode, String zoom) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(cameraMode));
            params.put("变焦", zoom);
            CameraStat.recordCountEvent("counter", "dual_zoom_changed", params);
        }
    }

    public static void trackFilterChanged(int moduleIndex, int filterId, boolean fromClick) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(moduleIndex));
            params.put("滤镜", filterIdToName(filterId));
            params.put("方式", fromClick ? "点击" : "滑动");
            CameraStat.recordCountEvent("counter", "filter_changed", params);
        }
    }

    public static void trackFlashChanged(int cameraMode, String flash) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(cameraMode));
            params.put("闪光灯", flash);
            CameraStat.recordCountEvent("counter", "flash_changed", params);
        }
    }

    public static void trackHdrChanged(int cameraMode, String hdr) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(cameraMode));
            params.put("HDR", hdr);
            CameraStat.recordCountEvent("counter", "hdr_changed", params);
        }
    }

    public static void trackBokehChanged(int cameraMode, String bokeh) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(cameraMode));
            params.put("BOKEH", bokeh);
            CameraStat.recordCountEvent("counter", "bokeh_changed", params);
        }
    }

    public static void trackConfigChange(String event, String param, boolean on, boolean trackCameraMode, boolean trackCameraId) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            if (trackCameraMode) {
                params.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            }
            if (trackCameraId) {
                params.put("前后摄", CameraSettings.isFrontCamera() ? "前摄" : "后摄");
            }
            params.put(param, on ? "on" : "off");
            CameraStat.recordCountEvent("counter", event, params);
        }
    }

    public static void trackDualWaterMarkChanged(boolean on) {
        CameraStat.recordStringPropertyEvent("settings", "pref_dualcamera_watermark", on ? "on" : "off");
    }

    public static void trackVideoModeChanged(String videoMode) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", videoMode);
            CameraStat.recordCountEvent("counter", "video_mode_changed", params);
        }
    }

    public static void trackVideoModeRecorded(String videoMode, int quality, int hsr, long time) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", videoMode);
            params.put("画质", videoQualityToName(String.valueOf(quality)));
            params.put("帧率", String.valueOf(hsr));
            params.put("时长", String.valueOf(time));
            CameraStat.recordCountEvent("counter", "video_taken", params);
        }
    }

    public static void trackTimerChanged(String value) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            params.put("前后摄", CameraSettings.isFrontCamera() ? "前摄" : "后摄");
            params.put("倒计时", value);
            CameraStat.recordCountEvent("counter", "timer_changed", params);
        }
    }

    public static void trackTiltShiftChanged(String value) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            params.put("移轴", value);
            CameraStat.recordCountEvent("counter", "tiltshift_changed", params);
        }
    }

    public static void trackAISceneChanged(int cameraMode, int scene, Resources resource) {
        if (!CameraStat.isCounterEventDisabled()) {
            String sceneNameStr = "未知";
            TypedArray sceneNames = resource.obtainTypedArray(R.array.ai_scene_names);
            if (scene >= 0 && scene < sceneNames.length()) {
                sceneNameStr = sceneNames.getString(scene);
            }
            sceneNames.recycle();
            Map<String, String> params = new HashMap();
            params.put("模式", modeIdToName(cameraMode));
            params.put("智能场景发现", sceneNameStr);
            CameraStat.recordCountEvent("counter", "ai_scene_changed", params);
        }
    }

    public static void trackFocusPositionChanged(int focusPosition) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("对焦", focusPositionToName(focusPosition));
            CameraStat.recordCountEvent("counter", "manual_focus_position_changed", params);
        }
    }

    public static void trackDirectionChanged(int direction) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("方向", 4 == direction ? "从左往右" : "从右往左");
            CameraStat.recordCountEvent("counter", "panorama_direction_changed", params);
        }
    }

    public static void trackAwbChanged(String awb) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("白平衡", autoWhiteBalanceToName(awb));
            CameraStat.recordCountEvent("counter", "manual_awb_changed", params);
        }
    }

    public static void trackExposureTimeChanged(String exposureTime) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("快门", exposureTimeToName(exposureTime));
            CameraStat.recordCountEvent("counter", "manual_exposure_time_changed", params);
        }
    }

    public static void trackIsoChanged(String iso) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("感光度", isoToName(iso));
            CameraStat.recordCountEvent("counter", "manual_iso_changed", params);
        }
    }

    public static void trackLensChanged(String lens) {
        if (!CameraStat.isCounterEventDisabled()) {
            Map<String, String> params = new HashMap();
            params.put("镜头", lens);
            CameraStat.recordCountEvent("counter", "manual_lens_changed", params);
        }
    }

    public static void trackPictureTakenInPanorama(int takenNum) {
        Map<String, String> params = new HashMap();
        params.put("方向", 4 == CameraSettings.getPanoramaMoveDirection() ? "从左往右" : "从右往左");
        CameraStat.recordCalculateEvent("capture", "picture_taken_panorama", (long) takenNum, params);
    }

    public static void trackPictureTakenInManual(int takenNum, String whiteBalance, String exposureTime, String iso, int module) {
        Map<String, String> params = new HashMap();
        params.put("白平衡", autoWhiteBalanceToName(whiteBalance));
        params.put("对焦", focusPositionToName(CameraSettings.getFocusPosition()));
        params.put("快门", exposureTimeToName(exposureTime));
        params.put("感光度", isoToName(iso));
        params.put("镜头", CameraSettings.getCameraZoomMode(module));
        params.put("峰值对焦", EffectController.getInstance().isNeedDrawPeaking() ? "on" : "off");
        CameraStat.recordCalculateEvent("capture", "picture_taken_manual", (long) takenNum, params);
    }

    public static void trackBeautyInfo(int takenNum, String cameraId, BeautyValues beautyValues) {
        Map<String, String> params = new HashMap();
        params.put("前后摄", cameraId);
        if (Device.isSupportNewFaceBeauty()) {
            for (Type type : BeautyParameters.getInstance().getAdjustableTypes()) {
                String name = (String) sBeautyTypeToName.get(type.ordinal());
                if (name != null) {
                    params.put(name, faceBeautyRatioToName(beautyValues.get(type)));
                }
            }
        } else {
            params.put("瘦脸", faceBeautyRatioToName(beautyValues.mBeautySlimFace));
            params.put("大眼", faceBeautyRatioToName(beautyValues.mBeautyEnlargeEye));
            params.put("美白", faceBeautyRatioToName(beautyValues.mBeautySkinColor));
            params.put("嫩肤", faceBeautyRatioToName(beautyValues.mBeautySkinSmooth));
        }
        if (Device.isLegacyFaceBeauty()) {
            Object obj;
            String str = "等级";
            if (CameraSettings.isAdvancedBeautyOn()) {
                obj = "advanced";
            } else {
                obj = String.valueOf(CameraSettings.intelligentValueToBeautyLevel(beautyValues.mBeautyLevel));
            }
            params.put(str, obj);
            CameraStat.recordCalculateEvent("capture", "picture_taken_beauty_legacy", (long) takenNum, params);
            return;
        }
        params.put("等级", String.valueOf(CameraSettings.intelligentValueToBeautyLevel(beautyValues.mBeautyLevel)));
        CameraStat.recordCalculateEvent("capture", "picture_taken_beauty", (long) takenNum, params);
    }

    public static void trackVoiceControl(Intent intent) {
        if (intent != null) {
            Map<String, String> map = new HashMap();
            boolean useFrontCamera = false;
            try {
                useFrontCamera = CameraIntentManager.getInstance(intent).isUseFrontCamera();
            } catch (Exception e) {
            }
            int facing = useFrontCamera ? 1 : 0;
            int moduleId = CameraIntentManager.getInstance(intent).getCameraModeId();
            map.put("前后摄", facing == 0 ? "后摄" : "前摄");
            map.put("模式", modeIdToName(moduleId));
            CameraStat.recordCountEvent("counter", "voice_assist_call_event", map);
        }
    }

    public static void trackSnapInfo(boolean isVideo) {
        Map<String, String> params = new HashMap();
        params.put("mode", isVideo ? "video" : "photo");
        CameraStat.recordCountEvent("capture", "snap_camera", params);
    }

    public static void trackPreferenceChange(String key, Object value) {
        if (key != null) {
            String newValue = value instanceof Boolean ? ((Boolean) value).booleanValue() ? "on" : "off" : String.valueOf(value);
            if (key.equals("pref_video_quality_key")) {
                key = addCameraSuffix(key);
                newValue = videoQualityToName(newValue);
            } else if (key.equals("pref_video_time_lapse_frame_interval_key")) {
                try {
                    newValue = timeLapseIntervalToName(Integer.parseInt(newValue));
                } catch (NumberFormatException e) {
                    Log.e(TAG, "invalid interval " + newValue);
                }
            } else if (key.equals("pref_camera_jpegquality_key")) {
                key = addCameraSuffix(key);
            } else if (key.equals("pref_camera_picturesize_key")) {
                key = addCameraSuffix(key);
            } else if (key.equals("pref_video_hfr_key")) {
                key = addCameraSuffix(key);
            } else if (key.equals("pref_camera_autoexposure_key")) {
                newValue = autoExposureToName(newValue);
            } else if (key.equals("pref_qc_camera_contrast_key")) {
                newValue = contrastToName(newValue);
            } else if (key.equals("pref_qc_camera_saturation_key")) {
                newValue = saturationToName(newValue);
            } else if (key.equals("pref_qc_camera_sharpness_key")) {
                newValue = sharpnessToName(newValue);
            } else if (key.equals("pref_camera_antibanding_key")) {
                newValue = antiBandingToName(newValue);
            }
            CameraStat.recordStringPropertyEvent("settings", key, newValue);
        }
    }
}
