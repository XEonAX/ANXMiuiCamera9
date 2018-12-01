package com.android.camera.data.data.global;

import android.content.Intent;
import android.support.v4.util.Pair;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class DataItemGlobal extends DataItemBase {
    private int mIntentType = 0;
    private Boolean mIsTimeOut;
    private int mLastCameraId = getCurrentCameraId();
    private ComponentModuleList mModuleList = new ComponentModuleList(this);
    private boolean mRetriedIfCameraError;
    private boolean mStartFromKeyguard;

    @Retention(RetentionPolicy.SOURCE)
    public @interface IntentType {
    }

    public String provideKey() {
        return "camera_settings_global";
    }

    public boolean isTransient() {
        return false;
    }

    public int getCurrentCameraId() {
        return getCurrentCameraId(getCurrentMode());
    }

    public int getLastCameraId() {
        return this.mLastCameraId;
    }

    private int getCurrentCameraId(int mode) {
        switch (mode) {
            case 166:
            case 167:
                return 0;
            case 171:
                if (Device.isSupportedFrontPortrait()) {
                    return Integer.valueOf(getString("pref_camera_id_key", String.valueOf(getDefaultCameraId(mode)))).intValue();
                }
                return 0;
            default:
                return Integer.valueOf(getString("pref_camera_id_key", String.valueOf(getDefaultCameraId(mode)))).intValue();
        }
    }

    private int getDefaultCameraId(int mode) {
        return 0;
    }

    public void setCameraId(int cameraId) {
        this.mLastCameraId = getCurrentCameraId(getCurrentMode());
        editor().putString("pref_camera_id_key", String.valueOf(cameraId)).apply();
    }

    public void setCameraIdTransient(int cameraId) {
        this.mLastCameraId = getCurrentCameraId(getCurrentMode());
        putString("pref_camera_id_key", String.valueOf(cameraId));
    }

    public int getCurrentMode() {
        return getCurrentMode(this.mIntentType);
    }

    private int getCurrentMode(int intentType) {
        return getInt("pref_camera_mode_key_intent_" + intentType, getDefaultMode(intentType));
    }

    public void setCurrentMode(int newMode) {
        editor().putInt("pref_camera_mode_key_intent_" + this.mIntentType, newMode).apply();
    }

    public ComponentModuleList getComponentModuleList() {
        return this.mModuleList;
    }

    public void reInit() {
        this.mModuleList.reInit();
        ProviderEditor editor = editor();
        this.mIsTimeOut = Boolean.valueOf(false);
        editor.putLong("pref_camera_open_time", System.currentTimeMillis());
        editor.putLong("open_camera_fail_key", 0);
        int currentCameraId = getCurrentCameraId(getCurrentMode());
        this.mLastCameraId = currentCameraId;
        editor.putString("pref_camera_id_key", String.valueOf(currentCameraId));
        editor.apply();
    }

    public boolean getCTACanCollect() {
        return getBoolean("can_connect_network", false);
    }

    public void setCTACanCollect(boolean bool) {
        editor().putBoolean("can_connect_network", bool).apply();
    }

    public boolean isGlobalSwitchOn(String key) {
        return getBoolean(key, false);
    }

    public boolean isIntentAction() {
        return this.mIntentType != 0;
    }

    public int getIntentType() {
        return this.mIntentType;
    }

    public int getDefaultMode(int intentType) {
        switch (intentType) {
            case 1:
            case 3:
                return 163;
            case 2:
                return 162;
            default:
                return 163;
        }
    }

    public boolean isTimeOut() {
        return this.mIsTimeOut != null ? this.mIsTimeOut.booleanValue() : true;
    }

    public void resetTimeOut() {
        this.mIsTimeOut = Boolean.valueOf(false);
        editor().putLong("pref_camera_open_time", System.currentTimeMillis()).apply();
    }

    private boolean determineTimeOut() {
        long currentTime = System.currentTimeMillis();
        boolean timeOut = currentTime - getLong("pref_camera_open_time", currentTime) <= 30000 ? this.mIsTimeOut == null : true;
        if (timeOut && CameraSettings.retainCameraMode()) {
            return false;
        }
        return timeOut;
    }

    public void setStartFromKeyguard(boolean mStartFromKeyguard) {
        this.mStartFromKeyguard = mStartFromKeyguard;
    }

    public Pair<Integer, Integer> parseIntent(Intent intent, Boolean isFromVoiceControl, boolean startFromKeyguard, boolean justFetch) {
        int newIntentType;
        int pendingOpenModule;
        int pendingOpenId;
        String action = intent.getAction();
        if (action == null) {
            action = "<unknown>";
        }
        if (action.equals("android.media.action.IMAGE_CAPTURE")) {
            newIntentType = 1;
        } else if (action.equals("android.media.action.VIDEO_CAPTURE")) {
            newIntentType = 2;
        } else if (action.equals("com.android.camera.action.QR_CODE_CAPTURE") || action.equals("com.google.zxing.client.android.SCAN")) {
            newIntentType = 3;
        } else {
            if (action.equals("android.media.action.STILL_IMAGE_CAMERA") || action.equals("android.media.action.VIDEO_CAMERA")) {
                if (!isFromVoiceControl.booleanValue()) {
                    newIntentType = 0;
                }
            } else if (!action.equals("android.media.action.VOICE_COMMAND")) {
                newIntentType = 0;
            }
            CameraIntentManager cameraIntentManager = CameraIntentManager.getInstance(intent);
            pendingOpenModule = cameraIntentManager.getCameraModeId();
            if (pendingOpenModule == 160) {
                if (determineTimeOut()) {
                    pendingOpenModule = getDefaultMode(0);
                } else {
                    pendingOpenModule = getCurrentMode(0);
                }
            }
            try {
                pendingOpenId = cameraIntentManager.isUseFrontCamera() ? 1 : 0;
            } catch (Exception e) {
                pendingOpenId = determineTimeOut() ? getDefaultCameraId(pendingOpenModule) : getCurrentCameraId(pendingOpenModule);
            }
            Log.d("DataItemGlobal", "intent from voice control assist : pendingOpenId = " + pendingOpenId + ";pendingOpenModule = " + pendingOpenModule);
            this.mIntentType = 0;
            this.mStartFromKeyguard = startFromKeyguard;
            this.mModuleList.setIntentType(this.mIntentType);
            if (pendingOpenModule != getCurrentMode()) {
                setCurrentMode(pendingOpenModule);
                ModuleManager.setActiveModuleIndex(pendingOpenModule);
            }
            if (pendingOpenId != getCurrentCameraId()) {
                setCameraId(pendingOpenId);
            }
            return new Pair(Integer.valueOf(pendingOpenId), Integer.valueOf(pendingOpenModule));
        }
        if (newIntentType != 0) {
            int intentCameraId = CameraIntentManager.getInstance(intent).getCameraFacing();
            if (intentCameraId != -1) {
                setCameraIdTransient(intentCameraId);
            }
        }
        boolean timeOut = newIntentType == 0 ? determineTimeOut() : false;
        boolean intentChanged = (this.mIntentType == newIntentType && this.mStartFromKeyguard == startFromKeyguard) ? false : true;
        if (intentChanged && "android.media.action.STILL_IMAGE_CAMERA".equals(action)) {
            pendingOpenModule = 163;
            pendingOpenId = getCurrentCameraId(163);
        } else if (intentChanged && "android.media.action.VIDEO_CAMERA".equals(action)) {
            pendingOpenModule = 162;
            pendingOpenId = getCurrentCameraId(162);
        } else if (timeOut) {
            pendingOpenModule = getDefaultMode(newIntentType);
            pendingOpenId = getDefaultCameraId(pendingOpenModule);
        } else {
            pendingOpenModule = getCurrentMode(newIntentType);
            pendingOpenId = getCurrentCameraId(pendingOpenModule);
        }
        if (!justFetch) {
            this.mIsTimeOut = Boolean.valueOf(timeOut);
            if (intentChanged) {
                this.mIntentType = newIntentType;
                this.mStartFromKeyguard = startFromKeyguard;
                this.mModuleList.setIntentType(this.mIntentType);
            }
            if (pendingOpenModule != getCurrentMode()) {
                setCurrentMode(pendingOpenModule);
                ModuleManager.setActiveModuleIndex(pendingOpenModule);
            }
            if (pendingOpenId != getCurrentCameraId()) {
                setCameraId(pendingOpenId);
            }
        }
        return new Pair(Integer.valueOf(pendingOpenId), Integer.valueOf(pendingOpenModule));
    }

    public int getDataBackUpKey(int mCurrentMode) {
        int result = ((this.mIntentType + 2) << 8) | mCurrentMode;
        if (this.mStartFromKeyguard) {
            return result | 65536;
        }
        return result;
    }

    public boolean isRetriedIfCameraError() {
        return this.mRetriedIfCameraError;
    }

    public void setRetriedIfCameraError(boolean retriedIfCameraError) {
        this.mRetriedIfCameraError = retriedIfCameraError;
    }

    public void resetAll() {
        this.mIsTimeOut = null;
        editor().clear().putInt("pref_version_key", 4).apply();
    }
}
