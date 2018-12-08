package com.android.camera.snap;

import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.location.Location;
import android.media.CamcorderProfile;
import android.media.Image;
import android.media.Image.Plane;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.MediaRecorder;
import android.media.MediaRecorder.OnErrorListener;
import android.media.MediaRecorder.OnInfoListener;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.provider.MediaStore.Video.Media;
import android.provider.Settings.Secure;
import android.support.annotation.NonNull;
import android.view.OrientationEventListener;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.Exif;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.VideoBase;
import com.android.camera.module.VideoModule;
import com.android.camera.storage.Storage;
import com.android.camera2.CameraCapabilities;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Locale;

@TargetApi(26)
public class SnapCamera implements OnErrorListener, OnInfoListener {
    private static final String TAG = SnapCamera.class.getSimpleName();
    private CameraCapabilities mCameraCapabilities;
    private CameraDevice mCameraDevice;
    private Handler mCameraHandler;
    private int mCameraId;
    private StateCallback mCameraStateCallback = new StateCallback() {
        public void onOpened(@NonNull CameraDevice camera) {
            synchronized (SnapCamera.this) {
                SnapCamera.this.mCameraDevice = camera;
            }
            if (SnapCamera.this.mStatusListener != null) {
                SnapCamera.this.mStatusListener.onCameraOpened();
            }
        }

        public void onDisconnected(@NonNull CameraDevice camera) {
            Log.w(SnapCamera.TAG, "onDisconnected");
            SnapCamera.this.release();
        }

        public void onError(@NonNull CameraDevice camera, int error) {
            Log.e(SnapCamera.TAG, "onError: " + error);
            SnapCamera.this.release();
        }
    };
    private final CaptureCallback mCaptureCallback = new CaptureCallback() {
        public void onCaptureFailed(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, @NonNull CaptureFailure failure) {
            super.onCaptureFailed(session, request, failure);
            Log.e(SnapCamera.TAG, "onCaptureFailed");
        }
    };
    private CameraCaptureSession mCaptureSession;
    private ContentValues mContentValues = null;
    private Context mContext;
    private HandlerThread mHandlerThread;
    private int mHeight;
    private boolean mIsCamcorder = false;
    private Handler mMainHandler;
    private MediaRecorder mMediaRecorder;
    private int mOrientation = 0;
    private OrientationEventListener mOrientationListener;
    private final OnImageAvailableListener mPhotoAvailableListener = new OnImageAvailableListener() {
        public void onImageAvailable(ImageReader reader) {
            Throwable th;
            Throwable th2 = null;
            Image image = null;
            try {
                image = reader.acquireNextImage();
                if (image == null) {
                    if (image != null) {
                        try {
                            image.close();
                        } catch (Throwable th3) {
                            th2 = th3;
                        }
                    }
                    if (th2 != null) {
                        try {
                            throw th2;
                        } catch (Exception e) {
                            Log.e(SnapCamera.TAG, e.getMessage(), e);
                        }
                    } else {
                        return;
                    }
                }
                Plane[] planes = image.getPlanes();
                if (planes.length > 0) {
                    ByteBuffer buffer = planes[0].getBuffer();
                    byte[] data = new byte[buffer.remaining()];
                    buffer.get(data);
                    SnapCamera.this.onPictureTaken(data);
                }
                if (image != null) {
                    try {
                        image.close();
                    } catch (Throwable th4) {
                        th2 = th4;
                    }
                }
                if (th2 != null) {
                    throw th2;
                }
                return;
            } catch (Throwable th22) {
                Throwable th5 = th22;
                th22 = th;
                th = th5;
            }
            if (image != null) {
                try {
                    image.close();
                } catch (Throwable th6) {
                    if (th22 == null) {
                        th22 = th6;
                    } else if (th22 != th6) {
                        th22.addSuppressed(th6);
                    }
                }
            }
            if (th22 != null) {
                throw th22;
            }
            throw th;
        }
    };
    private ImageReader mPhotoImageReader;
    private Surface mPreviewSurface;
    private CamcorderProfile mProfile;
    private boolean mRecording = false;
    private CameraCaptureSession.StateCallback mSessionCallback = new CameraCaptureSession.StateCallback() {
        public void onConfigured(@NonNull CameraCaptureSession session) {
            synchronized (SnapCamera.this) {
                if (SnapCamera.this.mCameraDevice == null) {
                    Log.e(SnapCamera.TAG, "onConfigured: CameraDevice was already closed.");
                    session.close();
                    return;
                }
                SnapCamera.this.mCaptureSession = session;
                SnapCamera.this.startPreview();
                SnapCamera.this.capture();
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession session) {
            Log.e(SnapCamera.TAG, "sessionCb: onConfigureFailed");
        }
    };
    private SnapStatusListener mStatusListener;
    private SurfaceTexture mSurfaceTexture;
    private int mWidth;

    public interface SnapStatusListener {
        void onCameraOpened();

        void onDone(Uri uri);
    }

    public void onError(MediaRecorder mr, int what, int extra) {
        stopCamcorder();
    }

    public void onInfo(MediaRecorder mr, int what, int extra) {
        if (what == 800 || what == 801) {
            Log.d(TAG, "duration or file size reach MAX");
            stopCamcorder();
        }
    }

    public SnapCamera(Context context, SnapStatusListener listener) {
        try {
            LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
            this.mStatusListener = listener;
            this.mContext = context;
            initHandler();
            initSnapType();
            initOrientationListener();
            initCamera();
        } catch (Exception e) {
            Log.e(TAG, "init failed " + e.getMessage());
        }
    }

    public static boolean isSnapEnabled(Context context) {
        String snapValue = DataRepository.dataItemGlobal().getString("pref_camera_snap_key", null);
        if (snapValue != null) {
            Secure.putString(context.getContentResolver(), "key_long_press_volume_down", CameraSettings.getMiuiSettingsKeyForStreetSnap(snapValue));
            DataRepository.dataItemGlobal().editor().remove("pref_camera_snap_key").apply();
        }
        String snapType = Secure.getString(context.getContentResolver(), "key_long_press_volume_down");
        if ("public_transportation_shortcuts".equals(snapType) || "none".equals(snapType)) {
            return false;
        }
        return true;
    }

    private void initHandler() {
        this.mHandlerThread = new HandlerThread("SnapCameraThread");
        this.mHandlerThread.start();
        this.mCameraHandler = new Handler(this.mHandlerThread.getLooper());
        this.mMainHandler = new Handler();
    }

    private void initSnapType() {
        String snapType = Secure.getString(this.mContext.getContentResolver(), "key_long_press_volume_down");
        if (snapType.equals("Street-snap-picture")) {
            this.mIsCamcorder = false;
        } else if (snapType.equals("Street-snap-movie")) {
            this.mIsCamcorder = true;
        } else {
            this.mIsCamcorder = false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0057 A:{Splitter: B:4:0x0024, ExcHandler: android.hardware.camera2.CameraAccessException (r3_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:12:0x0057, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:13:0x0058, code:
            com.android.camera.log.Log.e(TAG, "initCamera: " + r3.getMessage(), r3);
     */
    /* JADX WARNING: Missing block: B:14:0x0075, code:
            return;
     */
    private void initCamera() {
        /*
        r10 = this;
        r9 = 0;
        r10.mCameraId = r9;
        r7 = r10.mContext;
        r7 = r7.getContentResolver();
        r8 = "persist.camera.snap.auto_switch";
        r7 = android.provider.Settings.System.getInt(r7, r8, r9);
        r8 = 1;
        if (r7 != r8) goto L_0x0019;
    L_0x0013:
        r7 = com.android.camera.CameraSettings.readPreferredCameraId();
        r10.mCameraId = r7;
    L_0x0019:
        r7 = r10.mContext;
        r8 = "camera";
        r2 = r7.getSystemService(r8);
        r2 = (android.hardware.camera2.CameraManager) r2;
        r7 = r10.mCameraId;	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r1 = java.lang.String.valueOf(r7);	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r7 = r10.mCameraStateCallback;	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r8 = r10.mMainHandler;	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r2.openCamera(r1, r7, r8);	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r0 = r2.getCameraCharacteristics(r1);	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r7 = new com.android.camera2.CameraCapabilities;	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r7.<init>(r0);	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r10.mCameraCapabilities = r7;	 Catch:{ CameraAccessException -> 0x0057, CameraAccessException -> 0x0057 }
        r7 = r10.isCamcorder();
        if (r7 == 0) goto L_0x0099;
    L_0x0042:
        r6 = com.android.camera.CameraSettings.getPreferVideoQuality();
        r7 = r10.mCameraId;
        r7 = android.media.CamcorderProfile.hasProfile(r7, r6);
        if (r7 == 0) goto L_0x0076;
    L_0x004e:
        r7 = r10.mCameraId;
        r7 = android.media.CamcorderProfile.get(r7, r6);
        r10.mProfile = r7;
    L_0x0056:
        return;
    L_0x0057:
        r3 = move-exception;
        r7 = TAG;
        r8 = new java.lang.StringBuilder;
        r8.<init>();
        r9 = "initCamera: ";
        r8 = r8.append(r9);
        r9 = r3.getMessage();
        r8 = r8.append(r9);
        r8 = r8.toString();
        com.android.camera.log.Log.e(r7, r8, r3);
        return;
    L_0x0076:
        r7 = TAG;
        r8 = new java.lang.StringBuilder;
        r8.<init>();
        r9 = "invalid camcorder profile ";
        r8 = r8.append(r9);
        r8 = r8.append(r6);
        r8 = r8.toString();
        com.android.camera.log.Log.w(r7, r8);
        r7 = r10.mCameraId;
        r8 = 5;
        r7 = android.media.CamcorderProfile.get(r7, r8);
        r10.mProfile = r7;
        goto L_0x0056;
    L_0x0099:
        r7 = new android.graphics.SurfaceTexture;
        r7.<init>(r9);
        r10.mSurfaceTexture = r7;
        r7 = new android.view.Surface;
        r8 = r10.mSurfaceTexture;
        r7.<init>(r8);
        r10.mPreviewSurface = r7;
        r7 = r10.mCameraCapabilities;
        r8 = 256; // 0x100 float:3.59E-43 double:1.265E-321;
        r5 = r7.getSupportedOutputSize(r8);
        com.android.camera.PictureSizeManager.initialize(r5, r9);
        r4 = com.android.camera.PictureSizeManager.getBestPictureSize();
        r10.preparePhotoImageReader(r4);
        r7 = r4.width;
        r10.mWidth = r7;
        r7 = r4.height;
        r10.mHeight = r7;
        goto L_0x0056;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.snap.SnapCamera.initCamera():void");
    }

    private void initOrientationListener() {
        this.mOrientationListener = new OrientationEventListener(this.mContext, sensorHasLatency() ? 2 : 3) {
            public void onOrientationChanged(int orientation) {
                SnapCamera.this.mOrientation = Util.roundOrientation(orientation, SnapCamera.this.mOrientation);
            }
        };
        if (this.mOrientationListener.canDetectOrientation()) {
            Log.d(TAG, "Can detect orientation");
            this.mOrientationListener.enable();
            return;
        }
        Log.d(TAG, "Cannot detect orientation");
        this.mOrientationListener.disable();
    }

    private synchronized void startPreview() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "startPreview: CameraDevice was already closed");
            return;
        } else if (this.mCaptureSession == null) {
            Log.e(TAG, "startPreview: null capture session");
            return;
        } else {
            try {
                Builder previewRequestBuilder = this.mCameraDevice.createCaptureRequest(1);
                previewRequestBuilder.addTarget(this.mPreviewSurface);
                applySettingsForPreview(previewRequestBuilder);
                this.mCaptureSession.setRepeatingRequest(previewRequestBuilder.build(), null, null);
            } catch (CameraAccessException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    private void applySettingsForPreview(Builder request) {
        request.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
        request.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(4));
        request.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        request.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        request.set(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(1));
    }

    private void preparePhotoImageReader(@NonNull CameraSize size) {
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        this.mPhotoImageReader = ImageReader.newInstance(size.getWidth(), size.getHeight(), 256, 2);
        this.mPhotoImageReader.setOnImageAvailableListener(this.mPhotoAvailableListener, this.mCameraHandler);
    }

    private static boolean sensorHasLatency() {
        return (Device.IS_D4 || Device.IS_C1 || Device.IS_D5) ? true : Device.IS_D2;
    }

    public boolean isCamcorder() {
        return this.mIsCamcorder;
    }

    public synchronized void takeSnap() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "takeSnap: CameraDevice is opening or was already closed.");
            return;
        } else if (this.mCaptureSession == null) {
            try {
                this.mCameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mPreviewSurface, this.mPhotoImageReader.getSurface()}), this.mSessionCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                Log.e(TAG, "takeSnap: " + e.getMessage(), e);
            }
        } else {
            capture();
        }
        return;
    }

    private synchronized void capture() {
        try {
            Builder requestBuilder = this.mCameraDevice.createCaptureRequest(2);
            requestBuilder.addTarget(this.mPhotoImageReader.getSurface());
            int jpegOrientation = Util.getJpegRotation(this.mCameraId, this.mOrientation);
            requestBuilder.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(jpegOrientation));
            Log.d(TAG, "orientation=" + jpegOrientation);
            Location location = LocationManager.instance().getCurrentLocation();
            if (location != null) {
                requestBuilder.set(CaptureRequest.JPEG_GPS_LOCATION, location);
            }
            this.mCaptureSession.capture(requestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            Log.e(TAG, "takeSnap: " + e.getMessage(), e);
        }
        return;
    }

    public synchronized void release() {
        Log.d(TAG, "release(): E");
        try {
            this.mOrientation = 0;
            LocationManager.instance().recordLocation(false);
            if (this.mOrientationListener != null) {
                this.mOrientationListener.disable();
                this.mOrientationListener = null;
            }
        } catch (Exception e) {
            Log.e(TAG, e.getMessage(), e);
        }
        try {
            stopCamcorder();
        } catch (Exception e2) {
            Log.e(TAG, e2.getMessage(), e2);
        }
        try {
            if (this.mSurfaceTexture != null) {
                this.mSurfaceTexture.release();
                this.mSurfaceTexture = null;
            }
        } catch (Exception e22) {
            Log.e(TAG, e22.getMessage(), e22);
        }
        if (this.mHandlerThread != null) {
            this.mHandlerThread.quitSafely();
        }
        if (this.mCaptureSession != null) {
            this.mCaptureSession.close();
            this.mCaptureSession = null;
        }
        if (this.mCameraDevice != null) {
            this.mCameraDevice.close();
            this.mCameraDevice = null;
        }
        Log.d(TAG, "release(): X");
        return;
    }

    private void onPictureTaken(byte[] jpegData) {
        try {
            Uri uri = Storage.addImage(this.mContext, Util.createJpegName(System.currentTimeMillis()) + "_SNAP", System.currentTimeMillis(), LocationManager.instance().getCurrentLocation(), Exif.getOrientation(jpegData), jpegData, this.mWidth, this.mHeight, false, false, false, null);
            if (this.mStatusListener != null) {
                this.mStatusListener.onDone(uri);
            }
        } catch (Exception e) {
            Log.e(TAG, "save picture failed " + e.getMessage());
        }
    }

    private void setupMediaRecorder() {
        this.mMediaRecorder = new MediaRecorder();
        this.mMediaRecorder.setAudioSource(5);
        this.mMediaRecorder.setVideoSource(2);
        this.mProfile.duration = 300000;
        this.mMediaRecorder.setProfile(this.mProfile);
        this.mMediaRecorder.setMaxDuration(this.mProfile.duration);
        Location loc = LocationManager.instance().getCurrentLocation();
        if (loc != null) {
            this.mMediaRecorder.setLocation((float) loc.getLatitude(), (float) loc.getLongitude());
        }
        long dateTaken = System.currentTimeMillis();
        String title = new SimpleDateFormat(this.mContext.getString(R.string.video_file_name_format), Locale.ENGLISH).format(Long.valueOf(dateTaken));
        String filename = title + "_SNAP" + VideoBase.convertOutputFormatToFileExt(this.mProfile.fileFormat);
        String mime = VideoBase.convertOutputFormatToMimeType(this.mProfile.fileFormat);
        String path = Storage.DIRECTORY + '/' + filename;
        this.mContentValues = new ContentValues(7);
        this.mContentValues.put("title", title);
        this.mContentValues.put("_display_name", filename);
        this.mContentValues.put("datetaken", Long.valueOf(dateTaken));
        this.mContentValues.put("mime_type", mime);
        this.mContentValues.put("_data", path);
        this.mContentValues.put("resolution", Integer.toString(this.mProfile.videoFrameWidth) + "x" + Integer.toString(this.mProfile.videoFrameHeight));
        if (loc != null) {
            this.mContentValues.put("latitude", Double.valueOf(loc.getLatitude()));
            this.mContentValues.put("longitude", Double.valueOf(loc.getLongitude()));
        }
        Log.d(TAG, "save to " + path);
        this.mMediaRecorder.setOutputFile(path);
        long maxFileSize = Storage.getAvailableSpace() - 52428800;
        if (3670016000L < maxFileSize) {
            Log.d(TAG, "need reduce , now maxFileSize = " + maxFileSize);
            maxFileSize = 3670016000L;
        }
        if (maxFileSize < VideoModule.VIDEO_MIN_SINGLE_FILE_SIZE) {
            maxFileSize = VideoModule.VIDEO_MIN_SINGLE_FILE_SIZE;
        }
        try {
            this.mMediaRecorder.setMaxFileSize(maxFileSize);
        } catch (RuntimeException e) {
        }
        setRecorderOrientationHint();
        this.mMediaRecorder.setOnErrorListener(this);
        this.mMediaRecorder.setOnInfoListener(this);
        try {
            this.mMediaRecorder.prepare();
        } catch (IOException e2) {
            Log.e(TAG, "prepare failed for " + path, e2);
        }
    }

    private void setRecorderOrientationHint() {
        int rotation;
        int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
        if (this.mOrientation == -1) {
            rotation = sensorOrientation;
        } else if (this.mCameraCapabilities.getFacing() == 0) {
            rotation = ((sensorOrientation - this.mOrientation) + 360) % 360;
        } else {
            rotation = (this.mOrientation + sensorOrientation) % 360;
        }
        Log.d(TAG, "setOrientationHint: " + rotation);
        this.mMediaRecorder.setOrientationHint(rotation);
    }

    public synchronized void startCamcorder() {
        if (this.mCameraDevice == null) {
            Log.e(TAG, "startCamcorder: CameraDevice is opening or was already closed");
            return;
        }
        setupMediaRecorder();
        try {
            this.mCameraDevice.createCaptureSession(Arrays.asList(new Surface[]{this.mMediaRecorder.getSurface()}), new CameraCaptureSession.StateCallback() {
                public void onConfigured(@NonNull CameraCaptureSession session) {
                    try {
                        Builder videoRequestBuilder = SnapCamera.this.mCameraDevice.createCaptureRequest(3);
                        videoRequestBuilder.addTarget(SnapCamera.this.mMediaRecorder.getSurface());
                        session.setRepeatingRequest(videoRequestBuilder.build(), null, null);
                        try {
                            SnapCamera.this.mMediaRecorder.start();
                        } catch (Exception e) {
                            Log.e(SnapCamera.TAG, "failed to start media recorder: " + e.getMessage(), e);
                            SnapCamera.this.stopCamcorder();
                        }
                        SnapCamera.this.mRecording = true;
                    } catch (CameraAccessException e2) {
                        Log.e(SnapCamera.TAG, "videoSessionCb::onConfigured: " + e2.getMessage(), e2);
                    }
                }

                public void onConfigureFailed(@NonNull CameraCaptureSession session) {
                    Log.e(SnapCamera.TAG, "videoSessionCb::onConfigureFailed");
                    SnapCamera.this.stopCamcorder();
                }
            }, this.mCameraHandler);
        } catch (CameraAccessException e) {
            Log.e(TAG, "failed to startCamcorder: " + e.getMessage(), e);
        }
        return;
    }

    private synchronized void stopCamcorder() {
        if (this.mMediaRecorder != null) {
            if (this.mRecording) {
                try {
                    this.mMediaRecorder.stop();
                } catch (Exception e) {
                    this.mRecording = false;
                    e.printStackTrace();
                }
            }
            this.mMediaRecorder.reset();
            this.mMediaRecorder.release();
            this.mMediaRecorder = null;
        }
        String path = (String) this.mContentValues.get("_data");
        if (this.mRecording) {
            Uri uri = null;
            try {
                long size = new File(path).length();
                long duration = 0;
                if (size > 0) {
                    duration = Util.getDuration(path);
                    if (duration > 0) {
                        this.mContentValues.put("_size", Long.valueOf(size));
                        this.mContentValues.put("duration", Long.valueOf(duration));
                        uri = this.mContext.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, this.mContentValues);
                    }
                }
                if (duration == 0) {
                    new File(path).delete();
                }
            } catch (Exception th) {
                th.printStackTrace();
                uri = null;
                Log.e(TAG, "Failed to write MediaStore " + th);
            }
            if (this.mStatusListener != null) {
                this.mStatusListener.onDone(uri);
            }
        } else {
            new File(path).delete();
        }
        this.mRecording = false;
        return;
    }
}
