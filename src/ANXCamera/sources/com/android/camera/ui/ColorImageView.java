package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.support.annotation.ColorInt;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.widget.ImageView;

public class ColorImageView extends ImageView {
    private int mColor;
    private Paint mPaint;

    public ColorImageView(Context context) {
        super(context);
        init();
    }

    public ColorImageView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ColorImageView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        ViewCompat.setLayerType(this, 2, null);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
        this.mPaint.setColor(0);
    }

    public void setColor(@ColorInt int color) {
        this.mColor = color;
        this.mPaint.setColor(color);
    }

    public void setColorAndRefresh(@ColorInt int color) {
        setColor(color);
        invalidate();
    }

    protected void onDraw(Canvas canvas) {
        if (this.mColor == 0) {
            super.onDraw(canvas);
            return;
        }
        int saveLayerCount = canvas.saveLayer(0.0f, 0.0f, (float) getWidth(), (float) getHeight(), null, 31);
        super.onDraw(canvas);
        canvas.drawPaint(this.mPaint);
        canvas.restoreToCount(saveLayerCount);
    }
}
