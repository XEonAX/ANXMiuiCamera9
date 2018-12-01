package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateXOnSubscribe;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class LastAnimationComponent {
    public static final Interpolator DEFAULT_INTERPOLATOR = new CubicEaseOutInterpolator();
    public View mAnchorView;
    public List<View> mHidedViews;
    public RecyclerView mRecyclerView;
    public int mReverseLeft;
    public int mReverseRecyclerViewLeft;
    public boolean mShown;

    public boolean reverse(boolean anim) {
        if (!this.mShown) {
            return false;
        }
        this.mShown = false;
        if (this.mHidedViews != null) {
            for (View view : this.mHidedViews) {
                if (anim) {
                    Completable.create(new AlphaInOnSubscribe(view).setDurationTime(300).setInterpolator(new SineEaseInOutInterpolator()).setStartDelayTime(150)).subscribe();
                } else {
                    AlphaInOnSubscribe.directSetResult(view);
                }
            }
            this.mHidedViews.clear();
            this.mHidedViews = null;
        }
        if (this.mAnchorView != null) {
            if (anim) {
                Completable.create(new TranslateXOnSubscribe(this.mAnchorView, this.mReverseLeft - this.mAnchorView.getLeft()).setDurationTime(300).setInterpolator(DEFAULT_INTERPOLATOR)).subscribe();
            } else {
                TranslateXOnSubscribe.directSetResult(this.mAnchorView, this.mReverseLeft - this.mAnchorView.getLeft());
            }
            this.mAnchorView = null;
        }
        if (anim) {
            ViewCompat.animate(this.mRecyclerView).alpha(0.0f).translationX((float) (this.mReverseRecyclerViewLeft - this.mRecyclerView.getLeft())).setDuration(300).setInterpolator(DEFAULT_INTERPOLATOR).withEndAction(new Runnable() {
                public void run() {
                    LastAnimationComponent.this.mRecyclerView.setVisibility(4);
                    LastAnimationComponent.this.mRecyclerView = null;
                }
            }).start();
        } else {
            ViewCompat.setAlpha(this.mRecyclerView, 0.0f);
            ViewCompat.setTranslationX(this.mRecyclerView, (float) (this.mReverseRecyclerViewLeft - this.mRecyclerView.getLeft()));
            this.mRecyclerView.setVisibility(4);
            this.mRecyclerView = null;
        }
        return true;
    }

    public void hideOtherViews(int tag, List<ImageView> views) {
        if (!this.mShown) {
            this.mShown = true;
            if (this.mHidedViews == null) {
                this.mHidedViews = new ArrayList();
            } else {
                this.mHidedViews.clear();
            }
            for (ImageView view : views) {
                if (!(((Integer) view.getTag()).intValue() == tag || view.getVisibility() != 0 || view.getAlpha() == 0.0f)) {
                    this.mHidedViews.add(view);
                    Completable.create(new AlphaOutOnSubscribe(view).setInterpolator(DEFAULT_INTERPOLATOR).setDurationTime(150)).subscribe();
                }
            }
        }
    }
}
