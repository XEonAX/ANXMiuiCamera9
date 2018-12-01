package com.android.camera.animation;

import android.view.View;
import android.view.animation.Interpolator;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class AnimationDelegate {
    public static final Interpolator DEFAULT_INTERPOLATOR = new CubicEaseOutInterpolator();

    public interface AnimationResource {

        @Retention(RetentionPolicy.SOURCE)
        public @interface DataChangeType {
        }

        boolean canProvide();

        boolean isEnableClick();

        void notifyAfterFrameAvailable(int i);

        void notifyDataChanged(int i, int i2);

        void provideAnimateElement(int i, List<Completable> list, boolean z);

        void provideRotateItem(List<View> list, int i);

        void setClickEnable(boolean z);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface AnimationType {
    }
}
