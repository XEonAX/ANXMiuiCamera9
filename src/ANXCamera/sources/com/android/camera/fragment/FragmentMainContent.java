package com.android.camera.fragment;

import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.text.SpannableStringBuilder;
import android.text.style.TextAppearanceSpan;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.TextView;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$SnapShotIndicator;
import com.android.camera.ui.FaceView;
import com.android.camera.ui.FocusIndicator;
import com.android.camera.ui.FocusView;
import com.android.camera.ui.FocusView.ExposureViewListener;
import com.android.camera.ui.ObjectView;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.V6EffectCropView;
import com.android.camera.ui.V6PreviewFrame;
import com.android.camera.ui.V6PreviewPanel;
import com.android.camera.ui.V6RelativeLayout;
import com.android.camera2.CameraHardwareFace;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.QuadraticEaseInOutInterpolator;

public class FragmentMainContent extends BaseFragment implements ModeProtocol$MainContentProtocol, ModeProtocol$SnapShotIndicator, ModeProtocol$HandleBackTrace {
    private int mActiveIndicator = 2;
    private View mBottomCover;
    private ViewGroup mCoverParent;
    private int mDisplayRectTopMargin;
    private V6EffectCropView mEffectCropView;
    private FaceView mFaceView;
    private FocusView mFocusView;
    private boolean mIsIntentAction;
    private int mLastCameraId = -1;
    private int mLastFaceLength = 0;
    private TextView mMultiSnapNum;
    private ObjectView mObjectView;
    private V6PreviewFrame mPreviewFrame;
    private V6RelativeLayout mPreviewPage;
    private V6PreviewPanel mPreviewPanel;
    private TextAppearanceSpan mSnapStyle;
    private SpannableStringBuilder mStringBuilder;
    private View mTopCover;
    private AnimatorSet mZoomInAnimator;
    private AnimatorSet mZoomOutAnimator;

    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    protected void initView(View v) {
        this.mCoverParent = (ViewGroup) v.findViewById(R.id.cover_parent);
        this.mMultiSnapNum = (TextView) this.mCoverParent.findViewById(R.id.v6_multi_snap_number);
        this.mTopCover = this.mCoverParent.findViewById(R.id.top_cover_layout);
        this.mBottomCover = this.mCoverParent.findViewById(R.id.bottom_cover_layout);
        this.mPreviewPage = (V6RelativeLayout) v.findViewById(R.id.v6_preview_page);
        this.mPreviewPanel = (V6PreviewPanel) this.mPreviewPage.findViewById(R.id.v6_preview_panel);
        this.mPreviewFrame = (V6PreviewFrame) this.mPreviewPanel.findViewById(R.id.v6_frame_layout);
        this.mEffectCropView = (V6EffectCropView) this.mPreviewPanel.findViewById(R.id.v6_effect_crop_view);
        this.mFaceView = (FaceView) this.mPreviewPanel.findViewById(R.id.v6_face_view);
        this.mFocusView = (FocusView) this.mPreviewPanel.findViewById(R.id.v6_focus_view);
        this.mObjectView = (ObjectView) this.mPreviewPanel.findViewById(R.id.object_view);
        adjustViewHeight(v);
        this.mCoverParent.getLayoutParams().height = Util.sWindowHeight - Util.getBottomHeight(getResources());
        this.mBottomCover.getLayoutParams().height = (((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2;
        this.mTopCover.getLayoutParams().height = (this.mCoverParent.getLayoutParams().height - Util.sWindowWidth) - this.mBottomCover.getLayoutParams().height;
        this.mIsIntentAction = DataRepository.dataItemGlobal().isIntentAction();
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    private void adjustViewHeight(View parentView) {
        Rect displayRect = Util.getDisplayRect(getContext());
        MarginLayoutParams parentLayoutParams = (MarginLayoutParams) parentView.getLayoutParams();
        MarginLayoutParams previewPanelLayoutParams = (MarginLayoutParams) this.mPreviewPanel.getLayoutParams();
        if (previewPanelLayoutParams.height != displayRect.height()) {
            this.mDisplayRectTopMargin = displayRect.top;
            previewPanelLayoutParams.height = displayRect.height();
            previewPanelLayoutParams.topMargin = displayRect.top;
            this.mPreviewPanel.setLayoutParams(previewPanelLayoutParams);
            parentLayoutParams.height = displayRect.height() + this.mDisplayRectTopMargin;
            parentView.setLayoutParams(parentLayoutParams);
            setDisplaySize(displayRect.width(), displayRect.height());
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_main_content;
    }

    public int getFragmentInto() {
        return 243;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        int newState;
        int lastMode = this.mCurrentMode;
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        switch (newMode) {
            case 165:
                newState = 1;
                break;
            default:
                newState = -1;
                break;
        }
        setSnapNumVisible(false);
        this.mPreviewFrame.hidePreviewGrid();
        this.mFaceView.clear();
        this.mFaceView.clearFaceFlags();
        this.mFocusView.clear();
        boolean needReleaseListener = true;
        switch (lastMode) {
            case 162:
            case 168:
            case 169:
                switch (newMode) {
                    case 162:
                    case 168:
                    case 169:
                        needReleaseListener = false;
                        break;
                }
                break;
        }
        if (needReleaseListener) {
            this.mFocusView.releaseListener();
        }
        destroyEffectCropView();
        if (this.mTopCover.getTag() == null || ((Integer) this.mTopCover.getTag()).intValue() != newState) {
            this.mTopCover.setTag(Integer.valueOf(newState));
            if (newState == 1) {
                if (animateInElements == null) {
                    SlideInOnSubscribe.directSetResult(this.mTopCover, 48);
                    SlideInOnSubscribe.directSetResult(this.mBottomCover, 80);
                } else {
                    animateInElements.add(Completable.create(new SlideInOnSubscribe(this.mTopCover, 48)));
                    animateInElements.add(Completable.create(new SlideInOnSubscribe(this.mBottomCover, 80)));
                }
            } else if (animateInElements == null) {
                SlideOutOnSubscribe.directSetResult(this.mTopCover, 48);
                SlideOutOnSubscribe.directSetResult(this.mBottomCover, 80);
            } else {
                animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mTopCover, 48).setDurationTime(Callback.DEFAULT_DRAG_ANIMATION_DURATION)));
                animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mBottomCover, 80).setDurationTime(Callback.DEFAULT_DRAG_ANIMATION_DURATION)));
            }
        }
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(166, this);
        registerBackStack(modeCoordinator, this);
        if (!Device.isSupportedOpticalZoom()) {
            modeCoordinator.attachProtocol(184, this);
        }
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(166, this);
        unRegisterBackStack(modeCoordinator, this);
        if (!Device.isSupportedOpticalZoom()) {
            modeCoordinator.detachProtocol(184, this);
        }
    }

    public void showReviewViews(Bitmap bitmap) {
        if (bitmap != null) {
            this.mPreviewPanel.mVideoReviewImage.setImageBitmap(bitmap);
            this.mPreviewPanel.mVideoReviewImage.setVisibility(0);
        }
        Util.fadeIn(this.mPreviewPanel.mVideoReviewPlay);
    }

    public void hideReviewViews() {
        if (this.mPreviewPanel.mVideoReviewImage.getVisibility() == 0) {
            Util.fadeOut(this.mPreviewPanel.mVideoReviewImage);
        }
        Util.fadeOut(this.mPreviewPanel.mVideoReviewPlay);
    }

    public void showDelayNumber(int value) {
        if (this.mPreviewPanel.mCaptureDelayNumberParent.getVisibility() != 0 && this.mDegree > 0) {
            ViewCompat.setRotation(this.mPreviewPanel.mCaptureDelayNumberParent, (float) this.mDegree);
        }
        this.mPreviewPanel.showDelayNumber(String.valueOf(value));
    }

    public void hideDelayNumber() {
        this.mPreviewPanel.hideDelayNumber();
    }

    private void initSnapNumAnimator() {
        this.mZoomInAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_in);
        this.mZoomInAnimator.setTarget(this.mMultiSnapNum);
        this.mZoomInAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        this.mZoomOutAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_out);
        this.mZoomOutAnimator.setTarget(this.mMultiSnapNum);
        this.mZoomOutAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
    }

    public void setSnapNumVisible(boolean visible) {
        boolean z;
        if (this.mMultiSnapNum.getVisibility() == 0) {
            z = true;
        } else {
            z = false;
        }
        if (visible != z) {
            if (this.mZoomInAnimator == null) {
                initSnapNumAnimator();
            }
            if (visible) {
                AlphaInOnSubscribe.directSetResult(this.mMultiSnapNum);
                setSnapNumValue(0);
                this.mZoomInAnimator.start();
            } else {
                this.mZoomOutAnimator.start();
                Completable.create(new AlphaOutOnSubscribe(this.mMultiSnapNum).setStartDelayTime(500)).subscribe();
            }
        }
    }

    @TargetApi(21)
    public void setSnapNumValue(int number) {
        setSnapNumVisible(true);
        if (this.mSnapStyle == null) {
            this.mSnapStyle = new TextAppearanceSpan(getContext(), R.style.SnapTipTextStyle);
        }
        if (this.mStringBuilder == null) {
            this.mStringBuilder = new SpannableStringBuilder();
        } else {
            this.mStringBuilder.clear();
        }
        this.mStringBuilder.append(String.format("%02d", new Object[]{Integer.valueOf(number)}), this.mSnapStyle, 33);
        this.mMultiSnapNum.setText(this.mStringBuilder);
    }

    public int getPreviewWidth() {
        return this.mPreviewFrame.getWidth();
    }

    public void setPreviewAspectRatio(float aspectRatio) {
        this.mPreviewFrame.setAspectRatio(aspectRatio);
    }

    public void performHapticFeedback(int feedbackConstant) {
        this.mPreviewFrame.performHapticFeedback(feedbackConstant);
    }

    public boolean onViewTouchEvent(int viewId, MotionEvent ev) {
        if (viewId == this.mFocusView.getId()) {
            return this.mFocusView.onViewTouchEvent(ev);
        }
        if (viewId == this.mEffectCropView.getId()) {
            return this.mEffectCropView.onViewTouchEvent(ev);
        }
        return false;
    }

    public void initEffectCropView() {
        this.mEffectCropView.onCreate();
    }

    public void destroyEffectCropView() {
        this.mEffectCropView.onDestroy();
    }

    public void removeTiltShiftMask() {
        this.mEffectCropView.removeTiltShiftMask();
    }

    public void setEffectViewVisible(boolean visible) {
        if (visible) {
            this.mEffectCropView.show();
        } else {
            this.mEffectCropView.hide();
        }
    }

    public void updateEffectViewVisible() {
        this.mEffectCropView.updateVisible();
    }

    public boolean isEffectViewMoved() {
        return this.mEffectCropView.isMoved();
    }

    public boolean isEffectViewVisible() {
        return this.mEffectCropView.isVisible();
    }

    public void setCameraDisplayOrientation(int cameraDisplayOrientation) {
        this.mFaceView.setCameraDisplayOrientation(cameraDisplayOrientation);
    }

    public void setShowGenderAndAge(boolean show) {
        this.mFaceView.setShowGenderAndAge(show);
    }

    public void setShowMagicMirror(boolean show) {
        this.mFaceView.setShowMagicMirror(show);
    }

    public void setSkipDrawFace(boolean skipDraw) {
        this.mFaceView.setSkipDraw(skipDraw);
    }

    public void updateFaceView(boolean visible, boolean clearFaces, boolean mirror, boolean resume, int cameraDisplayOrientation) {
        int i = 0;
        if (clearFaces) {
            this.mFaceView.clear();
        }
        FaceView faceView = this.mFaceView;
        if (!visible) {
            i = 8;
        }
        faceView.setVisibility(i);
        if (cameraDisplayOrientation > 0) {
            this.mFaceView.setCameraDisplayOrientation(cameraDisplayOrientation);
        }
        this.mFaceView.setMirror(mirror);
        if (resume) {
            this.mFaceView.resume();
        }
    }

    public CameraHardwareFace[] getFaces() {
        return this.mFaceView.getFaces();
    }

    public boolean isEvAdjusted(boolean checkTime) {
        if (checkTime) {
            return this.mFocusView.isEvAdjustedTime();
        }
        return this.mFocusView.isEvAdjusted();
    }

    public void setEvAdjustable(boolean enable) {
        this.mFocusView.setEvAdjustable(enable);
    }

    public void initializeFocusView(ExposureViewListener listener) {
        this.mFocusView.initialize(listener);
    }

    public void setFocusViewType(boolean isTouchFocus) {
        this.mFocusView.setFocusType(isTouchFocus);
    }

    public void setFocusViewPosition(int type, int x, int y) {
        this.mFocusView.setPosition(type, x, y);
        this.mFaceView.forceHideRect();
    }

    public void clearFocusView(int type) {
        this.mFocusView.clear(type);
    }

    public void reShowFaceRect() {
        this.mFaceView.reShowFaceRect();
    }

    public boolean initializeObjectTrack(RectF rectF, boolean up) {
        this.mFocusView.clear();
        this.mObjectView.clear();
        this.mObjectView.setVisibility(0);
        return this.mObjectView.initializeTrackView(rectF, up);
    }

    public void setDisplaySize(int width, int height) {
        this.mObjectView.setDisplaySize(width, height);
    }

    public void setPreviewSize(int width, int height) {
        this.mObjectView.setPreviewSize(width, height);
    }

    public void setObjectViewListener(ObjectViewListener listener) {
        this.mObjectView.setObjectViewListener(listener);
    }

    public boolean isFaceExists(int indicatorType) {
        switch (indicatorType) {
            case 1:
                return this.mFaceView.faceExists();
            case 3:
                return this.mObjectView.faceExists();
            default:
                return false;
        }
    }

    public boolean isIndicatorVisible(int indicatorType) {
        boolean z = true;
        switch (indicatorType) {
            case 1:
                if (this.mFaceView.getVisibility() != 0) {
                    z = false;
                }
                return z;
            case 2:
                if (this.mFocusView.getVisibility() != 0) {
                    z = false;
                }
                return z;
            case 3:
                if (this.mObjectView.getVisibility() != 0) {
                    z = false;
                }
                return z;
            default:
                return false;
        }
    }

    public boolean isNeedExposure(int indicatorType) {
        switch (indicatorType) {
            case 1:
                return this.mFaceView.isNeedExposure();
            case 3:
                return this.mObjectView.isNeedExposure();
            default:
                return false;
        }
    }

    public boolean setFaces(int indicatorType, CameraHardwareFace[] faces, Rect cropRegion, float zoomValue) {
        switch (indicatorType) {
            case 1:
                if (this.mLastFaceLength != faces.length) {
                    this.mLastFaceLength = faces.length;
                    if (Util.isAccessible()) {
                        if (this.mLastFaceLength > 0) {
                            this.mFaceView.setContentDescription(getResources().getQuantityString(R.plurals.accessibility_focus_face_detect, this.mLastFaceLength, new Object[]{Integer.valueOf(this.mLastFaceLength)}));
                            this.mFaceView.sendAccessibilityEvent(4);
                        } else {
                            this.mFaceView.setContentDescription("");
                        }
                    }
                }
                return this.mFaceView.setFaces(faces, cropRegion, zoomValue);
            case 3:
                if (faces != null && faces.length > 0) {
                    this.mObjectView.setObject(faces[0]);
                }
                return true;
            default:
                return false;
        }
    }

    public void clearIndicator(int indicatorType) {
        switch (indicatorType) {
            case 1:
                this.mFaceView.clear();
                return;
            case 2:
                throw new RuntimeException("not allowed call in this method");
            case 3:
                this.mObjectView.clear();
                return;
            default:
                return;
        }
    }

    public void setActiveIndicator(int indicatorType) {
        this.mActiveIndicator = indicatorType;
    }

    public int getActiveIndicator() {
        return this.mActiveIndicator;
    }

    public void showIndicator(int indicatorType, int showType) {
        switch (indicatorType) {
            case 1:
                showIndicator(this.mFaceView, showType);
                return;
            case 2:
                showIndicator(this.mFocusView, showType);
                return;
            case 3:
                showIndicator(this.mObjectView, showType);
                return;
            default:
                return;
        }
    }

    private void showIndicator(FocusIndicator indicator, int showType) {
        switch (showType) {
            case 1:
                indicator.showStart();
                return;
            case 2:
                indicator.showSuccess();
                return;
            case 3:
                indicator.showFail();
                return;
            default:
                return;
        }
    }

    public RectF getFocusRect(int indicatorType) {
        switch (indicatorType) {
            case 1:
                return this.mFaceView.getFocusRect();
            case 3:
                return this.mObjectView.getFocusRect();
            default:
                Log.w("FragmentMainContent", getFragmentTag() + ": unexpected type " + indicatorType);
                return new RectF();
        }
    }

    public void onDestroy() {
        super.onDestroy();
        destroyEffectCropView();
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        boolean currentIntentAction = DataRepository.dataItemGlobal().isIntentAction();
        if (currentIntentAction != this.mIsIntentAction) {
            this.mIsIntentAction = currentIntentAction;
            hideReviewViews();
        }
        if (DataRepository.dataItemGlobal().getCurrentCameraId() != this.mLastCameraId) {
            this.mLastCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
            if (Util.isAccessible()) {
                if (this.mLastCameraId == 1) {
                    this.mPreviewFrame.setContentDescription(getString(R.string.accessibility_front_preview_status));
                } else {
                    this.mPreviewFrame.setContentDescription(getString(R.string.accessibility_back_preview_status));
                }
                this.mPreviewFrame.postDelayed(new Runnable() {
                    public void run() {
                        if (FragmentMainContent.this.isAdded()) {
                            FragmentMainContent.this.mPreviewFrame.sendAccessibilityEvent(4);
                        }
                    }
                }, 1500);
            }
        }
        switch (dataChangeType) {
            case 2:
                adjustViewHeight(getView());
                return;
            case 3:
                adjustViewHeight(getView());
                return;
            default:
                return;
        }
    }

    public void notifyAfterFrameAvailable(int arrivedType) {
        super.notifyAfterFrameAvailable(arrivedType);
        this.mPreviewFrame.updateReferenceLineAccordSquare();
        this.mPreviewFrame.updatePreviewGrid();
        this.mFocusView.reInit();
        this.mEffectCropView.updateVisible();
    }

    public boolean onBackEvent(int callingFrom) {
        return false;
    }

    public void provideRotateItem(List<View> pendingRotateItems, int newDegree) {
        super.provideRotateItem(pendingRotateItems, newDegree);
        this.mFaceView.setOrientation((360 - newDegree) % 360, false);
        this.mFocusView.setOrientation(newDegree, false);
        pendingRotateItems.add(this.mFocusView);
        pendingRotateItems.add(this.mMultiSnapNum);
        pendingRotateItems.add(this.mPreviewPanel.mCaptureDelayNumberParent);
    }
}
