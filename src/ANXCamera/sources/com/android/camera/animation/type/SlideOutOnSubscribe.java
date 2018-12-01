package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class SlideOutOnSubscribe extends BaseOnSubScribe {
    private int mGravity;

    public SlideOutOnSubscribe(View aniView, int gravity) {
        super(aniView);
        this.mGravity = gravity;
    }

    protected ViewPropertyAnimatorCompat getAnimation() {
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 0);
        int dstX = 0;
        int dstY = 0;
        int viewWidth = Math.max(this.mAniView.getWidth(), this.mAniView.getLayoutParams().width);
        int viewHeight = Math.max(this.mAniView.getHeight(), this.mAniView.getLayoutParams().height);
        switch (this.mGravity) {
            case 3:
                dstX = -viewWidth;
                break;
            case 5:
                dstX = viewWidth;
                break;
            case 48:
                dstY = -viewHeight;
                break;
            case 80:
                dstY = viewHeight;
                break;
        }
        ViewCompat.setTranslationX(this.mAniView, 0.0f);
        ViewCompat.setTranslationY(this.mAniView, 0.0f);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).translationX((float) dstX).translationY((float) dstY);
    }

    protected void onAnimationEnd() {
        super.onAnimationEnd();
        BaseOnSubScribe.setAnimateViewVisible(this.mAniView, 4);
    }

    public static void directSetResult(View aniView, int gravity) {
        int dstX = 0;
        int dstY = 0;
        int viewWidth = Math.max(aniView.getWidth(), aniView.getLayoutParams().width);
        int viewHeight = Math.max(aniView.getHeight(), aniView.getLayoutParams().height);
        switch (gravity) {
            case 3:
                dstX = -viewWidth;
                break;
            case 5:
                dstX = viewWidth;
                break;
            case 48:
                dstY = -viewHeight;
                break;
            case 80:
                dstY = viewHeight;
                break;
        }
        ViewCompat.setTranslationX(aniView, (float) dstX);
        ViewCompat.setTranslationY(aniView, (float) dstY);
        ViewCompat.setAlpha(aniView, 1.0f);
        BaseOnSubScribe.setAnimateViewVisible(aniView, 4);
    }
}
