package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.location.Location;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.MotionEventCompat;
import android.text.format.DateFormat;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.PanoUtil;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.android.camera.panorama.MorphoPanoramaGP;
import com.android.camera.panorama.MorphoPanoramaGP.InitParam;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$DualController;
import com.android.camera.protocol.ModeProtocol$PanoramaProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@TargetApi(21)
public class PanoramaModule extends BaseModule implements PictureCallback, ModeProtocol$CameraAction, CameraPreviewCallback, PreviewCallback {
    private static final String TAG = PanoramaModule.class.getSimpleName();
    private static int sSaveOutputType = 1;
    private final boolean DUMP_JPEG = false;
    private int MAX_DST_IMG_WIDTH = 30000;
    private final boolean USE_MULTI_THREAD = true;
    private int mAppDeviceRotation = 0;
    private int mAppPanoramaDirection = 0;
    private int mAppPanoramaDirectionSettings = 0;
    private int mAttachPosOffsetX;
    private int mAttachPosOffsetY;
    private ArrayList<CaptureInfo> mCaptureInfoList = new ArrayList();
    private boolean mCaptureOrientationDecided = false;
    private int mCntProcessed = 0;
    private int mCntReqShoot = 0;
    private int mDeviceOrientationAtCapture;
    private int[] mDirection = new int[1];
    private Bitmap mDispPreviewImage;
    private float mFrameRatio;
    private int[] mImageID = new int[1];
    private final Object mImageSyncObj = new Object();
    private InitParam mInitParam;
    private boolean mIsShooting = false;
    private Location mLocation;
    protected final Handler mMainHandler = new MainHandler(this, null);
    private MorphoPanoramaGP mMorphoPanoramaGP;
    private byte[] mMotionData = new byte[256];
    private int mMotionlessThreshold = 32768;
    private int[] mMoveSpeed = new int[1];
    private long mPanoramaShootingStartTime;
    private int mPreViewScaleHeight;
    private int mPrevDirection;
    private int mPreviewCount;
    private int mPreviewCroppingAdjustByAuto = 0;
    private final int mPreviewCroppingRatio = 10;
    private float mPreviewDisplayRatio;
    private Bitmap mPreviewImage;
    private int mPreviewRefY;
    private int mPreviewSkipCount;
    private boolean mRequestTakePicture = false;
    private SaveOutputImageTask mSaveOutputImageTask;
    private int mSnapshotFocusMode = 1;
    private int[] mStatus = new int[1];
    private ArrayList<StillImageData> mStillProcList;
    private StillProcTask mStillProcTask = null;
    private final Object mSyncObj = new Object();
    private int mTargetFocusMode = 4;
    private long mTimeTaken;
    private int mUseImage = 0;
    private boolean mUseSensorAWF = false;
    private int mUseSensorThreshold = 0;
    private int mUseThreshold = 10;
    private AsyncTask<Void, Void, Void> mWaitProcessorTask;

    class CaptureInfo {
        int mId;
        int mStatus;

        public CaptureInfo(int id, int status) {
            this.mId = id;
            this.mStatus = status;
        }
    }

    private class MainHandler extends Handler {
        /* synthetic */ MainHandler(PanoramaModule this$0, MainHandler -this1) {
            this();
        }

        private MainHandler() {
        }

        public void handleMessage(Message msg) {
            if (!PanoramaModule.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (PanoramaModule.this.getActivity() != null) {
                switch (msg.what) {
                    case 2:
                        break;
                    case 8:
                        PanoramaModule.this.mMainProtocol.setPreviewAspectRatio(CameraSettings.getPreviewAspectRatio(PanoramaModule.this.mPreviewSize.width, PanoramaModule.this.mPreviewSize.height));
                        break;
                    case 9:
                        sendEmptyMessageDelayed(22, 100);
                        int style = CameraSettings.getUIStyleByPreview(PanoramaModule.this.mPreviewSize.width, PanoramaModule.this.mPreviewSize.height);
                        if (style != PanoramaModule.this.mUIStyle) {
                            PanoramaModule.this.mUIStyle = style;
                        }
                        PanoramaModule.this.initPreviewLayout();
                        PanoramaModule.this.enableCameraControls(true);
                        break;
                    case 10:
                        PanoramaModule.this.mOpenCameraFail = true;
                        PanoramaModule.this.onCameraException();
                        break;
                    case MotionEventCompat.AXIS_LTRIGGER /*17*/:
                        PanoramaModule.this.mMainHandler.removeMessages(17);
                        PanoramaModule.this.mMainHandler.removeMessages(2);
                        PanoramaModule.this.getWindow().addFlags(128);
                        PanoramaModule.this.mMainHandler.sendEmptyMessageDelayed(2, (long) PanoramaModule.this.getScreenDelay());
                        break;
                    case MotionEventCompat.AXIS_GAS /*22*/:
                        PanoramaModule.this.mActivity.setBlurFlag(false);
                        PanoramaModule.this.enableCameraControls(true);
                        break;
                    case MotionEventCompat.AXIS_GENERIC_14 /*45*/:
                        PanoramaModule.this.setActivity(null);
                        break;
                    case 51:
                        if (!PanoramaModule.this.mActivity.isActivityPaused()) {
                            PanoramaModule.this.mOpenCameraFail = true;
                            PanoramaModule.this.onCameraException();
                            break;
                        }
                        break;
                    case 53:
                        PanoramaModule.this.resetUI();
                        break;
                    default:
                        if (!PanoramaModule.DEBUG) {
                            Log.e(PanoramaModule.TAG, "no consumer for this message: " + msg.what);
                            break;
                        }
                        throw new RuntimeException("no consumer for this message: " + msg.what);
                }
                PanoramaModule.this.getWindow().clearFlags(128);
            }
        }
    }

    private class SaveOutputImageTask extends AsyncTask<Void, Integer, Integer> {
        boolean mSaveImage;
        int saveType = 9;
        long start_time;

        SaveOutputImageTask(Context context, boolean SaveImage) {
            this.mSaveImage = SaveImage;
        }

