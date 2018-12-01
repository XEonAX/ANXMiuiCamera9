package com.android.camera.module;

import android.support.annotation.Nullable;

public class ModuleManager {
    private static int sCurrentModuleIndex = -1;
    private static ModuleManager sInstance = new ModuleManager();

    @Nullable
    public static Module getModuleByIndex(int moduleIndex) {
        switch (moduleIndex) {
            case 161:
                return getFunByDevice();
            case 162:
            case 168:
            case 169:
            case 170:
                return getVideoByDevice();
            case 163:
            case 165:
            case 167:
            case 171:
                return getCameraByDevice();
            case 166:
                return new PanoramaModule();
            default:
                return null;
        }
    }

    public static int getActiveModuleIndex() {
        return sCurrentModuleIndex;
    }

    public static void setActiveModuleIndex(int moduleIndex) {
        sCurrentModuleIndex = moduleIndex;
    }

    public static boolean isFunModule() {
        return sCurrentModuleIndex == 161;
    }

    public static boolean isVideoModule() {
        return sCurrentModuleIndex == 162;
    }

    public static boolean isSlowMotionModule() {
        return sCurrentModuleIndex == 168;
    }

    public static boolean isFastMotionModule() {
        return sCurrentModuleIndex == 169;
    }

    public static boolean isCameraModule() {
        return sCurrentModuleIndex == 163;
    }

    public static boolean isSquareModule() {
        return sCurrentModuleIndex == 165;
    }

    public static boolean isPanoramaModule() {
        return sCurrentModuleIndex == 166;
    }

    public static boolean isManualModule() {
        return sCurrentModuleIndex == 167;
    }

    public static boolean isPortraitModule() {
        return sCurrentModuleIndex == 171;
    }

    public static boolean isCapture() {
        return (isCameraModule() || isSquareModule()) ? true : isManualModule();
    }

    private static Module getCameraByDevice() {
        return new Camera2Module();
    }

    private static Module getFunByDevice() {
        return new FunModule();
    }

    private static Module getVideoByDevice() {
        return new VideoModule();
    }
}
