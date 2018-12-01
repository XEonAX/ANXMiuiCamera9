package com.android.camera.ui.drawable;

import android.animation.ArgbEvaluator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.annotation.ColorInt;
import android.support.annotation.FloatRange;

public abstract class CameraPaintBase {
    public static int ALPHA_HINT = 102;
    public static int ALPHA_OPAQUE = 255;
    public static int ALPHA_OUTSTANDING = 255;
    public boolean isClockwise = true;
    public boolean isRecording;
    public float mBaseRadius;
    public int mCurrentAlpha;
    @ColorInt
    public int mCurrentColor;
    public float mCurrentStrokeWidth;
    public float mCurrentWidthPercent;
    private int mDstAlpha;
    private int mDstColor;
    private float mDstStrokeWidth;
    private float mDstWidthPercent;
    public float mMiddleX;
    public float mMiddleY;
    public Paint mPaint = new Paint();
    public int mSrcAlpha;
    public int mSrcColor;
    public float mSrcStrokeWidth;
    public float mSrcWidthPercent;
    public boolean needZero = true;
    public float timeAngle;
    public int visible;

    protected abstract void draw(Canvas canvas);

    protected abstract void initPaint(Context context);

    public void resetRecordingState() {
        this.timeAngle = 0.0f;
        this.isClockwise = true;
        this.isRecording = false;
        this.needZero = true;
    }

    public void reverseClock() {
        this.isClockwise ^= 1;
        if (this.isClockwise) {
            this.mCurrentAlpha = ALPHA_HINT;
        } else {
            this.mCurrentAlpha = ALPHA_OUTSTANDING;
        }
    }

    public CameraPaintBase(Context context) {
        initPaint(context);
    }

    public void setMiddle(float middleX, float middleY, float maxRadius) {
        this.mMiddleX = middleX;
        this.mMiddleY = middleY;
        this.mBaseRadius = maxRadius;
    }

    public CameraPaintBase setCurrentWidthPercent(float currentWidthPercent) {
        this.mCurrentWidthPercent = currentWidthPercent;
        return this;
    }

    public CameraPaintBase setCurrentColor(int currentColor) {
        this.mCurrentColor = currentColor;
        this.mPaint.setColor(currentColor);
        return this;
    }

    public CameraPaintBase setCurrentAlpha(int currentAlpha) {
        this.mCurrentAlpha = currentAlpha;
        this.mPaint.setAlpha(currentAlpha);
        return this;
    }

    public CameraPaintBase setTargetWidthPercent(float dstWidthPercent) {
        this.mDstWidthPercent = dstWidthPercent;
        this.mSrcWidthPercent = this.mCurrentWidthPercent;
        return this;
    }

    public CameraPaintBase setTargetColor(int dstColor) {
        this.mDstColor = dstColor;
        this.mSrcColor = this.mCurrentColor;
        return this;
    }

    public CameraPaintBase setTargetAlpha(int dstAlpha) {
        this.mDstAlpha = dstAlpha;
        this.mSrcAlpha = this.mCurrentAlpha;
        return this;
    }

    public void setTargetValues(float targetWidth, @ColorInt int targetColor, int targetAlpha, float targetStrokeWidth) {
        this.mDstWidthPercent = targetWidth;
        this.mDstColor = targetColor;
        this.mDstAlpha = targetAlpha;
        this.mDstStrokeWidth = targetStrokeWidth;
        this.mSrcWidthPercent = this.mCurrentWidthPercent;
        this.mSrcColor = this.mCurrentColor;
        this.mSrcAlpha = this.mCurrentAlpha;
        this.mSrcStrokeWidth = this.mCurrentStrokeWidth;
    }

    public void updateValue(@FloatRange(from = 0.0d, to = 1.0d) float interpolatorValue) {
        this.mCurrentWidthPercent = this.mSrcWidthPercent + ((this.mDstWidthPercent - this.mSrcWidthPercent) * interpolatorValue);
        this.mCurrentStrokeWidth = this.mSrcStrokeWidth + ((this.mDstStrokeWidth - this.mSrcStrokeWidth) * interpolatorValue);
        this.mPaint.setStrokeWidth(this.mCurrentStrokeWidth);
        if (this.mSrcColor != this.mDstColor) {
            this.mCurrentColor = ((Integer) new ArgbEvaluator().evaluate(interpolatorValue, Integer.valueOf(this.mSrcColor), Integer.valueOf(this.mDstColor))).intValue();
            this.mPaint.setColor(this.mCurrentColor);
        }
        if (this.mSrcAlpha != this.mDstAlpha) {
            this.mCurrentAlpha = Math.round(((float) this.mSrcAlpha) + (((float) (this.mDstAlpha - this.mSrcAlpha)) * interpolatorValue));
            this.mPaint.setAlpha(this.mCurrentAlpha);
        }
        if (interpolatorValue == 1.0f) {
            setResult();
        }
    }

    public void setResult() {
        this.mCurrentWidthPercent = this.mDstWidthPercent;
        this.mCurrentColor = this.mDstColor;
        this.mCurrentAlpha = this.mDstAlpha;
        this.mCurrentStrokeWidth = this.mDstStrokeWidth;
        this.mPaint.setColor(this.mCurrentColor);
        this.mPaint.setAlpha(this.mCurrentAlpha);
        this.mPaint.setStrokeWidth(this.mCurrentStrokeWidth);
        this.mSrcWidthPercent = this.mCurrentWidthPercent;
        this.mSrcColor = this.mCurrentColor;
        this.mSrcAlpha = this.mCurrentAlpha;
        this.mSrcStrokeWidth = this.mCurrentStrokeWidth;
    }

    public void setVisible(int visible) {
        this.visible = visible;
    }

    public int getVisible() {
        return this.visible;
    }

    protected boolean isHide() {
        return this.visible == 8;
    }

    public void drawCanvas(Canvas canvas) {
        if (!isHide()) {
            draw(canvas);
        }
    }
}
