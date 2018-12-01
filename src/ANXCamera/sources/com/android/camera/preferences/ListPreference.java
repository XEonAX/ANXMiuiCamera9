package com.android.camera.preferences;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.TypedValue;
import com.android.camera.R$styleable;
import com.android.camera.Util;

public class ListPreference extends CameraPreference {
    private final CharSequence[] mDefaultValues;
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private final boolean mHasPopup;
    private final String mKey;

    public ListPreference(Context context, AttributeSet attrs) {
        boolean z;
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R$styleable.ListPreference, 0, 0);
        this.mKey = (String) Util.checkNotNull(a.getString(0));
        String popup = a.getString(4);
        if (popup == null) {
            z = false;
        } else {
            z = Boolean.valueOf(popup).booleanValue();
        }
        this.mHasPopup = z;
        TypedValue tv = a.peekValue(1);
        if (tv == null || tv.type != 1) {
            this.mDefaultValues = new CharSequence[1];
            this.mDefaultValues[0] = a.getString(1);
        } else {
            this.mDefaultValues = a.getTextArray(1);
        }
        setEntries(a.getTextArray(3));
        setEntryValues(a.getTextArray(2));
        a.recycle();
    }

    public void setEntries(CharSequence[] entries) {
        if (entries == null) {
            entries = new CharSequence[0];
        }
        this.mEntries = entries;
    }

    public void setEntryValues(CharSequence[] values) {
        if (values == null) {
            values = new CharSequence[0];
        }
        this.mEntryValues = values;
    }
}
