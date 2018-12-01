package com.android.camera.preferences;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import com.android.camera.R$styleable;

public class IconListPreference extends ListPreference {
    private boolean mEnabled = true;
    private int[] mIconIds;
    private int[] mImageIds;
    private int[] mLargeIconIds;
    private int mSingleIconId;

    public IconListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R$styleable.IconListPreference, 0, 0);
        Resources res = context.getResources();
        this.mSingleIconId = a.getResourceId(1, 0);
        this.mIconIds = getIds(res, a.getResourceId(0, 0));
        this.mLargeIconIds = getIds(res, a.getResourceId(2, 0));
        this.mImageIds = getIds(res, a.getResourceId(3, 0));
        a.recycle();
    }

    private int[] getIds(Resources res, int iconsRes) {
        if (iconsRes == 0) {
            return null;
        }
        TypedArray array = res.obtainTypedArray(iconsRes);
        int n = array.length();
        int[] ids = new int[n];
        for (int i = 0; i < n; i++) {
            ids[i] = array.getResourceId(i, 0);
        }
        array.recycle();
        return ids;
    }
}
