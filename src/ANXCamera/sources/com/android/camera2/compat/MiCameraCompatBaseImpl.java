package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import com.android.camera.Device;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.effect.BeautyValues;
import java.util.HashMap;
import java.util.HashSet;

@TargetApi(21)
public class MiCameraCompatBaseImpl {
    public static final Key<Integer> BEAUTY_CHIN = new Key("xiaomi.beauty.chinRatio", Integer.class);
    public static final Key<Integer> BEAUTY_ENLARGE_EYE = new Key("xiaomi.beauty.enlargeEyeRatio", Integer.class);
    public static final Key<String> BEAUTY_LEVEL = new Key("xiaomi.beauty.beautyLevelApplied", String.class);
    public static final Key<Integer> BEAUTY_LIPS = new Key("xiaomi.beauty.lipsRatio", Integer.class);
    public static final Key<Integer> BEAUTY_NECK = new Key("xiaomi.beauty.neckRatio", Integer.class);
    public static final Key<Integer> BEAUTY_NOSE = new Key("xiaomi.beauty.noseRatio", Integer.class);
    public static final Key<Integer> BEAUTY_RISORIUS = new Key("xiaomi.beauty.risoriusRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SKIN_COLOR = new Key("xiaomi.beauty.skinColorRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SKIN_SMOOTH = new Key("xiaomi.beauty.skinSmoothRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SLIM_FACE = new Key("xiaomi.beauty.slimFaceRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SLIM_NOSE = new Key("xiaomi.beauty.slimNoseRatio", Integer.class);
    public static final Key<Integer> BEAUTY_SMILE = new Key("xiaomi.beauty.smileRatio", Integer.class);
    private static final HashMap<Type, Key<Integer>> BEAUTY_TYPE_MAP = new HashMap();
    public static final Key<Integer> BURST_CAPTURE_HINT = new Key("xiaomi.burst.captureHint", Integer.class);
    public static final Key<Integer> BURST_SHOOT_FPS = new Key("xiaomi.burst.shootFPS", Integer.class);
    public static final Key<Integer> DEVICE_ORIENTATION = new Key("xiaomi.device.orientation", Integer.class);
    public static final Key<Boolean> FACE_AGE_ANALYZE_ENABLED = new Key("xiaomi.faceGenderAndAge.enabled", Boolean.class);
    public static final Key<Boolean> FACE_SCORE_ENABLED = new Key("xiaomi.faceScore.enabled", Boolean.class);
    public static final Key<Boolean> FRONT_MIRROR = new Key("xiaomi.flip.enabled", Boolean.class);
    public static final Key<Boolean> HDR_CHECKER_ENABLE = new Key("xiaomi.hdr.hdrChecker.enabled", Boolean.class);
    public static final Key<Boolean> HDR_ENABLED = new Key("xiaomi.hdr.enabled", Boolean.class);
    public static final Key<Boolean> HHT_ENABLED = new Key("xiaomi.hht.enabled", Boolean.class);
    public static final Key<Boolean> LENS_DIRTY_DETECT = new Key("xiaomi.ai.add.enabled", Boolean.class);
    public static final Key<Boolean> MFNR_BOKEH = new Key("xiaomi.bokeh.enabled", Boolean.class);
    public static final Key<Boolean> MFNR_ENABLED = new Key("xiaomi.mfnr.enabled", Boolean.class);
    public static final Key<Boolean> PARALLEL_ENABLED = new Key("xiaomi.parallel.enabled", Boolean.class);
    public static final Key<byte[]> PARALLEL_PATH = new Key("xiaomi.parallel.path", byte[].class);
    public static final Key<Boolean> SNAP_SHOT_TORCH = new Key("xiaomi.snapshotTorch.enabled", Boolean.class);
    public static final Key<Boolean> ST_FAST_ZOOM_IN = new Key("xiaomi.smoothTransition.fastZoomIn", Boolean.class);
    public static final Key<Boolean> SUPER_RESOLUTION_ENABLED = new Key("xiaomi.superResolution.enabled", Boolean.class);
    public static final Key<String> WATERMARK_APPLIEDTYPE = new Key("xiaomi.watermark.typeApplied", String.class);
    public static final Key<String> WATERMARK_AVAILABLETYPE = new Key("xiaomi.watermark.availableType", String.class);
    public static final Key<String> WATERMARK_FACE = new Key("xiaomi.watermark.face", String.class);
    public static final Key<String> WATERMARK_TIME = new Key("xiaomi.watermark.time", String.class);

    static {
        BEAUTY_TYPE_MAP.put(Type.WHITEN_STRENGTH, BEAUTY_SKIN_COLOR);
        BEAUTY_TYPE_MAP.put(Type.SHRINK_FACE_RATIO, BEAUTY_SLIM_FACE);
        BEAUTY_TYPE_MAP.put(Type.ENLARGE_EYE_RATIO, BEAUTY_ENLARGE_EYE);
        BEAUTY_TYPE_MAP.put(Type.SMOOTH_STRENGTH, BEAUTY_SKIN_SMOOTH);
        BEAUTY_TYPE_MAP.put(Type.NOSE_RATIO, BEAUTY_NOSE);
        BEAUTY_TYPE_MAP.put(Type.RISORIUS_RATIO, BEAUTY_RISORIUS);
        BEAUTY_TYPE_MAP.put(Type.LIPS_RATIO, BEAUTY_LIPS);
        BEAUTY_TYPE_MAP.put(Type.CHIN_RATIO, BEAUTY_CHIN);
        BEAUTY_TYPE_MAP.put(Type.NECK_RATIO, BEAUTY_NECK);
        BEAUTY_TYPE_MAP.put(Type.SMILE_RATIO, BEAUTY_SMILE);
        BEAUTY_TYPE_MAP.put(Type.SLIM_NOSE_RATIO, BEAUTY_SLIM_NOSE);
    }

    public void applyISO(Builder request, int iso) {
        request.set(CaptureRequest.SENSOR_SENSITIVITY, Integer.valueOf(iso));
    }

    public void applyExposureTime(Builder request, long exposureTime) {
        if (exposureTime > 0) {
            request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(0));
            request.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(0));
            request.set(CaptureRequest.SENSOR_EXPOSURE_TIME, Long.valueOf(exposureTime));
            return;
        }
        request.set(CaptureRequest.CONTROL_AE_MODE, (Integer) request.get(CaptureRequest.CONTROL_AE_MODE));
        request.set(CaptureRequest.CONTROL_MODE, (Integer) request.get(CaptureRequest.CONTROL_MODE));
    }

