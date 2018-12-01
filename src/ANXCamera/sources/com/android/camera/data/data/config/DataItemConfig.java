package com.android.camera.data.data.config;

import com.android.camera.Device;
import com.android.camera.data.data.DataItemBase;
import com.android.camera2.CameraCapabilities;

public class DataItemConfig extends DataItemBase {
    private int mCameraId;
    private ComponentConfigBokeh mComponentBokeh = new ComponentConfigBokeh(this);
    private ComponentConfigBeauty mComponentConfigBeauty = new ComponentConfigBeauty(this);
    private ComponentConfigFlash mComponentFlash = new ComponentConfigFlash(this);
    private ComponentConfigHdr mComponentHdr = new ComponentConfigHdr(this);
    private int mIntentType;
    private ComponentManuallyDualLens mManuallyDualLens;
    private ComponentManuallyFocus mManuallyFocus;

    public DataItemConfig(int cameraId, int intentType) {
        this.mCameraId = cameraId;
        this.mIntentType = intentType;
    }

    public static int provideLocalId(int cameraId, int intentType) {
        if (intentType == 0) {
            return cameraId;
        }
        return cameraId + 100;
    }

    public String provideKey() {
        return "camera_settings_simple_mode_local_" + provideLocalId(this.mCameraId, this.mIntentType);
    }

    public boolean isTransient() {
        return false;
    }

    public void reInitComponent(int currentMode, CameraCapabilities p) {
        this.mComponentFlash.reInit(currentMode, this.mCameraId, p);
        this.mComponentHdr.reInit(currentMode, this.mCameraId, p);
        this.mComponentBokeh.reInit(currentMode, this.mCameraId, p);
    }

    public ComponentConfigFlash getComponentFlash() {
        return this.mComponentFlash;
    }

    public ComponentConfigHdr getComponentHdr() {
        return this.mComponentHdr;
    }

    public ComponentConfigBokeh getComponentBokeh() {
        return this.mComponentBokeh;
    }

    public ComponentConfigBeauty getComponentConfigBeauty() {
        return this.mComponentConfigBeauty;
    }

    public ComponentManuallyFocus getManuallyFocus() {
        if (this.mManuallyFocus == null) {
            this.mManuallyFocus = new ComponentManuallyFocus(this);
        }
        return this.mManuallyFocus;
    }

    public ComponentManuallyDualLens getManuallyDualLens() {
        if (this.mManuallyDualLens == null) {
            this.mManuallyDualLens = new ComponentManuallyDualLens(this);
        }
        return this.mManuallyDualLens;
    }

    public boolean supportFlash() {
        return this.mComponentFlash.isEmpty() ^ 1;
    }

    public boolean supportHdr() {
        return this.mComponentHdr.isEmpty() ^ 1;
    }

    public boolean supportBokeh() {
        return this.mComponentBokeh.isEmpty() ^ 1;
    }

    public boolean reConfigFlashIfHdrChanged(int currentMode, String newHdrValue) {
        String currentFlash = getComponentFlash().getPersistValue(currentMode);
        String newFlashValue = null;
        if (newHdrValue.equals("auto")) {
            if ("1".equals(currentFlash) || "2".equals(currentFlash)) {
                newFlashValue = Device.isSupportedAsdFlash() ? "3" : "0";
            } else if ("101".equals(currentFlash)) {
                newFlashValue = "3";
            }
        } else if (!newHdrValue.equals("on") && !newHdrValue.equals("normal") && !newHdrValue.equals("live")) {
            boolean equals = newHdrValue.equals("off");
        } else if (!"0".equals(currentFlash)) {
            newFlashValue = "0";
        }
        if (newFlashValue == null || currentFlash.equals(newFlashValue)) {
            return false;
        }
        getComponentFlash().setComponentValue(currentMode, newFlashValue);
        if (getComponentFlash().isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean reConfigHhrIfFlashChanged(int currentMode, String newFlashValue) {
        String currentHdr = getComponentHdr().getPersistValue(currentMode);
        String newHdrValue = null;
        if ("3".equals(newFlashValue) || "103".equals(newFlashValue)) {
            if ("normal".equals(currentHdr) || "live".equals(currentHdr)) {
                newHdrValue = Device.isSupportedAsdHdr() ? "auto" : "off";
            }
        } else if ("1".equals(newFlashValue) || "101".equals(newFlashValue)) {
            if (!"off".equals(currentHdr)) {
                newHdrValue = "off";
            }
        } else if (!(!"2".equals(newFlashValue) || "live".equals(currentHdr) || ("off".equals(currentHdr) ^ 1) == 0)) {
            newHdrValue = "off";
        }
        if (newHdrValue == null || currentHdr.equals(newHdrValue)) {
            return false;
        }
        getComponentHdr().setComponentValue(currentMode, newHdrValue);
        if (getComponentHdr().isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean reConfigHdrIfBokehChanged(int currentMode, String newBokehValue) {
        if (!supportHdr() || !"on".equals(newBokehValue) || "off".equals(this.mComponentHdr.getComponentValue(currentMode))) {
            return false;
        }
        this.mComponentHdr.setComponentValue(currentMode, "off");
        return true;
    }

    public boolean reConfigBokehIfHdrChanged(int currentMode, String newHdrValue) {
        if (!supportBokeh()) {
            return false;
        }
        if (!newHdrValue.equals("on") && !newHdrValue.equals("normal") && !newHdrValue.equals("live")) {
            return false;
        }
        if ("on".equals(this.mComponentBokeh.getComponentValue(currentMode))) {
            this.mComponentBokeh.setComponentValue(currentMode, "off");
        }
        return true;
    }

    public void resetAll() {
        editor().clear().apply();
        getComponentFlash().clearClosed();
        getComponentHdr().clearClosed();
        getComponentConfigBeauty().clearClosed();
        getComponentBokeh().clearClosed();
    }
}
