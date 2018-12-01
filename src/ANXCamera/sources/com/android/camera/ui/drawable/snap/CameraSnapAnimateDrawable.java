package com.android.camera.ui.drawable.snap;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.BounceInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import com.android.camera.Util;
import com.android.camera.ui.drawable.CameraPaintBase;
import com.facebook.rebound.SpringConfig;
import miui.view.animation.CubicEaseOutInterpolator;

public class CameraSnapAnimateDrawable extends Drawable implements Animatable {
    private static final SpringConfig mCameraDownConfig = SpringConfig.fromOrigamiTensionAndFriction(100.0d, 15.0d);
    public static final SpringConfig mCameraUpConfig = SpringConfig.fromOrigamiTensionAndFriction(120.0d, 30.0d);
    public static final SpringConfig mCameraUpSplashConfig = SpringConfig.fromOrigamiTensionAndFriction(180.0d, 10.0d);
    public static final SpringConfig mRecordScaleConfig = SpringConfig.fromOrigamiTensionAndFriction(180.0d, 30.0d);
    private CameraSnapPaintCircle mCirclePaintItem;
    private LongPressIncreaseListener mLongPressIncreaseListener = new LongPressIncreaseListener() {
    };
    private ValueAnimator mModeChangeAnimator;
    private CameraSnapPaintMotion mMotionPaintItem;
    private CameraPaintBase mRecordingPaint;
    private ValueAnimator mRingAnimator;
    private CameraSnapPaintRound mRoundPaintItem;
    private CameraSnapPaintSecond mSecondPaintItem;
    private ValueAnimator mTimeAnimator;

    public interface LongPressIncreaseListener {
    }

    public CameraSnapAnimateDrawable(Context context) {
        this.mCirclePaintItem = new CameraSnapPaintCircle(context);
        this.mRoundPaintItem = new CameraSnapPaintRound(context);
        this.mSecondPaintItem = new CameraSnapPaintSecond(context);
        this.mMotionPaintItem = new CameraSnapPaintMotion(context);
    }

    public void initMode(int currentMode) {
        initTargetValues(currentMode);
        this.mCirclePaintItem.setResult();
        this.mRoundPaintItem.setResult();
        this.mSecondPaintItem.setResult();
        this.mMotionPaintItem.setResult();
    }

    public void setWidthHeight(float width, float height) {
        float middleX = width / 2.0f;
        float middleY = width / 2.0f;
        float baseRadius = Math.min(width, height) / 2.0f;
        this.mCirclePaintItem.setMiddle(middleX, middleY, baseRadius);
        this.mRoundPaintItem.setMiddle(middleX, middleY, baseRadius);
        this.mSecondPaintItem.setMiddle(middleX, middleY, baseRadius);
        this.mMotionPaintItem.setMiddle(middleX, middleY, baseRadius);
    }

    public void draw(Canvas canvas) {
        if (canvas != null) {
            canvas.save();
            this.mCirclePaintItem.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mRoundPaintItem.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mSecondPaintItem.drawCanvas(canvas);
            canvas.restore();
            canvas.save();
            this.mMotionPaintItem.drawCanvas(canvas);
            canvas.restore();
        }
    }

