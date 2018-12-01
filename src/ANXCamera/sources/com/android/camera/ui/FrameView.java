package com.android.camera.ui;

import android.content.Context;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.view.View;

public abstract class FrameView extends View implements FocusIndicator {
    protected int mCameraDisplayOrientation;
    protected boolean mIsBigEnoughRect;
    protected Matrix mMatrix = new Matrix();
    protected boolean mPause;

    public FrameView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public boolean isNeedExposure() {
        return this.mIsBigEnoughRect;
    }

    public void showStart() {
    }

    public void showSuccess() {
    }

    public void showFail() {
    }

    public void resume() {
        this.mPause = false;
    }
}
