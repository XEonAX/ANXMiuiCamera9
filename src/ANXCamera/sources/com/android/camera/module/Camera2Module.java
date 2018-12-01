package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.Face;
import android.location.Location;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.MotionEventCompat;
import android.support.v7.recyclerview.R;
import android.text.TextUtils;
import android.util.Range;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraApplicationDelegate;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Device;
import com.android.camera.Exif;
import com.android.camera.ExifHelper;
import com.android.camera.LocationManager;
import com.android.camera.PictureSizeManager;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.AsdSceneConstant;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.effect.BeautyParameters.OnFaceBeautyChangedListener;
import com.android.camera.effect.BeautyValues;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawJPEGAttribute;
import com.android.camera.effect.renders.SnapshotEffectRender;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol$ConfigChanges;
import com.android.camera.protocol.ModeProtocol$FaceBeautyProtocol;
import com.android.camera.protocol.ModeProtocol$FilterProtocol;
import com.android.camera.protocol.ModeProtocol$MainContentProtocol;
import com.android.camera.protocol.ModeProtocol$ScreenLightProtocol;
import com.android.camera.protocol.ModeProtocol$SnapShotIndicator;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.protocol.ModeProtocol$TopConfigProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.RotateTextToast;
import com.android.camera.ui.ToggleSwitch;
import com.android.camera.ui.ToggleSwitch.OnCheckedChangeListener;
import com.android.camera2.ArcsoftDepthMap;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.HDRCheckerCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.ScreenLightCallback;
import com.android.camera2.Camera2Proxy.ShutterCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CameraHardwareFace;
import com.android.camera2.CaptureResultParser;
import com.android.zxing.QRCode$QRCodeResultCallback;
import com.android.zxing.QRCodeManager;
import com.google.lens.sdk.LensApi;
import com.google.lens.sdk.LensApi.LensAvailabilityCallback;
import com.google.zxing.Result;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Function;
import io.reactivex.functions.Predicate;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import miui.util.IOUtils;

@TargetApi(21)
public class Camera2Module extends BaseModule implements Listener, ObjectViewListener, CameraMetaDataCallback, ModeProtocol$CameraAction, ModeProtocol$FilterProtocol, ModeProtocol$TopConfigProtocol, ModeProtocol$CameraModuleSpecial, CameraPreviewCallback, ShutterCallback, HDRCheckerCallback, ScreenLightCallback, PictureCallback, FaceDetectionCallback, FocusCallback, OnFaceBeautyChangedListener, ModeProtocol$FaceBeautyProtocol {
    private static final String TAG = Camera2Module.class.getSimpleName();
    private static boolean mIsBeautyFrontOn;
    private volatile boolean isDetectedInHDR;
    private boolean m3ALocked;
    private int mAFEndLogTimes;
    private Disposable mAiSceneDisposable;
    private boolean mAiSceneEnabled = CameraSettings.getAiSceneOpen();
    private FlowableEmitter<CaptureResult> mAiSceneFloableEmitter;
    private BeautyValues mBeautyValues;
    private Intent mBroadcastIntent;
    private Disposable mBurstDisposable;
    private ObservableEmitter mBurstEmitter;
    private long mBurstNextDelayTime = 0;
    private String mBurstShotTitle;
    private long mBurstStartTime;
    private long mCaptureStartTime;
    private Disposable mCountdownDisposable;
    private String mCropValue;
    private int mCurrentAiScene;
    private int mCurrentAsdScene = -1;
    private int mCurrentDetectedScene;
    private int mCurrentFaceScene;
    private SnapshotEffectRender mEffectProcessor;
    private boolean mEnabledPreviewThumbnail;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceDetectionStarted;
    private FocusManager2 mFocusManager;
    private int mGroupFaceNum = 10;
    private GroupShot mGroupShot;
    private int mGroupShotTimes;
    private MainHandler mHandler;
    private boolean mHasAiSceneFilterEffect;
    private boolean mIsImageCaptureIntent;
    private boolean mIsParallelProcess;
    private boolean mIsSaveCaptureImage;
    private long mJpegCallbackFinishTime;
    private byte[] mJpegImageData;
    private long mJpegPictureCallbackTime;
    private int mJpegRotation;
    private boolean mKeepBitmapTexture;
    private long mLastCaptureTime;
    private long mLastChangeSceneTime = 0;
    private int mLatestFaceScene;
    private LensApi mLensApi;
    private int mLensStatus = 1;
    private Location mLocation;
    private boolean mLongPressedAutoFocus;
    private Disposable mMetaDataDisposable;
    private FlowableEmitter<CaptureResult> mMetaDataFloableEmitter;
    private CameraSize mMultiSnapPictureSize;
    private boolean mMultiSnapStatus = false;
    private boolean mMultiSnapStopRequest = false;
    private boolean mNeedAutoFocus;
    private long mOnResumeTime;
    private int mOperatingMode;
    private String mParallelProcessingFilePath;
    private int mParsedAiScene;
    private boolean mPendingMultiCapture;
    private byte[] mPortraitDepthData;
    private byte[] mPortraitRawData;
    private boolean mQuickCapture;
    private int mReceivedJpegCallbackNum = 0;
    private int mSameFaceSceneDetectedTimes;
    private Uri mSaveUri;
    private int mSavedJpegCallbackNum = 0;
    private String mSceneMode;
    private SensorStateListener mSensorStateListener = new SensorStateListener() {
        public void onDeviceBecomeStable() {
        }

        public boolean isWorking() {
            return Camera2Module.this.getCameraState() != 0;
        }

        public void onDeviceKeepMoving(double a) {
            if (!Camera2Module.this.mPaused && Camera2Module.this.mFocusManager != null && (Camera2Module.this.mMultiSnapStatus ^ 1) != 0 && (Camera2Module.this.is3ALocked() ^ 1) != 0 && (Camera2Module.this.mMainProtocol.isEvAdjusted(true) ^ 1) != 0) {
                Camera2Module.this.mFocusManager.onDeviceKeepMoving(a);
            }
        }

        public void onDeviceBeginMoving() {
            if (!Camera2Module.this.mPaused && CameraSettings.isEdgePhotoEnable()) {
                Camera2Module.this.mActivity.getEdgeShutterView().onDeviceMoving();
            }
        }

        public void onDeviceOrientationChanged(float orientation, boolean isLying) {
            Camera2Module.this.mDeviceRotation = orientation;
            if (Camera2Module.this.getCameraState() != 3) {
                EffectController.getInstance().setDeviceRotation(Camera2Module.this.mActivity.getSensorStateManager().isDeviceLying(), Util.getShootRotation(Camera2Module.this.mActivity, Camera2Module.this.mDeviceRotation));
            }
            Camera2Module.this.mHandler.removeMessages(33);
            if (!Camera2Module.this.mPaused) {
                int newOrientation = Util.roundOrientation(Math.round(orientation), Camera2Module.this.mOrientation);
                Camera2Module.this.mHandler.obtainMessage(33, newOrientation, (newOrientation + Util.getDisplayRotation(Camera2Module.this.mActivity)) % 360).sendToTarget();
            }
        }

        public void notifyDevicePostureChanged() {
        }
    };
    private int mShootOrientation;
    private float mShootRotation;
    private long mShutterCallbackTime;
    private long mShutterLag;
    private int mTotalJpegCallbackNum = 1;
    private boolean mUpdateImageTitle = false;
    private boolean mVolumeLongPress = false;
    private volatile boolean resetedFromMutex = false;

    private final class JpegQuickPictureCallback implements PictureCallback {
        boolean mDropped;
        Location mLocation;
        String mPressDownTitle;

        public JpegQuickPictureCallback(Location loc) {
            this.mLocation = loc;
        }

        private String getBurstShotTitle() {
            String str;
            if (Camera2Module.this.mUpdateImageTitle && Camera2Module.this.mBurstShotTitle != null && Camera2Module.this.mSavedJpegCallbackNum == 1) {
                this.mPressDownTitle = Camera2Module.this.mBurstShotTitle;
                Camera2Module.this.mBurstShotTitle = null;
            }
            if (Camera2Module.this.mBurstShotTitle == null) {
                long currentTime = System.currentTimeMillis();
                Camera2Module.this.mBurstShotTitle = Util.createJpegName(currentTime);
                if (Camera2Module.this.mBurstShotTitle.length() != 19) {
                    Camera2Module.this.mBurstShotTitle = Util.createJpegName(1000 + currentTime);
                }
            }
            StringBuilder append = new StringBuilder().append(Camera2Module.this.mBurstShotTitle);
            if (Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                str = "_UBIFOCUS_" + (Camera2Module.this.mSavedJpegCallbackNum - 1);
            } else {
                str = "_BURST" + Camera2Module.this.mSavedJpegCallbackNum;
            }
            return append.append(str).toString();
        }

