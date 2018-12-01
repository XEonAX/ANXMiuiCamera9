package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class Camera2DataContainer {
    private static final String TAG = Camera2DataContainer.class.getSimpleName();
    private static final Camera2DataContainer ourInstance = new Camera2DataContainer();
    private int mAuxBackCameraId = -1;
    private int mBokehCameraId = -1;
    private SparseArray<CameraCapabilities> mCapabilities;
    private CameraCapabilities mCurrentCameraCapabilities;
    private int mFrontCameraId = -1;
    private int mMainBackCameraId = -1;
    private int mMuxCameraId = -1;

    public static Camera2DataContainer getInstance() {
        if (ourInstance.mCapabilities == null) {
            ourInstance.init((CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera"));
        }
        return ourInstance;
    }

    public static Camera2DataContainer getInstance(CameraManager camera2Service) {
        if (ourInstance.mCapabilities == null) {
            ourInstance.init(camera2Service);
        }
        return ourInstance;
    }

    private Camera2DataContainer() {
    }

    private void init(CameraManager camera2Service) {
        Log.d(TAG, "E: init()");
        this.mCapabilities = new SparseArray();
        try {
            for (String cameraId : camera2Service.getCameraIdList()) {
                try {
                    int id = Integer.parseInt(cameraId);
                    CameraCharacteristics characteristics = camera2Service.getCameraCharacteristics(cameraId);
                    Integer facing = (Integer) characteristics.get(CameraCharacteristics.LENS_FACING);
                    if (facing != null) {
                        if (this.mMainBackCameraId == -1 && facing.intValue() == 1) {
                            this.mMainBackCameraId = id;
                        } else if (this.mFrontCameraId == -1 && facing.intValue() == 0) {
                            this.mFrontCameraId = id;
                        } else if (this.mAuxBackCameraId == -1 && facing.intValue() == 1) {
                            this.mAuxBackCameraId = id;
                        } else if (this.mMuxCameraId == -1 && facing.intValue() == 1) {
                            this.mMuxCameraId = id;
                        } else if (this.mBokehCameraId == -1 && facing.intValue() == 1) {
                            this.mBokehCameraId = id;
                        }
                    }
                    this.mCapabilities.put(id, new CameraCapabilities(characteristics));
                } catch (NumberFormatException e) {
                    Log.e(TAG, "non-integer camera id " + cameraId);
                }
            }
            Log.d(TAG, "init: mMainBackCameraId=" + this.mMainBackCameraId + " mFrontCameraId=" + this.mFrontCameraId + " mAuxBackCameraId=" + this.mAuxBackCameraId + " mMuxCameraId=" + this.mMuxCameraId + " mBokehCameraId=" + this.mBokehCameraId);
        } catch (Exception e2) {
            Log.e(TAG, "Failed to init CameraCapabilities: " + e2);
        }
        Log.d(TAG, "X: init()");
    }

    public void deInit() {
        Log.d(TAG, "E: deInit()");
        this.mMainBackCameraId = -1;
        this.mFrontCameraId = -1;
        this.mAuxBackCameraId = -1;
        this.mMuxCameraId = -1;
        this.mBokehCameraId = -1;
        this.mCapabilities = null;
        this.mCurrentCameraCapabilities = null;
        Log.d(TAG, "X: deInit()");
    }

    public int getMainBackCameraId() {
        return this.mMainBackCameraId;
    }

    public int getFrontCameraId() {
        return this.mFrontCameraId;
    }

    public int getMuxCameraId() {
        return this.mMuxCameraId;
    }

    public int getBokehCameraId() {
        return this.mBokehCameraId;
    }

    public boolean hasMuxCamera() {
        return this.mMuxCameraId > 0;
    }

    public CameraCapabilities getCapabilities(int actualCameraId) {
        CameraCapabilities caps = (CameraCapabilities) this.mCapabilities.get(actualCameraId);
        if (caps == null) {
            Log.d(TAG, "Could not find the cached CameraCapabilities of camera: " + actualCameraId);
        }
        return caps;
    }

    public CameraCapabilities getCapabilitiesByBogusCameraId(int bogusCameraID, int currentMode) {
        return getCapabilities(getActualOpenCameraId(bogusCameraID, currentMode));
    }

    public void setCurrentCameraCapabilities(CameraCapabilities cameraCapabilities) {
        this.mCurrentCameraCapabilities = cameraCapabilities;
    }

    public CameraCapabilities getCurrentCameraCapabilities() {
        return this.mCurrentCameraCapabilities;
    }

    public int getActualOpenCameraId(int bogusCameraId, int currentMode) {
        int actualCameraId = bogusCameraId;
        if (bogusCameraId == 0) {
            boolean supportedAuxCamera = CameraSettings.isDualCameraEnable() ? !CameraSettings.isSupportedOpticalZoom() ? CameraSettings.isSupportedPortrait() : true : false;
            if (supportedAuxCamera) {
                switch (currentMode) {
                    case 163:
                    case 165:
                        if (CameraSettings.isDualCameraSatEnable() && Device.isSupportedOpticalZoom()) {
                            actualCameraId = this.mMuxCameraId;
                            break;
                        }
                    case 166:
                    case 167:
                        if (CameraSettings.isSwitchCameraZoomMode()) {
                            String mode = CameraSettings.getCameraZoomMode(currentMode);
                            if (!"wide".equals(mode)) {
                                if ("tele".equals(mode)) {
                                    actualCameraId = this.mAuxBackCameraId;
                                    break;
                                }
                            }
                            actualCameraId = this.mMainBackCameraId;
                            break;
                        }
                        break;
                    case 171:
                        if (this.mBokehCameraId == -1) {
                            actualCameraId = this.mMuxCameraId;
                            break;
                        }
                        actualCameraId = this.mBokehCameraId;
                        break;
                }
            }
            return bogusCameraId;
        }
        Log.d(TAG, "getActualOpenCameraId: bogusCameraId=" + bogusCameraId + "actualCameraId=" + actualCameraId + "currentMode=" + currentMode);
        return actualCameraId;
    }
}
