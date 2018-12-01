package com.android.camera.fragment.manually;

import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.ComponentManuallyFocus;
import com.android.camera.data.data.config.ComponentManuallyISO;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.manually.adapter.ExtraRecyclerViewAdapter;
import com.android.camera.fragment.manually.adapter.ManuallyAdapter;
import com.android.camera.fragment.manually.adapter.ManuallySingleAdapter;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol$ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;

public class FragmentManually extends BaseFragment implements OnClickListener, ModeProtocol$HandleBackTrace, ModeProtocol$ManuallyAdjust, ManuallyListener {
    private Adapter mAdapter;
    private int mCurrentAdjustType = -1;
    private ManuallyDecoration mDecoration;
    private FragmentManuallyExtra mFragmentManuallyExtra;
    private ImageView mIndicatorButton;
    private boolean mIsHiding;
    private List<ComponentData> mManuallyComponents;
    private ViewGroup mManuallyParent;
    private RecyclerView mRecyclerView;
    private ViewGroup mRecyclerViewLayout;

    protected void initView(View v) {
        ((MarginLayoutParams) v.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mIndicatorButton = (ImageView) v.findViewById(R.id.manually_indicator);
        this.mIndicatorButton.setOnClickListener(this);
        this.mManuallyParent = (ViewGroup) v.findViewById(R.id.manually_adjust_layout);
        this.mRecyclerViewLayout = (ViewGroup) this.mManuallyParent.findViewById(R.id.manually_recycler_view_layout);
        this.mRecyclerView = (RecyclerView) this.mRecyclerViewLayout.findViewById(R.id.manually_recycler_view);
        this.mDecoration = new ManuallyDecoration(1, getResources().getColor(R.color.effect_divider_color));
        LinearLayoutManager layoutManager = new LinearLayoutManager(getContext());
        layoutManager.setOrientation(0);
        this.mRecyclerView.setLayoutManager(layoutManager);
        adjustViewBackground(this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(181, this);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(181, this);
        unRegisterBackStack(modeCoordinator, this);
        FragmentTransaction fragmentTransaction = getChildFragmentManager().beginTransaction();
        if (this.mFragmentManuallyExtra != null) {
            fragmentTransaction.remove(this.mFragmentManuallyExtra);
        }
        fragmentTransaction.commitAllowingStateLoss();
    }

    /* JADX WARNING: Missing block: B:4:0x0010, code:
            return false;
     */
    public boolean onBackEvent(int r9) {
        /*
        r8 = this;
        r6 = 0;
        r5 = 1;
        r4 = 0;
        r3 = 0;
        r1 = r8.mManuallyParent;
        r1 = r1.getVisibility();
        if (r1 != 0) goto L_0x0010;
    L_0x000d:
        r1 = 3;
        if (r9 != r1) goto L_0x0011;
    L_0x0010:
        return r3;
    L_0x0011:
        r1 = r8.mIsHiding;
        if (r1 == 0) goto L_0x0016;
    L_0x0015:
        return r3;
    L_0x0016:
        r8.mIsHiding = r5;
        r1 = r8.mManuallyParent;
        r0 = r1.getHeight();
        r1 = r8.mManuallyParent;
        r1 = android.support.v4.view.ViewCompat.animate(r1);
        r1 = r1.setStartDelay(r6);
        r2 = (float) r0;
        r1 = r1.translationY(r2);
        r2 = new android.view.animation.OvershootInterpolator;
        r2.<init>();
        r1 = r1.setInterpolator(r2);
        r2 = new com.android.camera.fragment.manually.FragmentManually$1;
        r2.<init>();
        r1 = r1.withEndAction(r2);
        r1.start();
        r1 = r8.mIndicatorButton;
        r1.setVisibility(r3);
        r1 = r8.mIndicatorButton;
        android.support.v4.view.ViewCompat.setTranslationY(r1, r4);
        r1 = r8.mIndicatorButton;
        android.support.v4.view.ViewCompat.setAlpha(r1, r4);
        r1 = r8.mIndicatorButton;
        r1 = android.support.v4.view.ViewCompat.animate(r1);
        r1 = r1.setStartDelay(r6);
        r2 = (float) r0;
        r1 = r1.translationY(r2);
        r2 = 300; // 0x12c float:4.2E-43 double:1.48E-321;
        r1 = r1.setDuration(r2);
        r2 = new android.view.animation.OvershootInterpolator;
        r2.<init>();
        r1 = r1.setInterpolator(r2);
        r2 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r1 = r1.alpha(r2);
        r1.start();
        return r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.manually.FragmentManually.onBackEvent(int):boolean");
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                switch (v.getId()) {
                    case R.id.manually_indicator /*2131361849*/:
                        this.mManuallyParent.setVisibility(0);
                        ViewCompat.animate(this.mManuallyParent).setStartDelay(100).translationY(0.0f).setInterpolator(new DecelerateInterpolator()).start();
                        ViewCompat.animate(this.mIndicatorButton).setInterpolator(new DecelerateInterpolator()).alpha(0.0f).setDuration(100).withEndAction(new Runnable() {
                            public void run() {
                                ViewCompat.setTranslationY(FragmentManually.this.mIndicatorButton, 0.0f);
                                FragmentManually.this.mIndicatorButton.setVisibility(4);
                            }
                        }).start();
                        break;
                    default:
                        ComponentData componentData = (ComponentData) v.getTag();
                        int title = componentData.getDisplayTitleString();
                        switch (title) {
                            case R.string.pref_camera_zoom_mode_title /*2131689837*/:
                                FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(254));
                                ((ManuallyAdapter) this.mRecyclerView.getAdapter()).setSelectedTitle(-1);
                                onManuallyDataChanged(componentData, null, null, false);
                                break;
                            default:
                                this.mFragmentManuallyExtra = getExtraFragment();
                                if (this.mFragmentManuallyExtra != null) {
                                    if (this.mFragmentManuallyExtra.getCurrentTitle() != title) {
                                        hideTips();
                                        this.mFragmentManuallyExtra.resetData(componentData);
                                        ((ManuallyAdapter) this.mRecyclerView.getAdapter()).setSelectedTitle(title);
                                        break;
                                    }
                                    this.mFragmentManuallyExtra.animateOut();
                                    ((ManuallyAdapter) this.mRecyclerView.getAdapter()).setSelectedTitle(-1);
                                    break;
                                }
                                hideTips();
                                this.mFragmentManuallyExtra = new FragmentManuallyExtra();
                                this.mFragmentManuallyExtra.setComponentData(componentData, this.mCurrentMode, true, this);
                                FragmentUtils.addFragmentWithTag(getChildFragmentManager(), R.id.manually_popup, this.mFragmentManuallyExtra, this.mFragmentManuallyExtra.getFragmentTag());
                                ((ManuallyAdapter) this.mRecyclerView.getAdapter()).setSelectedTitle(title);
                                break;
                        }
                }
            }
        }
    }

    private void hideTips() {
        ModeProtocol$BottomPopupTips bottomPopupTips = (ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
    }

    public void onManuallyDataChanged(ComponentData componentData, String oldValue, String newValue, boolean isCustomValue) {
        if (isEnableClick()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                ModeProtocol$ManuallyValueChanged manuallyValueChanged = (ModeProtocol$ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
                if (manuallyValueChanged != null) {
                    switch (componentData.getDisplayTitleString()) {
                        case R.string.pref_camera_whitebalance_title /*2131689563*/:
                            if (newValue.equals("manual")) {
                                getExtraFragment().showCustomWB((ComponentManuallyWB) componentData);
                            }
                            manuallyValueChanged.onWBValueChanged((ComponentManuallyWB) componentData, newValue, isCustomValue);
                            break;
                        case R.string.pref_camera_iso_title /*2131689629*/:
                            manuallyValueChanged.onISOValueChanged((ComponentManuallyISO) componentData, newValue);
                            break;
                        case R.string.pref_manual_exposure_title /*2131689738*/:
                            manuallyValueChanged.onETValueChanged((ComponentManuallyET) componentData, newValue);
                            break;
                        case R.string.pref_qc_focus_position_title /*2131689786*/:
                            manuallyValueChanged.onFocusValueChanged((ComponentManuallyFocus) componentData, oldValue, newValue);
                            break;
                        case R.string.pref_camera_zoom_mode_title /*2131689837*/:
                            manuallyValueChanged.onDualLensSwitch((ComponentManuallyDualLens) componentData, this.mCurrentMode);
                            break;
                    }
                    if (this.mRecyclerView.getAdapter() != null) {
                        this.mRecyclerView.post(new Runnable() {
                            public void run() {
                                FragmentManually.this.mRecyclerView.getAdapter().notifyDataSetChanged();
                            }
                        });
                    }
                }
            }
        }
    }

    private List<ComponentData> initManuallyDataList() {
        if (this.mManuallyComponents == null) {
            this.mManuallyComponents = new ArrayList();
        } else {
            this.mManuallyComponents.clear();
        }
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        this.mManuallyComponents.add(new ComponentManuallyWB(dataItemConfig));
        if (Device.isSupportedManualFunction()) {
            this.mManuallyComponents.add(new ComponentManuallyFocus(dataItemConfig));
            this.mManuallyComponents.add(new ComponentManuallyET(dataItemConfig));
        }
        this.mManuallyComponents.add(new ComponentManuallyISO(dataItemConfig));
        if (CameraSettings.isSupportedOpticalZoom()) {
            this.mManuallyComponents.add(new ComponentManuallyDualLens(dataItemConfig));
        }
        return this.mManuallyComponents;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_manually;
    }

    public int getFragmentInto() {
        return 247;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        int targetType = 0;
        switch (newMode) {
            case 167:
                targetType = 1;
                break;
        }
        reInitManuallyLayout(targetType, animateInElements);
    }

    private void reInitManuallyLayout(int targetType, List<Completable> animateInElements) {
        if (this.mCurrentAdjustType != targetType) {
            switch (targetType) {
                case 0:
                    initRecyclerView(0, this);
                    break;
                case 1:
                    initRecyclerView(1, this);
                    break;
            }
            if (targetType == 0) {
                if (animateInElements == null) {
                    AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
                } else if (this.mIndicatorButton.getVisibility() == 0) {
                    animateInElements.add(Completable.create(new AlphaOutOnSubscribe(this.mIndicatorButton)));
                } else {
                    animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mManuallyParent, 80)));
                }
            }
        }
    }

    public Animation onCreateAnimation(int transit, boolean enter, int nextAnim) {
        return super.onCreateAnimation(transit, enter, nextAnim);
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        return null;
    }

    protected Animation provideExitAnimation() {
        return null;
    }

    public int setManuallyVisible(int type, int targetVisible, ManuallyListener manuallyListener) {
        int height = initRecyclerView(type, manuallyListener);
        if (this.mAdapter != null) {
            this.mRecyclerView.setAdapter(this.mAdapter);
        }
        setManuallyLayoutViewVisible(targetVisible);
        return height;
    }

    public int visibleHeight() {
        if (this.mCurrentAdjustType == 0) {
            return 0;
        }
        if (this.mIndicatorButton.getVisibility() == 0) {
            return this.mIndicatorButton.getHeight();
        }
        return this.mManuallyParent.getHeight() + (getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal) / 2);
    }

    private int initRecyclerView(int targetType, ManuallyListener manuallyListener) {
        this.mCurrentAdjustType = targetType;
        switch (targetType) {
            case 0:
                this.mCurrentAdjustType = 0;
                this.mManuallyParent.setVisibility(4);
                return 0;
            case 1:
                this.mCurrentAdjustType = 1;
                initManually();
                break;
            case 2:
                this.mCurrentAdjustType = 2;
                initScene(manuallyListener);
                break;
            case 3:
                this.mCurrentAdjustType = 3;
                initTilt(manuallyListener);
                break;
        }
        return this.mRecyclerView.getLayoutParams().height;
    }

    private void setManuallyLayoutViewVisible(int targetVisible) {
        FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(254));
        switch (targetVisible) {
            case 1:
                if (this.mIndicatorButton.getVisibility() != 0) {
                    Completable.create(new SlideInOnSubscribe(this.mManuallyParent, 80)).subscribe();
                    break;
                }
                return;
            case 2:
                this.mCurrentAdjustType = 0;
                if (this.mIndicatorButton.getVisibility() != 0) {
                    Completable.create(new SlideOutOnSubscribe(this.mManuallyParent, 80)).subscribe();
                    break;
                }
                Completable.create(new AlphaOutOnSubscribe(this.mIndicatorButton)).subscribe();
                AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
                break;
            case 3:
                this.mCurrentAdjustType = 0;
                if (this.mIndicatorButton.getVisibility() != 0) {
                    SlideOutOnSubscribe.directSetResult(this.mManuallyParent, 80);
                    break;
                } else {
                    AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
                    break;
                }
        }
    }

    private void initManually() {
        initManuallyDataList();
        this.mRecyclerView.removeItemDecoration(this.mDecoration);
        this.mDecoration.setStyle(this.mManuallyComponents.size());
        this.mRecyclerView.addItemDecoration(this.mDecoration);
        ManuallyAdapter manuallyAdapter = new ManuallyAdapter(this.mCurrentMode, this, this.mManuallyComponents);
        this.mRecyclerView.getLayoutParams().height = getResources().getDimensionPixelSize(R.dimen.settings_screen_height);
        FragmentManuallyExtra fragmentManuallyExtra = getExtraFragment();
        if (fragmentManuallyExtra != null) {
            fragmentManuallyExtra.updateData();
            manuallyAdapter.setSelectedTitle(fragmentManuallyExtra.getCurrentTitle());
        }
        this.mAdapter = manuallyAdapter;
    }

    private void initScene(ManuallyListener manuallyListener) {
        this.mRecyclerView.removeItemDecoration(this.mDecoration);
        ExtraRecyclerViewAdapter adapter = new ExtraRecyclerViewAdapter(DataRepository.dataItemRunning().getComponentRunningSceneValue(), this.mCurrentMode, manuallyListener, (int) (((float) getResources().getDisplayMetrics().widthPixels) / 5.5f));
        this.mRecyclerView.getLayoutParams().height = getResources().getDimensionPixelSize(R.dimen.manual_popup_layout_height);
        this.mAdapter = adapter;
    }

    private void initTilt(ManuallyListener manuallyListener) {
        ComponentRunningTiltValue tilt = DataRepository.dataItemRunning().getComponentRunningTiltValue();
        this.mRecyclerView.removeItemDecoration(this.mDecoration);
        this.mDecoration.setStyle(tilt.getItems().size());
        this.mRecyclerView.addItemDecoration(this.mDecoration);
        ManuallySingleAdapter adapter = new ManuallySingleAdapter(tilt, this.mCurrentMode, manuallyListener, getResources().getDisplayMetrics().widthPixels / tilt.getItems().size());
        this.mRecyclerView.getLayoutParams().height = getResources().getDimensionPixelSize(R.dimen.settings_screen_height);
        this.mAdapter = adapter;
    }

    private FragmentManuallyExtra getExtraFragment() {
        if (this.mFragmentManuallyExtra == null || !this.mFragmentManuallyExtra.isAdded()) {
            return null;
        }
        return this.mFragmentManuallyExtra;
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        adjustViewBackground(this.mCurrentMode);
        if (this.mCurrentAdjustType == 1 && this.mAdapter != null) {
            initManuallyDataList();
            this.mRecyclerView.setAdapter(this.mAdapter);
            this.mAdapter.notifyDataSetChanged();
        }
        FragmentManuallyExtra fragmentManuallyExtra = getExtraFragment();
        if (fragmentManuallyExtra != null) {
            fragmentManuallyExtra.notifyDataChanged(dataChangeType, this.mCurrentMode);
        }
    }

    public void notifyAfterFrameAvailable(int arrivedType) {
        super.notifyAfterFrameAvailable(arrivedType);
        if (this.mCurrentMode == 167 && this.mManuallyParent.getVisibility() != 0) {
            AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
            Completable.create(new SlideInOnSubscribe(this.mManuallyParent, 80)).subscribe();
        }
    }

    private void adjustViewBackground(int currentMode) {
        switch (DataRepository.dataItemRunning().getUiStyle()) {
            case 0:
                this.mRecyclerViewLayout.setBackgroundResource(R.color.halfscreen_background);
                return;
            case 1:
            case 3:
                this.mRecyclerViewLayout.setBackgroundResource(R.color.fullscreen_background);
                return;
            default:
                return;
        }
    }
}