        public void onPictureTaken(byte[] jpegData, Camera2Proxy camera) {
            if (!Camera2Module.this.mPaused && jpegData != null && Camera2Module.this.mReceivedJpegCallbackNum < Camera2Module.this.mTotalJpegCallbackNum && (Camera2Module.this.mMultiSnapStatus ^ 1) == 0) {
                if (Camera2Module.this.mSavedJpegCallbackNum == 1 && (Camera2Module.this.mMultiSnapStopRequest ^ 1) != 0) {
                    if (!Camera2Module.this.is3ALocked()) {
                        Camera2Module.this.mFocusManager.onShutter();
                    }
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                        Camera2Module.this.mActivity.getImageSaver().updateImage(getBurstShotTitle(), this.mPressDownTitle);
                    }
                }
                if (Storage.isLowStorageAtLastPoint()) {
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mMultiSnapStatus) {
                        Camera2Module.this.trackGeneralInfo(Camera2Module.this.mSavedJpegCallbackNum, true);
                        Camera2Module.this.trackPictureTaken(Camera2Module.this.mSavedJpegCallbackNum, true, this.mLocation != null);
                        Camera2Module.this.stopMultiSnap();
                    }
                    return;
                }
                Camera2Module camera2Module = Camera2Module.this;
                camera2Module.mReceivedJpegCallbackNum = camera2Module.mReceivedJpegCallbackNum + 1;
                if (Camera2Module.this.mActivity.getImageSaver().isSaveQueueFull()) {
                    Log.e(Camera2Module.TAG, "CaptureBurst queue full and drop " + Camera2Module.this.mReceivedJpegCallbackNum);
                    this.mDropped = true;
                    if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum) {
                        Camera2Module.this.mActivity.getThumbnailUpdater().getLastThumbnailUncached();
                    }
                } else {
                    int width;
                    int height;
                    camera2Module = Camera2Module.this;
                    camera2Module.mSavedJpegCallbackNum = camera2Module.mSavedJpegCallbackNum + 1;
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                        Camera2Module.this.playSound(4);
                    }
                    Camera2Module.this.mBurstEmitter.onNext(Integer.valueOf(Camera2Module.this.mSavedJpegCallbackNum));
                    boolean isHide = Camera2Module.this.mMutexModePicker.isUbiFocus() ? Camera2Module.this.mReceivedJpegCallbackNum <= Camera2Module.this.mTotalJpegCallbackNum : false;
                    int orientation = isHide ? 0 : Exif.getOrientation(jpegData);
                    if ((Camera2Module.this.mJpegRotation + orientation) % 180 == 0) {
                        width = Camera2Module.this.mMultiSnapPictureSize.getWidth();
                        height = Camera2Module.this.mMultiSnapPictureSize.getHeight();
                    } else {
                        width = Camera2Module.this.mMultiSnapPictureSize.getHeight();
                        height = Camera2Module.this.mMultiSnapPictureSize.getWidth();
                    }
                    String title = getBurstShotTitle();
                    boolean isMap = Camera2Module.this.mMutexModePicker.isUbiFocus() ? Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum + -1 : false;
                    Object obj = (Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum) ? 1 : null;
                    if (obj == null) {
                        int saveType;
                        if (Camera2Module.this.mReceivedJpegCallbackNum == 1) {
                            saveType = 4;
                        } else if (Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped) {
                            saveType = 6;
                        } else {
                            saveType = 5;
                        }
                        Camera2Module.this.mActivity.getImageSaver().addImage(jpegData, Camera2Module.this.needImageThumbnail(saveType), title, System.currentTimeMillis(), null, this.mLocation, width, height, null, orientation, isHide, isMap, true, false);
                        this.mDropped = false;
                    }
                }
                if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest) {
                    Camera2Module.this.stopMultiSnap();
                }
            }
        }

        public void onPictureTakenFailed() {
        }

        public void onPictureBurstFinished(boolean success) {
            Camera2Module.this.stopMultiSnap();
            Camera2Module.this.mBurstEmitter.onComplete();
        }
    }

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            boolean z = true;
            if (!Camera2Module.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (Camera2Module.this.getActivity() != null) {
                switch (msg.what) {
                    case 2:
                        Camera2Module.this.getWindow().clearFlags(128);
                        break;
                    case 4:
                        Camera2Module.this.checkActivityOrientation();
                        if (SystemClock.uptimeMillis() - Camera2Module.this.mOnResumeTime < 5000) {
                            Camera2Module.this.mHandler.sendEmptyMessageDelayed(4, 100);
                            break;
                        }
                        break;
                    case 9:
                        Camera2Module.this.mMainProtocol.initializeFocusView(Camera2Module.this);
                        Camera2Module.this.mMainProtocol.setObjectViewListener(Camera2Module.this);
                        break;
                    case 10:
                        Camera2Module.this.mOpenCameraFail = true;
                        Camera2Module.this.onCameraException();
                        break;
                    case 11:
                        break;
                    case MotionEventCompat.AXIS_LTRIGGER /*17*/:
                        Camera2Module.this.mHandler.removeMessages(17);
                        Camera2Module.this.mHandler.removeMessages(2);
                        Camera2Module.this.getWindow().addFlags(128);
                        Camera2Module.this.mHandler.sendEmptyMessageDelayed(2, (long) Camera2Module.this.getScreenDelay());
                        break;
                    case 31:
                        Camera2Module.this.setOrientationParameter();
                        break;
                    case MotionEventCompat.AXIS_GENERIC_2 /*33*/:
                        Camera2Module.this.setOrientation(msg.arg1, msg.arg2);
                        break;
                    case MotionEventCompat.AXIS_GENERIC_4 /*35*/:
                        Camera2Module camera2Module = Camera2Module.this;
                        boolean z2 = msg.arg1 > 0;
                        if (msg.arg2 <= 0) {
                            z = false;
                        }
                        camera2Module.handleUpdateFaceView(z2, z);
                        break;
                    case MotionEventCompat.AXIS_GENERIC_13 /*44*/:
                        Camera2Module.this.restartModule();
                        break;
                    case MotionEventCompat.AXIS_GENERIC_14 /*45*/:
                        Camera2Module.this.setActivity(null);
                        break;
                    case 48:
                        Camera2Module.this.setCameraState(1);
                        break;
                    case 49:
                        if (Camera2Module.this.isAlive()) {
                            Camera2Module.this.stopMultiSnap();
                            Camera2Module.this.mBurstEmitter.onComplete();
                            break;
                        }
                        return;
                    case 50:
                        Log.w(Camera2Module.TAG, "later release timeout!");
                        Camera2Module.this.onPictureTakenFailed();
                        break;
                    case 51:
                        if (!Camera2Module.this.mActivity.isActivityPaused()) {
                            Camera2Module.this.mOpenCameraFail = true;
                            Camera2Module.this.onCameraException();
                            break;
                        }
                        break;
                    case 52:
                        Camera2Module.this.onShutterButtonClick(Camera2Module.this.getTriggerMode());
                        break;
                    default:
                        throw new RuntimeException("no consumer for this message: " + msg.what);
                }
            }
        }
    }

    private class SaveOutputImageTask extends AsyncTask<Void, Integer, Integer> {
        private GroupShot mGroupShotInternal;
        private int mHeight;
        private Location mLocation;
        private int mOrientation;
        private long mStartTime;
        private long mTimeTaken;
        private String mTitle;
        private int mWidth;

        SaveOutputImageTask(long time, Location location, int width, int height, int orientation, String title, GroupShot groupShot) {
            this.mTimeTaken = time;
            this.mLocation = location;
            this.mWidth = width;
            this.mHeight = height;
            this.mOrientation = orientation;
            this.mTitle = title;
            this.mGroupShotInternal = groupShot;
        }

        protected Integer doInBackground(Void... params) {
            Log.v(Camera2Module.TAG, "doInBackground start");
            try {
                int result = this.mGroupShotInternal.attach_end();
                Log.v(Camera2Module.TAG, String.format("attach_end() = 0x%08x", new Object[]{Integer.valueOf(result)}));
                if (isCancelled()) {
                    return null;
                }
                result = this.mGroupShotInternal.setBaseImage(0);
                Log.v(Camera2Module.TAG, String.format("setBaseImage() = 0x%08x", new Object[]{Integer.valueOf(result)}));
                result = this.mGroupShotInternal.setBestFace();
                Log.v(Camera2Module.TAG, "groupshot attach end & setbestface cost " + (System.currentTimeMillis() - this.mStartTime));
                String path = Storage.generateFilepath(this.mTitle);
                this.mGroupShotInternal.getImageAndSaveJpeg(path);
                Log.v(Camera2Module.TAG, "groupshot finish group cost " + (System.currentTimeMillis() - this.mStartTime));
                if (isCancelled()) {
                    return null;
                }
                if (Util.sIsDumpLog) {
                    String originPath = path.substring(0, path.lastIndexOf(".jpg"));
                    new File(originPath).mkdirs();
                    this.mGroupShotInternal.saveInputImages(originPath + File.separator);
                }
                if (isCancelled()) {
                    return null;
                }
                if (isCancelled()) {
                    return null;
                }
                Context appContext = CameraApplicationDelegate.getAndroidContext();
                ExifHelper.writeExif(path, this.mOrientation, LocationManager.instance().getCurrentLocation(), this.mTimeTaken);
                Uri uri = Storage.addImage(appContext, path, this.mOrientation, this.mTimeTaken, this.mLocation, this.mWidth, this.mHeight);
                Log.v(Camera2Module.TAG, "groupshot insert db cost " + (System.currentTimeMillis() - this.mStartTime));
                Camera cameraMirror = Camera2Module.this.mActivity;
                if (cameraMirror == null) {
                    return null;
                }
                cameraMirror.getScreenHint().updateHint();
                if (uri != null) {
                    cameraMirror.addSecureUri(uri);
                    Util.broadcastNewPicture(appContext, uri);
                    cameraMirror.getThumbnailUpdater().setThumbnail(Thumbnail.createThumbnailFromUri(appContext.getContentResolver(), uri, false), false, false);
                }
                Log.v(Camera2Module.TAG, "groupshot asynctask cost " + (System.currentTimeMillis() - this.mStartTime));
                return null;
            } catch (Exception e) {
                Log.e(Camera2Module.TAG, "SaveOutputImageTask exception occurs, " + e.getMessage());
                if (null != null) {
                    new File(null).delete();
                }
                return null;
            }
        }

        protected void onPreExecute() {
            this.mStartTime = System.currentTimeMillis();
        }

        protected void onCancelled() {
            Log.v(Camera2Module.TAG, "SaveOutputImageTask onCancelled");
            finishGroupShot();
        }

        protected void onPostExecute(Integer result) {
            Log.v(Camera2Module.TAG, "SaveOutputImageTask onPostExecute");
            if (!Camera2Module.this.mPaused) {
                Camera2Module.this.mActivity.getThumbnailUpdater().updateThumbnailView(true);
            }
            Log.v(Camera2Module.TAG, "groupshot image process cost " + (System.currentTimeMillis() - this.mStartTime));
            finishGroupShot();
        }

        private void finishGroupShot() {
            this.mGroupShotInternal.clearImages();
            this.mGroupShotInternal.finish();
            if (Camera2Module.this.mPaused) {
                this.mGroupShotInternal = null;
            }
            this.mGroupShotInternal = null;
            Camera2Module camera2Module = Camera2Module.this;
            camera2Module.mGroupShotTimes = camera2Module.mGroupShotTimes - 1;
        }
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(195, this);
        if (Device.isLegacyFaceBeauty()) {
            ModeCoordinatorImpl.getInstance().attachProtocol(185, this);
        }
        getActivity().getImplFactory().initAdditional(getActivity(), 164, 174);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(195, this);
        if (Device.isLegacyFaceBeauty()) {
            ModeCoordinatorImpl.getInstance().detachProtocol(185, this);
        }
        getActivity().getImplFactory().detachAdditional();
    }

    private boolean isAiSceneEnabled() {
        if (this.mAiSceneEnabled) {
            return this.mModuleIndex == 163 || this.mModuleIndex == 165;
        } else {
            return false;
        }
    }

    public boolean scanQRCodeEnabled() {
        return (!CameraSettings.isScanQRCode(this.mActivity) || this.mModuleIndex != 163 || (this.mIsImageCaptureIntent ^ 1) == 0 || !isBackCamera() || (this.mMultiSnapStatus ^ 1) == 0 || (CameraSettings.isStereoModeOn() ^ 1) == 0) ? false : CameraSettings.isPortraitModeBackOn() ^ 1;
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            if (this.mFocusAreaSupported) {
                this.mCamera2Device.startFocus(FocusTask.create(1), this.mModuleIndex);
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    public void cancelFocus(boolean resetFocusMode) {
        if (isAlive() && isFrameAvailable() && getCameraState() != 0) {
            if (this.mCamera2Device != null) {
                if (resetFocusMode) {
                    this.mCamera2Device.setFocusMode(4);
                }
                this.mCamera2Device.cancelFocus(this.mModuleIndex);
            }
            if (getCameraState() != 3) {
                setCameraState(1);
            }
        }
    }

    public boolean onWaitingFocusFinished() {
        if (isDoingAction()) {
            return false;
        }
        startNormalCapture(getTriggerMode());
        return true;
    }

    public boolean multiCapture() {
        if (isDoingAction() || !this.mPendingMultiCapture) {
            return false;
        }
        this.mPendingMultiCapture = false;
        this.mActivity.getScreenHint().updateHint();
        if (Storage.isLowStorageAtLastPoint()) {
            Log.i(TAG, "Not enough space or storage not ready. remaining=" + Storage.getLeftSpace());
            return false;
        } else if (this.mActivity.getImageSaver().shouldStopShot()) {
            Log.i(TAG, "ImageSaver is full, wait for a moment!");
            RotateTextToast.getInstance(this.mActivity).show(R.string.toast_saving, 0);
            return false;
        } else {
            ((ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).closeMutexElement("d", 193, 194, 196, 239, 201);
            prepareMultiCapture();
            Observable.create(new ObservableOnSubscribe<Integer>() {
                public void subscribe(ObservableEmitter<Integer> observableEmitter) throws Exception {
                    Camera2Module.this.mBurstEmitter = observableEmitter;
                }
            }).observeOn(AndroidSchedulers.mainThread()).map(new Function<Integer, Integer>() {
                public Integer apply(Integer integer) throws Exception {
                    ((ModeProtocol$SnapShotIndicator) ModeCoordinatorImpl.getInstance().getAttachProtocol(184)).setSnapNumValue(integer.intValue());
                    return integer;
                }
            }).subscribe(new Observer<Integer>() {
                public void onSubscribe(Disposable disposable) {
                    Camera2Module.this.mBurstStartTime = System.currentTimeMillis();
                    Camera2Module.this.mBurstDisposable = disposable;
                }

                public void onNext(Integer integer) {
                }

                public void onError(Throwable throwable) {
                }

                public void onComplete() {
                    ((ModeProtocol$SnapShotIndicator) ModeCoordinatorImpl.getInstance().getAttachProtocol(184)).setSnapNumVisible(false);
                    ((ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).restoreAllMutexElement("d");
                }
            });
            this.mBurstNextDelayTime = 0;
            this.mCamera2Device.captureBurstPictures(this.mTotalJpegCallbackNum, new JpegQuickPictureCallback(LocationManager.instance().getCurrentLocation()));
            return true;
        }
    }

    private void stopMultiSnap() {
        this.mHandler.removeMessages(49);
        if (this.mMultiSnapStatus) {
            boolean z;
            this.mLastCaptureTime = System.currentTimeMillis();
            this.mMultiSnapStatus = false;
            Log.e(TAG, "burst: stopMultiSnap | ");
            this.mCamera2Device.captureAbortBurst();
            int takeNum = !this.mMutexModePicker.isUbiFocus() ? this.mReceivedJpegCallbackNum : 1;
            boolean isBurst = this.mMutexModePicker.isUbiFocus() ^ 1;
            trackGeneralInfo(takeNum, isBurst);
            if (this.mLocation != null) {
                z = true;
            } else {
                z = false;
            }
            trackPictureTaken(takeNum, isBurst, z);
            animateCapture();
            this.mBurstShotTitle = null;
            this.mUpdateImageTitle = false;
            this.mHandler.sendEmptyMessageDelayed(48, 800);
        }
    }

    /* JADX WARNING: Missing block: B:4:0x000b, code:
            return;
     */
    public void onBroadcastReceived(android.content.Context r5, android.content.Intent r6) {
        /*
        r4 = this;
        r3 = 0;
        if (r6 == 0) goto L_0x000b;
    L_0x0003:
        r1 = r4.isAlive();
        r1 = r1 ^ 1;
        if (r1 == 0) goto L_0x000c;
    L_0x000b:
        return;
    L_0x000c:
        r1 = "android.media.action.VOICE_COMMAND";
        r2 = r6.getAction();
        r1 = r1.equals(r2);
        if (r1 == 0) goto L_0x0040;
    L_0x0019:
        r1 = TAG;
        r2 = "on Receive voice control broadcast action intent";
        com.android.camera.log.Log.d(r1, r2);
        r1 = com.android.camera.CameraIntentManager.getInstance(r6);
        r0 = r1.getVoiceControlAction();
        r4.mBroadcastIntent = r6;
        r1 = "CAPTURE";
        r1 = r0.equals(r1);
        if (r1 == 0) goto L_0x003d;
    L_0x0034:
        r1 = r4.getTriggerMode();
        r4.onShutterButtonClick(r1);
        r4.mBroadcastIntent = r3;
    L_0x003d:
        com.android.camera.CameraIntentManager.removeInstance(r6);
    L_0x0040:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.onBroadcastReceived(android.content.Context, android.content.Intent):void");
    }

    public int getGroupShotNum() {
        if (this.mGroupShotTimes > 5 || (!Util.isMemoryRich(this.mActivity) && this.mGroupShotTimes != 0)) {
            return 1;
        }
        return getGroupShotMaxImage();
    }

    public int getGroupShotMaxImage() {
        CameraHardwareFace[] faces = this.mMainProtocol.getFaces();
        return Util.clamp((faces != null ? faces.length : 0) + 1, 2, 4);
    }

    public void initGroupShot(int maxImage) {
        if (this.mGroupShot == null || this.mGroupShot.isUsed()) {
            this.mGroupShot = new GroupShot();
        }
        if (this.mOrientation % 180 == 0 && Device.isISPRotated()) {
            this.mGroupShot.initialize(maxImage, this.mGroupFaceNum, this.mPictureSize.getHeight(), this.mPictureSize.getWidth(), this.mPreviewSize.height, this.mPreviewSize.width);
            return;
        }
        this.mGroupShot.initialize(maxImage, this.mGroupFaceNum, this.mPictureSize.getWidth(), this.mPictureSize.getHeight(), this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private void prepareGroupShot() {
        this.mTotalJpegCallbackNum = getGroupShotNum();
        initGroupShot(this.mTotalJpegCallbackNum);
        if (this.mGroupShot != null) {
            this.mGroupShot.attach_start(1);
        } else {
            this.mTotalJpegCallbackNum = 1;
        }
    }

    public void onBeautyStatusChanged(boolean faceBeautyOn) {
    }

    public void onBeautyParameterChanged() {
        boolean curBeautyOn = BeautyParameters.getInstance().isFaceBeautyOn();
        String hdrMode = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
        if (this.mCameraCapabilities.isSupportedQcfa() && mIsBeautyFrontOn != curBeautyOn && ((curBeautyOn && this.mOperatingMode != 32773) || (!curBeautyOn && hdrMode.equals("off") && this.mOperatingMode != 32775))) {
            restartModule();
        } else if (Device.isSupportFrontBeautyMFNR()) {
            updatePreferenceInWorkThread(13, 34);
        } else {
            updatePreferenceInWorkThread(13);
        }
        mIsBeautyFrontOn = curBeautyOn;
    }

    private void updateASD() {
        this.mLatestFaceScene = 0;
        this.mCurrentAiScene = 0;
        this.mParsedAiScene = 0;
        this.mAiSceneEnabled = CameraSettings.getAiSceneOpen();
        this.mCamera2Device.setASD(this.mAiSceneEnabled);
        setAiSceneEffect(0);
        if (this.mAiSceneEnabled) {
            this.mCamera2Device.setASDPeriod(300);
            return;
        }
        hideSceneSelector();
        updateHDRPreference();
        updateFlashPreference();
        updateBeauty();
    }

    private void updateBokeh() {
        boolean enable;
        if ("on".equals(DataRepository.dataItemConfig().getComponentBokeh().getComponentValue(this.mModuleIndex))) {
            enable = true;
        } else if (isFrontCamera() && ModuleManager.isPortraitModule()) {
            enable = Device.isSupportedFrontPortrait();
        } else {
            enable = false;
        }
        this.mCamera2Device.setBokeh(enable);
    }

    private void updateFaceScore() {
        this.mCamera2Device.setFaceScore(DataRepository.dataItemRunning().isSwitchOn("pref_camera_magic_mirror_key"));
    }

    private void updateFaceAgeAnalyze() {
        boolean enable = false;
        if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_show_gender_age_key")) {
            enable = true;
        } else if (this.mBeautyValues != null) {
            if (CameraSettings.getFaceBeautyCloseValue().equals(this.mBeautyValues.mBeautyLevel)) {
                enable = false;
            } else {
                enable = true;
            }
        }
        this.mCamera2Device.setFaceAgeAnalyze(enable);
    }

    private void updateFrontMirror() {
        boolean enable;
        if (isFrontCamera()) {
            enable = CameraSettings.isFrontMirror();
        } else {
            enable = false;
        }
        this.mCamera2Device.setFrontMirror(enable);
    }

    private void hideSceneSelector() {
        this.mHandler.post(new Runnable() {
            public void run() {
                ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertAiSceneSelector(8, null);
            }
        });
    }

    public void onHDRSceneChanged(final boolean isInHdr) {
        if (this.isDetectedInHDR != isInHdr && !this.mPaused) {
            ComponentConfigHdr componentConfigHdr = DataRepository.dataItemConfig().getComponentHdr();
            if (!componentConfigHdr.isEmpty()) {
                if (!"auto".equals(componentConfigHdr.getComponentValue(this.mModuleIndex))) {
                    return;
                }
                if (!isInHdr || (this.mZoomValue <= 1.0f && this.mCurrentAiScene != -1 && (this.mCamera2Device == null || !this.mCamera2Device.isNeedFlashOn()))) {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            ((ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertHDR(isInHdr ? 0 : 8, false, false);
                        }
                    });
                    if (isInHdr) {
                        if (this.mMutexModePicker.isNormal()) {
                            this.mMutexModePicker.setMutexMode(1);
                        }
                    } else if (this.mMutexModePicker.isMorphoHdr()) {
                        this.mMutexModePicker.resetMutexMode();
                    }
                    this.isDetectedInHDR = isInHdr;
                    Log.d(TAG, "onHDRSceneChanged: " + isInHdr);
                }
            }
        }
    }

    public void onFaceBeautySwitched(boolean advanced) {
        CameraSettings.setFaceBeautySwitch(advanced ? "pref_camera_face_beauty_advanced_key" : "pref_camera_face_beauty_key");
        if (Device.isLegacyFaceBeauty()) {
            onBeautyParameterChanged();
        }
    }

    /* JADX WARNING: Missing block: B:6:0x0011, code:
            return;
     */
    public void startFaceDetection() {
        /*
        r2 = this;
        r1 = 1;
        r0 = r2.mFaceDetectionEnabled;
        if (r0 == 0) goto L_0x0011;
    L_0x0005:
        r0 = r2.mFaceDetectionStarted;
        if (r0 != 0) goto L_0x0011;
    L_0x0009:
        r0 = r2.isAlive();
        r0 = r0 ^ 1;
        if (r0 == 0) goto L_0x0012;
    L_0x0011:
        return;
    L_0x0012:
        r0 = r2.mMaxFaceCount;
        if (r0 <= 0) goto L_0x002e;
    L_0x0016:
        r0 = r2.mCamera2Device;
        if (r0 == 0) goto L_0x002e;
    L_0x001a:
        r2.mFaceDetectionStarted = r1;
        r0 = r2.mMainProtocol;
        r0.setActiveIndicator(r1);
        r0 = r2.mCamera2Device;
        r0.setFaceDetectionCallback(r2);
        r0 = r2.mCamera2Device;
        r0.startFaceDetection();
        r2.updateFaceView(r1, r1);
    L_0x002e:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.startFaceDetection():void");
    }

    public void stopFaceDetection(boolean clearFaces) {
        if (this.mFaceDetectionEnabled && (this.mFaceDetectionStarted ^ 1) == 0) {
            if (!(Device.isMTKPlatform() && (getCameraState() == 3 || getCameraState() == 0))) {
                this.mCamera2Device.stopFaceDetection();
            }
            this.mFaceDetectionStarted = false;
            this.mMainProtocol.setActiveIndicator(2);
            this.mCamera2Device.setFaceDetectionCallback(null);
            updateFaceView(false, clearFaces);
        }
    }

    /* JADX WARNING: Missing block: B:4:0x0015, code:
            return;
     */
    public void onFaceDetected(android.hardware.camera2.params.Face[] r6, com.android.camera.effect.FaceAnalyzeInfo r7, com.android.camera2.Camera2Proxy r8) {
        /*
        r5 = this;
        r2 = 0;
        r1 = r5.isAlive();
        if (r1 == 0) goto L_0x0015;
    L_0x0007:
        r1 = r5.mActivity;
        r1 = r1.getCameraScreenNail();
        r1 = r1.getFrameAvailableFlag();
        r1 = r1 ^ 1;
        if (r1 == 0) goto L_0x0016;
    L_0x0015:
        return;
    L_0x0016:
        if (r6 != 0) goto L_0x0019;
    L_0x0018:
        return;
    L_0x0019:
        r1 = com.android.camera.CameraSettings.showGenderAge();
        if (r1 != 0) goto L_0x0025;
    L_0x001f:
        r1 = com.android.camera.CameraSettings.isMagicMirrorOn();
        if (r1 == 0) goto L_0x0053;
    L_0x0025:
        r1 = r6.length;
        if (r1 <= 0) goto L_0x0053;
    L_0x0028:
        r1 = r7.mAge;
        if (r1 == 0) goto L_0x0053;
    L_0x002c:
        r0 = com.android.camera2.CameraHardwareFace.convertExCameraHardwareFace(r6, r7);
    L_0x0030:
        r1 = com.android.camera.Device.isSupportedObjectTrack();
        if (r1 == 0) goto L_0x0058;
    L_0x0036:
        r1 = r0.length;
        if (r1 <= 0) goto L_0x0058;
    L_0x0039:
        r1 = r0[r2];
        r1 = r1.faceType;
        r2 = 64206; // 0xface float:8.9972E-41 double:3.1722E-319;
        if (r1 != r2) goto L_0x0058;
    L_0x0042:
        r1 = r5.mObjectTrackingStarted;
        if (r1 == 0) goto L_0x0052;
    L_0x0046:
        r1 = r5.mMainProtocol;
        r2 = r5.getCropRegion();
        r3 = r5.mZoomValue;
        r4 = 3;
        r1.setFaces(r4, r0, r2, r3);
    L_0x0052:
        return;
    L_0x0053:
        r0 = com.android.camera2.CameraHardwareFace.convertCameraHardwareFace(r6);
        goto L_0x0030;
    L_0x0058:
        r1 = r5.mMainProtocol;
        r2 = r5.getCropRegion();
        r3 = r5.mZoomValue;
        r4 = 1;
        r1 = r1.setFaces(r4, r0, r2, r3);
        if (r1 != 0) goto L_0x0052;
    L_0x0067:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.onFaceDetected(android.hardware.camera2.params.Face[], com.android.camera.effect.FaceAnalyzeInfo, com.android.camera2.Camera2Proxy):void");
    }

    protected void updateFaceView(boolean visible, boolean clearFaces) {
        int i;
        int i2 = 1;
        if (this.mHandler.hasMessages(35)) {
            this.mHandler.removeMessages(35);
        }
        MainHandler mainHandler = this.mHandler;
        if (visible) {
            i = 1;
        } else {
            i = 0;
        }
        if (!clearFaces) {
            i2 = 0;
        }
        mainHandler.obtainMessage(35, i, i2).sendToTarget();
    }

    private void handleUpdateFaceView(boolean visible, boolean clearFaces) {
        boolean mirror = isFrontCamera();
        if (!visible) {
            this.mMainProtocol.updateFaceView(visible, clearFaces, mirror, false, -1);
        } else if ((this.mFaceDetectionStarted || isFaceBeautyMode()) && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(visible, true, mirror, true, this.mCameraDisplayOrientation);
        }
    }

    protected boolean isFaceBeautyMode() {
        return false;
    }

    public void stopObjectTracking(boolean realStop) {
    }

    public void notifyFocusAreaUpdate() {
        updatePreferenceTrampoline(3);
    }

    public void playSound(int soundId) {
        playCameraSound(soundId);
    }

    public void startObjectTracking() {
    }

    public void onObjectStable() {
    }

    private int getCountDownTimes() {
        int countdownTime;
        if (this.mBroadcastIntent != null) {
            countdownTime = CameraIntentManager.getInstance(this.mBroadcastIntent).getTimerDurationSeconds();
        } else {
            countdownTime = this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
        }
        if (countdownTime == -1) {
            return CameraSettings.getCountDownTimes();
        }
        if (this.mBroadcastIntent != null) {
            this.mBroadcastIntent.removeExtra("android.intent.extra.TIMER_DURATION_SECONDS");
        } else {
            this.mActivity.getIntent().removeExtra("android.intent.extra.TIMER_DURATION_SECONDS");
        }
        switch (countdownTime) {
            case 0:
                return 0;
            case 5:
                return 5;
            default:
                return 3;
        }
    }

    public void onShutterButtonClick(int mode) {
        if (!isDoingAction()) {
            setTriggerMode(mode);
            Log.d(TAG, "onShutterButtonClick " + String.valueOf(getCameraState()));
            int countDownTime = getCountDownTimes();
            if (countDownTime > 0) {
                startCount(countDownTime);
            } else if (!Storage.isLowStorageAtLastPoint()) {
                this.mFocusManager.prepareCapture(this.mNeedAutoFocus, 2);
                this.mFocusManager.doSnap();
                if (this.mFocusManager.isFocusingSnapOnFinish()) {
                    enableCameraControls(false);
                }
            }
        }
    }

    private void prepareNormalCapture() {
        String str = null;
        initFlashAutoStateForTrack(this.mCamera2Device.isNeedFlashOn());
        this.mEnabledPreviewThumbnail = false;
        this.mBurstShotTitle = null;
        this.mReceivedJpegCallbackNum = 0;
        this.mSavedJpegCallbackNum = 0;
        this.mCaptureStartTime = System.currentTimeMillis();
        ScenarioTrackUtil.trackCaptureTimeStart(isFrontCamera(), this.mModuleIndex);
        this.mLastCaptureTime = this.mCaptureStartTime;
        setCameraState(3);
        this.mJpegRotation = Util.getJpegRotation(this.mBogusCameraId, this.mOrientation);
        this.mCamera2Device.setJpegRotation(this.mJpegRotation);
        Location loc = LocationManager.instance().getCurrentLocation();
        this.mCamera2Device.setGpsLocation(loc);
        this.mLocation = loc;
        updateFrontMirror();
        if (CameraSettings.isPortraitModeBackOn()) {
            updateBeauty();
        }
        boolean enableParallel = isParallelEnable();
        this.mIsParallelProcess = enableParallel;
        if (enableParallel) {
            str = Storage.generateFilepath(Util.createJpegName(System.currentTimeMillis()) + getSuffix());
        }
        this.mParallelProcessingFilePath = str;
        this.mCamera2Device.setParallelProcessingEnable(enableParallel, this.mParallelProcessingFilePath);
        setWaterMark();
        setPictureOrientation();
        updateJpegQuality();
        if (needShowThumbProgressImmediately()) {
            updateThumbProgress(false);
        }
    }

    private void startNormalCapture(int mode) {
        prepareNormalCapture();
        if (CameraSettings.isGroupShotOn()) {
            prepareGroupShot();
        }
        this.mHandler.sendEmptyMessageDelayed(50, 8000);
        if (CameraSettings.isPortraitModeBackOn() && Device.isSupportDynamicLightSpot()) {
            this.mCamera2Device.takePortraitPicture(this, this, new PictureCallback() {
                public void onPictureTaken(byte[] data, Camera2Proxy camera) {
                    Log.d(Camera2Module.TAG, "onPictureTaken: received raw callback data " + data.length);
                    Camera2Module.this.mPortraitRawData = data;
                }

                public void onPictureTakenFailed() {
                }

                public void onPictureBurstFinished(boolean success) {
                }
            }, new PictureCallback() {
                public void onPictureTaken(byte[] data, Camera2Proxy camera) {
                    Log.d(Camera2Module.TAG, "onPictureTaken: received depth callback data " + data.length);
                    Camera2Module.this.mPortraitDepthData = data;
                }

                public void onPictureTakenFailed() {
                }

                public void onPictureBurstFinished(boolean success) {
                }
            });
        } else {
            this.mCamera2Device.takePicture(this, this);
        }
    }

    protected void prepareMultiCapture() {
        this.mMultiSnapStatus = true;
        this.mMultiSnapStopRequest = false;
        Util.clearMemoryLimit();
        prepareNormalCapture();
        CameraCapabilities cameraCapabilities = this.mCameraCapabilities;
        this.mTotalJpegCallbackNum = CameraCapabilities.getBurstShootCount();
        this.mMultiSnapPictureSize = this.mCamera2Device.getPictureSize();
        this.mHandler.removeMessages(49);
    }

    private void animateCapture() {
        if (!this.mIsImageCaptureIntent) {
            this.mActivity.getCameraScreenNail().animateCapture(getCameraRotation());
        }
    }

    public void onShutterButtonFocus(boolean pressed, int from) {
    }

    public void onLongPress(int x, int y) {
        if (isInTapableRect(x, y)) {
            onSingleTapUp(x, y);
            if (CameraSettings.isAEAFLockSupport()) {
                lockAEAF();
            }
            if (isSupportFocusShoot() && (is3ALocked() ^ 1) != 0) {
                setTriggerMode(80);
                onShutterButtonClick(getTriggerMode());
            }
            this.mMainProtocol.performHapticFeedback(0);
        }
    }

    public boolean onShutterButtonLongClick() {
        if (isDoingAction() || this.mIsImageCaptureIntent) {
            return false;
        }
        if (!CameraSettings.isBurstShootingEnable() || !ModuleManager.isCameraModule() || (this.mIsImageCaptureIntent ^ 1) == 0 || (CameraSettings.isGroupShotOn() ^ 1) == 0 || (CameraSettings.isGradienterOn() ^ 1) == 0 || (CameraSettings.isTiltShiftOn() ^ 1) == 0 || (DataRepository.dataItemRunning().isSwitchOn("pref_camera_hand_night_key") ^ 1) == 0 || (CameraSettings.isStereoModeOn() ^ 1) == 0 || (CameraSettings.isPortraitModeBackOn() ^ 1) == 0 || !isBackCamera() || (this.mMultiSnapStatus ^ 1) == 0 || (this.mHandler.hasMessages(24) ^ 1) == 0 || (this.mPendingMultiCapture ^ 1) == 0) {
            this.mLongPressedAutoFocus = true;
            this.mMainProtocol.setFocusViewType(false);
            this.mFocusManager.requestAutoFocus();
            this.mActivity.getScreenHint().updateHint();
            return false;
        }
        if (Device.isSupportedFastCapture()) {
            this.mUpdateImageTitle = true;
        }
        this.mPendingMultiCapture = true;
        this.mFocusManager.doMultiSnap(true);
        return true;
    }

    public void onShutterButtonLongClickCancel(boolean in) {
        this.mPendingMultiCapture = false;
        if (this.mMultiSnapStatus) {
            this.mHandler.sendEmptyMessageDelayed(49, 2000);
        }
        this.mMultiSnapStopRequest = true;
        if (this.mLongPressedAutoFocus) {
            this.mLongPressedAutoFocus = false;
            if (in) {
                onShutterButtonClick(10);
            }
        }
    }

    public boolean isDoingAction() {
        if (this.mPaused || this.isZooming || isKeptBitmapTexture() || this.mMultiSnapStatus || getCameraState() == 0 || getCameraState() == 3) {
            return true;
        }
        return isInCountDown();
    }

    public void onThumbnailClicked(View v) {
        if (!(isDoingAction() || this.mActivity.getThumbnailUpdater().getThumbnail() == null)) {
            this.mActivity.gotoGallery();
        }
    }

    private void startCount(final int time) {
        tryRemoveCountDownMessage();
        Log.e("startCount:", time + "");
        Observable.interval(1, TimeUnit.SECONDS).take((long) time).observeOn(AndroidSchedulers.mainThread()).subscribe(new Observer<Long>() {
            public void onSubscribe(Disposable disposable) {
                Camera2Module.this.mCountdownDisposable = disposable;
                Camera2Module.this.playSound(7);
                Camera2Module.this.mMainProtocol.clearFocusView(7);
                Camera2Module.this.mMainProtocol.showDelayNumber(time);
            }

            public void onNext(Long aLong) {
                int number = time - (aLong.intValue() + 1);
                if (number > 0) {
                    Camera2Module.this.playSound(5);
                    Camera2Module.this.mMainProtocol.showDelayNumber(number);
                }
            }

            public void onError(Throwable throwable) {
            }

            public void onComplete() {
                Camera2Module.this.tryRemoveCountDownMessage();
                Camera2Module.this.onShutterButtonFocus(true, 3);
                Camera2Module.this.startNormalCapture(Camera2Module.this.getTriggerMode());
                Camera2Module.this.onShutterButtonFocus(false, 0);
            }
        });
    }

    private boolean isInCountDown() {
        return this.mCountdownDisposable != null ? this.mCountdownDisposable.isDisposed() ^ 1 : false;
    }

    public void tryRemoveCountDownMessage() {
        if (this.mCountdownDisposable != null && (this.mCountdownDisposable.isDisposed() ^ 1) != 0) {
            this.mCountdownDisposable.dispose();
            this.mCountdownDisposable = null;
            this.mMainProtocol.hideDelayNumber();
        }
    }

    public boolean isKeptBitmapTexture() {
        return this.mKeepBitmapTexture;
    }

    public void onReviewDoneClicked() {
        doAttach();
    }

    public void onReviewCancelClicked() {
        this.mKeepBitmapTexture = false;
        if (isSelectingCapturedImage()) {
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
            hidePostCaptureAlert();
            return;
        }
        this.mActivity.setResult(0, new Intent());
        this.mActivity.finish();
    }

    private boolean isSelectingCapturedImage() {
        if (this.mIsImageCaptureIntent && ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).getActiveFragment(R.id.bottom_action) == 4083) {
            return true;
        }
        return false;
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
        if (!(this.mFocusManager == null || this.mActivity.getCameraScreenNail() == null)) {
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
        if (scanQRCodeEnabled()) {
            QRCodeManager.instance(this.mActivity).setPreviewLayoutSize(rect.width(), rect.height());
        }
    }

    public void onPreviewSizeChanged(int width, int height) {
        if (this.mFocusManager != null) {
            this.mFocusManager.setPreviewSize(width, height);
        }
    }

    public void onFilterChanged(int category, int newIndex) {
        updatePreferenceTrampoline(2);
        this.mMainProtocol.updateEffectViewVisible();
    }

    public boolean onBackPressed() {
        if (!isCreated()) {
            return false;
        }
        tryRemoveCountDownMessage();
        if (getCameraState() != 3 || System.currentTimeMillis() - this.mLastCaptureTime >= 8000) {
            return super.onBackPressed();
        }
        return true;
    }

    public void onResume() {
        super.onResume();
        this.mHandler.removeMessages(50);
        this.mMainProtocol.initEffectCropView();
        if (!isSelectingCapturedImage()) {
            this.mKeepBitmapTexture = false;
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
        }
        if (scanQRCodeEnabled()) {
            QRCodeManager.instance(this.mActivity).setEnable(true);
            QRCodeManager.instance(this.mActivity).resume();
            QRCodeManager.instance(this.mActivity).setResultCallback(new QRCode$QRCodeResultCallback() {
                public void onStart() {
                    Log.d(Camera2Module.TAG, "onStart");
                }

                public void onFindQRCode(Result result) {
                    if (Camera2Module.this.scanQRCodeEnabled()) {
                        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).showQrCodeTip();
                    }
                }

                public void onDecodeTimeOut() {
                    ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).hideQrCodeTip();
                }

                public void onFailed() {
                }

                public void onStop() {
                    Log.d(Camera2Module.TAG, "onStop");
                }
            });
        }
        keepScreenOnAwhile();
        this.mActivity.runOnUiThread(new Runnable() {
            public void run() {
                if (Camera2Module.this.mLensApi != null) {
                    Camera2Module.this.mLensApi.onResume();
                }
            }
        });
    }

    public void setFrameAvailable(boolean available) {
        super.setFrameAvailable(available);
        if (CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(1);
            this.mActivity.loadCameraSound(0);
            this.mActivity.loadCameraSound(4);
            this.mActivity.loadCameraSound(5);
            this.mActivity.loadCameraSound(7);
        }
    }

    public void onPause() {
        super.onPause();
        if (this.mFocusManager != null) {
            this.mFocusManager.removeMessages();
        }
        resetGradienter();
        tryRemoveCountDownMessage();
        this.mActivity.getSensorStateManager().reset();
        this.mActivity.getSensorStateManager().setSensorStateListener(null);
        resetScreenOn();
        closeCamera();
        BeautyParameters.getInstance().setOnFaceBeautyChangedListener(null);
        releaseEffectProcessor();
        this.mActivity.runOnUiThread(new Runnable() {
            public void run() {
                if (Camera2Module.this.mLensApi != null) {
                    Camera2Module.this.mLensApi.onPause();
                    Log.d(Camera2Module.TAG, "run:  mLensApi.onPause();");
                }
            }
        });
        QRCodeManager.instance(this.mActivity).pause();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mHandler != null) {
            this.mHandler.sendEmptyMessage(45);
        }
        QRCodeManager.instance(this.mActivity).destroy();
    }

    public boolean shouldReleaseLater() {
        if (!(this.mIsImageCaptureIntent || getCameraState() != 3 || (this.mMultiSnapStatus ^ 1) == 0)) {
            int i;
            if (this.mHandler == null) {
                i = 0;
            } else if (this.mHandler.hasMessages(48)) {
                i = 1;
            } else {
                i = this.mHandler.hasMessages(49);
            }
            if (!((i ^ 1) == 0 || (this.mFocusManager.isFocusingSnapOnFinish() ^ 1) == 0)) {
                if (this.mModuleIndex == 167) {
                    return getManualValue("pref_qc_camera_exposuretime_key", getString(R.string.pref_camera_exposuretime_default)).equals(getString(R.string.pref_camera_exposuretime_default));
                }
                return true;
            }
        }
        return false;
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null && (this.mActivity.isActivityPaused() ^ 1) == 0) {
            Log.d(TAG, "doLaterRelease");
            if (this.mHandler != null) {
                this.mHandler.removeMessages(50);
            }
            if (this.mActivity != null) {
                this.mActivity.releaseAll(true);
            }
        }
    }

    public void onCreate(int moduleIndex, int cameraId) {
        super.onCreate(moduleIndex, cameraId);
        parseIntent();
        this.mHandler = new MainHandler(this.mActivity.getMainLooper());
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        QRCodeManager.instance(this.mActivity).create();
        onCameraOpened();
        this.mLensApi = new LensApi(this.mActivity);
        this.mLensApi.checkLensAvailability(new LensAvailabilityCallback() {
            public void onAvailabilityStatusFetched(int i) {
                boolean z = false;
                Camera2Module.this.mLensStatus = i;
                if (Camera2Module.this.mLensStatus == 0) {
                    z = true;
                }
                CameraSettings.setGoogleLensAvailability(z);
            }
        });
    }

    private void parseIntent() {
        CameraIntentManager manager = this.mActivity.getCameraIntentManager();
        this.mIsImageCaptureIntent = manager.isImageCaptureIntent();
        if (this.mIsImageCaptureIntent) {
            this.mSaveUri = manager.getExtraSavedUri();
            this.mCropValue = manager.getExtraCropValue();
            this.mIsSaveCaptureImage = manager.getExtraShouldSaveCapture().booleanValue();
            this.mQuickCapture = manager.isQuickCapture().booleanValue();
        }
    }

    public void closeCamera() {
        setCameraState(0);
        if (this.mCamera2Device != null) {
            if (this.mBurstDisposable != null) {
                this.mBurstDisposable.dispose();
            }
            if (this.mMetaDataFloableEmitter != null) {
                this.mMetaDataFloableEmitter.onComplete();
            }
            if (this.mMetaDataDisposable != null) {
                this.mMetaDataDisposable.dispose();
            }
            if (this.mAiSceneFloableEmitter != null) {
                this.mAiSceneFloableEmitter.onComplete();
            }
            if (this.mAiSceneDisposable != null) {
                this.mAiSceneDisposable.dispose();
            }
            this.mCamera2Device.setScreenLightCallback(null);
            this.mCamera2Device.setMetaDataCallback(null);
            this.mCamera2Device.setHDRCheckerCallback(null);
            this.mCamera2Device.setErrorCallback(null);
            this.mCamera2Device.releasePictureCallback();
            this.mCamera2Device.releaseCameraPreviewCallback(null);
            this.mCamera2Device.setFocusCallback(null);
            this.mCamera2Device.setASD(false);
            this.mMetaDataFloableEmitter = null;
            if (scanQRCodeEnabled()) {
                this.mCamera2Device.stopPreviewCallback(true);
            }
            if (this.mFaceDetectionStarted) {
                this.mFaceDetectionStarted = false;
                this.mCamera2Device.setFaceDetectionCallback(null);
            }
            this.m3ALocked = false;
            this.mCamera2Device = null;
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
            this.mFocusManager.destroy();
        }
    }

    public void startPreview() {
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setMetaDataCallback(this);
            this.mCamera2Device.setScreenLightCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPictureSize);
            this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), scanQRCodeEnabled(), isNeedRawStream(), getOperatingMode(), this);
        }
    }

    private boolean isNeedRawStream() {
        if (ModuleManager.isManualModule() && CameraSettings.isEnableDNG()) {
            for (CameraSize pictureSize : this.mCameraCapabilities.getSupportedOutputSize(37)) {
                Log.d(TAG, "" + pictureSize.width + "x" + pictureSize.height + " " + this.mPictureSize.width + "x" + this.mPictureSize.height);
                if (pictureSize.width == this.mPictureSize.width && pictureSize.height == this.mPictureSize.height) {
                    return true;
                }
            }
        }
        return false;
    }

    private int getOperatingMode() {
        int operatingMode;
        if (!isFrontCamera()) {
            switch (ModuleManager.getActiveModuleIndex()) {
                case 167:
                    operatingMode = 32771;
                    break;
                case 171:
                    operatingMode = 32770;
                    break;
                default:
                    operatingMode = 32769;
                    break;
            }
        }
        mIsBeautyFrontOn = BeautyParameters.getInstance().isFaceBeautyOn();
        if (this.mCameraCapabilities.isSupportedQcfa() && (mIsBeautyFrontOn ^ 1) != 0 && "off".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex))) {
            operatingMode = 32775;
        } else {
            operatingMode = 32773;
        }
        this.mOperatingMode = operatingMode;
        return operatingMode;
    }

    public void onPreviewSessionSuccess(CameraCaptureSession session) {
        Log.e("onPreviewSessionSuccess:", Thread.currentThread().getName());
        if (session != null && isAlive()) {
            if (!isKeptBitmapTexture()) {
                this.mHandler.sendEmptyMessage(9);
            }
            setCameraState(1);
            this.mFaceDetectionEnabled = false;
            updatePreferenceInWorkThread(UpdateConstant.CAMERA_TYPES_ON_PREVIEW_SUCCESS);
            if (ModuleManager.isManualModule()) {
                updatePreferenceInWorkThread(UpdateConstant.CAMERA_TYPES_MANUALLY);
            }
            if (CameraIntentManager.checkCallerLegality(this.mActivity)) {
                if (this.mActivity.getCameraIntentManager().isOpenOnly()) {
                    this.mActivity.getIntent().removeExtra("android.intent.extra.TIMER_DURATION_SECONDS");
                } else {
                    this.mActivity.getIntent().removeExtra("android.intent.extra.CAMERA_OPEN_ONLY");
                    this.mHandler.sendEmptyMessageDelayed(52, 1000);
                }
            }
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession session) {
        this.mHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession session) {
        Log.d(TAG, "onPreviewSessionClosed: ");
        QRCodeManager.instance(this.mActivity).stopDecode();
        setCameraState(0);
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isAlive()) {
            switch (focusTask.getFocusTrigger()) {
                case 1:
                    Log.v(TAG, String.format(Locale.ENGLISH, "FocusTime=%1$dms focused=%2$b", new Object[]{Long.valueOf(focusTask.getElapsedTime()), Boolean.valueOf(focusTask.isSuccess())}));
                    if (!(this.mFocusManager.isFocusingSnapOnFinish() || getCameraState() == 3)) {
                        setCameraState(1);
                    }
                    this.mFocusManager.onFocusResult(focusTask);
                    this.mActivity.getSensorStateManager().reset();
                    if (focusTask.isSuccess() && this.m3ALocked) {
                        this.mCamera2Device.lockExposure(true);
                        break;
                    }
                case 2:
                case 3:
                    String logContent = null;
                    if (focusTask.isFocusing()) {
                        logContent = "onAutoFocusMoving start";
                        this.mAFEndLogTimes = 0;
                    } else if (this.mAFEndLogTimes == 0) {
                        logContent = "onAutoFocusMoving end. result=" + focusTask.isSuccess();
                        this.mAFEndLogTimes++;
                    }
                    if (Util.sIsDumpLog && logContent != null) {
                        Log.v(TAG, logContent);
                    }
                    if (getCameraState() != 3 || focusTask.getFocusTrigger() == 3) {
                        this.mMainProtocol.setFocusViewType(false);
                        this.mFocusManager.onFocusResult(focusTask);
                        break;
                    }
            }
        }
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mCamera2Device.pausePreview();
        QRCodeManager.instance(this.mActivity).stopDecode();
        setCameraState(0);
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mCamera2Device.resumePreview();
        if (scanQRCodeEnabled()) {
            QRCodeManager.instance(this.mActivity).startDecode();
        }
        setCameraState(1);
    }

    private void resumePreviewInWorkThread() {
        updatePreferenceInWorkThread(new int[0]);
    }

    public void onShutter() {
        if (getCameraState() != 0) {
            this.mShutterCallbackTime = System.currentTimeMillis();
            this.mShutterLag = this.mShutterCallbackTime - this.mCaptureStartTime;
            Log.v(TAG, "mShutterLag = " + this.mShutterLag + "ms");
            if (this.mReceivedJpegCallbackNum == 0) {
                if (enablePreviewAsThumbnail()) {
                    this.mEnabledPreviewThumbnail = true;
                    this.mActivity.getCameraScreenNail().requestReadPixels();
                } else {
                    updateThumbProgress(false);
                    animateCapture();
                    playSound(0);
                }
            }
        }
    }

    private boolean needImageThumbnail(int saveType) {
        if (this.mEnabledPreviewThumbnail) {
            return false;
        }
        switch (saveType) {
            case 4:
            case 5:
            case 10:
            case 11:
            case 12:
                return false;
            default:
                return true;
        }
    }

    /* JADX WARNING: Missing block: B:16:0x002a, code:
            return false;
     */
    private boolean enablePreviewAsThumbnail() {
        /*
        r3 = this;
        r2 = 1;
        r1 = 0;
        r0 = r3.isAlive();
        if (r0 != 0) goto L_0x0009;
    L_0x0008:
        return r1;
    L_0x0009:
        r0 = com.android.camera.CameraSettings.isGradienterOn();
        if (r0 == 0) goto L_0x0010;
    L_0x000f:
        return r1;
    L_0x0010:
        r0 = com.android.camera.CameraSettings.isGroupShotOn();
        if (r0 == 0) goto L_0x0017;
    L_0x0016:
        return r1;
    L_0x0017:
        r0 = com.android.camera.CameraSettings.isPortraitModeBackOn();
        if (r0 == 0) goto L_0x001e;
    L_0x001d:
        return r2;
    L_0x001e:
        r0 = com.android.camera.CameraSettings.showGenderAge();
        if (r0 != 0) goto L_0x002a;
    L_0x0024:
        r0 = com.android.camera.CameraSettings.isMagicMirrorOn();
        if (r0 == 0) goto L_0x002b;
    L_0x002a:
        return r1;
    L_0x002b:
        r0 = r3.mCamera2Device;
        if (r0 == 0) goto L_0x0038;
    L_0x002f:
        r0 = r3.mCamera2Device;
        r0 = r0.isNeedPreviewThumbnail();
        if (r0 == 0) goto L_0x0038;
    L_0x0037:
        return r2;
    L_0x0038:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.enablePreviewAsThumbnail():boolean");
    }

    public void onPreviewPixelsRead(byte[] pixels, int width, int height) {
        boolean z = false;
        animateCapture();
        playSound(0);
        Bitmap bitmap = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        bitmap.copyPixelsFromBuffer(ByteBuffer.wrap(pixels));
        int shootOrientation = this.mShootOrientation - this.mDisplayRotation;
        if (isFrontCamera() && Device.isFrontCameraAtBottom() && shootOrientation % 180 == 0) {
            shootOrientation = 0;
        }
        if (isFrontCamera()) {
            z = isFrontMirror() ^ 1;
        }
        Thumbnail thumbnail = Thumbnail.createThumbnail(null, bitmap, shootOrientation, z);
        thumbnail.startWaitingForUri();
        this.mActivity.getThumbnailUpdater().setThumbnail(thumbnail, true, true);
    }

    protected boolean isZeroShotMode() {
        if (this.mModuleIndex == 167) {
            return false;
        }
        return true;
    }

    public void onPictureTaken(byte[] jpegData, Camera2Proxy camera) {
        if (getCameraState() != 0) {
            int resultWidth;
            int resultHeight;
            this.mJpegPictureCallbackTime = System.currentTimeMillis();
            this.mReceivedJpegCallbackNum++;
            int jpegWidth = this.mPictureSize.getWidth();
            int jpegHeight = this.mPictureSize.getHeight();
            Log.d(TAG, "JpegPictureCallback#onPictureTaken data " + (jpegData == null ? "null" : Integer.valueOf(jpegData.length)));
            int orientation = Exif.getOrientation(jpegData);
            if ((this.mJpegRotation + orientation) % 180 == 0) {
                resultWidth = jpegWidth;
                resultHeight = jpegHeight;
            } else {
                resultWidth = jpegHeight;
                resultHeight = jpegWidth;
            }
            this.mBurstShotTitle = null;
            boolean isParallelProcess = false;
            if (isParallelEnable()) {
                isParallelProcess = this.mIsParallelProcess;
                Log.d(TAG, "is parallel processing " + isParallelProcess);
                if (isParallelProcess) {
                    String filePath = this.mParallelProcessingFilePath;
                    Log.d(TAG, "is parallel processing, read file path from hal filePath:" + filePath);
                    if (TextUtils.isEmpty(filePath)) {
                        Log.e(TAG, "the file path should exist in params");
                    } else {
                        this.mBurstShotTitle = Util.getFileTitleFromPath(filePath);
                        Log.e(TAG, "fileTitle from path is " + this.mBurstShotTitle);
                    }
                }
            } else {
                Log.d(TAG, "disable parallel processing ");
            }
            String algorithmName = null;
            if (!Device.enableAlgorithmInFileSuffix()) {
                if (this.mCamera2Device.isBokehEnabled()) {
                    algorithmName = "soft-portrait";
                } else if (this.mModuleIndex == 171) {
                    algorithmName = "portrait";
                } else {
                    algorithmName = this.mMutexModePicker.getAlgorithmName();
                }
            }
            if (this.mBurstShotTitle == null) {
                this.mBurstShotTitle = Util.createJpegName(System.currentTimeMillis()) + getSuffix();
            }
            String title = this.mBurstShotTitle;
            DrawJPEGAttribute jpeg = null;
            if (EffectController.getInstance().hasEffect()) {
                jpeg = getDrawJPEGAttribute(jpegData, needImageThumbnail(3), resultWidth, resultHeight, title, orientation, algorithmName, true);
            }
            trackGeneralInfo(1, false);
            trackPictureTaken(1, false, this.mLocation != null);
            if (this.mIsImageCaptureIntent) {
                if (jpeg != null) {
                    this.mEffectProcessor.processorJpegSync(jpeg);
                    this.mJpegImageData = jpeg.mData;
                } else {
                    this.mJpegImageData = jpegData;
                }
                if (this.mQuickCapture) {
                    doAttach();
                } else {
                    Bitmap cover = Thumbnail.createBitmap(this.mJpegImageData, ((360 - this.mShootOrientation) + orientation) + this.mDisplayRotation, false, Integer.highestOneBit((int) Math.floor(((double) resultWidth) / ((double) this.mPreviewSize.width))));
                    if (cover != null && isAlive()) {
                        this.mActivity.getCameraScreenNail().renderBitmapToCanvas(cover);
                        this.mKeepBitmapTexture = true;
                        showPostCaptureAlert();
                    }
                }
            } else if (CameraSettings.isGroupShotOn()) {
                int result = this.mGroupShot.attach(jpegData);
                Log.v(TAG, String.format(Locale.ENGLISH, "mGroupShot attach() = 0x%08x index=%d", new Object[]{Integer.valueOf(result), Integer.valueOf(this.mReceivedJpegCallbackNum)}));
                if (this.mReceivedJpegCallbackNum < this.mTotalJpegCallbackNum) {
                    if (this.mReceivedJpegCallbackNum == 1 && DataRepository.dataItemGlobal().getBoolean("pref_groupshot_with_primitive_picture_key", true)) {
                        this.mActivity.getImageSaver().addImage(jpegData, needImageThumbnail(10), title, System.currentTimeMillis(), null, this.mLocation, resultWidth, resultHeight, null, orientation, false, false, true, false);
                    }
                    this.mBurstShotTitle = null;
                    this.mCamera2Device.takePicture(this, this);
                    return;
                }
                new SaveOutputImageTask(System.currentTimeMillis(), this.mLocation, resultWidth, resultHeight, orientation, title, this.mGroupShot).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                this.mGroupShotTimes++;
            } else if (this.mPortraitDepthData != null && this.mPortraitRawData != null) {
                long startTime = System.currentTimeMillis();
                if (jpeg != null) {
                    this.mEffectProcessor.processorJpegSync(jpeg);
                    DrawJPEGAttribute rawJPEGAttribute = getDrawJPEGAttribute(this.mPortraitRawData, needImageThumbnail(1), resultWidth, resultHeight, title, orientation, algorithmName, false);
                    this.mEffectProcessor.processorJpegSync(rawJPEGAttribute);
                    this.mJpegImageData = jpeg.mData;
                    this.mPortraitRawData = rawJPEGAttribute.mData;
                    Log.d(TAG, "onPictureTaken: DrawJPEG cost " + (System.currentTimeMillis() - startTime));
                } else {
                    this.mJpegImageData = jpegData;
                }
                this.mActivity.getImageSaver().addImage(composeDepthMapPicture(this.mJpegImageData, this.mPortraitDepthData, this.mPortraitRawData), needImageThumbnail(1), title, System.currentTimeMillis(), null, this.mLocation, resultWidth, resultHeight, null, orientation, false, false, true, false, isParallelProcess, algorithmName);
            } else if (jpeg != null) {
                this.mEffectProcessor.processorJpegAsync(jpeg);
            } else {
                this.mActivity.getImageSaver().addImage(jpegData, needImageThumbnail(1), title, System.currentTimeMillis(), null, this.mLocation, resultWidth, resultHeight, null, orientation, false, false, true, false, isParallelProcess, algorithmName);
            }
            this.mPortraitDepthData = null;
            this.mPortraitRawData = null;
            long now = System.currentTimeMillis();
            this.mJpegCallbackFinishTime = now - this.mJpegPictureCallbackTime;
            Log.v(TAG, "mJpegCallbackFinishTime = " + this.mJpegCallbackFinishTime + "ms");
            long captureCostTime = now - this.mCaptureStartTime;
            CameraStatUtil.trackTakePictureCost(captureCostTime, isFrontCamera(), this.mModuleIndex);
            ScenarioTrackUtil.trackCaptureTimeEnd();
            Log.d(TAG, "mCaptureStartTime(from onShutterButtonClick start to jpegCallback finished) = " + captureCostTime + "ms");
            if (Util.isKPILogEnabled()) {
                Log.d(TAG, "[KPI] Capture duration: " + captureCostTime + "ms");
            }
            onPictureTakenFinished(false);
        }
    }

    public void onPictureTakenFailed() {
        onPictureTakenFinished(true);
    }

    public void onPictureBurstFinished(boolean success) {
    }

    private DrawJPEGAttribute getDrawJPEGAttribute(byte[] jpegData, boolean needThumbnail, int resultWidth, int resultHeight, String title, int orientation, String algorithmName, boolean applyWaterMark) {
        int max;
        int max2;
        if (resultWidth > resultHeight) {
            max = Math.max(this.mPreviewSize.width, this.mPreviewSize.height);
        } else {
            max = Math.min(this.mPreviewSize.width, this.mPreviewSize.height);
        }
        if (resultHeight > resultWidth) {
            max2 = Math.max(this.mPreviewSize.width, this.mPreviewSize.height);
        } else {
            max2 = Math.min(this.mPreviewSize.width, this.mPreviewSize.height);
        }
        int effect = EffectController.getInstance().getEffect(false);
        EffectRectAttribute copyEffectRectAttribute = EffectController.getInstance().copyEffectRectAttribute();
        Location location = this.mLocation == null ? null : new Location(this.mLocation);
        long currentTimeMillis = System.currentTimeMillis();
        int i = this.mShootOrientation;
        float f = (CameraSettings.isGradienterOn() && this.mShootRotation == -1.0f) ? 0.0f : this.mShootRotation;
        return new DrawJPEGAttribute(jpegData, needThumbnail, max, max2, resultWidth, resultHeight, effect, copyEffectRectAttribute, location, title, currentTimeMillis, i, orientation, f, isFrontMirror(), algorithmName, applyWaterMark);
    }

    private void onPictureTakenFinished(boolean failed) {
        if (!isKeptBitmapTexture()) {
            setCameraState(1);
            enableCameraControls(true);
        }
        this.mHandler.removeMessages(50);
        doLaterReleaseIfNeed();
    }

    private byte[] composeDepthMapPicture(byte[] jpegData, byte[] depthMapOriginalData, byte[] rawData) {
        Log.d(TAG, "composeDepthMapPicture: process in portrait depth map picture");
        long startTime = System.currentTimeMillis();
        ArcsoftDepthMap depthMap = new ArcsoftDepthMap(depthMapOriginalData);
        byte[] dulCameraWaterMark = null;
        if (CameraSettings.isDualCameraWaterMarkOpen()) {
            try {
                dulCameraWaterMark = IOUtils.toByteArray(new FileInputStream(SnapshotEffectRender.getDualCameraWaterMarkFilePathVendor()));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        byte[] timeWaterMark = null;
        if (CameraSettings.isTimeWaterMarkOpen()) {
            timeWaterMark = Util.getTimeWaterMarkData(this.mPictureSize.getWidth(), this.mPictureSize.getHeight());
        }
        jpegData = depthMap.writeDepthExif(jpegData, dulCameraWaterMark, timeWaterMark);
        byte[] depthData = depthMap.getDepthMapData();
        byte[] finalJpegData = new byte[((jpegData.length + rawData.length) + depthData.length)];
        System.arraycopy(jpegData, 0, finalJpegData, 0, jpegData.length);
        System.arraycopy(rawData, 0, finalJpegData, jpegData.length, rawData.length);
        System.arraycopy(depthData, 0, finalJpegData, jpegData.length + rawData.length, depthData.length);
        Log.d(TAG, "composeDepthMapPicture: compose portrait picture cost: " + (System.currentTimeMillis() - startTime));
        return finalJpegData;
    }

    private boolean isFrontMirror() {
        if (isFrontCamera()) {
            return CameraSettings.isFrontMirror();
        }
        return false;
    }

    private void showPostCaptureAlert() {
        enableCameraControls(false);
        this.mFocusManager.removeMessages();
        stopFaceDetection(true);
        pausePreview();
        this.mMainProtocol.setEffectViewVisible(false);
        ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
        resetMetaDataManager();
    }

    private void hidePostCaptureAlert() {
        enableCameraControls(true);
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
        this.mMainProtocol.setEffectViewVisible(true);
        ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    private void doAttach() {
        if (!this.mPaused) {
            byte[] data = this.mJpegImageData;
            if (this.mIsSaveCaptureImage) {
                saveJpegData(data);
            }
            if (this.mCropValue != null) {
                Uri tempUri = null;
                Closeable closeable = null;
                try {
                    File path = this.mActivity.getFileStreamPath("crop-temp");
                    path.delete();
                    FileOutputStream tempStream = this.mActivity.openFileOutput("crop-temp", 0);
                    tempStream.write(data);
                    tempStream.close();
                    closeable = null;
                    tempUri = Uri.fromFile(path);
                    Bundle newExtras = new Bundle();
                    if ("circle".equals(this.mCropValue)) {
                        newExtras.putString("circleCrop", "true");
                    }
                    if (this.mSaveUri != null) {
                        newExtras.putParcelable("output", this.mSaveUri);
                    } else {
                        newExtras.putBoolean("return-data", true);
                    }
                    Intent cropIntent = new Intent("com.android.camera.action.CROP");
                    cropIntent.setData(tempUri);
                    cropIntent.putExtras(newExtras);
                    this.mActivity.startActivityForResult(cropIntent, 1000);
                } catch (FileNotFoundException e) {
                    this.mActivity.setResult(0);
                    this.mActivity.finish();
                } catch (IOException e2) {
                    this.mActivity.setResult(0);
                    this.mActivity.finish();
                } finally {
                    Util.closeSilently(closeable);
                }
            } else if (this.mSaveUri != null) {
                Closeable closeable2 = null;
                try {
                    closeable2 = this.mContentResolver.openOutputStream(this.mSaveUri);
                    closeable2.write(data);
                    closeable2.close();
                    this.mActivity.setResult(-1);
                } catch (IOException ex) {
                    Log.e(TAG, "IOException when doAttach");
                    ex.printStackTrace();
                } finally {
                    this.mActivity.finish();
                    Util.closeSilently(closeable2);
                }
            } else {
                this.mActivity.setResult(-1, new Intent("inline-data").putExtra("data", Util.rotate(Util.makeBitmap(data, 51200), Exif.getOrientation(this.mJpegImageData))));
                this.mActivity.finish();
            }
        }
    }

    private void saveJpegData(byte[] data) {
        int width;
        int height;
        Location loc = LocationManager.instance().getCurrentLocation();
        int orientation = Exif.getOrientation(data);
        if ((this.mJpegRotation + orientation) % 180 == 0) {
            width = this.mPictureSize.getWidth();
            height = this.mPictureSize.getHeight();
        } else {
            width = this.mPictureSize.getHeight();
            height = this.mPictureSize.getWidth();
        }
        byte[] bArr = data;
        this.mActivity.getImageSaver().addImage(bArr, needImageThumbnail(11), Util.createJpegName(System.currentTimeMillis()), System.currentTimeMillis(), null, loc, width, height, null, orientation, false, false, true, false);
    }

    protected void resetMetaDataManager() {
        boolean isSupportedMetadata = CameraSettings.isSupportedMetadata();
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra("from_where", this.mModuleIndex);
        intent.putExtra("IsCaptureIntent", this.mIsImageCaptureIntent);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.CAMERA_TYPES_INIT);
        setPreviewFrameLayoutAspectRatio();
        if (!isKeptBitmapTexture()) {
            startPreview();
        }
        BeautyParameters.getInstance().setOnFaceBeautyChangedListener(this);
        initMetaParser();
        if (Device.isSupportAiScene()) {
            initAiSceneParser();
        }
        this.mOnResumeTime = SystemClock.uptimeMillis();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
    }

    public void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(4, this.mCameraCapabilities.getSupportedFocusModes());
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
    }

    private void setPreviewFrameLayoutAspectRatio() {
        if (this.mPreviewSize != null) {
            this.mMainProtocol.setPreviewAspectRatio(CameraSettings.getPreviewAspectRatio(this.mPreviewSize.width, this.mPreviewSize.height));
        }
    }

    private void initializeFocusManager() {
        this.mFocusManager = new FocusManager2(this.mCameraCapabilities, this, isFrontCamera(), this.mActivity.getMainLooper());
        Rect rect = null;
        if (this.mActivity.getCameraScreenNail() != null) {
            rect = this.mActivity.getCameraScreenNail().getRenderRect();
        }
        if (rect == null || rect.width() <= 0) {
            this.mFocusManager.setRenderSize(Util.sWindowWidth, Util.sWindowHeight);
            this.mFocusManager.setPreviewSize(Util.sWindowWidth, Util.sWindowHeight);
            return;
        }
        this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
        this.mFocusManager.setPreviewSize(rect.width(), rect.height());
    }

    public void consumePreference(@UpdateType int... updateTypes) {
        for (int type : updateTypes) {
            switch (type) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case 2:
                    updateFilter();
                    break;
                case 3:
                    updateFocusArea();
                    break;
                case 4:
                    updateScene();
                    break;
                case 5:
                    updateFace();
                    break;
                case 6:
                    updateWhiteBalance();
                    break;
                case 7:
                    updateJpegQuality();
                    break;
                case 8:
                    updateJpegThumbnailSize();
                    break;
                case 9:
                    updateAntiBanding(CameraSettings.getAntiBanding());
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                    updateHDRPreference();
                    break;
                case 12:
                    setEvValue();
                    break;
                case 13:
                    updateBeauty();
                    break;
                case 14:
                    updateFocusMode();
                    break;
                case 15:
                    updateISO();
                    break;
                case 16:
                    updateExposureTime();
                    break;
                case 19:
                    updateFpsRange();
                    break;
                case MotionEventCompat.AXIS_RUDDER /*20*/:
                    updateOIS();
                    break;
                case MotionEventCompat.AXIS_WHEEL /*21*/:
                    updateMute();
                    break;
                case MotionEventCompat.AXIS_GAS /*22*/:
                    updateZsl();
                    break;
                case MotionEventCompat.AXIS_BRAKE /*23*/:
                    updateQr();
                    break;
                case MotionEventCompat.AXIS_DISTANCE /*24*/:
                    setZoomRatio(getZoomValue());
                    break;
                case MotionEventCompat.AXIS_TILT /*25*/:
                    focusCenter();
                    break;
                case 26:
                    updateContrast();
                    break;
                case 27:
                    updateSaturation();
                    break;
                case 28:
                    updateSharpness();
                    break;
                case 29:
                    updateExposureMeteringMode();
                    break;
                case 30:
                    updateSuperResolution();
                    break;
                case MotionEventCompat.AXIS_GENERIC_3 /*34*/:
                    updateMfnr(CameraSettings.isMfnrSatEnable());
                    break;
                case MotionEventCompat.AXIS_GENERIC_4 /*35*/:
                    updateDeviceOrientation();
                    break;
                case MotionEventCompat.AXIS_GENERIC_5 /*36*/:
                    updateASD();
                    break;
                case MotionEventCompat.AXIS_GENERIC_6 /*37*/:
                    updateBokeh();
                    break;
                case MotionEventCompat.AXIS_GENERIC_7 /*38*/:
                    updateFaceAgeAnalyze();
                    break;
                case MotionEventCompat.AXIS_GENERIC_8 /*39*/:
                    updateFaceScore();
                    break;
                case MotionEventCompat.AXIS_GENERIC_9 /*40*/:
                    updateFrontMirror();
                    break;
                case MotionEventCompat.AXIS_GENERIC_10 /*41*/:
                    updateOperatingMode();
                    break;
                default:
                    throw new RuntimeException("no consumer for this updateType: " + type);
            }
        }
    }

    private void updatePictureAndPreviewSize() {
        CameraSize pictureSize = getBestPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256));
        CameraSize optimalSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(pictureSize.width, pictureSize.height));
        this.mPictureSize = pictureSize;
        this.mPreviewSize = optimalSize;
        if (!optimalSize.equals(this.mCamera2Device.getPreviewSize())) {
            this.mCamera2Device.setPreviewSize(optimalSize);
        }
        Log.e("updateSize:", pictureSize.width + " | " + pictureSize.height + " || " + this.mPreviewSize.width + " | " + this.mPreviewSize.height);
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private void updateFilter() {
        setEffectFilter(CameraSettings.getShaderEffect());
    }

    private void setEffectFilter(int effect) {
        Log.d(TAG, "setEffectFilter: " + effect);
        EffectController.getInstance().setEffect(effect);
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(effect);
        }
    }

    private void setAiSceneEffect(int scene) {
        Log.d(TAG, "setAiSceneEffect: " + scene);
        ArrayList<FilterInfo> filterInfoList = EffectController.getInstance().getFilterInfo(5);
        if (scene < 0 || scene > filterInfoList.size()) {
            Log.e(TAG, "setAiSceneEffect: scene unknown!");
            return;
        }
        int filterId = CameraSettings.getShaderEffect();
        if (FilterInfo.getCategory(filterId) == 5 || filterId == FilterInfo.FILTER_ID_NONE) {
            int effectId = ((FilterInfo) filterInfoList.get(scene)).getId();
            EffectController.getInstance().setAiSceneEffect(effectId);
            this.mHasAiSceneFilterEffect = effectId != FilterInfo.FILTER_ID_NONE;
            if (EffectController.getInstance().hasEffect()) {
                prepareEffectProcessor(effectId);
            }
        }
    }

    private void prepareEffectProcessor(int effect) {
        if (this.mEffectProcessor == null) {
            this.mEffectProcessor = new SnapshotEffectRender(this.mActivity, this.mIsImageCaptureIntent);
            this.mEffectProcessor.setImageSaver(this.mActivity.getImageSaver());
            this.mEffectProcessor.prepareEffectRender(effect);
            this.mEffectProcessor.setQuality(BaseModule.getJpegQuality(this.mMultiSnapStatus));
        }
    }

    public void updateFlashPreference() {
        String flashMode = getRequestFlashMode();
        if (Util.parseInt(flashMode, 0) != 0) {
            resetAiSceneInHdrOrFlashOn();
        }
        setFlashMode(flashMode);
        stopObjectTracking(true);
    }

    public void updateHDRPreference() {
        ComponentConfigHdr componentConfigHdr = DataRepository.dataItemConfig().getComponentHdr();
        if (!componentConfigHdr.isEmpty()) {
            String hdrMode = componentConfigHdr.getComponentValue(this.mModuleIndex);
            if (this.mZoomValue > 1.0f && this.mMutexModePicker.isHdr() && "auto".equals(hdrMode)) {
                onHDRSceneChanged(false);
            }
            updateHDR(hdrMode);
            if ((!"off".equals(hdrMode) || (this.mAiSceneEnabled ^ 1) == 0) && this.mZoomValue <= 1.0f) {
                resetAiSceneInHdrOrFlashOn();
                if ("auto".equals(hdrMode)) {
                    this.mCamera2Device.setHDRCheckerCallback(this);
                } else {
                    this.mCamera2Device.setHDRCheckerCallback(null);
                }
                this.mCamera2Device.setHDRCheckerEnable(true);
            } else {
                this.mCamera2Device.setHDRCheckerCallback(null);
                this.mCamera2Device.setHDRCheckerEnable(false);
            }
        }
    }

    private void updateHDR(String hdrMode) {
        if ("auto".equals(hdrMode)) {
            this.isDetectedInHDR = false;
        }
        int mutexHdr = getMutexHdrMode(hdrMode);
        stopObjectTracking(true);
        if (mutexHdr != 0) {
            this.mMutexModePicker.setMutexMode(mutexHdr);
        } else if (this.mMutexModePicker.isHdr()) {
            resetMutexModeManually();
        }
        if (isFrontCamera() && this.mCameraCapabilities.isSupportedQcfa()) {
            updatePreferenceInWorkThread(41);
        }
    }

    private void updateOperatingMode() {
        String hdrMode = DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
        if (!BeautyParameters.getInstance().isFaceBeautyOn()) {
            if ((this.mOperatingMode != 32775 && hdrMode.equals("off")) || (this.mOperatingMode != 32773 && (hdrMode.equals("off") ^ 1) != 0)) {
                this.mHandler.sendEmptyMessage(44);
            }
        }
    }

    private void updateFocusArea() {
        Rect cropRegion = getCropRegion();
        this.mActivity.getSensorStateManager().setFocusSensorEnabled(this.mFocusManager.getMeteringAreas(cropRegion) != null);
        this.mCamera2Device.setAERegions(this.mFocusManager.getMeteringAreas(cropRegion));
        if (this.mFocusAreaSupported) {
            this.mCamera2Device.setAFRegions(this.mFocusManager.getFocusAreas(cropRegion));
        } else {
            this.mCamera2Device.resumePreview();
        }
    }

    private void updateScene() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (this.mMutexModePicker.isSceneHdr()) {
            this.mSceneMode = "18";
        } else if (dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key")) {
            this.mSceneMode = dataItemRunning.getComponentRunningSceneValue().getComponentValue(this.mModuleIndex);
        } else {
            this.mSceneMode = "0";
        }
        Log.d(TAG, "sceneMode=" + this.mSceneMode + " mutexMode=" + this.mMutexModePicker.getMutexMode());
        if (!setSceneMode(this.mSceneMode)) {
            this.mSceneMode = "0";
        }
        if (!"0".equals(this.mSceneMode) && ("18".equals(this.mSceneMode) ^ 1) == 0) {
        }
    }

    private int getDefaultRatio(String key, boolean legacyMode) {
        if (!legacyMode) {
            return 0;
        }
        int[] range = CameraSettings.getBeautifyValueRange();
        if (range == null || range.length != 2) {
            return 0;
        }
        int denominator = range[1] - range[0];
        if (denominator == 0) {
            return 0;
        }
        return ((CameraSettings.getBeautifyDefaultValue(key) - range[0]) * 100) / denominator;
    }

    private void initBeautyValues(BeautyValues beautyValues, boolean legacyMode) {
        if (beautyValues != null) {
            beautyValues.mBeautyLevel = CameraSettings.getFaceBeautifyValue();
            String key = "pref_beautify_slim_face_ratio_key";
            beautyValues.mBeautySlimFace = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, legacyMode));
            key = "pref_beautify_enlarge_eye_ratio_key";
            beautyValues.mBeautyEnlargeEye = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, legacyMode));
            key = "pref_beautify_skin_color_ratio_key";
            beautyValues.mBeautySkinColor = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, legacyMode));
            key = "pref_beautify_skin_smooth_ratio_key";
            beautyValues.mBeautySkinSmooth = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, legacyMode));
        }
    }

    private void initNewBeautyValues(BeautyValues beautyValues) {
        if (beautyValues != null) {
            beautyValues.mBeautyLevel = CameraSettings.getFaceBeautifyValue();
            String key = "pref_beautify_slim_face_ratio_key";
            beautyValues.mBeautySlimFace = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_enlarge_eye_ratio_key";
            beautyValues.mBeautyEnlargeEye = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_nose_ratio_key";
            beautyValues.mBeautyNose = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_risorius_ratio_key";
            beautyValues.mBeautyRisorius = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_lips_ratio_key";
            beautyValues.mBeautyLips = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_chin_ratio_key";
            beautyValues.mBeautyChin = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_neck_ratio_key";
            beautyValues.mBeautyNeck = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_smile_ratio_key";
            beautyValues.mBeautySmile = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
            key = "pref_beautify_slim_nose_ratio_key";
            beautyValues.mBeautySlimNose = CameraSettings.getFaceBeautyRatio(key, getDefaultRatio(key, false));
        }
    }

    private void updateBeauty() {
        if (this.mModuleIndex != 167) {
            if (this.mBeautyValues == null) {
                this.mBeautyValues = new BeautyValues();
            }
            if (CameraSettings.isPortraitModeBackOn()) {
                if (CameraSettings.isCameraPortraitWithFaceBeauty() && this.mMainProtocol.isFaceExists(1)) {
                    this.mBeautyValues.mBeautyLevel = BeautyConstant.LEVEL_MEDIUM;
                } else {
                    this.mBeautyValues.mBeautyLevel = BeautyConstant.LEVEL_CLOSE;
                }
            } else if (DataRepository.dataItemConfig().getComponentConfigBeauty().isClosed(this.mModuleIndex)) {
                this.mBeautyValues.mBeautyLevel = CameraSettings.getFaceBeautyCloseValue();
            } else if (Device.isSupportNewFaceBeauty()) {
                initNewBeautyValues(this.mBeautyValues);
            } else {
                initBeautyValues(this.mBeautyValues, Device.isLegacyFaceBeauty());
            }
            this.mCamera2Device.setBeautyValues(this.mBeautyValues);
            updateFaceAgeAnalyze();
        }
    }

    private void updateFocusMode() {
        String focusMode = this.mFocusManager.setFocusMode(CameraSettings.getFocusMode());
        setFocusMode(focusMode);
        if (CameraSettings.isFocusModeSwitching() && isBackCamera()) {
            CameraSettings.setFocusModeSwitching(false);
            this.mFocusManager.resetFocusStateIfNeeded();
        }
        if (focusMode.equals("manual")) {
            int position = CameraSettings.getFocusPosition();
            this.mCamera2Device.setFocusDistance((((float) position) * this.mCameraCapabilities.getMinimumFocusDistance()) / 1000.0f);
        }
    }

    protected void focusCenter() {
    }

    private void updateFpsRange() {
        Range<Integer>[] availableFpsRange = this.mCameraCapabilities.getSupportedFpsRange();
        Range<Integer> bestRange = availableFpsRange[0];
        for (Range<Integer> r : availableFpsRange) {
            if (((Integer) bestRange.getUpper()).intValue() < ((Integer) r.getUpper()).intValue()) {
                bestRange = r;
            } else if (bestRange.getUpper() == r.getUpper() && ((Integer) bestRange.getLower()).intValue() < ((Integer) r.getLower()).intValue()) {
                bestRange = r;
            }
        }
        if ((Device.IS_E2 || Device.IS_E10) && CameraSettings.isPortraitModeBackOn()) {
            this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
        }
    }

    private void updateFace() {
        boolean faceDetection;
        boolean faceDrawing = true;
        if (this.mMultiSnapStatus || this.mMutexModePicker.isUbiFocus()) {
            faceDetection = false;
        } else if (CameraSettings.isMagicMirrorOn() || CameraSettings.isPortraitModeBackOn() || CameraSettings.isGroupShotOn() || CameraSettings.showGenderAge()) {
            faceDetection = true;
        } else {
            faceDetection = DataRepository.dataItemGlobal().getBoolean("pref_camera_facedetection_key", getResources().getBoolean(R.bool.pref_camera_facedetection_default));
            if (CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn()) {
                faceDrawing = false;
            }
        }
        if (this.mMainProtocol != null) {
            boolean z;
            ModeProtocol$MainContentProtocol modeProtocol$MainContentProtocol = this.mMainProtocol;
            if (faceDetection) {
                z = faceDrawing ^ 1;
            } else {
                z = true;
            }
            modeProtocol$MainContentProtocol.setSkipDrawFace(z);
        }
        if (faceDetection) {
            if (!this.mFaceDetectionEnabled) {
                this.mFaceDetectionEnabled = true;
                startFaceDetection();
            }
        } else if (this.mFaceDetectionEnabled) {
            stopFaceDetection(true);
            this.mFaceDetectionEnabled = false;
        }
    }

    private void updateJpegQuality() {
        this.mCamera2Device.setJpegQuality(BaseModule.getJpegQuality(this.mMultiSnapStatus));
    }

    private void updateOIS() {
        boolean isDualZoomed = isDualCamera() ? this.mZoomValue > 1.0f : false;
        boolean isPortrait = CameraSettings.isPortraitModeBackOn();
        boolean isLongExposure = false;
        if (this.mModuleIndex == 167 && Long.parseLong(getManualValue("pref_qc_camera_exposuretime_key", getString(R.string.pref_camera_exposuretime_default))) > 1000000000) {
            isLongExposure = true;
        }
        if (isDualZoomed || isPortrait || isLongExposure) {
            this.mCamera2Device.setEnableOIS(false);
        } else {
            this.mCamera2Device.setEnableOIS(true);
        }
    }

    private void updateMute() {
    }

    private void updateZsl() {
        this.mCamera2Device.setEnableZsl(isZeroShotMode());
    }

    private void updateMfnr(boolean enable) {
        boolean result = (this.mModuleIndex == 167 || ((Device.IS_D5X && !isDualCamera()) || !this.mMutexModePicker.isNormal() || !enable || (isFrontCamera() && !(Device.isSupportFrontBeautyMFNR() && this.mOperatingMode == 32773)))) ? false : !DataRepository.dataItemFeature().supportZoomMfnr() ? this.mZoomValue == 1.0f : true;
        this.mCamera2Device.setMfnr(result);
    }

    private void updateSuperResolution() {
        if (!isFrontCamera() && CameraSettings.isSREnable()) {
            if (this.mZoomValue == 1.0f) {
                if (!DataRepository.dataItemRunning().isSwitchOn("pref_camera_super_resolution_key")) {
                    if (this.mMutexModePicker.isSuperResolution()) {
                        this.mMutexModePicker.resetMutexMode();
                    } else {
                        this.mCamera2Device.setSuperResolution(false);
                    }
                }
            } else if (this.mMutexModePicker.isNormal()) {
                this.mMutexModePicker.setMutexMode(10);
            }
        }
    }

    private void updateWhiteBalance() {
        setAWBMode(getManualValue("pref_camera_whitebalance_key", "1"));
    }

    private void updateISO() {
        String defaultValue = getString(R.string.pref_camera_iso_default);
        String iso = getManualValue("pref_qc_camera_iso_key", defaultValue);
        if (iso == null || (iso.equals(defaultValue) ^ 1) == 0) {
            this.mCamera2Device.setISO(0);
        } else {
            this.mCamera2Device.setISO(Math.min(Util.parseInt(iso, 0), this.mCameraCapabilities.getMaxIso()));
        }
    }

    private void updateExposureTime() {
        this.mCamera2Device.setExposureTime(Long.parseLong(getManualValue("pref_qc_camera_exposuretime_key", getString(R.string.pref_camera_exposuretime_default))));
    }

    private void updateContrast() {
        this.mCamera2Device.setContrast(Integer.parseInt(CameraSettings.getContrast()));
    }

    private void updateSaturation() {
        this.mCamera2Device.setSaturation(Integer.parseInt(CameraSettings.getSaturation()));
    }

    private void updateSharpness() {
        this.mCamera2Device.setSharpness(Integer.parseInt(CameraSettings.getSharpness()));
    }

    private void updateQr() {
        if (scanQRCodeEnabled()) {
            QRCodeManager.instance(this.mActivity).setTransposePreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            QRCodeManager.instance(this.mActivity).setPreviewFormat(17);
            QRCodeManager.instance(this.mActivity).setPreviewLayoutSize(this.mPreviewSize.width, this.mPreviewSize.height);
            this.mCamera2Device.startPreviewCallback(QRCodeManager.instance(this.mActivity).getPreviewCallback());
            QRCodeManager.instance(this.mActivity).startDecode();
        }
    }

    private void updateJpegThumbnailSize() {
        CameraSize size = getJpegThumbnailSize();
        this.mCamera2Device.setJpegThumbnailSize(size);
        Log.d(TAG, "thumbnailSize=" + size);
    }

    private void updateDeviceOrientation() {
        this.mCamera2Device.setDeviceOrientation(this.mOrientation);
    }

    private boolean setSceneMode(String value) {
        int sceneMode = Util.parseInt(value, -1);
        if (!Util.isSupported(sceneMode, this.mCameraCapabilities.getSupportedSceneModes())) {
            return false;
        }
        Log.d(TAG, "sceneMode=" + value);
        this.mCamera2Device.setSceneMode(sceneMode);
        return true;
    }

    private String getSuffix() {
        if (this.mMutexModePicker.isNormal()) {
            return "";
        }
        return this.mMutexModePicker.getSuffix();
    }

    private String getRequestFlashMode() {
        if (isSupportSceneMode()) {
            String override = CameraSettings.getFlashModeByScene(this.mSceneMode);
            if (!TextUtils.isEmpty(override)) {
                return override;
            }
        }
        if (!this.mMutexModePicker.isSupportedFlashOn() && (this.mMutexModePicker.isSupportedTorch() ^ 1) != 0) {
            return "0";
        }
        String currentFlash = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        if (this.mCurrentAsdScene == 9) {
            if (currentFlash.equals("3")) {
                return "2";
            }
            if (currentFlash.equals("103")) {
                return "101";
            }
        }
        return currentFlash;
    }

    protected boolean isSupportSceneMode() {
        return false;
    }

    protected CameraSize getBestPictureSize(List<CameraSize> supportedSizes) {
        PictureSizeManager.initialize(supportedSizes, getMaxPictureSize());
        return PictureSizeManager.getBestPictureSize();
    }

    protected int getMaxPictureSize() {
        return 0;
    }

    private void setPictureOrientation() {
        this.mShootRotation = this.mActivity.getSensorStateManager().isDeviceLying() ? -1.0f : this.mDeviceRotation;
        this.mShootOrientation = this.mOrientation == -1 ? 0 : this.mOrientation;
    }

    private void setWaterMark() {
        if (this.mMultiSnapStatus || this.mModuleIndex == 165 || CameraSettings.isGradienterOn() || CameraSettings.getShaderEffect() != FilterInfo.FILTER_ID_NONE || this.mHasAiSceneFilterEffect || CameraSettings.isTiltShiftOn()) {
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
            this.mCamera2Device.setTimeWaterMarkEnable(false);
            return;
        }
        if (CameraSettings.isDualCameraWaterMarkOpen()) {
            this.mCamera2Device.setDualCamWaterMarkEnable(true);
        } else {
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
        }
        if (CameraSettings.isTimeWaterMarkOpen()) {
            this.mCamera2Device.setTimeWaterMarkEnable(true);
            this.mCamera2Device.setTimeWatermarkValue(Util.getTimeWatermark());
        } else {
            this.mCamera2Device.setTimeWaterMarkEnable(false);
        }
    }

    public void onOrientationChanged(int orientation, int orientationCompensation) {
        if (!CameraSettings.isGradienterOn()) {
            setOrientation(orientation, orientationCompensation);
        }
    }

    private void setOrientation(int orientation, int orientationCompensation) {
        if (orientation != -1) {
            this.mOrientation = orientation;
            EffectController.getInstance().setOrientation(Util.getShootOrientation(this.mActivity, this.mOrientation));
            checkActivityOrientation();
            if (this.mOrientationCompensation != orientationCompensation) {
                this.mOrientationCompensation = orientationCompensation;
                setOrientationParameter();
            }
        }
    }

    private void setOrientationParameter() {
        if (!(isDeparted() || this.mCamera2Device == null || this.mOrientation == -1)) {
            if (getCameraState() == 1) {
                updatePreferenceInWorkThread(35);
            } else {
                this.mCamera2Device.setDeviceOrientation(this.mOrientation);
            }
        }
    }

    public void checkDisplayOrientation() {
        if (isCreated()) {
            super.checkDisplayOrientation();
            if (this.mMainProtocol != null) {
                this.mMainProtocol.setCameraDisplayOrientation(this.mCameraDisplayOrientation);
            }
            if (this.mFocusManager != null) {
                this.mFocusManager.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
        }
    }

    /* JADX WARNING: Missing block: B:4:0x0067, code:
            return;
     */
    public void onSingleTapUp(int r7, int r8) {
        /*
        r6 = this;
        r5 = 1;
        r2 = TAG;
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r4 = "onSingleTapUp mPaused: ";
        r3 = r3.append(r4);
        r4 = r6.mPaused;
        r3 = r3.append(r4);
        r4 = "; mCamera2Device: ";
        r3 = r3.append(r4);
        r4 = r6.mCamera2Device;
        r3 = r3.append(r4);
        r4 = "; isInCountDown: ";
        r3 = r3.append(r4);
        r4 = r6.isInCountDown();
        r3 = r3.append(r4);
        r4 = "; getCameraState: ";
        r3 = r3.append(r4);
        r4 = r6.getCameraState();
        r3 = r3.append(r4);
        r4 = "; mMultiSnapStatus: ";
        r3 = r3.append(r4);
        r4 = r6.mMultiSnapStatus;
        r3 = r3.append(r4);
        r4 = "; Camera2Module: ";
        r3 = r3.append(r4);
        r3 = r3.append(r6);
        r3 = r3.toString();
        com.android.camera.log.Log.v(r2, r3);
        r2 = r6.mPaused;
        if (r2 != 0) goto L_0x0067;
    L_0x0063:
        r2 = r6.mCamera2Device;
        if (r2 != 0) goto L_0x0068;
    L_0x0067:
        return;
    L_0x0068:
        r2 = r6.mCamera2Device;
        r2 = r2.isSessionReady();
        r2 = r2 ^ 1;
        if (r2 != 0) goto L_0x0067;
    L_0x0072:
        r2 = r6.isInTapableRect(r7, r8);
        r2 = r2 ^ 1;
        if (r2 != 0) goto L_0x0067;
    L_0x007a:
        r2 = r6.getCameraState();
        r3 = 3;
        if (r2 == r3) goto L_0x0067;
    L_0x0081:
        r2 = r6.getCameraState();
        r3 = 4;
        if (r2 == r3) goto L_0x0067;
    L_0x0088:
        r2 = r6.getCameraState();
        if (r2 == 0) goto L_0x0067;
    L_0x008e:
        r2 = r6.isInCountDown();
        if (r2 != 0) goto L_0x0067;
    L_0x0094:
        r2 = r6.mMultiSnapStatus;
        if (r2 != 0) goto L_0x0067;
    L_0x0098:
        r2 = r6.isFrameAvailable();
        if (r2 != 0) goto L_0x009f;
    L_0x009e:
        return;
    L_0x009f:
        r2 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r3 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        r0 = r2.getAttachProtocol(r3);
        r0 = (com.android.camera.protocol.ModeProtocol$BackStack) r0;
        r2 = r0.handleBackStackFromTapDown(r7, r8);
        if (r2 == 0) goto L_0x00b2;
    L_0x00b1:
        return;
    L_0x00b2:
        r6.tryRemoveCountDownMessage();
        r2 = r6.mFocusAreaSupported;
        if (r2 != 0) goto L_0x00c0;
    L_0x00b9:
        r2 = r6.mMeteringAreaSupported;
        r2 = r2 ^ 1;
        if (r2 == 0) goto L_0x00c0;
    L_0x00bf:
        return;
    L_0x00c0:
        r2 = r6.mMutexModePicker;
        r2 = r2.isUbiFocus();
        if (r2 == 0) goto L_0x00c9;
    L_0x00c8:
        return;
    L_0x00c9:
        r2 = r6.mObjectTrackingStarted;
        if (r2 == 0) goto L_0x00d0;
    L_0x00cd:
        r6.stopObjectTracking(r5);
    L_0x00d0:
        r2 = r6.mMainProtocol;
        r2.setFocusViewType(r5);
        r1 = new android.graphics.Point;
        r1.<init>(r7, r8);
        r6.mapTapCoordinate(r1);
        r6.unlockAEAF();
        r2 = 2;
        r6.setCameraState(r2);
        r2 = r6.mFocusManager;
        r3 = r1.x;
        r4 = r1.y;
        r2.onSingleTapUp(r3, r4);
        r2 = r6.mFocusAreaSupported;
        if (r2 != 0) goto L_0x00fe;
    L_0x00f1:
        r2 = r6.mMeteringAreaSupported;
        if (r2 == 0) goto L_0x00fe;
    L_0x00f5:
        r2 = r6.mActivity;
        r2 = r2.getSensorStateManager();
        r2.reset();
    L_0x00fe:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.onSingleTapUp(int, int):void");
    }

    private void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.setAELock(false);
        }
        this.mFocusManager.setAeAwbLock(false);
    }

    private void lockAEAF() {
        Log.d(TAG, "lockAEAF");
        this.mFocusManager.setAeAwbLock(true);
        this.m3ALocked = true;
    }

    private boolean is3ALocked() {
        return this.m3ALocked;
    }

    public void onGradienterSwitched(boolean switchOn) {
        this.mActivity.getSensorStateManager().setGradienterEnabled(switchOn);
        updatePreferenceTrampoline(2, 5);
    }

    public void onTiltShiftSwitched(boolean switchOn) {
        if (switchOn) {
            resetEvValue();
        }
        this.mMainProtocol.initEffectCropView();
        updatePreferenceTrampoline(2, 5);
        this.mMainProtocol.updateEffectViewVisible();
        this.mMainProtocol.setEvAdjustable(switchOn ^ 1);
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        boolean z = false;
        switch (keyCode) {
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
                }
                return true;
            case 80:
                if (event.getRepeatCount() == 0) {
                    onShutterButtonFocus(true, 1);
                }
                return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    public boolean onKeyUp(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 4:
                if (((ModeProtocol$BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
                    return true;
                }
                break;
            case MotionEventCompat.AXIS_DISTANCE /*24*/:
            case MotionEventCompat.AXIS_TILT /*25*/:
            case 87:
            case 88:
                boolean z;
                if (keyCode == 24) {
                    z = true;
                } else if (keyCode == 88) {
                    z = true;
                } else {
                    z = false;
                }
                if (handleVolumeKeyEvent(z, false, event.getRepeatCount())) {
                    return true;
                }
                break;
        }
        return super.onKeyUp(keyCode, event);
    }

    protected void performVolumeKeyClicked(int repeatCount, boolean pressed) {
        if (!this.mPaused && getCameraState() != 0) {
            if (!isDoingAction()) {
                restoreBottom();
            }
            if (repeatCount == 0) {
                if (pressed) {
                    onShutterButtonFocus(true, 2);
                    onShutterButtonClick(20);
                } else {
                    onShutterButtonFocus(false, 0);
                    if (this.mVolumeLongPress) {
                        this.mVolumeLongPress = false;
                        onShutterButtonLongClickCancel(false);
                    }
                }
            } else if (pressed && (this.mVolumeLongPress ^ 1) != 0) {
                this.mUpdateImageTitle = true;
                this.mVolumeLongPress = onShutterButtonLongClick();
                if (!this.mVolumeLongPress && this.mLongPressedAutoFocus) {
                    this.mVolumeLongPress = true;
                }
            }
        }
    }

    protected boolean isZoomEnabled() {
        if (getCameraState() == 3 || (this.mMutexModePicker.isUbiFocus() ^ 1) == 0 || (CameraSettings.isStereoModeOn() ^ 1) == 0 || (CameraSettings.isPortraitModeBackOn() ^ 1) == 0) {
            return false;
        }
        return isFrontCamera() ^ 1;
    }

    private String getManualValue(String key, String defaultValue) {
        CameraSettingPreferences preferences = CameraSettingPreferences.instance();
        if (ModuleManager.isManualModule()) {
            return preferences.getString(key, defaultValue);
        }
        return defaultValue;
    }

    private void resetGradienter() {
        if (CameraSettings.isGradienterOn()) {
            this.mActivity.getSensorStateManager().setGradienterEnabled(false);
        }
    }

    private void resetScreenOn() {
        if (this.mHandler != null) {
            this.mHandler.removeMessages(17);
            this.mHandler.removeMessages(2);
        }
    }

    private void keepScreenOnAwhile() {
        this.mHandler.sendEmptyMessageDelayed(17, 1000);
    }

    private void releaseEffectProcessor() {
        if (this.mEffectProcessor != null) {
            this.mEffectProcessor.setImageSaver(null);
            this.mEffectProcessor.release();
            this.mEffectProcessor = null;
        }
    }

    protected int getMutexHdrMode(String hdr) {
        if ("normal".equals(hdr)) {
            int i;
            if (!Device.isMTKPlatform() || Device.isSupportedAsdHdr()) {
                i = 1;
            } else {
                i = 5;
            }
            return i;
        } else if (Device.isSupportedAoHDR() && "live".equals(hdr)) {
            return 2;
        } else {
            return 0;
        }
    }

    public boolean isShowCaptureButton() {
        return !this.mMutexModePicker.isBurstShoot() ? isSupportFocusShoot() : false;
    }

    public boolean isShowAeAfLockIndicator() {
        return this.m3ALocked;
    }

    public boolean isSupportFocusShoot() {
        return DataRepository.dataItemGlobal().isGlobalSwitchOn("pref_camera_focus_shoot_key");
    }

    public boolean isMeteringAreaOnly() {
        boolean z = true;
        if (this.mCamera2Device == null) {
            return false;
        }
        int focusMode = this.mCamera2Device.getFocusMode();
        if (!((!this.mFocusAreaSupported && this.mMeteringAreaSupported) || 5 == focusMode || focusMode == 0)) {
            z = false;
        }
        return z;
    }

    public void enterMutexMode(int mode) {
        switch (mode) {
            case 1:
                this.mCamera2Device.setHDR(true);
                break;
            case 3:
                this.mCamera2Device.setHHT(true);
                break;
            case 10:
                this.mCamera2Device.setSuperResolution(true);
                break;
        }
        updateMfnr(CameraSettings.isMfnrSatEnable());
    }

    public void exitMutexMode(int mode) {
        switch (mode) {
            case 1:
                this.mCamera2Device.setHDR(false);
                updateSuperResolution();
                break;
            case 3:
                this.mCamera2Device.setHHT(false);
                break;
            case 10:
                this.mCamera2Device.setSuperResolution(false);
                break;
        }
        updateMfnr(CameraSettings.isMfnrSatEnable());
    }

    private boolean needShowThumbProgressImmediately() {
        if (Long.parseLong(getManualValue("pref_qc_camera_exposuretime_key", getString(R.string.pref_camera_exposuretime_default))) > 250000000) {
            return true;
        }
        return false;
    }

    private void updateThumbProgress(boolean hideOrShowThumbProgress) {
        ModeProtocol$ActionProcessing processing = (ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (processing != null) {
            processing.updateLoading(hideOrShowThumbProgress);
        }
    }

    private boolean isParallelEnable() {
        if (!CameraSettings.isCameraParallelProcessEnable() || isFrontCamera() || CameraSettings.isGroupShotOn() || EffectController.getInstance().hasEffect()) {
            return false;
        }
        if (ModuleManager.isPortraitModule() || this.mMutexModePicker.isHdr()) {
            return true;
        }
        return false;
    }

    public void startAiLens() {
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                Camera2Module.this.startLensActivity();
            }
        }, 300);
    }

    private void startLensActivity() {
        if (!Util.isGlobalVersion()) {
            Log.d(TAG, "start ai lens");
            try {
                Intent intent = new Intent();
                intent.setAction("android.media.action.XIAOAI_CONTROL");
                intent.setPackage("com.xiaomi.lens");
                intent.putExtra("preview_width", this.mPreviewSize.width);
                intent.putExtra("preview_height", this.mPreviewSize.height);
                getActivity().startActivity(intent);
                getActivity().overridePendingTransition(R.anim.anim_fade_in, R.anim.anim_fade_out);
            } catch (Exception e) {
                Log.e(TAG, "onClick: occur a exception", e);
            }
        } else if (this.mLensApi != null && this.mLensStatus == 0) {
            this.mLensApi.launchLensActivity(this.mActivity, 0);
        }
    }

    public void showQRCodeResult() {
        if (!this.mPaused) {
            String result = QRCodeManager.instance(this.mActivity).getScanResult();
            if (result == null || result.isEmpty()) {
                Log.e(TAG, "showQRCodeResult: get a null result!");
                return;
            }
            try {
                ActivityBase activityBase = this.mActivity;
                activityBase.dismissKeyguard();
                Intent intent = new Intent("miui.intent.action.receiverResultBarcodeScanner");
                intent.setPackage("com.xiaomi.scanner");
                intent.putExtra("result", result);
                activityBase.startActivity(intent);
                activityBase.setJumpFlag(3);
            } catch (ActivityNotFoundException ex) {
                Log.e(TAG, ex.getMessage(), ex);
            }
        }
    }

    protected void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    public void onCameraMetaData(CaptureResult result) {
        if (result != null) {
            super.onCameraMetaData(result);
            if (this.mMetaDataFloableEmitter != null) {
                this.mMetaDataFloableEmitter.onNext(result);
            }
            if (!(this.mAiSceneFloableEmitter == null || !isAiSceneEnabled() || this.mCamera2Device == null)) {
                this.mAiSceneFloableEmitter.onNext(result);
            }
        }
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> emitter) throws Exception {
                Camera2Module.this.mMetaDataFloableEmitter = emitter;
            }
        }, BackpressureStrategy.DROP).sample(500, TimeUnit.MILLISECONDS).observeOn(GlobalConstant.sCameraSetupScheduler).filter(new Predicate<CaptureResult>() {
            public boolean test(CaptureResult captureResult) throws Exception {
                return true;
            }
        }).map(new Function<CaptureResult, Integer>() {
            public Integer apply(CaptureResult captureResult) throws Exception {
                return Integer.valueOf(Camera2Module.this.parseAsdSceneResult(captureResult));
            }
        }).observeOn(AndroidSchedulers.mainThread()).map(new Function<Integer, Integer>() {
            public Integer apply(Integer sceneResult) throws Exception {
                Camera2Module.this.consumeAsdSceneResult(sceneResult.intValue());
                return sceneResult;
            }
        }).subscribe();
    }

    private int parseAsdSceneResult(CaptureResult captureResult) {
        Integer currentAEState = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
        boolean isFrontCamera = isFrontCamera();
        if (this.mModuleIndex == 171 || isFrontCamera) {
            return AsdSceneConstant.parseRtbSceneResult(captureResult, isFrontCamera);
        }
        if (currentAEState != null && currentAEState.intValue() == 4 && Device.isSupportedAsdFlash() && this.mCamera2Device != null && 3 == this.mCamera2Device.getFlashMode()) {
            return 0;
        }
        return -1;
    }

    private void consumeAsdSceneResult(int newResult) {
        if (this.mCurrentAsdScene != newResult) {
            exitAsdScene(this.mCurrentAsdScene);
            enterAsdScene(newResult);
            this.mCurrentAsdScene = newResult;
        }
    }

    private void exitAsdScene(int lastAsdScene) {
        ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        switch (lastAsdScene) {
            case 0:
                topAlert.alertFlash(8, false, false);
                return;
            case 4:
            case 5:
            case 6:
                if (!this.m3ALocked) {
                    hideTipMessage(0);
                    return;
                }
                return;
            case 7:
                if (!this.m3ALocked) {
                    setPortraitSuccessHintVisible(8);
                    return;
                }
                return;
            case 9:
                if ("103".equals(DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex))) {
                    topAlert.alertFlash(8, false, false);
                }
                updatePreferenceInWorkThread(10);
                return;
            default:
                return;
        }
    }

    private void enterAsdScene(int currentAsdScene) {
        ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        switch (currentAsdScene) {
            case 0:
                topAlert.alertFlash(0, false, false);
                return;
            case 4:
                if (!this.m3ALocked) {
                    updateTipMessage(6, R.string.portrait_mode_too_close_hint, 4);
                    return;
                }
                return;
            case 5:
                if (!this.m3ALocked) {
                    updateTipMessage(6, R.string.portrait_mode_too_far_hint, 4);
                    return;
                }
                return;
            case 6:
                if (!this.m3ALocked) {
                    updateTipMessage(6, R.string.portrait_mode_lowlight_hint, 4);
                    return;
                }
                return;
            case 7:
                if (!this.m3ALocked) {
                    setPortraitSuccessHintVisible(0);
                    return;
                }
                return;
            case 9:
                String currentFlash = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
                if ("3".equals(currentFlash)) {
                    updatePreferenceInWorkThread(10);
                    return;
                } else if ("103".equals(currentFlash)) {
                    topAlert.alertFlash(0, false, false);
                    updatePreferenceInWorkThread(10);
                    return;
                } else {
                    return;
                }
            default:
                return;
        }
    }

    private void setPortraitSuccessHintVisible(int visible) {
        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).setPortraitHintVisible(visible);
    }

    private void initAiSceneParser() {
        this.mAiSceneDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> emitter) throws Exception {
                Camera2Module.this.mAiSceneFloableEmitter = emitter;
            }
        }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).map(new Function<CaptureResult, Integer>() {
            public Integer apply(CaptureResult result) throws Exception {
                return Integer.valueOf(Camera2Module.this.parseAiSceneResult(result));
            }
        }).filter(new Predicate<Integer>() {
            public boolean test(Integer resultMode) throws Exception {
                return Camera2Module.this.shouldChangeAiScene(resultMode.intValue());
            }
        }).observeOn(AndroidSchedulers.mainThread()).map(new Function<Integer, Integer>() {
            public Integer apply(Integer integer) throws Exception {
                Camera2Module.this.consumeAiSceneResult(integer.intValue(), false);
                return integer;
            }
        }).subscribe();
    }

    private int parseAiSceneResult(CaptureResult captureResult) {
        int scene = Integer.MIN_VALUE;
        Face[] faces = (Face[]) captureResult.get(CaptureResult.STATISTICS_FACES);
        if (faces != null && faces.length > 0) {
            for (Face face : faces) {
                if (face.getBounds().width() > 300) {
                    int hdrMode = CaptureResultParser.getHDRDetectedScene(captureResult);
                    Log.c(TAG, "parseAiSceneResult: AI_SCENE_MODE_HUMAN  face.length = " + faces.length + ";face.width = " + face.getBounds().width() + ";hdrMode = " + hdrMode);
                    if (hdrMode == 1) {
                        scene = -1;
                    } else {
                        scene = 25;
                    }
                }
            }
        }
        int sceneResult = CaptureResultParser.getAsdDetectedModes(captureResult);
        if (faceSceneFiltering(scene)) {
            if (scene != Integer.MIN_VALUE && sceneResult != 27) {
                this.mParsedAiScene = scene;
            } else if (sceneResult < 0) {
                Log.e(TAG, "parseAiSceneResult: parse a error result: " + sceneResult);
                this.mParsedAiScene = 0;
            } else {
                this.mParsedAiScene = sceneResult;
            }
        }
        return this.mParsedAiScene;
    }

    private void consumeAiSceneResult(int newResult, boolean isReset) {
        if (this.mCurrentAiScene != newResult && !isDoingAction() && (isAlive() ^ 1) == 0) {
            if (!isReset || !this.resetedFromMutex) {
                if (!isReset) {
                    this.resetedFromMutex = false;
                }
                Log.d(TAG, "consumeAiSceneResult: " + newResult + "; isReset: " + isReset);
                ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                ModeProtocol$ConfigChanges config = (ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
                switch (newResult) {
                    case -1:
                        OnCheckedChangeListener listener = new OnCheckedChangeListener() {
                            public void onCheckedChanged(ToggleSwitch s, boolean isChecked) {
                                if (!Camera2Module.this.isDoingAction() && (Camera2Module.this.isAlive() ^ 1) == 0) {
                                    if (isChecked) {
                                        Camera2Module.this.trackAISceneChanged(Camera2Module.this.mModuleIndex, 24);
                                        Camera2Module.this.setAiSceneEffect(24);
                                        Camera2Module.this.updateHDR("off");
                                    } else {
                                        Camera2Module.this.applyBacklightEffect();
                                    }
                                    Camera2Module.this.resumePreviewInWorkThread();
                                }
                            }
                        };
                        config.closeMutexElement("e", 194, 193);
                        topAlert.setAiSceneImageLevel(23);
                        topAlert.alertHDR(8, false, false);
                        topAlert.alertAiSceneSelector(0, listener);
                        applyBacklightEffect();
                        this.mCamera2Device.setASD(false);
                        resumePreviewInWorkThread();
                        this.mCurrentAiScene = newResult;
                        return;
                    case 1:
                        int sharpValue1 = Integer.parseInt(CameraSettings.getSharpness());
                        if (sharpValue1 < 6) {
                            sharpValue1++;
                        }
                        this.mCurrentAiScene = newResult;
                        config.restoreAllMutexElement("e");
                        this.mCamera2Device.setSharpness(sharpValue1);
                        break;
                    case 4:
                        this.mCamera2Device.setContrast(Integer.parseInt(CameraSettings.getContrast()));
                        this.mCurrentAiScene = newResult;
                        config.restoreAllMutexElement("e");
                        updateSuperResolution();
                        break;
                    case 6:
                    case MotionEventCompat.AXIS_WHEEL /*21*/:
                    case MotionEventCompat.AXIS_GAS /*22*/:
                        config.closeMutexElement("e", 194, 193);
                        updateHDR("normal");
                        break;
                    case 7:
                    case 8:
                        this.mCurrentAiScene = newResult;
                        config.restoreAllMutexElement("e");
                        break;
                    case 10:
                        config.closeMutexElement("e", 194, 193);
                        setFlashMode("0");
                        updateMfnr(true);
                        updateOIS();
                        break;
                    case 15:
                    case 19:
                        int sharpValue = Integer.parseInt(CameraSettings.getSharpness());
                        if (sharpValue < 6) {
                            sharpValue++;
                        }
                        this.mCamera2Device.setSharpness(sharpValue);
                        this.mCurrentAiScene = newResult;
                        config.restoreAllMutexElement("e");
                        break;
                    case MotionEventCompat.AXIS_TILT /*25*/:
                        trackAISceneChanged(this.mModuleIndex, 25);
                        topAlert.setAiSceneImageLevel(25);
                        topAlert.alertAiSceneSelector(8, null);
                        setAiSceneEffect(25);
                        this.mCurrentAiScene = newResult;
                        config.restoreAllMutexElement("e");
                        this.mCamera2Device.setASD(false);
                        resumePreviewInWorkThread();
                        return;
                    case 26:
                    case 27:
                    case 28:
                    case 29:
                    case 30:
                    case 31:
                        if (!DataRepository.dataItemFeature().supportIndiaAi()) {
                            newResult = 0;
                            config.restoreAllMutexElement("e");
                            updatePreferenceInWorkThread(UpdateConstant.AI_SCENE_CONFIG);
                            break;
                        }
                        this.mCurrentAiScene = newResult;
                        config.restoreAllMutexElement("e");
                        break;
                    default:
                        config.restoreAllMutexElement("e");
                        updatePreferenceInWorkThread(UpdateConstant.AI_SCENE_CONFIG);
                        break;
                }
                trackAISceneChanged(this.mModuleIndex, newResult);
                topAlert.setAiSceneImageLevel(newResult);
                topAlert.alertAiSceneSelector(8, null);
                setAiSceneEffect(newResult);
                this.mCamera2Device.setASD(true);
                if (!isReset) {
                    this.mCurrentAiScene = newResult;
                }
                updateBeauty();
                resumePreviewInWorkThread();
            }
        }
    }

    /* JADX WARNING: Missing block: B:4:0x000f, code:
            return false;
     */
    private boolean shouldChangeAiScene(int r6) {
        /*
        r5 = this;
        r4 = 0;
        r0 = r5.isDoingAction();
        if (r0 != 0) goto L_0x000f;
    L_0x0007:
        r0 = r5.isAlive();
        r0 = r0 ^ 1;
        if (r0 == 0) goto L_0x0010;
    L_0x000f:
        return r4;
    L_0x0010:
        r0 = r5.mCurrentDetectedScene;
        if (r0 == r6) goto L_0x002b;
    L_0x0014:
        r0 = java.lang.System.currentTimeMillis();
        r2 = r5.mLastChangeSceneTime;
        r0 = r0 - r2;
        r2 = 300; // 0x12c float:4.2E-43 double:1.48E-321;
        r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1));
        if (r0 <= 0) goto L_0x002b;
    L_0x0021:
        r5.mCurrentDetectedScene = r6;
        r0 = java.lang.System.currentTimeMillis();
        r5.mLastChangeSceneTime = r0;
        r0 = 1;
        return r0;
    L_0x002b:
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Camera2Module.shouldChangeAiScene(int):boolean");
    }

    private boolean faceSceneFiltering(int scene) {
        if (this.mLatestFaceScene != scene) {
            this.mLatestFaceScene = scene;
            this.mSameFaceSceneDetectedTimes = 0;
        } else if (this.mSameFaceSceneDetectedTimes < 20) {
            this.mSameFaceSceneDetectedTimes++;
            if (20 == this.mSameFaceSceneDetectedTimes && this.mCurrentFaceScene != this.mLatestFaceScene) {
                this.mLatestFaceScene = this.mCurrentFaceScene;
                this.mCurrentFaceScene = this.mLatestFaceScene;
                return true;
            }
        }
        return false;
    }

    private void resetAiSceneInHdrOrFlashOn() {
        if (isAiSceneEnabled() && !this.resetedFromMutex && this.mCurrentAiScene != 0) {
            if (this.mCurrentAiScene == -1 || this.mCurrentAiScene == 10 || this.mCurrentAiScene == 21 || this.mCurrentAiScene == 22 || this.mCurrentAiScene == 6) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        Camera2Module.this.consumeAiSceneResult(0, true);
                        Camera2Module.this.resetedFromMutex = true;
                    }
                });
            }
        }
    }

    private void trackAISceneChanged(int cameraMode, int scene) {
        CameraStatUtil.trackAISceneChanged(cameraMode, scene, getResources());
    }

    private void applyBacklightEffect() {
        trackAISceneChanged(this.mModuleIndex, 23);
        setAiSceneEffect(23);
        updateHDR("normal");
        resetEvValue();
    }

    public void startScreenLight(int color, final int brightness) {
        ModeProtocol$ScreenLightProtocol protocol = (ModeProtocol$ScreenLightProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        if (protocol != null) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (Camera2Module.this.mActivity != null) {
                        Camera2Module.this.mActivity.setWindowBrightness(brightness);
                    }
                }
            });
            protocol.setScreenLightColor(color);
            protocol.showScreenLight();
        }
    }

    public void stopScreenLight() {
        ModeProtocol$ScreenLightProtocol protocol = (ModeProtocol$ScreenLightProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        Log.d(TAG, "stopScreenLight: protocol = " + protocol + ", mHandler = " + this.mHandler);
        if (protocol != null) {
            protocol.hideScreenLight();
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                if (Camera2Module.this.mActivity != null) {
                    Camera2Module.this.mActivity.restoreWindowBrightness();
                }
            }
        });
    }

    protected void trackModeCustomInfo(int takenNum) {
        if (this.mModuleIndex == 167) {
            trackManualInfo(takenNum);
        } else if (this.mModuleIndex == 163 && isFaceBeautyOn(this.mBeautyValues)) {
            trackBeautyInfo(takenNum, isFrontCamera(), new BeautyValues(this.mBeautyValues));
        }
    }

    private void trackManualInfo(int takenNum) {
        CameraStatUtil.trackPictureTakenInManual(takenNum, getManualValue("pref_camera_whitebalance_key", getString(R.string.pref_camera_whitebalance_default)), getManualValue("pref_qc_camera_exposuretime_key", getString(R.string.pref_camera_exposuretime_default)), getManualValue("pref_qc_camera_iso_key", getString(R.string.pref_camera_iso_default)), this.mModuleIndex);
    }

    private boolean isFaceBeautyOn(BeautyValues beautyValues) {
        boolean z = true;
        if (beautyValues == null) {
            return false;
        }
        if (!Device.isLegacyFaceBeauty()) {
            return BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel) ^ 1;
        }
        if (!CameraSettings.isAdvancedBeautyOn()) {
            return BeautyConstant.LEVEL_CLOSE.equals(beautyValues.mBeautyLevel) ^ 1;
        }
        if (beautyValues.mBeautySkinSmooth <= 0 && beautyValues.mBeautySkinColor <= 0 && beautyValues.mBeautySlimFace <= 0) {
            z = false;
        }
        return z;
    }

    private void trackBeautyInfo(int takenNum, boolean isFrontCamera, BeautyValues beautyValues) {
        CameraStatUtil.trackBeautyInfo(takenNum, isFrontCamera ? "前摄" : "后摄", beautyValues);
    }

    private void initFlashAutoStateForTrack(boolean mBackFlashMode) {
        this.mFlashAutoModeState = null;
        String currentFlash = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        if (!currentFlash.equals("3") && !currentFlash.equals("103")) {
            return;
        }
        if (this.mCurrentAsdScene == 9 || mBackFlashMode) {
            this.mFlashAutoModeState = "auto-on";
        } else {
            this.mFlashAutoModeState = "auto-off";
        }
    }
}
