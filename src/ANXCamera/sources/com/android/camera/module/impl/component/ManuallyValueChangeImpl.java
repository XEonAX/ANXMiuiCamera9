package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.ComponentManuallyFocus;
import com.android.camera.data.data.config.ComponentManuallyISO;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.effect.EffectController;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.statistic.CameraStatUtil;

public class ManuallyValueChangeImpl implements ModeProtocol$ManuallyValueChanged {
    private static final String TAG = ManuallyValueChangeImpl.class.getSimpleName();
    private ActivityBase mActivity;

    public static ManuallyValueChangeImpl create(ActivityBase activityBase) {
        return new ManuallyValueChangeImpl(activityBase);
    }

    public ManuallyValueChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public BaseModule getBaseModule() {
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(174, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(174, this);
    }

    public void onWBValueChanged(ComponentManuallyWB componentData, String newValue, boolean isCustomValue) {
        String key;
        if (isCustomValue) {
            key = "pref_qc_manual_whitebalance_k_value_key";
        } else {
            key = componentData.getKey(167);
        }
        if (isCustomValue) {
            newValue = "manual";
        }
        CameraStatUtil.trackAwbChanged(newValue);
        getBaseModule().updatePreferenceInWorkThread(6);
    }

    public void onFocusValueChanged(ComponentManuallyFocus componentData, String oldValue, String newValue) {
        if (!CameraSettings.getMappingFocusMode(Integer.valueOf(oldValue).intValue()).equals(CameraSettings.getMappingFocusMode(Integer.valueOf(newValue).intValue()))) {
            CameraSettings.setFocusModeSwitching(true);
            boolean switchMode = newValue.equals(componentData.getDefaultValue(167));
            if (Device.isSupportedPeakingMF()) {
                ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (switchMode) {
                    topAlert.removeConfigItem(199);
                    EffectController.getInstance().setDrawPeaking(false);
                } else {
                    topAlert.insertConfigItem(199);
                    if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_peak_key")) {
                        EffectController.getInstance().setDrawPeaking(true);
                    }
                }
            }
        }
        getBaseModule().updatePreferenceInWorkThread(14);
    }

    public void onETValueChanged(ComponentManuallyET componentData, String newValue) {
        CameraStatUtil.trackExposureTimeChanged(newValue);
        getBaseModule().updatePreferenceInWorkThread(16, 20);
    }

    public void onISOValueChanged(ComponentManuallyISO componentData, String newValue) {
        CameraStatUtil.trackIsoChanged(newValue);
        getBaseModule().updatePreferenceInWorkThread(15);
    }

    public void onDualZoomHappened(boolean isTo2X) {
        BaseModule baseModule = getBaseModule();
        if (baseModule.isAlive() && !CameraSettings.isSwitchCameraZoomMode() && baseModule.getActualCameraId() == Camera2DataContainer.getInstance().getMuxCameraId()) {
            baseModule.notifyDualZoom(isTo2X);
        }
    }

    public void onDualLensZooming(boolean start) {
        BaseModule baseModule = getBaseModule();
        if (baseModule.isAlive() && !CameraSettings.isSwitchCameraZoomMode() && baseModule.getActualCameraId() == Camera2DataContainer.getInstance().getMuxCameraId()) {
            baseModule.notifyZooming(start);
        }
    }

    public void onDualLensSwitch(ComponentManuallyDualLens componentData, int module) {
        String newValue = componentData.getComponentValue(module).equals("wide") ? "tele" : "wide";
        componentData.setComponentValue(module, newValue);
        CameraStatUtil.trackLensChanged(newValue);
        this.mActivity.onModeSelected(StartControl.create(module).setResetType(5).setNeedViewAnimation(true).setNeedBlurAnimation(true));
    }

    public void onDualZoomValueChanged(float newValueRatio, boolean sync) {
        if (getBaseModule().isAlive()) {
            getBaseModule().onZoomRatioChanged(newValueRatio, sync);
        }
    }
}
