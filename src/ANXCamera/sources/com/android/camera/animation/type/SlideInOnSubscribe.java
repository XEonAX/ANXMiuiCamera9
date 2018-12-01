package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class SlideInOnSubscribe extends BaseOnSubScribe {
    private int mGravity;

    public SlideInOnSubscribe(View aniView, int gravity) {
        super(aniView);
        this.mGravity = gravity;
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        int srcX = 0;
        int srcY = 0;
        int viewWidth = Math.max(this.mAniView.getWidth(), this.mAniView.getLayoutParams().width);
        int viewHeight = Math.max(this.mAniView.getHeight(), this.mAniView.getLayoutParams().height);
        switch (this.mGravity) {
            case 3:
                srcX = -viewWidth;
                break;
            case 5:
                srcX = viewWidth;
                break;
            case 48:
                srcY = -viewHeight;
                break;
            case 80:
                srcY = viewHeight;
                break;
        }
        ViewCompat.setTranslationX(this.mAniView, (float) srcX);
        ViewCompat.setTranslationY(this.mAniView, (float) srcY);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).translationX(0.0f).translationY(0.0f);
    }

    public static void directSetResult(View aniView, int gravity) {
        ViewCompat.setTranslationX(aniView, 0.0f);
        ViewCompat.setTranslationY(aniView, 0.0f);
        ViewCompat.setAlpha(aniView, 1.0f);
        BaseOnSubScribe.setAnimateViewVisible(aniView, 0);
    }
}
