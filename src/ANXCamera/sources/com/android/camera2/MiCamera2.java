package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Rect;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraConstrainedHighSpeedCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.hardware.camera2.params.Face;
import android.hardware.camera2.params.MeteringRectangle;
import android.hardware.camera2.params.OutputConfiguration;
import android.hardware.camera2.utils.SurfaceUtils;
import android.location.Location;
import android.media.Image;
import android.media.Image.Plane;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.MiCaptureRequest;
import com.android.camera.constant.MiCaptureResult;
import com.android.camera.effect.BeautyValues;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.HDRCheckerCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.android.camera2.Camera2Proxy.ScreenLightCallback;
import com.android.camera2.Camera2Proxy.ShutterCallback;
import com.android.camera2.Camera2Proxy.VideoRecordStateCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.sensetime.stmobile.STCommon;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@TargetApi(21)
public class MiCamera2 extends Camera2Proxy {
    private static final String TAG = MiCamera2.class.getSimpleName();
    public static final MeteringRectangle[] ZERO_WEIGHT_3A_REGION = new MeteringRectangle[]{new MeteringRectangle(0, 0, 0, 0, 0)};
    private CameraDevice mCameraDevice;
    private Handler mCameraHandler;
    private Handler mCameraMainThreadHandler;
    private CameraCapabilities mCapabilities;
    private PictureCaptureCallback mCaptureCallback;
    private CameraCaptureSession mCaptureSession;
    private CaptureSessionStateCallback mCaptureSessionStateCallback;
    private CameraConfigs mConfigs;
    private ImageReader mDepthReader;
    private int mDisplayOrientation;
    private FaceAnalyzeInfo mFaceInfo;
    private Handler mHelperHandler;
    private Range<Integer> mHighSpeedFpsRange;
    private boolean mIsPreviewCallbackEnabled;
    private boolean mIsPreviewCallbackStarted;
    private int mLockRequestHashCode;
    private final Object mObjLock = new Object();
    private int mOpenState;
    private volatile boolean mPendingNotifyVideoEnd;
    private ImageReader mPhotoImageReader;
    private ImageReader mPortraitRawImageReader;
    private int mPrecaptureRequestHashCode;
    private ImageReader mPreviewImageReader;
    private Builder mPreviewRequestBuilder;
    private Surface mPreviewSurface;
    private ImageReader mRawImageReader;
    private Surface mRecordSurface;
    private int mScreenLightColorTemperature;
    private int mSessionId;
    private VideoRecordStateCallback mVideoRecordStateCallback;
    private int mVideoSessionId;
    private ImageReader mVideoSnapshotImageReader;

    private class CaptureSessionStateCallback extends StateCallback {
        private WeakReference<CameraPreviewCallback> mClientCb;
        private int mId;

        public CaptureSessionStateCallback(int id, CameraPreviewCallback cb) {
            this.mId = id;
            this.mClientCb = new WeakReference(cb);
        }

        public void setClientCb(CameraPreviewCallback cb) {
            this.mClientCb = new WeakReference(cb);
        }

