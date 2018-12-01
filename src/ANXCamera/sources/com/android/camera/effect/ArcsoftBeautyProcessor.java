package com.android.camera.effect;

import com.android.camera.log.Log;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

public class ArcsoftBeautyProcessor extends IntelligentBeautyProcessor {
    /* renamed from: -com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues */
    private static final /* synthetic */ int[] f2-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues = null;
    private static final String TAG = ArcsoftBeautyProcessor.class.getSimpleName();
    private int mEnlargeEyeRatio;
    private int mShrinkFaceRatio;
    private int mSmoothStrength;
    private int mWhiteStrength;

    /* renamed from: -getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues */
    private static /* synthetic */ int[] m1-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues() {
        if (f2-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues != null) {
            return f2-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues;
        }
        int[] iArr = new int[BeautyParameterType.values().length];
        try {
            iArr[BeautyParameterType.BRIGHT_EYE_RATIO.ordinal()] = 5;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[BeautyParameterType.CONTRAST_STRENGTH.ordinal()] = 6;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[BeautyParameterType.DEBLEMISH.ordinal()] = 7;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[BeautyParameterType.DEPOUCH_RATIO.ordinal()] = 8;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[BeautyParameterType.ENLARGE_EYE_RATIO.ordinal()] = 1;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[BeautyParameterType.IRIS_SHINE_RATIO.ordinal()] = 9;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[BeautyParameterType.LIP_BEAUTY_RATIO.ordinal()] = 10;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[BeautyParameterType.RELIGHTING_RATIO.ordinal()] = 11;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[BeautyParameterType.RUDDY_STRENGTH.ordinal()] = 12;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_FACE_RATIO.ordinal()] = 2;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_JAW_RATIO.ordinal()] = 13;
        } catch (NoSuchFieldError e11) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_NOSE_RATIO.ordinal()] = 14;
        } catch (NoSuchFieldError e12) {
        }
        try {
            iArr[BeautyParameterType.SMOOTH_STRENGTH.ordinal()] = 3;
        } catch (NoSuchFieldError e13) {
        }
        try {
            iArr[BeautyParameterType.WHITEN_STRENGTH.ordinal()] = 4;
        } catch (NoSuchFieldError e14) {
        }
        f2-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues = iArr;
        return iArr;
    }

    public ArcsoftBeautyProcessor() {
        setExtraSpan(2.0f);
        this.mLevelParameters = new float[][]{new float[]{0.0f, 0.0f, 0.0f, 0.0f}, new float[]{1.0f, 1.0f, 1.0f, 1.0f}, new float[]{3.0f, 3.0f, 3.0f, 3.0f}, new float[]{5.0f, 5.0f, 5.0f, 5.0f}, new float[]{7.0f, 7.0f, 7.0f, 7.0f}, new float[]{8.0f, 8.0f, 8.0f, 8.0f}};
    }

    public BeautyParameterType[] getSupportedBeautyParamTypes() {
        return new BeautyParameterType[]{BeautyParameterType.ENLARGE_EYE_RATIO, BeautyParameterType.SHRINK_FACE_RATIO, BeautyParameterType.WHITEN_STRENGTH, BeautyParameterType.SMOOTH_STRENGTH};
    }

    public float[] getSupportedParamRange(BeautyParameterType beautyParameterType) {
        switch (m1-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[beautyParameterType.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
                return new float[]{0.0f, 10.0f};
            default:
                return new float[0];
        }
    }

    public void setBeautyParamsDegree(Map<BeautyParameterType, Float> params) {
        for (Entry<BeautyParameterType, Float> entry : params.entrySet()) {
            updateBeautyParameter((BeautyParameterType) entry.getKey(), (Float) entry.getValue());
        }
        dumpParams();
    }

    private void updateBeautyParameter(BeautyParameterType type, Float param) {
        int degree = getDegreeByValue(type, param != null ? param.floatValue() : 0.0f);
        switch (m1-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[type.ordinal()]) {
            case 1:
                this.mEnlargeEyeRatio = degree;
                return;
            case 2:
                this.mShrinkFaceRatio = degree;
                return;
            case 3:
                this.mSmoothStrength = degree;
                return;
            case 4:
                this.mWhiteStrength = degree;
                return;
            default:
                return;
        }
    }

    private void dumpParams() {
        Log.v(TAG, String.format(Locale.ENGLISH, "beautyParams: shrinkFace=%d largeEye=%d whiteSkin=%d smoothSkin=%d", new Object[]{Integer.valueOf(this.mShrinkFaceRatio), Integer.valueOf(this.mEnlargeEyeRatio), Integer.valueOf(this.mWhiteStrength), Integer.valueOf(this.mSmoothStrength)}));
    }

    private int getDegreeByValue(BeautyParameterType beautyType, float value) {
        float[] degreeRange = getSupportedParamRange(beautyType);
        if (degreeRange.length < 2) {
            return Math.round(value);
        }
        return Math.round(((value - degreeRange[0]) / degreeRange[1]) * 10.0f);
    }

    public void init(int width, int height) {
    }

    public void release() {
    }

    public void onDisplaySizeChanged(int width, int height) {
    }
}
