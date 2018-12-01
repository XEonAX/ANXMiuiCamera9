package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class TranslateXOnSubscribe extends BaseOnSubScribe {
    private int mDistanceX;

    public TranslateXOnSubscribe(View aniView, int distanceX) {
        super(aniView);
        this.mDistanceX = distanceX;
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        return ViewCompat.animate(this.mAniView).translationX((float) this.mDistanceX);
    }

    public static void directSetResult(View aniView, int distanceX) {
        BaseOnSubScribe.setAnimateViewVisible(aniView, 0);
        ViewCompat.setTranslationX(aniView, (float) distanceX);
    }
}
