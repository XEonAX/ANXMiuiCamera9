package com.android.camera.module.impl.component;

import android.content.Intent;
import android.support.annotation.StringRes;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import com.android.camera.ActivityBase;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.MutexModeManager;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.Camera2Module;
import com.android.camera.module.loader.StartControl;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$ConfigChanges;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera.protocol.ModeProtocol$ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera2.Camera2Proxy;

public class ConfigChangeImpl implements ModeProtocol$ConfigChanges {
    private static final String TAG = ConfigChangeImpl.class.getSimpleName();
    private ActivityBase mActivity;
    private boolean mLastAiSceneStateOn = CameraSettings.getAiSceneOpen();
    private int[] mRecordingMutexElements;

    public static ConfigChangeImpl create(ActivityBase activityBase) {
        return new ConfigChangeImpl(activityBase);
    }

    public ConfigChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public BaseModule getBaseModule() {
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(164, this);
    }

    public void unRegisterProtocol() {
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(164, this);
    }

    public void onConfigChanged(int selectedItem) {
        if (isAlive()) {
            if (SupportedConfigFactory.isMutexConfig(selectedItem)) {
                DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
                for (int mutexItem : SupportedConfigFactory.MUTEX_MENU_CONFIGS) {
                    if (mutexItem != selectedItem && dataItemRunning.isSwitchOn(SupportedConfigFactory.getConfigKey(mutexItem))) {
                        applyConfig(mutexItem, 3);
                    }
                }
                getBaseModule().onSharedPreferenceChanged();
            }
            applyConfig(selectedItem, 1);
        }
    }

    public void reCheckMutexConfigs() {
        if (isAlive() && getBaseModule().isCreated()) {
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            for (int mutexItem : SupportedConfigFactory.MUTEX_MENU_CONFIGS) {
                if (dataItemRunning.isSwitchOn(SupportedConfigFactory.getConfigKey(mutexItem))) {
                    applyConfig(mutexItem, 2);
                    break;
                }
            }
        }
    }

    private void applyConfig(int selectedItem, int checkType) {
        switch (selectedItem) {
            case 195:
                configPortraitSwitch(checkType);
                return;
            case 196:
                showFilter();
                return;
            case 199:
                configFocusPeakSwitch(checkType);
                return;
            case 201:
                configAiSceneSwitch(checkType);
                return;
            case 202:
                configVideoHFR();
                return;
            case 225:
                showSetting();
                return;
            case 226:
                configTimerSwitch();
                return;
            case 228:
                configTiltSwitch(checkType);
                return;
            case 229:
                configGradienterSwitch(checkType);
                return;
            case 230:
                configHHTSwitch(checkType);
                return;
            case 231:
                configMagicFocusSwitch();
                return;
            case 232:
                configVideoSlow();
                return;
            case 233:
                configVideoFast();
                return;
            case 234:
                configScene(checkType);
                return;
            case 235:
                configGroupSwitch(checkType);
                return;
            case 236:
                configMagicMirrorSwitch(checkType);
                return;
            case 237:
                configRawSwitch();
                return;
            case 238:
                configGenderAgeSwitch(checkType);
                return;
            case 239:
                configBeautySwitch(checkType);
                return;
            case 240:
                configDualWaterMarkSwitch();
                return;
            case 241:
                configSuperResolutionSwitch(checkType);
                return;
            default:
                return;
        }
    }

    public void showSetting() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra("from_where", DataRepository.dataItemGlobal().getCurrentMode());
        if (DataRepository.dataItemGlobal().getIntentType() == 1) {
            intent.putExtra("IsCaptureIntent", true);
        }
        intent.putExtra(":miui:starting_window_label", this.mActivity.getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        trackGotoSettings();
    }

    private void trackGotoSettings() {
        BaseModule module = (BaseModule) this.mActivity.getCurrentModule();
        if (module != null) {
            CameraStatUtil.trackGotoSettings(module.getModuleIndex());
        }
    }

