package com.android.camera.fragment.top;

import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateXOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.top.ExpandAdapter.ExpandListener;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$ConfigChanges;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.ToggleSwitch.OnCheckedChangeListener;
import com.android.camera2.CameraCapabilities;
import io.reactivex.Completable;
import io.reactivex.functions.Action;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class FragmentTopConfig extends BaseFragment implements OnClickListener, ExpandListener, ModeProtocol$TopAlert, ModeProtocol$HandleBackTrace {
    private int mBeforeMode;
    private List<ImageView> mConfigViews;
    private int mCurrentAiSceneLevel;
    private int mDisplayRectTopMargin;
    private RecyclerView mExpandView;
    private FragmentTopAlert mFragmentTopAlert;
    private FragmentTopConfigExtra mFragmentTopConfigExtra;
    private boolean mIsRTL;
    private LastAnimationComponent mLastAnimationComponent;
    private SupportedConfigs mSupportedConfigs;
    private View mTopConfigMenu;
    private int mTopDrawableWidth;
    private ViewGroup mTopExtraParent;
    private int mTotalWidth;
    private int mViewPadding;

    public FragmentTopConfig() {
        this.mCurrentAiSceneLevel = CameraSettings.getAiSceneOpen() ? 1 : 0;
        this.mBeforeMode = 160;
    }

    protected void initView(View v) {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mLastAnimationComponent = new LastAnimationComponent();
        this.mTopExtraParent = (ViewGroup) v.findViewById(R.id.top_config_extra);
        this.mTopConfigMenu = v.findViewById(R.id.top_config_menu);
        if (Util.isNotchDevice) {
            ((MarginLayoutParams) this.mTopConfigMenu.getLayoutParams()).topMargin = Util.sStatusBarHeight;
        }
        ImageView config00 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_00);
        ImageView config01 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_01);
        ImageView config02 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_02);
        ImageView config03 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_03);
        ImageView config04 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_04);
        ImageView config05 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_05);
        ImageView config06 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_06);
        this.mConfigViews = new ArrayList(7);
        this.mConfigViews.add(config00);
        this.mConfigViews.add(config01);
        this.mConfigViews.add(config02);
        this.mConfigViews.add(config03);
        this.mConfigViews.add(config04);
        this.mConfigViews.add(config05);
        this.mConfigViews.add(config06);
        this.mExpandView = (RecyclerView) v.findViewById(R.id.top_config_expand_view);
        LinearLayoutManager layoutManager = new LinearLayoutManager(getContext());
        layoutManager.setOrientation(0);
        this.mExpandView.setLayoutManager(layoutManager);
        this.mViewPadding = getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
        this.mTopDrawableWidth = getResources().getDrawable(R.drawable.ic_config_flash_off).getIntrinsicWidth();
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        provideAnimateElement(this.mCurrentMode, null, false);
        config00.setOnClickListener(this);
        config01.setOnClickListener(this);
        config02.setOnClickListener(this);
        config03.setOnClickListener(this);
        config04.setOnClickListener(this);
        config05.setOnClickListener(this);
        config06.setOnClickListener(this);
        this.mFragmentTopAlert = new FragmentTopAlert();
        FragmentUtils.addFragmentWithTag(getChildFragmentManager(), R.id.top_alert, this.mFragmentTopAlert, this.mFragmentTopAlert.getFragmentTag());
    }

    private int getInitialMargin(int position) {
        switch (position) {
            case 1:
                return (((this.mTopDrawableWidth + this.mViewPadding) + (this.mTotalWidth / 2)) - (this.mTopDrawableWidth / 2)) / 2;
            case 2:
                return ((this.mTotalWidth - (this.mViewPadding * 2)) / 3) + this.mViewPadding;
            case 4:
                return (((this.mTotalWidth - (this.mViewPadding * 2)) / 3) * 2) + this.mViewPadding;
            case 5:
                return (((((this.mTotalWidth / 2) + (this.mTopDrawableWidth / 2)) + this.mTotalWidth) - this.mTopDrawableWidth) - this.mViewPadding) / 2;
            default:
                return 0;
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_top_config;
    }

    public int getFragmentInto() {
        return 244;
    }

    public void setClickEnable(boolean enable) {
        super.setClickEnable(enable);
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setClickEnable(enable);
        }
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$ConfigChanges configChanges = (ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction == null || !cameraAction.isDoingAction()) {
                    int tag = ((Integer) v.getTag()).intValue();
                    switch (tag) {
                        case 193:
                            expandExtra(((DataItemConfig) DataRepository.provider().dataConfig()).getComponentFlash(), v, tag);
                            break;
                        case 194:
                            expandExtra(((DataItemConfig) DataRepository.provider().dataConfig()).getComponentHdr(), v, tag);
                            break;
                        case 195:
                            configChanges.onConfigChanged(195);
                            break;
                        case 196:
                            configChanges.onConfigChanged(196);
                            updateConfigItem(196);
                            break;
                        case 197:
                            showMenu();
                            break;
                        case 199:
                            configChanges.onConfigChanged(199);
                            ((ImageView) v).setImageResource(getFocusPeakImageResource());
                            break;
                        case Callback.DEFAULT_DRAG_ANIMATION_DURATION /*200*/:
                            DataItemConfig dataItemConfig = (DataItemConfig) DataRepository.provider().dataConfig();
                            dataItemConfig.getComponentBokeh().toggle(this.mCurrentMode);
                            String newValue = dataItemConfig.getComponentBokeh().getComponentValue(this.mCurrentMode);
                            CameraStatUtil.trackBokehChanged(this.mCurrentMode, newValue);
                            updateConfigItem(Callback.DEFAULT_DRAG_ANIMATION_DURATION);
                            if (dataItemConfig.reConfigHdrIfBokehChanged(this.mCurrentMode, newValue)) {
                                updateConfigItem(194);
                            }
                            configChanges.configBokeh(newValue);
                            break;
                        case 201:
                            configChanges.onConfigChanged(201);
                            break;
                        case 202:
                            configChanges.onConfigChanged(202);
                            break;
                        case 225:
                            configChanges.showSetting();
                            break;
                    }
                }
            }
        }
    }

    public void onExpandValueChange(ComponentData componentData, String newValue) {
        if (isEnableClick()) {
            DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
            ModeProtocol$ConfigChanges configChanges = (ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            switch (componentData.getDisplayTitleString()) {
                case R.string.pref_camera_flashmode_title /*2131689555*/:
                    CameraStatUtil.trackFlashChanged(this.mCurrentMode, newValue);
                    updateConfigItem(193);
                    if (dataItemConfig.reConfigHhrIfFlashChanged(this.mCurrentMode, newValue)) {
                        updateConfigItem(194);
                    }
                    configChanges.configFlash(newValue);
                    break;
                case R.string.pref_camera_hdr_title /*2131689733*/:
                    CameraStatUtil.trackHdrChanged(this.mCurrentMode, newValue);
                    updateConfigItem(194);
                    if (dataItemConfig.reConfigFlashIfHdrChanged(this.mCurrentMode, newValue)) {
                        updateConfigItem(193);
                    }
                    if (dataItemConfig.reConfigBokehIfHdrChanged(this.mCurrentMode, newValue)) {
                        updateConfigItem(Callback.DEFAULT_DRAG_ANIMATION_DURATION);
                    }
                    configChanges.configHdr(newValue);
                    break;
            }
            this.mLastAnimationComponent.reverse(true);
        }
    }

    public ImageView getTopImage(int config) {
        for (ImageView imageView : this.mConfigViews) {
            if (((Integer) imageView.getTag()).intValue() == config) {
                return imageView;
            }
        }
        return null;
    }

    public int getTopImagePosition(int config) {
        for (int i = 0; i < this.mConfigViews.size(); i++) {
            if (((Integer) ((ImageView) this.mConfigViews.get(i)).getTag()).intValue() == config) {
                return i;
            }
        }
        return 0;
    }

    @DrawableRes
    private int getFocusPeakImageResource() {
        boolean switchOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_peak_key");
        if ("zh".equals(Locale.getDefault().getLanguage())) {
            if (switchOn) {
                return R.drawable.ic_config_focus_peak_ch_on;
            }
            return R.drawable.ic_config_foucs_peak_ch_off;
        } else if (switchOn) {
            return R.drawable.ic_config_focus_peak_en_on;
        } else {
            return R.drawable.ic_config_focus_peak_en_off;
        }
    }

    @DrawableRes
    private int getHFRImageResource(int mode) {
        if (mode == 170) {
            return R.drawable.ic_config_video_fps_120;
        }
        return R.drawable.ic_config_video_fps_30;
    }

    private void expandExtra(ComponentData componentData, View anchorView, int tag) {
        if (!this.mLastAnimationComponent.reverse(true)) {
            int targetPosition;
            int state;
            ExpandAdapter adapter = new ExpandAdapter(componentData, this);
            int recyclerViewWidth = getResources().getDimensionPixelSize(R.dimen.expanded_text_item_width) * componentData.getItems().size();
            this.mExpandView.getLayoutParams().width = recyclerViewWidth;
            this.mExpandView.setAdapter(adapter);
            this.mExpandView.setVisibility(0);
            this.mExpandView.setTag(Integer.valueOf(tag));
            int offset = getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width) * 3;
            int targetViewLeft = 0;
            int srcRecyclerViewLeft = 0;
            int targetRecyclerViewLeft = 0;
            int srcPosition = getTopImagePosition(tag);
            if (srcPosition == 0) {
                targetPosition = 0;
                state = 0;
            } else if (srcPosition == 6) {
                targetPosition = 6;
                state = 4;
            } else if (srcPosition == 4 || srcPosition == 5) {
                targetPosition = 3;
                state = 2;
            } else {
                targetPosition = 0;
                state = 1;
            }
            if (this.mIsRTL) {
                state = 4 - state;
            }
            switch (state) {
                case 0:
                    targetViewLeft = 0;
                    srcRecyclerViewLeft = anchorView.getRight() - offset;
                    targetRecyclerViewLeft = anchorView.getWidth() + 0;
                    break;
                case 1:
                    targetViewLeft = 0;
                    srcRecyclerViewLeft = anchorView.getRight() + offset;
                    targetRecyclerViewLeft = anchorView.getWidth() + 0;
                    break;
                case 2:
                    targetViewLeft = getView().getWidth() - anchorView.getWidth();
                    srcRecyclerViewLeft = (anchorView.getLeft() - recyclerViewWidth) - offset;
                    targetRecyclerViewLeft = targetViewLeft - recyclerViewWidth;
                    break;
                case 3:
                    targetViewLeft = getView().getWidth() - anchorView.getWidth();
                    srcRecyclerViewLeft = (anchorView.getLeft() - recyclerViewWidth) - offset;
                    targetRecyclerViewLeft = targetViewLeft - recyclerViewWidth;
                    break;
                case 4:
                    targetViewLeft = getView().getWidth() - anchorView.getWidth();
                    srcRecyclerViewLeft = (anchorView.getLeft() - recyclerViewWidth) + offset;
                    targetRecyclerViewLeft = targetViewLeft - recyclerViewWidth;
                    break;
            }
            this.mLastAnimationComponent.mRecyclerView = this.mExpandView;
            this.mLastAnimationComponent.mReverseLeft = anchorView.getLeft();
            this.mLastAnimationComponent.mReverseRecyclerViewLeft = srcRecyclerViewLeft;
            this.mLastAnimationComponent.hideOtherViews(tag, this.mConfigViews);
            if (srcPosition != targetPosition) {
                this.mLastAnimationComponent.mAnchorView = anchorView;
                ViewCompat.animate(anchorView).translationX((float) (targetViewLeft - anchorView.getLeft())).setStartDelay(0).setDuration(300).setInterpolator(LastAnimationComponent.DEFAULT_INTERPOLATOR).start();
            }
            ViewCompat.setAlpha(this.mExpandView, 0.0f);
            int originalRecyclerViewLeft = this.mIsRTL ? getView().getWidth() - recyclerViewWidth : 0;
            ViewCompat.setTranslationX(this.mExpandView, (float) (srcRecyclerViewLeft - originalRecyclerViewLeft));
            ViewCompat.animate(this.mExpandView).alpha(1.0f).translationX((float) (targetRecyclerViewLeft - originalRecyclerViewLeft)).setDuration(300).setInterpolator(LastAnimationComponent.DEFAULT_INTERPOLATOR).start();
        }
    }

    private void showMenu() {
        this.mTopConfigMenu.setVisibility(8);
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.clear();
            topAlert.setShow(false);
        }
        this.mFragmentTopConfigExtra = new FragmentTopConfigExtra();
        this.mFragmentTopConfigExtra.setDegree(this.mDegree);
        ((MarginLayoutParams) this.mTopExtraParent.getLayoutParams()).topMargin = this.mDisplayRectTopMargin;
        FragmentUtils.addFragmentWithTag(getChildFragmentManager(), R.id.top_config_extra, this.mFragmentTopConfigExtra, this.mFragmentTopConfigExtra.getFragmentTag());
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        modeCoordinator.attachProtocol(172, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        modeCoordinator.detachProtocol(172, this);
        FragmentTransaction fragmentTransaction = getChildFragmentManager().beginTransaction();
        if (this.mFragmentTopAlert != null) {
            fragmentTransaction.remove(this.mFragmentTopAlert);
        }
        if (this.mFragmentTopConfigExtra != null) {
            fragmentTransaction.remove(this.mFragmentTopConfigExtra);
        }
        fragmentTransaction.commitAllowingStateLoss();
    }

    public boolean onBackEvent(int callingFrom) {
        boolean z;
        LastAnimationComponent lastAnimationComponent = this.mLastAnimationComponent;
        if (callingFrom != 4) {
            z = true;
        } else {
            z = false;
        }
        if (lastAnimationComponent.reverse(z)) {
            return true;
        }
        FragmentTopConfigExtra fragmentTopConfigExtra = getTopExtra();
        if (fragmentTopConfigExtra == null) {
            return false;
        }
        switch (callingFrom) {
            case 1:
            case 2:
                fragmentTopConfigExtra.animateOut();
                Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(Callback.DEFAULT_DRAG_ANIMATION_DURATION)).subscribe();
                break;
            case 6:
                fragmentTopConfigExtra.animateOut();
                Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(Callback.DEFAULT_DRAG_ANIMATION_DURATION)).subscribe();
                break;
            default:
                FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(245));
                this.mTopConfigMenu.setVisibility(0);
                break;
        }
        if (callingFrom != 4) {
            FragmentTopAlert topAlert = getTopAlert();
            if (topAlert != null) {
                topAlert.setShow(true);
                reConfigTipImage();
                alertUpdateValue(4);
            }
        }
        return true;
    }

    private boolean setTopImageResource(int newType, ImageView imageView, int newMode, DataItemConfig dataItemConfig, int position, boolean isSwitchingMode) {
        int newImageResourceId = 0;
        int contentDescriptionStringId = 0;
        switch (newType) {
            case 193:
                ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
                if (!componentFlash.isEmpty()) {
                    newImageResourceId = componentFlash.getValueSelectedDrawableIgnoreClose(newMode);
                    contentDescriptionStringId = componentFlash.getValueSelectedStringIdIgnoreClose(newMode);
                    if (!isSwitchingMode) {
                        String flashValue = componentFlash.getComponentValue(newMode);
                        if (!"1".equals(flashValue) && !"101".equals(flashValue)) {
                            if (!"2".equals(flashValue)) {
                                alertFlash(8, false, false);
                                break;
                            }
                            alertFlash(0, true, false);
                            break;
                        }
                        alertFlash(0, false, false);
                        break;
                    }
                }
                break;
            case 194:
                ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
                if (!componentHdr.isEmpty()) {
                    newImageResourceId = componentHdr.getValueSelectedDrawableIgnoreClose(newMode);
                    contentDescriptionStringId = componentHdr.getValueSelectedStringIdIgnoreClose(newMode);
                    if (!isSwitchingMode) {
                        String hdrValue = componentHdr.getComponentValue(newMode);
                        if (!"on".equals(hdrValue) && !"normal".equals(hdrValue)) {
                            if (!"live".equals(hdrValue)) {
                                alertHDR(8, false, false);
                                break;
                            }
                            alertHDR(0, true, false);
                            break;
                        }
                        alertHDR(0, false, false);
                        break;
                    }
                }
                break;
            case 195:
                newImageResourceId = R.drawable.ic_portrait_button_normal;
                contentDescriptionStringId = R.string.accessibility_protrait;
                break;
            case 196:
                String filter;
                if (isSwitchingMode) {
                    filter = DataRepository.getInstance().backUp().getBackupFilter(newMode, DataRepository.dataItemGlobal().getCurrentCameraId());
                } else {
                    filter = DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(newMode);
                }
                int currentFilterIndex = Integer.parseInt(filter);
                if (currentFilterIndex == FilterInfo.FILTER_ID_NONE || currentFilterIndex <= 0) {
                    newImageResourceId = R.drawable.ic_effect_button_normal;
                } else {
                    newImageResourceId = R.drawable.ic_effect_button_selected_normal;
                }
                ModeProtocol$ActionProcessing processing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                if (processing != null) {
                    if (!processing.isShowFilter()) {
                        contentDescriptionStringId = R.string.accessibility_filter_open_panel;
                        break;
                    }
                    contentDescriptionStringId = R.string.accessibility_filter_close_panel;
                    break;
                }
                break;
            case 197:
                newImageResourceId = R.drawable.ic_more;
                contentDescriptionStringId = R.string.accessibility_more;
                break;
            case 198:
                return false;
            case 199:
                newImageResourceId = getFocusPeakImageResource();
                contentDescriptionStringId = R.string.accessibility_foucs_peak;
                break;
            case Callback.DEFAULT_DRAG_ANIMATION_DURATION /*200*/:
                newImageResourceId = dataItemConfig.getComponentBokeh().getValueSelectedDrawable(newMode);
                if (!"on".equals(dataItemConfig.getComponentBokeh().getComponentValue(newMode))) {
                    contentDescriptionStringId = R.string.accessibility_bokeh_normal;
                    break;
                }
                contentDescriptionStringId = R.string.accessibility_bokeh_on;
                break;
            case 201:
                if (!CameraSettings.getAiSceneOpen()) {
                    newImageResourceId = R.drawable.ic_ai_scene_off;
                    break;
                }
                newImageResourceId = R.drawable.ic_ai_scene_on;
                break;
            case 202:
                newImageResourceId = getHFRImageResource(newMode);
                break;
            case 225:
                newImageResourceId = R.drawable.ic_config_setting;
                contentDescriptionStringId = R.string.accessibility_setting;
                break;
        }
        if (newImageResourceId > 0) {
            Drawable drawable = getResources().getDrawable(newImageResourceId);
            int initialMargin = getInitialMargin(position);
            if (initialMargin > 0) {
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) imageView.getLayoutParams();
                if (this.mIsRTL) {
                    marginLayoutParams.rightMargin = (initialMargin - (drawable.getIntrinsicWidth() / 2)) - this.mViewPadding;
                } else {
                    marginLayoutParams.leftMargin = (initialMargin - (drawable.getIntrinsicWidth() / 2)) - this.mViewPadding;
                }
            }
            if (imageView == null) {
                Log.e("FragmentTopConfig", "newMode = " + newMode + ", newType = " + newType);
            } else {
                imageView.setImageDrawable(drawable);
                if (contentDescriptionStringId > 0 && Util.isAccessible()) {
                    imageView.setContentDescription(getString(contentDescriptionStringId));
                }
            }
        }
        return true;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        if (this.mCurrentMode != newMode) {
            this.mBeforeMode = this.mCurrentMode;
        }
        int lastMode = this.mCurrentMode;
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        boolean needBack = true;
        switch (lastMode) {
            case 162:
            case 168:
            case 169:
            case 170:
                switch (newMode) {
                    case 162:
                    case 168:
                    case 169:
                    case 170:
                        needBack = false;
                        break;
                }
                break;
        }
        if (needBack) {
            onBackEvent(4);
        }
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.provideAnimateElement(newMode, animateInElements, false);
        }
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        int cameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        CameraCapabilities cameraCapabilities = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(cameraId, this.mCurrentMode);
        if (cameraCapabilities != null) {
            this.mSupportedConfigs = SupportedConfigFactory.getSupportedTopConfigs(this.mCurrentMode, dataItemConfig, cameraId, cameraCapabilities);
            for (int i = 0; i < this.mConfigViews.size(); i++) {
                ImageView imageView = (ImageView) this.mConfigViews.get(i);
                int newType = this.mSupportedConfigs.getConfig(i);
                boolean inOrOut = setTopImageResource(newType, imageView, newMode, dataItemConfig, i, animateInElements != null);
                if (imageView.getTag() == null || ((Integer) imageView.getTag()).intValue() != newType) {
                    imageView.setTag(Integer.valueOf(newType));
                    if (animateInElements == null) {
                        if (inOrOut) {
                            AlphaInOnSubscribe.directSetResult(imageView);
                        } else {
                            AlphaOutOnSubscribe.directSetResult(imageView);
                        }
                    } else if (inOrOut) {
                        AlphaInOnSubscribe alphaInOnSubscribe = new AlphaInOnSubscribe(imageView);
                        alphaInOnSubscribe.setStartDelayTime(150).setDurationTime(150);
                        animateInElements.add(Completable.create(alphaInOnSubscribe));
                    } else if (lastMode == 165 || this.mCurrentMode == 165) {
                        AlphaOutOnSubscribe.directSetResult(imageView);
                    } else {
                        animateInElements.add(Completable.create(new AlphaOutOnSubscribe(imageView).setDurationTime(150)));
                    }
                }
            }
        }
    }

    private void resetImages() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        int cameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        this.mSupportedConfigs = SupportedConfigFactory.getSupportedTopConfigs(this.mCurrentMode, dataItemConfig, cameraId, Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(cameraId, this.mCurrentMode));
        for (int i = 0; i < this.mConfigViews.size(); i++) {
            ImageView imageView = (ImageView) this.mConfigViews.get(i);
            int newType = this.mSupportedConfigs.getConfig(i);
            setTopImageResource(newType, imageView, this.mCurrentMode, dataItemConfig, i, false);
            imageView.setTag(Integer.valueOf(newType));
        }
    }

    public void updateConfigItem(int... configItems) {
        this.mBeforeMode = this.mCurrentMode;
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        for (int configItem : configItems) {
            setTopImageResource(configItem, getTopImage(configItem), this.mCurrentMode, dataItemConfig, getTopImagePosition(configItem), false);
        }
    }

    public void insertConfigItem(int newConfigItem) {
        if (!this.mSupportedConfigs.hasConfig(newConfigItem)) {
            final View oldFilterView = getTopImage(196);
            int filterSrcStart = this.mIsRTL ? getView().getWidth() - oldFilterView.getRight() : oldFilterView.getLeft();
            resetImages();
            final View newFilterView = getTopImage(196);
            newFilterView.setVisibility(4);
            int distance = ((MarginLayoutParams) newFilterView.getLayoutParams()).getMarginStart() - filterSrcStart;
            if (this.mIsRTL) {
                distance = -distance;
            }
            Completable.create(new TranslateXOnSubscribe(oldFilterView, distance)).subscribe(new Action() {
                public void run() throws Exception {
                    oldFilterView.setVisibility(4);
                    ViewCompat.setTranslationX(oldFilterView, 0.0f);
                    AlphaInOnSubscribe.directSetResult(newFilterView);
                }
            });
            Completable.create(new AlphaInOnSubscribe(getTopImage(newConfigItem))).subscribe();
        }
    }

    public void removeConfigItem(int departedConfigItem) {
        if (this.mSupportedConfigs.hasConfig(departedConfigItem)) {
            View departedView = getTopImage(departedConfigItem);
            final View oldFilterView = getTopImage(196);
            int filterSrcStart = ((MarginLayoutParams) oldFilterView.getLayoutParams()).getMarginStart();
            resetImages();
            final View newFilterView = getTopImage(196);
            newFilterView.setVisibility(4);
            int distance = (this.mIsRTL ? getView().getWidth() - newFilterView.getRight() : newFilterView.getLeft()) - filterSrcStart;
            if (this.mIsRTL) {
                distance = -distance;
            }
            Completable.create(new TranslateXOnSubscribe(oldFilterView, distance)).subscribe(new Action() {
                public void run() throws Exception {
                    oldFilterView.setVisibility(4);
                    ViewCompat.setTranslationX(oldFilterView, 0.0f);
                    AlphaInOnSubscribe.directSetResult(newFilterView);
                }
            });
            Completable.create(new AlphaOutOnSubscribe(departedView)).subscribe();
        }
    }

    public void removeExtraMenu(int callFrom) {
        onBackEvent(callFrom);
    }

    public void hideExtraMenu() {
        onBackEvent(6);
    }

    public void refreshExtraMenu() {
        if (this.mFragmentTopConfigExtra != null && this.mFragmentTopConfigExtra.isAdded()) {
            this.mFragmentTopConfigExtra.reFresh();
        }
    }

    public void hideConfigMenu() {
        Completable.create(new AlphaOutOnSubscribe(this.mTopConfigMenu)).subscribe();
    }

    public void setRecordingTimeState(int state) {
        switch (state) {
            case 1:
                Completable.create(new AlphaOutOnSubscribe(this.mTopConfigMenu)).subscribe();
                break;
            case 2:
                Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu)).subscribe();
                break;
        }
        getTopAlert().setRecordingTimeState(state);
    }

    public void updateRecordingTime(String value) {
        getTopAlert().updateRecordingTime(value);
    }

    public void alertHDR(int visible, boolean live, boolean showSelector) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && (topAlert.isShow() ^ 1) == 0) {
            if (visible != 0) {
                this.mLastAnimationComponent.reverse(true);
            } else if (showSelector) {
                getTopImage(194).performClick();
            }
            topAlert.alertHDR(visible, getAlertTopMargin(), live);
        }
    }

    public void alertFlash(int visible, boolean torch, boolean showSelector) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && (topAlert.isShow() ^ 1) == 0) {
            if (visible != 0) {
                this.mLastAnimationComponent.reverse(true);
            } else if (showSelector) {
                getTopImage(193).performClick();
            }
            topAlert.alertFlash(visible, getAlertTopMargin(), torch);
        }
    }

    public void alertUpdateValue(int type) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && (topAlert.isShow() ^ 1) == 0) {
            topAlert.alertUpdateValue(type, getAlertTopMargin());
        }
    }

    public void alertAiSceneSelector(int visible, OnCheckedChangeListener listener) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && (topAlert.isShow() ^ 1) == 0) {
            topAlert.alertAiSceneSelector(visible, getAlertTopMargin(), listener);
        }
    }

    public void setAiSceneImageLevel(int modeIndex) {
        int aiSceneLevel = modeIndex;
        if (modeIndex == 25) {
            aiSceneLevel = 23;
        }
        Drawable imgDrawable = getAiSceneDrawable(aiSceneLevel);
        if (imgDrawable != null) {
            getTopImage(201).setImageDrawable(imgDrawable);
            this.mCurrentAiSceneLevel = aiSceneLevel;
        }
    }

    public void alertAiSceneSwitchHint(int visible) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && (topAlert.isShow() ^ 1) == 0) {
            topAlert.alertAiSceneSwitchHint(visible, getAlertTopMargin());
        }
    }

    private FragmentTopAlert getTopAlert() {
        if (this.mFragmentTopAlert == null || !this.mFragmentTopAlert.isAdded()) {
            return null;
        }
        return this.mFragmentTopAlert;
    }

    private FragmentTopConfigExtra getTopExtra() {
        return (FragmentTopConfigExtra) getChildFragmentManager().findFragmentByTag(String.valueOf(245));
    }

    private int getAlertTopMargin() {
        if (this.mCurrentMode == 165 && this.mDisplayRectTopMargin == 0) {
            int screenWidth = getResources().getDisplayMetrics().widthPixels;
            return (((int) (((((float) screenWidth) / 0.75f) - ((float) screenWidth)) / 2.0f)) - this.mDisplayRectTopMargin) + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
        } else if (Util.isNotchDevice && this.mDisplayRectTopMargin == Util.sStatusBarHeight) {
            return this.mDisplayRectTopMargin + this.mTopConfigMenu.getHeight();
        } else {
            if (this.mDisplayRectTopMargin > 0) {
                return this.mDisplayRectTopMargin + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
            }
            return this.mTopConfigMenu.getHeight() + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
        }
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        this.mDisplayRectTopMargin = Util.getDisplayRect(getContext()).top;
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    public void notifyAfterFrameAvailable(int arrivedType) {
        super.notifyAfterFrameAvailable(arrivedType);
        ModeProtocol$ConfigChanges configChanges = (ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.reCheckMutexConfigs();
        }
    }

    private void reConfigTipImage() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        ComponentConfigFlash componentConfigFlash = dataItemConfig.getComponentFlash();
        if (!(componentConfigFlash.isEmpty() || (componentConfigFlash.isClosed() ^ 1) == 0)) {
            String flashValue = componentConfigFlash.getComponentValue(this.mCurrentMode);
            if ("1".equals(flashValue)) {
                alertFlash(0, false, false);
                return;
            } else if ("2".equals(flashValue)) {
                alertFlash(0, true, false);
                return;
            }
        }
        ComponentConfigHdr componentConfigHdr = dataItemConfig.getComponentHdr();
        if (!(componentConfigHdr.isEmpty() || (componentConfigHdr.isClosed() ^ 1) == 0)) {
            String hdrValue = componentConfigHdr.getComponentValue(this.mCurrentMode);
            if ("on".equals(hdrValue) || "normal".equals(hdrValue)) {
                alertHDR(0, false, false);
            } else if ("live".equals(hdrValue)) {
                alertHDR(0, true, false);
            }
        }
    }

    public void provideRotateItem(List<View> pendingRotateItems, int degree) {
        super.provideRotateItem(pendingRotateItems, degree);
        FragmentTopConfigExtra fragmentTopConfigExtra = getTopExtra();
        if (fragmentTopConfigExtra != null) {
            fragmentTopConfigExtra.provideRotateItem(pendingRotateItems, degree);
        }
    }

    private Drawable getAiSceneDrawable(int level) {
        TypedArray icons = getResources().obtainTypedArray(R.array.ai_scene_drawables);
        if (level < 0 || level > icons.length()) {
            return null;
        }
        Drawable result = icons.getDrawable(level);
        icons.recycle();
        return result;
    }

    public void updateContentDescription() {
        ImageView imageView = getTopImage(196);
        if (imageView != null) {
            imageView.setContentDescription(getString(R.string.accessibility_filter_open_panel));
        }
    }
}
