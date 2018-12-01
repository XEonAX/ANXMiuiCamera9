package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.StringRes;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.OvershootInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol$DualController;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.statistic.CameraStat;
import com.sensetime.stmobile.STCommon;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.BackEaseOutInterpolator;

public class FragmentBottomPopupTips extends BaseFragment implements OnClickListener, ModeProtocol$BottomPopupTips, ModeProtocol$HandleBackTrace {
    private View mBeautyIntroButton;
    private int mBeautyIntroRadius;
    private AnimatorSet mBeautyIntroShowAnimator;
    private TextView mBeautyIntroText;
    private int mBeautyIntroWidth;
    @StringRes
    private int mCurrentTipMessage;
    private int mCurrentTipType;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    ViewCompat.animate(FragmentBottomPopupTips.this.mTipMessage).alpha(0.0f).withEndAction(new Runnable() {
                        public void run() {
                            FragmentBottomPopupTips.this.mTipMessage.setVisibility(8);
                            if (!(FragmentBottomPopupTips.this.mLastTipType != 6 || FragmentBottomPopupTips.this.mCurrentTipType == 8 || (FragmentBottomPopupTips.this.isPortraitHintVisible() ^ 1) == 0)) {
                                FragmentBottomPopupTips.this.showTips(FragmentBottomPopupTips.this.mLastTipType, FragmentBottomPopupTips.this.mLastTipMessage, 4);
                            }
                            FragmentBottomPopupTips.this.mLastTipType = 4;
                        }
                    }).start();
                    return;
                default:
                    return;
            }
        }
    };
    @StringRes
    private int mLastTipMessage;
    private int mLastTipType;
    private View mPortraitSuccessHint;
    private TextView mQrCodeButton;
    private View mRootView;
    private boolean mShowBeautyIntro;
    private ImageView mTipImage;
    private TextView mTipMessage;

    @Retention(RetentionPolicy.SOURCE)
    @interface TipImageType {
    }

    protected void initView(View v) {
        this.mRootView = v;
        this.mTipImage = (ImageView) v.findViewById(R.id.popup_tip_image);
        this.mBeautyIntroButton = v.findViewById(R.id.popup_tip_beauty_intro);
        this.mBeautyIntroText = (TextView) v.findViewById(R.id.popup_tip_beauty_intro_text);
        this.mQrCodeButton = (TextView) v.findViewById(R.id.popup_tips_qrcode);
        this.mTipMessage = (TextView) v.findViewById(R.id.popup_tips_message);
        this.mPortraitSuccessHint = v.findViewById(R.id.portrait_success_hint);
        ((MarginLayoutParams) v.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mTipImage.setOnClickListener(this);
        this.mQrCodeButton.setOnClickListener(this);
        this.mBeautyIntroButton.setOnClickListener(this);
        adjustViewBackground(this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
        this.mBeautyIntroRadius = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_radius);
        this.mBeautyIntroText.measure(0, 0);
        int textWidth = this.mBeautyIntroText.getMeasuredWidth();
        int leftPadding = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_left_padding);
        int rightPadding = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_right_padding);
        this.mBeautyIntroWidth = (((textWidth + leftPadding) + rightPadding) + ((this.mBeautyIntroRadius - leftPadding) * 2)) + getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_text_margin_left);
        initBeautyIntroAnimator();
        resetBeautyIntro();
    }

    private void resetBeautyIntro() {
        this.mBeautyIntroShowAnimator.cancel();
        setBeautyIntroButtonWidth(this.mBeautyIntroWidth);
        this.mBeautyIntroText.setAlpha(1.0f);
    }

    private void initBeautyIntroAnimator() {
        ValueAnimator shapeAnimator = ValueAnimator.ofInt(new int[]{this.mBeautyIntroWidth, this.mBeautyIntroRadius * 2});
        shapeAnimator.setDuration(300);
        ObjectAnimator.ofFloat(this.mBeautyIntroText, "alpha", new float[]{1.0f, 0.0f}).setDuration(250);
        shapeAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator animation) {
                FragmentBottomPopupTips.this.setBeautyIntroButtonWidth(((Integer) animation.getAnimatedValue()).intValue());
            }
        });
        this.mBeautyIntroShowAnimator = new AnimatorSet();
        this.mBeautyIntroShowAnimator.playTogether(new Animator[]{shapeAnimator, alphaAnimator});
        this.mBeautyIntroShowAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 0.1f));
        this.mBeautyIntroShowAnimator.setStartDelay(2000);
        this.mBeautyIntroShowAnimator.addListener(new AnimatorListenerAdapter() {
            private boolean mCancelled;

            public void onAnimationStart(Animator animation) {
                this.mCancelled = false;
            }

            public void onAnimationCancel(Animator animation) {
                this.mCancelled = true;
            }

            public void onAnimationEnd(Animator animation) {
                if (!this.mCancelled) {
                    AlphaOutOnSubscribe.directSetResult(FragmentBottomPopupTips.this.mBeautyIntroButton);
                    AlphaInOnSubscribe.directSetResult(FragmentBottomPopupTips.this.mTipImage);
                }
            }
        });
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_popup_tips;
    }

    public int getFragmentInto() {
        return 4081;
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(175, this);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(175, this);
        unRegisterBackStack(modeCoordinator, this);
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                switch (v.getId()) {
                    case R.id.popup_tip_image /*2131361825*/:
                    case R.id.popup_tip_beauty_intro /*2131361826*/:
                        int type = ((Integer) v.getTag()).intValue();
                        hideTipImage();
                        hideTipBeautyIntro();
                        CameraSettings.setPopupTipBeautyIntroClicked();
                        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                        switch (type) {
                            case 2:
                                baseDelegate.delegateEvent(4);
                                break;
                            case 3:
                                baseDelegate.delegateEvent(2);
                                ModeProtocol$ActionProcessing processing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                                if (processing != null && processing.isShowFilter()) {
                                    processing.showOrHideFilter();
                                    break;
                                }
                        }
                        break;
                    case R.id.popup_tips_qrcode /*2131361829*/:
                        hideQrCodeTip();
                        CameraStat.recordCountEvent("counter", "qrcode_detected");
                        ((ModeProtocol$CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195)).showQRCodeResult();
                        break;
                }
            }
        }
    }

    public void hideTipImage() {
        if (this.mTipImage.getVisibility() != 4) {
            this.mTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mTipImage)).subscribe();
        }
    }

    private void hideTipBeautyIntro() {
        if (this.mBeautyIntroButton.getVisibility() == 0) {
            this.mBeautyIntroButton.setTag(Integer.valueOf(-1));
            this.mTipImage.setTag(Integer.valueOf(-1));
            this.mBeautyIntroShowAnimator.pause();
            Completable.create(new AlphaOutOnSubscribe(this.mBeautyIntroButton)).subscribe();
        }
    }

    public void reInitTipImage() {
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    public void updateTipBottomMargin(int margin, boolean animation) {
        if (this.mRootView.getPaddingTop() < margin) {
            this.mRootView.setPadding(0, (int) (((float) margin) * 1.2f), 0, 0);
        }
        if (!animation) {
            TranslateYOnSubscribe.directSetResult(this.mRootView, -margin);
        } else if (((float) margin) < ViewCompat.getTranslationY(this.mRootView)) {
            Completable.create(new TranslateYOnSubscribe(this.mRootView, -margin).setInterpolator(new OvershootInterpolator())).subscribe();
        } else {
            Completable.create(new TranslateYOnSubscribe(this.mRootView, -margin).setInterpolator(new BackEaseOutInterpolator())).subscribe();
        }
    }

    public void showTips(int tipType, @StringRes int tipsResId, int tipDuration) {
        if (tipType != 6 || this.mCurrentMode == 171) {
            this.mLastTipType = this.mCurrentTipType;
            this.mLastTipMessage = this.mCurrentTipMessage;
            this.mCurrentTipType = tipType;
            this.mCurrentTipMessage = tipsResId;
            hideTip(this.mQrCodeButton);
            reIntTipViewMarginBottom(this.mTipMessage);
            AlphaInOnSubscribe.directSetResult(this.mTipMessage);
            this.mTipMessage.setText(tipsResId);
            if (Util.isAccessible()) {
                this.mTipMessage.setContentDescription(getString(this.mCurrentTipMessage));
                this.mTipMessage.postDelayed(new Runnable() {
                    public void run() {
                        if (FragmentBottomPopupTips.this.isAdded()) {
                            FragmentBottomPopupTips.this.mTipMessage.sendAccessibilityEvent(4);
                        }
                    }
                }, 3000);
            }
            int duration = 0;
            switch (tipDuration) {
                case 1:
                    duration = 1000;
                    break;
                case 2:
                    duration = 5000;
                    break;
                case 3:
                    duration = 15000;
                    break;
            }
            this.mHandler.removeCallbacksAndMessages(null);
            if (duration > 0) {
                this.mHandler.sendEmptyMessageDelayed(1, (long) duration);
            }
        }
    }

    private void reIntTipViewMarginBottom(View view) {
        int newBottomMargin;
        MarginLayoutParams layoutParams = (MarginLayoutParams) view.getLayoutParams();
        ModeProtocol$DualController dualController = (ModeProtocol$DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        ModeProtocol$ManuallyAdjust manuallyAdjust = (ModeProtocol$ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        if (this.mCurrentMode == 165) {
            newBottomMargin = ((((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2) + (getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal) / 2);
        } else if (manuallyAdjust != null && manuallyAdjust.visibleHeight() > 0) {
            newBottomMargin = manuallyAdjust.visibleHeight();
        } else if (this.mTipImage.getVisibility() == 0) {
            newBottomMargin = this.mTipImage.getHeight();
        } else if (dualController == null || !dualController.isZoomVisible()) {
            ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) != 252) {
                newBottomMargin = getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal);
            } else {
                newBottomMargin = getResources().getDimensionPixelSize(R.dimen.beautycamera_popup_fragment_height);
            }
        } else {
            newBottomMargin = dualController.visibleHeight();
        }
        if (layoutParams.bottomMargin != newBottomMargin) {
            layoutParams.bottomMargin = newBottomMargin;
            view.setLayoutParams(layoutParams);
        }
    }

    public void directlyHideTips() {
        ViewCompat.animate(this.mTipMessage).cancel();
        this.mHandler.removeCallbacksAndMessages(null);
        if (this.mTipMessage.getVisibility() == 0) {
            this.mTipMessage.setVisibility(8);
            if (this.mLastTipType == 6 && (isPortraitHintVisible() ^ 1) != 0) {
                showTips(this.mLastTipType, this.mLastTipMessage, 4);
            }
            this.mLastTipType = 4;
        }
    }

    public boolean containTips(@StringRes int tokenResId) {
        if (this.mTipMessage.getVisibility() == 0) {
            return getString(tokenResId).equals(this.mTipMessage.getText().toString());
        }
        return false;
    }

    public void setPortraitHintVisible(int visible) {
        this.mLastTipType = visible == 0 ? 7 : 4;
        directlyHideTips();
        if (visible == 0) {
            reIntTipViewMarginBottom(this.mPortraitSuccessHint);
        }
        this.mPortraitSuccessHint.setVisibility(visible);
    }

    public boolean isPortraitHintVisible() {
        return this.mPortraitSuccessHint.getVisibility() == 0;
    }

    public void showQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 0) {
            hideTip(this.mTipMessage);
            reIntTipViewMarginBottom(this.mQrCodeButton);
            AlphaInOnSubscribe.directSetResult(this.mQrCodeButton);
            if (Util.isAccessible()) {
                this.mQrCodeButton.postDelayed(new Runnable() {
                    public void run() {
                        FragmentBottomPopupTips.this.mQrCodeButton.sendAccessibilityEvent(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
                    }
                }, 100);
            }
        }
    }

    public void hideQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 8) {
            this.mQrCodeButton.setVisibility(8);
        }
    }

    public boolean onBackEvent(int callingFrom) {
        switch (callingFrom) {
            case 2:
                break;
            case 3:
                if (this.mCurrentTipType == 6 || this.mCurrentTipType == 7) {
                    return false;
                }
        }
        hideTip(this.mTipMessage);
        hideTip(this.mPortraitSuccessHint);
        hideTip(this.mQrCodeButton);
        this.mHandler.removeCallbacksAndMessages(null);
        return false;
    }

    private boolean hideTip(View view) {
        if (view.getVisibility() == 8) {
            return false;
        }
        view.setVisibility(8);
        return true;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        int lastMode = this.mCurrentMode;
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        onBackEvent(4);
        updateTipBottomMargin(0, false);
        updateTipImage(newMode, lastMode, animateInElements);
    }

    private void setBeautyIntroButtonWidth(int width) {
        LayoutParams lp = this.mBeautyIntroButton.getLayoutParams();
        lp.width = width;
        this.mBeautyIntroButton.setLayoutParams(lp);
    }

    private void startBeautyIntroShowAnimation() {
        this.mBeautyIntroButton.setTag(Integer.valueOf(3));
        resetBeautyIntro();
        Completable.create(new AlphaInOnSubscribe(this.mBeautyIntroButton)).subscribe();
        CameraSettings.addPopupTipBeautyIntroShowTimes();
        this.mBeautyIntroShowAnimator.start();
    }

    private void updateTipImage(int newMode, int lastMode, List<Completable> animateInElements) {
        int newType = -1;
        switch (newMode) {
            case 163:
            case 165:
                if (CameraSettings.isFrontCamera()) {
                    newType = 3;
                    break;
                }
                break;
            case 171:
                if (!CameraSettings.isFrontCamera() || !Device.isSupportedFrontPortrait()) {
                    newType = -1;
                    break;
                } else {
                    newType = 3;
                    break;
                }
            default:
                newType = -1;
                break;
        }
        int newImageResourceId = 0;
        int newContentDescriptionStrId = 0;
        boolean inOrOut = true;
        switch (newType) {
            case -1:
                inOrOut = false;
                break;
            case 2:
                newImageResourceId = R.drawable.ic_beauty_sticker;
                break;
            case 3:
                newImageResourceId = R.drawable.ic_beauty_magic;
                newContentDescriptionStrId = R.string.accessibility_beauty_panel_open;
                break;
        }
        if (newImageResourceId > 0) {
            this.mTipImage.setImageResource(newImageResourceId);
        }
        if (newContentDescriptionStrId > 0 && Util.isAccessible()) {
            this.mTipImage.setContentDescription(getString(newContentDescriptionStrId));
        }
        if (this.mTipImage.getTag() == null || ((Integer) this.mTipImage.getTag()).intValue() != newType) {
            int animType;
            if (inOrOut) {
                ViewCompat.setRotation(this.mTipImage, (float) this.mDegree);
            }
            this.mTipImage.setTag(Integer.valueOf(newType));
            this.mShowBeautyIntro = false;
            if (animateInElements == null) {
                if (inOrOut) {
                    animType = 0;
                } else {
                    animType = 1;
                }
            } else if (inOrOut) {
                boolean isPopupTipBeautyIntroEnable;
                if (lastMode != 165) {
                    animType = 2;
                } else if (Device.isSupportedOpticalZoom()) {
                    animType = 0;
                } else {
                    animType = 3;
                }
                if (newType == 3) {
                    isPopupTipBeautyIntroEnable = CameraSettings.isPopupTipBeautyIntroEnable();
                } else {
                    isPopupTipBeautyIntroEnable = false;
                }
                this.mShowBeautyIntro = isPopupTipBeautyIntroEnable;
            } else if (lastMode == 165 || this.mCurrentMode == 165) {
                animType = 1;
            } else {
                animType = 4;
            }
            switch (animType) {
                case 0:
                    if (!this.mShowBeautyIntro) {
                        AlphaInOnSubscribe.directSetResult(this.mTipImage);
                        break;
                    }
                    break;
                case 1:
                    if (!this.mBeautyIntroButton.isShown()) {
                        AlphaOutOnSubscribe.directSetResult(this.mTipImage);
                        break;
                    }
                    this.mBeautyIntroShowAnimator.pause();
                    AlphaOutOnSubscribe.directSetResult(this.mBeautyIntroButton);
                    break;
                case 2:
                    if (!this.mShowBeautyIntro) {
                        animateInElements.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage)));
                        break;
                    }
                    break;
                case 3:
                    if (!this.mShowBeautyIntro) {
                        animateInElements.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    }
                    break;
                case 4:
                    if (!this.mBeautyIntroButton.isShown()) {
                        animateInElements.add(Completable.create(new AlphaOutOnSubscribe(this.mTipImage)));
                        break;
                    }
                    this.mBeautyIntroShowAnimator.pause();
                    animateInElements.add(Completable.create(new AlphaOutOnSubscribe(this.mBeautyIntroButton)));
                    break;
            }
        }
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        if (lastFragmentInfo == 240 || lastFragmentInfo == getFragmentInto()) {
            return null;
        }
        return FragmentAnimationFactory.wrapperAnimation(161);
    }

    public void provideRotateItem(List<View> pendingRotateItems, int degree) {
        super.provideRotateItem(pendingRotateItems, degree);
        if (this.mTipImage.getVisibility() == 0) {
            pendingRotateItems.add(this.mTipImage);
        }
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        switch (dataChangeType) {
            case 2:
                directlyHideTips();
                break;
            case 3:
                adjustViewBackground(this.mCurrentMode);
                break;
        }
        updateTipImage(this.mCurrentMode, this.mCurrentMode, null);
    }

    public void notifyAfterFrameAvailable(int arrivedType) {
        super.notifyAfterFrameAvailable(arrivedType);
        if (this.mShowBeautyIntro) {
            startBeautyIntroShowAnimation();
        }
        this.mShowBeautyIntro = false;
    }

    private void adjustViewBackground(int currentMode) {
        switch (DataRepository.dataItemRunning().getUiStyle()) {
            case 1:
            case 3:
                this.mQrCodeButton.setBackgroundResource(R.drawable.btn_camera_mode_exit_full_screen);
                return;
            default:
                this.mQrCodeButton.setBackgroundResource(R.drawable.btn_camera_mode_exit);
                return;
        }
    }
}
