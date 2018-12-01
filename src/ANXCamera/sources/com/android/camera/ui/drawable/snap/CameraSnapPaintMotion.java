package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintMotion extends CameraPaintBase {
    public CameraSnapPaintMotion(Context context) {
        super(context);
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth(3.0f);
    }

    protected void draw(Canvas canvas) {
        float radius = this.mBaseRadius * this.mCurrentWidthPercent;
        for (int i = 0; i < 40; i++) {
            canvas.save();
            float currentAngel = (float) (i * 9);
            canvas.rotate(currentAngel, this.mMiddleX, this.mMiddleY);
            int lineWidth = 12;
            int alpha = this.mCurrentAlpha;
            if (this.isRecording) {
                if (currentAngel == 0.0f && this.needZero) {
                    this.mPaint.setAlpha(ALPHA_OUTSTANDING);
                } else if (currentAngel < this.timeAngle) {
                    this.mPaint.setAlpha(this.isClockwise ? ALPHA_OUTSTANDING : ALPHA_HINT);
                } else {
                    this.mPaint.setAlpha(this.isClockwise ? ALPHA_HINT : ALPHA_OUTSTANDING);
                }
                if (currentAngel % 90.0f == 0.0f) {
                    lineWidth = 19;
                }
            } else if (currentAngel % 90.0f == 0.0f) {
                lineWidth = 19;
            }
            canvas.drawLine(this.mMiddleX, this.mMiddleY - radius, this.mMiddleX, ((float) lineWidth) + (this.mMiddleY - radius), this.mPaint);
            this.mPaint.setAlpha(alpha);
            canvas.restore();
        }
        if (this.isRecording) {
            canvas.rotate(this.timeAngle, this.mMiddleX, this.mMiddleY);
            int lastAlpha = this.mCurrentAlpha;
            this.mPaint.setAlpha(ALPHA_OUTSTANDING);
            canvas.drawLine(this.mMiddleX, this.mMiddleY - radius, this.mMiddleX, 19.0f + (this.mMiddleY - radius), this.mPaint);
            this.mPaint.setAlpha(lastAlpha);
        }
    }
}
