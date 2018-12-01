package com.android.camera.fragment.manually.adapter;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.support.v7.recyclerview.R;
import android.text.Layout.Alignment;
import android.text.SpannableStringBuilder;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.TextAppearanceSpan;
import android.util.Spline;
import com.android.camera.ActivityBase;
import com.android.camera.Util;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.ui.HorizontalSlideView;
import com.android.camera.ui.HorizontalSlideView.HorizontalDrawAdapter;
import com.android.camera.ui.HorizontalSlideView.OnPositionSelectListener;

public class ExtraSlideZoomAdapter extends HorizontalDrawAdapter implements OnPositionSelectListener {
    private static final int[] sTextActivatedColorState = new int[]{16843518};
    private static final int[] sTextDefaultColorState = new int[]{0};
    private static float[] sX = new float[]{0.0f, 10.0f, 12.0f, 20.0f, 25.0f, 27.0f, 29.0f, 30.0f, 32.0f, 35.0f};
    private static float[] sY = new float[]{1.0f, 2.0f, 2.2f, 3.7f, 5.1f, 5.8f, 6.6f, 7.0f, 8.0f, 10.0f};
    private int ENTRY_INDEX_TELE_REAL = 10;
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private TextAppearanceSpan mDigitsTextStyle;
    private int mDotColorActivated;
    private int mDotRadius;
    private boolean mEnable;
    private CharSequence[] mEntries;
    private StaticLayout[] mEntryLayouts;
    private Spline mEntryToZoomRatioSpline;
    private int mLineColorDefault;
    private int mLineDotYGap;
    private float mLineHalfHeight;
    private int mLineLineGap;
    private int mLineTextGap;
    private int mLineWidth;
    private ManuallyListener mManuallyListener;
    private Paint mPaint;
    private ColorStateList mTextColor;
    private TextPaint mTextPaint;
    private int mTextSize;
    private TextAppearanceSpan mXTextStyle;
    private float mZoomRatioMax;
    private int mZoomRatioTele;
    private Spline mZoomRatioToEntrySpline;
    private int mZoomRatioWide;

    public ExtraSlideZoomAdapter(Context context, ComponentData componentData, int currentMode, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = currentMode;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
        BaseModule module = (BaseModule) ((ActivityBase) context).getCurrentModule();
        this.mZoomRatioWide = 1;
        this.mZoomRatioTele = 2;
        this.mZoomRatioMax = module.getZoomMaxRatio();
        float[] x = convertSplineXToEntryX(sX);
        float[] y = convertSplineYToZoomRatioY(sY);
        this.mEntryToZoomRatioSpline = Spline.createMonotoneCubicSpline(x, y);
        this.mZoomRatioToEntrySpline = Spline.createMonotoneCubicSpline(y, x);
        initStyle(context);
        CharSequence[] entries = new CharSequence[3];
        entries[0] = getDisplayedZoomRatio((float) this.mZoomRatioWide);
        entries[1] = getDisplayedZoomRatio((float) this.mZoomRatioTele);
        entries[2] = getDisplayedZoomRatio(this.mZoomRatioMax);
        this.mEntries = entries;
        this.mEntryLayouts = new StaticLayout[this.mEntries.length];
        for (int i = 0; i < this.mEntries.length; i++) {
            this.mEntryLayouts[i] = new StaticLayout(this.mEntries[i], this.mTextPaint, Util.sWindowWidth, Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
        }
        int zoomRatioTeleReal = Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getZoomRatioTeleReal();
        if (zoomRatioTeleReal != this.mZoomRatioTele * 10 && zoomRatioTeleReal > this.mZoomRatioWide * 10 && zoomRatioTeleReal < this.mZoomRatioTele * 10) {
            this.ENTRY_INDEX_TELE_REAL = zoomRatioTeleReal - (this.mZoomRatioWide * 10);
        }
    }

    private float[] convertSplineXToEntryX(float[] splineX) {
        int SPLINE_ENTRY_COUNT_2X_TO_MAX = (int) ((splineX[splineX.length - 1] - 10.0f) + 1.0f);
        float[] entryX = new float[splineX.length];
        for (int i = 0; i < splineX.length; i++) {
            if (splineX[i] <= 10.0f) {
                entryX[i] = splineX[i];
            } else {
                entryX[i] = (((splineX[i] - 10.0f) / ((float) (SPLINE_ENTRY_COUNT_2X_TO_MAX - 1))) * 37.0f) + 10.0f;
            }
        }
        return entryX;
    }

    private float[] convertSplineYToZoomRatioY(float[] splineY) {
        int SPLINE_ZOOM_MAX = (int) splineY[splineY.length - 1];
        float[] zoomRatioY = new float[splineY.length];
        for (int i = 0; i < splineY.length; i++) {
            if (splineY[i] <= ((float) this.mZoomRatioTele)) {
                zoomRatioY[i] = splineY[i];
            } else {
                zoomRatioY[i] = (((splineY[i] - ((float) this.mZoomRatioTele)) / ((float) (SPLINE_ZOOM_MAX - this.mZoomRatioTele))) * (this.mZoomRatioMax - ((float) this.mZoomRatioTele))) + ((float) this.mZoomRatioTele);
            }
        }
        return zoomRatioY;
    }

    private void initStyle(Context context) {
        TypedArray style = context.obtainStyledAttributes(R.style.SingeTextItemTextStyle, new int[]{16842901, 16842904});
        this.mTextSize = style.getDimensionPixelSize(style.getIndex(0), this.mTextSize);
        this.mTextColor = style.getColorStateList(style.getIndex(1));
        style.recycle();
        Resources resources = context.getResources();
        this.mLineHalfHeight = ((float) resources.getDimensionPixelSize(R.dimen.focus_line_height)) / 2.0f;
        this.mLineWidth = resources.getDimensionPixelSize(R.dimen.focus_line_width);
        this.mDotRadius = resources.getDimensionPixelSize(R.dimen.zoom_popup_dot_radius);
        this.mLineLineGap = resources.getDimensionPixelSize(R.dimen.focus_line_line_gap);
        this.mLineTextGap = resources.getDimensionPixelSize(R.dimen.focus_line_text_gap);
        this.mLineDotYGap = resources.getDimensionPixelSize(R.dimen.zoom_popup_line_dot_y_gap);
        this.mLineColorDefault = resources.getColor(R.color.zoom_popup_line_color_default);
        this.mDotColorActivated = resources.getColor(R.color.zoom_popup_dot_color_activated);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) this.mLineWidth);
        this.mPaint.setTextSize((float) this.mTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
        this.mTextPaint = new TextPaint(this.mPaint);
        this.mDigitsTextStyle = new TextAppearanceSpan(context, R.style.ZoomPopupDigitsTextStyle);
        this.mXTextStyle = new TextAppearanceSpan(context, R.style.ZoomPopupXTextStyle);
    }

