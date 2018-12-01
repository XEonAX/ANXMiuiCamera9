package com.android.camera.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.Cap;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.v4.widget.ExploreByTouchHelper;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.Checkable;
import android.widget.CompoundButton;
import com.android.camera.R$styleable;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import miui.view.animation.QuarticEaseInOutInterpolator;

public class ToggleSwitch extends CompoundButton implements Checkable {
    /* renamed from: -com-android-camera-ui-ToggleSwitch$StateSwitchesValues */
    private static final /* synthetic */ int[] f9-com-android-camera-ui-ToggleSwitch$StateSwitchesValues = null;
    private static final String TAG = ToggleSwitch.class.getSimpleName();
    private boolean isMoving;
    private int mAnimDuration;
    private boolean mBroadcasting;
    private boolean mChecked;
    private float mCurrentPos;
    private OnCheckedChangeListener mOnCheckedChangeListener;
    private int mStrokeWidth;
    private int mSwitchBackgroundColor;
    private int mSwitchBackgroundStrokeColor;
    private String mTextOff;
    private int mTextOffColor;
    private int mTextOffShadowColor;
    private float mTextOffShadowRadius;
    private int mTextOffWidth;
    private String mTextOn;
    private int mTextOnColor;
    private int mTextOnWidth;
    private int mTextSize;
    private int mThumbColor;
    private int mThumbPadding;
    private int mThumbShadowColor;
    private float mThumbShadowRadius;
    private ValueAnimator mValueAnimator;
    private State state;

    public interface OnCheckedChangeListener {
        void onCheckedChanged(ToggleSwitch toggleSwitch, boolean z);
    }

    private enum State {
        SWITCHING_ANIM_OFF,
        SWITCHING_ANIM_ON,
        SWITCH_ON,
        SWITCH_OFF
    }

