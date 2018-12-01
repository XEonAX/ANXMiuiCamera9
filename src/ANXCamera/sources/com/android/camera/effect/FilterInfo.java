package com.android.camera.effect;

import android.support.annotation.NonNull;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.InputDeviceCompat;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class FilterInfo implements Comparable<FilterInfo> {
    public static final int AI_SCENE_FILTER_ID_0_NONE = FILTER_ID_NONE;
    public static final int FILTER_ID_BLUR = getId(0, InputDeviceCompat.SOURCE_KEYBOARD);
    public static final int FILTER_ID_GAUSSIAN = getId(0, 260);
    public static final int FILTER_ID_GRADIENTER = getId(0, 258);
    public static final int FILTER_ID_NONE = getId(1, 512);
    public static final int FILTER_ID_PEAKINGMF = getId(0, 261);
    public static final int FILTER_ID_STICKER = getId(0, 262);
    public static final int FILTER_ID_TILTSHIFT = getId(0, 259);
    public static final int RENDER_ID_MAKEUP = getId(4, 769);
    private int mCategory;
    private int mIconResId;
    private int mIndex;
    private boolean mIsNeedRect;
    private int mNameResId;
    private int mOrder;

    @Retention(RetentionPolicy.SOURCE)
    public @interface FilterCategory {
    }

    public FilterInfo(int id, int order) {
        this(id, 0, 0, order);
    }

    public FilterInfo(int id, int nameResId, int iconResId, int order) {
        this(getCategory(id), getIndex(id), nameResId, iconResId, order);
    }

    public FilterInfo(int category, int index, int nameResId, int iconResId, int order) {
        this.mCategory = category;
        this.mIndex = index;
        this.mOrder = order;
        this.mNameResId = nameResId;
        this.mIconResId = iconResId;
    }

    public int getNameResId() {
        return this.mNameResId;
    }

    public int getIconResId() {
        return this.mIconResId;
    }

    public boolean isNeedRect() {
        return this.mIsNeedRect;
    }

    public void setNeedRect(boolean needRect) {
        this.mIsNeedRect = needRect;
    }

    public int getId() {
        return (this.mCategory << 16) | this.mIndex;
    }

    public static int getId(int category, int index) {
        return (category << 16) | index;
    }

    public static int getCategory(int id) {
        return id >> 16;
    }

    public static int getIndex(int id) {
        return SupportMenu.USER_MASK & id;
    }

    public int compareTo(@NonNull FilterInfo another) {
        if (this.mOrder == another.mOrder) {
            return 0;
        }
        return this.mOrder > another.mOrder ? 1 : -1;
    }

    public boolean equals(Object o) {
        if (o == null || ((o instanceof FilterInfo) ^ 1) != 0) {
            return false;
        }
        boolean z = this.mCategory == ((FilterInfo) o).mCategory && this.mIndex == ((FilterInfo) o).mIndex;
        return z;
    }
}
