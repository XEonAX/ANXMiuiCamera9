package android.support.v4.widget;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.TextView;

class TextViewCompatJbMr1 {
    TextViewCompatJbMr1() {
    }

    public static void setCompoundDrawablesRelative(@NonNull TextView textView, @Nullable Drawable start, @Nullable Drawable top, @Nullable Drawable end, @Nullable Drawable bottom) {
        Drawable drawable;
        boolean rtl = false;
        if (textView.getLayoutDirection() == 1) {
            rtl = true;
        }
        if (rtl) {
            drawable = end;
        } else {
            drawable = start;
        }
        if (rtl) {
            end = start;
        }
        textView.setCompoundDrawables(drawable, top, end, bottom);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, @Nullable Drawable start, @Nullable Drawable top, @Nullable Drawable end, @Nullable Drawable bottom) {
        Drawable drawable;
        boolean rtl = false;
        if (textView.getLayoutDirection() == 1) {
            rtl = true;
        }
        if (rtl) {
            drawable = end;
        } else {
            drawable = start;
        }
        if (rtl) {
            end = start;
        }
        textView.setCompoundDrawablesWithIntrinsicBounds(drawable, top, end, bottom);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, int start, int top, int end, int bottom) {
        int i;
        boolean rtl = false;
        if (textView.getLayoutDirection() == 1) {
            rtl = true;
        }
        if (rtl) {
            i = end;
        } else {
            i = start;
        }
        if (rtl) {
            end = start;
        }
        textView.setCompoundDrawablesWithIntrinsicBounds(i, top, end, bottom);
    }
}
