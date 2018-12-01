package android.support.v4.animation;

import android.os.Build.VERSION;
import android.view.View;

public abstract class AnimatorCompatHelper {
    static AnimatorProvider IMPL;

    static {
        if (VERSION.SDK_INT < 12) {
            IMPL = new DonutAnimatorCompatProvider();
        } else {
            IMPL = new HoneycombMr1AnimatorCompatProvider();
        }
    }

    public static ValueAnimatorCompat emptyValueAnimator() {
        return IMPL.emptyValueAnimator();
    }

    AnimatorCompatHelper() {
    }

    public static void clearInterpolator(View view) {
        IMPL.clearInterpolator(view);
    }
}
