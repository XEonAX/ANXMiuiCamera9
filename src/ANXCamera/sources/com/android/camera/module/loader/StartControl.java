package com.android.camera.module.loader;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class StartControl {
    public boolean mNeedBlurAnimation;
    public boolean mNeedReConfigureCamera = true;
    public boolean mNeedReConfigureView = true;
    public boolean mNeedViewAnimation;
    public int mResetType = 1;
    public int mStartDelay = 0;
    public int mTargetMode;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ResetType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface StartDelay {
    }

    private StartControl(int targetMode) {
        this.mTargetMode = targetMode;
    }

    public static final StartControl create(int targetMode) {
        return new StartControl(targetMode);
    }

    public StartControl setStartDelay(int startDelay) {
        this.mStartDelay = startDelay;
        return this;
    }

    public StartControl setResetType(int resetType) {
        this.mResetType = resetType;
        return this;
    }

    public StartControl setNeedViewAnimation(boolean needViewAnimation) {
        this.mNeedViewAnimation = needViewAnimation;
        return this;
    }

    public StartControl setNeedBlurAnimation(boolean needBlurAnimation) {
        this.mNeedBlurAnimation = needBlurAnimation;
        return this;
    }

    public StartControl setNeedReConfigureCamera(boolean needReConfigureCamera) {
        this.mNeedReConfigureCamera = needReConfigureCamera;
        return this;
    }

    public StartControl setNeedReConfigureView(boolean needReConfigureView) {
        this.mNeedReConfigureView = needReConfigureView;
        return this;
    }
}
