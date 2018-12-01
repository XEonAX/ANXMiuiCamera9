package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import com.android.camera.constant.MiCameraCharacteristics;
import com.android.camera.log.Log;
import java.util.HashSet;

@TargetApi(21)
class MiCameraCompatQcomImpl extends MiCameraCompatBaseImpl {
    private static final Key<Boolean> AI_SCENE = new Key("xiaomi.ai.asd.enabled", Boolean.class);
    private static final Key<String> AI_SCENE_APPLY = new Key("xiaomi.ai.asd.sceneApplied", String.class);
    private static final Key<int[]> AI_SCENE_AVAILABLE_MODES = new Key("xiaomi.ai.asd.availableSceneMode", int[].class);
    private static final Key<Integer> AI_SCENE_PERIOD = new Key("xiaomi.ai.asd.period", Integer.class);
    private static final Key<Integer> CONTRAST_LEVEL = new Key("org.codeaurora.qcamera3.contrast.level", Integer.class);
    private static final Key<Integer> EXPOSURE_METERING = new Key("org.codeaurora.qcamera3.exposure_metering.exposure_metering_mode", Integer.class);
    private static final Key<Long> ISO_EXP = new Key("org.codeaurora.qcamera3.iso_exp_priority.use_iso_exp_priority", Long.class);
    private static final Key<Byte> IS_HFR_PREVIEW = new Key("xiaomi.hfrPreview.isHFRPreview", Byte.TYPE);
    private static final Key<Byte> RECORDING_END_STREAM = new Key("org.quic.camera.recording.endOfStream", Byte.TYPE);
    private static final Key<Integer> SATURATION = new Key("org.codeaurora.qcamera3.saturation.use_saturation", Integer.class);
    private static final Key<Integer> SELECT_PRIORITY = new Key("org.codeaurora.qcamera3.iso_exp_priority.select_priority", Integer.class);
    private static final Key<Integer> SHARPNESS_CONTROL = new Key("org.codeaurora.qcamera3.sharpness.strength", Integer.class);
    private static final Key<Integer> USE_CUSTOM_WB = new Key("com.qti.stats.awbwrapper.AWBCCT", Integer.class);
    private static final Key<Integer> USE_ISO_VALUE = new Key("org.codeaurora.qcamera3.iso_exp_priority.use_iso_value", Integer.class);

    MiCameraCompatQcomImpl() {
    }

    public void applyISO(Builder request, int iso) {
        request.set(SELECT_PRIORITY, Integer.valueOf(0));
        switch (iso) {
            case 0:
                request.set(ISO_EXP, Long.valueOf(0));
                return;
            case 100:
                request.set(ISO_EXP, Long.valueOf(2));
                return;
            case 200:
                request.set(ISO_EXP, Long.valueOf(3));
                return;
            case 400:
                request.set(ISO_EXP, Long.valueOf(4));
                return;
            case 800:
                request.set(ISO_EXP, Long.valueOf(5));
                return;
            case 1600:
                request.set(ISO_EXP, Long.valueOf(6));
                return;
            case 3200:
                request.set(ISO_EXP, Long.valueOf(7));
                return;
            default:
                throw new RuntimeException("unknown iso value");
        }
    }

    public void applyExposureTime(Builder request, long exposureTime) {
        if (0 == ((Long) request.get(ISO_EXP)).longValue() && exposureTime > 0) {
            request.set(SELECT_PRIORITY, Integer.valueOf(1));
        }
        super.applyExposureTime(request, exposureTime);
    }

    public void applyCustomWB(Builder request, int awbValue) {
        request.set(USE_CUSTOM_WB, Integer.valueOf(awbValue));
    }

    public void applyContrast(Builder request, int value) {
        request.set(CONTRAST_LEVEL, Integer.valueOf(value + 1));
    }

    public void applySaturation(Builder request, int level) {
        int result = 0;
        switch (level) {
            case 0:
                result = 0;
                break;
            case 1:
                result = 2;
                break;
            case 2:
                result = 4;
                break;
            case 3:
                result = 5;
                break;
            case 4:
                result = 6;
                break;
            case 5:
                result = 8;
                break;
            case 6:
                result = 10;
                break;
        }
        request.set(SATURATION, Integer.valueOf(result));
    }

    public void applySharpness(Builder request, int level) {
        int result = 0;
        switch (level) {
            case 0:
                result = 0;
                break;
            case 1:
                result = 1;
                break;
            case 2:
                result = 2;
                break;
            case 3:
                result = 3;
                break;
            case 4:
                result = 4;
                break;
            case 5:
                result = 5;
                break;
            case 6:
                result = 6;
                break;
        }
        request.set(SHARPNESS_CONTROL, Integer.valueOf(result));
    }

    public void applyExposureMeteringMode(Builder request, int mode) {
        request.set(EXPOSURE_METERING, Integer.valueOf(mode));
    }

    public void applyVideoStreamState(Builder request, boolean start) {
        Log.d("MiCameraCompat", "recordingEndOfStream: " + (start ? "0x0" : "0x1"));
        request.set(RECORDING_END_STREAM, Byte.valueOf(start ? (byte) 0 : (byte) 1));
    }

    public void applyASDEnable(Builder request, boolean enable) {
        request.set(AI_SCENE, Boolean.valueOf(enable));
    }

    public void applyAiScenePeriod(Builder request, int period) {
        request.set(AI_SCENE_PERIOD, Integer.valueOf(period));
    }

    public void applyIsHfrPreview(Builder request, boolean isPreview) {
        request.set(IS_HFR_PREVIEW, Byte.valueOf(isPreview ? (byte) 1 : (byte) 0));
    }

    public boolean supportContrast(HashSet<String> supportedVendorKeys) {
        return supportedVendorKeys.contains(CONTRAST_LEVEL.getName());
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> supportedVendorKeys) {
        if (supportedVendorKeys == null || !supportedVendorKeys.contains(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS.getName())) {
            return false;
        }
        return supportedVendorKeys.contains(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_NUMBER.getName());
    }
}
