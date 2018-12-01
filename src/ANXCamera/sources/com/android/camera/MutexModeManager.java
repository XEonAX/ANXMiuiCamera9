package com.android.camera;

import android.support.annotation.MainThread;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class MutexModeManager {
    private int mCurrentMutexMode = 0;
    private boolean mIsMandatory;
    private MutexCallBack mMutexCallBack;

    public interface MutexCallBack {
        void enterMutexMode(int i);

        void exitMutexMode(int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface MutexMode {
    }

    public MutexModeManager(MutexCallBack mutexCallBack) {
        this.mMutexCallBack = mutexCallBack;
    }

    public void setMutexModeMandatory(int mode) {
        this.mIsMandatory = true;
        switchMutexMode(this.mCurrentMutexMode, mode);
    }

    public void clearMandatoryFlag() {
        this.mIsMandatory = false;
    }

    @MainThread
    public void setMutexMode(int mode) {
        this.mIsMandatory = false;
        switchMutexMode(this.mCurrentMutexMode, mode);
    }

    @MainThread
    public void resetMutexMode() {
        this.mIsMandatory = false;
        switchMutexMode(this.mCurrentMutexMode, 0);
    }

    public int getMutexMode() {
        return this.mCurrentMutexMode;
    }

    public boolean isSupportedFlashOn() {
        if (this.mCurrentMutexMode == 0 || this.mCurrentMutexMode == 4 || this.mCurrentMutexMode == 3) {
            return true;
        }
        return false;
    }

    public boolean isSupportedTorch() {
        if (Device.isSupportedTorchCapture()) {
            return this.mCurrentMutexMode == 0 || this.mCurrentMutexMode == 2 || this.mCurrentMutexMode == 7 || this.mCurrentMutexMode == 9 || this.mCurrentMutexMode == 10;
        } else {
            return false;
        }
    }

    public boolean isNormal() {
        return this.mCurrentMutexMode == 0;
    }

    public boolean isMorphoHdr() {
        return this.mCurrentMutexMode == 1;
    }

    public boolean isUbiFocus() {
        return this.mCurrentMutexMode == 6;
    }

    public boolean isHdr() {
        if (this.mCurrentMutexMode == 2 || this.mCurrentMutexMode == 1 || this.mCurrentMutexMode == 5) {
            return true;
        }
        return false;
    }

    public boolean isSceneHdr() {
        return this.mCurrentMutexMode == 5;
    }

    public boolean isBurstShoot() {
        return this.mCurrentMutexMode == 7;
    }

    public boolean isHandNight() {
        return this.mCurrentMutexMode == 3;
    }

    public boolean isSuperResolution() {
        return this.mCurrentMutexMode == 10;
    }

    public String getAlgorithmName() {
        switch (this.mCurrentMutexMode) {
            case 1:
            case 5:
                return "HDR";
            case 2:
                return "AO_HDR";
            case 3:
                return "HHT";
            default:
                return "";
        }
    }

    public String getSuffix() {
        if (this.mCurrentMutexMode == 4) {
            return "_RAW";
        }
        if (!Device.enableAlgorithmInFileSuffix()) {
            return "";
        }
        switch (this.mCurrentMutexMode) {
            case 1:
            case 5:
                return "_HDR";
            case 2:
                return "_AO_HDR";
            case 3:
                return "_HHT";
            default:
                return "";
        }
    }

    private void exit(int mode) {
        if (mode != 0 && this.mMutexCallBack != null) {
            this.mCurrentMutexMode = 0;
            this.mMutexCallBack.exitMutexMode(mode);
        }
    }

    private void enter(int mode) {
        if (mode != 0 && this.mMutexCallBack != null && this.mCurrentMutexMode != mode) {
            this.mCurrentMutexMode = mode;
            this.mMutexCallBack.enterMutexMode(mode);
        }
    }

    private void switchMutexMode(int from, int to) {
        if (from != to) {
            exit(from);
            enter(to);
        }
    }
}
