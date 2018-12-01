package com.android.camera.ui.drawable.snap;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraSnapPaintSecond extends CameraPaintBase {
    public CameraSnapPaintSecond(Context context) {
        super(context);
    }

    protected void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setStrokeWidth(3.0f);
    }

    protected void draw(Canvas canvas) {
        float radius = this.mBaseRadius * this.mCurrentWidthPercent;
        for (int i = 0; i < 90; i++) {
            canvas.save();
            float currentAngel = (float) (i * 4);
            canvas.rotate(currentAngel, this.mMiddleX, this.mMiddleY);
            if (this.isRecording) {
                if (currentAngel == 0.0f && this.needZero) {
                    this.mPaint.setAlpha(ALPHA_OUTSTANDING);
                } else if (currentAngel < this.timeAngle) {
                    this.mPaint.setAlpha(this.isClockwise ? ALPHA_OUTSTANDING : ALPHA_HINT);
                } else {
                    this.mPaint.setAlpha(this.isClockwise ? ALPHA_HINT : ALPHA_OUTSTANDING);
                }
            }
            canvas.drawLine(this.mMiddleX, this.mMiddleY - radius, this.mMiddleX, 15.0f + (this.mMiddleY - radius), this.mPaint);
            canvas.restore();
        }
    }
}
