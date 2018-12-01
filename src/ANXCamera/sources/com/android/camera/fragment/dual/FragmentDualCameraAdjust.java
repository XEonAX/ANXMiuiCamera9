package com.android.camera.fragment.dual;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.annotation.TargetApi;
import android.os.Handler;
import android.os.Message;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.text.SpannableStringBuilder;
import android.text.style.TextAppearanceSpan;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyDualZoom;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.fragment.manually.adapter.ExtraSlideZoomAdapter;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$DualController;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$SnapShotIndicator;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.HorizontalSlideView;
import io.reactivex.Completable;
import io.reactivex.functions.Action;
import java.util.List;
import miui.view.animation.BackEaseOutInterpolator;
import miui.view.animation.QuadraticEaseInOutInterpolator;
import miui.view.animation.QuadraticEaseOutInterpolator;

public class FragmentDualCameraAdjust extends BaseFragment implements OnClickListener, OnLongClickListener, ManuallyListener, ModeProtocol$HandleBackTrace, ModeProtocol$DualController, ModeProtocol$SnapShotIndicator {
    private int mCurrentState = -1;
    private TextAppearanceSpan mDigitsTextStyle;
    private ViewGroup mDualParentLayout;
    private TextView mDualZoomButton;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    FragmentDualCameraAdjust.this.onBackEvent(5);
                    return;
                default:
                    return;
            }
        }
    };
    private ViewGroup mHorizontalSlideLayout;
    private HorizontalSlideView mHorizontalSlideView;
    private boolean mIsHiding;
    private boolean mIsZoomAnimationEnabled;
    private boolean mIsZoomTo2X;
    private boolean mPassTouchFromZoomButtonToSlide;
    private int mSlideLayoutHeight;
    private ExtraSlideZoomAdapter mSlidingAdapter;
    private TextAppearanceSpan mSnapStyle;
    private SpannableStringBuilder mStringBuilder;
    private TextAppearanceSpan mXTextStyle;
    private AnimatorSet mZoomInAnimator;
    private AnimatorSet mZoomInOutAnimator;
    private AnimatorSet mZoomOutAnimator;
    private OnTouchListener mZoomPopupTouchListener = new OnTouchListener() {
        private boolean mAnimated = false;

        public boolean onTouch(View v, MotionEvent event) {
            if (event.getAction() == 2) {
                if (!this.mAnimated) {
                    FragmentDualCameraAdjust.this.mZoomInAnimator.start();
                    this.mAnimated = true;
                }
            } else if ((event.getAction() == 1 || event.getAction() == 3) && this.mAnimated) {
                FragmentDualCameraAdjust.this.mZoomOutAnimator.start();
                this.mAnimated = false;
            }
            FragmentDualCameraAdjust.this.sendHideMessage();
            return false;
        }
    };
    private float mZoomRatio;
    private int mZoomRatioTele;
    private int mZoomRatioWide;
    private ObjectAnimator mZoomRequestAnimator;

    protected void initView(View v) {
        this.mStringBuilder = new SpannableStringBuilder();
        ((MarginLayoutParams) v.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mDualParentLayout = (ViewGroup) v.findViewById(R.id.dual_layout_parent);
        this.mDualZoomButton = (TextView) v.findViewById(R.id.dual_camera_zoom_button);
        this.mHorizontalSlideLayout = (ViewGroup) v.findViewById(R.id.dual_camera_zoom_slideview_layout);
        this.mHorizontalSlideView = (HorizontalSlideView) this.mHorizontalSlideLayout.findViewById(R.id.dual_camera_zoom_slideview);
        this.mHorizontalSlideView.setOnTouchListener(this.mZoomPopupTouchListener);
        this.mDualZoomButton.setOnClickListener(this);
        this.mDigitsTextStyle = new TextAppearanceSpan(getContext(), R.style.ZoomButtonDigitsTextStyle);
        this.mXTextStyle = new TextAppearanceSpan(getContext(), R.style.ZoomButtonXTextStyle);
        this.mZoomRatioWide = 1;
        this.mZoomRatioTele = 2;
        this.mIsZoomAnimationEnabled = Util.isZoomAnimationEnabled();
        this.mZoomRequestAnimator = (ObjectAnimator) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_request);
        this.mZoomRequestAnimator.setTarget(this.mDualZoomButton);
        if (!this.mIsZoomAnimationEnabled) {
            this.mZoomRequestAnimator.setDuration(0);
        }
        this.mZoomRequestAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                FragmentDualCameraAdjust.this.requestZoomRatio(((Float) animation.getAnimatedValue()).floatValue(), false);
            }
        });
        this.mZoomRequestAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
                FragmentDualCameraAdjust.this.notifyZooming(true);
                if (FragmentDualCameraAdjust.this.mIsZoomTo2X) {
                    FragmentDualCameraAdjust.this.notifyZoom2X(true);
                } else {
                    FragmentDualCameraAdjust.this.notifyZoom2X(false);
                }
            }

            public void onAnimationEnd(Animator animation) {
                FragmentDualCameraAdjust.this.notifyZooming(false);
                FragmentDualCameraAdjust.this.mIsZoomTo2X = false;
                FragmentDualCameraAdjust.this.notifyZoom2X(false);
            }

            public void onAnimationCancel(Animator animation) {
                FragmentDualCameraAdjust.this.notifyZooming(false);
                FragmentDualCameraAdjust.this.mIsZoomTo2X = false;
                FragmentDualCameraAdjust.this.notifyZoom2X(false);
            }

            public void onAnimationRepeat(Animator animation) {
            }
        });
        this.mZoomInOutAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_in_out);
        this.mZoomInOutAnimator.setTarget(this.mDualZoomButton);
        this.mZoomInOutAnimator.setInterpolator(new QuadraticEaseOutInterpolator());
        this.mZoomInAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_in);
        this.mZoomInAnimator.setTarget(this.mDualZoomButton);
        this.mZoomInAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        this.mZoomOutAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_out);
        this.mZoomOutAnimator.setTarget(this.mDualZoomButton);
        this.mZoomOutAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        int screenWidth = getResources().getDisplayMetrics().widthPixels;
        this.mHorizontalSlideLayout.getLayoutParams().height = (int) (((((float) screenWidth) / 0.75f) - ((float) screenWidth)) / 2.0f);
        this.mSlideLayoutHeight = this.mHorizontalSlideLayout.getLayoutParams().height;
        adjustViewBackground(this.mHorizontalSlideLayout, this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
        this.mDualZoomButton.setOnTouchListener(new OnTouchListener() {
            private int mMiddleX = (FragmentDualCameraAdjust.this.getResources().getDisplayMetrics().widthPixels / 2);
            private float mTouchDownX = -1.0f;

            public boolean onTouch(View v, MotionEvent event) {
                if (!FragmentDualCameraAdjust.this.mPassTouchFromZoomButtonToSlide) {
                    return false;
                }
                switch (event.getAction()) {
                    case 1:
                    case 3:
                        event.setLocation(((float) this.mMiddleX) + (event.getX() - this.mTouchDownX), event.getY());
                        FragmentDualCameraAdjust.this.mHorizontalSlideView.onTouchEvent(event);
                        FragmentDualCameraAdjust.this.mZoomPopupTouchListener.onTouch(null, event);
                        FragmentDualCameraAdjust.this.mPassTouchFromZoomButtonToSlide = false;
                        this.mTouchDownX = -1.0f;
                        break;
                    case 2:
                        if (this.mTouchDownX != -1.0f) {
                            event.setLocation(((float) this.mMiddleX) + (event.getX() - this.mTouchDownX), event.getY());
                            FragmentDualCameraAdjust.this.mHorizontalSlideView.onTouchEvent(event);
                            FragmentDualCameraAdjust.this.mZoomPopupTouchListener.onTouch(null, event);
                            break;
                        }
                        this.mTouchDownX = event.getX();
                        event.setAction(0);
                        event.setLocation((float) this.mMiddleX, event.getY());
                        FragmentDualCameraAdjust.this.mHorizontalSlideView.onTouchEvent(event);
                        return true;
                }
                return true;
            }
        });
    }

    private void sendHideMessage() {
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 5000);
    }

    private void resetZoomIcon() {
        if (!CameraSettings.isSwitchCameraZoomMode()) {
            this.mZoomRatio = (float) this.mZoomRatioWide;
        } else if ("wide".equals(CameraSettings.getCameraZoomMode(this.mCurrentMode))) {
            this.mZoomRatio = (float) this.mZoomRatioWide;
        } else {
            this.mZoomRatio = (float) this.mZoomRatioTele;
        }
        setZoomText();
    }

    @TargetApi(21)
    public void updateZoomValue() {
        if (!CameraSettings.isSwitchCameraZoomMode()) {
            this.mZoomRatio = CameraSettings.readZoom();
        } else if ("wide".equals(CameraSettings.getCameraZoomMode(this.mCurrentMode))) {
            this.mZoomRatio = (float) this.mZoomRatioWide;
        } else {
            this.mZoomRatio = (float) this.mZoomRatioTele;
        }
        if (!this.mZoomRequestAnimator.isRunning() || this.mZoomRatio == ((float) this.mZoomRatioWide) || this.mZoomRatio == ((float) this.mZoomRatioTele)) {
            setZoomText();
        }
    }

    @TargetApi(21)
    private void setZoomText() {
        this.mStringBuilder.clear();
        int zoomSig = (int) this.mZoomRatio;
        int zoomFraction = (int) ((this.mZoomRatio - ((float) zoomSig)) * 10.0f);
        if (zoomFraction == 0) {
            Util.appendInApi26(this.mStringBuilder, String.valueOf(zoomSig), this.mDigitsTextStyle, 33);
        } else {
            Util.appendInApi26(this.mStringBuilder, zoomSig + "." + zoomFraction, this.mDigitsTextStyle, 33);
        }
        if (Util.isAccessible()) {
            this.mDualZoomButton.setContentDescription(getString(R.string.accessibility_focus_status, new Object[]{this.mStringBuilder}));
            this.mDualZoomButton.postDelayed(new Runnable() {
                public void run() {
                    if (FragmentDualCameraAdjust.this.isAdded()) {
                        FragmentDualCameraAdjust.this.mDualZoomButton.sendAccessibilityEvent(4);
                    }
                }
            }, 3000);
        }
        Util.appendInApi26(this.mStringBuilder, "X", this.mXTextStyle, 33);
        this.mDualZoomButton.setText(this.mStringBuilder);
    }

    public boolean isZoomVisible() {
        return this.mCurrentState == 1 && this.mDualZoomButton.getVisibility() == 0;
    }

    public int visibleHeight() {
        if (this.mCurrentState == -1) {
            return 0;
        }
        if (this.mHorizontalSlideLayout.getVisibility() == 0) {
            return this.mSlideLayoutHeight;
        }
        return this.mDualZoomButton.getHeight();
    }

    public void hideZoomButton() {
        if (this.mCurrentState != -1) {
            this.mCurrentState = -1;
            Completable.create(new AlphaOutOnSubscribe(this.mDualZoomButton)).subscribe();
        }
    }

    public void showZoomButton() {
        if (this.mCurrentState != 1) {
            this.mCurrentState = 1;
            Completable.create(new AlphaInOnSubscribe(this.mDualZoomButton)).subscribe();
        }
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(182, this);
        registerBackStack(modeCoordinator, this);
        if (Device.isSupportedOpticalZoom()) {
            modeCoordinator.attachProtocol(184, this);
        }
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(182, this);
        unRegisterBackStack(modeCoordinator, this);
        if (Device.isSupportedOpticalZoom()) {
            modeCoordinator.detachProtocol(184, this);
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_dual_camera_adjust;
    }

    public int getFragmentInto() {
        return 4084;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        int lastMode = this.mCurrentMode;
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        int newState = -1;
        switch (newMode) {
            case 163:
            case 165:
                newState = 1;
                ViewCompat.setRotation(this.mDualZoomButton, (float) this.mDegree);
                this.mDualZoomButton.setOnLongClickListener(this);
                break;
            case 166:
                newState = 1;
                this.mDualZoomButton.setOnLongClickListener(null);
                break;
        }
        if (newState == 1) {
            onBackEvent(4);
            if (DataRepository.dataItemGlobal().getCurrentCameraId() == 1) {
                newState = -1;
            }
        }
        if (this.mCurrentState == newState) {
            if (newState == 1) {
                resetZoomIcon();
            }
            return;
        }
        this.mCurrentState = newState;
        switch (newState) {
            case -1:
                if (this.mHorizontalSlideLayout.getVisibility() != 0) {
                    if (animateInElements != null && lastMode != 165) {
                        animateInElements.add(Completable.create(new AlphaOutOnSubscribe(this.mDualZoomButton)));
                        break;
                    } else {
                        AlphaOutOnSubscribe.directSetResult(this.mDualZoomButton);
                        break;
                    }
                } else if (animateInElements != null) {
                    animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mDualParentLayout, 80)));
                    break;
                } else {
                    this.mHorizontalSlideLayout.setVisibility(8);
                    break;
                }
                break;
            case 1:
                if (this.mDualParentLayout.getVisibility() != 0) {
                    SlideInOnSubscribe.directSetResult(this.mDualParentLayout, 80);
                }
                SlideOutOnSubscribe.directSetResult(this.mHorizontalSlideLayout, 80);
                ViewCompat.setTranslationY(this.mDualZoomButton, (float) this.mSlideLayoutHeight);
                resetZoomIcon();
                if (animateInElements != null && (newMode != 165 || lastMode == 167)) {
                    if (lastMode != 167) {
                        animateInElements.add(Completable.create(new AlphaInOnSubscribe(this.mDualZoomButton)));
                        break;
                    } else {
                        animateInElements.add(Completable.create(new AlphaInOnSubscribe(this.mDualZoomButton).setStartDelayTime(150)));
                        break;
                    }
                }
                AlphaInOnSubscribe.directSetResult(this.mDualZoomButton);
                break;
                break;
        }
    }

    public boolean onBackEvent(int callingFrom) {
        if (this.mHorizontalSlideLayout.getVisibility() != 0 || this.mDualParentLayout.getVisibility() != 0 || this.mIsHiding) {
            return false;
        }
        hideSlideView();
        return true;
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                switch (v.getId()) {
                    case R.id.dual_camera_zoom_button /*2131361840*/:
                        if (CameraSettings.isSwitchCameraZoomMode()) {
                            toggle();
                        } else if (this.mZoomRatio == ((float) this.mZoomRatioWide)) {
                            CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, "2x");
                            this.mIsZoomTo2X = true;
                            this.mZoomRequestAnimator.setFloatValues(new float[]{this.mZoomRatio, (float) this.mZoomRatioTele});
                            this.mZoomRequestAnimator.start();
                        } else if (this.mZoomRatio <= ((float) this.mZoomRatioTele)) {
                            CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, "1x");
                            this.mIsZoomTo2X = false;
                            this.mZoomRequestAnimator.setFloatValues(new float[]{this.mZoomRatio, (float) this.mZoomRatioWide});
                            this.mZoomRequestAnimator.start();
                        } else {
                            CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, "1x");
                            requestZoomRatio((float) this.mZoomRatioTele, true);
                            requestZoomRatio((float) this.mZoomRatioWide, false);
                        }
                        this.mZoomInOutAnimator.start();
                        onBackEvent(5);
                        break;
                }
            }
        }
    }

    private void notifyZoom2X(boolean isZoomTo2X) {
        ModeProtocol$ManuallyValueChanged manuallyValueChanged = (ModeProtocol$ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null && this.mIsZoomAnimationEnabled) {
            manuallyValueChanged.onDualZoomHappened(isZoomTo2X);
        }
    }

    private void notifyZooming(boolean start) {
        ModeProtocol$ManuallyValueChanged manuallyValueChanged = (ModeProtocol$ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualLensZooming(start);
        }
    }

    private void toggle() {
        ComponentManuallyDualLens dualLens = DataRepository.dataItemConfig().getManuallyDualLens();
        ModeProtocol$ManuallyValueChanged manuallyValueChanged = (ModeProtocol$ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualLensSwitch(dualLens, this.mCurrentMode);
            updateZoomValue();
        }
        CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, "wide".equals(dualLens.getComponentValue(this.mCurrentMode)) ? "1x" : "2x");
    }

    public boolean onLongClick(View v) {
        if (!isEnableClick()) {
            return false;
        }
        switch (v.getId()) {
            case R.id.dual_camera_zoom_button /*2131361840*/:
                initSlideZoomView(new ComponentManuallyDualZoom(DataRepository.dataItemRunning()));
                showSlideView();
                this.mPassTouchFromZoomButtonToSlide = true;
                return true;
            default:
                return false;
        }
    }

    private void initSlideZoomView(ComponentData data) {
        this.mSlidingAdapter = new ExtraSlideZoomAdapter(getContext(), data, this.mCurrentMode, this);
        this.mHorizontalSlideView.setOnPositionSelectListener(this.mSlidingAdapter);
        this.mHorizontalSlideView.setJustifyEnabled(false);
        this.mHorizontalSlideView.setDrawAdapter(this.mSlidingAdapter);
        this.mHorizontalSlideView.setSelection(this.mSlidingAdapter.mapZoomRatioToPosition(CameraSettings.readZoom()) / ((float) (this.mSlidingAdapter.getCount() - 1)));
    }

    private void showSlideView() {
        this.mIsHiding = false;
        this.mSlidingAdapter.setEnable(true);
        this.mHorizontalSlideLayout.setVisibility(0);
        ViewCompat.setTranslationY(this.mHorizontalSlideLayout, (float) this.mSlideLayoutHeight);
        Completable.create(new TranslateYOnSubscribe(this.mHorizontalSlideLayout, 0).setInterpolator(new DecelerateInterpolator())).subscribe();
        ViewCompat.setTranslationY(this.mDualZoomButton, (float) this.mSlideLayoutHeight);
        Completable.create(new TranslateYOnSubscribe(this.mDualZoomButton, 0).setInterpolator(new BackEaseOutInterpolator())).subscribe();
        notifyTipsMargin(this.mSlideLayoutHeight);
    }

    private void hideSlideView() {
        this.mIsHiding = true;
        this.mSlidingAdapter.setEnable(false);
        Completable.create(new TranslateYOnSubscribe(this.mHorizontalSlideLayout, this.mSlideLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe(new Action() {
            public void run() throws Exception {
                FragmentDualCameraAdjust.this.mIsHiding = false;
                FragmentDualCameraAdjust.this.mHorizontalSlideLayout.setVisibility(4);
            }
        });
        ViewCompat.setTranslationY(this.mDualZoomButton, 0.0f);
        Completable.create(new TranslateYOnSubscribe(this.mDualZoomButton, this.mSlideLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe();
        notifyTipsMargin(0);
    }

    private void notifyTipsMargin(int margin) {
        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).updateTipBottomMargin(margin, true);
    }

    public void onManuallyDataChanged(ComponentData componentData, String oldValue, String newValue, boolean isCustomValue) {
        if (!isInModeChanging()) {
            requestZoomRatio(Float.valueOf(newValue).floatValue(), false);
        }
    }

    private void requestZoomRatio(float newRatio, boolean sync) {
        ModeProtocol$ManuallyValueChanged manuallyValueChanged = (ModeProtocol$ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualZoomValueChanged(newRatio, sync);
        }
    }

    public void provideRotateItem(List<View> pendingRotateItems, int degree) {
        super.provideRotateItem(pendingRotateItems, degree);
        if (this.mDualZoomButton.getVisibility() == 0) {
            pendingRotateItems.add(this.mDualZoomButton);
        }
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        switch (dataChangeType) {
            case 3:
                adjustViewBackground(this.mHorizontalSlideLayout, this.mCurrentMode);
                break;
        }
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    private void adjustViewBackground(View view, int currentMode) {
        view.setBackgroundResource(R.color.fullscreen_background);
    }

    public void setSnapNumVisible(boolean visible) {
        if (visible) {
            if (this.mHorizontalSlideLayout.getVisibility() == 0) {
                hideSlideView();
            }
            this.mZoomInAnimator.start();
            return;
        }
        this.mZoomOutAnimator.start();
        updateZoomValue();
    }

    public void setSnapNumValue(int number) {
        if (this.mSnapStyle == null) {
            this.mSnapStyle = new TextAppearanceSpan(getContext(), R.style.SnapTipTextStyle);
        }
        this.mStringBuilder.clear();
        Util.appendInApi26(this.mStringBuilder, String.format("%02d", new Object[]{Integer.valueOf(number)}), this.mSnapStyle, 33);
        this.mDualZoomButton.setText(this.mStringBuilder);
    }
}
