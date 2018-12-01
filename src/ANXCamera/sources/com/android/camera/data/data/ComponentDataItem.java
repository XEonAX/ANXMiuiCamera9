package com.android.camera.data.data;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;

public final class ComponentDataItem {
    @StringRes
    public int mDisplayNameRes;
    @DrawableRes
    public int mIconRes;
    @DrawableRes
    public int mIconSelectedRes;
    public String mValue;

    public ComponentDataItem(@DrawableRes int iconRes, @DrawableRes int iconSelectedRes, @StringRes int nameRes, String value) {
        this.mIconRes = iconRes;
        this.mIconSelectedRes = iconSelectedRes;
        this.mDisplayNameRes = nameRes;
        this.mValue = value;
    }
}
