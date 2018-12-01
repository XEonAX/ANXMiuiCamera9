package com.android.camera.animation;

import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;

public class FragmentAnimationFactory {
    public static Animation wrapperAnimation(int... animationTypes) {
        AnimationSet animationSet = new AnimationSet(true);
        for (int animationType : animationTypes) {
            Animation animation;
            switch (animationType) {
                case 161:
                    animation = new AlphaAnimation(0.0f, 1.0f);
                    break;
                case 162:
                    animation = new AlphaAnimation(1.0f, 0.0f);
                    break;
                case 167:
                    animation = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, 1.0f, 1, 0.0f);
                    break;
                case 168:
                    animation = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, 0.0f, 1, 1.0f);
                    break;
                default:
                    return null;
            }
            if (animation != null) {
                animation.setDuration(200);
                animation.setInterpolator(AnimationDelegate.DEFAULT_INTERPOLATOR);
                animationSet.addAnimation(animation);
            }
        }
        return animationSet;
    }
}
