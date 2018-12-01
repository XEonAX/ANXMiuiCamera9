package com.android.camera.ui.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.drawable.Drawable;

public class TriangleIndicatorDrawable extends Drawable {
    private int mHeight;
    private Paint mPaint = new Paint();
    private Path mPath = new Path();
    private int mWidth;

    public TriangleIndicatorDrawable() {
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setColor(-1);
        this.mPaint.setAntiAlias(true);
    }

    public void setWidth(int width) {
        this.mWidth = width;
    }

    public void setHeight(int height) {
        this.mHeight = height;
    }

    public void draw(Canvas canvas) {
        int w = this.mWidth;
        int h = this.mHeight;
        this.mPath.reset();
        this.mPath.moveTo(0.0f, (float) ((-h) / 2));
        this.mPath.lineTo((float) w, 0.0f);
        this.mPath.lineTo(0.0f, (float) (h / 2));
        this.mPath.close();
        canvas.drawPath(this.mPath, this.mPaint);
    }

    public void setAlpha(int alpha) {
    }

    public void setColorFilter(ColorFilter cf) {
    }

    public int getOpacity() {
        return -1;
    }

    public int getIntrinsicWidth() {
        return this.mWidth;
    }

    public int getIntrinsicHeight() {
        return this.mHeight;
    }
}
