package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseOutInterpolator implements Interpolator {
    private final float fg;
    private final float fh;

    public ElasticEaseOutInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseOutInterpolator(float f, float f2) {
        this.fg = f;
        this.fh = f2;
    }

    public float getInterpolation(float f) {
        float f2 = this.fh;
        float f3 = this.fg;
        if (f == 0.0f) {
            return 0.0f;
        }
        if (f == 1.0f) {
            return 1.0f;
        }
        float f4;
        if (f2 == 0.0f) {
            f4 = 0.3f;
        } else {
            f4 = f2;
        }
        if (f3 == 0.0f || f3 < 1.0f) {
            f2 = f4 / 4.0f;
            f3 = 1.0f;
        } else {
            f2 = (float) ((((double) f4) / 6.283185307179586d) * Math.asin((double) (1.0f / f3)));
        }
        return (float) ((Math.sin((((double) (f - f2)) * 6.283185307179586d) / ((double) f4)) * (((double) f3) * Math.pow(2.0d, (double) (-10.0f * f)))) + 1.0d);
    }
}
