package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RelativeLayout;

public class V6RelativeLayout extends RelativeLayout {
    public V6RelativeLayout(Context context) {
        super(context);
    }

    public V6RelativeLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public View findChildrenById(int id) {
        return findViewById(id);
    }
}
