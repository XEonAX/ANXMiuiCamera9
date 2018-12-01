package com.android.camera.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.support.annotation.StringRes;
import android.support.v7.recyclerview.R;
import android.util.AttributeSet;
import android.util.Range;
import android.util.Rational;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Interpolator;
import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$EvChangedProtocol;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.drawable.focus.CameraFocusAnimateDrawable;
import com.android.camera.ui.drawable.focus.CameraIndicatorState;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import miui.util.FeatureParser;
import miui.view.animation.CubicEaseOutInterpolator;

@TargetApi(21)
public class FocusView extends View implements FocusIndicator {
    private static final float GAP_NUM = FeatureParser.getFloat("camera_exposure_compensation_steps_num", 0.0f).floatValue();
    public static final int MAX_SLIDE_DISTANCE = Util.dpToPixel(110.3f);
    private static final String TAG = FocusView.class.getSimpleName();
    private static final int TRIANGLE_BASE_DIS = Util.dpToPixel(3.0f);
    private Camera mActivity;
    private RollAdapter mAdapter;
    private long mAdjustedDoneTime;
    private boolean mBeingEvAdjusted;
    private int mBottomRelative;
    private CameraFocusAnimateDrawable mCameraFocusAnimateDrawable;
    private Bitmap mCaptureBitmap;
    private int mCenterFlag = 0;
    private int mCenterX;
    private int mCenterY;
    private int mCurrentDistanceY;
    private int mCurrentItem;
    private int mCurrentMinusCircleCenter;
    private float mCurrentMinusCircleRadius;
    private int mCurrentMode;
    private int mCurrentRadius;
    private int mCurrentRayBottom;
    private int mCurrentRayHeight;
    private int mCurrentRayWidth;
    private int mCurrentViewState = 0;
    private int mCursorState = 0;
    private Rect mDisplayRect;
    private float mEVAnimationRatio;
    private long mEVAnimationStartTime;
    private float mEVCaptureRatio = -1.0f;
    private float mEvValue;
    private ExposureViewListener mExposureViewListener;
    private long mFailTime;
    private GestureDetector mGestureDetector;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            boolean z;
            String -get0 = FocusView.TAG;
            StringBuilder append = new StringBuilder().append("msg=").append(msg.what).append(" ");
            if (FocusView.this.mAdapter != null) {
                z = true;
            } else {
                z = false;
            }
            Log.d(-get0, append.append(z).toString());
            if (FocusView.this.mAdapter != null) {
                switch (msg.what) {
                    case 4:
                    case 5:
                        if (!FocusView.this.mIsDraw || !FocusView.this.mIsDown) {
                            FocusView.this.reset(6);
                            break;
                        }
                        FocusView.this.clearMessages();
                        sendEmptyMessageDelayed(5, 50);
                        break;
                        break;
                    case 6:
                        FocusView.this.resetCenter();
                        break;
                    case 7:
                        long duration = SystemClock.uptimeMillis() - FocusView.this.mEVAnimationStartTime;
                        if (duration < 520) {
                            FocusView.this.mEVAnimationRatio = ((float) duration) / 500.0f;
                            FocusView.this.calculateAttribute();
                            FocusView.this.invalidate();
                            sendEmptyMessageDelayed(7, 20);
                            break;
                        }
                        FocusView.this.mCurrentViewState = 1;
                        FocusView.this.mCursorState = 0;
                        return;
                }
            }
        }
    };
    private int mHeight;
    private CameraIndicatorState mIndicatorState;
    private Interpolator mInterpolator;
    private boolean mIsDown;
    private boolean mIsDraw;
    private boolean mIsEvAdjustable;
    private boolean mIsTouchFocus;
    private int mLastItem;
    private Bitmap mLockBodyBitmap;
    private Bitmap mLockHeadBitmap;
    private int mRotation;
    private int mScrollDistanceY;
    private SimpleOnGestureListener mSimpleOnGestureListener = new SimpleOnGestureListener() {
        public boolean onDown(MotionEvent e) {
            if (!FocusView.this.mIsDraw) {
                return false;
            }
            boolean supportTapDownCapture = false;
            switch (FocusView.this.mCurrentMode) {
                case 163:
                case 165:
                case 167:
                case 171:
                    if (FocusView.this.mExposureViewListener != null && FocusView.this.mExposureViewListener.isSupportFocusShoot()) {
                        supportTapDownCapture = FocusView.this.mExposureViewListener.isShowAeAfLockIndicator() ^ 1;
                        break;
                    }
                    supportTapDownCapture = false;
                    break;
                    break;
            }
            if (FocusView.this.mCurrentViewState != 0 || !supportTapDownCapture || !FocusView.this.isInCircle(e.getX() - ((float) FocusView.this.mDisplayRect.left), e.getY() - ((float) FocusView.this.mDisplayRect.top), ((float) CameraFocusAnimateDrawable.BIG_RADIUS) * 0.5f)) {
                FocusView.this.mIsDown = true;
                FocusView.this.removeMessages();
                FocusView.this.setTouchDown();
            } else if (FocusView.this.mAdapter != null) {
                ((ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).removeTiltShiftMask();
                ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (!(cameraAction == null || (cameraAction.isDoingAction() ^ 1) == 0)) {
                    cameraAction.onShutterButtonClick(90);
                }
            }
            return true;
        }

        public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
            if (!FocusView.this.mIsDown) {
                return false;
            }
            if (e2 == null) {
                return false;
            }
            if (!FocusView.this.mIsEvAdjustable) {
                return false;
            }
            int gestureOri = V6GestureRecognizer.getInstance(FocusView.this.mActivity).getGestureOrientation();
            if ((gestureOri != 200 || (FocusView.this.mRotation / 90) % 2 != 0) && (gestureOri != 100 || (FocusView.this.mRotation / 90) % 2 == 0)) {
                return false;
            }
            int newScrollY = FocusView.this.mScrollDistanceY;
            switch (FocusView.this.mRotation) {
                case 0:
                    newScrollY = (int) (((float) newScrollY) - distanceY);
                    break;
                case 90:
                    newScrollY = (int) (((float) newScrollY) + distanceX);
                    break;
                case 180:
                    newScrollY = (int) (((float) newScrollY) + distanceY);
                    break;
                case 270:
                    newScrollY = (int) (((float) newScrollY) - distanceX);
                    break;
            }
            int newDistanceY = (int) (((float) newScrollY) / ((((float) Util.sWindowHeight) / 2.0f) / (((float) FocusView.MAX_SLIDE_DISTANCE) / 4.0f)));
            FocusView.this.mCurrentDistanceY = Util.clamp(newDistanceY, ((-FocusView.MAX_SLIDE_DISTANCE) / 2) - FocusView.TRIANGLE_BASE_DIS, FocusView.MAX_SLIDE_DISTANCE / 2);
            if (newDistanceY == FocusView.this.mCurrentDistanceY) {
                FocusView.this.mScrollDistanceY = newScrollY;
            }
            FocusView.this.mBeingEvAdjusted = true;
            int targetItem = FocusView.this.getItemByCoordinate();
            if (targetItem != FocusView.this.mCurrentItem) {
                if (FocusView.this.mCurrentViewState != 3 && targetItem < FocusView.this.mCurrentItem && FocusView.this.mCurrentItem >= FocusView.this.mAdapter.getCenterIndex() && targetItem < FocusView.this.mAdapter.getCenterIndex()) {
                    FocusView.this.startAnimation();
                    FocusView.this.mLastItem = FocusView.this.mCurrentItem;
                    FocusView.this.mCurrentViewState = 3;
                } else if (FocusView.this.mCurrentViewState != 4 && targetItem > FocusView.this.mCurrentItem && FocusView.this.mCurrentItem < FocusView.this.mAdapter.getCenterIndex() && targetItem >= FocusView.this.mAdapter.getCenterIndex()) {
                    FocusView.this.startAnimation();
                    FocusView.this.mLastItem = FocusView.this.mCurrentItem;
                    FocusView.this.mCurrentViewState = 4;
                }
                FocusView.this.setCurrentItem(targetItem, false);
            }
            FocusView.this.mCameraFocusAnimateDrawable.setEvChanged((float) FocusView.this.mCurrentDistanceY, FocusView.this.mEvValue);
            if (FocusView.this.mCurrentViewState == 0 || FocusView.this.mCurrentViewState == 1) {
                FocusView.this.mCurrentViewState = 1;
                FocusView.this.calculateAttribute();
                FocusView.this.invalidate();
            }
            return true;
        }
    };
    private long mStartTime;
    private int mState;
    private long mSuccessTime;
    private int mWidth;

    public interface ExposureViewListener {
        boolean isMeteringAreaOnly();

        boolean isShowAeAfLockIndicator();

        boolean isShowCaptureButton();

        boolean isSupportFocusShoot();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CenterFlag {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CursorState {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ViewState {
    }

    public FocusView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mActivity = (Camera) context;
        this.mInterpolator = new CubicEaseOutInterpolator();
        this.mGestureDetector = new GestureDetector(context, this.mSimpleOnGestureListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mCaptureBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.bg_capture);
        this.mIndicatorState = new CameraIndicatorState();
        this.mCameraFocusAnimateDrawable = new CameraFocusAnimateDrawable(getContext());
        this.mCameraFocusAnimateDrawable.setIndicatorData(this.mIndicatorState, this.mCaptureBitmap);
        this.mLockHeadBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.icon_aeaf_lock_head);
        this.mLockBodyBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.icon_aeaf_lock_body);
        this.mCameraFocusAnimateDrawable.setLockIndicatorData(this.mIndicatorState, this.mLockHeadBitmap, this.mLockBodyBitmap);
        this.mCameraFocusAnimateDrawable.setCallback(this);
    }

    public void invalidateDrawable(Drawable who) {
        invalidate();
    }

    public void initialize(ExposureViewListener exposureViewListener) {
        this.mExposureViewListener = exposureViewListener;
        reset(8);
    }

    public void releaseListener() {
        this.mExposureViewListener = null;
    }

    public boolean onViewTouchEvent(MotionEvent ev) {
        boolean z = true;
        if (this.mAdapter != null && (this.mIsTouchFocus ^ 1) == 0) {
            int isStableStart;
            if (this.mState != 2) {
                isStableStart = isStableStart();
            } else {
                isStableStart = 1;
            }
            if ((isStableStart ^ 1) == 0) {
                this.mGestureDetector.onTouchEvent(ev);
                boolean oldDown = this.mIsDown;
                if (ev.getActionMasked() == 5 && this.mIsDown) {
                    this.mIsDown = false;
                }
                if (1 == ev.getAction() || 3 == ev.getAction()) {
                    if (this.mBeingEvAdjusted) {
                        CameraStatUtil.trackEvAdjusted();
                        stopEvAdjust();
                        this.mAdjustedDoneTime = System.currentTimeMillis();
                        this.mHandler.removeMessages(6);
                        this.mHandler.sendEmptyMessageDelayed(6, 1000);
                    }
                    if (this.mIsDraw) {
                        this.mIsDown = false;
                    }
                }
                if (!oldDown) {
                    z = this.mIsDown;
                }
                return z;
            }
        }
        return false;
    }

    private void processParameterIfNeeded(float ratio) {
        if (this.mIsTouchFocus && this.mEVCaptureRatio != -1.0f && this.mCenterFlag == 0) {
            this.mCenterFlag = 2;
        }
    }

    public void reInit() {
        Log.d(TAG, "onCameraOpen>>");
        initRect();
        Range<Integer> range1 = Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getExposureCompensationRange();
        int min = ((Integer) range1.getLower()).intValue();
        int max = ((Integer) range1.getUpper()).intValue();
        if (max != 0 && max != min) {
            this.mAdapter = new FloatSlideAdapter(min, max, GAP_NUM == 0.0f ? 1.0f : ((float) (max - min)) / GAP_NUM);
            Log.w(TAG, "onCameraOpen: adapter=" + this.mAdapter);
            if (this.mAdapter != null) {
                resetEvValue();
                this.mCurrentMode = DataRepository.dataItemGlobal().getCurrentMode();
                switch (this.mCurrentMode) {
                    case 167:
                        this.mCameraFocusAnimateDrawable.setEvTextVisible(0);
                        break;
                    default:
                        this.mCameraFocusAnimateDrawable.setEvTextVisible(8);
                        break;
                }
                setEvAdjustable(CameraSettings.isEvAdjustable());
                int index = this.mAdapter.getItemIndexByValue(Integer.valueOf(CameraSettings.readExposure()));
                if (index < 0) {
                    this.mCurrentItem = this.mAdapter.getMaxItem() / 2;
                } else {
                    this.mCurrentItem = index;
                }
                updateEV();
            }
        }
    }

    public void setOrientation(int orientation, boolean animation) {
        if (this.mRotation != orientation) {
            this.mRotation = orientation;
            this.mCameraFocusAnimateDrawable.setOrientation(orientation);
            if (this.mIsDraw) {
                invalidate();
            }
        }
    }

    public void setFocusType(boolean isTouchFocus) {
        this.mIsTouchFocus = isTouchFocus;
    }

    public void showStart() {
        Log.d(TAG, "showStart");
        clearMessages();
        this.mState = 1;
        this.mCursorState = 1;
        this.mStartTime = SystemClock.uptimeMillis();
        setDraw(true);
        this.mCameraFocusAnimateDrawable.startTouchDownAnimation();
        if (isStableStart()) {
            this.mEVCaptureRatio = 1.0f;
            showSuccess();
        } else {
            this.mEVCaptureRatio = -1.0f;
            this.mCenterFlag = 0;
            processParameterIfNeeded(0.0f);
            this.mHandler.sendEmptyMessageDelayed(4, 5000);
        }
        invalidate();
    }

    public void showSuccess() {
        Log.d(TAG, "showSuccess");
        if (this.mState == 1) {
            clearMessages();
            setDraw(true);
            this.mState = 2;
            this.mSuccessTime = SystemClock.uptimeMillis();
            if (!this.mIsTouchFocus) {
                this.mHandler.sendEmptyMessageDelayed(5, 800);
            }
        }
        if (this.mExposureViewListener != null) {
            if (this.mExposureViewListener.isShowAeAfLockIndicator() && CameraSettings.isAEAFLockSupport()) {
                showTipMessage(8, R.string.hint_ae_af_lock);
                this.mCenterFlag = 5;
            } else if (this.mExposureViewListener.isShowCaptureButton() && this.mExposureViewListener.isSupportFocusShoot()) {
                this.mCenterFlag = 2;
            } else {
                this.mCenterFlag = 1;
            }
            this.mCameraFocusAnimateDrawable.startFocusSuccessAnimation(this.mCenterFlag, this.mIsTouchFocus);
        }
    }

    public void showFail() {
        this.mCameraFocusAnimateDrawable.startFocusFailAnimation();
        Log.d(TAG, "showFail");
        if (this.mState == 1) {
            clearMessages();
            setDraw(true);
            this.mState = 3;
            this.mFailTime = SystemClock.uptimeMillis();
            this.mHandler.sendEmptyMessageDelayed(5, 800);
            invalidate();
        }
    }

    public void clear() {
        reset(7);
    }

    public void clear(int type) {
        Log.d(TAG, "clear: " + type);
        if (this.mCameraFocusAnimateDrawable != null) {
            this.mCameraFocusAnimateDrawable.cancelFocusingAnimation();
        }
        reset(type);
    }

    private void reset(int type) {
        if (this.mIsDraw || type == 8 || type == 2) {
            clearMessages();
            this.mState = 0;
            setPosition(type, this.mWidth / 2, this.mHeight / 2);
            this.mCurrentViewState = 0;
            this.mCenterFlag = 0;
            this.mIsDown = false;
            stopEvAdjust();
            setDraw(false);
            invalidate();
        }
    }

    private void initRect() {
        boolean z = true;
        this.mDisplayRect = Util.getDisplayRect(getContext());
        this.mWidth = this.mDisplayRect.width();
        this.mHeight = this.mDisplayRect.height();
        this.mCenterX = this.mWidth / 2;
        this.mCenterY = this.mHeight / 2;
        setPivotX((float) this.mCenterX);
        setPivotY((float) this.mCenterY);
        CameraFocusAnimateDrawable cameraFocusAnimateDrawable = this.mCameraFocusAnimateDrawable;
        if (1 != getLayoutDirection()) {
            z = false;
        }
        cameraFocusAnimateDrawable.setRtlAndDisplayRect(z, this.mDisplayRect);
        this.mCameraFocusAnimateDrawable.setCenter(this.mCenterX, this.mCenterY);
    }

    private void resetCenter() {
        this.mCurrentViewState = 0;
        this.mAdjustedDoneTime = System.currentTimeMillis();
        if (this.mExposureViewListener != null) {
            if (this.mExposureViewListener.isShowAeAfLockIndicator() && CameraSettings.isAEAFLockSupport()) {
                this.mCenterFlag = 5;
                this.mIndicatorState.mCenterFlag = this.mCenterFlag;
                invalidate();
            } else if (this.mExposureViewListener.isShowCaptureButton() && this.mExposureViewListener.isSupportFocusShoot()) {
                this.mCenterFlag = 2;
                this.mIndicatorState.mCenterFlag = this.mCenterFlag;
                invalidate();
            }
        }
    }

    protected void onDraw(Canvas canvas) {
        if (this.mIsDraw && this.mCameraFocusAnimateDrawable != null) {
            this.mCameraFocusAnimateDrawable.draw(canvas);
        }
    }

    private void updateEV() {
        Rational step = Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getExposureCompensationRational();
        if (this.mAdapter != null) {
            this.mEvValue = ((float) this.mAdapter.getItemValue(this.mCurrentItem)) * step.floatValue();
        } else {
            this.mEvValue = 0.0f;
        }
    }

    public void setEvAdjustable(boolean enable) {
        this.mIsEvAdjustable = enable;
        resetEvValue();
        calculateAttribute();
        this.mCameraFocusAnimateDrawable.setEvAdjustVisible(enable ? 0 : 8);
        if (!enable) {
            this.mCameraFocusAnimateDrawable.setEvTextVisible(8);
        }
        invalidate();
    }

    public boolean isEvAdjusted() {
        return this.mBeingEvAdjusted;
    }

    public boolean isEvAdjustedTime() {
        if (!isShown() || !this.mIsTouchFocus) {
            return false;
        }
        if (this.mBeingEvAdjusted) {
            return true;
        }
        return Util.isTimeout(System.currentTimeMillis(), this.mAdjustedDoneTime, 1500) ^ 1;
    }

    public void setPosition(int type, int x, int y) {
        this.mCenterX = x;
        this.mCenterY = y;
        setPivotX((float) x);
        setPivotY((float) y);
        this.mCameraFocusAnimateDrawable.setCenter(x, y);
        removeMessages();
        if (this.mEvValue != 0.0f) {
            switch (type) {
                case 1:
                case 2:
                case 5:
                    ModeProtocol$EvChangedProtocol p = (ModeProtocol$EvChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(169);
                    if (p != null) {
                        p.resetEvValue();
                        break;
                    }
                    break;
            }
        }
        if (this.mCurrentDistanceY != 0 && type != 7) {
            resetEvValue();
        }
    }

    private boolean isStableStart() {
        if (this.mIsTouchFocus && this.mExposureViewListener != null) {
            return this.mExposureViewListener.isMeteringAreaOnly();
        }
        return false;
    }

    private void clearMessages() {
        this.mHandler.removeMessages(4);
        this.mHandler.removeMessages(5);
        this.mHandler.removeMessages(6);
        this.mHandler.removeMessages(7);
    }

    private void reload() {
        if (this.mAdapter != null) {
            this.mCurrentItem = this.mAdapter.getItemIndexByValue(Integer.valueOf(CameraSettings.readExposure()));
            updateEV();
        }
    }

    private void setDraw(boolean draw) {
        if (draw && this.mIsTouchFocus && this.mIsDraw != draw) {
            reload();
        }
        this.mIsDraw = draw;
    }

    private void removeMessages() {
    }

    private void setTouchDown() {
        this.mBottomRelative = (int) (((float) MAX_SLIDE_DISTANCE) * 0.5f);
    }

    private void resetEvValue() {
        this.mBeingEvAdjusted = false;
        this.mEvValue = 0.0f;
        this.mCurrentItem = 0;
        this.mScrollDistanceY = 0;
        this.mCurrentDistanceY = 0;
        this.mCameraFocusAnimateDrawable.reset();
    }

    private int getItemByCoordinate() {
        return Util.clamp((this.mAdapter.getMaxItem() * (this.mBottomRelative - this.mCurrentDistanceY)) / MAX_SLIDE_DISTANCE, 0, this.mAdapter.getMaxItem());
    }

    private void setCurrentItem(int index, boolean animated) {
        if (index != this.mCurrentItem) {
            this.mCurrentItem = index;
            if (this.mAdapter != null) {
                ModeProtocol$EvChangedProtocol p = (ModeProtocol$EvChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(169);
                if (p != null) {
                    p.onEvChanged(this.mAdapter.getItemValue(index), 1);
                }
            }
            updateEV();
        }
    }

    private void stopEvAdjust() {
        if (this.mBeingEvAdjusted) {
            this.mBeingEvAdjusted = false;
            ModeProtocol$EvChangedProtocol p = (ModeProtocol$EvChangedProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(169);
            if (p != null) {
                p.onEvChanged(0, 2);
            }
        }
    }

    private void startAnimation() {
        this.mEVAnimationStartTime = SystemClock.uptimeMillis();
        this.mHandler.removeMessages(7);
        this.mHandler.sendEmptyMessage(7);
    }

    private float getItemRatio(int item) {
        float itemRatio = ((float) item) / ((float) this.mAdapter.getMaxItem());
        return itemRatio >= 0.5f ? 2.0f * (itemRatio - 0.5f) : itemRatio * 2.0f;
    }

    private void calculateAttribute() {
        float currentItemRatio = getItemRatio(this.mCurrentItem);
        float lastItemRatio = getItemRatio(this.mLastItem);
        float ratio;
        switch (this.mCurrentViewState) {
            case 0:
                int i = (this.mExposureViewListener != null && this.mExposureViewListener.isShowCaptureButton() && this.mExposureViewListener.isSupportFocusShoot()) ? 2 : 1;
                this.mCenterFlag = i;
                break;
            case 1:
                ratio = currentItemRatio;
                if (this.mCurrentItem >= this.mAdapter.getCenterIndex()) {
                    this.mCurrentRayWidth = Util.dpToPixel(1.5f);
                    this.mCurrentRayHeight = Util.dpToPixel((2.0f * currentItemRatio) + 5.0f);
                    this.mCurrentRayBottom = Util.dpToPixel((3.0f * currentItemRatio) + 7.5f);
                    this.mCurrentRadius = Util.dpToPixel((2.0f * currentItemRatio) + 5.0f);
                    this.mCenterFlag = 3;
                    break;
                }
                this.mCurrentRadius = Util.dpToPixel((2.0f * currentItemRatio) + 6.0f);
                this.mCurrentMinusCircleCenter = (int) (((float) this.mCurrentRadius) * 0.5f);
                this.mCurrentMinusCircleRadius = ((float) this.mCurrentRadius) * 0.8f;
                this.mCenterFlag = 4;
                break;
            case 3:
                if (this.mEVAnimationRatio > 0.5f) {
                    ratio = 2.0f * (this.mEVAnimationRatio - 0.5f);
                    this.mCurrentRadius = Util.dpToPixel(8.0f - (((1.0f - currentItemRatio) * ratio) * 2.0f));
                    this.mCurrentMinusCircleCenter = (int) (((float) this.mCurrentRadius) * (((1.0f - ratio) * 0.914f) + 0.5f));
                    this.mCurrentMinusCircleRadius = ((float) this.mCurrentRadius) * (((1.0f - ratio) * 0.2f) + 0.8f);
                    this.mCenterFlag = 4;
                    break;
                }
                ratio = 2.0f * this.mEVAnimationRatio;
                this.mCurrentRayWidth = Util.dpToPixel(1.5f);
                this.mCurrentRayHeight = Util.dpToPixel(((((1.0f - ratio) * lastItemRatio) - ratio) * 2.0f) + 5.0f);
                this.mCurrentRayBottom = Util.dpToPixel(((((1.0f - ratio) * lastItemRatio) - ratio) * 3.0f) + 7.5f);
                this.mCurrentRadius = Util.dpToPixel(((3.0f * ratio) + 5.0f) + ((2.0f * lastItemRatio) * (1.0f - ratio)));
                this.mCenterFlag = 3;
                break;
            case 4:
                if (this.mEVAnimationRatio >= 0.5f) {
                    ratio = 2.0f * (this.mEVAnimationRatio - 0.5f);
                    this.mCurrentRayWidth = Util.dpToPixel(1.5f);
                    this.mCurrentRayHeight = Util.dpToPixel((((currentItemRatio * ratio) - (1.0f - ratio)) * 2.0f) + 5.0f);
                    this.mCurrentRayBottom = Util.dpToPixel((((currentItemRatio * ratio) - (1.0f - ratio)) * 3.0f) + 7.5f);
                    this.mCurrentRadius = Util.dpToPixel((((1.0f - ratio) * 3.0f) + 5.0f) + ((2.0f * currentItemRatio) * ratio));
                    this.mCenterFlag = 3;
                    break;
                }
                ratio = 2.0f * this.mEVAnimationRatio;
                this.mCurrentRadius = Util.dpToPixel(((((1.0f - lastItemRatio) * ratio) + lastItemRatio) * 2.0f) + 6.0f);
                this.mCurrentMinusCircleCenter = (int) (((float) this.mCurrentRadius) * ((0.914f * ratio) + 0.5f));
                this.mCurrentMinusCircleRadius = ((float) this.mCurrentRadius) * ((0.2f * ratio) + 0.8f);
                this.mCenterFlag = 4;
                break;
            default:
                this.mCenterFlag = 1;
                break;
        }
        this.mCameraFocusAnimateDrawable.cancelResetCenter();
        this.mIndicatorState.mCenterFlag = this.mCenterFlag;
        this.mIndicatorState.mCurrentRadius = this.mCurrentRadius;
        this.mIndicatorState.mCurrentAngle = (float) getCurrentAngle();
        this.mIndicatorState.mCurrentRayWidth = this.mCurrentRayWidth;
        this.mIndicatorState.mCurrentRayHeight = this.mCurrentRayHeight;
        this.mIndicatorState.mCurrentRayBottom = this.mCurrentRayBottom;
        this.mIndicatorState.mCurrentMinusCircleCenter = this.mCurrentMinusCircleCenter;
        this.mIndicatorState.mCurrentMinusCircleRadius = this.mCurrentMinusCircleRadius;
    }

    private int getCurrentAngle() {
        int degree = 0;
        if (this.mCursorState == 2 && this.mCurrentViewState != 3 && this.mCurrentViewState != 4) {
            if (this.mCurrentItem >= this.mAdapter.getCenterIndex()) {
                degree = ((this.mCurrentItem - this.mAdapter.getCenterIndex()) * 360) / this.mAdapter.getCenterIndex();
            }
            return 360 - Util.clamp(degree, 0, 360);
        } else if (this.mCurrentViewState == 1) {
            int relativeDis = Util.clamp(this.mBottomRelative - this.mCurrentDistanceY, 0, MAX_SLIDE_DISTANCE);
            if (relativeDis >= MAX_SLIDE_DISTANCE / 2) {
                degree = ((relativeDis - (MAX_SLIDE_DISTANCE / 2)) * 360) / (MAX_SLIDE_DISTANCE / 2);
            }
            return 360 - Util.clamp(degree, 0, 360);
        } else if (this.mCurrentViewState == 3) {
            return Util.clamp((int) ((this.mEVAnimationRatio * 2.0f) * 135.0f), 0, 135);
        } else {
            if (this.mCurrentViewState == 4) {
                return Util.clamp((int) ((1.0f - ((this.mEVAnimationRatio - 0.5f) * 2.0f)) * 135.0f), 0, 135);
            }
            return 0;
        }
    }

    private boolean isInCircle(float x, float y, float r) {
        float dx = x - ((float) this.mCenterX);
        float dy = y - ((float) this.mCenterY);
        return Math.sqrt((double) ((dx * dx) + (dy * dy))) <= ((double) r);
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mCameraFocusAnimateDrawable != null) {
            this.mCameraFocusAnimateDrawable.cancelFocusingAnimation();
            this.mCameraFocusAnimateDrawable.setCallback(null);
        }
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    private void showTipMessage(int types, @StringRes int tokenResId) {
        ModeProtocol$BottomPopupTips tips = (ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (tips != null) {
            if (tips.isPortraitHintVisible()) {
                tips.setPortraitHintVisible(8);
            }
            tips.showTips(types, tokenResId, 2);
        }
    }
}
