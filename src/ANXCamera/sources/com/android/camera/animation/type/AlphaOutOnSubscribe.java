package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class AlphaOutOnSubscribe extends BaseOnSubScribe {
    public AlphaOutOnSubscribe(View aniView) {
        super(aniView);
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).alpha(0.0f);
    }

    protected void onAnimationEnd() {
        super.onAnimationEnd();
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 4);
    }

    public static void directSetResult(View aniView) {
        BaseOnSubScribe.setAnimateViewVisible(aniView, 4);
    }
}
