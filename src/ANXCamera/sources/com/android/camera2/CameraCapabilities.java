package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.params.HighSpeedVideoConfiguration;
import android.hardware.camera2.params.ReprocessFormatsMap;
import android.hardware.camera2.params.StreamConfiguration;
import android.hardware.camera2.params.StreamConfigurationDuration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import android.util.SizeF;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.constant.MiCameraCharacteristics;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.log.Log;
import com.android.camera2.compat.MiCameraCompat;
import com.android.camera2.compat.MiCameraCompatBaseImpl;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@TargetApi(21)
public class CameraCapabilities {
    private static final Key<Rect> QCFA_ACTIVE_ARRAY_SIZE = new Key("org.codeaurora.qcamera3.quadra_cfa.activeArraySize", Rect.class);
    private static final Key<StreamConfiguration[]> QCFA_STREAM_CONFIGURATIONS = new Key("org.codeaurora.qcamera3.quadra_cfa.availableStreamConfigurations", StreamConfiguration[].class);
    private static final String TAG = CameraCapabilities.class.getSimpleName();
    private final HashSet<String> mCaptureRequestVendorKeys;
    private final CameraCharacteristics mCharacteristics;
    private StreamConfigurationMap mStreamConfigurationMap;

    public CameraCapabilities(CameraCharacteristics p) {
        if (p == null) {
            throw new IllegalArgumentException("Null CameraCharacteristics");
        }
        this.mCharacteristics = p;
        if (((Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue() == 2) {
            this.mCaptureRequestVendorKeys = new HashSet();
            return;
        }
        List<CaptureRequest.Key> vendorKeys = this.mCharacteristics.getNativeCopy().getAllVendorKeys(CaptureRequest.Key.class);
        this.mCaptureRequestVendorKeys = new HashSet(vendorKeys.size());
        for (CaptureRequest.Key key : vendorKeys) {
            this.mCaptureRequestVendorKeys.add(key.getName());
        }
    }

    public int getFacing() {
        Integer facing = (Integer) this.mCharacteristics.get(CameraCharacteristics.LENS_FACING);
        return facing != null ? facing.intValue() : 1;
    }

    public int getSensorOrientation() {
        Integer orientation = (Integer) this.mCharacteristics.get(CameraCharacteristics.SENSOR_ORIENTATION);
        return orientation != null ? orientation.intValue() : 0;
    }

    public Rect getActiveArraySize() {
        if (isSupportedQcfa() && this.mCaptureRequestVendorKeys.contains(QCFA_ACTIVE_ARRAY_SIZE.getName())) {
            return (Rect) this.mCharacteristics.get(QCFA_ACTIVE_ARRAY_SIZE);
        }
        return (Rect) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
    }

    public Range<Integer> getIsoRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_SENSITIVITY_RANGE);
    }

    public int getMaxIso() {
        Range<Integer> range = getIsoRange();
        if (range == null) {
            return 0;
        }
        return ((Integer) range.getUpper()).intValue();
    }

