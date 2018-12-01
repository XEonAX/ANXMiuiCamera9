package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.graphics.drawable.RoundedBitmapDrawable;
import android.support.v4.graphics.drawable.RoundedBitmapDrawableFactory;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v7.recyclerview.R;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.data.global.ComponentModuleList;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.VideoModule;
import com.android.camera.module.loader.StartControl;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$CameraActionTrack;
import com.android.camera.protocol.ModeProtocol$FilterSwitcher;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ModeChangeController;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.ui.CameraSnapView;
import com.android.camera.ui.CameraSnapView.SnapListener;
import com.android.camera.ui.EdgeHorizonScrollView;
import com.android.camera.ui.ModeSelectView;
import com.android.camera.ui.ModeSelectView.onModeClickedListener;
import com.sensetime.stmobile.STCommon;
import com.sensetime.stmobile.STMobileHumanActionNative;
import io.reactivex.Completable;
import java.util.List;
import java.util.Locale;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseOutInterpolator;

public class FragmentBottomAction extends BaseFragment implements OnClickListener, ModeProtocol$ModeChangeController, ModeProtocol$ActionProcessing, ModeProtocol$FilterSwitcher, ModeProtocol$HandleBackTrace, onModeClickedListener, SnapListener {
    private ValueAnimator mBottomAnimator;
    private boolean mCameraPickEnable;
    private View mCameraPicker;
    private ImageView mCameraPickerRes;
    private int mCaptureProgressDelay;
    private ComponentModuleList mComponentModuleList;
    private CubicEaseOutInterpolator mCubicEaseOut;
    private EdgeHorizonScrollView mEdgeHorizonScrollView;
    private View mFilterLayout;
    private int mFilterListHeight;
    private FragmentFilter mFragmentFilter;
    @SuppressLint({"HandlerLeak"})
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    FragmentBottomAction.this.mThumbnailProgress.setVisibility(0);
                    return;
                default:
                    return;
            }
        }
    };
    private boolean mInLoading;
    private boolean mIsIntentAction;
    private boolean mIsShowFilter = false;
    private boolean mLongPressBurst;
    private View mModeSelectLayout;
    private ModeSelectView mModeSelectView;
    private int mRecordProgressDelay;
    private ImageView mRecordingPause;
    private ImageView mRecordingSnap;
    private CameraSnapView mShutterButton;
    private SineEaseOutInterpolator mSineEaseOut;
    private ImageView mThumbnailImage;
    private ViewGroup mThumbnailImageLayout;
    private ProgressBar mThumbnailProgress;
    private RelativeLayout mV9bottomParentLayout;
    private boolean mVideoCaptureEnable;
    private boolean mVideoPauseSupported;
    private boolean mVideoRecordingStarted;

    protected void initView(View v) {
        ((MarginLayoutParams) v.getLayoutParams()).height = Util.getBottomHeight(getResources());
        this.mV9bottomParentLayout = (RelativeLayout) v.findViewById(R.id.v9_bottom_parent);
        ((MarginLayoutParams) this.mV9bottomParentLayout.getLayoutParams()).bottomMargin = getResources().getDimensionPixelSize(R.dimen.bottom_margin_bottom) + Util.sNavigationBarHeight;
        this.mComponentModuleList = DataRepository.dataItemGlobal().getComponentModuleList();
        this.mModeSelectLayout = v.findViewById(R.id.mode_select_layout);
        this.mEdgeHorizonScrollView = (EdgeHorizonScrollView) this.mModeSelectLayout.findViewById(R.id.mode_select_scrollview);
        this.mModeSelectView = (ModeSelectView) this.mModeSelectLayout.findViewById(R.id.mode_select);
        this.mModeSelectView.init(this.mComponentModuleList, this.mCurrentMode);
        this.mModeSelectView.setOnModeClickedListener(this);
        this.mThumbnailImageLayout = (ViewGroup) v.findViewById(R.id.v9_thumbnail_layout);
        this.mThumbnailImage = (ImageView) this.mThumbnailImageLayout.findViewById(R.id.v9_thumbnail_image);
        this.mThumbnailProgress = (ProgressBar) v.findViewById(R.id.v9_recording_progress);
        this.mRecordingPause = (ImageView) v.findViewById(R.id.v9_recording_pause);
        this.mShutterButton = (CameraSnapView) v.findViewById(R.id.v9_shutter_button_internal);
        this.mCameraPicker = v.findViewById(R.id.v9_camera_picker);
        this.mCameraPickerRes = (ImageView) v.findViewById(R.id.v9_camera_picker_res);
        this.mRecordingSnap = (ImageView) v.findViewById(R.id.v9_recording_snap);
        this.mFilterLayout = v.findViewById(R.id.fragment_filter);
        this.mShutterButton.setCurrentMode(this.mCurrentMode, false);
        this.mShutterButton.setSnapListener(this);
        this.mShutterButton.setEnabled(false);
        this.mCaptureProgressDelay = getResources().getInteger(R.integer.capture_progress_delay_time);
        this.mRecordProgressDelay = getResources().getInteger(R.integer.record_progress_delay_time);
        this.mThumbnailImageLayout.setOnClickListener(this);
        this.mCameraPicker.setOnClickListener(this);
        this.mRecordingPause.setOnClickListener(this);
        this.mRecordingSnap.setOnClickListener(this);
        adjustViewBackground(this.mModeSelectLayout, this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
        this.mIsIntentAction = DataRepository.dataItemGlobal().isIntentAction();
        this.mCubicEaseOut = new CubicEaseOutInterpolator();
        this.mSineEaseOut = new SineEaseOutInterpolator();
        this.mFilterListHeight = getContext().getResources().getDimensionPixelSize(R.dimen.filter_still_height);
        this.mFilterLayout = v.findViewById(R.id.fragment_filter);
        this.mFragmentFilter = new FragmentFilter();
        FragmentUtils.addFragmentWithTag(getChildFragmentManager(), R.id.fragment_filter, this.mFragmentFilter, this.mFragmentFilter.getFragmentTag());
        if (Util.isAccessible()) {
            Util.setAccessibilityFocusable(this.mV9bottomParentLayout, false);
        }
    }

    public void onResume() {
        super.onResume();
        initThumbLayoutByIntent();
    }

    private void initThumbLayoutByIntent() {
        if (this.mIsIntentAction) {
            this.mThumbnailImage.setBackground(null);
            ((MarginLayoutParams) this.mThumbnailImage.getLayoutParams()).setMargins(0, 0, 0, 0);
            this.mThumbnailImage.setImageResource(R.drawable.v6_ic_image_capture_cancel_normal);
        } else {
            ActivityBase activityBase = (ActivityBase) getContext();
            if ((activityBase.startFromSecureKeyguard() || activityBase.isGalleryLocked()) && (activityBase.isGalleryBack() ^ 1) != 0) {
                activityBase.getThumbnailUpdater().setThumbnail(null, true, false);
                return;
            }
            activityBase.getThumbnailUpdater().getLastThumbnail();
        }
    }

    public boolean isShowFilter() {
        return this.mIsShowFilter;
    }

    public boolean switchFilter(int gravity) {
        boolean z = false;
        if (!this.mIsShowFilter) {
            return false;
        }
        ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction != null) {
            z = cameraAction.isDoingAction();
        }
        if (!z) {
            this.mFragmentFilter.switchFilter(gravity);
        }
        return true;
    }

    public void filterUiChange() {
        this.mFragmentFilter.updateFilterData();
    }

    public void showOrHideFilter() {
        if (this.mIsShowFilter) {
            this.mFragmentFilter.delayShowSelected(false);
            ViewCompat.setAlpha(this.mEdgeHorizonScrollView, 0.0f);
            ViewCompat.animate(this.mEdgeHorizonScrollView).setStartDelay(50).setDuration(250).alpha(1.0f).setInterpolator(this.mSineEaseOut).start();
            ViewCompat.setTranslationY(this.mEdgeHorizonScrollView, (float) this.mFilterListHeight);
            ViewCompat.animate(this.mEdgeHorizonScrollView).setDuration(300).translationY(0.0f).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setTranslationY(this.mV9bottomParentLayout, 50.0f);
            ViewCompat.animate(this.mV9bottomParentLayout).setDuration(300).translationY(0.0f).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setScaleX(this.mShutterButton, 0.9f);
            ViewCompat.setScaleY(this.mShutterButton, 0.9f);
            ViewCompat.animate(this.mShutterButton).setDuration(300).scaleX(1.0f).scaleY(1.0f).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setAlpha(this.mFilterLayout, 1.0f);
            ViewCompat.animate(this.mFilterLayout).setDuration(150).alpha(0.0f).setInterpolator(this.mSineEaseOut).start();
            ViewCompat.setTranslationY(this.mFilterLayout, 0.0f);
            ViewCompat.animate(this.mFilterLayout).setDuration(300).translationY((float) (-this.mFilterListHeight)).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                public void onAnimationStart(View view) {
                    FragmentBottomAction.this.mModeSelectView.setVisibility(0);
                }

                public void onAnimationEnd(View view) {
                    FragmentBottomAction.this.mFilterLayout.setVisibility(8);
                }

                public void onAnimationCancel(View view) {
                }
            }).start();
            if (Util.isAccessible()) {
                this.mFilterLayout.setContentDescription(getString(R.string.accessibility_filter_pad_close));
                this.mFilterLayout.sendAccessibilityEvent(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
            }
        } else {
            this.mFragmentFilter.delayShowSelected(true);
            ViewCompat.setAlpha(this.mEdgeHorizonScrollView, 1.0f);
            ViewCompat.animate(this.mEdgeHorizonScrollView).setDuration(150).alpha(0.0f).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setTranslationY(this.mEdgeHorizonScrollView, 0.0f);
            ViewCompat.animate(this.mEdgeHorizonScrollView).setDuration(300).translationY((float) this.mFilterListHeight).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setTranslationY(this.mV9bottomParentLayout, 0.0f);
            ViewCompat.animate(this.mV9bottomParentLayout).setDuration(300).translationY(50.0f).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setScaleX(this.mShutterButton, 1.0f);
            ViewCompat.setScaleY(this.mShutterButton, 1.0f);
            ViewCompat.animate(this.mShutterButton).setDuration(300).scaleX(0.9f).scaleY(0.9f).setInterpolator(this.mCubicEaseOut).start();
            ViewCompat.setTranslationY(this.mFilterLayout, (float) (-this.mFilterListHeight));
            ViewCompat.setAlpha(this.mFilterLayout, 0.0f);
            ViewCompat.animate(this.mFilterLayout).setDuration(300).translationY(0.0f).alpha(1.0f).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                public void onAnimationStart(View view) {
                    FragmentBottomAction.this.mFilterLayout.setVisibility(0);
                }

                public void onAnimationEnd(View view) {
                    FragmentBottomAction.this.mModeSelectView.setVisibility(8);
                }

                public void onAnimationCancel(View view) {
                }
            }).start();
        }
        this.mIsShowFilter ^= 1;
    }

    public void setClickEnable(boolean enable) {
        super.setClickEnable(enable);
        this.mShutterButton.setEnabled(enable);
    }

    private void adjustViewBackground(View view, int currentMode) {
        if (currentMode == 165) {
            view.setBackgroundResource(R.color.black);
            return;
        }
        switch (DataRepository.dataItemRunning().getUiStyle()) {
            case 1:
            case 3:
                view.setBackgroundResource(R.color.fullscreen_background);
                break;
            default:
                view.setBackgroundResource(R.color.black);
                break;
        }
    }

    public void updateThumbnail(Thumbnail thumbnail, boolean animation) {
        this.mHandler.removeCallbacksAndMessages(null);
        this.mInLoading = false;
        if (this.mThumbnailProgress.getVisibility() != 8) {
            this.mThumbnailProgress.setVisibility(8);
        }
        if (!this.mIsIntentAction && !this.mVideoRecordingStarted) {
            if (thumbnail == null) {
                this.mThumbnailImage.setImageResource(R.drawable.ic_thumbnail_background);
                return;
            }
            RoundedBitmapDrawable roundedBitmapDrawable = RoundedBitmapDrawableFactory.create(getResources(), thumbnail.getBitmap());
            roundedBitmapDrawable.getPaint().setAntiAlias(true);
            roundedBitmapDrawable.setCircular(true);
            this.mThumbnailImage.setImageDrawable(roundedBitmapDrawable);
            if (animation) {
                ViewCompat.setAlpha(this.mThumbnailImageLayout, 0.3f);
                ViewCompat.setScaleX(this.mThumbnailImageLayout, 0.5f);
                ViewCompat.setScaleY(this.mThumbnailImageLayout, 0.5f);
                ViewCompat.animate(this.mThumbnailImageLayout).alpha(1.0f).scaleX(1.0f).scaleY(1.0f).setDuration(80).start();
            }
        }
    }

    private boolean isThumbLoading() {
        return this.mInLoading;
    }

    public void updateLoading(boolean hideOrShowThumbProgress) {
        if (!hideOrShowThumbProgress) {
            if (!this.mIsIntentAction) {
                this.mInLoading = true;
                switch (this.mCurrentMode) {
                    case 161:
                    case 162:
                    case 166:
                        this.mHandler.sendEmptyMessageDelayed(1, (long) this.mRecordProgressDelay);
                        break;
                    default:
                        this.mHandler.sendEmptyMessageDelayed(1, (long) this.mCaptureProgressDelay);
                        break;
                }
            }
            return;
        }
        this.mInLoading = false;
        this.mHandler.removeCallbacksAndMessages(null);
        this.mThumbnailProgress.setVisibility(8);
    }

    public void processingStart() {
        this.mEdgeHorizonScrollView.setEnabled(false);
        this.mModeSelectView.setEnabled(false);
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 166:
            case 168:
            case 169:
            case 170:
                if (!this.mVideoRecordingStarted) {
                    prepareRecording();
                    this.mVideoRecordingStarted = true;
                }
                this.mShutterButton.triggerAnimation(this.mCurrentMode, true);
                return;
            default:
                return;
        }
    }

    public void processingPause() {
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 168:
            case 169:
            case 170:
                this.mShutterButton.pauseRecording();
                this.mRecordingPause.setImageResource(R.drawable.ic_recording_resume);
                ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).setRecordingTimeState(3);
                return;
            default:
                return;
        }
    }

    public void processingResume() {
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 168:
            case 169:
            case 170:
                this.mShutterButton.resumeRecording();
                this.mRecordingPause.setImageResource(R.drawable.ic_recording_pause);
                ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).setRecordingTimeState(4);
                return;
            default:
                return;
        }
    }

    public void processingFinish() {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentBottomAction.this.mEdgeHorizonScrollView.setEnabled(true);
                FragmentBottomAction.this.mModeSelectView.setEnabled(true);
                FragmentBottomAction.this.mVideoRecordingStarted = false;
                FragmentBottomAction.this.resetBottom();
            }
        });
    }

    public void processingFailed() {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentBottomAction.this.mEdgeHorizonScrollView.setEnabled(true);
                FragmentBottomAction.this.mModeSelectView.setEnabled(true);
                FragmentBottomAction.this.mVideoRecordingStarted = false;
                FragmentBottomAction.this.updateLoading(true);
                FragmentBottomAction.this.resetBottom();
            }
        });
    }

    public void processingAudioCapture(boolean start) {
        if (start) {
            this.mShutterButton.startRing();
        } else {
            this.mShutterButton.stopRing();
        }
    }

    private void resetBottom() {
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 166:
            case 168:
            case 169:
            case 170:
                ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).setRecordingTimeState(2);
                this.mShutterButton.triggerAnimation(this.mCurrentMode, false);
                updateBottomInRecording(false);
                return;
            default:
                return;
        }
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(179, this);
        modeCoordinator.attachProtocol(162, this);
        modeCoordinator.attachProtocol(183, this);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(179, this);
        modeCoordinator.detachProtocol(162, this);
        modeCoordinator.detachProtocol(183, this);
        unRegisterBackStack(modeCoordinator, this);
        FragmentTransaction fragmentTransaction = getChildFragmentManager().beginTransaction();
        if (this.mFragmentFilter != null) {
            fragmentTransaction.remove(this.mFragmentFilter);
        }
        fragmentTransaction.commitAllowingStateLoss();
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                if (((ActivityBase) getContext()).getCurrentModule().isIgnoreTouchEvent()) {
                    Log.w("FragmentBottomAction", "onClick: ignore click event, because module isn't ready");
                    return;
                }
                switch (v.getId()) {
                    case R.id.v9_thumbnail_layout /*2131361815*/:
                        if (!isThumbLoading()) {
                            if (!DataRepository.dataItemGlobal().isIntentAction()) {
                                cameraAction.onThumbnailClicked(null);
                                break;
                            } else {
                                cameraAction.onReviewCancelClicked();
                                break;
                            }
                        }
                        return;
                    case R.id.v9_recording_pause /*2131361817*/:
                        if ((this.mCurrentMode == 169 || this.mCurrentMode == 168 || this.mCurrentMode == 170 || this.mCurrentMode == 162) && (this.mVideoPauseSupported ^ 1) == 0 && (this.mVideoRecordingStarted ^ 1) == 0) {
                            ((VideoModule) ((ActivityBase) getContext()).getCurrentModule()).onPauseButtonClick();
                            break;
                        }
                        return;
                        break;
                    case R.id.v9_camera_picker /*2131361820*/:
                        if (!cameraAction.isDoingAction() && !isThumbLoading()) {
                            int newCameraFacing;
                            DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
                            int currentCamera = dataItemGlobal.getCurrentCameraId();
                            if (currentCamera == 0) {
                                newCameraFacing = 1;
                            } else {
                                newCameraFacing = 0;
                            }
                            dataItemGlobal.setCameraId(newCameraFacing);
                            if (newCameraFacing == 1) {
                                ViewCompat.animate(v).rotationBy(-180.0f).setDuration(300).start();
                            } else {
                                ViewCompat.animate(v).rotationBy(180.0f).setDuration(300).start();
                            }
                            ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).removeExtraMenu(4);
                            Log.d("FragmentBottomAction", String.format(Locale.ENGLISH, "switch camera from %d to %d, for module 0x%x", new Object[]{Integer.valueOf(currentCamera), Integer.valueOf(newCameraFacing), Integer.valueOf(this.mCurrentMode)}));
                            ScenarioTrackUtil.trackSwitchCameraStart(currentCamera == 1, newCameraFacing == 1, this.mCurrentMode);
                            switch (this.mCurrentMode) {
                                case 162:
                                    int targetMode = 162;
                                    if (newCameraFacing == 0) {
                                        DataBackUp dataBackUp = DataRepository.getInstance().backUp();
                                        if (dataBackUp.isLastVideoFastMotion()) {
                                            targetMode = 169;
                                        } else if (dataBackUp.isLastVideoSlowMotion()) {
                                            targetMode = 168;
                                        } else if (dataBackUp.isLastVideoHFRMode()) {
                                            targetMode = 170;
                                        }
                                    }
                                    if (targetMode != 162) {
                                        DataRepository.dataItemGlobal().setCurrentMode(targetMode);
                                    }
                                    ((Camera) getContext()).onModeSelected(StartControl.create(targetMode).setNeedBlurAnimation(true).setNeedViewAnimation(true));
                                    break;
                                case 168:
                                case 169:
                                case 170:
                                    DataRepository.dataItemGlobal().setCurrentMode(162);
                                    ((Camera) getContext()).onModeSelected(StartControl.create(162).setNeedBlurAnimation(true).setNeedViewAnimation(true));
                                    break;
                                default:
                                    int newMode = this.mCurrentMode;
                                    this.mCurrentMode = 160;
                                    changeMode(newMode, 0);
                                    break;
                            }
                            if (this.mIsShowFilter) {
                                showOrHideFilter();
                            }
                            if (Util.isAccessible()) {
                                this.mEdgeHorizonScrollView.setContentDescription(getString(R.string.accessibility_camera_picker_finish));
                                this.mEdgeHorizonScrollView.sendAccessibilityEvent(STMobileHumanActionNative.ST_MOBILE_HAND_HOLDUP);
                                break;
                            }
                        }
                        return;
                        break;
                    case R.id.v9_recording_snap /*2131361822*/:
                        if ((this.mCurrentMode == 169 || this.mCurrentMode == 168 || this.mCurrentMode == 170 || this.mCurrentMode == 162) && (this.mVideoCaptureEnable ^ 1) == 0 && (this.mVideoRecordingStarted ^ 1) == 0) {
                            ((VideoModule) ((ActivityBase) getContext()).getCurrentModule()).takeVideoSnapShoot();
                            break;
                        }
                        return;
                        break;
                }
            }
        }
    }

    private void prepareRecording() {
        ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (this.mCurrentMode != 166) {
            topAlert.setRecordingTimeState(1);
        } else {
            topAlert.hideConfigMenu();
        }
        updateBottomInRecording(true);
        this.mShutterButton.prepareRecording();
    }

    private void updateBottomInRecording(final boolean start) {
        if (start) {
            this.mHandler.removeMessages(1);
            if (this.mThumbnailProgress.getVisibility() != 8) {
                this.mThumbnailProgress.setVisibility(8);
            }
        }
        switch (this.mCurrentMode) {
            case 162:
                if (!DataRepository.dataItemGlobal().isIntentAction()) {
                    this.mVideoCaptureEnable = CameraSettings.isVideoCaptureVisible();
                }
                this.mVideoPauseSupported = Device.isSupportedVideoPause();
                break;
            case 166:
                this.mVideoPauseSupported = false;
                this.mVideoCaptureEnable = false;
                break;
            case 168:
            case 169:
            case 170:
                this.mVideoCaptureEnable = false;
                this.mVideoPauseSupported = false;
                break;
            default:
                this.mVideoPauseSupported = false;
                this.mVideoCaptureEnable = false;
                break;
        }
        if (this.mVideoCaptureEnable && start) {
            this.mRecordingSnap.setImageResource(R.drawable.bg_recording_snap);
            this.mRecordingSnap.setSoundEffectsEnabled(false);
            this.mRecordingSnap.setVisibility(0);
            ViewCompat.setAlpha(this.mRecordingSnap, 0.0f);
        }
        if (this.mVideoPauseSupported && start) {
            this.mRecordingPause.setImageResource(R.drawable.ic_recording_pause);
            this.mRecordingPause.setSoundEffectsEnabled(false);
            this.mRecordingPause.setVisibility(0);
            ViewCompat.setAlpha(this.mRecordingPause, 0.0f);
        }
        if (this.mBottomAnimator != null && this.mBottomAnimator.isRunning()) {
            this.mBottomAnimator.cancel();
        }
        this.mBottomAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mBottomAnimator.setDuration(250);
        this.mBottomAnimator.setInterpolator(new DecelerateInterpolator() {
            public float getInterpolation(float input) {
                View -get1;
                float f;
                float value = super.getInterpolation(input);
                ViewCompat.setAlpha(FragmentBottomAction.this.mModeSelectLayout, start ? 1.0f - value : value);
                if (FragmentBottomAction.this.mCameraPickEnable) {
                    -get1 = FragmentBottomAction.this.mCameraPicker;
                    if (start) {
                        f = 1.0f - value;
                    } else {
                        f = value;
                    }
                    ViewCompat.setAlpha(-get1, f);
                }
                -get1 = FragmentBottomAction.this.mThumbnailImageLayout;
                if (start) {
                    f = 1.0f - value;
                } else {
                    f = value;
                }
                ViewCompat.setAlpha(-get1, f);
                if (FragmentBottomAction.this.mVideoPauseSupported) {
                    ViewCompat.setAlpha(FragmentBottomAction.this.mRecordingPause, start ? value : 1.0f - value);
                }
                if (FragmentBottomAction.this.mVideoCaptureEnable) {
                    ViewCompat.setAlpha(FragmentBottomAction.this.mRecordingSnap, start ? value : 1.0f - value);
                }
                return value;
            }
        });
        this.mBottomAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animation) {
                if (!start) {
                    if (FragmentBottomAction.this.mCameraPickEnable) {
                        FragmentBottomAction.this.mCameraPicker.setVisibility(0);
                    }
                    FragmentBottomAction.this.mThumbnailImage.setVisibility(0);
                    FragmentBottomAction.this.mThumbnailImageLayout.setVisibility(0);
                }
            }

            public void onAnimationEnd(Animator animation) {
                int i = 0;
                if (FragmentBottomAction.this.canProvide()) {
                    if (FragmentBottomAction.this.mVideoPauseSupported) {
                        FragmentBottomAction.this.mRecordingPause.setVisibility(start ? 0 : 8);
                    }
                    if (FragmentBottomAction.this.mVideoCaptureEnable) {
                        ImageView -get7 = FragmentBottomAction.this.mRecordingSnap;
                        if (!start) {
                            i = 8;
                        }
                        -get7.setVisibility(i);
                    }
                    if (start) {
                        FragmentBottomAction.this.mThumbnailImageLayout.setVisibility(8);
                        if (FragmentBottomAction.this.mCameraPickEnable) {
                            FragmentBottomAction.this.mCameraPicker.setVisibility(8);
                        }
                        FragmentBottomAction.this.mThumbnailImage.setVisibility(8);
                    }
                }
            }

            public void onAnimationCancel(Animator animation) {
            }

            public void onAnimationRepeat(Animator animation) {
            }
        });
        this.mBottomAnimator.start();
    }

    public void onModeClicked(int newMode) {
        changeMode(newMode, 0);
    }

    public void changeMode(int newMode, int forceDelayTime) {
        if (newMode != this.mCurrentMode && !this.mVideoRecordingStarted) {
            switch (this.mCurrentMode) {
                case 162:
                case 168:
                case 169:
                case 170:
                    switch (newMode) {
                        case 162:
                        case 168:
                        case 169:
                        case 170:
                            return;
                    }
                    break;
            }
            if (!isThumbLoading()) {
                ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction == null || !cameraAction.isDoingAction()) {
                    this.mCurrentMode = newMode;
                    ((DataItemGlobal) DataRepository.provider().dataGlobal()).setCurrentMode(newMode);
                    ((Camera) getContext()).onModeSelected(StartControl.create(newMode).setStartDelay(forceDelayTime).setResetType(3).setNeedViewAnimation(true).setNeedBlurAnimation(true));
                }
            }
        }
    }

    public void selectMode(int gravity, int delayTime) {
        if (gravity != -1) {
            if (Util.isLayoutRTL(getContext())) {
                if (gravity == 3) {
                    gravity = 8388613;
                } else if (gravity == 5) {
                    gravity = 8388611;
                }
            } else if (gravity == 3) {
                gravity = 8388611;
            } else if (gravity == 5) {
                gravity = 8388613;
            }
            int mode = this.mCurrentMode;
            if (this.mCurrentMode == 169 || this.mCurrentMode == 168 || this.mCurrentMode == 170) {
                mode = 162;
            }
            int position = 0;
            int size = this.mComponentModuleList.getItems().size();
            for (int i = 0; i < size; i++) {
                if (this.mComponentModuleList.getMode(i) == mode) {
                    position = i;
                    break;
                }
            }
            switch (gravity) {
                case 8388611:
                    if (position > 0) {
                        position--;
                        break;
                    }
                    break;
                case 8388613:
                    if (position < size - 1) {
                        position++;
                        break;
                    }
                    break;
            }
            changeMode(this.mComponentModuleList.getMode(position), delayTime);
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_action;
    }

    public int getFragmentInto() {
        return 241;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        boolean z;
        int newState;
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        processingAudioCapture(false);
        if (this.mFragmentFilter != null) {
            this.mFragmentFilter.isShowAnimation(animateInElements);
        }
        if (timeOut && this.mIsShowFilter) {
            showOrHideFilter();
        }
        switch (newMode) {
            case 165:
                this.mModeSelectLayout.setBackgroundResource(R.color.black);
                break;
        }
        CameraSnapView cameraSnapView = this.mShutterButton;
        if (animateInElements != null) {
            z = true;
        } else {
            z = false;
        }
        cameraSnapView.setCurrentMode(newMode, z);
        this.mModeSelectView.judgePosition(newMode, animateInElements);
        switch (newMode) {
            case 166:
            case 167:
                newState = -1;
                this.mCameraPickEnable = false;
                break;
            case 171:
                if (!Device.isSupportedFrontPortrait()) {
                    newState = -1;
                    this.mCameraPickEnable = false;
                    break;
                }
                newState = 1;
                this.mCameraPickEnable = true;
                break;
            default:
                newState = 1;
                this.mCameraPickEnable = true;
                break;
        }
        if (this.mCameraPicker.getTag() == null || ((Integer) this.mCameraPicker.getTag()).intValue() != newState) {
            this.mCameraPicker.setTag(Integer.valueOf(newState));
            if (newState == 1) {
                if (animateInElements == null) {
                    AlphaInOnSubscribe.directSetResult(this.mCameraPicker);
                } else {
                    animateInElements.add(Completable.create(new AlphaInOnSubscribe(this.mCameraPicker)));
                }
            } else if (animateInElements == null) {
                AlphaOutOnSubscribe.directSetResult(this.mCameraPicker);
            } else {
                animateInElements.add(Completable.create(new AlphaOutOnSubscribe(this.mCameraPicker)));
            }
        }
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        switch (lastFragmentInfo) {
            case 240:
                return null;
            default:
                Animation animation = FragmentAnimationFactory.wrapperAnimation(161);
                animation.setStartOffset(150);
                return animation;
        }
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(162);
    }

    public void provideRotateItem(List<View> pendingRotateItems, int degree) {
        super.provideRotateItem(pendingRotateItems, degree);
        pendingRotateItems.add(this.mThumbnailImageLayout);
        pendingRotateItems.add(this.mShutterButton);
        pendingRotateItems.add(this.mCameraPicker);
        pendingRotateItems.add(this.mRecordingPause);
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        boolean currentIntentAction = DataRepository.dataItemGlobal().isIntentAction();
        if (currentIntentAction != this.mIsIntentAction) {
            this.mIsIntentAction = currentIntentAction;
            this.mModeSelectView.init(this.mComponentModuleList, this.mCurrentMode);
            initThumbLayoutByIntent();
        }
        this.mInLoading = false;
        adjustViewBackground(this.mModeSelectLayout, this.mCurrentMode);
        this.mFragmentFilter.updateFilterData();
    }

    public boolean canSnap() {
        ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        return cameraAction != null ? cameraAction.isDoingAction() ^ 1 : false;
    }

    public void onSnapPrepare() {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                Log.d("FragmentBottomAction", "onSnapPrepare");
                cameraAction.onShutterButtonFocus(true, 2);
            }
        }
    }

    public void onTrackSnapMissTaken(long time) {
        if (isEnableClick()) {
            ModeProtocol$CameraActionTrack cameraActionTrack = (ModeProtocol$CameraActionTrack) ModeCoordinatorImpl.getInstance().getAttachProtocol(186);
            if (cameraActionTrack != null) {
                Log.d("FragmentBottomAction", "onTrackSnapMissTaken " + time + "ms");
                cameraActionTrack.onTrackShutterButtonMissTaken(time);
            }
        }
    }

    public void onTrackSnapTaken(long time) {
        if (isEnableClick()) {
            ModeProtocol$CameraActionTrack cameraActionTrack = (ModeProtocol$CameraActionTrack) ModeCoordinatorImpl.getInstance().getAttachProtocol(186);
            if (cameraActionTrack != null) {
                Log.d("FragmentBottomAction", "onTrackSnapTaken " + time + "ms");
                cameraActionTrack.onTrackShutterButtonTaken(time);
            }
        }
    }

    public void onSnapClick() {
        if (isEnableClick() && getContext() != null) {
            Module module = ((ActivityBase) getContext()).getCurrentModule();
            if (module == null || !module.isIgnoreTouchEvent()) {
                ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null) {
                    ((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
                    Log.d("FragmentBottomAction", "onSnapClick");
                    switch (this.mCurrentMode) {
                        case 161:
                        case 162:
                        case 168:
                        case 169:
                        case 170:
                            break;
                        case 166:
                            if (cameraAction.isDoingAction()) {
                                return;
                            }
                            break;
                        default:
                            if (!cameraAction.isDoingAction()) {
                                cameraAction.onShutterButtonClick(10);
                                break;
                            }
                            return;
                    }
                    if (!this.mVideoRecordingStarted) {
                        prepareRecording();
                        this.mVideoRecordingStarted = true;
                    }
                    cameraAction.onShutterButtonClick(10);
                    if (Util.isAccessible()) {
                        this.mEdgeHorizonScrollView.setContentDescription(getString(R.string.accessibility_camera_shutter_finish));
                        this.mEdgeHorizonScrollView.sendAccessibilityEvent(STMobileHumanActionNative.ST_MOBILE_HAND_HOLDUP);
                    }
                    return;
                }
                return;
            }
            Log.w("FragmentBottomAction", "onSnapClick: ignore onSnapClick event, because module isn't ready");
        }
    }

    public void onSnapLongPress() {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null && !cameraAction.isDoingAction()) {
                ((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
                Log.d("FragmentBottomAction", "onSnapLongPress");
                if (cameraAction.onShutterButtonLongClick()) {
                    this.mLongPressBurst = true;
                }
            }
        }
    }

    public void onSnapLongPressCancelOut() {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                Log.d("FragmentBottomAction", "onSnapLongPressCancelOut");
                cameraAction.onShutterButtonLongClickCancel(false);
                if (this.mLongPressBurst) {
                    this.mLongPressBurst = false;
                }
            }
        }
    }

    public void onSnapLongPressCancelIn() {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                Log.d("FragmentBottomAction", "onSnapLongPressCancelIn");
                cameraAction.onShutterButtonLongClickCancel(true);
                switch (this.mCurrentMode) {
                    case 163:
                        if (this.mLongPressBurst) {
                            this.mLongPressBurst = false;
                            break;
                        }
                        break;
                    case 165:
                    case 167:
                    case 171:
                        onSnapClick();
                        break;
                }
            }
        }
    }

    public boolean onBackEvent(int callingFrom) {
        if (callingFrom != 1 || !this.mIsShowFilter) {
            return false;
        }
        showOrHideFilter();
        if (Util.isAccessible()) {
            ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateContentDescription();
        }
        return true;
    }
}
