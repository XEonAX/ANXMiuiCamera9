package com.android.camera2.compat;

import android.hardware.camera2.CaptureRequest.Builder;
import com.android.camera.Device;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.effect.BeautyValues;
import java.util.HashSet;

public class MiCameraCompat {
    static final MiCameraCompatBaseImpl IMPL;

    static {
        if (Device.isQcomPlatform()) {
            IMPL = new MiCameraCompatQcomImpl();
        } else if (Device.isMTKPlatform()) {
            IMPL = new MiCameraCompatMtkImpl();
        } else {
            IMPL = new MiCameraCompatBaseImpl();
        }
    }

    public static void applyISO(Builder request, int iso) {
        IMPL.applyISO(request, iso);
    }

    public static void applyExposureTime(Builder request, long exposureTime) {
        IMPL.applyExposureTime(request, exposureTime);
    }

    public static void applyCustomAWB(Builder request, int awbValue) {
        IMPL.applyCustomWB(request, awbValue);
    }

    public static void applyContrast(Builder request, int level) {
        IMPL.applyContrast(request, level);
    }

    public static void applySaturation(Builder request, int level) {
        IMPL.applySaturation(request, level);
    }

    public static void applySharpness(Builder request, int level) {
        IMPL.applySharpness(request, level);
    }

    public static void applyExposureMeteringMode(Builder request, int mode) {
        IMPL.applyExposureMeteringMode(request, mode);
    }

    public static void applyHHT(Builder request, boolean enable) {
        IMPL.applyHHT(request, enable);
    }

    public static void applyHDR(Builder request, boolean enable) {
        IMPL.applyHDR(request, enable);
    }

    public static void applyHDRCheckerEnable(Builder request, boolean enable) {
        IMPL.applyHDRCheckerEnable(request, enable);
    }

    public static void applyParallelProcessPath(Builder request, String path) {
        IMPL.applyParallelProcessPath(request, path);
    }

    public static void applyParallelProcessEnable(Builder request, boolean enable) {
        IMPL.applyParallelProcessEnable(request, enable);
    }

    public static void applySuperResolution(Builder request, boolean enable) {
        IMPL.applySuperResolution(request, enable);
    }

    public static void applyWaterMarkAppliedList(Builder request, String applied) {
        IMPL.applyWaterMarkAppliedList(request, applied);
    }

    public static void applyTimeWaterMark(Builder request, String applied) {
        IMPL.applyTimeWaterMark(request, applied);
    }

    public static void applyFaceWaterMark(Builder request, String applied) {
        IMPL.applyFaceWaterMark(request, applied);
    }

    public static void applyMfnrEnable(Builder request, boolean enable) {
        IMPL.applyMfnr(request, enable);
    }

    public static void applyBokehEnable(Builder request, boolean enable) {
        IMPL.applyBokeh(request, enable);
    }

    public static void applyStFastZoomIn(Builder request, boolean enable) {
        IMPL.applyStFastZoomIn(request, enable);
    }

    public static void applyFaceAgeAnalyzeEnable(Builder request, boolean enable) {
        IMPL.applyFaceAnalyzeAge(request, enable);
    }

    public static void applyFaceScoreEnable(Builder request, boolean enable) {
        IMPL.applyFaceScore(request, enable);
    }

    public static void applyDeviceOrientation(Builder request, int orientation) {
        IMPL.applyDeviceOrientation(request, orientation);
    }

    public static void applyBeautyParameter(Builder request, BeautyValues beautyValues) {
        IMPL.applyBeautyParameter(request, beautyValues);
    }

    public static void applyVideoStreamState(Builder request, boolean start) {
        IMPL.applyVideoStreamState(request, start);
    }

    public static void applyASDEnable(Builder request, boolean enable) {
        IMPL.applyASDEnable(request, enable);
    }

    public static void applyAiScenePeriod(Builder request, int period) {
        IMPL.applyAiScenePeriod(request, period);
    }

    public static void applySnapshotTorch(Builder request, boolean enable) {
        IMPL.applySnapshotTorch(request, enable);
    }

    public static void applyFrontMirror(Builder request, boolean enable) {
        IMPL.applyFrontMirror(request, enable);
    }

    public static void applyBurstHint(Builder request, int hint) {
        IMPL.applyBurstHint(request, hint);
    }

    public static void applyBurstFps(Builder request, int fps) {
        IMPL.applyBurstFps(request, fps);
    }

    public static void applyIsHfrPreview(Builder request, boolean isPreview) {
        IMPL.applyIsHfrPreview(request, isPreview);
    }

    public static void applyLensDirtyDetect(Builder request, boolean enable) {
        IMPL.applyLensDirtyDetect(request, enable);
    }

    public static boolean supportContrast(HashSet<String> supportedVendorKeys) {
        return IMPL.supportContrast(supportedVendorKeys);
    }

    public static boolean supportLensDirtyDetect(HashSet<String> supportedVendorKeys) {
        return IMPL.supportLensDirtyDetect(supportedVendorKeys);
    }

    public static boolean supportBeautyType(HashSet<String> supportedVendorKeys, Type type) {
        return IMPL.supportBeautyType(supportedVendorKeys, type);
    }

    public static boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> supportedVendorKeys) {
        return IMPL.supportExtraHighSpeedVideoConfiguration(supportedVendorKeys);
    }
}