    public void applyCustomWB(Builder request, int awbValue) {
        throw new RuntimeException("unSupported CustomWb");
    }

    public void applyContrast(Builder request, int value) {
        throw new RuntimeException("unSupported Contrast");
    }

    public void applySaturation(Builder request, int level) {
        throw new RuntimeException("unSupported Saturation");
    }

    public void applySharpness(Builder request, int level) {
        throw new RuntimeException("unSupported Sharpness");
    }

    public void applyExposureMeteringMode(Builder request, int mode) {
        throw new RuntimeException("unSupported ExposureMeteringMode");
    }

    public void applyVideoStreamState(Builder request, boolean start) {
    }

    public void applyASDEnable(Builder request, boolean enable) {
        throw new RuntimeException("unSupported action");
    }

    public void applyAiScenePeriod(Builder request, int period) {
        throw new RuntimeException("unSupported action");
    }

    public void applyHHT(Builder request, boolean enable) {
        request.set(HHT_ENABLED, Boolean.valueOf(enable));
    }

    public void applyHDR(Builder request, boolean enable) {
        request.set(HDR_ENABLED, Boolean.valueOf(enable));
    }

    public void applyHDRCheckerEnable(Builder request, boolean enable) {
        request.set(HDR_CHECKER_ENABLE, Boolean.valueOf(enable));
    }

    public void applyParallelProcessPath(Builder request, String path) {
        request.set(PARALLEL_PATH, path.getBytes());
    }

