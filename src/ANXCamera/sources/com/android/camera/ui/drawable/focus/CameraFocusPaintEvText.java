package com.android.camera.ui.drawable.focus;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint.Align;
import android.graphics.Paint.Style;
import android.support.v7.recyclerview.R;
import com.android.camera.ui.drawable.CameraPaintBase;
import java.util.Locale;

public class CameraFocusPaintEvText extends CameraPaintBase {
    private final int mDefaultPaintAlpha = 192;
    private final int mDefaultPaintColor;
    private final int mDefaultTextSize;
    private int mEvTextMargin;
    private float mEvValue;

    public CameraFocusPaintEvText(Context context) {
        super(context);
        TypedArray textStyle = context.obtainStyledAttributes(R.style.SettingStatusBarText, new int[]{16842901, 16842904});
        this.mDefaultPaintColor = textStyle.getColor(textStyle.getIndex(1), -1);
        this.mDefaultTextSize = textStyle.getDimensionPixelSize(textStyle.getIndex(0), 0);
        textStyle.recycle();
        this.mEvTextMargin = context.getResources().getDimensionPixelSize(R.dimen.focus_view_ev_text_margin);
    }

    public void setEvValue(float evValue) {
        this.mEvValue = evValue;
    }

    protected void initPaint(Context context) {
        this.mPaint.setColor(this.mDefaultPaintColor);
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setTextSize((float) this.mDefaultTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
        this.mPaint.setAntiAlias(true);
        this.mPaint.setAlpha(192);
    }

    public void resetPaint() {
        initPaint(null);
    }

    protected void draw(Canvas canvas) {
        if (this.mEvValue != 0.0f) {
            String text = String.format(Locale.ENGLISH, "%s %.1f", new Object[]{this.mEvValue < 0.0f ? "-" : "+", Float.valueOf(Math.abs(this.mEvValue))});
            canvas.drawText(text, (this.mMiddleX - (this.mPaint.measureText(text) / 2.0f)) - (this.mPaint.measureText(symbol) / 2.0f), (this.mMiddleY - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) this.mEvTextMargin), this.mPaint);
        }
    }
}
