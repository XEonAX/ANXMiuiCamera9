package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.FrameLayout;

public class CameraRootView extends FrameLayout {
    private boolean mDisableTouchevt = false;

    public CameraRootView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (this.mDisableTouchevt && (ev.getActionMasked() == 0 || ev.getActionMasked() == 5)) {
            return true;
        }
        return super.dispatchTouchEvent(ev);
    }

    public void disableTouchEvent() {
        this.mDisableTouchevt = true;
    }

    public void enableTouchEvent() {
        this.mDisableTouchevt = false;
    }
}
