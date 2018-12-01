package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import com.android.camera.Util;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintCircle extends CameraPaintBase {
    public boolean isInBeautyMode;
    private RectF mArcRectF;
    private int mBeautyColor = -235132;
    private boolean mNeedRing = false;
    private boolean mNoNeedArc;
    private float mRingWidth;
    private float mSpaceAngle = 3.0f;

    public CameraSnapPaintCircle(Context context) {
        super(context);
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
        this.mArcRectF = new RectF();
    }

    public void resetRecordingState() {
        super.resetRecordingState();
        setNeedSplit(false);
    }

    public void setRingVisible(int visible) {
        boolean z = false;
        if (visible == 0) {
            z = true;
        }
        this.mNeedRing = z;
    }

    public void setNeedSplit(boolean needSplit) {
        this.mNoNeedArc = needSplit ^ 1;
        this.mSpaceAngle = needSplit ? 1.5f : 0.0f;
    }

    public void updateValue(float interpolatorValue) {
        super.updateValue(interpolatorValue);
        this.mRingWidth = this.mCurrentWidthPercent + ((this.mCurrentWidthPercent * 0.4f) * interpolatorValue);
    }

    protected void draw(Canvas canvas) {
        if (this.mNoNeedArc) {
            this.isRecording = false;
        }
        if (this.isRecording) {
            float length = this.mBaseRadius * this.mCurrentWidthPercent;
            float left = this.mMiddleX - length;
            float top = this.mMiddleY - length;
            float right = this.mMiddleX + length;
            float bottom = this.mMiddleY + length;
            this.mPaint.setAlpha(this.isInBeautyMode ? this.mCurrentAlpha : ALPHA_HINT);
            this.mArcRectF.set(left, top, right, bottom);
            canvas.drawArc(this.mArcRectF, this.mSpaceAngle + ((this.isClockwise ? this.timeAngle : 0.0f) - 0.049804688f), (this.isClockwise ? 360.0f - this.timeAngle : this.timeAngle) - (this.mSpaceAngle * 2.0f), false, this.mPaint);
            this.mPaint.setAlpha(ALPHA_OPAQUE);
            if (this.isInBeautyMode) {
                this.mPaint.setColor(this.mBeautyColor);
            }
            canvas.drawArc(this.mArcRectF, this.mSpaceAngle + ((this.isClockwise ? 0.0f : this.timeAngle) - 0.049804688f), Math.max(0.0f, (this.isClockwise ? this.timeAngle : 360.0f - this.timeAngle) - (this.mSpaceAngle * 2.0f)), false, this.mPaint);
            this.mPaint.setColor(this.mCurrentColor);
        } else if (this.mNeedRing) {
            this.mPaint.setAlpha(ALPHA_OUTSTANDING);
            canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mRingWidth, this.mPaint);
            this.mPaint.setAlpha(this.mCurrentAlpha);
        } else {
            canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
        }
    }
}
