package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class AlphaInOnSubscribe extends BaseOnSubScribe {
    public AlphaInOnSubscribe(View aniView) {
        super(aniView);
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        ViewCompat.setAlpha(this.mAniView, 0.0f);
        return ViewCompat.animate(this.mAniView).alpha(1.0f);
    }

    public static void directSetResult(View aniView) {
        ViewCompat.setAlpha(aniView, 1.0f);
        BaseOnSubScribe.setAnimateViewVisible(aniView, 0);
    }
}
