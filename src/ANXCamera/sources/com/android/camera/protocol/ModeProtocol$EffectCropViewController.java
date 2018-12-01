package com.android.camera.protocol;

public interface ModeProtocol$EffectCropViewController {
    void initEffectCropView();

    boolean isEffectViewMoved();

    boolean isEffectViewVisible();

    void removeTiltShiftMask();

    void setEffectViewVisible(boolean z);

    void updateEffectViewVisible();
}
