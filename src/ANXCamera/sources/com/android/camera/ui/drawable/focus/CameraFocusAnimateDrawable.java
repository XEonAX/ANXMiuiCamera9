package com.android.camera.ui.drawable.focus;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.animation.PathInterpolator;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.drawable.CameraPaintBase;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class CameraFocusAnimateDrawable extends Drawable implements Animatable {
    public static int BIG_RADIUS;
    public static int CENTER_BASE_RADIUS;
    private int mEvAdjustVisible;
    private ValueAnimator mFocusingAnimator;
    private boolean mIsTouchFocus;
    private float mMiddleX = -1.0f;
    private float mMiddleY = -1.0f;
    private CameraFocusPaintBigCircle mPaintBigCircle;
    private CameraFocusPaintCenterIndicator mPaintCenterIndicator;
    private CameraFocusPaintEvAdjust mPaintEvAdjust;
    private CameraFocusPaintEvText mPaintEvText;
    private ValueAnimator mResetCenterAnimator;
    private AnimatorSet mSuccessAnimatorSet;
    private int mSuccessFlag;
    private ValueAnimator mTouchDownAnimator;
    @PendingState
    private int pendingState;

    @interface PendingState {
    }

    public CameraFocusAnimateDrawable(Context context) {
        BIG_RADIUS = context.getResources().getDimensionPixelSize(R.dimen.focus_big_radius);
        CENTER_BASE_RADIUS = context.getResources().getDimensionPixelSize(R.dimen.focus_center_base_radius);
        this.mPaintBigCircle = new CameraFocusPaintBigCircle(context);
        this.mPaintEvAdjust = new CameraFocusPaintEvAdjust(context);
        this.mPaintEvText = new CameraFocusPaintEvText(context);
        this.mPaintCenterIndicator = new CameraFocusPaintCenterIndicator(context);
        this.mPaintBigCircle.setTargetValues(1.0f, -1, 205, (float) Util.dpToPixel(1.0f));
        this.mPaintEvAdjust.setTargetValues(1.0f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
        this.mPaintEvText.setTargetValues(1.0f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
        this.mPaintCenterIndicator.setTargetValues(1.0f, -1, 240, (float) Util.dpToPixel(1.3f));
        this.mPaintBigCircle.setResult();
        this.mPaintEvAdjust.setResult();
        this.mPaintEvText.setResult();
        this.mPaintCenterIndicator.setResult();
    }

    public void setIndicatorData(CameraIndicatorState indicatorState, Bitmap bitmap) {
        this.mPaintCenterIndicator.setIndicatorData(indicatorState, bitmap);
    }

    public void setLockIndicatorData(CameraIndicatorState indicatorState, Bitmap head, Bitmap body) {
        this.mPaintCenterIndicator.setAEAFIndicatorData(indicatorState, head, body);
    }

    public void setRtlAndDisplayRect(boolean rtl, Rect rect) {
        this.mPaintEvAdjust.setRtlAndDisplayRect(rtl, rect);
    }

    public void setOrientation(int orientation) {
        this.mPaintEvAdjust.setOrientation(orientation);
    }

    public void setCenter(int x, int y) {
        this.mMiddleX = (float) x;
        this.mMiddleY = (float) y;
        this.mPaintBigCircle.setMiddle((float) x, (float) y, (float) BIG_RADIUS);
        this.mPaintEvAdjust.setMiddle((float) x, (float) y, (float) BIG_RADIUS);
        this.mPaintEvAdjust.setShowLine(false);
        this.mPaintEvAdjust.setVisible(8);
        this.mPaintEvText.setMiddle((float) x, (float) y, (float) BIG_RADIUS);
        this.mPaintCenterIndicator.setCenterFlag(1);
        this.mPaintCenterIndicator.setMiddle((float) x, (float) y, (float) CENTER_BASE_RADIUS);
    }

    public void reset() {
        this.mPaintEvAdjust.setShowLine(false);
        this.mPaintEvAdjust.setDistanceY(0.0f);
        this.mPaintEvAdjust.setEvValue(0.0f);
        this.mPaintEvText.setEvValue(0.0f);
    }

    public void setEvTextVisible(int visible) {
        this.mPaintEvText.setVisible(visible);
    }

    public void setEvAdjustVisible(int visible) {
        this.mEvAdjustVisible = visible;
        invalidateSelf();
    }

    public void start() {
    }

    public void stop() {
    }

    public boolean isRunning() {
        return this.mFocusingAnimator != null ? this.mFocusingAnimator.isRunning() : false;
    }

    public void draw(@NonNull Canvas canvas) {
        if (canvas != null && this.mMiddleX != -1.0f && this.mMiddleY != -1.0f) {
            canvas.save();
            this.mPaintBigCircle.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mPaintCenterIndicator.drawCanvas(canvas);
            canvas.restore();
            if (this.mEvAdjustVisible != 8) {
                canvas.save();
                this.mPaintEvAdjust.drawCanvas(canvas);
                canvas.restore();
            }
            canvas.save();
            if (this.mSuccessFlag == 5) {
                this.mPaintEvText.setCurrentColor(16763904);
                this.mPaintEvText.setCurrentAlpha(192);
            } else {
                this.mPaintEvText.resetPaint();
            }
            this.mPaintEvText.drawCanvas(canvas);
            canvas.restore();
        }
    }

    public void startTouchDownAnimation() {
        cancelFocusingAnimation();
        cancelSuccessAnimation();
        cancelResetCenter();
        this.pendingState = -1;
        if (isAnimatorRunning(this.mTouchDownAnimator)) {
            this.mTouchDownAnimator.cancel();
            this.mTouchDownAnimator = null;
        }
        this.mPaintBigCircle.setCurrentColor(-1).setTargetColor(-1);
        this.mPaintCenterIndicator.setCurrentColor(-1).setTargetColor(-1);
        this.mPaintEvAdjust.setCurrentColor(-1).setTargetColor(-1);
        this.mTouchDownAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mTouchDownAnimator.setDuration(300);
        this.mTouchDownAnimator.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float t) {
                float value = super.getInterpolation(t);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(value);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(value);
                CameraFocusAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        this.mTouchDownAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentWidthPercent(1.1f).setTargetWidthPercent(0.94f);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentAlpha(0).setTargetAlpha(205);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(1);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(0.85f).setTargetWidthPercent(1.0f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(0).setTargetAlpha(255);
            }

            public void onAnimationEnd(Animator animation) {
                if (CameraFocusAnimateDrawable.this.mTouchDownAnimator != null) {
                    CameraFocusAnimateDrawable.this.mTouchDownAnimator.cancel();
                    CameraFocusAnimateDrawable.this.mTouchDownAnimator = null;
                }
                switch (CameraFocusAnimateDrawable.this.pendingState) {
                    case 1:
                        CameraFocusAnimateDrawable.this.startFocusSuccessAnimation(CameraFocusAnimateDrawable.this.mSuccessFlag, CameraFocusAnimateDrawable.this.mIsTouchFocus);
                        return;
                    case 3:
                        CameraFocusAnimateDrawable.this.startFocusFailAnimation();
                        return;
                    default:
                        CameraFocusAnimateDrawable.this.startFocusingAnimation();
                        return;
                }
            }

            public void onAnimationCancel(Animator animation) {
            }

            public void onAnimationRepeat(Animator animation) {
            }
        });
        this.mTouchDownAnimator.start();
    }

    private void startFocusingAnimation() {
        cancelFocusingAnimation();
        this.mFocusingAnimator = ValueAnimator.ofFloat(new float[]{1.0f, 0.95f});
        this.mFocusingAnimator.setInterpolator(new SineEaseInOutInterpolator());
        this.mFocusingAnimator.setDuration(200);
        this.mFocusingAnimator.setRepeatMode(2);
        this.mFocusingAnimator.setRepeatCount(-1);
        this.mFocusingAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.mCurrentWidthPercent = ((Float) animation.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        this.mFocusingAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
            }

            public void onAnimationEnd(Animator animation) {
                if (CameraFocusAnimateDrawable.this.mPaintCenterIndicator.mCurrentWidthPercent == 1.0f) {
                    CameraFocusAnimateDrawable.this.cancelFocusingAnimation();
                    switch (CameraFocusAnimateDrawable.this.pendingState) {
                        case 2:
                            CameraFocusAnimateDrawable.this.startFocusSuccessAnimation(CameraFocusAnimateDrawable.this.mSuccessFlag, CameraFocusAnimateDrawable.this.mIsTouchFocus);
                            return;
                        case 4:
                            CameraFocusAnimateDrawable.this.startFocusFailAnimation();
                            return;
                        default:
                            return;
                    }
                }
            }

            public void onAnimationCancel(Animator animation) {
            }

            public void onAnimationRepeat(Animator animation) {
            }
        });
        this.mFocusingAnimator.start();
    }

    public void startFocusSuccessAnimation(int successFlag, boolean isTouchFocus) {
        cancelFocusingAnimation();
        this.mSuccessFlag = successFlag;
        this.mIsTouchFocus = isTouchFocus;
        if (!this.mIsTouchFocus) {
            this.mSuccessFlag = 1;
        }
        if (isAnimatorRunning(this.mTouchDownAnimator)) {
            this.pendingState = 1;
        } else if (isAnimatorRunning(this.mFocusingAnimator)) {
            this.pendingState = 2;
        } else if (this.mPaintEvAdjust.getVisible() != 0) {
            if (this.mSuccessFlag == 2 || this.mSuccessFlag == 5) {
                this.mPaintCenterIndicator.setCenterFlag(this.mSuccessFlag);
            }
            if (this.mSuccessFlag == 5) {
                start3ALockSuccessAnimation();
            } else {
                startNormalFocusSuccessAnimation();
            }
        }
    }

    private void startNormalFocusSuccessAnimation() {
        if (this.mIsTouchFocus) {
            this.mPaintEvAdjust.setVisible(0);
        }
        this.mPaintEvAdjust.setStartOffsetY((float) Util.dpToPixel(2.5f));
        this.mPaintEvAdjust.setCurrentAlpha(0).setTargetAlpha(255);
        this.mPaintBigCircle.setTargetWidthPercent(1.0f);
        this.mPaintCenterIndicator.setTargetWidthPercent(0.85f);
        ValueAnimator successAnimation = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        successAnimation.setDuration(200);
        successAnimation.setInterpolator(new CubicEaseInOutInterpolator() {
            public float getInterpolation(float t) {
                float value = super.getInterpolation(t);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(value);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(value);
                CameraFocusAnimateDrawable.this.mPaintEvAdjust.updateValue(value);
                CameraFocusAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        successAnimation.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
            }

            public void onAnimationEnd(Animator animation) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(CameraFocusAnimateDrawable.this.mSuccessFlag);
                if (CameraFocusAnimateDrawable.this.mPaintEvAdjust.getEvValue() > 0.0f) {
                    CameraFocusAnimateDrawable.this.mPaintEvAdjust.setShowLine(true);
                }
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }

            public void onAnimationCancel(Animator animation) {
            }

            public void onAnimationRepeat(Animator animation) {
            }
        });
        successAnimation.start();
    }

    private void start3ALockSuccessAnimation() {
        this.mSuccessAnimatorSet = new AnimatorSet();
        if (this.mIsTouchFocus) {
            this.mPaintEvAdjust.setVisible(0);
        }
        this.mPaintEvAdjust.setStartOffsetY((float) Util.dpToPixel(2.5f));
        this.mPaintEvAdjust.setCurrentAlpha(0).setTargetAlpha(255);
        ValueAnimator circleFirstAnimation = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        circleFirstAnimation.setDuration(200);
        circleFirstAnimation.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                float value = ((Float) animation.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(value);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(value);
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        circleFirstAnimation.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animation) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(1);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentWidthPercent(1.0f).setTargetWidthPercent(1.35f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(1.0f).setTargetWidthPercent(0.9f);
            }
        });
        ValueAnimator circleSecondAnimation = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        circleSecondAnimation.setDuration(200);
        circleSecondAnimation.setStartDelay(200);
        circleSecondAnimation.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                float value = ((Float) animation.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(value);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(value);
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        circleSecondAnimation.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animation) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(1);
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentWidthPercent(1.35f).setTargetWidthPercent(1.0f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(0.9f).setTargetWidthPercent(0.5f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(255).setTargetAlpha(0);
            }
        });
        ValueAnimator lockAnimation = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        lockAnimation.setDuration(300);
        lockAnimation.setStartDelay(400);
        lockAnimation.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                float value = ((Float) animation.getAnimatedValue()).floatValue();
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(value);
                CameraFocusAnimateDrawable.this.mPaintEvAdjust.updateValue(value);
                CameraFocusAnimateDrawable.this.invalidateSelf();
            }
        });
        lockAnimation.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animation) {
                CameraFocusAnimateDrawable.this.mPaintBigCircle.setCurrentColor(16763904).setTargetColor(16763904);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentColor(16763904).setTargetColor(16763904);
                CameraFocusAnimateDrawable.this.mPaintEvAdjust.setCurrentColor(16763904).setTargetColor(16763904);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(5);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentWidthPercent(1.0f).setTargetWidthPercent(1.0f);
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCurrentAlpha(0).setTargetAlpha(255);
            }
        });
        this.mSuccessAnimatorSet.playTogether(new Animator[]{circleFirstAnimation, circleSecondAnimation, lockAnimation});
        this.mSuccessAnimatorSet.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 0.1f));
        this.mSuccessAnimatorSet.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animation) {
                CameraFocusAnimateDrawable.this.mPaintCenterIndicator.setCenterFlag(CameraFocusAnimateDrawable.this.mSuccessFlag);
                if (CameraFocusAnimateDrawable.this.mPaintEvAdjust.getEvValue() > 0.0f) {
                    CameraFocusAnimateDrawable.this.mPaintEvAdjust.setShowLine(true);
                }
                CameraFocusAnimateDrawable.this.invalidateSelf();
                super.onAnimationEnd(animation);
            }
        });
        this.mSuccessAnimatorSet.start();
    }

    public void startFocusFailAnimation() {
        cancelFocusingAnimation();
        if (isAnimatorRunning(this.mTouchDownAnimator)) {
            this.pendingState = 3;
        } else if (isAnimatorRunning(this.mFocusingAnimator)) {
            this.pendingState = 4;
        } else {
            this.mPaintBigCircle.setTargetWidthPercent(1.0f).setTargetAlpha(0);
            this.mPaintCenterIndicator.setTargetWidthPercent(0.95f).setTargetAlpha(0);
            ValueAnimator failAnimation = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            failAnimation.setDuration(200);
            failAnimation.setInterpolator(new CubicEaseInOutInterpolator() {
                public float getInterpolation(float t) {
                    float value = super.getInterpolation(t);
                    CameraFocusAnimateDrawable.this.mPaintBigCircle.updateValue(value);
                    CameraFocusAnimateDrawable.this.mPaintCenterIndicator.updateValue(value);
                    CameraFocusAnimateDrawable.this.invalidateSelf();
                    return value;
                }
            });
            failAnimation.start();
        }
    }

    public void setEvChanged(float distanceY, float evValue) {
        this.mPaintEvAdjust.setEvValue(evValue);
        this.mPaintEvAdjust.setShowLine(true);
        this.mPaintEvAdjust.setDistanceY(distanceY);
        this.mPaintEvText.setEvValue(evValue);
        invalidateSelf();
    }

    public void cancelFocusingAnimation() {
        if (this.mFocusingAnimator != null && this.mFocusingAnimator.isRunning()) {
            this.mFocusingAnimator.cancel();
        }
        this.mFocusingAnimator = null;
    }

    private void cancelSuccessAnimation() {
        if (this.mSuccessAnimatorSet != null && this.mSuccessAnimatorSet.isRunning()) {
            this.mSuccessAnimatorSet.cancel();
        }
        this.mSuccessAnimatorSet = null;
    }

    public void cancelResetCenter() {
        if (this.mResetCenterAnimator != null && this.mResetCenterAnimator.isRunning()) {
            this.mResetCenterAnimator.cancel();
        }
    }

    private boolean isAnimatorRunning(Animator animator) {
        return animator != null ? animator.isRunning() : false;
    }

    public void setAlpha(@IntRange(from = 0, to = 255) int alpha) {
    }

    public void setColorFilter(@Nullable ColorFilter colorFilter) {
    }

    public int getOpacity() {
        return -1;
    }
}
