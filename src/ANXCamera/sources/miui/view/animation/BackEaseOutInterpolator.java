package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseOutInterpolator implements Interpolator {
    private final float fl;

    public BackEaseOutInterpolator() {
        this(0.0f);
    }

    public BackEaseOutInterpolator(float f) {
        this.fl = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.fl == 0.0f ? 1.70158f : this.fl;
        float f3 = f - 1.0f;
        return ((f2 + (f3 * (f2 + 1.0f))) * (f3 * f3)) + 1.0f;
    }
}
