package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class TranslateYOnSubscribe extends BaseOnSubScribe {
    private int mDistanceY;

    public TranslateYOnSubscribe(View aniView, int distanceY) {
        super(aniView);
        this.mDistanceY = distanceY;
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        return ViewCompat.animate(this.mAniView).translationY((float) this.mDistanceY);
    }

    public static void directSetResult(View aniView, int distanceY) {
        BaseOnSubScribe.setAnimateViewVisible(aniView, 0);
        ViewCompat.setTranslationY(aniView, (float) distanceY);
    }
}