    private CharSequence getDisplayedZoomRatio(float ratio) {
        SpannableStringBuilder builder = new SpannableStringBuilder();
        Util.appendInApi26(builder, String.valueOf((int) ratio), this.mDigitsTextStyle, 33);
        Util.appendInApi26(builder, "X", this.mXTextStyle, 33);
        return builder;
    }

    private int indexToSection(int index) {
        if (index == 0) {
            return 0;
        }
        if (index == 10) {
            return 1;
        }
        if (index == 47) {
            return 2;
        }
        return -1;
    }

    private void drawText(int sectionIndex, Canvas canvas) {
        float height = (float) (this.mEntryLayouts[sectionIndex].getLineAscent(0) - this.mEntryLayouts[sectionIndex].getLineDescent(0));
        canvas.save();
        canvas.translate(0.0f, height / 2.0f);
        this.mEntryLayouts[sectionIndex].draw(canvas);
        canvas.restore();
    }

    public void draw(int index, Canvas canvas, boolean selected) {
        if (index == 0 || index == 10 || index == 47) {
            int[] iArr;
            TextPaint textPaint = this.mTextPaint;
            if (selected) {
                iArr = sTextActivatedColorState;
            } else {
                iArr = sTextDefaultColorState;
            }
            textPaint.drawableState = iArr;
            drawText(indexToSection(index), canvas);
            return;
        }
        int colorForState;
        Paint paint = this.mPaint;
        if (selected) {
            colorForState = this.mTextColor.getColorForState(sTextActivatedColorState, 0);
        } else {
            colorForState = this.mLineColorDefault;
        }
        paint.setColor(colorForState);
        canvas.drawLine(0.0f, -this.mLineHalfHeight, 0.0f, this.mLineHalfHeight, this.mPaint);
        if (index == this.ENTRY_INDEX_TELE_REAL) {
            this.mPaint.setColor(selected ? this.mDotColorActivated : this.mLineColorDefault);
            canvas.drawCircle(0.0f, ((-this.mLineHalfHeight) - ((float) this.mLineDotYGap)) - ((float) this.mDotRadius), (float) this.mDotRadius, this.mPaint);
        }
    }

    public float measureWidth(int index) {
        if (index == 0 || index == 10 || index == 47) {
            return this.mEntryLayouts[indexToSection(index)].getLineWidth(0);
        }
        return (float) this.mLineWidth;
    }

    public float measureGap(int index) {
        if (index == 0 || index == 10 || index == 47) {
            return (float) this.mLineTextGap;
        }
        return (float) this.mLineLineGap;
    }

    public Align getAlign(int index) {
        if (index == 0 || index == 10 || index == 47) {
            return Align.LEFT;
        }
        return Align.CENTER;
    }

    public int getCount() {
        return 48;
    }

    public void onPositionSelect(HorizontalSlideView view, float positionRatio) {
        if (this.mEnable) {
            String newValue = String.valueOf(mapPositionToZoomRatio(positionRatio * ((float) (getCount() - 1))));
            if (!newValue.equals(this.mCurrentValue)) {
                this.mComponentData.setComponentValue(this.mCurrentMode, newValue);
                if (this.mManuallyListener != null) {
                    this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, newValue, false);
                }
                this.mCurrentValue = newValue;
            }
        }
    }

    public float mapZoomRatioToPosition(float zoomRatio) {
        return this.mZoomRatioToEntrySpline.interpolate(zoomRatio);
    }

    private float mapPositionToZoomRatio(float position) {
        return this.mEntryToZoomRatioSpline.interpolate(position);
    }

    public void setEnable(boolean enable) {
        this.mEnable = enable;
    }
}
