package com.android.camera2;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.Face;
import android.hardware.camera2.params.MeteringRectangle;
import android.location.Location;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Range;
import android.view.Surface;
import com.android.camera.CameraSize;
import com.android.camera.effect.BeautyValues;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.module.loader.camera2.FocusTask;

public abstract class Camera2Proxy {
    protected final int mCameraId;
    protected CameraErrorCallback mErrorCallback;
    protected FaceDetectionCallback mFaceCallback;
    protected FocusCallback mFocusCallback;
    protected HDRCheckerCallback mHDRCheckerCallback;
    protected CameraMetaDataCallback mMetadataCallback;
    private PictureCallback mPictureCallBack;
    private final Object mPictureCallBackLock = new Object();
    protected PictureCallback mPortraitDepthImageCallback;
    protected PictureCallback mPortraitRawImageCallback;
    private PreviewCallback mPreviewCallback;
    private final Object mPreviewCallbackLock = new Object();
    protected PictureCallback mRawCallBack;
    protected ScreenLightCallback mScreenLightCallback;
    protected ShutterCallback mShutterCallback;
    private final Object mShutterCallbackLock = new Object();
    protected PictureCallback mVideoSnapshotCallBack;

    public interface CameraErrorCallback {
        void onCameraError(Camera2Proxy camera2Proxy, int i);
    }

    public interface CameraMetaDataCallback {
        void onCameraMetaData(CaptureResult captureResult);
    }

    public interface PictureCallback {
        void onPictureBurstFinished(boolean z);

        void onPictureTaken(byte[] bArr, Camera2Proxy camera2Proxy);

        void onPictureTakenFailed();
    }

    public interface CameraPreviewCallback {
        void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession);