        protected Integer doInBackground(Void... params) {
            Log.v(PanoramaModule.TAG, "doInBackground>>");
            PanoramaModule.this.finishAttachStillImageTask();
            int ret = PanoramaModule.this.mMorphoPanoramaGP.end();
            Log.d(PanoramaModule.TAG, String.format("end() -> 0x%x saveImage=%b", new Object[]{Integer.valueOf(ret), Boolean.valueOf(this.mSaveImage)}));
            if (this.mSaveImage) {
                if (ret != 0) {
                    Log.e(PanoramaModule.TAG, String.format("end() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
                }
                Rect finalImageRect = new Rect();
                if ((PanoramaModule.sSaveOutputType & 2) > 0) {
                    finalImageRect.setEmpty();
                    if (PanoramaModule.this.mMorphoPanoramaGP.getBoundingRect(finalImageRect) != 0) {
                        Log.e(PanoramaModule.TAG, String.format("getBoundingRect() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
                    }
                    PanoramaModule.this.saveOutputJpeg(PanoramaModule.this.createNameString(PanoramaModule.this.mTimeTaken, 2), finalImageRect);
                }
                if ((PanoramaModule.sSaveOutputType & 1) > 0) {
                    finalImageRect.setEmpty();
                    if (PanoramaModule.this.mMorphoPanoramaGP.getClippingRect(finalImageRect) != 0) {
                        Log.e(PanoramaModule.TAG, String.format("getClippingRect() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
                    }
                    PanoramaModule.this.saveOutputJpeg(PanoramaModule.this.createNameString(PanoramaModule.this.mTimeTaken, 1), finalImageRect);
                }
            }
            Log.v(PanoramaModule.TAG, "doInBackground<<");
            return null;
        }

        protected void onPreExecute() {
            this.start_time = System.currentTimeMillis();
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).updateLoading(false);
        }

        protected void onPostExecute(Integer result) {
            Log.v(PanoramaModule.TAG, "onPostExecute");
            PanoramaModule.this.mMorphoPanoramaGP.finish();
            PanoramaModule.this.mMorphoPanoramaGP = null;
            synchronized (PanoramaModule.this.mImageSyncObj) {
                PanoramaModule.this.mIsShooting = false;
                PanoramaModule.this.mImageSyncObj.notify();
            }
            Log.d(PanoramaModule.TAG, "PanoramaFinish done");
            if (PanoramaModule.this.isCreated()) {
                ModeProtocol$PanoramaProtocol panorama = (ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
                if (panorama != null) {
                    panorama.setDisplayPreviewBitmap(null);
                }
                if (PanoramaModule.this.mDispPreviewImage != null) {
                    PanoramaModule.this.mDispPreviewImage.eraseColor(0);
                }
                if (!PanoramaModule.this.mPaused) {
                    PanoramaModule.this.mActivity.getThumbnailUpdater().updateThumbnailView(true);
                }
                if (PanoramaModule.this.mCamera2Device != null) {
                    if (PanoramaModule.this.mAeLockSupported) {
                        PanoramaModule.this.mCamera2Device.setAELock(false);
                    }
                    if (PanoramaModule.this.mAwbLockSupported) {
                        PanoramaModule.this.mCamera2Device.setAWBLock(false);
                    }
                    PanoramaModule.this.mCamera2Device.setFocusMode(PanoramaModule.this.mTargetFocusMode);
                    PanoramaModule.this.resetToPreview();
                    PanoramaModule.this.enableCameraControls(true);
                }
                Log.d(PanoramaModule.TAG, String.format(Locale.ENGLISH, "[MORTIME] PanoramaFinish time = %d", new Object[]{Long.valueOf(System.currentTimeMillis() - this.start_time)}));
            }
        }
    }

    private class StillImageData {
        public int mId;
        public ByteBuffer mImage;
        public ByteBuffer mMotionData;

        StillImageData(int imageId, int previewCnt, byte[] stillImage, byte[] motionData) {
            this.mId = imageId;
            this.mImage = PanoUtil.createByteBuffer(stillImage);
            this.mMotionData = PanoUtil.createByteBuffer(motionData);
        }
    }

    public class StillProcTask extends Thread {
        private int shootCount = 0;

        /* JADX WARNING: Missing block: B:45:0x0138, code:
            if (com.android.camera.module.PanoramaModule.-get5(r8.this$0).size() <= 0) goto L_0x016e;
     */
        /* JADX WARNING: Missing block: B:46:0x013a, code:
            r0 = (com.android.camera.module.PanoramaModule.StillImageData) com.android.camera.module.PanoramaModule.-get5(r8.this$0).remove(0);
            com.android.camera.panorama.NativeMemoryAllocator.freeBuffer(r0.mImage);
            com.android.camera.panorama.NativeMemoryAllocator.freeBuffer(r0.mMotionData);
            com.android.camera.module.PanoramaModule.-wrap1(r8.this$0);
     */
        /* JADX WARNING: Missing block: B:53:0x016e, code:
            com.android.camera.log.Log.v(com.android.camera.module.PanoramaModule.-get0(), "StillProcTask<<" + r8);
     */
        /* JADX WARNING: Missing block: B:54:0x0189, code:
            return;
     */
        public void run() {
            /*
            r8 = this;
            r7 = 0;
            r3 = com.android.camera.module.PanoramaModule.TAG;
            r4 = new java.lang.StringBuilder;
            r4.<init>();
            r5 = "StillProcTask>>";
            r4 = r4.append(r5);
            r4 = r4.append(r8);
            r4 = r4.toString();
            com.android.camera.log.Log.v(r3, r4);
        L_0x001c:
            r0 = 0;
            r3 = com.android.camera.module.PanoramaModule.this;
            r4 = r3.mImageSyncObj;
            monitor-enter(r4);
        L_0x0024:
            r3 = com.android.camera.module.PanoramaModule.this;	 Catch:{ all -> 0x0077 }
            r3 = r3.mIsShooting;	 Catch:{ all -> 0x0077 }
            if (r3 == 0) goto L_0x007a;
        L_0x002c:
            r3 = com.android.camera.module.PanoramaModule.this;	 Catch:{ all -> 0x0077 }
            r3 = r3.mStillProcList;	 Catch:{ all -> 0x0077 }
            r3 = r3.size();	 Catch:{ all -> 0x0077 }
            if (r3 != 0) goto L_0x007a;
        L_0x0038:
            r3 = com.android.camera.module.PanoramaModule.TAG;	 Catch:{ InterruptedException -> 0x0056 }
            r5 = "StillProcTask waiting>>";
            com.android.camera.log.Log.v(r3, r5);	 Catch:{ InterruptedException -> 0x0056 }
            r3 = com.android.camera.module.PanoramaModule.this;	 Catch:{ InterruptedException -> 0x0056 }
            r3 = r3.mImageSyncObj;	 Catch:{ InterruptedException -> 0x0056 }
            r3.wait();	 Catch:{ InterruptedException -> 0x0056 }
            r3 = com.android.camera.module.PanoramaModule.TAG;	 Catch:{ InterruptedException -> 0x0056 }
            r5 = "StillProcTask waiting<<";
            com.android.camera.log.Log.v(r3, r5);	 Catch:{ InterruptedException -> 0x0056 }
            goto L_0x0024;
        L_0x0056:
            r1 = move-exception;
            r3 = com.android.camera.module.PanoramaModule.TAG;	 Catch:{ all -> 0x0077 }
            r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0077 }
            r5.<init>();	 Catch:{ all -> 0x0077 }
            r6 = "StillProcTask: ";
            r5 = r5.append(r6);	 Catch:{ all -> 0x0077 }
            r6 = r1.getMessage();	 Catch:{ all -> 0x0077 }
            r5 = r5.append(r6);	 Catch:{ all -> 0x0077 }
            r5 = r5.toString();	 Catch:{ all -> 0x0077 }
            com.android.camera.log.Log.e(r3, r5);	 Catch:{ all -> 0x0077 }
            goto L_0x0024;
        L_0x0077:
            r3 = move-exception;
            monitor-exit(r4);
            throw r3;
        L_0x007a:
            r3 = com.android.camera.module.PanoramaModule.this;	 Catch:{ all -> 0x0077 }
            r3 = r3.mStillProcList;	 Catch:{ all -> 0x0077 }
            r3 = r3.size();	 Catch:{ all -> 0x0077 }
            if (r3 <= 0) goto L_0x0093;
        L_0x0086:
            r3 = com.android.camera.module.PanoramaModule.this;	 Catch:{ all -> 0x0077 }
            r3 = r3.mStillProcList;	 Catch:{ all -> 0x0077 }
            r5 = 0;
            r0 = r3.remove(r5);	 Catch:{ all -> 0x0077 }
            r0 = (com.android.camera.module.PanoramaModule.StillImageData) r0;	 Catch:{ all -> 0x0077 }
        L_0x0093:
            monitor-exit(r4);
            if (r0 == 0) goto L_0x0114;
        L_0x0096:
            r3 = com.android.camera.module.PanoramaModule.TAG;
            r4 = new java.lang.StringBuilder;
            r4.<init>();
            r5 = "attachStillImageExt() start: ";
            r4 = r4.append(r5);
            r5 = r0.mId;
            r4 = r4.append(r5);
            r4 = r4.toString();
            com.android.camera.log.Log.d(r3, r4);
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mMorphoPanoramaGP;
            if (r3 != 0) goto L_0x0156;
        L_0x00bb:
            r2 = -1073741824; // 0xffffffffc0000000 float:-2.0 double:NaN;
        L_0x00bd:
            if (r2 == 0) goto L_0x00e8;
        L_0x00bf:
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mActivity;
            if (r3 == 0) goto L_0x00e8;
        L_0x00c5:
            r3 = com.android.camera.module.PanoramaModule.TAG;
            r4 = "attachStillImageExt() -> 0x%x";
            r5 = 1;
            r5 = new java.lang.Object[r5];
            r6 = java.lang.Integer.valueOf(r2);
            r5[r7] = r6;
            r4 = java.lang.String.format(r4, r5);
            com.android.camera.log.Log.e(r3, r4);
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mActivity;
            r4 = new com.android.camera.module.PanoramaModule$StillProcTask$1;
            r4.<init>();
            r3.runOnUiThread(r4);
        L_0x00e8:
            r3 = r8.shootCount;
            if (r3 != 0) goto L_0x00ff;
        L_0x00ec:
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mMorphoPanoramaGP;
            if (r3 == 0) goto L_0x00ff;
        L_0x00f4:
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mMorphoPanoramaGP;
            r4 = r0.mImage;
            r3.attachSetJpegForCopyingExif(r4);
        L_0x00ff:
            r3 = r8.shootCount;
            r3 = r3 + 1;
            r8.shootCount = r3;
            r3 = r0.mImage;
            com.android.camera.panorama.NativeMemoryAllocator.freeBuffer(r3);
            r3 = r0.mMotionData;
            com.android.camera.panorama.NativeMemoryAllocator.freeBuffer(r3);
            r3 = com.android.camera.module.PanoramaModule.this;
            r3.addProcessedCount();
        L_0x0114:
            r3 = com.android.camera.module.PanoramaModule.this;
            r4 = r3.mSyncObj;
            monitor-enter(r4);
            r3 = com.android.camera.module.PanoramaModule.this;	 Catch:{ all -> 0x016b }
            r3 = r3.mIsShooting;	 Catch:{ all -> 0x016b }
            if (r3 != 0) goto L_0x0168;
        L_0x0123:
            r3 = com.android.camera.module.PanoramaModule.TAG;	 Catch:{ all -> 0x016b }
            r5 = "StillProcTask: exiting";
            com.android.camera.log.Log.d(r3, r5);	 Catch:{ all -> 0x016b }
            monitor-exit(r4);
        L_0x012e:
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mStillProcList;
            r3 = r3.size();
            if (r3 <= 0) goto L_0x016e;
        L_0x013a:
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mStillProcList;
            r0 = r3.remove(r7);
            r0 = (com.android.camera.module.PanoramaModule.StillImageData) r0;
            r3 = r0.mImage;
            com.android.camera.panorama.NativeMemoryAllocator.freeBuffer(r3);
            r3 = r0.mMotionData;
            com.android.camera.panorama.NativeMemoryAllocator.freeBuffer(r3);
            r3 = com.android.camera.module.PanoramaModule.this;
            r3.addProcessedCount();
            goto L_0x012e;
        L_0x0156:
            r3 = com.android.camera.module.PanoramaModule.this;
            r3 = r3.mMorphoPanoramaGP;
            r4 = r0.mImage;
            r5 = r0.mId;
            r6 = r0.mMotionData;
            r2 = r3.attachStillImageExt(r4, r5, r6);
            goto L_0x00bd;
        L_0x0168:
            monitor-exit(r4);
            goto L_0x001c;
        L_0x016b:
            r3 = move-exception;
            monitor-exit(r4);
            throw r3;
        L_0x016e:
            r3 = com.android.camera.module.PanoramaModule.TAG;
            r4 = new java.lang.StringBuilder;
            r4.<init>();
            r5 = "StillProcTask<<";
            r4 = r4.append(r5);
            r4 = r4.append(r8);
            r4 = r4.toString();
            com.android.camera.log.Log.v(r3, r4);
            return;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.PanoramaModule.StillProcTask.run():void");
        }
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 174, 164);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
    }

    public void onPreviewSizeChanged(int width, int height) {
    }

    public void onPreviewSessionSuccess(CameraCaptureSession session) {
        if (session != null && isAlive()) {
            updatePreferenceInWorkThread(UpdateConstant.PANORAMA_ON_PREVIEW_SUCCESS);
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession session) {
        this.mMainHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession session) {
    }

    public void onCreate(int moduleIndex, int cameraId) {
        super.onCreate(moduleIndex, cameraId);
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        onCameraOpened();
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        checkDisplayOrientation();
        updatePreferenceTrampoline(UpdateConstant.PANORAMA_TYPES_INIT);
        this.mMainHandler.sendEmptyMessage(8);
        startSession();
        this.mMainHandler.sendEmptyMessage(9);
        Log.v(TAG, "SetupCameraThread done");
        setCameraState(1);
    }

    private void initializeMiscControls() {
        this.mStillProcList = new ArrayList();
        this.mFrameRatio = ((float) this.mPreViewScaleHeight) / ((this.mActivity.getResources().getDimension(R.dimen.pano_preview_hint_frame_height) * 100.0f) / 80.0f);
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra("from_where", 166);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void closeCamera() {
        setCameraState(0);
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setErrorCallback(null);
            this.mCamera2Device.stopPreviewCallback(true);
            this.mCamera2Device = null;
        }
    }

    private void setupCaptureParams() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "camera device is not ready");
            return;
        }
        this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
        this.mCamera2Device.setZoomRatio(1.0f);
        this.mCamera2Device.setFlashMode(0);
        String antiBanding = CameraSettings.getAntiBanding();
        this.mCamera2Device.setAntiBanding(Integer.valueOf(antiBanding).intValue());
        Log.d(TAG, "antiBanding=" + antiBanding);
        this.mCamera2Device.setEnableZsl(true);
        this.mCamera2Device.setHHT(false);
        this.mCamera2Device.setEnableOIS(false);
        this.mCamera2Device.setTimeWaterMarkEnable(false);
        this.mCamera2Device.setFaceWaterMarkEnable(false);
    }

    public void consumePreference(@UpdateType int... updateTypes) {
        for (int type : updateTypes) {
            switch (type) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case MotionEventCompat.AXIS_DISTANCE /*24*/:
                    setZoomRatio(getZoomValue());
                    break;
                case 32:
                    setupCaptureParams();
                    break;
                default:
                    if (!DEBUG) {
                        Log.w(TAG, "no consumer for this updateType: " + type);
                        break;
                    }
                    throw new RuntimeException("no consumer for this updateType: " + type);
            }
        }
    }

    protected boolean isZoomEnabled() {
        return false;
    }

    private void updatePictureAndPreviewSize() {
        double scale;
        CameraSize pictureSize = getBestPanoPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256));
        CameraSize previewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(pictureSize.width, pictureSize.height));
        this.mPictureSize = pictureSize;
        this.mPreviewSize = previewSize;
        Log.d(TAG, "pictureSize= " + pictureSize + " previewSize=" + previewSize);
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        if (this.mPreviewSize.getHeight() < this.mPreviewSize.getWidth()) {
            scale = ((double) this.mPreviewSize.getWidth()) / ((double) this.mPreviewSize.getHeight());
        } else {
            scale = ((double) this.mPreviewSize.getHeight()) / ((double) this.mPreviewSize.getWidth());
        }
        this.mPreViewScaleHeight = (int) (((double) Util.sWindowWidth) * scale);
        initializeMiscControls();
    }

    protected CameraSize getBestPanoPictureSize(List<CameraSize> supportedSizes) {
        PictureSizeManager.initialize(supportedSizes, 0);
        return PictureSizeManager.getBestPanoPictureSize();
    }

    private void initPreviewLayout() {
        if (isAlive()) {
            this.mActivity.getCameraScreenNail().setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            CameraScreenNail screen = this.mActivity.getCameraScreenNail();
            int screenWidth = screen.getWidth();
            int croppedScreenHeight = ((screen.getHeight() - (this.mPreviewCroppingAdjustByAuto * 2)) * 80) / 100;
            int height = this.mActivity.getResources().getDimensionPixelSize(R.dimen.pano_preview_hint_frame_height);
            ModeProtocol$PanoramaProtocol panorama = (ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
            panorama.initPreviewLayout((height * screenWidth) / croppedScreenHeight, height, this.mPreviewSize.width, this.mPreviewSize.height);
            if (!this.mActivity.getCameraScreenNail().isAnimationRunning()) {
                panorama.showSmallPreview(false);
            }
        }
    }

    protected void performVolumeKeyClicked(int repeatCount, boolean pressed) {
        if (repeatCount == 0 && pressed) {
            onShutterButtonClick(20);
        }
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        boolean z = false;
        if (this.mPaused) {
            return true;
        }
        switch (keyCode) {
            case MotionEventCompat.AXIS_BRAKE /*23*/:
                if (event.getRepeatCount() == 0) {
                    onShutterButtonClick(50);
                    return true;
                }
                break;
            case MotionEventCompat.AXIS_DISTANCE /*24*/:
            case MotionEventCompat.AXIS_TILT /*25*/:
            case 87:
            case 88:
                if (keyCode == 24) {
                    z = true;
                } else if (keyCode == 88) {
                    z = true;
                }
                if (handleVolumeKeyEvent(z, true, event.getRepeatCount())) {
                    return true;
                }
                break;
            case 27:
            case 66:
                if (event.getRepeatCount() == 0) {
                    if (!Util.isFingerPrintKeyEvent(event)) {
                        onShutterButtonClick(40);
                    } else if (CameraSettings.isFingerprintCaptureEnable()) {
                        onShutterButtonClick(30);
                    }
                    return true;
                }
                break;
        }
        return super.onKeyDown(keyCode, event);
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (this.mPaused) {
            return true;
        }
        switch (keyCode) {
            case 4:
                if (((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
                    return true;
                }
                break;
            case 27:
            case 66:
                return true;
        }
        return super.onKeyUp(keyCode, event);
    }

    /* JADX WARNING: Missing block: B:19:0x003d, code:
            return;
     */
    public void onShutterButtonClick(int r5) {
        /*
        r4 = this;
        r1 = r4.mPaused;
        if (r1 != 0) goto L_0x000a;
    L_0x0004:
        r1 = r4.getCameraState();
        if (r1 != 0) goto L_0x000b;
    L_0x000a:
        return;
    L_0x000b:
        r4.setTriggerMode(r5);
        r2 = r4.mSyncObj;
        monitor-enter(r2);
        r1 = r4.mIsShooting;	 Catch:{ all -> 0x0058 }
        if (r1 != 0) goto L_0x003e;
    L_0x0015:
        r1 = r4.mActivity;	 Catch:{ all -> 0x0058 }
        r1 = r1.getScreenHint();	 Catch:{ all -> 0x0058 }
        r1.updateHint();	 Catch:{ all -> 0x0058 }
        r1 = com.android.camera.storage.Storage.isLowStorageAtLastPoint();	 Catch:{ all -> 0x0058 }
        if (r1 == 0) goto L_0x0035;
    L_0x0024:
        r1 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();	 Catch:{ all -> 0x0058 }
        r3 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        r0 = r1.getAttachProtocol(r3);	 Catch:{ all -> 0x0058 }
        r0 = (com.android.camera.protocol.ModeProtocol$ActionProcessing) r0;	 Catch:{ all -> 0x0058 }
        r0.processingFailed();	 Catch:{ all -> 0x0058 }
        monitor-exit(r2);
        return;
    L_0x0035:
        r1 = 2;
        r4.playCameraSound(r1);	 Catch:{ all -> 0x0058 }
        r4.startPanoramaShooting();	 Catch:{ all -> 0x0058 }
    L_0x003c:
        monitor-exit(r2);
        return;
    L_0x003e:
        r1 = r4.isShootingTooShort();	 Catch:{ all -> 0x0058 }
        if (r1 == 0) goto L_0x004e;
    L_0x0044:
        r1 = TAG;	 Catch:{ all -> 0x0058 }
        r3 = "panorama shooting is too short, ignore this click";
        com.android.camera.log.Log.w(r1, r3);	 Catch:{ all -> 0x0058 }
        monitor-exit(r2);
        return;
    L_0x004e:
        r1 = 3;
        r4.playCameraSound(r1);	 Catch:{ all -> 0x0058 }
        r1 = 1;
        r3 = 1;
        r4.stopPanoramaShooting(r1, r3);	 Catch:{ all -> 0x0058 }
        goto L_0x003c;
    L_0x0058:
        r1 = move-exception;
        monitor-exit(r2);
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.PanoramaModule.onShutterButtonClick(int):void");
    }

    private boolean isShootingTooShort() {
        return SystemClock.elapsedRealtime() - this.mPanoramaShootingStartTime < 600;
    }

    public boolean onShutterButtonLongClick() {
        return false;
    }

    public void onShutterButtonLongClickCancel(boolean in) {
        onShutterButtonFocus(false, 2);
    }

    public boolean isDoingAction() {
        return isProcessingFinishTask();
    }

    public void onShutterButtonFocus(boolean pressed, int from) {
    }

    /* JADX WARNING: Missing block: B:9:0x0017, code:
            return true;
     */
    public boolean onBackPressed() {
        /*
        r3 = this;
        r2 = 1;
        r1 = r3.mSyncObj;
        monitor-enter(r1);
        r0 = r3.mIsShooting;	 Catch:{ all -> 0x001b }
        if (r0 == 0) goto L_0x0018;
    L_0x0008:
        r0 = r3.isProcessingFinishTask();	 Catch:{ all -> 0x001b }
        if (r0 != 0) goto L_0x0016;
    L_0x000e:
        r0 = 3;
        r3.playCameraSound(r0);	 Catch:{ all -> 0x001b }
        r0 = 1;
        r3.stopPanoramaShooting(r0);	 Catch:{ all -> 0x001b }
    L_0x0016:
        monitor-exit(r1);
        return r2;
    L_0x0018:
        monitor-exit(r1);
        r0 = 0;
        return r0;
    L_0x001b:
        r0 = move-exception;
        monitor-exit(r1);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.PanoramaModule.onBackPressed():boolean");
    }

    @OnClickAttr
    public void onThumbnailClicked(View v) {
        if (!this.mPaused && !isProcessingFinishTask() && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    public void onReviewDoneClicked() {
    }

    public void onReviewCancelClicked() {
    }

    private void resetUI() {
        ((ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).resetShootUI();
        ModeProtocol$DualController dualController = (ModeProtocol$DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.showZoomButton();
        }
        showSmallPreview(false);
    }

    private void showSmallPreview(boolean animation) {
        if (this.mMorphoPanoramaGP == null) {
            ((ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).showSmallPreview(animation);
        }
    }

    private void resetToPreview() {
        if (((ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).isShown()) {
            resetUI();
        }
        if (!this.mPaused) {
            boolean isZslMode = isZslMode();
            startPreview();
        }
    }

    public void onResume() {
        super.onResume();
        keepScreenOnAwhile();
    }

    public void setFrameAvailable(boolean available) {
        super.setFrameAvailable(available);
        if (CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(2);
            this.mActivity.loadCameraSound(3);
        }
    }

    public void onPause() {
        super.onPause();
        synchronized (this.mSyncObj) {
            if (this.mIsShooting) {
                playCameraSound(3);
                stopPanoramaShooting(true);
            }
            if (this.mCntReqShoot > this.mCntProcessed) {
                this.mCntReqShoot = this.mCntProcessed;
                this.mSyncObj.notify();
            }
            if (this.mPreviewImage != null) {
                this.mPreviewImage.recycle();
                this.mPreviewImage = null;
            }
            if (this.mDispPreviewImage != null) {
                this.mDispPreviewImage.recycle();
                this.mDispPreviewImage = null;
            }
        }
        releaseResources();
        if (this.mWaitProcessorTask != null) {
            this.mWaitProcessorTask.cancel(true);
            this.mWaitProcessorTask = null;
        }
        resetScreenOn();
        this.mMainHandler.removeCallbacksAndMessages(null);
    }

    public void onStop() {
        super.onStop();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mMainHandler.sendEmptyMessage(45);
    }

    public void startSession() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "startPreview: camera has been closed");
            return;
        }
        int i;
        this.mCamera2Device.setErrorCallback(this.mErrorCallback);
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        this.mCamera2Device.setPictureSize(this.mPictureSize);
        boolean panorama = !Device.IS_E2 ? Device.IS_E10 : true;
        Camera2Proxy camera2Proxy = this.mCamera2Device;
        Surface surface = new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture());
        if (panorama) {
            i = 32776;
        } else {
            i = 0;
        }
        camera2Proxy.startPreviewSession(surface, true, false, i, this);
    }

    public void startPreview() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "startPreview: camera has been closed");
            return;
        }
        checkDisplayOrientation();
        this.mCamera2Device.setDisplayOrientation(this.mCameraDisplayOrientation);
        if (this.mAeLockSupported) {
            this.mCamera2Device.setAELock(false);
        }
        if (this.mAwbLockSupported) {
            this.mCamera2Device.setAWBLock(false);
        }
        this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
        this.mCamera2Device.resumePreview();
        setCameraState(1);
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mCamera2Device.pausePreview();
        setCameraState(0);
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mCamera2Device.resumePreview();
        setCameraState(1);
    }

    private void resetScreenOn() {
        this.mMainHandler.removeMessages(17);
        this.mMainHandler.removeMessages(2);
    }

    private void keepScreenOnAwhile() {
        this.mMainHandler.sendEmptyMessageDelayed(17, 1000);
    }

    private void releaseResources() {
        closeCamera();
    }

    public void startPanoramaShooting() {
        Log.v(TAG, "startPanoramaShooting");
        if (!isProcessingFinishTask()) {
            startPanoramaGP();
            this.mPrevDirection = this.mInitParam.direction;
            this.mPreviewCount = -1;
            this.mCntReqShoot = 0;
            this.mCntProcessed = 0;
            this.mCaptureInfoList.clear();
            this.mTimeTaken = System.currentTimeMillis();
            this.mPreviewDisplayRatio = 0.0f;
            this.mPreviewSkipCount = 1;
            this.mDeviceOrientationAtCapture = this.mOrientationCompensation;
            this.mIsShooting = true;
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(true);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(true);
            }
            this.mLocation = LocationManager.instance().getCurrentLocation();
            this.mCamera2Device.setGpsLocation(this.mLocation);
            this.mCamera2Device.setFocusMode(this.mSnapshotFocusMode);
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
            this.mCamera2Device.setPictureSize(this.mPictureSize);
            this.mCamera2Device.startPreviewCallback(this);
            setShootUI();
            ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
            this.mPanoramaShootingStartTime = SystemClock.elapsedRealtime();
        }
    }

    private void setShootUI() {
        ((ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).setShootUI();
        ModeProtocol$DualController dualController = (ModeProtocol$DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideZoomButton();
        }
        keepScreenOnAwhile();
    }

    private boolean startPanoramaGP() {
        int i;
        ModeProtocol$PanoramaProtocol panorama = (ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
        if (this.mMorphoPanoramaGP == null) {
            float scale;
            InitParam initParam;
            int[] buff_size = new int[1];
            this.mMorphoPanoramaGP = new MorphoPanoramaGP();
            this.mInitParam = new InitParam();
            this.mInitParam.format = "YVU420_SEMIPLANAR";
            this.mInitParam.use_threshold = this.mUseThreshold;
            this.mInitParam.preview_width = this.mPreviewSize.width;
            this.mInitParam.preview_height = this.mPreviewSize.height;
            this.mInitParam.still_width = this.mPictureSize.width;
            this.mInitParam.still_height = this.mPictureSize.height;
            this.mInitParam.angle_of_view_degree = (double) this.mCameraCapabilities.getViewAngle(true);
            this.mInitParam.draw_cur_image = 0;
            int tmpDegrees = Util.getDisplayOrientation(Util.getDisplayRotation(this.mActivity), this.mBogusCameraId);
            this.mPreviewCroppingAdjustByAuto = 0;
            this.mAppPanoramaDirection = this.mAppPanoramaDirectionSettings;
            this.mInitParam.direction = CameraSettings.getPanoramaMoveDirection();
            this.mInitParam.dst_img_width = (int) (((float) this.mInitParam.still_height) * this.mFrameRatio);
            this.mInitParam.dst_img_height = this.mInitParam.still_width;
            this.mInitParam.preview_img_width = (int) (((float) this.mInitParam.preview_height) * this.mFrameRatio);
            this.mInitParam.preview_img_height = this.mInitParam.preview_width;
            switch (tmpDegrees) {
                case 270:
                    this.mInitParam.output_rotation = 270;
                    break;
                default:
                    this.mInitParam.output_rotation = 90;
                    break;
            }
            this.mInitParam.preview_shrink_ratio = Math.max((this.mInitParam.preview_img_width / Util.sWindowWidth) - 1, 1);
            MorphoPanoramaGP.calcImageSize(this.mInitParam, 360.0d);
            if (this.MAX_DST_IMG_WIDTH < this.mInitParam.dst_img_width) {
                scale = ((float) this.MAX_DST_IMG_WIDTH) / ((float) this.mInitParam.dst_img_width);
                this.mInitParam.dst_img_width = this.MAX_DST_IMG_WIDTH;
                initParam = this.mInitParam;
                initParam.preview_img_width = (int) (((float) initParam.preview_img_width) * scale);
            }
            if (this.MAX_DST_IMG_WIDTH < this.mInitParam.dst_img_height) {
                scale = ((float) this.MAX_DST_IMG_WIDTH) / ((float) this.mInitParam.dst_img_height);
                this.mInitParam.dst_img_height = this.MAX_DST_IMG_WIDTH;
                initParam = this.mInitParam;
                initParam.preview_img_height = (int) (((float) initParam.preview_img_height) * scale);
            }
            initParam = this.mInitParam;
            initParam.preview_img_width &= -2;
            initParam = this.mInitParam;
            initParam.preview_img_height &= -2;
            if (this.mMorphoPanoramaGP.initialize(this.mInitParam, buff_size) != 0) {
                Log.e(TAG, String.format("initialize() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
            }
        }
        this.mMorphoPanoramaGP.setMotionlessThreshold(this.mMotionlessThreshold);
        this.mMorphoPanoramaGP.setUseSensorThreshold(this.mUseSensorThreshold);
        allocateDisplayBuffers(this.mAppDeviceRotation + this.mAppPanoramaDirection);
        MorphoPanoramaGP morphoPanoramaGP = this.mMorphoPanoramaGP;
        if (this.mUseSensorAWF) {
            i = 1;
        } else {
            i = 0;
        }
        if (morphoPanoramaGP.setUseSensorAssist(0, i) != 0) {
            Log.e(TAG, String.format("setUseSensorAssist() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
        }
        if (this.mMorphoPanoramaGP.start() == 0) {
            return true;
        }
        Log.e(TAG, String.format("start() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
        return false;
    }

    private void stopPanoramaShooting(boolean save_image) {
        stopPanoramaShooting(save_image, false);
    }

    private void stopPanoramaShooting(boolean save_image, boolean from_shutter_button) {
        Log.v(TAG, "stopPanoramaShooting: saveImage=" + save_image);
        keepScreenOnAwhile();
        if (this.mCamera2Device == null || this.mMorphoPanoramaGP == null) {
            Log.w(TAG, "panorama is stopped");
        } else if (isProcessingFinishTask()) {
            Log.e(TAG, "previous save task is on going");
        } else {
            this.mCaptureOrientationDecided = false;
            this.mCamera2Device.stopPreviewCallback(false);
            if (!save_image) {
                synchronized (this.mImageSyncObj) {
                    this.mIsShooting = false;
                    this.mImageSyncObj.notify();
                }
            }
            if (this.mPrevDirection == 0 || this.mPrevDirection == 1) {
                save_image = false;
            }
            this.mSaveOutputImageTask = new SaveOutputImageTask(this.mActivity, save_image);
            this.mSaveOutputImageTask.execute(new Void[0]);
            onStopShooting(save_image);
        }
    }

    private void onStopShooting(boolean succeed) {
        ModeProtocol$ActionProcessing processing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (succeed) {
            processing.processingFinish();
        } else {
            processing.processingFailed();
        }
        this.mMainHandler.sendEmptyMessage(53);
    }

    public void requestRender() {
        ModeProtocol$PanoramaProtocol panorama = (ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
        if (panorama != null) {
            panorama.requestRender();
        }
    }

    /* JADX WARNING: Missing block: B:15:0x003d, code:
            return;
     */
    public void onPreviewFrame(com.android.camera2.PreviewImageProp r27, com.android.camera2.Camera2Proxy r28) {
        /*
        r26 = this;
        r3 = r27.getData();
        r4 = TAG;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r5 = "onPreviewFrame>>len=";
        r5 = r2.append(r5);
        if (r3 == 0) goto L_0x0027;
    L_0x0014:
        r2 = r3.length;
    L_0x0015:
        r2 = r5.append(r2);
        r2 = r2.toString();
        com.android.camera.log.Log.v(r4, r2);
        r2 = r26.isAlive();
        if (r2 != 0) goto L_0x0029;
    L_0x0026:
        return;
    L_0x0027:
        r2 = -1;
        goto L_0x0015;
    L_0x0029:
        r0 = r26;
        r0 = r0.mSyncObj;
        r25 = r0;
        monitor-enter(r25);
        r0 = r26;
        r2 = r0.mMorphoPanoramaGP;	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x003c;
    L_0x0036:
        r2 = r26.isProcessingFinishTask();	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x003e;
    L_0x003c:
        monitor-exit(r25);
        return;
    L_0x003e:
        r0 = r26;
        r2 = r0.mPreviewSkipCount;	 Catch:{ all -> 0x0364 }
        if (r2 <= 0) goto L_0x0050;
    L_0x0044:
        r0 = r26;
        r2 = r0.mPreviewSkipCount;	 Catch:{ all -> 0x0364 }
        r2 = r2 + -1;
        r0 = r26;
        r0.mPreviewSkipCount = r2;	 Catch:{ all -> 0x0364 }
        monitor-exit(r25);
        return;
    L_0x0050:
        r2 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();	 Catch:{ all -> 0x0364 }
        r4 = 176; // 0xb0 float:2.47E-43 double:8.7E-322;
        r20 = r2.getAttachProtocol(r4);	 Catch:{ all -> 0x0364 }
        r20 = (com.android.camera.protocol.ModeProtocol$PanoramaProtocol) r20;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewCount;	 Catch:{ all -> 0x0364 }
        r2 = r2 + 1;
        r0 = r26;
        r0.mPreviewCount = r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mMoveSpeed;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r5 = 0;
        r2[r5] = r4;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mMorphoPanoramaGP;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mUseImage;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mImageID;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r6 = r0.mMotionData;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r7 = r0.mStatus;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r8 = r0.mPreviewImage;	 Catch:{ all -> 0x0364 }
        r9 = r27.getYLength();	 Catch:{ all -> 0x0364 }
        r10 = r27.getYStride();	 Catch:{ all -> 0x0364 }
        r11 = r27.getUVStride();	 Catch:{ all -> 0x0364 }
        r21 = r2.attachPreview(r3, r4, r5, r6, r7, r8, r9, r10, r11);	 Catch:{ all -> 0x0364 }
        if (r21 == 0) goto L_0x00ae;
    L_0x0098:
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = "attachPreview() -> 0x%x";
        r5 = 1;
        r5 = new java.lang.Object[r5];	 Catch:{ all -> 0x0364 }
        r6 = java.lang.Integer.valueOf(r21);	 Catch:{ all -> 0x0364 }
        r7 = 0;
        r5[r7] = r6;	 Catch:{ all -> 0x0364 }
        r4 = java.lang.String.format(r4, r5);	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.e(r2, r4);	 Catch:{ all -> 0x0364 }
    L_0x00ae:
        r0 = r26;
        r2 = r0.mStatus;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x00e1;
    L_0x00b7:
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0364 }
        r4.<init>();	 Catch:{ all -> 0x0364 }
        r5 = "attachPreview status=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mStatus;	 Catch:{ all -> 0x0364 }
        r6 = 0;
        r5 = r5[r6];	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r4 = r4.toString();	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.w(r2, r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mStatus;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        switch(r2) {
            case 4: goto L_0x0347;
            case 5: goto L_0x0357;
            case 6: goto L_0x034f;
            case 7: goto L_0x00e1;
            case 8: goto L_0x034f;
            case 9: goto L_0x034f;
            case 10: goto L_0x0347;
            default: goto L_0x00e1;
        };	 Catch:{ all -> 0x0364 }
    L_0x00e1:
        r0 = r26;
        r2 = r0.mMorphoPanoramaGP;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r21 = r2.getCurrentDirection(r4);	 Catch:{ all -> 0x0364 }
        if (r21 == 0) goto L_0x0105;
    L_0x00ef:
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = "getCurrentDirection() -> 0x%x";
        r5 = 1;
        r5 = new java.lang.Object[r5];	 Catch:{ all -> 0x0364 }
        r6 = java.lang.Integer.valueOf(r21);	 Catch:{ all -> 0x0364 }
        r7 = 0;
        r5[r7] = r6;	 Catch:{ all -> 0x0364 }
        r4 = java.lang.String.format(r4, r5);	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.e(r2, r4);	 Catch:{ all -> 0x0364 }
    L_0x0105:
        r0 = r26;
        r2 = r0.mPrevDirection;	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x03b5;
    L_0x010b:
        r0 = r26;
        r2 = r0.mPrevDirection;	 Catch:{ all -> 0x0364 }
        r4 = 1;
        if (r2 == r4) goto L_0x03b5;
    L_0x0112:
        r0 = r26;
        r2 = r0.mPrevDirection;	 Catch:{ all -> 0x0364 }
        r4 = 8;
        if (r2 == r4) goto L_0x03b5;
    L_0x011a:
        r0 = r26;
        r2 = r0.mPreviewImage;	 Catch:{ all -> 0x0364 }
        r24 = r2.getWidth();	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewImage;	 Catch:{ all -> 0x0364 }
        r22 = r2.getHeight();	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mDispPreviewImage;	 Catch:{ all -> 0x0364 }
        r17 = r2.getWidth();	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mDispPreviewImage;	 Catch:{ all -> 0x0364 }
        r15 = r2.getHeight();	 Catch:{ all -> 0x0364 }
        r13 = new android.graphics.Canvas;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mDispPreviewImage;	 Catch:{ all -> 0x0364 }
        r13.<init>(r2);	 Catch:{ all -> 0x0364 }
        r2 = android.graphics.PorterDuff.Mode.SRC;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r13.drawColor(r4, r2);	 Catch:{ all -> 0x0364 }
        r16 = new android.graphics.Rect;	 Catch:{ all -> 0x0364 }
        r2 = 0;
        r4 = 0;
        r0 = r16;
        r1 = r17;
        r0.<init>(r2, r4, r1, r15);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r2 = r2 * 2;
        r22 = r22 - r2;
        r23 = new android.graphics.Rect;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r4 = r22 * 10;
        r4 = r4 / 100;
        r2 = r2 + r4;
        r0 = r26;
        r4 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r5 = r22 * 90;
        r5 = r5 / 100;
        r4 = r4 + r5;
        r5 = 0;
        r0 = r23;
        r1 = r24;
        r0.<init>(r5, r2, r1, r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewImage;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r0 = r23;
        r1 = r16;
        r13.drawBitmap(r2, r0, r1, r4);	 Catch:{ all -> 0x0364 }
        r12 = new android.graphics.Point;	 Catch:{ all -> 0x0364 }
        r12.<init>();	 Catch:{ all -> 0x0364 }
        r18 = new android.graphics.Point;	 Catch:{ all -> 0x0364 }
        r18.<init>();	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mMorphoPanoramaGP;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r2.getGuidancePos(r12, r0);	 Catch:{ all -> 0x0364 }
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0364 }
        r4.<init>();	 Catch:{ all -> 0x0364 }
        r5 = "getGuidancePos attachedPos=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r12);	 Catch:{ all -> 0x0364 }
        r5 = " guidePos=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r4 = r4.append(r0);	 Catch:{ all -> 0x0364 }
        r4 = r4.toString();	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.v(r2, r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        switch(r2) {
            case 2: goto L_0x0367;
            case 3: goto L_0x0367;
            default: goto L_0x01c7;
        };	 Catch:{ all -> 0x0364 }
    L_0x01c7:
        r0 = r26;
        r2 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1));
        if (r2 != 0) goto L_0x01dd;
    L_0x01d0:
        r0 = r17;
        if (r0 >= r15) goto L_0x03a9;
    L_0x01d4:
        r2 = (float) r15;	 Catch:{ all -> 0x0364 }
        r0 = r22;
        r4 = (float) r0;	 Catch:{ all -> 0x0364 }
        r2 = r2 / r4;
    L_0x01d9:
        r0 = r26;
        r0.mPreviewDisplayRatio = r2;	 Catch:{ all -> 0x0364 }
    L_0x01dd:
        r0 = r24;
        r1 = r22;
        r2 = java.lang.Math.min(r0, r1);	 Catch:{ all -> 0x0364 }
        r2 = r2 / 2;
        r0 = r26;
        r0.mPreviewRefY = r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewRefY;	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x0209;
    L_0x01f1:
        r0 = r26;
        r2 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1));
        if (r2 == 0) goto L_0x0209;
    L_0x01fa:
        r0 = r26;
        r2 = r0.mPreviewRefY;	 Catch:{ all -> 0x0364 }
        r2 = (float) r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r2 = r2 * r4;
        r2 = (int) r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r0.mPreviewRefY = r2;	 Catch:{ all -> 0x0364 }
    L_0x0209:
        r2 = r12.x;	 Catch:{ all -> 0x0364 }
        r2 = (float) r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r2 = r2 * r4;
        r2 = (int) r2;	 Catch:{ all -> 0x0364 }
        r12.x = r2;	 Catch:{ all -> 0x0364 }
        r2 = r12.y;	 Catch:{ all -> 0x0364 }
        r2 = (float) r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r2 = r2 * r4;
        r2 = (int) r2;	 Catch:{ all -> 0x0364 }
        r12.y = r2;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r2 = r0.x;	 Catch:{ all -> 0x0364 }
        r2 = (float) r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r2 = r2 * r4;
        r2 = (int) r2;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r0.x = r2;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r2 = r0.y;	 Catch:{ all -> 0x0364 }
        r2 = (float) r2;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewDisplayRatio;	 Catch:{ all -> 0x0364 }
        r2 = r2 * r4;
        r2 = (int) r2;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r0.y = r2;	 Catch:{ all -> 0x0364 }
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0364 }
        r4.<init>();	 Catch:{ all -> 0x0364 }
        r5 = "change position with ratio Point=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r12);	 Catch:{ all -> 0x0364 }
        r5 = " ";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r4 = r4.append(r0);	 Catch:{ all -> 0x0364 }
        r5 = " output_rotation=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mInitParam;	 Catch:{ all -> 0x0364 }
        r5 = r5.output_rotation;	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r5 = " mDirection[0]=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r6 = 0;
        r5 = r5[r6];	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r4 = r4.toString();	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.v(r2, r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mMorphoPanoramaGP;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mMoveSpeed;	 Catch:{ all -> 0x0364 }
        r2.getMoveSpeed(r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mStatus;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        r4 = 5;
        if (r2 != r4) goto L_0x03b2;
    L_0x029b:
        r2 = 1;
    L_0x029c:
        r0 = r26;
        r4 = r0.mMoveSpeed;	 Catch:{ all -> 0x0364 }
        r5 = 0;
        r4 = r4[r5];	 Catch:{ all -> 0x0364 }
        r0 = r20;
        r0.setDirectionTooFast(r2, r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mPreviewRefY;	 Catch:{ all -> 0x0364 }
        r0 = r20;
        r0.setDirectionPosition(r12, r2);	 Catch:{ all -> 0x0364 }
        r26.onPreviewMoving();	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mCaptureOrientationDecided;	 Catch:{ all -> 0x0364 }
        if (r2 != 0) goto L_0x02bd;
    L_0x02ba:
        r26.onCaptureOrientationDecided();	 Catch:{ all -> 0x0364 }
    L_0x02bd:
        r0 = r26;
        r2 = r0.mDispPreviewImage;	 Catch:{ all -> 0x0364 }
        r0 = r20;
        r0.setDisplayPreviewBitmap(r2);	 Catch:{ all -> 0x0364 }
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0364 }
        r4.<init>();	 Catch:{ all -> 0x0364 }
        r5 = "onPreviewFrame: imageId=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mImageID;	 Catch:{ all -> 0x0364 }
        r6 = 0;
        r5 = r5[r6];	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r4 = r4.toString();	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.d(r2, r4);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2 = r0.mImageID;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        if (r2 < 0) goto L_0x031d;
    L_0x02ef:
        r14 = r3;
        r0 = r26;
        r2 = r0.mCaptureInfoList;	 Catch:{ all -> 0x0364 }
        r4 = new com.android.camera.module.PanoramaModule$CaptureInfo;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mImageID;	 Catch:{ all -> 0x0364 }
        r6 = 0;
        r5 = r5[r6];	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r6 = r0.mStatus;	 Catch:{ all -> 0x0364 }
        r7 = 0;
        r6 = r6[r7];	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4.<init>(r5, r6);	 Catch:{ all -> 0x0364 }
        r2.add(r4);	 Catch:{ all -> 0x0364 }
        r19 = new android.os.Handler;	 Catch:{ all -> 0x0364 }
        r19.<init>();	 Catch:{ all -> 0x0364 }
        r2 = new com.android.camera.module.PanoramaModule$1;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r2.<init>(r3);	 Catch:{ all -> 0x0364 }
        r0 = r19;
        r0.post(r2);	 Catch:{ all -> 0x0364 }
    L_0x031d:
        r0 = r26;
        r2 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r0.mPrevDirection = r2;	 Catch:{ all -> 0x0364 }
        r2 = TAG;	 Catch:{ all -> 0x0364 }
        r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0364 }
        r4.<init>();	 Catch:{ all -> 0x0364 }
        r5 = "onPreviewFrame<<prevDirection=";
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r5 = r0.mPrevDirection;	 Catch:{ all -> 0x0364 }
        r4 = r4.append(r5);	 Catch:{ all -> 0x0364 }
        r4 = r4.toString();	 Catch:{ all -> 0x0364 }
        com.android.camera.log.Log.v(r2, r4);	 Catch:{ all -> 0x0364 }
        monitor-exit(r25);
        return;
    L_0x0347:
        r2 = 1;
        r0 = r26;
        r0.stopPanoramaShooting(r2);	 Catch:{ all -> 0x0364 }
        monitor-exit(r25);
        return;
    L_0x034f:
        r2 = 1;
        r0 = r26;
        r0.stopPanoramaShooting(r2);	 Catch:{ all -> 0x0364 }
        monitor-exit(r25);
        return;
    L_0x0357:
        r0 = r26;
        r2 = r0.mMorphoPanoramaGP;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mMoveSpeed;	 Catch:{ all -> 0x0364 }
        r2.getMoveSpeed(r4);	 Catch:{ all -> 0x0364 }
        goto L_0x00e1;
    L_0x0364:
        r2 = move-exception;
        monitor-exit(r25);
        throw r2;
    L_0x0367:
        r0 = r26;
        r2 = r0.mInitParam;	 Catch:{ all -> 0x0364 }
        r2 = r2.output_rotation;	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x0379;
    L_0x036f:
        r0 = r26;
        r2 = r0.mInitParam;	 Catch:{ all -> 0x0364 }
        r2 = r2.output_rotation;	 Catch:{ all -> 0x0364 }
        r4 = 180; // 0xb4 float:2.52E-43 double:8.9E-322;
        if (r2 != r4) goto L_0x0391;
    L_0x0379:
        r2 = r12.y;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r2 = r2 - r4;
        r12.y = r2;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r2 = r0.y;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r2 = r2 - r4;
        r0 = r18;
        r0.y = r2;	 Catch:{ all -> 0x0364 }
        goto L_0x01c7;
    L_0x0391:
        r2 = r12.x;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r2 = r2 - r4;
        r12.x = r2;	 Catch:{ all -> 0x0364 }
        r0 = r18;
        r2 = r0.x;	 Catch:{ all -> 0x0364 }
        r0 = r26;
        r4 = r0.mPreviewCroppingAdjustByAuto;	 Catch:{ all -> 0x0364 }
        r2 = r2 - r4;
        r0 = r18;
        r0.x = r2;	 Catch:{ all -> 0x0364 }
        goto L_0x01c7;
    L_0x03a9:
        r0 = r17;
        r2 = (float) r0;	 Catch:{ all -> 0x0364 }
        r0 = r24;
        r4 = (float) r0;	 Catch:{ all -> 0x0364 }
        r2 = r2 / r4;
        goto L_0x01d9;
    L_0x03b2:
        r2 = 0;
        goto L_0x029c;
    L_0x03b5:
        r0 = r26;
        r2 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        if (r2 == 0) goto L_0x02bd;
    L_0x03be:
        r0 = r26;
        r2 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        r4 = 1;
        if (r2 == r4) goto L_0x02bd;
    L_0x03c8:
        r0 = r26;
        r2 = r0.mDirection;	 Catch:{ all -> 0x0364 }
        r4 = 0;
        r2 = r2[r4];	 Catch:{ all -> 0x0364 }
        r4 = 8;
        if (r2 == r4) goto L_0x02bd;
    L_0x03d3:
        r26.onCaptureOrientationDecided();	 Catch:{ all -> 0x0364 }
        goto L_0x02bd;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.PanoramaModule.onPreviewFrame(com.android.camera2.PreviewImageProp, com.android.camera2.Camera2Proxy):void");
    }

    private void addRequestCount() {
        synchronized (this.mSyncObj) {
            this.mCntReqShoot++;
            Log.v(TAG, "addRequestCount: req=" + this.mCntReqShoot);
            this.mSyncObj.notify();
        }
    }

    private void addProcessedCount() {
        synchronized (this.mSyncObj) {
            this.mCntProcessed++;
            Log.v(TAG, "addProcessedCount: pro=" + this.mCntProcessed);
            this.mSyncObj.notify();
        }
    }

    private void addStillImage(StillImageData dat) {
        if (this.mStillProcTask == null) {
            this.mStillProcTask = new StillProcTask();
            this.mStillProcTask.start();
        }
        synchronized (this.mImageSyncObj) {
            this.mStillProcList.add(dat);
            this.mImageSyncObj.notify();
        }
    }

    private void finishAttachStillImageTask() {
        synchronized (this.mSyncObj) {
            int timeoutTimes = 0;
            while (this.mCntReqShoot > this.mCntProcessed) {
                try {
                    long start = System.currentTimeMillis();
                    this.mSyncObj.wait(3000);
                    Log.d(TAG, String.format(Locale.ENGLISH, "SaveOutputImageTask: quit waiting. req=%d pro=%d", new Object[]{Integer.valueOf(this.mCntReqShoot), Integer.valueOf(this.mCntProcessed)}));
                    if (System.currentTimeMillis() - start >= 3000) {
                        timeoutTimes++;
                        if (timeoutTimes > 3) {
                            break;
                        }
                    } else {
                        timeoutTimes = 0;
                    }
                } catch (InterruptedException e) {
                    Log.e(TAG, "SaveOutputImageTask: " + e.getMessage(), e);
                }
            }
        }
        this.mStillProcTask = null;
        return;
    }

    private boolean isProcessingFinishTask() {
        if (this.mSaveOutputImageTask == null || this.mSaveOutputImageTask.getStatus() == Status.FINISHED) {
            return false;
        }
        return true;
    }

    private void saveOutputJpeg(String name, Rect rect) {
        int[] progress = new int[1];
        String path = Storage.generateFilepath(name);
        if (this.mMorphoPanoramaGP.saveOutputJpeg(path, rect, 1, progress) == 0) {
            addImageAsApplication(path, rect, calibrateRotation(1));
            return;
        }
        Log.e(TAG, String.format("saveOutputJpeg() -> 0x%x", new Object[]{Integer.valueOf(ret)}));
        File file = new File(path);
        if (file.exists()) {
            file.delete();
        }
    }

    private int calibrateRotation(int rotation) {
        if (!(rotation == 0 || rotation == 90 || rotation == 180 || rotation == 270)) {
            rotation = 0;
        }
        return (this.mDeviceOrientationAtCapture + rotation) % 360;
    }

    private void addImageAsApplication(String path, Rect rect, int orientation) {
        boolean withLocation = this.mLocation != null;
        Uri uri = Storage.addImage(this.mActivity != null ? this.mActivity : CameraAppImpl.getAndroidContext(), path, orientation, this.mTimeTaken, this.mLocation, rect.width(), rect.height());
        trackGeneralInfo(1, false);
        trackPictureTaken(1, false, withLocation);
        Camera activity = this.mActivity;
        if (isCreated() && activity != null) {
            activity.getScreenHint().updateHint();
            if (uri != null) {
                activity.addSecureUri(uri);
                Thumbnail t = Thumbnail.createThumbnailFromUri(activity.getContentResolver(), uri, false);
                Util.broadcastNewPicture(activity, uri);
                activity.getThumbnailUpdater().setThumbnail(t, false, false);
            }
        }
    }

    protected void trackModeCustomInfo(int takenNum) {
        CameraStatUtil.trackPictureTakenInPanorama(takenNum);
    }

    private void allocateDisplayBuffers(int direction) {
        if (!(this.mPreviewImage == null || (this.mPreviewImage.getWidth() == this.mInitParam.preview_img_width && this.mPreviewImage.getHeight() == this.mInitParam.preview_img_height))) {
            this.mPreviewImage.recycle();
            this.mPreviewImage = null;
            this.mDispPreviewImage.recycle();
            this.mDispPreviewImage = null;
        }
        if (this.mPreviewImage == null) {
            float aspect;
            switch (direction) {
                case 0:
                    this.mPreviewImage = Bitmap.createBitmap(this.mInitParam.preview_img_width, this.mInitParam.preview_img_height, Config.ARGB_8888);
                    aspect = ((float) this.mInitParam.preview_img_height) / ((float) this.mInitParam.preview_img_width);
                    this.mDispPreviewImage = Bitmap.createBitmap(Util.sWindowWidth, (((int) (((float) Util.sWindowWidth) * aspect)) * 80) / 100, Config.ARGB_8888);
                    this.mAttachPosOffsetX = ((((int) (((float) Util.sWindowWidth) * aspect)) * this.mPreviewSize.height) / this.mPreviewSize.width) / 2;
                    return;
                case 1:
                    this.mPreviewImage = Bitmap.createBitmap(this.mInitParam.preview_img_width, this.mInitParam.preview_img_height, Config.ARGB_8888);
                    this.mDispPreviewImage = Bitmap.createBitmap((((int) (((float) this.mPreViewScaleHeight) * (((float) (this.mInitParam.preview_img_width - (this.mPreviewCroppingAdjustByAuto * 2))) / ((float) this.mInitParam.preview_img_height)))) * 80) / 100, this.mPreViewScaleHeight, Config.ARGB_8888);
                    this.mAttachPosOffsetY = ((this.mDispPreviewImage.getWidth() * this.mPreviewSize.width) / this.mPreviewSize.height) / 2;
                    return;
                case 4:
                    this.mPreviewImage = Bitmap.createBitmap(this.mInitParam.preview_img_width, this.mInitParam.preview_img_height, Config.ARGB_8888);
                    aspect = ((float) (this.mInitParam.preview_img_height - (this.mPreviewCroppingAdjustByAuto * 2))) / ((float) this.mInitParam.preview_img_width);
                    this.mDispPreviewImage = Bitmap.createBitmap(Util.sWindowWidth, (((int) (((float) Util.sWindowWidth) * aspect)) * 80) / 100, Config.ARGB_8888);
                    this.mAttachPosOffsetX = ((((int) (((float) Util.sWindowWidth) * aspect)) * this.mPreviewSize.height) / this.mPreviewSize.width) / 2;
                    return;
                default:
                    this.mPreviewImage = Bitmap.createBitmap(this.mInitParam.preview_img_width, this.mInitParam.preview_img_height, Config.ARGB_8888);
                    this.mDispPreviewImage = Bitmap.createBitmap((((int) (((float) this.mPreViewScaleHeight) * (((float) this.mInitParam.preview_img_width) / ((float) this.mInitParam.preview_img_height)))) * 80) / 100, this.mPreViewScaleHeight, Config.ARGB_8888);
                    this.mAttachPosOffsetY = ((this.mDispPreviewImage.getWidth() * this.mPreviewSize.width) / this.mPreviewSize.height) / 2;
                    return;
            }
        }
    }

    private String createNameString(long dateTaken, int type) {
        String name = DateFormat.format(getString(R.string.pano_file_name_format), dateTaken).toString();
        if (sSaveOutputType == 3 && type == 2) {
            return name + "_bounding";
        }
        return name;
    }

    private void onCaptureOrientationDecided() {
        ((ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).onCaptureOrientationDecided(this.mDirection[0], this.mAttachPosOffsetX, this.mAttachPosOffsetY);
        this.mCaptureOrientationDecided = true;
    }

    private void onPreviewMoving() {
        ((ModeProtocol$PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).onPreviewMoving();
    }

    /* JADX WARNING: Missing block: B:8:0x0029, code:
            return;
     */
    /* JADX WARNING: Missing block: B:15:0x0051, code:
            com.android.camera.log.Log.v(TAG, "onPictureTaken<<");
     */
    /* JADX WARNING: Missing block: B:16:0x0059, code:
            return;
     */
    public void onPictureTaken(byte[] r9, com.android.camera2.Camera2Proxy r10) {
        /*
        r8 = this;
        r1 = 0;
        r8.mRequestTakePicture = r1;
        r1 = TAG;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "onPictureTaken>>len=";
        r2 = r2.append(r3);
        r3 = r9.length;
        r2 = r2.append(r3);
        r2 = r2.toString();
        com.android.camera.log.Log.v(r1, r2);
        r7 = r8.mSyncObj;
        monitor-enter(r7);
        r1 = r8.mCamera2Device;	 Catch:{ all -> 0x005f }
        if (r1 == 0) goto L_0x0028;
    L_0x0024:
        r1 = r8.mMorphoPanoramaGP;	 Catch:{ all -> 0x005f }
        if (r1 != 0) goto L_0x002a;
    L_0x0028:
        monitor-exit(r7);
        return;
    L_0x002a:
        r1 = r8.mCaptureInfoList;	 Catch:{ all -> 0x005f }
        r1 = r1.size();	 Catch:{ all -> 0x005f }
        if (r1 == 0) goto L_0x0028;
    L_0x0032:
        r1 = r8.mCaptureInfoList;	 Catch:{ all -> 0x005f }
        r2 = 0;
        r6 = r1.remove(r2);	 Catch:{ all -> 0x005f }
        r6 = (com.android.camera.module.PanoramaModule.CaptureInfo) r6;	 Catch:{ all -> 0x005f }
        r0 = new com.android.camera.module.PanoramaModule$StillImageData;	 Catch:{ all -> 0x005f }
        r2 = r6.mId;	 Catch:{ all -> 0x005f }
        r3 = r8.mPreviewCount;	 Catch:{ all -> 0x005f }
        r5 = r8.mMotionData;	 Catch:{ all -> 0x005f }
        r1 = r8;
        r4 = r9;
        r0.<init>(r2, r3, r4, r5);	 Catch:{ all -> 0x005f }
        r8.addStillImage(r0);	 Catch:{ all -> 0x005f }
        r1 = r6.mStatus;	 Catch:{ all -> 0x005f }
        switch(r1) {
            case 1: goto L_0x005a;
            case 3: goto L_0x005a;
            case 11: goto L_0x005a;
            default: goto L_0x0050;
        };
    L_0x0050:
        monitor-exit(r7);
        r1 = TAG;
        r2 = "onPictureTaken<<";
        com.android.camera.log.Log.v(r1, r2);
        return;
    L_0x005a:
        r1 = 1;
        r8.stopPanoramaShooting(r1);	 Catch:{ all -> 0x005f }
        goto L_0x0050;
    L_0x005f:
        r1 = move-exception;
        monitor-exit(r7);
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.PanoramaModule.onPictureTaken(byte[], com.android.camera2.Camera2Proxy):void");
    }

    public void onPictureTakenFailed() {
    }

    public void onPictureBurstFinished(boolean success) {
    }

    private boolean isZslMode() {
        return true;
    }

    protected void sendOpenFailMessage() {
        this.mMainHandler.sendEmptyMessage(10);
    }
}