    public float getMaxZoomRatio() {
        Float zoom = (Float) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MAX_DIGITAL_ZOOM);
        return zoom != null ? zoom.floatValue() : 1.0f;
    }

    public boolean isZoomSupported() {
        return getMaxZoomRatio() > 1.0f;
    }

    public boolean isFlashSupported() {
        Boolean flash = (Boolean) this.mCharacteristics.get(CameraCharacteristics.FLASH_INFO_AVAILABLE);
        return flash != null ? flash.booleanValue() : false;
    }

    public boolean isAERegionSupported() {
        Integer maxAERegions = (Integer) this.mCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AE);
        if (maxAERegions == null || maxAERegions.intValue() <= 0) {
            return false;
        }
        return true;
    }

    public boolean isAFRegionSupported() {
        Float focusDistance = (Float) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
        if (focusDistance == null || focusDistance.floatValue() <= 0.0f) {
            return false;
        }
        return true;
    }

    public boolean isSupportedQcfa() {
        boolean z = true;
        if (this.mCaptureRequestVendorKeys == null || !this.mCaptureRequestVendorKeys.contains(MiCameraCharacteristics.IS_QCFA_SENSOR.getName())) {
            return false;
        }
        Byte qcfa = (Byte) this.mCharacteristics.get(MiCameraCharacteristics.IS_QCFA_SENSOR);
        if (qcfa == null || qcfa.byteValue() != (byte) 1) {
            z = false;
        }
        return z;
    }

    @TargetApi(23)
    public boolean isAELockSupported() {
        Boolean available = (Boolean) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_LOCK_AVAILABLE);
        return available != null ? available.booleanValue() : false;
    }

    @TargetApi(23)
    public boolean isAWBLockSupported() {
        Boolean available = (Boolean) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AWB_LOCK_AVAILABLE);
        return available != null ? available.booleanValue() : false;
    }

    public boolean isAutoFocusSupported() {
        return Util.isSupported(1, getSupportedFocusModes());
    }

    public float getMinimumFocusDistance() {
        Float distance = (Float) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE);
        return distance != null ? distance.floatValue() : 0.0f;
    }

    public int getMaxFaceCount() {
        Integer count = (Integer) this.mCharacteristics.get(CameraCharacteristics.STATISTICS_INFO_MAX_FACE_COUNT);
        return count != null ? count.intValue() : 0;
    }

    public Range<Integer>[] getSupportedFpsRange() {
        return (Range[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
    }

    private List<CameraSize> convertToPictureSize(Size[] sizes) {
        List<CameraSize> sizeList = new ArrayList();
        if (sizes != null) {
            for (Size cur : sizes) {
                sizeList.add(new CameraSize(cur.getWidth(), cur.getHeight()));
            }
        }
        return sizeList;
    }

    public List<CameraSize> getSupportedThumbnailSizes() {
        return convertToPictureSize((Size[]) this.mCharacteristics.get(CameraCharacteristics.JPEG_AVAILABLE_THUMBNAIL_SIZES));
    }

    private StreamConfigurationMap getStreamConfigurationMap() {
        if (this.mStreamConfigurationMap == null) {
            if (isSupportedQcfa()) {
                List<StreamConfiguration> configs = new ArrayList();
                if (this.mCaptureRequestVendorKeys.contains(QCFA_STREAM_CONFIGURATIONS.getName())) {
                    configs.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(QCFA_STREAM_CONFIGURATIONS)));
                }
                configs.addAll(Arrays.asList((StreamConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_CONFIGURATIONS)));
                this.mStreamConfigurationMap = new StreamConfigurationMap((StreamConfiguration[]) configs.toArray(new StreamConfiguration[0]), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_STALL_DURATIONS), (StreamConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STREAM_CONFIGURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_MIN_FRAME_DURATIONS), (StreamConfigurationDuration[]) this.mCharacteristics.get(CameraCharacteristics.DEPTH_AVAILABLE_DEPTH_STALL_DURATIONS), (HighSpeedVideoConfiguration[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_HIGH_SPEED_VIDEO_CONFIGURATIONS), (ReprocessFormatsMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP), true);
            } else {
                this.mStreamConfigurationMap = (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
            }
        }
        return this.mStreamConfigurationMap;
    }

    public List<CameraSize> getSupportedOutputSize(int format) {
        StreamConfigurationMap map = getStreamConfigurationMap();
        if (map != null) {
            return convertToPictureSize(map.getOutputSizes(format));
        }
        return new ArrayList(0);
    }

    public List<CameraSize> getSupportedOutputSize(Class clazz) {
        StreamConfigurationMap map = getStreamConfigurationMap();
        if (map != null) {
            return convertToPictureSize(map.getOutputSizes(clazz));
        }
        return new ArrayList(0);
    }

    public Size[] getSupportedHighSpeedVideoSize() {
        Size[] sizes = ((StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getHighSpeedVideoSizes();
        if (!isSupportExtraHighSpeedVideoConfiguration()) {
            return sizes;
        }
        List<MiHighSpeedVideoConfiguration> extraList = getExtraHighSpeedVideoConfiguration();
        if (extraList == null) {
            return sizes;
        }
        List<Size> sizeList = new ArrayList();
        for (MiHighSpeedVideoConfiguration configuration : extraList) {
            Size extraSize = configuration.getSize();
            if (!sizeList.contains(extraSize)) {
                sizeList.add(extraSize);
            }
        }
        if (sizes != null) {
            for (Size size : sizes) {
                if (!sizeList.contains(size)) {
                    sizeList.add(size);
                }
            }
        }
        return (Size[]) sizeList.toArray(new Size[0]);
    }

    public Range<Integer>[] getSupportedHighSpeedVideoFPSRange(Size videoSize) {
        Range<Integer>[] ranges = ((StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getHighSpeedVideoFpsRangesFor(videoSize);
        if (!isSupportExtraHighSpeedVideoConfiguration()) {
            return ranges;
        }
        List<MiHighSpeedVideoConfiguration> extraList = getExtraHighSpeedVideoConfiguration();
        if (extraList == null) {
            return ranges;
        }
        List<Range<Integer>> rangeList = new ArrayList();
        for (MiHighSpeedVideoConfiguration configuration : extraList) {
            if (videoSize != null && videoSize.equals(configuration.getSize())) {
                rangeList.add(configuration.getFpsRange());
            }
        }
        if (ranges != null) {
            for (Range<Integer> range : ranges) {
                rangeList.add(range);
            }
        }
        return (Range[]) rangeList.toArray(new Range[rangeList.size()]);
    }

    public List<Integer> getSupportedHFRVideoFPSList(Size videoSize) {
        List<Integer> list = new ArrayList();
        for (Range<Integer> range : getSupportedHighSpeedVideoFPSRange(videoSize)) {
            if (((Integer) range.getUpper()).equals(range.getLower()) && (list.contains(range.getUpper()) ^ 1) != 0) {
                list.add((Integer) range.getUpper());
            }
        }
        return list;
    }

    public int[] getSupportedAWBModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES);
    }

    public int[] getSupportedFocusModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
    }

    public int[] getSupportedAntiBandingModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_ANTIBANDING_MODES);
    }

    public int[] getSupportedSceneModes() {
        return (int[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AVAILABLE_SCENE_MODES);
    }

    public Range<Integer> getExposureCompensationRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_RANGE);
    }

    public Rational getExposureCompensationRational() {
        return (Rational) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_STEP);
    }

    public Range<Long> getExposureTimeRange() {
        return (Range) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE);
    }

    public float getViewAngle(boolean vertical) {
        float[] focalLengths = (float[]) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        if (focalLengths != null && focalLengths.length > 0) {
            float focalLength = focalLengths[0];
            SizeF size = (SizeF) this.mCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
            if (size != null) {
                float value = vertical ? size.getHeight() : size.getWidth();
                if (value > 0.0f) {
                    return (float) (((2.0d * Math.atan((((double) value) * 0.5d) / ((double) focalLength))) * 180.0d) / 3.141592653589793d);
                }
            }
        }
        Log.e(TAG, "failed to get vertical view angle");
        return 51.5f;
    }

    public int getSupportedHardwareLevel() {
        return ((Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)).intValue();
    }

    public boolean isSupportOIS() {
        int[] supportedOIS = (int[]) this.mCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_OPTICAL_STABILIZATION);
        if (supportedOIS == null || supportedOIS.length == 0) {
            return false;
        }
        return (supportedOIS.length == 1 && supportedOIS[0] == 0) ? false : true;
    }

    public static int getBurstShootCount() {
        return 100;
    }

    private List<MiHighSpeedVideoConfiguration> getExtraHighSpeedVideoConfiguration() {
        try {
            Integer count = (Integer) this.mCharacteristics.get(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_NUMBER);
            if (count != null && count.intValue() > 0) {
                return MiHighSpeedVideoConfiguration.unmarshal((int[]) this.mCharacteristics.get(MiCameraCharacteristics.EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS), count.intValue());
            }
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
        }
        return null;
    }

    public boolean isSupportHdr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HDR_ENABLED.getName());
    }

    public boolean isSupportAutoHdr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HDR_CHECKER_ENABLE.getName());
    }

    public boolean isSupportHHT() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.HHT_ENABLED.getName());
    }

    public boolean isSupportSuperResolution() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SUPER_RESOLUTION_ENABLED.getName());
    }

    public boolean isSupportParallel() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.PARALLEL_ENABLED.getName());
    }

    public boolean isSupportMfnr() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.MFNR_ENABLED.getName());
    }

    public boolean isSupportBokeh() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.MFNR_BOKEH.getName());
    }

    public boolean isSupportFaceAgeAnalyze() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FACE_AGE_ANALYZE_ENABLED.getName());
    }

    public boolean isSupportFaceScore() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FACE_SCORE_ENABLED.getName());
    }

    public boolean isSupportDeviceOrientation() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.DEVICE_ORIENTATION.getName());
    }

    public boolean isSupportBeauty() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BEAUTY_LEVEL.getName());
    }

    public int getZoomRatioTeleReal() {
        return Device.IS_D5X ? 17 : 20;
    }

    public boolean isSupportSnapShotTorch() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.SNAP_SHOT_TORCH.getName());
    }

    public boolean isSupportWatermark() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.WATERMARK_APPLIEDTYPE.getName());
    }

    public boolean isSupportFrontMirror() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.FRONT_MIRROR.getName());
    }

    public boolean isSupportBurstHint() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BURST_CAPTURE_HINT.getName());
    }

    public boolean isSupportBurstFps() {
        return this.mCaptureRequestVendorKeys.contains(MiCameraCompatBaseImpl.BURST_SHOOT_FPS.getName());
    }

    public boolean isSupportContrast() {
        return MiCameraCompat.supportContrast(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportLensDirtyDetect() {
        return MiCameraCompat.supportLensDirtyDetect(this.mCaptureRequestVendorKeys);
    }

    public boolean isSupportBeautyType(Type type) {
        return MiCameraCompat.supportBeautyType(this.mCaptureRequestVendorKeys, type);
    }

    public boolean isSupportExtraHighSpeedVideoConfiguration() {
        return MiCameraCompat.supportExtraHighSpeedVideoConfiguration(this.mCaptureRequestVendorKeys);
    }
}
