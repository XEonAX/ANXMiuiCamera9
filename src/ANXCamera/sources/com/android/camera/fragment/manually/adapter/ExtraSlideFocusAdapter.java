package com.android.camera.fragment.manually.adapter;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.HorizontalSlideView;
import com.android.camera.ui.HorizontalSlideView.HorizontalDrawAdapter;
import com.android.camera.ui.HorizontalSlideView.OnItemSelectListener;

public class ExtraSlideFocusAdapter extends HorizontalDrawAdapter implements OnItemSelectListener {
    private static final int[] sTextActivatedColorState = new int[]{16843518};
    private static final int[] sTextDefaultColorState = new int[]{0};
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private CharSequence[] mEntries;
    private int mLineColorDefault;
    private float mLineHalfHeight;
    private int mLineLineGap;
    private int mLineTextGap;
    private int mLineWidth;
    private ManuallyListener mManuallyListener;
    private Paint mPaint;
    private ColorStateList mTextColor;
    private int mTextSize;
    private int mTrackedFocusPosition;

    public ExtraSlideFocusAdapter(Context context, ComponentData componentData, int currentMode, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = currentMode;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
        try {
            this.mTrackedFocusPosition = Integer.parseInt(this.mCurrentValue);
        } catch (NumberFormatException e) {
            this.mTrackedFocusPosition = 1000;
        }
        initStyle(context);
        CharSequence[] entries = new CharSequence[11];
        for (int i = 0; i <= 10; i++) {
            entries[i] = getDisplayedFocusValue(context, i * 10);
        }
        this.mEntries = entries;
    }

    private void initStyle(Context context) {
        TypedArray style = context.obtainStyledAttributes(R.style.SingeTextItemTextStyle, new int[]{16842901, 16842904});
        this.mTextSize = style.getDimensionPixelSize(style.getIndex(0), this.mTextSize);
        this.mTextColor = style.getColorStateList(style.getIndex(1));
        style.recycle();
        Resources resources = context.getResources();
        this.mLineHalfHeight = ((float) resources.getDimensionPixelSize(R.dimen.focus_line_height)) / 2.0f;
        this.mLineWidth = resources.getDimensionPixelSize(R.dimen.focus_line_width);
        this.mLineLineGap = resources.getDimensionPixelSize(R.dimen.focus_line_line_gap);
        this.mLineTextGap = resources.getDimensionPixelSize(R.dimen.focus_line_text_gap);
        this.mLineColorDefault = resources.getColor(R.color.manual_focus_line_color_default);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) this.mLineWidth);
        this.mPaint.setTextSize((float) this.mTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
    }

    private String getDisplayedFocusValue(Context context, int value) {
        if (value == 0) {
            return context.getString(R.string.pref_camera_focusmode_entry_auto);
        }
        return String.valueOf(value);
    }

    private void drawText(int index, Canvas canvas) {
        canvas.drawText(this.mEntries[index].toString(), 0.0f, ((-(this.mPaint.ascent() + this.mPaint.descent())) / 2.0f) + 1.0f, this.mPaint);
    }

    public void draw(int index, Canvas canvas, boolean selected) {
        int colorForState;
        if (index % 10 == 0) {
            Paint paint = this.mPaint;
            if (selected) {
                colorForState = this.mTextColor.getColorForState(sTextActivatedColorState, 0);
            } else {
                colorForState = this.mTextColor.getColorForState(sTextDefaultColorState, 0);
            }
            paint.setColor(colorForState);
            drawText(index / 10, canvas);
            return;
        }
        Paint paint2 = this.mPaint;
        if (selected) {
            colorForState = this.mTextColor.getColorForState(sTextActivatedColorState, 0);
        } else {
            colorForState = this.mLineColorDefault;
        }
        paint2.setColor(colorForState);
        canvas.drawLine(0.0f, -this.mLineHalfHeight, 0.0f, this.mLineHalfHeight, this.mPaint);
    }

    public float measureWidth(int index) {
        if (index % 10 == 0) {
            return this.mPaint.measureText(this.mEntries[index / 10].toString());
        }
        return (float) this.mLineWidth;
    }

    public float measureGap(int index) {
        if (index % 10 == 0 || (index + 1) % 10 == 0) {
            return (float) this.mLineTextGap;
        }
        return (float) this.mLineLineGap;
    }

    public Align getAlign(int index) {
        return Align.LEFT;
    }

    public int getCount() {
        return 101;
    }

    public void onItemSelect(HorizontalSlideView view, int index) {
        int focusPosition = mapIndexToFocus(index);
        if (!(view.isScrolling() || this.mTrackedFocusPosition == focusPosition)) {
            this.mTrackedFocusPosition = focusPosition;
            CameraStatUtil.trackFocusPositionChanged(focusPosition);
        }
        String newValue = String.valueOf(focusPosition);
        if (!newValue.equals(this.mCurrentValue)) {
            this.mComponentData.setComponentValue(this.mCurrentMode, newValue);
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, newValue, false);
            }
            this.mCurrentValue = newValue;
        }
    }

    public int mapFocusToIndex(int focusPosition) {
        return 100 - (Util.clamp(focusPosition, 0, 1000) / 10);
    }

    private int mapIndexToFocus(int index) {
        return 1000 - ((index * 1000) / 100);
    }
}
