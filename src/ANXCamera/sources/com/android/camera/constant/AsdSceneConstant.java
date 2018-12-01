package com.android.camera.constant;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.CaptureResult.Key;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class AsdSceneConstant {
    private static final Key<Float> AEC_LUX = new Key("com.qti.chi.statsaec.AecLux", Float.class);
    private static final Key<Integer> XIAO_MI_SCENE_RESULT = new Key("xiaomi.scene.result", Integer.TYPE);
    private static boolean mIsFlashRetain;

    @Retention(RetentionPolicy.SOURCE)
    public @interface SceneResult {
    }

    public static int parseRtbSceneResult(CaptureResult captureResult, boolean isFrontCamera) {
        float aecLux = ((Float) captureResult.get(AEC_LUX)).floatValue();
        if (!isFrontCamera) {
            mIsFlashRetain = false;
            if (aecLux > 450.0f) {
                return 6;
            }
            float distance = ((Float) captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE)).floatValue();
            if (distance >= 2.5f) {
                return 4;
            }
            if (distance <= 0.5f) {
                return 5;
            }
            return 7;
        } else if (mIsFlashRetain && aecLux > 300.0f) {
            return 9;
        } else {
            if (aecLux > 350.0f) {
                mIsFlashRetain = true;
                return 9;
            }
            mIsFlashRetain = false;
            return -1;
        }
    }
}