    public void showFilter() {
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideFilter();
            if (baseDelegate.getActiveFragment(R.id.bottom_action) == 251) {
                baseDelegate.delegateEvent(7);
            }
        }
    }

    public void configFlash(String newConfig) {
        conflictWithFlashAndHdr();
        getBaseModule().updatePreferenceInWorkThread(11, 10);
    }

    public void configHdr(String newConfig) {
        conflictWithFlashAndHdr();
        getBaseModule().updatePreferenceInWorkThread(37, 11, 10);
    }

    public void configBokeh(String newConfig) {
        BaseModule baseModule = getBaseModule();
        if ("on".equals(newConfig)) {
            updateTipMessage(4, R.string.bokeh_use_hint, 2);
        } else {
            hideTipMessage(R.string.bokeh_use_hint);
        }
        baseModule.updatePreferenceInWorkThread(11, 37);
    }

    public void configGradienterSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_gradienter_key");
        if (1 == checkType) {
            trackGradienterChanged(switchOn);
        }
        ((Camera2Module) getBaseModule()).onGradienterSwitched(switchOn);
        EffectController.getInstance().setDrawGradienter(switchOn);
    }

    public void configHHTSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_hand_night_key");
        if (1 == checkType) {
            trackHHTChanged(switchOn);
        }
        MutexModeManager mutexModeManager = getBaseModule().getMutexModePicker();
        if (switchOn) {
            updateTipMessage(4, R.string.hine_hht, 2);
            closeMutexElement("a", 193, 194);
            mutexModeManager.setMutexModeMandatory(3);
            return;
        }
        hideTipMessage(R.string.hine_hht);
        mutexModeManager.clearMandatoryFlag();
        getBaseModule().resetMutexModeManually();
        restoreAllMutexElement("a");
    }

    public void configSuperResolutionSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_super_resolution_key");
        if (1 == checkType) {
            trackSuperResolutionChanged(switchOn);
        }
        MutexModeManager mutexModeManager = getBaseModule().getMutexModePicker();
        if (switchOn) {
            closeMutexElement("c", 193, 194);
            mutexModeManager.setMutexModeMandatory(10);
            return;
        }
        mutexModeManager.clearMandatoryFlag();
        getBaseModule().resetMutexModeManually();
        restoreAllMutexElement("c");
    }

    public void configTiltSwitch(int checkType) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        boolean switchOn = dataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
        ComponentRunningTiltValue tiltValue = dataItemRunning.getComponentRunningTiltValue();
        switch (checkType) {
            case 1:
                if (switchOn) {
                    if (!"circle".equals(tiltValue.getComponentValue(160))) {
                        CameraStatUtil.trackTiltShiftChanged("off");
                        dataItemRunning.switchOff("pref_camera_tilt_shift_mode");
                        switchOn = false;
                        break;
                    }
                    CameraStatUtil.trackTiltShiftChanged("parallel");
                    tiltValue.setComponentValue(160, "parallel");
                    break;
                }
                switchOn = true;
                CameraStatUtil.trackTiltShiftChanged("circle");
                dataItemRunning.switchOn("pref_camera_tilt_shift_mode");
                tiltValue.setComponentValue(160, "circle");
                break;
            case 3:
                switchOn = false;
                dataItemRunning.switchOff("pref_camera_tilt_shift_mode");
                break;
        }
        ((Camera2Module) getBaseModule()).onTiltShiftSwitched(switchOn);
        EffectController.getInstance().setDrawTilt(switchOn);
    }

    public void configTimerSwitch() {
        ComponentRunningTimer componentRunningTimer = DataRepository.dataItemRunning().getComponentRunningTimer();
        String nextValue = componentRunningTimer.getNextValue();
        CameraStatUtil.trackTimerChanged(nextValue);
        componentRunningTimer.setComponentValue(160, nextValue);
    }

    public void configMagicFocusSwitch() {
        trackMagicMirrorChanged(DataRepository.dataItemRunning().triggerSwitchAndGet("pref_camera_ubifocus_key"));
    }

    public void configGroupSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_groupshot_mode_key");
        if (1 == checkType) {
            trackGroupChanged(switchOn);
        }
        Camera2Module cameraModule = (Camera2Module) getBaseModule();
        if (switchOn) {
            updateTipMessage(4, R.string.hint_groupshot, 2);
            cameraModule.initGroupShot(cameraModule.getGroupShotMaxImage());
            closeMutexElement("b", 193, 194, 196, 201);
        } else {
            restoreAllMutexElement("b");
            hideTipMessage(R.string.hint_groupshot);
        }
        cameraModule.onSharedPreferenceChanged();
    }

    public void configScene(int checkType) {
        ModeProtocol$ManuallyAdjust manuallyAdjust = (ModeProtocol$ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        if (getState(checkType, "pref_camera_scenemode_setting_key")) {
            manuallyAdjust.setManuallyVisible(2, 1, new ManuallyListener() {
                public void onManuallyDataChanged(ComponentData componentData, String oldValue, String newValue, boolean isCustomValue) {
                    ConfigChangeImpl.this.getBaseModule().onSharedPreferenceChanged();
                }
            });
        } else {
            int i;
            if (checkType == 1) {
                i = 2;
            } else {
                i = 3;
            }
            manuallyAdjust.setManuallyVisible(2, i, null);
        }
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configVideoFast() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemGlobal.getCurrentMode() != 169) {
            dataItemGlobal.setCurrentMode(169);
            CameraStatUtil.trackVideoModeChanged("fast");
            dataItemRunning.switchOff("pref_video_speed_slow_key");
            dataItemRunning.switchOff("pref_video_speed_hfr_key");
            this.mActivity.onModeSelected(StartControl.create(169).setNeedViewAnimation(true).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
            updateTipMessage(4, R.string.hint_fast_motion, 2);
            return;
        }
        hideTipMessage(R.string.hint_fast_motion);
        dataItemRunning.switchOff("pref_video_speed_fast_key");
        dataItemGlobal.setCurrentMode(162);
        CameraStatUtil.trackVideoModeChanged("normal");
        this.mActivity.onModeSelected(StartControl.create(162).setNeedViewAnimation(true).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    public void configVideoSlow() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemGlobal.getCurrentMode() != 168) {
            dataItemGlobal.setCurrentMode(168);
            CameraStatUtil.trackVideoModeChanged("slow");
            dataItemRunning.switchOff("pref_video_speed_fast_key");
            dataItemRunning.switchOff("pref_video_speed_hfr_key");
            this.mActivity.onModeSelected(StartControl.create(168).setNeedViewAnimation(true).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
            updateTipMessage(4, R.string.hint_slow_motion, 2);
            return;
        }
        hideTipMessage(R.string.hint_slow_motion);
        dataItemRunning.switchOff("pref_video_speed_slow_key");
        dataItemGlobal.setCurrentMode(162);
        CameraStatUtil.trackVideoModeChanged("normal");
        this.mActivity.onModeSelected(StartControl.create(162).setNeedViewAnimation(true).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    public void configVideoHFR() {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemGlobal.getCurrentMode() != 170) {
            dataItemGlobal.setCurrentMode(170);
            CameraStatUtil.trackVideoModeChanged("hfr");
            dataItemRunning.switchOff("pref_video_speed_fast_key");
            dataItemRunning.switchOff("pref_video_speed_slow_key");
            this.mActivity.onModeSelected(StartControl.create(170).setNeedViewAnimation(true).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
            return;
        }
        dataItemRunning.switchOff("pref_video_speed_hfr_key");
        dataItemGlobal.setCurrentMode(162);
        CameraStatUtil.trackVideoModeChanged("normal");
        this.mActivity.onModeSelected(StartControl.create(162).setNeedViewAnimation(true).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
    }

    public void configMagicMirrorSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_magic_mirror_key");
        if (1 == checkType) {
            trackMagicMirrorChanged(switchOn);
        }
        ((ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setShowMagicMirror(switchOn);
        getBaseModule().updatePreferenceInWorkThread(39);
        Camera2Proxy device;
        if (switchOn) {
            device = getBaseModule().getCameraDevice();
            if (device != null) {
                String format = getBaseModule().getResources().getString(R.string.face_score_info);
                device.setFaceWaterMarkEnable(true);
                device.setFaceWaterMarkFormat(format);
                return;
            }
            return;
        }
        device = getBaseModule().getCameraDevice();
        if (device != null) {
            device.setFaceWaterMarkEnable(false);
        }
    }

    public void configRawSwitch() {
    }

    public void configPortraitSwitch(int checkType) {
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configGenderAgeSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_show_gender_age_key");
        if (1 == checkType) {
            trackGenderAgeChanged(switchOn);
        }
        ((ModeProtocol$MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).setShowGenderAndAge(switchOn);
        getBaseModule().updatePreferenceInWorkThread(38);
        Camera2Proxy device;
        if (switchOn) {
            device = getBaseModule().getCameraDevice();
            if (device != null) {
                String ageFormat = getBaseModule().getResources().getString(R.string.face_age_info);
                device.setFaceWaterMarkEnable(true);
                device.setFaceWaterMarkFormat(ageFormat);
                return;
            }
            return;
        }
        device = getBaseModule().getCameraDevice();
        if (device != null) {
            device.setFaceWaterMarkEnable(false);
        }
    }

    public void configFocusPeakSwitch(int checkType) {
        boolean switchOn = getState(checkType, "pref_camera_peak_key");
        if (1 == checkType) {
            trackFocusPeakChanged(switchOn);
        }
        if (!switchOn) {
            EffectController.getInstance().setDrawPeaking(switchOn);
        } else if ("manual".equals(CameraSettings.getFocusMode())) {
            EffectController.getInstance().setDrawPeaking(switchOn);
        }
    }

    public void configDualWaterMarkSwitch() {
        boolean switchOn = CameraSettings.isDualCameraWaterMarkOpen();
        CameraStatUtil.trackDualWaterMarkChanged(switchOn ^ 1);
        if (switchOn) {
            hideTipMessage(R.string.hunt_dual_water_mark);
            CameraSettings.setDualCameraWaterMarkOpen(false);
        } else {
            updateTipMessage(4, R.string.hunt_dual_water_mark, 2);
            CameraSettings.setDualCameraWaterMarkOpen(true);
        }
        getBaseModule().onSharedPreferenceChanged();
    }

    public void configBeautySwitch(int checkType) {
        if (getBaseModule().getModuleIndex() == 163 || getBaseModule().getModuleIndex() == 165) {
            Camera2Module camera2Module = (Camera2Module) getBaseModule();
            ComponentConfigBeauty componentConfigBeauty = DataRepository.dataItemConfig().getComponentConfigBeauty();
            componentConfigBeauty.setComponentValue(camera2Module.getModuleIndex(), componentConfigBeauty.getNextValue(camera2Module.getModuleIndex()));
            getBaseModule().updatePreferenceInWorkThread(13);
        }
    }

    private void configAiSceneSwitch(int checkType) {
        boolean switchOn = CameraSettings.getAiSceneOpen();
        Log.d(TAG, "configAiSceneSwitch: " + (switchOn ^ 1));
        ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        switch (checkType) {
            case 1:
                if (switchOn) {
                    this.mLastAiSceneStateOn = false;
                    topAlert.alertAiSceneSwitchHint(8);
                    CameraSettings.setAiSceneOpen(false);
                    CameraStatUtil.trackPreferenceChange("pref_camera_ai_scene_mode_key", "off");
                } else {
                    this.mLastAiSceneStateOn = true;
                    topAlert.alertAiSceneSwitchHint(0);
                    CameraSettings.setAiSceneOpen(true);
                    CameraStatUtil.trackPreferenceChange("pref_camera_ai_scene_mode_key", "on");
                }
                topAlert.updateConfigItem(201);
                if (CameraSettings.isGroupShotOn()) {
                    ((ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).configGroupSwitch(4);
                    topAlert.refreshExtraMenu();
                    break;
                }
                break;
            case 3:
                CameraSettings.setAiSceneOpen(false);
                topAlert.updateConfigItem(201);
                break;
        }
        getBaseModule().updatePreferenceTrampoline(36);
        getBaseModule().getCameraDevice().resumePreview();
    }

    private boolean getState(int checkType, String key) {
        switch (checkType) {
            case 2:
                return DataRepository.dataItemRunning().isSwitchOn(key);
            case 4:
                DataRepository.dataItemRunning().switchOff(key);
                return false;
            default:
                return DataRepository.dataItemRunning().triggerSwitchAndGet(key);
        }
    }

    public void closeMutexElement(String trigger, int... items) {
        int[] updateTypes = new int[items.length];
        this.mRecordingMutexElements = items;
        for (int i = 0; i < items.length; i++) {
            switch (items[i]) {
                case 193:
                    updateComponentFlash(trigger, true);
                    updateTypes[i] = 10;
                    break;
                case 194:
                    updateComponentHdr(true);
                    updateTypes[i] = 11;
                    break;
                case 196:
                    updateComponentFilter(true);
                    updateTypes[i] = 2;
                    break;
                case Callback.DEFAULT_DRAG_ANIMATION_DURATION /*200*/:
                    updateBokeh(true);
                    updateTypes[i] = 37;
                    break;
                case 201:
                    updateAiScene(true);
                    updateTypes[i] = 36;
                    break;
                case 239:
                    updateBeauty(true);
                    updateTypes[i] = 13;
                    break;
                default:
                    throw new RuntimeException("unknown mutex element");
            }
        }
        BaseModule baseModule = getBaseModule();
        baseModule.updatePreferenceTrampoline(updateTypes);
        baseModule.getCameraDevice().resumePreview();
    }

    public void restoreAllMutexElement(String trigger) {
        if (this.mRecordingMutexElements != null) {
            int[] updateTypes = new int[this.mRecordingMutexElements.length];
            for (int i = 0; i < this.mRecordingMutexElements.length; i++) {
                switch (this.mRecordingMutexElements[i]) {
                    case 193:
                        updateComponentFlash(null, false);
                        updateTypes[i] = 10;
                        break;
                    case 194:
                        updateComponentHdr(false);
                        updateTypes[i] = 11;
                        break;
                    case 196:
                        updateComponentFilter(false);
                        updateTypes[i] = 2;
                        break;
                    case Callback.DEFAULT_DRAG_ANIMATION_DURATION /*200*/:
                        updateBokeh(false);
                        updateTypes[i] = 37;
                        break;
                    case 201:
                        updateAiScene(false);
                        updateTypes[i] = 36;
                        break;
                    case 239:
                        updateBeauty(false);
                        updateTypes[i] = 13;
                        break;
                    default:
                        throw new RuntimeException("unknown mutex element");
                }
            }
            this.mRecordingMutexElements = null;
            getBaseModule().updatePreferenceInWorkThread(updateTypes);
        }
    }

    private void updateComponentFlash(String trigger, boolean close) {
        ComponentConfigFlash configFlash = DataRepository.dataItemConfig().getComponentFlash();
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        if (!configFlash.isEmpty() && configFlash.isClosed() != close) {
            if (!close || !configFlash.getComponentValue(currentMode).equals("2") || !"d".equals(trigger)) {
                configFlash.setClosed(close);
                ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(193);
            }
        }
    }

    private void updateComponentHdr(boolean close) {
        ComponentConfigHdr configHdr = DataRepository.dataItemConfig().getComponentHdr();
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        if (!configHdr.isEmpty() && configHdr.isClosed() != close) {
            configHdr.setClosed(close);
            ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(194);
        }
    }

    private void updateComponentFilter(boolean close) {
        DataRepository.dataItemRunning().getComponentConfigFilter().setClosed(close, DataRepository.dataItemGlobal().getCurrentMode());
        ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(196);
        ModeProtocol$ActionProcessing processing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        processing.filterUiChange();
        if (close && processing.isShowFilter()) {
            processing.showOrHideFilter();
        }
    }

    private void updateBeauty(boolean close) {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        if (!dataItemConfig.getComponentConfigBeauty().isEmpty() && dataItemConfig.getComponentConfigBeauty().isClosed(currentMode) != close) {
            dataItemConfig.getComponentConfigBeauty().setClosed(close, currentMode);
        }
    }

    private void updateBokeh(boolean close) {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        if (!dataItemConfig.getComponentBokeh().isEmpty() && dataItemConfig.getComponentBokeh().isClosed() != close) {
            dataItemConfig.getComponentBokeh().setClosed(close);
            ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(Callback.DEFAULT_DRAG_ANIMATION_DURATION);
        }
    }

    private void updateAiScene(boolean close) {
        if (this.mLastAiSceneStateOn && CameraSettings.getAiSceneOpen() != (close ^ 1)) {
            CameraSettings.setAiSceneOpen(close ^ 1);
            ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(201);
        }
    }

    private void conflictWithFlashAndHdr() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        dataItemRunning.switchOff("pref_camera_hand_night_key");
        dataItemRunning.switchOff("pref_camera_groupshot_mode_key");
        dataItemRunning.switchOff("pref_camera_super_resolution_key");
        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).directlyHideTips();
    }

    private void updateTipMessage(int tipType, @StringRes int stringResId, int duration) {
        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showTips(tipType, stringResId, duration);
    }

    private void hideTipMessage(@StringRes int tokenResId) {
        ModeProtocol$BottomPopupTips tips = (ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (tokenResId <= 0 || tips.containTips(tokenResId)) {
            tips.directlyHideTips();
        }
    }

    private boolean isAlive() {
        return this.mActivity != null;
    }

    private void trackGradienterChanged(boolean on) {
        CameraStatUtil.trackConfigChange("gradienter_changed", "水平仪", on, true, false);
    }

    private void trackGroupChanged(boolean on) {
        CameraStatUtil.trackConfigChange("group_shot_changed", "合影优选", on, false, true);
    }

    private void trackHHTChanged(boolean on) {
        CameraStatUtil.trackConfigChange("hht_changed", "HHT", on, true, false);
    }

    private void trackGenderAgeChanged(boolean on) {
        CameraStatUtil.trackConfigChange("gender_age_changed", "年龄检测", on, false, true);
    }

    private void trackMagicMirrorChanged(boolean on) {
        CameraStatUtil.trackConfigChange("magic_mirror_changed", "魔镜", on, false, true);
    }

    private void trackFocusPeakChanged(boolean on) {
        CameraStatUtil.trackConfigChange("manual_focus_peak_changed", "峰值对焦", on, false, false);
    }

    private void trackSuperResolutionChanged(boolean on) {
        CameraStatUtil.trackConfigChange("super_resolution_changed", "超分辨率", on, false, false);
    }
}