        /* JADX WARNING: Removed duplicated region for block: B:28:? A:{SYNTHETIC, RETURN} */
        /* JADX WARNING: Removed duplicated region for block: B:19:0x007b  */
        public void onConfigured(@android.support.annotation.NonNull android.hardware.camera2.CameraCaptureSession r6) {
            /*
            r5 = this;
            r2 = r5.mId;
            r3 = com.android.camera2.MiCamera2.this;
            r3 = r3.mSessionId;
            if (r2 != r3) goto L_0x0088;
        L_0x000a:
            r2 = com.android.camera2.MiCamera2.TAG;
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "onConfigured: id=";
            r3 = r3.append(r4);
            r4 = r5.mId;
            r3 = r3.append(r4);
            r4 = " session=";
            r3 = r3.append(r4);
            r3 = r3.append(r6);
            r3 = r3.toString();
            com.android.camera.log.Log.d(r2, r3);
            r2 = com.android.camera2.MiCamera2.this;
            r2.mCaptureSession = r6;
            r2 = com.android.camera2.MiCamera2.this;
            r2 = r2.mPendingNotifyVideoEnd;
            if (r2 == 0) goto L_0x0054;
        L_0x003f:
            r2 = r5.mId;
            r3 = com.android.camera2.MiCamera2.this;
            r3 = r3.mVideoSessionId;
            if (r2 != r3) goto L_0x0054;
        L_0x0049:
            r2 = com.android.camera2.MiCamera2.this;
            r2.notifyVideoStreamEnd();
            r2 = com.android.camera2.MiCamera2.this;
            r3 = 0;
            r2.mPendingNotifyVideoEnd = r3;
        L_0x0054:
            r2 = com.android.camera.module.ModuleManager.isVideoModule();	 Catch:{ Exception -> 0x0095 }
            if (r2 != 0) goto L_0x006c;
        L_0x005a:
            r2 = com.android.camera.module.ModuleManager.isFastMotionModule();	 Catch:{ Exception -> 0x0095 }
            if (r2 != 0) goto L_0x006c;
        L_0x0060:
            r2 = com.android.camera.module.ModuleManager.isSlowMotionModule();	 Catch:{ Exception -> 0x0095 }
            if (r2 != 0) goto L_0x006c;
        L_0x0066:
            r2 = com.android.camera.module.ModuleManager.isFunModule();	 Catch:{ Exception -> 0x0095 }
            if (r2 == 0) goto L_0x0089;
        L_0x006c:
            r2 = com.android.camera2.MiCamera2.this;	 Catch:{ Exception -> 0x0095 }
            r3 = com.android.camera2.MiCamera2.this;	 Catch:{ Exception -> 0x0095 }
            r3 = r3.mPreviewRequestBuilder;	 Catch:{ Exception -> 0x0095 }
            r2.applySettingsForVideo(r3);	 Catch:{ Exception -> 0x0095 }
        L_0x0077:
            r2 = r5.mClientCb;
            if (r2 == 0) goto L_0x0088;
        L_0x007b:
            r2 = r5.mClientCb;
            r0 = r2.get();
            r0 = (com.android.camera2.Camera2Proxy.CameraPreviewCallback) r0;
            if (r0 == 0) goto L_0x0088;
        L_0x0085:
            r0.onPreviewSessionSuccess(r6);
        L_0x0088:
            return;
        L_0x0089:
            r2 = com.android.camera2.MiCamera2.this;	 Catch:{ Exception -> 0x0095 }
            r3 = com.android.camera2.MiCamera2.this;	 Catch:{ Exception -> 0x0095 }
            r3 = r3.mPreviewRequestBuilder;	 Catch:{ Exception -> 0x0095 }
            r2.applySettingsForPreview(r3);	 Catch:{ Exception -> 0x0095 }
            goto L_0x0077;
        L_0x0095:
            r1 = move-exception;
            r1.printStackTrace();
            goto L_0x0077;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.MiCamera2.CaptureSessionStateCallback.onConfigured(android.hardware.camera2.CameraCaptureSession):void");
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession session) {
            Log.e(MiCamera2.TAG, "onConfigureFailed: id=" + this.mId + " sessionId=" + MiCamera2.this.mSessionId);
            if (this.mClientCb != null) {
                CameraPreviewCallback callback = (CameraPreviewCallback) this.mClientCb.get();
                if (callback != null) {
                    callback.onPreviewSessionFailed(session);
                }
            }
        }

        public void onClosed(@NonNull CameraCaptureSession session) {
            Log.e(MiCamera2.TAG, "onClosed: id=" + this.mId + " sessionId=" + MiCamera2.this.mSessionId);
            if (this.mClientCb != null) {
                CameraPreviewCallback callback = (CameraPreviewCallback) this.mClientCb.get();
                if (callback != null) {
                    callback.onPreviewSessionClosed(session);
                }
            }
        }
    }

    private class HighSpeedCaptureSessionStateCallback extends StateCallback {
        private CameraPreviewCallback mClientCb;
        private int mId;

        public HighSpeedCaptureSessionStateCallback(int id, CameraPreviewCallback cb) {
            this.mId = id;
            this.mClientCb = cb;
        }

        public void onConfigured(@NonNull CameraCaptureSession session) {
            if (this.mId == MiCamera2.this.mSessionId) {
                Log.d(MiCamera2.TAG, "onHighSpeedConfigured: id=" + this.mId + " highSpeedSession=" + session);
                MiCamera2.this.mCaptureSession = session;
                MiCamera2.this.applySettingsForVideo(MiCamera2.this.mPreviewRequestBuilder);
                MiCameraCompat.applyIsHfrPreview(MiCamera2.this.mPreviewRequestBuilder, true);
                if (this.mClientCb != null) {
                    this.mClientCb.onPreviewSessionSuccess(session);
                }
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession session) {
            Log.e(MiCamera2.TAG, "onHighSpeedConfigureFailed: id=" + this.mId + " sessionId=" + MiCamera2.this.mSessionId);
            if (this.mId == MiCamera2.this.mSessionId) {
                MiCamera2.this.close();
            }
            if (this.mClientCb != null) {
                this.mClientCb.onPreviewSessionFailed(session);
            }
        }

        public void onClosed(@NonNull CameraCaptureSession session) {
            Log.d(MiCamera2.TAG, "onHighSpeedClosed: " + session);
            if (MiCamera2.this.mCaptureSession != null && MiCamera2.this.mCaptureSession.equals(session)) {
                MiCamera2.this.mCaptureSession = null;
            }
            if (this.mClientCb != null) {
                this.mClientCb.onPreviewSessionClosed(session);
            }
        }
    }

    private class PictureCaptureCallback extends CaptureCallback {
        private FocusTask mAutoFocusTask;
        private Integer mCurrentAEState;
        private int mCurrentColorTemperature;
        private volatile boolean mLastAsdEnabled = false;
        private volatile int mLastAsdMode = -1;
        private volatile int mLastFaceNum = 0;
        private volatile int mLastHdrMode = -1;
        private int mLastResultAFState = -1;
        private FocusTask mManuallyFocusTask;
        private int mState = 0;
        private FocusTask mTorchFocusTask;

        public void setState(int state) {
            Log.d(MiCamera2.TAG, "setState: " + state);
            this.mState = state;
        }

        public int getState() {
            return this.mState;
        }

        public Integer getCurrentAEState() {
            return this.mCurrentAEState;
        }

        public int getCurrentColorTemperature() {
            return this.mCurrentColorTemperature;
        }

        public void setFocusTask(FocusTask focusTask) {
            this.mManuallyFocusTask = focusTask;
        }

        public void onCaptureProgressed(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull CaptureResult partialResult) {
            process(partialResult);
        }

        public void onCaptureCompleted(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull TotalCaptureResult result) {
            if (result.getFrameNumber() == 0 && this.mState == 0) {
                Log.d(MiCamera2.TAG, "onCaptureCompleted Sequence: " + result.getSequenceId() + " first frame received");
            }
            process(result);
        }

        private void process(@NonNull CaptureResult result) {
            FaceDetectionCallback localFaceCallback;
            HDRCheckerCallback localHDRCallback;
            synchronized (MiCamera2.this.mObjLock) {
                localFaceCallback = MiCamera2.this.mFaceCallback;
                localHDRCallback = MiCamera2.this.mHDRCheckerCallback;
                if (MiCamera2.this.mVideoRecordStateCallback != null) {
                    Integer state = (Integer) result.get(MiCaptureResult.VIDEO_RECORD_STATE);
                    if (state != null && 2 == state.intValue()) {
                        MiCamera2.this.mVideoRecordStateCallback.onVideoRecordStopped();
                        MiCamera2.this.mVideoRecordStateCallback = null;
                    }
                }
            }
            if (localFaceCallback != null) {
                Face[] faces = (Face[]) result.get(CaptureResult.STATISTICS_FACES);
                MiCamera2.this.updateFaceInfo(result);
                localFaceCallback.onFaceDetected(faces, MiCamera2.this.mFaceInfo, MiCamera2.this);
            }
            processAfResult(result);
            AWBFrameControl awb = CaptureResultParser.getAWBFrameControl(result);
            if (awb != null) {
                this.mCurrentColorTemperature = awb.getColorTemperature();
            }
            this.mCurrentAEState = (Integer) result.get(CaptureResult.CONTROL_AE_STATE);
            Integer aeState;
            switch (this.mState) {
                case 0:
                    if (MiCamera2.this.mMetadataCallback != null) {
                        MiCamera2.this.mMetadataCallback.onCameraMetaData(result);
                    }
                    if (localHDRCallback != null && MiCamera2.this.mConfigs.isHDRCheckerEnabled()) {
                        localHDRCallback.onHDRSceneChanged(CaptureResultParser.getHDRDetectedScene(result) == 1);
                        return;
                    }
                    return;
                case 2:
                    Integer afState = (Integer) result.get(CaptureResult.CONTROL_AF_STATE);
                    if (4 == afState.intValue() || 5 == afState.intValue() || 2 == afState.intValue() || 6 == afState.intValue() || (MiCamera2.this.mLockRequestHashCode == result.getRequest().hashCode() && afState.intValue() == 0)) {
                        if (MiCamera2.this.mLockRequestHashCode == result.getRequest().hashCode() || MiCamera2.this.mLockRequestHashCode == 0) {
                            if (MiCamera2.this.mHelperHandler != null) {
                                MiCamera2.this.mHelperHandler.removeMessages(1);
                            }
                            MiCamera2.this.runPrecaptureSequence();
                            return;
                        }
                        return;
                    } else if (MiCamera2.this.mLockRequestHashCode == result.getRequest().hashCode()) {
                        MiCamera2.this.mLockRequestHashCode = 0;
                        return;
                    } else {
                        return;
                    }
                case 3:
                    aeState = (Integer) result.get(CaptureResult.CONTROL_AE_STATE);
                    if (aeState == null || aeState.intValue() == 3) {
                        MiCamera2.this.mCaptureCallback.showAutoFocusFinish(true);
                        if (MiCamera2.this.getExposureTime() > 0) {
                            MiCamera2.this.waitFlashClosed();
                            return;
                        }
                        setState(6);
                        MiCamera2.this.captureStillPicture();
                        return;
                    }
                    return;
                case 4:
                    aeState = (Integer) result.get(CaptureResult.CONTROL_AE_STATE);
                    if (aeState == null || aeState.intValue() == 5 || aeState.intValue() == 4 || aeState.intValue() == 2) {
                        if (MiCamera2.this.mPrecaptureRequestHashCode == result.getRequest().hashCode() || MiCamera2.this.mPrecaptureRequestHashCode == 0) {
                            MiCamera2.this.lockExposure(true);
                            return;
                        }
                        return;
                    } else if (MiCamera2.this.mPrecaptureRequestHashCode == result.getRequest().hashCode()) {
                        MiCamera2.this.mPrecaptureRequestHashCode = 0;
                        return;
                    } else {
                        return;
                    }
                case 7:
                    Integer flashState = (Integer) result.get(CaptureResult.FLASH_STATE);
                    if (flashState == null || flashState.intValue() == 2) {
                        setState(6);
                        MiCamera2.this.captureStillPicture();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        private void processAfResult(CaptureResult result) {
            Integer afState = (Integer) result.get(CaptureResult.CONTROL_AF_STATE);
            if (afState != null) {
                FocusCallback focusCallback;
                synchronized (MiCamera2.this.mObjLock) {
                    focusCallback = MiCamera2.this.mFocusCallback;
                }
                if (focusCallback != null && afState.intValue() != this.mLastResultAFState) {
                    Log.d(MiCamera2.TAG, String.format(Locale.ENGLISH, "afState changed from %d to %d", new Object[]{Integer.valueOf(this.mLastResultAFState), Integer.valueOf(afState.intValue())}));
                    this.mLastResultAFState = afState.intValue();
                    Boolean focusResult;
                    if (this.mManuallyFocusTask == null) {
                        if (isAutoFocusing(afState).booleanValue()) {
                            this.mAutoFocusTask = FocusTask.create(2);
                            focusCallback.onFocusStateChanged(this.mAutoFocusTask);
                        } else {
                            focusResult = isFocusLocked(afState);
                            if (!(focusResult == null || this.mAutoFocusTask == null)) {
                                this.mAutoFocusTask.setResult(focusResult.booleanValue());
                                focusCallback.onFocusStateChanged(this.mAutoFocusTask);
                                this.mAutoFocusTask = null;
                            }
                        }
                    } else if (this.mAutoFocusTask != null) {
                        this.mAutoFocusTask = null;
                    } else {
                        focusResult = isFocusLocked(afState);
                        if (focusResult != null) {
                            this.mManuallyFocusTask.setResult(focusResult.booleanValue());
                            focusCallback.onFocusStateChanged(this.mManuallyFocusTask);
                            this.mManuallyFocusTask = null;
                            setState(0);
                        }
                    }
                }
            }
        }

        public void showAutoFocusStart() {
            FocusCallback focusCallback;
            synchronized (MiCamera2.this.mObjLock) {
                focusCallback = MiCamera2.this.mFocusCallback;
            }
            if (focusCallback != null) {
                this.mTorchFocusTask = FocusTask.create(3);
                focusCallback.onFocusStateChanged(this.mTorchFocusTask);
            }
        }

        public void showAutoFocusFinish(boolean success) {
            if (this.mTorchFocusTask != null) {
                FocusCallback focusCallback;
                synchronized (MiCamera2.this.mObjLock) {
                    focusCallback = MiCamera2.this.mFocusCallback;
                }
                if (focusCallback != null) {
                    this.mTorchFocusTask.setResult(success);
                    focusCallback.onFocusStateChanged(this.mTorchFocusTask);
                    this.mTorchFocusTask = null;
                }
            }
        }

        private Boolean isFocusLocked(Integer afState) {
            switch (afState.intValue()) {
                case 2:
                case 4:
                    return Boolean.TRUE;
                case 5:
                case 6:
                    return Boolean.FALSE;
                default:
                    return null;
            }
        }

        private Boolean isAutoFocusing(Integer afState) {
            switch (afState.intValue()) {
                case 1:
                case 3:
                    return Boolean.TRUE;
                default:
                    return Boolean.FALSE;
            }
        }
    }

    public MiCamera2(CameraDevice cameraDevice, int id, CameraCapabilities cc, @NonNull Handler handler, @NonNull Handler mainThreadHandler) {
        super(id);
        this.mCameraDevice = cameraDevice;
        this.mCapabilities = cc;
        this.mConfigs = new CameraConfigs();
        this.mCameraHandler = handler;
        this.mCameraMainThreadHandler = mainThreadHandler;
        initHelperHandler(this.mCameraHandler.getLooper());
        this.mCaptureCallback = new PictureCaptureCallback();
        this.mOpenState = 2;
    }

    private void initHelperHandler(Looper looper) {
        this.mHelperHandler = new Handler(looper) {
            public void handleMessage(Message msg) {
                switch (msg.what) {
                    case 1:
                        Log.e(MiCamera2.TAG, "waiting af lock timeOut");
                        MiCamera2.this.mCaptureCallback.showAutoFocusFinish(true);
                        if (MiCamera2.this.getExposureTime() > 0) {
                            MiCamera2.this.waitFlashClosed();
                            return;
                        }
                        MiCamera2.this.mCaptureCallback.setState(6);
                        MiCamera2.this.captureStillPicture();
                        return;
                    default:
                        return;
                }
            }
        };
    }

    public CameraCapabilities getCapabilities() {
        return this.mCapabilities;
    }

    private void preparePhotoImageReader(@NonNull CameraSize size) {
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        this.mPhotoImageReader = ImageReader.newInstance(size.getWidth(), size.getHeight(), STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT, 2);
        this.mPhotoImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader reader) {
                Image image = reader.acquireNextImage();
                if (image != null) {
                    PictureCallback callback = MiCamera2.this.getPictureCallback();
                    if (callback != null) {
                        byte[] data = MiCamera2.this.getFirstPlane(image);
                        if (data != null) {
                            callback.onPictureTaken(data, MiCamera2.this);
                        }
                    }
                    image.close();
                }
            }
        }, this.mCameraHandler);
    }

    private void preparePreviewImageReader(@NonNull CameraSize size) {
        if (this.mPreviewImageReader != null) {
            this.mPreviewImageReader.close();
        }
        this.mPreviewImageReader = ImageReader.newInstance(size.getWidth(), size.getHeight(), 35, 1);
        this.mPreviewImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader reader) {
                Image image = reader.acquireNextImage();
                if (image != null) {
                    PreviewCallback callback = MiCamera2.this.getPreviewCallback();
                    if (callback != null) {
                        callback.onPreviewFrame(new PreviewImageProp(image), MiCamera2.this);
                    }
                    image.close();
                }
            }
        }, this.mCameraMainThreadHandler);
    }

    private void prepareRawImageReader(@NonNull CameraSize size) {
        if (this.mRawImageReader != null) {
            this.mRawImageReader.close();
        }
        OnImageAvailableListener listener = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader reader) {
                Image image = reader.acquireNextImage();
                if (MiCamera2.this.mRawCallBack != null) {
                    byte[] data = MiCamera2.this.getFirstPlane(image);
                    if (data != null) {
                        MiCamera2.this.mRawCallBack.onPictureTaken(data, MiCamera2.this);
                    }
                }
                image.close();
            }
        };
        this.mRawImageReader = ImageReader.newInstance(size.getWidth(), size.getHeight(), 37, 2);
        this.mRawImageReader.setOnImageAvailableListener(listener, this.mCameraHandler);
    }

    private void prepareVideoSnapshotImageReader(CameraSize size) {
        if (this.mVideoSnapshotImageReader != null) {
            this.mVideoSnapshotImageReader.close();
        }
        OnImageAvailableListener listener = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader reader) {
                Image image = reader.acquireNextImage();
                if (image != null) {
                    if (MiCamera2.this.mVideoSnapshotCallBack != null) {
                        byte[] data = MiCamera2.this.getFirstPlane(image);
                        if (data != null) {
                            MiCamera2.this.mVideoSnapshotCallBack.onPictureTaken(data, MiCamera2.this);
                        }
                    }
                    image.close();
                }
            }
        };
        this.mVideoSnapshotImageReader = ImageReader.newInstance(size.getWidth(), size.getHeight(), STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT, 2);
        this.mVideoSnapshotImageReader.setOnImageAvailableListener(listener, this.mCameraHandler);
    }

    private void prepareDepthImageReader(CameraSize size) {
        if (this.mDepthReader != null) {
            this.mDepthReader.close();
        }
        OnImageAvailableListener listener = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader reader) {
                Image image = reader.acquireNextImage();
                if (image != null) {
                    if (MiCamera2.this.mPortraitDepthImageCallback != null) {
                        byte[] data = MiCamera2.this.getFirstPlane(image);
                        boolean isValidDepthMapData = ArcsoftDepthMap.isDepthMapData(data);
                        if (data == null || !isValidDepthMapData) {
                            Log.e(MiCamera2.TAG, "onImageAvailable: return a invalid depth map! length is: " + data.length);
                        } else {
                            MiCamera2.this.mPortraitDepthImageCallback.onPictureTaken(data, MiCamera2.this);
                        }
                    }
                    image.close();
                }
            }
        };
        this.mDepthReader = ImageReader.newInstance(size.getWidth() / 2, size.getHeight() / 2, 540422489, 2);
        this.mDepthReader.setOnImageAvailableListener(listener, this.mCameraHandler);
    }

    private void preparePortraitRawImageReader(CameraSize size) {
        if (this.mPortraitRawImageReader != null) {
            this.mPortraitRawImageReader.close();
        }
        OnImageAvailableListener listener = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader reader) {
                Image image = reader.acquireNextImage();
                if (image != null) {
                    if (MiCamera2.this.mPortraitRawImageCallback != null) {
                        byte[] data = MiCamera2.this.getFirstPlane(image);
                        if (data != null) {
                            MiCamera2.this.mPortraitRawImageCallback.onPictureTaken(data, MiCamera2.this);
                        }
                    }
                    image.close();
                }
            }
        };
        this.mPortraitRawImageReader = ImageReader.newInstance(size.getWidth(), size.getHeight(), STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT, 2);
        this.mPortraitRawImageReader.setOnImageAvailableListener(listener, this.mCameraHandler);
    }

    public void close() {
        Log.d(TAG, "close: cameraId=" + getId());
        if (this.mCameraDevice != null) {
            if (Device.IS_D5X) {
                try {
                    this.mCameraDevice.flush();
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                }
            }
            this.mCameraDevice.close();
        }
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        if (this.mPreviewImageReader != null) {
            this.mPreviewImageReader.close();
        }
        if (this.mRawImageReader != null) {
            this.mRawImageReader.close();
        }
        if (this.mVideoSnapshotImageReader != null) {
            this.mVideoSnapshotImageReader.close();
        }
        reset();
    }

    private void reset() {
        Log.v(TAG, "reset");
        this.mCameraDevice = null;
        this.mOpenState = 0;
        this.mPreviewSurface = null;
        this.mRecordSurface = null;
        this.mCaptureSession = null;
        this.mSessionId = 0;
        this.mPhotoImageReader = null;
        this.mRawImageReader = null;
        this.mPreviewImageReader = null;
        this.mVideoSnapshotImageReader = null;
        this.mDepthReader = null;
        this.mPortraitRawImageReader = null;
        setShutterCallback(null);
        releaseCameraPreviewCallback(null);
    }

    public void startPreviewSession(@Nullable Surface previewSurface, boolean enablePreviewCallback, boolean enableRawCallback, int operatingMode, CameraPreviewCallback cb) {
        if (checkCameraDevice("startPreviewSession")) {
            Log.d(TAG, "startPreviewSession: surface=" + previewSurface);
            this.mPreviewSurface = previewSurface;
            this.mIsPreviewCallbackEnabled = enablePreviewCallback;
            this.mSessionId = genSessionId();
            try {
                preparePhotoImageReader(this.mConfigs.getPhotoSize());
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(1);
                this.mPreviewRequestBuilder.addTarget(previewSurface);
                this.mCaptureSession = null;
                ArrayList<Surface> surfaces = new ArrayList();
                surfaces.add(this.mPreviewSurface);
                surfaces.add(this.mPhotoImageReader.getSurface());
                if (enablePreviewCallback) {
                    preparePreviewImageReader(this.mConfigs.getPreviewSize());
                    surfaces.add(this.mPreviewImageReader.getSurface());
                }
                if (enableRawCallback) {
                    prepareRawImageReader(this.mConfigs.getPhotoSize());
                    surfaces.add(this.mRawImageReader.getSurface());
                }
                if (CameraSettings.isPortraitModeBackOn() && Device.isSupportDynamicLightSpot()) {
                    prepareDepthImageReader(this.mConfigs.getPhotoSize());
                    surfaces.add(this.mDepthReader.getSurface());
                    preparePortraitRawImageReader(this.mConfigs.getPhotoSize());
                    surfaces.add(this.mPortraitRawImageReader.getSurface());
                }
                this.mCaptureSessionStateCallback = new CaptureSessionStateCallback(this.mSessionId, cb);
                List<OutputConfiguration> configurations = new ArrayList(surfaces.size());
                for (Surface surface : surfaces) {
                    configurations.add(new OutputConfiguration(surface));
                }
                this.mCameraDevice.createCustomCaptureSession(null, configurations, operatingMode, this.mCaptureSessionStateCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start preview session", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start preview session, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    public void startRecordSession(@NonNull Surface previewSurface, @NonNull Surface recordSurface, boolean enableVideoSnapshot, int operatingMode, CameraPreviewCallback cb) {
        if (checkCameraDevice("startRecordSession")) {
            Log.d(TAG, "startRecordSession: previewSurface=" + previewSurface + " recordSurface=" + recordSurface);
            this.mPreviewSurface = previewSurface;
            this.mRecordSurface = recordSurface;
            this.mSessionId = genSessionId();
            this.mVideoSessionId = this.mSessionId;
            try {
                List<Surface> surfaces;
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                if (this.mConfigs.isEISEnabled()) {
                    this.mPreviewRequestBuilder.set(MiCaptureRequest.VIDEO_RECORD_CONTROL, Integer.valueOf(0));
                }
                this.mCaptureSession = null;
                if (enableVideoSnapshot) {
                    prepareVideoSnapshotImageReader(this.mConfigs.getVideoSnapshotSize());
                    surfaces = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface, this.mVideoSnapshotImageReader.getSurface()});
                } else {
                    surfaces = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface});
                }
                List<OutputConfiguration> configurations = new ArrayList(surfaces.size());
                for (Surface surface : surfaces) {
                    configurations.add(new OutputConfiguration(surface));
                }
                this.mCameraDevice.createCustomCaptureSession(null, configurations, operatingMode, new CaptureSessionStateCallback(this.mSessionId, cb), this.mCameraHandler);
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start recording session", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start recording session, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    public void startHighSpeedRecordSession(@NonNull Surface previewSurface, @NonNull Surface recordSurface, Range<Integer> fpsRange, CameraPreviewCallback cb) {
        if (checkCameraDevice("startHighSpeedRecordSession")) {
            Log.d(TAG, "startHighSpeedRecordSession: previewSurface=" + previewSurface + " recordSurface=" + recordSurface);
            this.mPreviewSurface = previewSurface;
            this.mRecordSurface = recordSurface;
            this.mHighSpeedFpsRange = fpsRange;
            this.mSessionId = genSessionId();
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                this.mPreviewRequestBuilder.addTarget(this.mRecordSurface);
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mHighSpeedFpsRange);
                this.mCaptureSession = null;
                List<Surface> surfaces = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface});
                if (((Integer) this.mHighSpeedFpsRange.getUpper()).intValue() == 120) {
                    List<OutputConfiguration> configurations = new ArrayList();
                    for (Surface surface : surfaces) {
                        configurations.add(new OutputConfiguration(surface));
                    }
                    this.mCameraDevice.createCustomCaptureSession(null, configurations, 32888, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cb), this.mCameraHandler);
                } else {
                    this.mCameraDevice.createConstrainedHighSpeedCaptureSession(surfaces, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cb), this.mCameraHandler);
                }
            } catch (Exception e) {
                Log.e(TAG, "Failed to start high speed record session", e);
                close();
            }
        }
    }

    public void notifyVideoStreamEnd() {
        if (this.mCaptureSession == null) {
            Log.w(TAG, "notifyVideoStreamEnd: session is not ready");
            this.mPendingNotifyVideoEnd = true;
            return;
        }
        try {
            this.mCaptureSession.stopRepeating();
            Builder builder = this.mCameraDevice.createCaptureRequest(3);
            builder.addTarget(this.mPreviewSurface);
            applySettingsForVideo(builder);
            MiCameraCompat.applyVideoStreamState(builder, false);
            Log.v(TAG, "notifyVideoStreamEnd: requestId=" + capture(builder.build(), this.mCaptureCallback, this.mCameraHandler));
        } catch (CameraAccessException e) {
            Log.e(TAG, e.getMessage(), e);
        }
    }

    public void startRecording() {
        if (checkCaptureSession("startRecording")) {
            Log.d(TAG, "startRecording");
            try {
                if (this.mConfigs.isEISEnabled()) {
                    setVideoRecordControl(1);
                }
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                this.mPreviewRequestBuilder.addTarget(this.mRecordSurface);
                applySettingsForVideo(this.mPreviewRequestBuilder);
                resumePreview();
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start recording", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start recording, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    public void stopRecording(VideoRecordStateCallback cb) {
        if (checkCaptureSession("stopRecording")) {
            Log.d(TAG, "stopRecording");
            if (this.mConfigs.isEISEnabled()) {
                synchronized (this.mObjLock) {
                    this.mVideoRecordStateCallback = cb;
                }
                try {
                    setVideoRecordControl(2);
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                    Log.e(TAG, "Failed to stop recording");
                } catch (IllegalStateException e2) {
                    Log.e(TAG, "Failed to stop recording, IllegalState", e2);
                    notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
                }
            }
        }
    }

    private void setVideoRecordControl(int control) throws CameraAccessException {
        Log.d(TAG, "setVideoRecordControl: " + control);
        Builder builder = this.mCameraDevice.createCaptureRequest(3);
        builder.addTarget(this.mPreviewSurface);
        builder.addTarget(this.mRecordSurface);
        applySettingsForVideo(builder);
        builder.set(MiCaptureRequest.VIDEO_RECORD_CONTROL, Integer.valueOf(control));
        capture(builder.build(), this.mCaptureCallback, this.mCameraHandler);
    }

    public void startHighSpeedRecording() {
        if (checkCaptureSession("startHighSpeedRecording")) {
            Log.d(TAG, "startHighSpeedRecording");
            MiCameraCompat.applyIsHfrPreview(this.mPreviewRequestBuilder, false);
            resumePreview();
        }
    }

    public void startRecordPreview() {
        if (checkCameraDevice("startRecordPreview")) {
            Log.d(TAG, "startRecordPreview");
            synchronized (this.mObjLock) {
                this.mVideoRecordStateCallback = null;
            }
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                if (this.mConfigs.isEISEnabled()) {
                    this.mPreviewRequestBuilder.set(MiCaptureRequest.VIDEO_RECORD_CONTROL, Integer.valueOf(0));
                }
                applySettingsForVideo(this.mPreviewRequestBuilder);
                resumePreview();
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start record preview", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start record preview, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    public void startHighSpeedRecordPreview() {
        if (checkCameraDevice("startHighSpeedRecordPreview")) {
            Log.d(TAG, "startHighSpeedRecordPreview");
            applySettingsForVideo(this.mPreviewRequestBuilder);
            MiCameraCompat.applyIsHfrPreview(this.mPreviewRequestBuilder, true);
            resumePreview();
        }
    }

    public void resumePreview() {
        if (checkCaptureSession("resumePreview")) {
            boolean isHighSpeed = this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession;
            Log.v(TAG, "resumePreview: cameraId=" + getId() + " highSpeed=" + isHighSpeed);
            if (isHighSpeed) {
                try {
                    this.mCaptureSession.setRepeatingBurst(createHighSpeedRequestList(this.mPreviewRequestBuilder.build()), this.mCaptureCallback, this.mCameraHandler);
                } catch (CameraAccessException e) {
                    Log.e(TAG, "Failed to resume preview", e);
                    notifyOnError(e.getReason());
                } catch (IllegalStateException e2) {
                    Log.e(TAG, "Failed to resume preview, IllegalState", e2);
                    notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
                }
            } else {
                Log.d(TAG, "repeating sequenceId: " + this.mCaptureSession.setRepeatingRequest(this.mPreviewRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler));
            }
        }
    }

    public void pausePreview() {
        if (checkCaptureSession("pausePreview")) {
            Log.v(TAG, "pausePreview: cameraId=" + getId());
            try {
                this.mCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                e.printStackTrace();
                Log.e(TAG, "Failed to pause preview");
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to pause preview, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    public void releasePreview() {
        if (this.mCaptureSession != null) {
            if (this.mHelperHandler != null) {
                this.mHelperHandler.removeCallbacksAndMessages(null);
                this.mHelperHandler = null;
            }
            Log.d(TAG, "releasePreview: cameraId=" + getId());
            try {
                this.mCaptureSession.stopRepeating();
                this.mCaptureSession.close();
                this.mCaptureSession = null;
            } catch (CameraAccessException e) {
                e.printStackTrace();
                Log.e(TAG, "Failed to release preview");
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to release preview, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    public void resetConfigs() {
        Log.v(TAG, "resetConfigs");
        if (this.mConfigs != null) {
            this.mConfigs = new CameraConfigs();
        }
        this.mSessionId = 0;
        setShutterCallback(null);
        releaseCameraPreviewCallback(null);
    }

    public void startPreviewCallback(@NonNull PreviewCallback cb) {
        if (checkCaptureSession("startPreviewCallback")) {
            Log.v(TAG, "startPreviewCallback");
            if (this.mIsPreviewCallbackEnabled) {
                setPreviewCallback(cb);
                if (!this.mIsPreviewCallbackStarted) {
                    this.mIsPreviewCallbackStarted = true;
                    this.mPreviewRequestBuilder.addTarget(this.mPreviewImageReader.getSurface());
                    resumePreview();
                }
            }
        }
    }

    public void releaseCameraPreviewCallback(@Nullable CameraPreviewCallback cb) {
        if (this.mCaptureSessionStateCallback != null) {
            this.mCaptureSessionStateCallback.setClientCb(cb);
        }
    }

    public void releasePictureCallback() {
        setPictureCallback(null);
    }

    public void stopPreviewCallback(boolean isRelease) {
        Log.v(TAG, "stopPreviewCallback");
        if (this.mIsPreviewCallbackEnabled && this.mIsPreviewCallbackStarted && this.mPreviewImageReader != null) {
            this.mIsPreviewCallbackStarted = false;
            setPreviewCallback(null);
            this.mPreviewRequestBuilder.removeTarget(this.mPreviewImageReader.getSurface());
            if (!isRelease && checkCaptureSession("stopPreviewCallback")) {
                resumePreview();
            }
        }
    }

    public void setParallelProcessingEnable(boolean enable, String parallelProcessingPath) {
        Log.v(TAG, "setParallelProcessingEnable: enable=" + enable + " path=" + parallelProcessingPath);
        boolean changed = this.mConfigs.setParallelEnabled(enable);
        this.mConfigs.setParallelProcessingPath(parallelProcessingPath);
        if (changed) {
            applyParallelProcessEnable(this.mPreviewRequestBuilder, 1);
        }
    }

    public void takePicture(@NonNull ShutterCallback shutterCallback, @NonNull PictureCallback dataCallback) {
        Log.v(TAG, "takePicture");
        setShutterCallback(shutterCallback);
        setPictureCallback(dataCallback);
        triggerCapture();
    }

    public void takePortraitPicture(@NonNull ShutterCallback shutterCallback, @NonNull PictureCallback dataCallback, @NonNull PictureCallback portraitRawCallback, @NonNull PictureCallback portraitDepthCallback) {
        Log.v(TAG, "takePortraitPicture start");
        setShutterCallback(shutterCallback);
        setPictureCallback(dataCallback);
        this.mPortraitRawImageCallback = portraitRawCallback;
        this.mPortraitDepthImageCallback = portraitDepthCallback;
        triggerCapture();
    }

    public void captureBurstPictures(int burstCount, PictureCallback dataCallback) {
        setPictureCallback(dataCallback);
        try {
            setAWBLock(true);
            Builder captureRequestBuilder = this.mCameraDevice.createCaptureRequest(2);
            captureRequestBuilder.addTarget(this.mPhotoImageReader.getSurface());
            captureRequestBuilder.addTarget(this.mPreviewSurface);
            applySettingsForCapture(captureRequestBuilder, 4);
            pausePreview();
            this.mCaptureSession.setRepeatingRequest(captureRequestBuilder.build(), new CaptureCallback() {
                public void onCaptureFailed(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull CaptureFailure failure) {
                    super.onCaptureFailed(session, request, failure);
                    Log.e(MiCamera2.TAG, String.format(Locale.ENGLISH, "captureBurst onCaptureFailed %d", new Object[]{Integer.valueOf(failure.getReason())}));
                }

                public void onCaptureSequenceCompleted(@NonNull CameraCaptureSession session, int sequenceId, long frameNumber) {
                    Log.e(MiCamera2.TAG, "captureBurst onCaptureSequenceCompleted");
                    MiCamera2.this.setAWBLock(false);
                    MiCamera2.this.resumePreview();
                    PictureCallback callback = MiCamera2.this.getPictureCallback();
                    if (callback != null) {
                        callback.onPictureBurstFinished(true);
                    }
                }

                public void onCaptureSequenceAborted(@NonNull CameraCaptureSession session, int sequenceId) {
                    super.onCaptureSequenceAborted(session, sequenceId);
                    Log.e(MiCamera2.TAG, "captureBurst onCaptureSequenceAborted");
                    MiCamera2.this.setAWBLock(false);
                    MiCamera2.this.resumePreview();
                    PictureCallback callback = MiCamera2.this.getPictureCallback();
                    if (callback != null) {
                        callback.onPictureBurstFinished(false);
                    }
                }
            }, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture burst, IllegalState", e2);
            notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
        }
    }

    public void captureAbortBurst() {
        try {
            this.mCaptureSession.stopRepeating();
        } catch (CameraAccessException e) {
            e.printStackTrace();
            notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to abort burst, IllegalState", e2);
            notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
        }
    }

    public void cancelFocus(int moduleIndex) {
        if (checkCaptureSession("cancelFocus")) {
            if (1 == this.mCaptureCallback.getState()) {
                this.mCaptureCallback.setState(0);
            }
            try {
                Builder afBuilder = initFocusRequestBuilder(moduleIndex);
                afBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
                afBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
                applyZoomRatio(afBuilder);
                applyFlashMode(afBuilder, 1);
                applyAWBMode(afBuilder);
                applyCustomAWB(afBuilder);
                applyExposureCompensation(afBuilder);
                applyAntiShake(afBuilder);
                if (ModuleManager.isCapture()) {
                    applyContrast(afBuilder);
                    applySaturation(afBuilder);
                    applySharpness(afBuilder);
                }
                applyFpsRange(afBuilder);
                capture(afBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                this.mConfigs.setAERegions(null);
                this.mConfigs.setAFRegions(null);
                setAFModeToPreview(this.mConfigs.getFocusMode());
            } catch (CameraAccessException e) {
                e.printStackTrace();
                Log.e(TAG, "cancelFocus: " + e.getMessage());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to cancel focus, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    private void setAFModeToPreview(int focusMode) {
        Log.d(TAG, "setAFModeToPreview: focusMode=" + focusMode);
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(focusMode));
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        applyAFRegions(this.mPreviewRequestBuilder);
        applyAERegions(this.mPreviewRequestBuilder);
        resumePreview();
    }

    public void startFaceDetection() {
        Log.v(TAG, "startFaceDetection");
        this.mConfigs.setFaceDetectionEnabled(true);
        applyFaceDetection(this.mPreviewRequestBuilder);
        resumePreview();
    }

    public void stopFaceDetection() {
        Log.v(TAG, "stopFaceDetection");
        this.mConfigs.setFaceDetectionEnabled(false);
        applyFaceDetection(this.mPreviewRequestBuilder);
        resumePreview();
    }

    private Builder initFocusRequestBuilder(int moduleIndex) throws CameraAccessException {
        Builder afBuilder = null;
        switch (moduleIndex) {
            case 161:
            case 163:
            case 165:
            case 167:
            case 171:
                afBuilder = this.mCameraDevice.createCaptureRequest(1);
                break;
            case 162:
            case 168:
            case 169:
            case 170:
                afBuilder = this.mCameraDevice.createCaptureRequest(3);
                break;
        }
        afBuilder.addTarget(this.mPreviewSurface);
        if (this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession) {
            afBuilder.addTarget(this.mRecordSurface);
            afBuilder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mHighSpeedFpsRange);
        }
        return afBuilder;
    }

    public void startFocus(FocusTask focusTask, int moduleIndex) {
        Log.v(TAG, "startFocus: " + moduleIndex);
        try {
            this.mCaptureCallback.setFocusTask(focusTask);
            this.mCaptureCallback.setState(1);
            Builder afBuilder = initFocusRequestBuilder(moduleIndex);
            afBuilder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            addFocusCaptureKeysToRequest(afBuilder);
            afBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
            capture(afBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
            this.mConfigs.setFocusMode(1);
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            if (ModuleManager.isVideoModule() || ModuleManager.isFastMotionModule() || ModuleManager.isSlowMotionModule() || ModuleManager.isFunModule()) {
                applySettingsForVideo(this.mPreviewRequestBuilder);
            } else {
                applySettingsForPreview(this.mPreviewRequestBuilder);
            }
            resumePreview();
        } catch (CameraAccessException ex) {
            ex.printStackTrace();
            Log.e(TAG, "Failed to start focus");
        }
    }

    private void addFocusCaptureKeysToRequest(Builder builder) {
        applyAFRegions(builder);
        applyAERegions(builder);
        applyZoomRatio(builder);
        applyAWBMode(builder);
        applyCustomAWB(builder);
        applyExposureCompensation(builder);
        applyAntiShake(builder);
        if (ModuleManager.isCapture()) {
            applyContrast(builder);
            applySaturation(builder);
            applySharpness(builder);
        }
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        applyFlashMode(builder, 1);
        applyFpsRange(builder);
    }

    public boolean isSessionReady() {
        return this.mCaptureSession != null;
    }

    private boolean isClosed() {
        return this.mOpenState == 0;
    }

    public void setPreviewSize(CameraSize size) {
        if (!Objects.equals(this.mConfigs.getPreviewSize(), size)) {
            this.mConfigs.setPreviewSize(size);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader(size);
            }
        }
    }

    public CameraSize getPreviewSize() {
        return this.mConfigs.getPreviewSize();
    }

    public void setPictureSize(CameraSize size) {
        if (!Objects.equals(this.mConfigs.getPhotoSize(), size)) {
            this.mConfigs.setPhotoSize(size);
            preparePhotoImageReader(size);
        }
    }

    public CameraSize getPictureSize() {
        return this.mConfigs.getPhotoSize();
    }

    public void setJpegThumbnailSize(CameraSize size) {
        this.mConfigs.setThumbnailSize(size);
    }

    public void setVideoSnapshotSize(CameraSize size) {
        this.mConfigs.setVideoSnapshotSize(size);
    }

    public void setJpegQuality(int quality) {
        this.mConfigs.setJpegQuality(quality);
    }

    public void setJpegRotation(int jpegRotation) {
        this.mConfigs.setJpegRotation(jpegRotation);
    }

    public void setZoomRatio(float zoom) {
        Log.v(TAG, "setZoomRatio " + zoom);
        if (this.mConfigs.setZoomRatio(zoom)) {
            applyZoomRatio(this.mPreviewRequestBuilder);
        }
    }

    public void setEnableZsl(boolean enable) {
        Log.v(TAG, "setEnableZsl " + enable);
        this.mConfigs.setEnableZsl(enable);
        applyZsl(this.mPreviewRequestBuilder);
    }

    public void setEnableOIS(boolean enable) {
        if (this.mCapabilities.isSupportOIS()) {
            Log.v(TAG, "setEnableOIS " + enable);
            this.mConfigs.setEnableOIS(enable);
            applyAntiShake(this.mPreviewRequestBuilder);
        }
    }

    public void setSceneMode(int sceneMode) {
        Log.v(TAG, "setSceneMode: " + sceneMode);
        if (this.mConfigs.setSceneMode(sceneMode)) {
            applySceneMode(this.mPreviewRequestBuilder);
        }
    }

    public void setContrast(int level) {
        Log.v(TAG, "setContrast: " + level);
        if (this.mConfigs.setContrastLevel(level)) {
            applyContrast(this.mPreviewRequestBuilder);
        }
    }

    public void setSaturation(int level) {
        Log.v(TAG, "setSaturation: " + level);
        if (this.mConfigs.setSaturationLevel(level)) {
            applySaturation(this.mPreviewRequestBuilder);
        }
    }

    public void setSharpness(int level) {
        Log.v(TAG, "setSharpness: " + level);
        if (this.mConfigs.setSharpnessLevel(level)) {
            applySharpness(this.mPreviewRequestBuilder);
        }
    }

    public void setExposureMeteringMode(int mode) {
        Log.v(TAG, "setExposureMeteringMode: " + mode);
        if (this.mConfigs.setExposureMeteringMode(mode)) {
            applyExposureMeteringMode(this.mPreviewRequestBuilder);
        }
    }

    public void setAntiBanding(int antiBanding) {
        Log.v(TAG, "setAntiBanding: " + antiBanding);
        if (this.mConfigs.setAntiBanding(antiBanding)) {
            applyAntiBanding(this.mPreviewRequestBuilder);
        }
    }

    public void setOpticalZoomToTele(boolean toTele) {
        MiCameraCompat.applyStFastZoomIn(this.mPreviewRequestBuilder, toTele);
    }

    public void setEnableEIS(boolean enable) {
        Log.v(TAG, "setEnableEIS: " + enable);
        if (this.mConfigs.setEnableEIS(enable)) {
            applyAntiShake(this.mPreviewRequestBuilder);
        }
    }

    public void setASD(boolean enable) {
        if (this.mConfigs.setAiSceneDetectEnable(enable)) {
            applyAiSceneDetectEnable(this.mPreviewRequestBuilder);
        }
    }

    public void setASDPeriod(int period) {
        if (this.mConfigs.setAiSceneDetectPeriod(period)) {
            applyAiSceneDetectPeriod(this.mPreviewRequestBuilder);
        }
    }

    public void setHHT(boolean enable) {
        if (this.mConfigs.setHHTEnabled(enable)) {
            applyHHT(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setHDR(boolean enable) {
        if (this.mConfigs.setHDREnabled(enable)) {
            applyHDR(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setHDRCheckerEnable(boolean enable) {
        if (this.mConfigs.setHDRCheckerEnabled(enable)) {
            applyHDRCheckerEnable(this.mPreviewRequestBuilder, enable, 1);
        }
    }

    public void setSuperResolution(boolean enable) {
        if (this.mConfigs.setSuperResolutionEnabled(enable)) {
            applySuperResolution(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setMfnr(boolean enable) {
        if (this.mConfigs.setMfnrEnabled(enable)) {
            applyMfnr(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setBokeh(boolean enable) {
        if (this.mConfigs.setBokehEnabled(enable)) {
            applyBokeh(this.mPreviewRequestBuilder, 1);
        }
    }

    public boolean isBokehEnabled() {
        return this.mConfigs.isBokehEnabled();
    }

    public void setLensDirtyDetect(boolean enable) {
        if (this.mConfigs.setLensDirtyDetectEnabled(enable)) {
            applyLensDirtyDetect(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setFaceAgeAnalyze(boolean enable) {
        if (this.mConfigs.setFaceAgeAnalyzeEnabled(enable)) {
            applyFaceAgeAnalyze(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setFaceScore(boolean enable) {
        if (this.mConfigs.setFaceScoreEnabled(enable)) {
            applyFaceScore(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setDualCamWaterMarkEnable(boolean enable) {
        this.mConfigs.setDualCamWaterMarkEnable(enable);
    }

    public void setTimeWaterMarkEnable(boolean enable) {
        this.mConfigs.setTimeWaterMarkEnable(enable);
    }

    public void setTimeWatermarkValue(String v) {
        this.mConfigs.setTimeWaterMarkValue(v);
    }

    public void setFaceWaterMarkEnable(boolean enable) {
        this.mConfigs.setFaceWaterMarkEnable(enable);
    }

    public void setFaceWaterMarkFormat(String v) {
        this.mConfigs.setFaceWaterMarkFormat(v);
    }

    public void setFpsRange(Range<Integer> fpsRange) {
        Log.v(TAG, "setFpsRange: " + fpsRange);
        this.mConfigs.setPreviewFpsRange(fpsRange);
        applyFpsRange(this.mPreviewRequestBuilder);
    }

    public void setVideoFpsRange(Range<Integer> fpsRange) {
        Log.v(TAG, "setVideoFpsRange: " + fpsRange);
        this.mConfigs.setVideoFpsRange(fpsRange);
    }

    private int genSessionId() {
        int i = this.mSessionId + 1;
        this.mSessionId = i;
        if (i == Integer.MAX_VALUE) {
            this.mSessionId = 0;
        }
        Log.v(TAG, "generateSessionId: id=" + this.mSessionId);
        return this.mSessionId;
    }

    public void setDisplayOrientation(int displayOrientation) {
        Log.v(TAG, "setDisplayOrientation: " + displayOrientation);
        this.mDisplayOrientation = displayOrientation;
    }

    public void setDeviceOrientation(int deviceOrientation) {
        Log.v(TAG, "setDeviceOrientation: " + deviceOrientation);
        if (this.mConfigs.setDeviceOrientation(deviceOrientation)) {
            applyDeviceOrientation(this.mPreviewRequestBuilder);
        }
    }

    public void setExposureCompensation(int index) {
        Log.v(TAG, "setExposureCompensation: " + index);
        if (this.mConfigs.setExposureCompensationIndex(index)) {
            applyExposureCompensation(this.mPreviewRequestBuilder);
        }
    }

    public void setExposureTime(long time) {
        if (this.mConfigs.setExposureTime(time)) {
            applyExposureTime(this.mPreviewRequestBuilder, 1);
        }
    }

    private long getExposureTime() {
        return this.mConfigs.getExposureTime();
    }

    public void setGpsLocation(Location loc) {
        this.mConfigs.setGpsLocation(loc);
    }

    public void setFocusCallback(FocusCallback cb) {
        synchronized (this.mObjLock) {
            this.mFocusCallback = cb;
        }
    }

    public void setMetaDataCallback(CameraMetaDataCallback cb) {
        this.mMetadataCallback = cb;
    }

    public CameraMetaDataCallback getMetaDataCallback() {
        return this.mMetadataCallback;
    }

    public void setFaceDetectionCallback(FaceDetectionCallback cb) {
        synchronized (this.mObjLock) {
            this.mFaceCallback = cb;
        }
    }

    public void setHDRCheckerCallback(HDRCheckerCallback cb) {
        synchronized (this.mObjLock) {
            this.mHDRCheckerCallback = cb;
        }
    }

    public void setScreenLightCallback(ScreenLightCallback cb) {
        synchronized (this.mObjLock) {
            this.mScreenLightCallback = cb;
        }
    }

    public void setAERegions(MeteringRectangle[] regions) {
        Log.v(TAG, "setAERegions");
        if (this.mConfigs.setAERegions(regions)) {
            applyAERegions(this.mPreviewRequestBuilder);
        }
    }

    public void setAFRegions(MeteringRectangle[] regions) {
        Log.v(TAG, "setAFRegions");
        if (this.mConfigs.setAFRegions(regions)) {
            applyAFRegions(this.mPreviewRequestBuilder);
        }
    }

    public void setAELock(boolean lock) {
        Log.v(TAG, "setAELock: " + lock);
        if (this.mConfigs.setAELock(lock)) {
            applyAELock(this.mPreviewRequestBuilder, lock);
        }
    }

    public void setAWBLock(boolean lock) {
        Log.v(TAG, "setAWBLock: " + lock);
        if (this.mConfigs.setAWBLock(lock)) {
            applyAWBLock(this.mPreviewRequestBuilder, lock);
        }
    }

    public void setAWBMode(int awbMode) {
        Log.v(TAG, "setAWBMode: " + awbMode);
        if (this.mConfigs.setAWBMode(awbMode)) {
            applyAWBMode(this.mPreviewRequestBuilder);
        }
    }

    public void setCustomAWB(int awbValue) {
        Log.v(TAG, "setCustomAWB: " + awbValue);
        if (this.mConfigs.setCustomAWB(awbValue)) {
            applyCustomAWB(this.mPreviewRequestBuilder);
        }
    }

    public void setISO(int iso) {
        Log.v(TAG, "setISO: " + iso);
        if (this.mConfigs.setISO(iso)) {
            applyIso(this.mPreviewRequestBuilder);
        }
    }

    public void setFocusMode(int focusMode) {
        Log.v(TAG, "setFocusMode: " + focusMode);
        if (this.mConfigs.setFocusMode(focusMode)) {
            applyFocusMode(this.mPreviewRequestBuilder);
        }
    }

    public int getFocusMode() {
        return this.mConfigs.getFocusMode();
    }

    public void setFocusDistance(float distance) {
        Log.v(TAG, "setFocusDistance: " + distance);
        if (this.mConfigs.setFocusDistance(distance)) {
            applyFocusDistance(this.mPreviewRequestBuilder);
        }
    }

    public void setFlashMode(int flashMode) {
        Log.v(TAG, "setFlashMode: " + flashMode);
        if (this.mConfigs.setFlashMode(flashMode)) {
            applyFlashMode(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setOptimizedFlash(boolean enable) {
        this.mConfigs.setOptimizedFlash(enable);
    }

    public int getFlashMode() {
        return this.mConfigs.getFlashMode();
    }

    private void triggerCapture() {
        if (isNeedFlashOn()) {
            this.mConfigs.setNeedFlash(true);
            if (needOptimizedFlash()) {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
                applyAELock(this.mPreviewRequestBuilder, false);
                resumePreview();
            } else if (needScreenLight()) {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                resumePreview();
            }
            if (this.mCapabilities.isAutoFocusSupported()) {
                lockFocus();
                return;
            } else {
                runPrecaptureSequence();
                return;
            }
        }
        this.mConfigs.setNeedFlash(false);
        captureStillPicture();
    }

    public boolean isNeedFlashOn() {
        boolean z = true;
        if (this.mConfigs.getFlashMode() == 1 || this.mConfigs.getFlashMode() == 103 || this.mConfigs.getFlashMode() == 101) {
            return true;
        }
        if (this.mConfigs.getFlashMode() != 3) {
            return false;
        }
        Integer currentAEState = this.mCaptureCallback.getCurrentAEState();
        if (currentAEState == null) {
            z = false;
        } else if (currentAEState.intValue() != 4) {
            z = false;
        }
        return z;
    }

    public boolean isNeedPreviewThumbnail() {
        if (this.mConfigs.isHDREnabled()) {
            return false;
        }
        if (this.mConfigs.isMfnrEnabled()) {
            return true;
        }
        return this.mConfigs.isSuperResolutionEnabled();
    }

    public void setBeautyValues(BeautyValues beautyValues) {
        this.mConfigs.setBeautyValues(beautyValues);
        applyBeautyValues(this.mPreviewRequestBuilder);
    }

    public void setNeedPausePreview(boolean pausePreview) {
        this.mConfigs.setPausePreview(pausePreview);
    }

    public void setFrontMirror(boolean enable) {
        this.mConfigs.setFrontMirror(enable);
    }

    public void lockExposure(boolean lock) {
        if (checkCaptureSession("lockExposure")) {
            this.mCaptureCallback.setState(3);
            applyAELock(this.mPreviewRequestBuilder, true);
            resumePreview();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x002f A:{Splitter: B:1:0x0008, ExcHandler: android.hardware.camera2.CameraAccessException (r1_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:3:0x002f, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:4:0x0030, code:
            r1.printStackTrace();
     */
    /* JADX WARNING: Missing block: B:6:?, code:
            return;
     */
    private void runPrecaptureSequence() {
        /*
        r5 = this;
        r3 = TAG;
        r4 = "runPrecaptureSequence";
        com.android.camera.log.Log.v(r3, r4);
        r3 = r5.mCameraDevice;	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r4 = 1;
        r0 = r3.createCaptureRequest(r4);	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r3 = r5.mPreviewSurface;	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r0.addTarget(r3);	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r5.applySettingsForPrecapture(r0);	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r2 = r0.build();	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r3 = r2.hashCode();	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r5.mPrecaptureRequestHashCode = r3;	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r3 = r5.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r4 = 4;
        r3.setState(r4);	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r3 = r5.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r4 = r5.mCameraHandler;	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
        r5.capture(r2, r3, r4);	 Catch:{ CameraAccessException -> 0x002f, CameraAccessException -> 0x002f }
    L_0x002e:
        return;
    L_0x002f:
        r1 = move-exception;
        r1.printStackTrace();
        goto L_0x002e;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.MiCamera2.runPrecaptureSequence():void");
    }

    private void applySettingsForPrecapture(Builder builder) {
        applyCommonSettings(builder, 1);
        applyFlashMode(builder, 6);
        builder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, Integer.valueOf(1));
    }

    private void waitFlashClosed() {
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        resumePreview();
        this.mCaptureCallback.setState(7);
    }

    private void captureStillPicture() {
        if (checkCaptureSession("capture")) {
            try {
                Builder captureRequestBuilder = this.mCameraDevice.createCaptureRequest(2);
                captureRequestBuilder.addTarget(this.mPhotoImageReader.getSurface());
                if (!this.mCapabilities.isSupportedQcfa() || isFrontBeautyOn()) {
                    captureRequestBuilder.addTarget(this.mPreviewSurface);
                }
                if (CameraSettings.isPortraitModeBackOn() && Device.isSupportDynamicLightSpot()) {
                    captureRequestBuilder.addTarget(this.mDepthReader.getSurface());
                    captureRequestBuilder.addTarget(this.mPortraitRawImageReader.getSurface());
                }
                Log.d(TAG, "captureStillPicture: size=" + this.mPhotoImageReader.getWidth() + "x" + this.mPhotoImageReader.getHeight());
                captureRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mPreviewRequestBuilder.get(CaptureRequest.CONTROL_AF_MODE));
                applySettingsForCapture(captureRequestBuilder, 3);
                if (this.mCapabilities.isSupportBurstHint()) {
                    MiCameraCompat.applyBurstHint(captureRequestBuilder, 0);
                }
                if (this.mCapabilities.isSupportBurstFps()) {
                    MiCameraCompat.applyBurstFps(captureRequestBuilder, 0);
                }
                this.mCaptureSession.capture(captureRequestBuilder.build(), new CaptureCallback() {
                    public void onCaptureStarted(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, long timestamp, long frameNumber) {
                        super.onCaptureStarted(session, request, timestamp, frameNumber);
                        ShutterCallback callback = MiCamera2.this.getShutterCallback();
                        if (callback != null) {
                            callback.onShutter();
                            MiCamera2.this.setShutterCallback(null);
                        }
                    }

                    public void onCaptureCompleted(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull TotalCaptureResult result) {
                        MiCamera2.this.onCapturePictureFinished(true);
                    }

                    public void onCaptureFailed(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull CaptureFailure failure) {
                        super.onCaptureFailed(session, request, failure);
                        Log.e(MiCamera2.TAG, "Capture a still picture failed " + String.valueOf(failure.getReason()));
                        MiCamera2.this.onCapturePictureFinished(false);
                    }
                }, this.mCameraHandler);
            } catch (CameraAccessException e) {
                e.printStackTrace();
                Log.e(TAG, "Cannot capture a still picture");
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to capture a still picture, IllegalState", e2);
                notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
            }
        }
    }

    private void onCapturePictureFinished(boolean succeed) {
        boolean needResumePreview = this.mConfigs.isNeedFlash();
        this.mConfigs.setNeedFlash(false);
        this.mCaptureCallback.setState(0);
        applySettingsForPreview(this.mPreviewRequestBuilder);
        if (needResumePreview) {
            resumePreview();
        }
        PictureCallback callback = getPictureCallback();
        if (!succeed && callback != null) {
            callback.onPictureTakenFailed();
        }
    }

    public void captureVideoSnapshot(PictureCallback cb) {
        this.mVideoSnapshotCallBack = cb;
        try {
            Builder captureRequestBuilder;
            if (2 == this.mCapabilities.getSupportedHardwareLevel()) {
                captureRequestBuilder = this.mCameraDevice.createCaptureRequest(2);
            } else {
                captureRequestBuilder = this.mCameraDevice.createCaptureRequest(4);
            }
            captureRequestBuilder.addTarget(this.mVideoSnapshotImageReader.getSurface());
            Log.d(TAG, "captureVideoSnapshot: size=" + this.mVideoSnapshotImageReader.getWidth() + "x" + this.mVideoSnapshotImageReader.getHeight());
            applySettingsForJpeg(captureRequestBuilder);
            applyVideoFlash(captureRequestBuilder);
            applyExposureCompensation(captureRequestBuilder);
            applyZoomRatio(captureRequestBuilder);
            applyAntiShake(captureRequestBuilder);
            this.mCaptureSession.capture(captureRequestBuilder.build(), new CaptureCallback() {
                public void onCaptureCompleted(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull TotalCaptureResult result) {
                    Log.d(MiCamera2.TAG, "captureVideoSnapshot completed");
                }
            }, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "cannot capture a video snapshot");
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture a video snapshot, IllegalState", e2);
            notifyOnError(STCommon.ST_MOBILE_ENABLE_SEGMENT_DETECT);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x0050 A:{Splitter: B:4:0x0012, ExcHandler: android.hardware.camera2.CameraAccessException (r1_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:9:0x0050, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x0051, code:
            r1.printStackTrace();
     */
    private void lockFocus() {
        /*
        r7 = this;
        r3 = "lockFocus";
        r3 = r7.checkCaptureSession(r3);
        if (r3 != 0) goto L_0x000a;
    L_0x0009:
        return;
    L_0x000a:
        r3 = TAG;
        r4 = "lockFocus";
        com.android.camera.log.Log.v(r3, r4);
        r3 = r7.mCameraDevice;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r4 = 1;
        r0 = r3.createCaptureRequest(r4);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r7.mPreviewSurface;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r0.addTarget(r3);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r7.applySettingsForLockFocus(r0);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r2 = r0.build();	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r2.hashCode();	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r7.mLockRequestHashCode = r3;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r7.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r4 = 2;
        r3.setState(r4);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r7.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3.showAutoFocusStart();	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r7.mCaptureCallback;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r4 = r7.mCameraHandler;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r7.capture(r2, r3, r4);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r7.mHelperHandler;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        if (r3 == 0) goto L_0x004f;
    L_0x0041:
        r3 = r7.mHelperHandler;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r4 = 1;
        r3.removeMessages(r4);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r3 = r7.mHelperHandler;	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
        r4 = 5000; // 0x1388 float:7.006E-42 double:2.4703E-320;
        r6 = 1;
        r3.sendEmptyMessageDelayed(r6, r4);	 Catch:{ CameraAccessException -> 0x0050, CameraAccessException -> 0x0050 }
    L_0x004f:
        return;
    L_0x0050:
        r1 = move-exception;
        r1.printStackTrace();
        goto L_0x004f;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.MiCamera2.lockFocus():void");
    }

    private void applySettingsForLockFocus(Builder builder) {
        builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
        applyAFRegions(builder);
        applyAERegions(builder);
        applyCommonSettings(builder, 1);
        if (needOptimizedFlash() || needScreenLight()) {
            applyFlashMode(builder, 6);
        }
    }

    private boolean needOptimizedFlash() {
        if (!this.mConfigs.isNeedFlash()) {
            return false;
        }
        if (this.mConfigs.getFlashMode() == 1 || this.mConfigs.getFlashMode() == 3 || getExposureTime() > 0) {
            return true;
        }
        return false;
    }

    private boolean needScreenLight() {
        return this.mConfigs.isNeedFlash() && this.mConfigs.getFlashMode() == 101;
    }

    private int capture(CaptureRequest request, CaptureCallback listener, Handler handler) throws CameraAccessException {
        if (!(this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession)) {
            return this.mCaptureSession.capture(request, listener, handler);
        }
        return this.mCaptureSession.captureBurst(createHighSpeedRequestList(request), listener, handler);
    }

    private void applyAELock(Builder request, boolean lock) {
        if (request != null) {
            Log.d(TAG, "applyAELock: " + lock);
            request.set(CaptureRequest.CONTROL_AE_LOCK, Boolean.valueOf(lock));
        }
    }

    private void applyAWBLock(Builder request, boolean lock) {
        if (request != null) {
            request.set(CaptureRequest.CONTROL_AWB_LOCK, Boolean.valueOf(lock));
        }
    }

    private void applyAWBMode(Builder request) {
        if (request != null) {
            request.set(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(this.mConfigs.getAWBMode()));
        }
    }

    private void applyCustomAWB(Builder request) {
        MiCameraCompat.applyCustomAWB(request, this.mConfigs.getAwbCustomValue());
    }

    private void applyAERegions(Builder request) {
        if (request != null) {
            MeteringRectangle[] regions = this.mConfigs.getAERegions();
            if (regions != null) {
                request.set(CaptureRequest.CONTROL_AE_REGIONS, regions);
            } else {
                request.set(CaptureRequest.CONTROL_AE_REGIONS, ZERO_WEIGHT_3A_REGION);
            }
        }
    }

    private void applyAFRegions(Builder request) {
        if (request != null) {
            MeteringRectangle[] regions = this.mConfigs.getAFRegions();
            if (regions != null) {
                request.set(CaptureRequest.CONTROL_AF_REGIONS, regions);
            } else {
                request.set(CaptureRequest.CONTROL_AF_REGIONS, ZERO_WEIGHT_3A_REGION);
            }
        }
    }

    private void applyAntiBanding(Builder request) {
        if (request != null) {
            request.set(CaptureRequest.CONTROL_AE_ANTIBANDING_MODE, Integer.valueOf(this.mConfigs.getAntiBanding()));
        }
    }

    private void applyExposureCompensation(Builder request) {
        if (request != null) {
            int value = this.mConfigs.getExposureCompensationIndex();
            Log.d(TAG, "applyExposureCompensation: " + value);
            request.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(value));
        }
    }

    private void applyFaceDetection(Builder request) {
        if (request != null) {
            int mode;
            if (this.mConfigs.isFaceDetectionEnabled()) {
                mode = 2;
            } else {
                mode = 0;
            }
            request.set(CaptureRequest.STATISTICS_FACE_DETECT_MODE, Integer.valueOf(mode));
        }
    }

    private void applyFlashMode(Builder request, int applyType) {
        Log.d(TAG, "applyFlashMode: request = " + request + ", applyType = " + applyType);
        if (request != null) {
            int flashMode = this.mConfigs.getFlashMode();
            boolean needSnapShootVendorTag = false;
            switch (applyType) {
                case 3:
                    if (needOptimizedFlash()) {
                        if (getExposureTime() <= 0) {
                            flashMode = 2;
                            if (ModuleManager.isCapture()) {
                                needSnapShootVendorTag = true;
                                break;
                            }
                        }
                        flashMode = 0;
                        break;
                    }
                    break;
                case 6:
                    if (needOptimizedFlash()) {
                        flashMode = 2;
                        if (ModuleManager.isCapture()) {
                            needSnapShootVendorTag = true;
                            break;
                        }
                    }
                    break;
            }
            Log.d(TAG, "applyFlashMode: flashMode = " + flashMode + ", mScreenLightCallback = " + this.mScreenLightCallback);
            switch (flashMode) {
                case 0:
                    request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                    request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
                    break;
                case 1:
                    request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(3));
                    request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(1));
                    break;
                case 2:
                    if (this.mCapabilities.isSupportSnapShotTorch()) {
                        MiCameraCompat.applySnapshotTorch(request, needSnapShootVendorTag);
                    }
                    request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                    request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
                    break;
                case 3:
                    request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(2));
                    request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(1));
                    break;
                case 4:
                    request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(4));
                    break;
                case 101:
                    if (this.mScreenLightCallback != null) {
                        if (applyType == 6) {
                            this.mScreenLightColorTemperature = this.mCaptureCallback.getCurrentColorTemperature();
                        }
                        int color = Util.getScreenLightColor(SystemProperties.getInt("camera_screen_light_wb", this.mScreenLightColorTemperature));
                        int brightness = SystemProperties.getInt("camera_screen_light_brightness", 180);
                        int delay = SystemProperties.getInt("camera_screen_light_delay", 0);
                        Log.d(TAG, "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_ON color = " + color + ", brightness = " + brightness + ", delay = " + delay + ", mCameraHandler = " + this.mCameraHandler);
                        if (applyType != 6 && applyType != 3) {
                            if (delay != 0) {
                                this.mCameraHandler.postDelayed(new Runnable() {
                                    public void run() {
                                        MiCamera2.this.mScreenLightCallback.stopScreenLight();
                                    }
                                }, (long) delay);
                                break;
                            } else {
                                this.mScreenLightCallback.stopScreenLight();
                                break;
                            }
                        }
                        this.mScreenLightCallback.startScreenLight(color, brightness);
                        break;
                    }
                    break;
                case 103:
                    Log.d(TAG, "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_AUTO applyType = " + applyType);
                    if (this.mScreenLightCallback != null) {
                        this.mScreenLightCallback.stopScreenLight();
                        break;
                    }
                    break;
            }
        }
    }

    private void applyFocusMode(Builder request) {
        if (request != null) {
            request.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(this.mConfigs.getFocusMode()));
            applyAFRegions(request);
            applyAERegions(request);
        }
    }

    private void applyFocusDistance(Builder request) {
        if (request != null && getFocusMode() == 0) {
            request.set(CaptureRequest.LENS_FOCUS_DISTANCE, Float.valueOf(this.mConfigs.getFocusDistance()));
        }
    }

    private void applyFpsRange(Builder request) {
        if (request != null && this.mConfigs.getPreviewFpsRange() != null) {
            request.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mConfigs.getPreviewFpsRange());
        }
    }

    private void applyIso(Builder request) {
        if (request != null) {
            MiCameraCompat.applyISO(request, this.mConfigs.getISO());
        }
    }

    private void applyExposureTime(Builder request, int applyType) {
        if (request != null && applyType == 3) {
            MiCameraCompat.applyExposureTime(request, this.mConfigs.getExposureTime());
        }
    }

    private void applyContrast(Builder request) {
        if (request != null && this.mCapabilities.isSupportContrast()) {
            MiCameraCompat.applyContrast(request, this.mConfigs.getContrastLevel());
        }
    }

    private void applySaturation(Builder request) {
        if (request != null) {
            MiCameraCompat.applySaturation(request, this.mConfigs.getSaturationLevel());
        }
    }

    private void applySharpness(Builder request) {
        if (request != null) {
            MiCameraCompat.applySharpness(request, this.mConfigs.getSharpnessLevel());
        }
    }

    private void applyExposureMeteringMode(Builder request) {
        if (request != null) {
            MiCameraCompat.applyExposureMeteringMode(request, this.mConfigs.getExposureMeteringMode());
        }
    }

    private void applyAiSceneDetectEnable(Builder request) {
        if (request != null) {
            MiCameraCompat.applyASDEnable(request, this.mConfigs.isAiSceneDetectEnabled());
        }
    }

    private void applyAiSceneDetectPeriod(Builder request) {
        if (request != null) {
            MiCameraCompat.applyAiScenePeriod(request, this.mConfigs.getAiSceneDetectPeriod());
        }
    }

    private void applySceneMode(Builder request) {
        if (request != null) {
            int sceneMode = this.mConfigs.getSceneMode();
            if (sceneMode != 0) {
                request.set(CaptureRequest.CONTROL_SCENE_MODE, Integer.valueOf(sceneMode));
                request.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(2));
            } else {
                request.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            }
        }
    }

    private void applyZoomRatio(Builder request) {
        if (request != null) {
            float zoomRatio = this.mConfigs.getZoomRatio();
            Rect activeRegion = this.mCapabilities.getActiveArraySize();
            Log.v(TAG, "applyZoomRatio: ActiveArraySize=" + activeRegion);
            Rect cropRegion = new Rect();
            int xCenter = activeRegion.width() / 2;
            int yCenter = activeRegion.height() / 2;
            int xDelta = (int) (((float) activeRegion.width()) / (2.0f * zoomRatio));
            int yDelta = (int) (((float) activeRegion.height()) / (2.0f * zoomRatio));
            cropRegion.set(xCenter - xDelta, yCenter - yDelta, xCenter + xDelta, yCenter + yDelta);
            Log.v(TAG, "applyZoomRatio: cropRegion=" + cropRegion);
            request.set(CaptureRequest.SCALER_CROP_REGION, cropRegion);
        }
    }

    private void applyZsl(Builder request) {
        if (request != null) {
            CompatibilityUtils.setZsl(request, this.mConfigs.isZslEnabled());
        }
    }

    private void applyAntiShake(Builder request) {
        int i = 1;
        if (request != null) {
            boolean enableEIS = this.mConfigs.isEISEnabled();
            boolean enableOIS = this.mConfigs.isOISEnabled();
            if (enableEIS && enableOIS && Util.isDebugOsBuild()) {
                throw new RuntimeException("EIS&OIS are both on");
            }
            int i2;
            Log.v(TAG, "EIS: " + (enableEIS ? "on" : "off"));
            Key key = CaptureRequest.CONTROL_VIDEO_STABILIZATION_MODE;
            if (enableEIS) {
                i2 = 1;
            } else {
                i2 = 0;
            }
            request.set(key, Integer.valueOf(i2));
            if (this.mCapabilities.isSupportOIS()) {
                String str = TAG;
                StringBuilder append = new StringBuilder().append("OIS: ");
                String str2 = (enableEIS || !enableOIS) ? "off" : "on";
                Log.v(str, append.append(str2).toString());
                Key key2 = CaptureRequest.LENS_OPTICAL_STABILIZATION_MODE;
                if (enableEIS || !enableOIS) {
                    i = 0;
                }
                request.set(key2, Integer.valueOf(i));
            }
        }
    }

    private void applyHHT(Builder request, int applyType) {
        if (request != null && applyType == 3 && this.mCapabilities.isSupportHHT()) {
            MiCameraCompat.applyHHT(request, this.mConfigs.isHHTEnabled());
        }
    }

    private void applyHDR(Builder request, int applyType) {
        if (request == null || !this.mCapabilities.isSupportHdr()) {
            return;
        }
        if (applyType != 3) {
            MiCameraCompat.applyHDR(request, false);
        } else {
            MiCameraCompat.applyHDR(request, this.mConfigs.isHDREnabled());
        }
    }

    private void applyHDRCheckerEnable(Builder request, boolean enable, int applyType) {
        if (request != null && applyType == 1 && (this.mCapabilities.isSupportAutoHdr() ^ 1) == 0) {
            MiCameraCompat.applyHDRCheckerEnable(request, this.mConfigs.isHDRCheckerEnabled());
        }
    }

    private void applyMfnr(Builder request, int applyType) {
        if (request == null || !this.mCapabilities.isSupportMfnr()) {
            return;
        }
        if (applyType != 3) {
            MiCameraCompat.applyMfnrEnable(request, false);
        } else {
            MiCameraCompat.applyMfnrEnable(request, this.mConfigs.isMfnrEnabled());
        }
    }

    private void applyBokeh(Builder request, int applyType) {
        if (request != null && this.mCapabilities.isSupportBokeh()) {
            MiCameraCompat.applyBokehEnable(request, this.mConfigs.isBokehEnabled());
        }
    }

    private void applyLensDirtyDetect(Builder request, int applyType) {
        if (request != null && this.mCapabilities.isSupportLensDirtyDetect()) {
            MiCameraCompat.applyLensDirtyDetect(request, this.mConfigs.isLensDirtyDetectEnabled());
        }
    }

    private void applyFaceAgeAnalyze(Builder request, int applyType) {
        if (request != null && this.mCapabilities.isSupportFaceAgeAnalyze()) {
            MiCameraCompat.applyFaceAgeAnalyzeEnable(request, this.mConfigs.isFaceAgeAnalyzeEnabled());
        }
    }

    private void applyFaceScore(Builder request, int applyType) {
        if (request != null && this.mCapabilities.isSupportFaceScore()) {
            MiCameraCompat.applyFaceScoreEnable(request, this.mConfigs.isFaceScoreEnabled());
        }
    }

    private void applyParallelProcessEnable(Builder request, int applyType) {
        if (request != null && applyType == 3 && this.mCapabilities.isSupportParallel()) {
            MiCameraCompat.applyParallelProcessEnable(request, this.mConfigs.isParallelEnabled());
            MiCameraCompat.applyParallelProcessPath(request, this.mConfigs.isParallelEnabled() ? this.mConfigs.getParallelProcessingPath() : "");
        }
    }

    private void applySuperResolution(Builder request, int applyType) {
        if (request != null && (this.mCapabilities.isSupportSuperResolution() ^ 1) == 0) {
            if (applyType != 3) {
                MiCameraCompat.applySuperResolution(request, false);
            } else {
                MiCameraCompat.applySuperResolution(request, this.mConfigs.isSuperResolutionEnabled());
            }
        }
    }

    private void applyWaterMark(Builder request, int applyType) {
        if (request != null && applyType == 3 && this.mCapabilities.isSupportWatermark()) {
            String appliedList = Util.join(",", this.mConfigs.getWaterMarkAppliedList());
            Log.d(TAG, "applyWaterMark appliedList:" + appliedList);
            if (appliedList.length() > 0) {
                MiCameraCompat.applyWaterMarkAppliedList(request, appliedList);
                if (appliedList.contains("watermark")) {
                    MiCameraCompat.applyTimeWaterMark(request, this.mConfigs.getTimeWaterMarkValue());
                }
                if (appliedList.contains("beautify")) {
                    MiCameraCompat.applyFaceWaterMark(request, this.mConfigs.getFaceWaterMarkFormat());
                }
            }
        }
    }

    private void applyDeviceOrientation(Builder request) {
        if (request != null && (this.mCapabilities.isSupportDeviceOrientation() ^ 1) == 0) {
            MiCameraCompat.applyDeviceOrientation(request, this.mConfigs.getDeviceOrientation());
        }
    }

    private void applyFrontMirror(Builder request, int applyType) {
        if (request != null && this.mCapabilities.isSupportFrontMirror() && applyType == 3) {
            MiCameraCompat.applyFrontMirror(request, this.mConfigs.isFrontMirror());
        }
    }

    private void applyCommonSettings(Builder request, int applyType) {
        request.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
        applyFocusMode(request);
        applyFaceDetection(request);
        applyAntiBanding(request);
        applyExposureCompensation(request);
        applyZoomRatio(request);
        if (ModuleManager.isCapture()) {
            applyContrast(request);
            applySaturation(request);
            applySharpness(request);
            applyExposureMeteringMode(request);
            applySceneMode(request);
            applyHHT(request, applyType);
            applyHDR(request, applyType);
            applySuperResolution(request, applyType);
            applyMfnr(request, applyType);
            applyBokeh(request, applyType);
            applyFaceAgeAnalyze(request, applyType);
            applyFaceScore(request, applyType);
            applyFrontMirror(request, applyType);
        }
        if (ModuleManager.isPortraitModule()) {
            applyContrast(request);
            applySaturation(request);
            applySharpness(request);
            if (CameraSettings.isFrontCamera()) {
                applyBokeh(request, applyType);
                applyFrontMirror(request, applyType);
                applyFaceAgeAnalyze(request, applyType);
                applyFaceScore(request, applyType);
                applyMfnr(request, applyType);
            }
        }
        if (ModuleManager.isPortraitModule() || ModuleManager.isCapture()) {
            applyParallelProcessEnable(request, applyType);
            applyBeautyValues(request);
            applyWaterMark(request, applyType);
        }
        if (ModuleManager.isPanoramaModule()) {
            applyAELock(request, this.mConfigs.isAELocked());
        }
        if (ModuleManager.isManualModule()) {
            applyAWBMode(request);
            applyCustomAWB(request);
            applyFocusDistance(request);
            applyIso(request);
            applyExposureTime(request, applyType);
        }
    }

    private void applySettingsForPreview(Builder request) {
        Log.d(TAG, "applySettingsForPreview: " + request);
        if (request != null) {
            applyFlashMode(request, 1);
            applyCommonSettings(request, 1);
            applyLensDirtyDetect(request, 1);
            applyAELock(request, this.mConfigs.isAELocked());
            applyAWBLock(request, this.mConfigs.isAWBLocked());
            applyAntiShake(request);
            request.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        }
    }

    private void applySettingsForJpeg(Builder request) {
        if (request != null) {
            Location location = this.mConfigs.getGpsLocation();
            if (location != null) {
                Location location2 = new Location(location);
                request.set(CaptureRequest.JPEG_GPS_LOCATION, location2);
                location = location2;
            }
            Log.d(TAG, "jpegRotation=" + this.mConfigs.getJpegRotation());
            request.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(this.mConfigs.getJpegRotation()));
            CameraSize size = this.mConfigs.getThumbnailSize();
            if (size != null) {
                request.set(CaptureRequest.JPEG_THUMBNAIL_SIZE, new Size(size.getWidth(), size.getHeight()));
            }
            byte jpegQuality = (byte) this.mConfigs.getJpegQuality();
            request.set(CaptureRequest.JPEG_THUMBNAIL_QUALITY, Byte.valueOf(jpegQuality));
            request.set(CaptureRequest.JPEG_QUALITY, Byte.valueOf(jpegQuality));
        }
    }

    private void applySettingsForCapture(Builder request, int applyType) {
        if (request != null) {
            request.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
            applyFlashMode(request, applyType);
            applyCommonSettings(request, applyType);
            applySettingsForJpeg(request);
            applyZsl(request);
            applyAntiShake(request);
            applyFpsRange(request);
        }
    }

    private void applySettingsForVideo(Builder request) {
        if (request != null) {
            request.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            applyFlashMode(request, 1);
            applyLensDirtyDetect(request, 1);
            applyFocusMode(request);
            applyFaceDetection(request);
            applyAntiBanding(request);
            applyExposureMeteringMode(request);
            applyExposureCompensation(request);
            applyZoomRatio(request);
            applyAntiShake(request);
        }
    }

    private void applyVideoFlash(Builder request) {
        if (request != null) {
            if (2 == this.mConfigs.getFlashMode()) {
                request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
            } else {
                request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
            }
        }
    }

    private void applyBeautyValues(Builder request) {
        if (request != null && this.mCapabilities.isSupportBeauty() && this.mConfigs.getBeautyValues() != null) {
            MiCameraCompat.applyBeautyParameter(request, this.mConfigs.getBeautyValues());
        }
    }

    private boolean checkCaptureSession(String operation) {
        if (this.mCaptureSession != null) {
            return true;
        }
        throw new RuntimeException("session for camera " + getId() + " is closed when " + operation);
    }

    private boolean checkCameraDevice(String operation) {
        if (!isClosed()) {
            return true;
        }
        throw new RuntimeException("camera " + getId() + " is closed when " + operation);
    }

    private void updateFaceInfo(CaptureResult result) {
        if (getId() == Camera2DataContainer.getInstance().getFrontCameraId()) {
            if (this.mFaceInfo == null) {
                this.mFaceInfo = new FaceAnalyzeInfo();
            }
            this.mFaceInfo.mAge = (float[]) result.get(MiCaptureResult.STATISTICS_FACE_AGE);
            this.mFaceInfo.mGender = (float[]) result.get(MiCaptureResult.STATISTICS_FACE_GENDER);
            this.mFaceInfo.mFaceScore = (float[]) result.get(MiCaptureResult.STATISTICS_FACE_FACESCORE);
            this.mFaceInfo.mProp = (float[]) result.get(MiCaptureResult.STATISTICS_FACE_PROP);
        }
    }

    private byte[] getFirstPlane(Image image) {
        Plane[] planes = image.getPlanes();
        if (planes.length <= 0) {
            return null;
        }
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] data = new byte[buffer.remaining()];
        buffer.get(data);
        return data;
    }

    private boolean isFrontBeautyOn() {
        if (this.mCameraId == 1) {
            BeautyValues beautyValues = this.mConfigs.getBeautyValues();
            if (Device.isLegacyFaceBeauty()) {
                if (!BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel) || beautyValues.mBeautySkinColor > 0 || beautyValues.mBeautySlimFace > 0 || beautyValues.mBeautySkinSmooth > 0) {
                    return true;
                }
            } else if (!BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel)) {
                return true;
            }
        }
        return false;
    }

    private List<CaptureRequest> createHighSpeedRequestList(CaptureRequest request) throws CameraAccessException {
        if (request == null) {
            throw new IllegalArgumentException("Input capture request must not be null");
        }
        Collection<Surface> outputSurfaces = request.getTargets();
        int requestListSize = ((Integer) ((Range) request.get(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE)).getUpper()).intValue() / 30;
        List<CaptureRequest> requestList = new ArrayList();
        Builder singleTargetRequestBuilder = new Builder(new CameraMetadataNative(request.getNativeCopy()), false, -1);
        Iterator<Surface> iterator = outputSurfaces.iterator();
        Surface firstSurface = (Surface) iterator.next();
        if (outputSurfaces.size() != 1 || (SurfaceUtils.isSurfaceForHwVideoEncoder(firstSurface) ^ 1) == 0) {
            singleTargetRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(3));
        } else {
            singleTargetRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(1));
        }
        singleTargetRequestBuilder.setPartOfCHSRequestList(true);
        Builder doubleTargetRequestBuilder = null;
        if (outputSurfaces.size() == 2) {
            doubleTargetRequestBuilder = new Builder(new CameraMetadataNative(request.getNativeCopy()), false, -1);
            doubleTargetRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(3));
            doubleTargetRequestBuilder.addTarget(firstSurface);
            Surface secondSurface = (Surface) iterator.next();
            doubleTargetRequestBuilder.addTarget(secondSurface);
            doubleTargetRequestBuilder.setPartOfCHSRequestList(true);
            Surface recordingSurface = firstSurface;
            if (!SurfaceUtils.isSurfaceForHwVideoEncoder(firstSurface)) {
                recordingSurface = secondSurface;
            }
            singleTargetRequestBuilder.addTarget(recordingSurface);
        } else {
            singleTargetRequestBuilder.addTarget(firstSurface);
        }
        for (int i = 0; i < requestListSize; i++) {
            if (i != 0 || doubleTargetRequestBuilder == null) {
                requestList.add(singleTargetRequestBuilder.build());
            } else {
                requestList.add(doubleTargetRequestBuilder.build());
            }
        }
        return Collections.unmodifiableList(requestList);
    }
}
