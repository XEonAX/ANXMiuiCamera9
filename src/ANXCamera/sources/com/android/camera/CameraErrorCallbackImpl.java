package com.android.camera;

import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraErrorCallback;

public class CameraErrorCallbackImpl implements CameraErrorCallback {
    private ActivityBase mActivity;

    public CameraErrorCallbackImpl(ActivityBase activity) {
        this.mActivity = activity;
    }

    public void onCameraError(Camera2Proxy camera, int error) {
        if (error == 5) {
            Log.e("CameraErrorCallback", "onCameraError: camera service error");
        } else if (error == 4) {
            Log.e("CameraErrorCallback", "onCameraError: camera device error");
        } else if (error == 3) {
            Log.e("CameraErrorCallback", "onCameraError: camera disabled");
        } else if (error == 2) {
            Log.e("CameraErrorCallback", "onCameraError: max camera in use");
        } else if (error == 1) {
            Log.e("CameraErrorCallback", "onCameraError: camera in use");
        } else {
            Log.e("CameraErrorCallback", "onCameraError: other error " + error);
        }
        CameraStatUtil.trackCameraError("" + error);
        if (this.mActivity != null) {
            Module module = this.mActivity.getCurrentModule();
            if (module != null && module.isCreated()) {
                module.notifyError();
            }
            this.mActivity = null;
        }
    }
}
