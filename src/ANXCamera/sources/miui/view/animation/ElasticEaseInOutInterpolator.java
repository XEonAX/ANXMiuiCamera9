package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseInOutInterpolator implements Interpolator {
    private final float fi;
    private final float fj;

    public ElasticEaseInOutInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseInOutInterpolator(float f, float f2) {
        this.fi = f;
        this.fj = f2;
    }

    public float getInterpolation(float f) {
        float f2 = this.fj;
        float f3 = this.fi;
        if (f == 0.0f) {
            return 0.0f;
        }
        float f4 = f / 0.5f;
        if (f4 == 2.0f) {
            return 1.0f;
        }
        float f5;
        if (f2 == 0.0f) {
            f5 = 0.45000002f;
        } else {
            f5 = f2;
        }
        if (f3 == 0.0f || f3 < 1.0f) {
            f2 = f5 / 4.0f;
            f3 = 1.0f;
        } else {
            f2 = (float) ((((double) f5) / 6.283185307179586d) * Math.asin((double) (1.0f / f3)));
        }
        float f6;
        if (f4 < 1.0f) {
            f6 = f4 - 1.0f;
            return ((float) (Math.sin((((double) (f6 - f2)) * 6.283185307179586d) / ((double) f5)) * (((double) f3) * Math.pow(2.0d, (double) (10.0f * f6))))) * -0.5f;
        }
        f6 = f4 - 1.0f;
        return (float) (((Math.sin((((double) (f6 - f2)) * 6.283185307179586d) / ((double) f5)) * (((double) f3) * Math.pow(2.0d, (double) (-10.0f * f6)))) * 0.5d) + 1.0d);
    }
}
