package com.android.camera.fragment.sticker.download;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.support.v7.recyclerview.R;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import miui.view.animation.CubicEaseOutInterpolator;

public class DownloadView extends RelativeLayout {
    private ImageView mImageView;
    private ObjectAnimator mRotationAnimal;

    private abstract class MyAnimalListener implements AnimatorListener {
        /* synthetic */ MyAnimalListener(DownloadView this$0, MyAnimalListener -this1) {
            this();
        }

        private MyAnimalListener() {
        }

        public void onAnimationStart(Animator animator) {
        }

        public void onAnimationCancel(Animator animator) {
        }

        public void onAnimationRepeat(Animator animator) {
        }
    }

    public DownloadView(Context context) {
        super(context);
        initView();
    }

    public DownloadView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    private void initView() {
        this.mImageView = new ImageView(getContext());
        addView(this.mImageView, -2, -2);
        ((LayoutParams) this.mImageView.getLayoutParams()).addRule(13);
    }

    public void startDownload() {
        clearAnimation();
        hide(this.mImageView, new MyAnimalListener(this) {
            public void onAnimationEnd(Animator animator) {
                this.doDownloading();
            }
        });
    }

    private void doDownloading() {
        this.mImageView.setImageResource(R.drawable.icon_sticker_downloading);
        show(this.mImageView, new MyAnimalListener(this) {
            public void onAnimationEnd(Animator animator) {
                this.rotation();
            }
        });
    }

    public void endDownloading() {
        clearAnimation();
        hide(this.mImageView, new MyAnimalListener(this) {
            public void onAnimationEnd(Animator animator) {
                this.mImageView.setImageResource(R.drawable.icon_sticker_downloaded);
                this.show(this.mImageView, new MyAnimalListener(this) {
                    public void onAnimationEnd(Animator animator) {
                        this.hide(this, null);
                    }
                });
            }
        });
    }

    public void clearAnimation() {
        super.clearAnimation();
        this.mImageView.clearAnimation();
        if (this.mRotationAnimal != null) {
            this.mRotationAnimal.end();
        }
    }

    public void setStateImage(int downloadState) {
        switch (downloadState) {
            case 0:
                clearAnimation();
                setVisibility(0);
                this.mImageView.setImageResource(R.drawable.icon_sticker_download);
                return;
            case 1:
                clearAnimation();
                setVisibility(8);
                return;
            case 2:
                clearAnimation();
                setVisibility(0);
                doDownloading();
                return;
            case 3:
                setVisibility(0);
                endDownloading();
                return;
            case 4:
                clearAnimation();
                setVisibility(0);
                this.mImageView.setImageResource(R.drawable.icon_sticker_download);
                return;
            default:
                return;
        }
    }

    private void show(View view, AnimatorListener listener) {
        PropertyValuesHolder valuesHolder1 = PropertyValuesHolder.ofFloat("alpha", new float[]{0.0f, 1.0f});
        PropertyValuesHolder valuesHolder2 = PropertyValuesHolder.ofFloat("scaleX", new float[]{0.6f, 1.0f});
        PropertyValuesHolder valuesHolder3 = PropertyValuesHolder.ofFloat("scaleY", new float[]{0.6f, 1.0f});
        ObjectAnimator objectAnimator = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[]{valuesHolder1, valuesHolder2, valuesHolder3});
        if (listener != null) {
            objectAnimator.addListener(listener);
        }
        objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
        objectAnimator.setDuration(350).start();
    }

    private void hide(View view, AnimatorListener listener) {
        PropertyValuesHolder valuesHolder1 = PropertyValuesHolder.ofFloat("alpha", new float[]{1.0f, 0.0f});
        PropertyValuesHolder valuesHolder2 = PropertyValuesHolder.ofFloat("scaleX", new float[]{1.0f, 0.6f});
        PropertyValuesHolder valuesHolder3 = PropertyValuesHolder.ofFloat("scaleY", new float[]{1.0f, 0.6f});
        ObjectAnimator objectAnimator = ObjectAnimator.ofPropertyValuesHolder(view, new PropertyValuesHolder[]{valuesHolder1, valuesHolder2, valuesHolder3});
        if (listener != null) {
            objectAnimator.addListener(listener);
        }
        objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
        objectAnimator.setDuration(250).start();
    }

    private void rotation() {
        if (this.mRotationAnimal == null) {
            this.mRotationAnimal = ObjectAnimator.ofFloat(this.mImageView, "rotation", new float[]{0.0f, 360.0f});
            this.mRotationAnimal.setRepeatCount(-1);
            this.mRotationAnimal.setInterpolator(new LinearInterpolator());
            this.mRotationAnimal.setDuration(1000);
        }
        this.mRotationAnimal.start();
    }
}