    public void setAlpha(int alpha) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }

    public int getOpacity() {
        return -1;
    }

    public void setBounds(Rect bounds) {
        super.setBounds(bounds);
    }

    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
    }

    public void startModeChangeAnimation() {
        this.mModeChangeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mModeChangeAnimator.setDuration(300);
        this.mModeChangeAnimator.setInterpolator(new DecelerateInterpolator() {
            public float getInterpolation(float input) {
                float value = super.getInterpolation(input);
                CameraSnapAnimateDrawable.this.mCirclePaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.mSecondPaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.mMotionPaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        this.mModeChangeAnimator.setupEndValues();
        this.mModeChangeAnimator.start();
    }

    public void startScaleDownAnimation() {
        this.mRoundPaintItem.setTargetValues(0.63296f, this.mRoundPaintItem.mCurrentColor, this.mRoundPaintItem.mCurrentAlpha, this.mRoundPaintItem.mCurrentStrokeWidth);
        ValueAnimator mScaleAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        mScaleAnimator.setDuration(200);
        mScaleAnimator.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float input) {
                float value = super.getInterpolation(input);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        mScaleAnimator.setupEndValues();
        mScaleAnimator.start();
    }

    public void startScaleUpAnimation(long delayTime, AnimatorListener resultListener) {
        ValueAnimator mScaleAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        mScaleAnimator.setStartDelay(delayTime);
        mScaleAnimator.setDuration(200);
        mScaleAnimator.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float input) {
                float value = super.getInterpolation(input);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        mScaleAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
                CameraSnapAnimateDrawable.this.mRoundPaintItem.setTargetValues(0.688f, CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentColor, CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentAlpha, CameraSnapAnimateDrawable.this.mRoundPaintItem.mCurrentStrokeWidth);
            }

            public void onAnimationEnd(Animator animation) {
            }

            public void onAnimationCancel(Animator animation) {
            }

            public void onAnimationRepeat(Animator animation) {
            }
        });
        if (resultListener != null) {
            mScaleAnimator.addListener(resultListener);
        }
        mScaleAnimator.setupEndValues();
        mScaleAnimator.start();
    }

    public void startRingAnimation() {
        cancelAnimation();
        this.mCirclePaintItem.setRingVisible(0);
        this.mRoundPaintItem.setVisible(8);
        this.mRingAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mRingAnimator.setDuration(500);
        this.mRingAnimator.setRepeatCount(-1);
        this.mRingAnimator.setRepeatMode(1);
        this.mRingAnimator.setInterpolator(new BounceInterpolator() {
            public float getInterpolation(float input) {
                float value = super.getInterpolation(input);
                CameraSnapAnimateDrawable.this.mCirclePaintItem.updateValue(value);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        this.mRingAnimator.start();
    }

    public void stopRingAnimation() {
        if (this.mRingAnimator != null) {
            this.mRingAnimator.cancel();
            this.mCirclePaintItem.setRingVisible(8);
            this.mRoundPaintItem.setVisible(0);
            invalidateSelf();
        }
    }

    public void startRecordAnimation(boolean startOrStop, int currentMode) {
        if (startOrStop) {
            startRecord(currentMode);
        } else {
            stopRecord(currentMode);
        }
    }

    public void prepareRecording(int currentMode) {
        cancelAnimation();
        switch (currentMode) {
            case 161:
                this.mCirclePaintItem.setTargetValues(this.mCirclePaintItem.mCurrentWidthPercent, this.mCirclePaintItem.mCurrentColor, CameraPaintBase.ALPHA_HINT, (float) Util.dpToPixel(2.0f));
                this.mRecordingPaint = this.mCirclePaintItem;
                break;
            case 162:
            case 166:
            case 170:
                this.mCirclePaintItem.setNeedSplit(false);
                this.mCirclePaintItem.setTargetValues(this.mCirclePaintItem.mCurrentWidthPercent, this.mCirclePaintItem.mCurrentColor, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                this.mRecordingPaint = this.mCirclePaintItem;
                break;
            case 168:
                this.mSecondPaintItem.setTargetValues(this.mSecondPaintItem.mCurrentWidthPercent, this.mSecondPaintItem.mCurrentColor, CameraPaintBase.ALPHA_HINT, this.mSecondPaintItem.mCurrentStrokeWidth);
                this.mRecordingPaint = this.mSecondPaintItem;
                break;
            case 169:
                this.mMotionPaintItem.setTargetValues(this.mMotionPaintItem.mCurrentWidthPercent, this.mMotionPaintItem.mCurrentColor, CameraPaintBase.ALPHA_HINT, this.mMotionPaintItem.mCurrentStrokeWidth);
                this.mRecordingPaint = this.mMotionPaintItem;
                break;
        }
        this.mRoundPaintItem.prepareRecord();
        this.mRoundPaintItem.isRecording = true;
        ValueAnimator valueAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        valueAnimator.setDuration(250);
        valueAnimator.setInterpolator(new DecelerateInterpolator() {
            public float getInterpolation(float input) {
                float value = super.getInterpolation(input);
                CameraSnapAnimateDrawable.this.mRecordingPaint.updateValue(value);
                CameraSnapAnimateDrawable.this.mRoundPaintItem.updateRecordValue(value, true);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        valueAnimator.start();
    }

    public void startRecord(int currentMode) {
        cancelAnimation();
        this.mTimeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mTimeAnimator.setDuration(10000);
        this.mTimeAnimator.setInterpolator(new LinearInterpolator() {
            public float getInterpolation(float input) {
                CameraSnapAnimateDrawable.this.mRecordingPaint.timeAngle = 360.0f * input;
                float value = super.getInterpolation(input);
                CameraSnapAnimateDrawable.this.invalidateSelf();
                return value;
            }
        });
        this.mTimeAnimator.removeAllListeners();
        this.mTimeAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
                CameraSnapAnimateDrawable.this.mRecordingPaint.isRecording = true;
                CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecording = true;
                CameraSnapAnimateDrawable.this.mCirclePaintItem.setNeedSplit(true);
            }

            public void onAnimationEnd(Animator animation) {
            }

            public void onAnimationCancel(Animator animation) {
            }

            public void onAnimationRepeat(Animator animation) {
                CameraSnapAnimateDrawable.this.mRecordingPaint.reverseClock();
            }
        });
        if (currentMode != 161) {
            this.mTimeAnimator.setRepeatMode(1);
            this.mTimeAnimator.setRepeatCount(-1);
        }
        this.mTimeAnimator.start();
    }

    public void pauseRecording() {
        if (this.mTimeAnimator != null) {
            this.mTimeAnimator.pause();
        }
    }

    public void resumeRecording() {
        if (this.mTimeAnimator != null) {
            this.mTimeAnimator.resume();
        }
    }

    public void stopRecord(int currentMode) {
        if (this.mRecordingPaint != null) {
            this.mRecordingPaint.isRecording = true;
            cancelAnimation();
            switch (currentMode) {
                case 161:
                    this.mRecordingPaint.setTargetValues(this.mRecordingPaint.mCurrentWidthPercent, this.mRecordingPaint.mCurrentColor, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                    break;
                case 162:
                    this.mRecordingPaint.setTargetValues(this.mRecordingPaint.mCurrentWidthPercent, this.mRecordingPaint.mCurrentColor, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                    break;
                default:
                    this.mRecordingPaint.setTargetValues(this.mRecordingPaint.mCurrentWidthPercent, this.mRecordingPaint.mCurrentColor, CameraPaintBase.ALPHA_OUTSTANDING, this.mRecordingPaint.mCurrentStrokeWidth);
                    break;
            }
            this.mTimeAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            this.mTimeAnimator.setDuration(300);
            this.mTimeAnimator.setInterpolator(new CubicEaseOutInterpolator() {
                public float getInterpolation(float input) {
                    float value = super.getInterpolation(input);
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.updateRecordValue(value, false);
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                    return value;
                }
            });
            this.mTimeAnimator.removeAllListeners();
            this.mTimeAnimator.addListener(new AnimatorListener() {
                public void onAnimationStart(Animator animation) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.resetRecordingState();
                    CameraSnapAnimateDrawable.this.mRecordingPaint.needZero = false;
                }

                public void onAnimationEnd(Animator animation) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.resetRecordingState();
                    CameraSnapAnimateDrawable.this.mRoundPaintItem.isRecording = false;
                }

                public void onAnimationCancel(Animator animation) {
                }

                public void onAnimationRepeat(Animator animation) {
                }
            });
            this.mTimeAnimator.start();
            ValueAnimator valueAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            valueAnimator.setDuration(400);
            valueAnimator.setInterpolator(new AccelerateInterpolator() {
                public float getInterpolation(float input) {
                    CameraSnapAnimateDrawable.this.mRecordingPaint.timeAngle = 0.0f;
                    float value = super.getInterpolation(input);
                    CameraSnapAnimateDrawable.this.mRecordingPaint.updateValue(value);
                    CameraSnapAnimateDrawable.this.invalidateSelf();
                    return value;
                }
            });
            valueAnimator.start();
        }
    }

    public void initTargetValues(int newMode) {
        switch (newMode) {
            case 161:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.688f, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                return;
            case 162:
            case 170:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.688f, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                return;
            case 168:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, 0, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.594f, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, CameraPaintBase.ALPHA_OUTSTANDING, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                return;
            case 169:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, 0, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.594f, -109521, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, CameraPaintBase.ALPHA_OUTSTANDING, 3.0f);
                return;
            default:
                this.mCirclePaintItem.setTargetValues(0.75f, -1, CameraPaintBase.ALPHA_OPAQUE, (float) Util.dpToPixel(1.0f));
                this.mRoundPaintItem.setTargetValues(0.688f, -1, CameraPaintBase.ALPHA_OPAQUE, 15.0f);
                this.mSecondPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                this.mMotionPaintItem.setTargetValues(0.833f, -1, 0, 3.0f);
                return;
        }
    }

    public void start() {
    }

    public void stop() {
    }

    public boolean isRunning() {
        if (this.mModeChangeAnimator == null || !this.mModeChangeAnimator.isRunning()) {
            return this.mTimeAnimator != null ? this.mTimeAnimator.isRunning() : false;
        } else {
            return true;
        }
    }

    public void cancelAnimation() {
        if (this.mTimeAnimator != null && this.mTimeAnimator.isRunning()) {
            this.mTimeAnimator.cancel();
            this.mTimeAnimator = null;
        }
        if (this.mRingAnimator != null && this.mRingAnimator.isRunning()) {
            this.mRingAnimator.cancel();
            this.mRingAnimator = null;
        }
    }
}
