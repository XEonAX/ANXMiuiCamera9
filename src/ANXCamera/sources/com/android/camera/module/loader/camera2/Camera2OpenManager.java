package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.constant.ExceptionConstant;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.MiCamera2;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.observables.ConnectableObservable;
import java.util.concurrent.atomic.AtomicInteger;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class Camera2OpenManager {
    private static final String TAG = Camera2OpenManager.class.getSimpleName();
    private static Camera2OpenManager sInstance;
    private Camera2Proxy mCamera2Device;
    private CameraManager mCamera2Service;
    private Handler mCameraHandler;
    private Handler mCameraMainThreadHandler;
    private final StateCallback mCameraOpenCallback = new StateCallback() {
        public void onOpened(@NonNull CameraDevice camera) {
            int id = Integer.parseInt(camera.getId());
            CameraCapabilities caps = Camera2DataContainer.getInstance().getCapabilities(id);
            Camera2OpenManager.this.mCamera2Device = new MiCamera2(camera, id, caps, Camera2OpenManager.this.getCameraHandler(), Camera2OpenManager.this.getCameraMainThreadHandler());
            Camera2DataContainer.getInstance().setCurrentCameraCapabilities(caps);
            String message = "CameraOpenCallback: camera " + id + " was opened successfully";
            if (Camera2OpenManager.this.mCamera2Device.getCapabilities() == null) {
                message = message + ", but corresponding CameraCapabilities is null";
                Log.d(Camera2OpenManager.TAG, message);
                Camera2OpenManager.this.onCameraOpenFailed(231, message);
                return;
            }
            Log.d(Camera2OpenManager.TAG, message);
            Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(4);
        }

        public void onClosed(@NonNull CameraDevice camera) {
            Log.d(Camera2OpenManager.TAG, "CameraOpenCallback: closed " + camera.getId());
            Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(3);
        }

        public void onDisconnected(@NonNull CameraDevice camera) {
            Log.d(Camera2OpenManager.TAG, "CameraOpenCallback: onDisconnected " + camera.getId());
        }

        public void onError(@NonNull CameraDevice camera, int error) {
            Log.d(Camera2OpenManager.TAG, "CameraOpenCallback: onError " + camera.getId());
            Camera2OpenManager.this.onCameraOpenFailed(ExceptionConstant.transFromCamera2Error(error), "onError");
        }
    };
    private ObservableEmitter<Camera2Result> mCameraResultEmitter;
    private ConnectableObservable<Camera2Result> mCameraResultObservable;
    private AtomicInteger mCurrentModule = new AtomicInteger(160);
    private int mCurrentState = 1;
    private final Object mEmitterLock = new Object();
    private AtomicInteger mPendingCameraId = new AtomicInteger(-1);

    @interface ManagerState {
    }

    private Camera2OpenManager() {
        initData();
    }

    private void initData() {
        HandlerThread ht = new HandlerThread("Camera Handler Thread");
        ht.start();
        this.mCameraHandler = new Handler(ht.getLooper()) {
            public void handleMessage(Message msg) {
                Camera2OpenManager.this.onMessage(msg);
            }
        };
        this.mCameraMainThreadHandler = new Handler(Looper.getMainLooper());
        this.mCamera2Service = (CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera");
        Camera2DataContainer.getInstance(this.mCamera2Service);
    }

    public static Camera2OpenManager getInstance() {
        if (sInstance == null) {
            synchronized (Camera2OpenManager.class) {
                if (sInstance == null) {
                    sInstance = new Camera2OpenManager();
                }
            }
        }
        return sInstance;
    }

    public Handler getCameraHandler() {
        return this.mCameraHandler;
    }

    public Handler getCameraMainThreadHandler() {
        return this.mCameraMainThreadHandler;
    }

    public Camera2Proxy getCurrentCamera2Device() {
        return this.mCamera2Device;
    }

    public int getPendingCameraId() {
        return this.mPendingCameraId.get();
    }

    private void abandonOpenObserableIfExists() {
        synchronized (this.mEmitterLock) {
            if (!(this.mCameraResultEmitter == null || (this.mCameraResultEmitter.isDisposed() ^ 1) == 0)) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(3).setCameraError(225));
                this.mCameraResultEmitter.onComplete();
                this.mCameraResultEmitter = null;
            }
        }
    }

    private boolean attachInObservable(Observer<Camera2Result> observer) {
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter == null || this.mCameraResultEmitter.isDisposed()) {
                this.mCameraResultObservable = Observable.create(new ObservableOnSubscribe<Camera2Result>() {
                    public void subscribe(ObservableEmitter<Camera2Result> emitter) throws Exception {
                        Camera2OpenManager.this.mCameraResultEmitter = emitter;
                    }
                }).observeOn(GlobalConstant.sCameraSetupScheduler).publish();
                this.mCameraResultObservable.subscribe((Observer) observer);
                this.mCameraResultObservable.connect();
                return false;
            }
            this.mCameraResultObservable.subscribe((Observer) observer);
            return true;
        }
    }

    public void openCamera(int bogusCameraId, int currentMode, Observer<Camera2Result> observer, boolean forceClose) {
        int pendingOpenId = Camera2DataContainer.getInstance().getActualOpenCameraId(bogusCameraId, currentMode);
        if (!(this.mPendingCameraId.get() == pendingOpenId && this.mCurrentModule.get() == currentMode)) {
            this.mCameraHandler.removeCallbacksAndMessages(null);
            this.mPendingCameraId.set(pendingOpenId);
            this.mCurrentModule.set(currentMode);
            abandonOpenObserableIfExists();
        }
        boolean wait = attachInObservable(observer);
        if (forceClose) {
            this.mCameraHandler.sendEmptyMessage(2);
        } else {
            this.mCameraHandler.sendEmptyMessage(1);
        }
    }

    public void release(boolean immediate) {
        abandonOpenObserableIfExists();
        this.mPendingCameraId.set(-1);
        this.mCameraHandler.removeCallbacksAndMessages(null);
        this.mCurrentModule.set(160);
        setManagerState(1);
        this.mCameraHandler.sendEmptyMessage(2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x00c8 A:{Splitter: B:21:0x00ab, ExcHandler: android.hardware.camera2.CameraAccessException (r0_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x00c8 A:{Splitter: B:21:0x00ab, ExcHandler: android.hardware.camera2.CameraAccessException (r0_0 'e' java.lang.Exception)} */
    /* JADX WARNING: Missing block: B:23:0x00c8, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:24:0x00c9, code:
            r0.printStackTrace();
            onCameraOpenFailed(230, r0.getClass().getSimpleName());
            com.android.camera.log.Log.e(TAG, "openCamera: failed to open camera " + r7.mPendingCameraId.get(), r0);
     */
    /* JADX WARNING: Missing block: B:40:?, code:
            return;
     */
    private void onMessage(android.os.Message r8) {
        /*
        r7 = this;
        r6 = 2;
        r5 = 1;
        r4 = 0;
        r2 = r8.what;
        switch(r2) {
            case 1: goto L_0x0009;
            case 2: goto L_0x00fa;
            case 3: goto L_0x0129;
            case 4: goto L_0x013b;
            default: goto L_0x0008;
        };
    L_0x0008:
        return;
    L_0x0009:
        r2 = r7.mPendingCameraId;
        r2 = r2.get();
        if (r2 >= 0) goto L_0x0028;
    L_0x0011:
        r2 = r7.mCamera2Device;
        if (r2 == 0) goto L_0x0008;
    L_0x0015:
        r7.setManagerState(r6);
        r2 = TAG;
        r3 = "close start";
        com.android.camera.log.Log.e(r2, r3);
        r2 = r7.mCamera2Device;
        r2.close();
        r7.mCamera2Device = r4;
        goto L_0x0008;
    L_0x0028:
        r2 = r7.mCamera2Device;
        if (r2 == 0) goto L_0x008c;
    L_0x002c:
        r2 = r7.mCamera2Device;
        r2 = r2.getId();
        r3 = r7.mPendingCameraId;
        r3 = r3.get();
        if (r2 != r3) goto L_0x008c;
    L_0x003a:
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "Camera ";
        r2 = r2.append(r3);
        r3 = r7.mCamera2Device;
        r3 = r3.getId();
        r2 = r2.append(r3);
        r3 = " was opened successfully";
        r2 = r2.append(r3);
        r1 = r2.toString();
        r2 = r7.mCamera2Device;
        r2 = r2.getCapabilities();
        if (r2 != 0) goto L_0x0082;
    L_0x0063:
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r2 = r2.append(r1);
        r3 = ", but corresponding CameraCapabilities is null";
        r2 = r2.append(r3);
        r1 = r2.toString();
        r2 = TAG;
        com.android.camera.log.Log.d(r2, r1);
        r2 = 231; // 0xe7 float:3.24E-43 double:1.14E-321;
        r7.onCameraOpenFailed(r2, r1);
        goto L_0x0008;
    L_0x0082:
        r2 = TAG;
        com.android.camera.log.Log.d(r2, r1);
        r7.onCameraOpenSuccess();
        goto L_0x0008;
    L_0x008c:
        r2 = r7.mCamera2Device;
        if (r2 == 0) goto L_0x00a4;
    L_0x0090:
        r7.setManagerState(r6);
        r2 = TAG;
        r3 = "close start";
        com.android.camera.log.Log.e(r2, r3);
        r2 = r7.mCamera2Device;
        r2.close();
        r7.mCamera2Device = r4;
        goto L_0x0008;
    L_0x00a4:
        r2 = r7.getManagerState();
        if (r2 != r5) goto L_0x0008;
    L_0x00aa:
        r2 = 3;
        r7.setManagerState(r2);	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r2 = "OpenManager:";
        r3 = "open start";
        com.android.camera.log.Log.e(r2, r3);	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r2 = r7.mCamera2Service;	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r3 = r7.mPendingCameraId;	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r3 = java.lang.String.valueOf(r3);	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r4 = r7.mCameraOpenCallback;	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r5 = r7.mCameraHandler;	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        r2.openCamera(r3, r4, r5);	 Catch:{ CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8, CameraAccessException -> 0x00c8 }
        goto L_0x0008;
    L_0x00c8:
        r0 = move-exception;
        r0.printStackTrace();
        r2 = r0.getClass();
        r2 = r2.getSimpleName();
        r3 = 230; // 0xe6 float:3.22E-43 double:1.136E-321;
        r7.onCameraOpenFailed(r3, r2);
        r2 = TAG;
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r4 = "openCamera: failed to open camera ";
        r3 = r3.append(r4);
        r4 = r7.mPendingCameraId;
        r4 = r4.get();
        r3 = r3.append(r4);
        r3 = r3.toString();
        com.android.camera.log.Log.e(r2, r3, r0);
        goto L_0x0008;
    L_0x00fa:
        r2 = r7.mCamera2Device;
        if (r2 != 0) goto L_0x0105;
    L_0x00fe:
        r2 = r7.mCameraHandler;
        r2.sendEmptyMessage(r5);
        goto L_0x0008;
    L_0x0105:
        r2 = r7.getManagerState();
        if (r2 != r5) goto L_0x0008;
    L_0x010b:
        r7.setManagerState(r6);
        r2 = TAG;
        r3 = "force close start";
        com.android.camera.log.Log.e(r2, r3);
        r2 = r7.mCamera2Device;
        r2.releasePreview();
        r2 = r7.mCamera2Device;
        r2.resetConfigs();
        r2 = r7.mCamera2Device;
        r2.close();
        r7.mCamera2Device = r4;
        goto L_0x0008;
    L_0x0129:
        r2 = TAG;
        r3 = "close finish";
        com.android.camera.log.Log.e(r2, r3);
        r7.setManagerState(r5);
        r2 = r7.mCameraHandler;
        r2.sendEmptyMessage(r5);
        goto L_0x0008;
    L_0x013b:
        r2 = TAG;
        r3 = "open finish";
        com.android.camera.log.Log.e(r2, r3);
        r7.setManagerState(r5);
        r2 = r7.mCameraHandler;
        r2.sendEmptyMessage(r5);
        goto L_0x0008;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.loader.camera2.Camera2OpenManager.onMessage(android.os.Message):void");
    }

    private void setManagerState(@ManagerState int newState) {
        this.mCurrentState = newState;
    }

    @ManagerState
    private int getManagerState() {
        return this.mCurrentState;
    }

    private void onCameraOpenSuccess() {
        setManagerState(1);
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(2));
                this.mCameraResultEmitter.onComplete();
            }
        }
    }

    private void onCameraOpenFailed(int error, String msg) {
        Log.e(TAG, "onCameraOpenFailed: " + error + " msg:" + msg);
        setManagerState(1);
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(3).setCameraError(error));
                this.mCameraResultEmitter.onComplete();
            }
        }
    }
}
