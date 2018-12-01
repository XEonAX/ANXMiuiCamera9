package com.android.camera.sticker.beautyprocessor;

import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import com.sensetime.stmobile.STBeautifyNative;
import java.util.Map;
import java.util.Map.Entry;

public class StickerBeautyProcessor extends IntelligentBeautyProcessor {
    /* renamed from: -com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues */
    private static final /* synthetic */ int[] f9-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues = null;
    private STBeautifyNative mStBeautifyNative;

    /* renamed from: -getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues */
    private static /* synthetic */ int[] m9-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues() {
        if (f9-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues != null) {
            return f9-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues;
        }
        int[] iArr = new int[BeautyParameterType.values().length];
        try {
            iArr[BeautyParameterType.BRIGHT_EYE_RATIO.ordinal()] = 7;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[BeautyParameterType.CONTRAST_STRENGTH.ordinal()] = 1;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[BeautyParameterType.DEBLEMISH.ordinal()] = 8;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[BeautyParameterType.DEPOUCH_RATIO.ordinal()] = 9;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[BeautyParameterType.ENLARGE_EYE_RATIO.ordinal()] = 2;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[BeautyParameterType.IRIS_SHINE_RATIO.ordinal()] = 10;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[BeautyParameterType.LIP_BEAUTY_RATIO.ordinal()] = 11;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[BeautyParameterType.RELIGHTING_RATIO.ordinal()] = 12;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[BeautyParameterType.RUDDY_STRENGTH.ordinal()] = 13;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_FACE_RATIO.ordinal()] = 3;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_JAW_RATIO.ordinal()] = 4;
        } catch (NoSuchFieldError e11) {
        }
        try {
            iArr[BeautyParameterType.SHRINK_NOSE_RATIO.ordinal()] = 14;
        } catch (NoSuchFieldError e12) {
        }
        try {
            iArr[BeautyParameterType.SMOOTH_STRENGTH.ordinal()] = 5;
        } catch (NoSuchFieldError e13) {
        }
        try {
            iArr[BeautyParameterType.WHITEN_STRENGTH.ordinal()] = 6;
        } catch (NoSuchFieldError e14) {
        }
        f9-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues = iArr;
        return iArr;
    }

    public StickerBeautyProcessor(STBeautifyNative stBeautifyNative) {
        this.mStBeautifyNative = stBeautifyNative;
        this.mLevelParameters = new float[][]{new float[]{0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f}, new float[]{0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f}, new float[]{0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f}, new float[]{0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f}, new float[]{0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f}, new float[]{0.6f, 0.6f, 0.6f, 0.6f, 0.6f, 0.6f}};
    }

    public BeautyParameterType[] getSupportedBeautyParamTypes() {
        return new BeautyParameterType[]{BeautyParameterType.CONTRAST_STRENGTH, BeautyParameterType.ENLARGE_EYE_RATIO, BeautyParameterType.SHRINK_FACE_RATIO, BeautyParameterType.SHRINK_JAW_RATIO, BeautyParameterType.WHITEN_STRENGTH, BeautyParameterType.SMOOTH_STRENGTH};
    }

    public float[] getSupportedParamRange(BeautyParameterType type) {
        switch (m9-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[type.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                return new float[]{0.0f, 1.0f};
            default:
                return new float[0];
        }
    }

    public void setBeautyParamsDegree(Map<BeautyParameterType, Float> params) {
        for (Entry<BeautyParameterType, Float> entry : params.entrySet()) {
            setBeautyParamDegree((BeautyParameterType) entry.getKey(), (Float) entry.getValue());
        }
    }

    public void setBeautyParamDegree(BeautyParameterType type, Float degree) {
        int parameter;
        switch (m9-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[type.ordinal()]) {
            case 1:
                parameter = 1;
                break;
            case 2:
                parameter = 5;
                break;
            case 3:
                parameter = 6;
                break;
            case 4:
                parameter = 7;
                break;
            case 5:
                parameter = 3;
                break;
            case 6:
                parameter = 4;
                break;
            default:
                parameter = -1;
                break;
        }
        if (-1 != parameter) {
            this.mStBeautifyNative.setParam(parameter, degree.floatValue());
        }
    }

    public void init(int width, int height) {
        this.mStBeautifyNative.createInstance(width, height);
    }

    public void release() {
        this.mStBeautifyNative.destroyBeautify();
    }

    public void onDisplaySizeChanged(int i, int i1) {
    }
}
