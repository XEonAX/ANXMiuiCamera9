package com.android.camera.ui.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

public class PanoramaArrowAnimateDrawable extends Drawable {
    private Paint mPaint = new Paint();
    private float mTransformationRatio;

    public PanoramaArrowAnimateDrawable() {
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setColor(-1);
        this.mPaint.setAntiAlias(true);
        setTransformationRatio(2.0f);
    }

    public float getTransformationRatio() {
        return this.mTransformationRatio;
    }

    public void setTransformationRatio(float ratio) {
        this.mTransformationRatio = ratio;
        invalidateSelf();
    }

    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        int w = bounds.width();
        int h = bounds.height();
        Path path = new Path();
        path.moveTo(0.0f, ((2.0f - this.mTransformationRatio) * ((float) h)) / 4.0f);
        path.lineTo(0.0f, ((this.mTransformationRatio + 2.0f) * ((float) h)) / 4.0f);
        path.lineTo((float) w, (((2.0f - this.mTransformationRatio) + 2.0f) * ((float) h)) / 4.0f);
        path.lineTo((float) w, ((2.0f - (2.0f - this.mTransformationRatio)) * ((float) h)) / 4.0f);
        path.lineTo(0.0f, ((2.0f - this.mTransformationRatio) * ((float) h)) / 4.0f);
        path.close();
        canvas.drawPath(path, this.mPaint);
    }

    public void setAlpha(int alpha) {
    }

    public void setColorFilter(ColorFilter cf) {
    }

    public int getOpacity() {
        return -1;
    }
}
