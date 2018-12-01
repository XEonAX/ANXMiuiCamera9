package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintRound extends CameraPaintBase {
    private float mCurrentRoundRectRadius;
    private RectF mRectF;
    private float mRoundingProgress = 1.0f;

    public CameraSnapPaintRound(Context context) {
        super(context);
    }

    public void prepareRecord() {
        this.mCurrentRoundRectRadius = this.mCurrentWidthPercent;
        this.mRoundingProgress = 1.0f;
    }

    public void updateRecordValue(float value, boolean down) {
        if (down) {
            this.mRoundingProgress = 1.0f - (0.65f * value);
            this.mCurrentRoundRectRadius = this.mCurrentWidthPercent - ((this.mCurrentWidthPercent - 0.265f) * value);
            return;
        }
        this.mRoundingProgress = (0.65f * value) + 0.35f;
        this.mCurrentRoundRectRadius = ((this.mCurrentWidthPercent - 0.265f) * value) + 0.265f;
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.FILL);
        this.mRectF = new RectF();
    }

    protected void draw(Canvas canvas) {
        if (this.isRecording) {
            float radius = this.mBaseRadius * this.mCurrentRoundRectRadius;
            float top = this.mMiddleY - radius;
            this.mRectF.set(this.mMiddleX - radius, top, this.mMiddleX + radius, this.mMiddleY + radius);
            canvas.drawRoundRect(this.mRectF, this.mRoundingProgress * radius, this.mRoundingProgress * radius, this.mPaint);
            return;
        }
        canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
    }
}