        void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession);

        void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession);
    }

    public interface ShutterCallback {
        void onShutter();
    }

    public interface HDRCheckerCallback {
        void onHDRSceneChanged(boolean z);
    }

    public interface ScreenLightCallback {
        void startScreenLight(int i, int i2);

        void stopScreenLight();
    }

    public interface FaceDetectionCallback {
        void onFaceDetected(Face[] faceArr, FaceAnalyzeInfo faceAnalyzeInfo, Camera2Proxy camera2Proxy);
    }

    public interface FocusCallback {
        void onFocusStateChanged(FocusTask focusTask);
    }

    public interface PreviewCallback {
        void onPreviewFrame(PreviewImageProp previewImageProp, Camera2Proxy camera2Proxy);
    }

    public interface VideoRecordStateCallback {
        void onVideoRecordStopped();
    }

    public abstract void cancelFocus(int i);

    public abstract void captureAbortBurst();

    public abstract void captureBurstPictures(int i, PictureCallback pictureCallback);

    public abstract void captureVideoSnapshot(PictureCallback pictureCallback);

    public abstract void close();

    public abstract CameraCapabilities getCapabilities();

    public abstract int getFlashMode();

    public abstract int getFocusMode();

    public abstract CameraMetaDataCallback getMetaDataCallback();

    public abstract CameraSize getPictureSize();

    public abstract CameraSize getPreviewSize();

    public abstract boolean isBokehEnabled();

    public abstract boolean isNeedFlashOn();

    public abstract boolean isNeedPreviewThumbnail();

    public abstract boolean isSessionReady();

    public abstract void lockExposure(boolean z);

    public abstract void notifyVideoStreamEnd();

    public abstract void pausePreview();

    public abstract void releaseCameraPreviewCallback(@Nullable CameraPreviewCallback cameraPreviewCallback);

    public abstract void releasePictureCallback();

    public abstract void releasePreview();

    public abstract void resetConfigs();

    public abstract void resumePreview();

    public abstract void setAELock(boolean z);

    public abstract void setAERegions(MeteringRectangle[] meteringRectangleArr);

    public abstract void setAFRegions(MeteringRectangle[] meteringRectangleArr);

    public abstract void setASD(boolean z);

    public abstract void setASDPeriod(int i);

    public abstract void setAWBLock(boolean z);

    public abstract void setAWBMode(int i);

    public abstract void setAntiBanding(int i);

    public abstract void setBeautyValues(BeautyValues beautyValues);

    public abstract void setBokeh(boolean z);

    public abstract void setContrast(int i);

    public abstract void setCustomAWB(int i);

    public abstract void setDeviceOrientation(int i);

    public abstract void setDisplayOrientation(int i);

    public abstract void setDualCamWaterMarkEnable(boolean z);

    public abstract void setEnableEIS(boolean z);

    public abstract void setEnableOIS(boolean z);

    public abstract void setEnableZsl(boolean z);

    public abstract void setExposureCompensation(int i);

    public abstract void setExposureMeteringMode(int i);

    public abstract void setExposureTime(long j);

    public abstract void setFaceAgeAnalyze(boolean z);

    public abstract void setFaceDetectionCallback(FaceDetectionCallback faceDetectionCallback);

    public abstract void setFaceScore(boolean z);

    public abstract void setFaceWaterMarkEnable(boolean z);

    public abstract void setFaceWaterMarkFormat(String str);

    public abstract void setFlashMode(int i);

    public abstract void setFocusCallback(FocusCallback focusCallback);

    public abstract void setFocusDistance(float f);

    public abstract void setFocusMode(int i);

    public abstract void setFpsRange(Range<Integer> range);

    public abstract void setFrontMirror(boolean z);

    public abstract void setGpsLocation(Location location);

    public abstract void setHDR(boolean z);

    public abstract void setHDRCheckerCallback(HDRCheckerCallback hDRCheckerCallback);

    public abstract void setHDRCheckerEnable(boolean z);

    public abstract void setHHT(boolean z);

    public abstract void setISO(int i);

    public abstract void setJpegQuality(int i);

    public abstract void setJpegRotation(int i);

    public abstract void setJpegThumbnailSize(CameraSize cameraSize);

    public abstract void setLensDirtyDetect(boolean z);

    public abstract void setMetaDataCallback(CameraMetaDataCallback cameraMetaDataCallback);

    public abstract void setMfnr(boolean z);

    public abstract void setNeedPausePreview(boolean z);

    public abstract void setOpticalZoomToTele(boolean z);

    public abstract void setOptimizedFlash(boolean z);

    public abstract void setParallelProcessingEnable(boolean z, String str);

    public abstract void setPictureSize(CameraSize cameraSize);

    public abstract void setPreviewSize(CameraSize cameraSize);

    public abstract void setSaturation(int i);

    public abstract void setSceneMode(int i);

    public abstract void setScreenLightCallback(ScreenLightCallback screenLightCallback);

    public abstract void setSharpness(int i);

    public abstract void setSuperResolution(boolean z);

    public abstract void setTimeWaterMarkEnable(boolean z);

    public abstract void setTimeWatermarkValue(String str);

    public abstract void setVideoFpsRange(Range<Integer> range);

    public abstract void setVideoSnapshotSize(CameraSize cameraSize);

    public abstract void setZoomRatio(float f);

    public abstract void startFaceDetection();

    public abstract void startFocus(FocusTask focusTask, int i);

    public abstract void startHighSpeedRecordPreview();

    public abstract void startHighSpeedRecordSession(@NonNull Surface surface, @NonNull Surface surface2, Range<Integer> range, CameraPreviewCallback cameraPreviewCallback);

    public abstract void startHighSpeedRecording();

    public abstract void startPreviewCallback(@NonNull PreviewCallback previewCallback);

    public abstract void startPreviewSession(Surface surface, boolean z, boolean z2, int i, CameraPreviewCallback cameraPreviewCallback);

    public abstract void startRecordPreview();

    public abstract void startRecordSession(@NonNull Surface surface, @NonNull Surface surface2, boolean z, int i, CameraPreviewCallback cameraPreviewCallback);

    public abstract void startRecording();

    public abstract void stopFaceDetection();

    public abstract void stopPreviewCallback(boolean z);

    public abstract void stopRecording(VideoRecordStateCallback videoRecordStateCallback);

    public abstract void takePicture(@NonNull ShutterCallback shutterCallback, @NonNull PictureCallback pictureCallback);

    public abstract void takePortraitPicture(@NonNull ShutterCallback shutterCallback, @NonNull PictureCallback pictureCallback, @NonNull PictureCallback pictureCallback2, @NonNull PictureCallback pictureCallback3);

    public Camera2Proxy(int id) {
        this.mCameraId = id;
    }

    public int getId() {
        return this.mCameraId;
    }

    public void setErrorCallback(@Nullable CameraErrorCallback cb) {
        this.mErrorCallback = cb;
    }

    public String toString() {
        return super.toString() + " - cameraId=" + getId();
    }

    protected void notifyOnError(int error) {
        if (this.mErrorCallback != null) {
            this.mErrorCallback.onCameraError(this, error);
        }
    }

    void setPictureCallback(PictureCallback callback) {
        synchronized (this.mPictureCallBackLock) {
            this.mPictureCallBack = callback;
        }
    }

    PictureCallback getPictureCallback() {
        PictureCallback pictureCallback;
        synchronized (this.mPictureCallBackLock) {
            pictureCallback = this.mPictureCallBack;
        }
        return pictureCallback;
    }

    void setPreviewCallback(PreviewCallback mPreviewCallback) {
        synchronized (this.mPreviewCallbackLock) {
            this.mPreviewCallback = mPreviewCallback;
        }
    }

    PreviewCallback getPreviewCallback() {
        PreviewCallback previewCallback;
        synchronized (this.mPreviewCallbackLock) {
            previewCallback = this.mPreviewCallback;
        }
        return previewCallback;
    }

    void setShutterCallback(ShutterCallback mShutterCallback) {
        synchronized (this.mShutterCallbackLock) {
            this.mShutterCallback = mShutterCallback;
        }
    }

    ShutterCallback getShutterCallback() {
        ShutterCallback shutterCallback;
        synchronized (this.mShutterCallbackLock) {
            shutterCallback = this.mShutterCallback;
        }
        return shutterCallback;
    }
}
