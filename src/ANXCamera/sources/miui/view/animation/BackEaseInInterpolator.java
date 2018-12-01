package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseInInterpolator implements Interpolator {
    private final float fk;

    public BackEaseInInterpolator() {
        this(0.0f);
    }

    public BackEaseInInterpolator(float f) {
        this.fk = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.fk == 0.0f ? 1.70158f : this.fk;
        return (((1.0f + f2) * f) - f2) * (f * f);
    }
}
