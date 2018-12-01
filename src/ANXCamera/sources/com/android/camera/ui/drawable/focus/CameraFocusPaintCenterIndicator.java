package com.android.camera.ui.drawable.focus;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.support.annotation.FloatRange;
import android.support.annotation.NonNull;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraFocusPaintCenterIndicator extends CameraPaintBase {
    public CameraIndicatorState indicatorState;
    private Bitmap mAEAFLockBodyBitmap;
    private Bitmap mAEAFLockHeadBitmap;
    private Bitmap mCaptureIndicatorBitmap;
    private Matrix mCaptureIndicatorBitmapMatrix;
    private Matrix mLockMatrix;
    private Paint mMinusMoonPaint;
    private Paint mSunPaint;

    public CameraFocusPaintCenterIndicator(Context context) {
        super(context);
    }

    public void setIndicatorData(CameraIndicatorState indicatorState, Bitmap bitmap) {
        this.indicatorState = indicatorState;
        this.mCaptureIndicatorBitmap = bitmap;
    }

    public void setAEAFIndicatorData(CameraIndicatorState indicatorState, Bitmap head, Bitmap body) {
        this.indicatorState = indicatorState;
        this.mAEAFLockHeadBitmap = head;
        this.mAEAFLockBodyBitmap = body;
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mSunPaint = new Paint();
        this.mSunPaint.setColor(-1);
        this.mSunPaint.setStyle(Style.FILL);
        this.mSunPaint.setAntiAlias(true);
        this.mMinusMoonPaint = new Paint();
        this.mMinusMoonPaint.setColor(-1);
        this.mMinusMoonPaint.setStyle(Style.FILL);
        this.mMinusMoonPaint.setAntiAlias(true);
        this.mMinusMoonPaint.setXfermode(new PorterDuffXfermode(Mode.DST_OUT));
    }

    protected void draw(Canvas canvas) {
        canvas.translate(this.mMiddleX, this.mMiddleY);
        switch (this.indicatorState.mCenterFlag) {
            case 2:
                this.mPaint.setAlpha(this.mCurrentAlpha);
                drawCenterCaptureBitmap(canvas);
                return;
            case 3:
                this.mSunPaint.setColor(this.mCurrentColor);
                this.mSunPaint.setAlpha(this.mCurrentAlpha);
                drawCenterSun(canvas);
                return;
            case 4:
                this.mSunPaint.setColor(this.mCurrentColor);
                this.mSunPaint.setAlpha(this.mCurrentAlpha);
                drawCenterMoon(canvas);
                return;
            case 5:
                this.mPaint.setAlpha(this.mCurrentAlpha);
                drawCenterLock(canvas);
                return;
            default:
                this.mPaint.setStrokeWidth(this.mCurrentStrokeWidth);
                this.mPaint.setAlpha(this.mCurrentAlpha);
                drawCenterCircle(canvas, 0.0f, 0.0f, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
                return;
        }
    }

    public void setCenterFlag(int centerFlag) {
        this.indicatorState.mCenterFlag = centerFlag;
    }

    private void drawCenterCircle(Canvas canvas, float cx, float cy, float radius, @NonNull Paint paint) {
        canvas.drawCircle(cx, cy, radius, paint);
    }

    private void drawCenterCaptureBitmap(Canvas canvas) {
        if (this.mCaptureIndicatorBitmapMatrix == null) {
            this.mCaptureIndicatorBitmapMatrix = new Matrix();
        } else {
            this.mCaptureIndicatorBitmapMatrix.reset();
        }
        if (!this.mCaptureIndicatorBitmap.isRecycled()) {
            this.mCaptureIndicatorBitmapMatrix.postTranslate((float) ((-this.mCaptureIndicatorBitmap.getWidth()) / 2), (float) ((-this.mCaptureIndicatorBitmap.getHeight()) / 2));
            canvas.drawBitmap(this.mCaptureIndicatorBitmap, this.mCaptureIndicatorBitmapMatrix, this.mPaint);
        }
    }

    private void drawCenterSun(Canvas canvas) {
        canvas.rotate(this.indicatorState.mCurrentAngle);
        for (int i = 0; i < 2; i++) {
            if (i > 0) {
                canvas.rotate(45.0f);
            }
            canvas.drawRect((float) ((-this.indicatorState.mCurrentRayWidth) / 2), (float) ((-this.indicatorState.mCurrentRayBottom) - this.indicatorState.mCurrentRayHeight), (float) (this.indicatorState.mCurrentRayWidth / 2), (float) (-this.indicatorState.mCurrentRayBottom), this.mSunPaint);
            canvas.drawRect((float) ((-this.indicatorState.mCurrentRayWidth) / 2), (float) this.indicatorState.mCurrentRayBottom, (float) (this.indicatorState.mCurrentRayWidth / 2), (float) (this.indicatorState.mCurrentRayBottom + this.indicatorState.mCurrentRayHeight), this.mSunPaint);
            canvas.drawRect((float) ((-this.indicatorState.mCurrentRayBottom) - this.indicatorState.mCurrentRayHeight), (float) ((-this.indicatorState.mCurrentRayWidth) / 2), (float) (-this.indicatorState.mCurrentRayBottom), (float) (this.indicatorState.mCurrentRayWidth / 2), this.mSunPaint);
            canvas.drawRect((float) this.indicatorState.mCurrentRayBottom, (float) ((-this.indicatorState.mCurrentRayWidth) / 2), (float) (this.indicatorState.mCurrentRayBottom + this.indicatorState.mCurrentRayHeight), (float) (this.indicatorState.mCurrentRayWidth / 2), this.mSunPaint);
        }
        canvas.drawCircle(0.0f, 0.0f, (float) this.indicatorState.mCurrentRadius, this.mSunPaint);
    }

    private void drawCenterMoon(Canvas canvas) {
        drawCenterCircle(canvas, 0.0f, 0.0f, (float) this.indicatorState.mCurrentRadius, this.mSunPaint);
        drawCenterCircle(canvas, (float) (-this.indicatorState.mCurrentMinusCircleCenter), (float) (-this.indicatorState.mCurrentMinusCircleCenter), this.indicatorState.mCurrentMinusCircleRadius, this.mMinusMoonPaint);
    }

    private void drawCenterLock(Canvas canvas) {
        if (this.mAEAFLockHeadBitmap != null && this.mAEAFLockBodyBitmap != null) {
            if (this.mLockMatrix == null) {
                this.mLockMatrix = new Matrix();
            } else {
                this.mLockMatrix.reset();
            }
            if (!(this.mAEAFLockHeadBitmap.isRecycled() || (this.mAEAFLockBodyBitmap.isRecycled() ^ 1) == 0)) {
                this.mLockMatrix.postTranslate((float) ((-this.mAEAFLockHeadBitmap.getWidth()) / 2), ((float) ((-this.mAEAFLockHeadBitmap.getHeight()) / 2)) + this.indicatorState.mAEAFHeadPosition);
                canvas.drawBitmap(this.mAEAFLockHeadBitmap, this.mLockMatrix, this.mPaint);
                this.mLockMatrix.reset();
                this.mLockMatrix.postTranslate((float) ((-this.mAEAFLockBodyBitmap.getWidth()) / 2), (float) ((-this.mAEAFLockBodyBitmap.getHeight()) / 2));
                canvas.drawBitmap(this.mAEAFLockBodyBitmap, this.mLockMatrix, this.mPaint);
            }
        }
    }

    public void updateValue(@FloatRange(from = 0.0d, to = 1.0d) float interpolatorValue) {
        super.updateValue(interpolatorValue);
        if (this.indicatorState.mCenterFlag == 5) {
            this.indicatorState.mAEAFHeadPosition = 5.0f * interpolatorValue;
        }
    }
}