    /* renamed from: -getcom-android-camera-ui-ToggleSwitch$StateSwitchesValues */
    private static /* synthetic */ int[] m8-getcom-android-camera-ui-ToggleSwitch$StateSwitchesValues() {
        if (f9-com-android-camera-ui-ToggleSwitch$StateSwitchesValues != null) {
            return f9-com-android-camera-ui-ToggleSwitch$StateSwitchesValues;
        }
        int[] iArr = new int[State.values().length];
        try {
            iArr[State.SWITCHING_ANIM_OFF.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[State.SWITCHING_ANIM_ON.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[State.SWITCH_OFF.ordinal()] = 3;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[State.SWITCH_ON.ordinal()] = 4;
        } catch (NoSuchFieldError e4) {
        }
        f9-com-android-camera-ui-ToggleSwitch$StateSwitchesValues = iArr;
        return iArr;
    }

    public ToggleSwitch(Context context) {
        super(context);
        this.mTextOn = "ON";
        this.mTextOff = "OFF";
        this.mSwitchBackgroundColor = -2013265920;
        this.mSwitchBackgroundStrokeColor = -1275068417;
        this.mStrokeWidth = dp2px(1.0f);
        this.mThumbColor = -13391105;
        this.mThumbShadowColor = 1291845632;
        this.mThumbShadowRadius = dp2pxFloat(1.33f);
        this.mTextOffShadowColor = -1090519040;
        this.mTextOffShadowRadius = dp2pxFloat(1.33f);
        this.mThumbPadding = dp2px(2.0f);
        this.mAnimDuration = 300;
        this.state = this.mChecked ? State.SWITCH_ON : State.SWITCH_OFF;
        setClickable(true);
    }

    public ToggleSwitch(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTextOn = "ON";
        this.mTextOff = "OFF";
        TypedArray a = context.obtainStyledAttributes(attrs, R$styleable.ToggleSwitch);
        this.mSwitchBackgroundColor = a.getColor(0, -2013265920);
        this.mSwitchBackgroundStrokeColor = a.getColor(1, -1275068417);
        this.mStrokeWidth = a.getDimensionPixelSize(2, dp2px(1.0f));
        this.mThumbColor = a.getColor(4, -13391105);
        this.mThumbShadowColor = a.getColor(5, 1291845632);
        this.mThumbShadowRadius = a.getDimension(6, dp2pxFloat(1.33f));
        this.mThumbPadding = a.getDimensionPixelSize(3, dp2px(2.0f));
        this.mTextOn = (String) a.getText(7);
        this.mTextOff = (String) a.getText(9);
        this.mTextOnColor = a.getInteger(8, -1);
        this.mTextOffColor = a.getInteger(10, -1275068417);
        this.mTextOffShadowColor = a.getColor(11, -1090519040);
        this.mTextOffShadowRadius = a.getDimension(13, dp2pxFloat(1.33f));
        this.mTextSize = a.getDimensionPixelSize(12, 48);
        this.mAnimDuration = a.getInteger(14, 300);
        this.mChecked = a.getBoolean(15, false);
        a.recycle();
        Rect textOnBounds = new Rect();
        Rect textOffBounds = new Rect();
        Paint paint = new Paint();
        paint.setTextSize((float) this.mTextSize);
        paint.getTextBounds(this.mTextOn, 0, this.mTextOn.length(), textOnBounds);
        paint.getTextBounds(this.mTextOff, 0, this.mTextOff.length(), textOffBounds);
        this.mTextOnWidth = textOnBounds.width();
        this.mTextOffWidth = textOffBounds.width();
        this.state = this.mChecked ? State.SWITCH_ON : State.SWITCH_OFF;
        setClickable(true);
    }

    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthSpecSize = MeasureSpec.getSize(widthMeasureSpec);
        int heightSpecSize = MeasureSpec.getSize(heightMeasureSpec);
        int widthSpecMode = MeasureSpec.getMode(widthMeasureSpec);
        int heightSpecMode = MeasureSpec.getMode(heightMeasureSpec);
        int width = (((dp2px(54.0f) + this.mTextOnWidth) + this.mTextOffWidth) + getPaddingLeft()) + getPaddingRight();
        int height = (dp2px(28.0f) + getPaddingTop()) + getPaddingBottom();
        if (widthSpecMode != ExploreByTouchHelper.INVALID_ID) {
            width = Math.max(width, widthSpecSize);
        }
        if (heightSpecMode != ExploreByTouchHelper.INVALID_ID) {
            height = Math.max(height, heightSpecSize);
        }
        setMeasuredDimension(width, height);
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        setLayerType(1, null);
        int w = getWidth();
        int h = getHeight();
        int pl = getPaddingLeft();
        int pt = getPaddingTop();
        int hp = (h - pt) - getPaddingBottom();
        canvas.translate((float) (pl + ((((w - pl) - getPaddingRight()) - getWidth()) / 2)), (float) (pt + ((hp - getHeight()) / 2)));
        switch (m8-getcom-android-camera-ui-ToggleSwitch$StateSwitchesValues()[this.state.ordinal()]) {
            case 1:
                drawSwitchOffAnim(canvas);
                return;
            case 2:
                drawSwitchOnAnim(canvas);
                return;
            case 3:
                drawSwitchOff(canvas);
                return;
            case 4:
                drawSwitchOn(canvas);
                return;
            default:
                return;
        }
    }

    private void drawSwitchOn(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        float[] ovalAttrs = compThumbRoundRectAttr(1.0f);
        drawRoundRect(canvas, this.mThumbColor, ovalAttrs, true);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        drawText(canvas, ovalAttrs);
    }

    private void drawSwitchOff(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        float[] ovalAttrs = compThumbRoundRectAttr(0.0f);
        drawRoundRect(canvas, this.mThumbColor, ovalAttrs, true);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        drawText(canvas, ovalAttrs);
    }

    private void drawSwitchOnAnim(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        float[] ovalAttrs = compThumbRoundRectAttr(this.mCurrentPos);
        drawRoundRect(canvas, this.mThumbColor, ovalAttrs, true);
        drawText(canvas, ovalAttrs);
    }

    private void drawSwitchOffAnim(Canvas canvas) {
        drawRoundRect(canvas, this.mSwitchBackgroundColor, compBackgroundRoundRectAttr(), false);
        drawRoundRectStroke(canvas, this.mSwitchBackgroundStrokeColor);
        float[] ovalAttrs = compThumbRoundRectAttr(1.0f - this.mCurrentPos);
        drawRoundRect(canvas, this.mThumbColor, ovalAttrs, true);
        drawText(canvas, ovalAttrs);
    }

    private void drawRoundRect(Canvas canvas, int color, float[] attrs, boolean drawShadow) {
        Paint paint = new Paint(1);
        paint.setStyle(Style.FILL);
        paint.setStrokeCap(Cap.SQUARE);
        RectF rectF = new RectF();
        paint.setColor(color);
        if (drawShadow) {
            paint.setShadowLayer(this.mThumbShadowRadius, 0.0f, 0.0f, this.mThumbShadowColor);
        }
        rectF.set(attrs[0], attrs[1], attrs[2], attrs[3]);
        canvas.drawRoundRect(rectF, attrs[4], attrs[4], paint);
    }

    private void drawText(Canvas canvas, float[] attrs) {
        Paint paint;
        FontMetricsInt fontMetrics;
        int baseline;
        if (this.mTextOff != null) {
            paint = new Paint(1);
            paint.setTextAlign(Align.LEFT);
            paint.setTextSize((float) this.mTextSize);
            fontMetrics = paint.getFontMetricsInt();
            baseline = (((getMeasuredHeight() - fontMetrics.bottom) + fontMetrics.top) / 2) - fontMetrics.top;
            if (this.mChecked) {
                paint.setColor(this.mTextOffColor);
                paint.setShadowLayer(this.mTextOffShadowRadius, 0.0f, 0.0f, this.mTextOffShadowColor);
            } else {
                paint.setColor(this.mTextOnColor);
            }
            canvas.drawText(this.mTextOff, ((((((float) getWidth()) * 0.5f) + (((float) this.mThumbPadding) / 2.0f)) + ((float) this.mStrokeWidth)) - ((float) this.mTextOffWidth)) * 0.5f, (float) baseline, paint);
        }
        if (this.mTextOn != null) {
            paint = new Paint(1);
            paint.setTextAlign(Align.LEFT);
            paint.setTextSize((float) this.mTextSize);
            fontMetrics = paint.getFontMetricsInt();
            baseline = (((getMeasuredHeight() - fontMetrics.bottom) + fontMetrics.top) / 2) - fontMetrics.top;
            if (this.mChecked) {
                paint.setColor(this.mTextOnColor);
            } else {
                paint.setColor(this.mTextOffColor);
                paint.setShadowLayer(this.mTextOffShadowRadius, 0.0f, 0.0f, this.mTextOffShadowColor);
            }
            canvas.drawText(this.mTextOn, (((((((float) getWidth()) * 3.0f) / 2.0f) - (((float) this.mThumbPadding) / 2.0f)) - ((float) this.mStrokeWidth)) - ((float) this.mTextOnWidth)) * 0.5f, (float) baseline, paint);
        }
    }

    private void drawRoundRectStroke(Canvas canvas, int color) {
        if (this.mStrokeWidth > 0) {
            int sw = getWidth();
            float left = ((float) this.mStrokeWidth) / 2.0f;
            float right = ((float) sw) - left;
            float top = ((float) this.mStrokeWidth) / 2.0f;
            float bottom = ((float) getHeight()) - top;
            float radius = (bottom - top) * 0.5f;
            Paint paint = new Paint(1);
            paint.setStyle(Style.STROKE);
            paint.setColor(color);
            paint.setStrokeWidth((float) this.mStrokeWidth);
            RectF rectF = new RectF();
            rectF.set(left, top, right, bottom);
            canvas.drawRoundRect(rectF, radius, radius, paint);
        }
    }

    private float[] compBackgroundRoundRectAttr() {
        float right = ((float) getWidth()) - 0.0f;
        float radius = ((((float) getHeight()) - 0.0f) - 0.0f) * 0.5f;
        return new float[]{0.0f, 0.0f, right, ((float) getHeight()) - 0.0f, radius};
    }

    private float[] compThumbRoundRectAttr(float pos) {
        int sw = getWidth();
        float right = ((((float) (this.mThumbPadding + this.mStrokeWidth)) * (1.0f - pos)) + (((((float) sw) / 2.0f) + (((float) this.mThumbPadding) / 2.0f)) * pos)) + (((((float) sw) / 2.0f) - ((float) this.mStrokeWidth)) - ((((float) this.mThumbPadding) * 3.0f) / 2.0f));
        float top = (float) (this.mThumbPadding + this.mStrokeWidth);
        float radius = (((((float) (getHeight() - (this.mThumbPadding * 2))) + top) - ((float) (this.mStrokeWidth * 2))) - top) * 0.5f;
        return new float[]{(((float) (this.mThumbPadding + this.mStrokeWidth)) * (1.0f - pos)) + (((((float) sw) / 2.0f) + (((float) this.mThumbPadding) / 2.0f)) * pos), top, right, (((float) (getHeight() - (this.mThumbPadding * 2))) + top) - ((float) (this.mStrokeWidth * 2)), radius};
    }

    public int dp2px(float dpValue) {
        return (int) ((dpValue * getResources().getDisplayMetrics().density) + 0.5f);
    }

    public float dp2pxFloat(float dpValue) {
        return (dpValue * getResources().getDisplayMetrics().density) + 0.5f;
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener listener) {
        this.mOnCheckedChangeListener = listener;
    }

    public void setChecked(boolean checked) {
        if (!(this.isMoving || this.mChecked == checked)) {
            this.mChecked = checked;
            if (!this.mBroadcasting) {
                this.mBroadcasting = true;
                if (this.mOnCheckedChangeListener != null) {
                    this.mOnCheckedChangeListener.onCheckedChanged(this, this.mChecked);
                }
                this.mBroadcasting = false;
                if (this.mChecked) {
                    this.state = State.SWITCHING_ANIM_ON;
                } else {
                    this.state = State.SWITCHING_ANIM_OFF;
                }
                if (isAttachedToWindow() && isLaidOut()) {
                    animateToCheckedState();
                } else {
                    cancelPositionAnimator();
                    this.mCurrentPos = 0.0f;
                }
            }
        }
    }

    private void cancelPositionAnimator() {
        if (this.mValueAnimator != null) {
            this.mValueAnimator.cancel();
        }
    }

    private void animateToCheckedState() {
        this.mValueAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mValueAnimator.setDuration((long) this.mAnimDuration);
        this.mValueAnimator.setInterpolator(new QuarticEaseInOutInterpolator());
        this.mValueAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                ToggleSwitch.this.mCurrentPos = ((Float) animation.getAnimatedValue()).floatValue();
                ToggleSwitch.this.invalidate();
            }
        });
        this.mValueAnimator.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animation) {
                super.onAnimationStart(animation);
                ToggleSwitch.this.isMoving = true;
            }

            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);
                ToggleSwitch.this.isMoving = false;
            }
        });
        if (!this.mValueAnimator.isRunning()) {
            this.mValueAnimator.start();
            this.mCurrentPos = 0.0f;
        }
    }

    public boolean isChecked() {
        return this.mChecked;
    }

    public void toggle() {
        ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            setChecked(this.mChecked ^ 1);
        }
    }
}
