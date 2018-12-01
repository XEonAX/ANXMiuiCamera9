package com.android.camera.module.loader.camera2;

public class Camera2Result {
    private int mCameraError;
    @Camera2ResultType
    private int mResult;

    public @interface Camera2ResultType {
    }

    private Camera2Result(@Camera2ResultType int result) {
        this.mResult = result;
    }

    public static Camera2Result create(@Camera2ResultType int result) {
        return new Camera2Result(result);
    }

    public Camera2Result setCameraError(int error) {
        this.mCameraError = error;
        return this;
    }

    @Camera2ResultType
    public int getResult() {
        return this.mResult;
    }

    public int getCameraError() {
        return this.mCameraError;
    }
}
