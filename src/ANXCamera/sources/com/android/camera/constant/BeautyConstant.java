package com.android.camera.constant;

import android.content.res.Resources;
import com.android.camera.CameraAppImpl;
import com.android.camera.R;

public class BeautyConstant {
    public static final String LEVEL_ADVANCED;
    public static final String LEVEL_CLOSE;
    public static final String LEVEL_HIGH;
    public static final String LEVEL_LOW;
    public static final String LEVEL_MEDIUM;
    public static final String LEVEL_XHIGH;
    public static final String LEVEL_XXHIGH;
    public static final String LEVEL_XXXHIGH;

    static {
        Resources res = CameraAppImpl.getAndroidContext().getResources();
        LEVEL_CLOSE = res.getString(R.string.pref_face_beauty_close);
        LEVEL_LOW = res.getString(R.string.pref_face_beauty_low);
        LEVEL_MEDIUM = res.getString(R.string.pref_face_beauty_medium);
        LEVEL_HIGH = res.getString(R.string.pref_face_beauty_high);
        LEVEL_XHIGH = res.getString(R.string.pref_face_beauty_xhigh);
        LEVEL_XXHIGH = res.getString(R.string.pref_face_beauty_xxhigh);
        LEVEL_XXXHIGH = res.getString(R.string.pref_face_beauty_xxxhigh);
        LEVEL_ADVANCED = res.getString(R.string.pref_face_beauty_advanced);
    }
}
