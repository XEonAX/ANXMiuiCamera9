package com.miui.filtersdk.beauty;

import java.util.Map;

public abstract class BeautyProcessor {
    protected int mRotation;

    public abstract BeautyParameterType[] getSupportedBeautyParamTypes();

    public abstract float[] getSupportedParamRange(BeautyParameterType beautyParameterType);

    public abstract void init(int i, int i2);

    public abstract void onDisplaySizeChanged(int i, int i2);

    public abstract void release();

    public abstract void setBeautyParamsDegree(Map<BeautyParameterType, Float> map);

    public void setRotation(int rotation) {
        this.mRotation = rotation;
    }
}