    public void applyParallelProcessEnable(Builder request, boolean enable) {
        request.set(PARALLEL_ENABLED, Boolean.valueOf(enable));
    }

    public void applySuperResolution(Builder request, boolean enable) {
        request.set(SUPER_RESOLUTION_ENABLED, Boolean.valueOf(enable));
    }

    public void applyWaterMarkAppliedList(Builder request, String applied) {
        request.set(WATERMARK_APPLIEDTYPE, applied);
    }

    public void applyTimeWaterMark(Builder request, String applied) {
        request.set(WATERMARK_TIME, applied);
    }

    public void applyFaceWaterMark(Builder request, String applied) {
        request.set(WATERMARK_FACE, applied);
    }

    public void applyMfnr(Builder request, boolean enable) {
        request.set(MFNR_ENABLED, Boolean.valueOf(enable));
    }

    public void applyBokeh(Builder request, boolean enable) {
        request.set(MFNR_BOKEH, Boolean.valueOf(enable));
    }

    public void applyStFastZoomIn(Builder request, boolean enable) {
        request.set(ST_FAST_ZOOM_IN, Boolean.valueOf(enable));
    }

    public void applyFaceAnalyzeAge(Builder request, boolean enable) {
        request.set(FACE_AGE_ANALYZE_ENABLED, Boolean.valueOf(enable));
    }

    public void applyFaceScore(Builder request, boolean enable) {
        request.set(FACE_SCORE_ENABLED, Boolean.valueOf(enable));
    }

    public void applyDeviceOrientation(Builder request, int orientation) {
        request.set(DEVICE_ORIENTATION, Integer.valueOf(orientation));
    }

    public void applyBeautyParameter(Builder request, BeautyValues beautyValues) {
        request.set(BEAUTY_LEVEL, beautyValues.mBeautyLevel);
        if (Device.isSupportNewFaceBeauty()) {
            for (Type type : BeautyParameters.getInstance().getAdjustableTypes()) {
                if (BEAUTY_TYPE_MAP.containsKey(type)) {
                    request.set((Key) BEAUTY_TYPE_MAP.get(type), Integer.valueOf(beautyValues.get(type)));
                }
            }
            return;
        }
        request.set(BEAUTY_SKIN_COLOR, Integer.valueOf(beautyValues.mBeautySkinColor));
        request.set(BEAUTY_SLIM_FACE, Integer.valueOf(beautyValues.mBeautySlimFace));
        request.set(BEAUTY_SKIN_SMOOTH, Integer.valueOf(beautyValues.mBeautySkinSmooth));
        request.set(BEAUTY_ENLARGE_EYE, Integer.valueOf(beautyValues.mBeautyEnlargeEye));
    }

    public void applySnapshotTorch(Builder request, boolean enable) {
        request.set(SNAP_SHOT_TORCH, Boolean.valueOf(enable));
    }

    public void applyFrontMirror(Builder request, boolean enable) {
        request.set(FRONT_MIRROR, Boolean.valueOf(enable));
    }

    public void applyBurstHint(Builder request, int hint) {
        request.set(BURST_CAPTURE_HINT, Integer.valueOf(hint));
    }

    public void applyBurstFps(Builder request, int fps) {
        request.set(BURST_SHOOT_FPS, Integer.valueOf(fps));
    }

    public void applyIsHfrPreview(Builder request, boolean isPreview) {
    }

    public void applyLensDirtyDetect(Builder request, boolean enable) {
        request.set(LENS_DIRTY_DETECT, Boolean.valueOf(enable));
    }

    public boolean supportContrast(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportLensDirtyDetect(HashSet<String> supportedVendorKeys) {
        return supportedVendorKeys.contains(LENS_DIRTY_DETECT.getName());
    }

    public boolean supportBeautyType(HashSet<String> supportedVendorKeys, Type type) {
        if (BEAUTY_TYPE_MAP.containsKey(type)) {
            return supportedVendorKeys.contains(((Key) BEAUTY_TYPE_MAP.get(type)).getName());
        }
        return false;
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return false;
    }
}
