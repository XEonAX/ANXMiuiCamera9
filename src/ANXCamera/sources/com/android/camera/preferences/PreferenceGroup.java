package com.android.camera.preferences;

import android.content.Context;
import android.util.AttributeSet;
import java.util.ArrayList;

public class PreferenceGroup extends CameraPreference {
    private ArrayList<CameraPreference> list = new ArrayList();

    public PreferenceGroup(Context context, AttributeSet attrs) {
        super(context, attrs);
    }
}
