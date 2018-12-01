package com.android.camera.ui;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.widget.TextView;

public class ColorActivateTextView extends TextView {
    private int mActivateColor;
    private int mNormalCor;

    public void setActivateColor(int activateColor) {
        this.mActivateColor = activateColor;
    }

    public void setNormalCor(int normalCor) {
        this.mNormalCor = normalCor;
    }

    public ColorActivateTextView(Context context) {
        super(context);
    }

    public ColorActivateTextView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public ColorActivateTextView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public void setActivated(boolean activated) {
        setTextColor(activated ? this.mActivateColor : this.mNormalCor);
        super.setActivated(activated);
    }
}
