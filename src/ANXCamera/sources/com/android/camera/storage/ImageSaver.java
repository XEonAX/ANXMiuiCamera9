package com.android.camera.storage;

import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Bitmap;
import android.location.Location;
import android.net.Uri;
import android.os.Handler;
import android.provider.MediaStore.Video.Media;
import com.android.camera.ActivityBase;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ActionProcessing;
import com.android.camera.storage.Storage.StorageListener;
import com.android.gallery3d.exif.ExifInterface;
import com.sensetime.stmobile.STCommon;
import java.io.File;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class ImageSaver {
    private static final Executor CAMERA_SAVER_EXECUTOR;
    private static final BlockingQueue<Runnable> mSaveRequestQueue = new LinkedBlockingQueue(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
    private static final ThreadFactory sThreadFactory = new ThreadFactory() {
        private final AtomicInteger mCount = new AtomicInteger(1);

        public Thread newThread(Runnable r) {
            return new Thread(r, "camera-saver-" + this.mCount.getAndIncrement());
        }
    };
    private ActivityBase mActivity;
    private Handler mHandler;
    private int mHostState;
    private boolean mIsCaptureIntent;
    private Uri mLastImageUri;
    private MemoryManager mMemoryManager;
    private Thumbnail mPendingThumbnail;
    private boolean mShouldStop;
    private boolean mStop;
    private ThumbnailUpdater mUpdateThumbnail = new ThumbnailUpdater();
    private Object mUpdateThumbnailLock = new Object();

    private class ImageSaveRequest implements Runnable {
        public String algorithmName;
        public byte[] data;
        public long date;
        public ExifInterface exif;
        public boolean finalImage;
        public int height;
        public boolean isHide;
        public boolean isMap;
        public boolean isParallelProcess;
        public Location loc;
        public boolean mirror;
        public boolean needThumbnail;
        public String oldTitle;
        public int orientation;
        private int size;
        public String title;
        public Uri uri;
        public int width;

        public void run() {
            save();
            onFinish();
        }

        public void save() {
            if (this.uri != null) {
                Storage.updateImage(ImageSaver.this.mActivity, this.data, this.exif, this.uri, this.title, this.loc, this.orientation, this.width, this.height, this.oldTitle);
            } else if (this.data != null) {
                this.uri = Storage.addImage(ImageSaver.this.mActivity, this.title, this.date, this.loc, this.orientation, this.data, this.width, this.height, false, this.isHide, this.isMap, false, this.isParallelProcess, this.algorithmName);
            }
            Storage.getAvailableSpace();
            boolean createThumbnail = this.needThumbnail ? ImageSaver.this.needThumbnail(isFinal()) : false;
            if (this.uri != null) {
                if (createThumbnail) {
                    Thumbnail t;
                    int inSampleSize = Integer.highestOneBit((int) Math.ceil(Math.max((double) this.width, (double) this.height) / 512.0d));
                    if (this.isMap) {
                        t = Thumbnail.createThumbnailFromUri(ImageSaver.this.mActivity.getContentResolver(), this.uri, this.mirror);
                    } else {
                        t = Thumbnail.createThumbnail(this.data, this.orientation, inSampleSize, this.uri, this.mirror);
                    }
                    ImageSaver.this.postUpdateThumbnail(t, true);
                } else {
                    ImageSaver.this.updatePreviewThumbnailUri(this.uri);
                }
                ImageSaver.this.notifyNewImage(this.uri, isFinal());
                return;
            }
            Log.e("ImageSaver", "image save failed");
            if (createThumbnail) {
                ImageSaver.this.postHideThumbnailProgressing();
                return;
            }
            Log.e("ImageSaver", "set mWaitingForUri is false");
            ImageSaver.this.updatePreviewThumbnailUri(null);
        }

        public int getSize() {
            return this.size;
        }

        public boolean isFinal() {
            return this.finalImage;
        }

        public void onFinish() {
            this.data = null;
            synchronized (this) {
                ImageSaver.this.mMemoryManager.reduceUsedMemory(getSize());
                if (!ImageSaver.this.isSaveQueueFull()) {
                    ImageSaver.this.mShouldStop = false;
                }
            }
        }

        public ImageSaveRequest(byte[] data, boolean needThumbnail, String title, String oldTitle, long date, Uri uri, Location loc, int width, int height, ExifInterface exif, int orientation, boolean isHide, boolean isMapFile, boolean finalImage, boolean mirror, boolean isParallelProcess, String algorithmName) {
            Location location;
            this.data = data;
            this.needThumbnail = needThumbnail;
            this.date = date;
            this.uri = uri;
            this.title = title;
            this.oldTitle = oldTitle;
            if (loc == null) {
                location = null;
            } else {
                location = new Location(loc);
            }
            this.loc = location;
            this.width = width;
            this.height = height;
            this.exif = exif;
            this.orientation = orientation;
            this.isHide = isHide;
            this.isMap = isMapFile;
            this.finalImage = finalImage;
            this.mirror = mirror;
            this.isParallelProcess = isParallelProcess;
            this.algorithmName = algorithmName;
            this.size = data == null ? 0 : data.length;
        }
    }

    private class MemoryManager implements StorageListener {
        private long mMaxMemory;
        private int mMaxTotalMemory;
        private Runtime mRuntime;
        private int mSaveTaskMemoryLimit;
        private int mSavedQueueMemoryLimit;
        private int mSaverMemoryUse;

        /* synthetic */ MemoryManager(ImageSaver this$0, MemoryManager -this1) {
            this();
        }

        private MemoryManager() {
            this.mRuntime = Runtime.getRuntime();
        }

        private void initMemory() {
            this.mMaxMemory = this.mRuntime.maxMemory();
            this.mMaxTotalMemory = (int) (((float) this.mMaxMemory) * 0.95f);
            this.mSaverMemoryUse = 0;
            initLimit();
            Storage.setStorageListener(this);
            Log.d("CameraMemoryManager", "initMemory: maxMemory=" + this.mMaxMemory);
        }

        private void initLimit() {
            long totalValidMemory = this.mMaxMemory - getBaseMemory();
            if (Storage.isUsePhoneStorage()) {
                this.mSaveTaskMemoryLimit = (int) (((float) totalValidMemory) * 0.6f);
            } else {
                this.mSaveTaskMemoryLimit = (int) (((float) totalValidMemory) * 0.5f);
                if (62914560 < this.mSaveTaskMemoryLimit) {
                    this.mSaveTaskMemoryLimit = 62914560;
                }
            }
            this.mSavedQueueMemoryLimit = (int) (((float) this.mSaveTaskMemoryLimit) * 1.3f);
        }

        private long getBaseMemory() {
            switch (Util.sWindowWidth) {
                case 720:
                    return 20971520;
                case 1080:
                    return 41943040;
                case 1440:
                    return 62914560;
                default:
                    return this.mRuntime.totalMemory() - this.mRuntime.freeMemory();
            }
        }

        private void addUsedMemory(int length) {
            this.mSaverMemoryUse += length;
        }

        private void reduceUsedMemory(int length) {
            this.mSaverMemoryUse -= length;
        }

        private boolean isSaveQueueFull() {
            log("isSaveQueueFull: usedMemory=" + this.mSaverMemoryUse);
            return this.mSaverMemoryUse >= this.mSavedQueueMemoryLimit;
        }

        private void log(String msg) {
            if (Util.sIsDumpLog) {
                Log.v("CameraMemoryManager", msg);
            }
        }

        public void onStoragePathChanged() {
            initMemory();
        }
    }

    private class ThumbnailUpdater implements Runnable {
        private boolean mNeedAnimation = true;

        public void setNeedAnimation(boolean needAnimation) {
            this.mNeedAnimation = needAnimation;
        }

        public void run() {
            ImageSaver.this.mActivity.getScreenHint().updateHint();
            ImageSaver.this.updateThumbnail(this.mNeedAnimation);
        }
    }

    private class VideoSaveRequest implements Runnable {
        private ContentValues mContentValues;
        private ActivityBase mContext;
        private boolean mIsFinal;
        private Uri mUri;
        private String mVideoPath;

        public VideoSaveRequest(ActivityBase context, String videoPath, ContentValues values, boolean isFinal) {
            this.mContext = context;
            this.mVideoPath = videoPath;
            this.mContentValues = values;
            this.mIsFinal = isFinal;
        }

        public void run() {
            save();
            onFinish();
        }

        public void save() {
            String finalName = this.mContentValues.getAsString("_data");
            if (!finalName.equals(this.mVideoPath)) {
                if (new File(this.mVideoPath).renameTo(new File(finalName))) {
                    this.mVideoPath = finalName;
                } else {
                    this.mContentValues.put("_data", this.mVideoPath);
                }
            }
            boolean thumbnail = ImageSaver.this.needThumbnail(isFinal());
            this.mUri = addVideoToMediaStore(this.mVideoPath, this.mContentValues);
            if (this.mUri != null) {
                if (thumbnail) {
                    Bitmap videoFrame = Thumbnail.createVideoThumbnailBitmap(this.mVideoPath, 512);
                    if (videoFrame != null) {
                        ImageSaver.this.postUpdateThumbnail(Thumbnail.createThumbnail(this.mUri, videoFrame, 0, false));
                    } else {
                        ImageSaver.this.postHideThumbnailProgressing();
                    }
                }
                ImageSaver.this.notifyNewVideo(this.mUri);
                Storage.saveToCloudAlbum(this.mContext, this.mVideoPath);
            } else if (thumbnail) {
                ImageSaver.this.postHideThumbnailProgressing();
            }
        }

        public boolean isFinal() {
            return this.mIsFinal;
        }

        public void onFinish() {
        }

        private Uri addVideoToMediaStore(String videoPath, ContentValues values) {
            long duration = Util.getDuration(videoPath);
            if (0 == duration) {
                Log.e("ImageSaver", "delete invalid video: " + videoPath);
                new File(videoPath).delete();
                return null;
            }
            Uri uri = null;
            values.put("_size", Long.valueOf(new File(videoPath).length()));
            values.put("duration", Long.valueOf(duration));
            try {
                uri = this.mContext.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, values);
            } catch (Exception e) {
                Log.e("ImageSaver", "failed to add video to media store", e);
            } finally {
                Log.v("ImageSaver", "Current video URI: " + uri);
            }
            return uri;
        }
    }

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(4, 4, 10, TimeUnit.SECONDS, mSaveRequestQueue, sThreadFactory);
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        CAMERA_SAVER_EXECUTOR = threadPoolExecutor;
    }

    public ImageSaver(ActivityBase activity, Handler handler, boolean isCaptureIntent) {
        this.mActivity = activity;
        this.mHandler = handler;
        this.mIsCaptureIntent = isCaptureIntent;
        this.mMemoryManager = new MemoryManager(this, null);
        this.mMemoryManager.initMemory();
    }

    private void quitAllSaveThread() {
    }

    public void addImage(byte[] data, boolean needThumbnail, String title, long date, Uri uri, Location loc, int width, int height, ExifInterface exif, int orientation, boolean isHide, boolean isMapFile, boolean finalImage, boolean mirror) {
        addImage(data, needThumbnail, title, null, date, uri, loc, width, height, exif, orientation, isHide, isMapFile, finalImage, mirror, false, null);
    }

    public void addImage(byte[] data, boolean needThumbnail, String title, long date, Uri uri, Location loc, int width, int height, ExifInterface exif, int orientation, boolean isHide, boolean isMapFile, boolean finalImage, boolean mirror, boolean isParallelProcess, String algorithmName) {
        addImage(data, needThumbnail, title, null, date, uri, loc, width, height, exif, orientation, isHide, isMapFile, finalImage, mirror, isParallelProcess, algorithmName);
    }

    public void addImage(byte[] data, boolean needThumbnail, String title, String oldTitle, long date, Uri uri, Location loc, int width, int height, ExifInterface exif, int orientation, boolean isHide, boolean isMapFile, boolean finalImage, boolean mirror, boolean isParallelProcess, String algorithmName) {
        if (oldTitle != null && uri == null) {
            uri = this.mLastImageUri;
        }
        addImage(new ImageSaveRequest(data, needThumbnail, title, oldTitle, date, uri, loc, width, height, exif, orientation, isHide, isMapFile, finalImage, mirror, isParallelProcess, algorithmName));
    }

    public void updateImage(String title, String oldTitle) {
        ImageSaveRequest r = new ImageSaveRequest();
        r.title = title;
        r.oldTitle = oldTitle;
        addImage(r);
    }

    public boolean isSaveQueueFull() {
        return this.mMemoryManager.isSaveQueueFull();
    }

    private void addImage(ImageSaveRequest r) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v("ImageSaver", "addImage: host is being destroyed.");
                return;
            }
            if (isSaveQueueFull()) {
                this.mShouldStop = true;
            }
            if (this.mStop) {
                Log.d("ImageSaver", "run: exiting");
                return;
            }
            this.mMemoryManager.addUsedMemory(r.getSize());
            CAMERA_SAVER_EXECUTOR.execute(r);
        }
    }

    public void addVideo(String videoPath, ContentValues values, boolean isFinal) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v("ImageSaver", "addVideo: host is being destroyed.");
            } else if (this.mStop) {
                Log.d("ImageSaver", "run: exiting");
            } else {
                CAMERA_SAVER_EXECUTOR.execute(new VideoSaveRequest(this.mActivity, videoPath, values, isFinal));
            }
        }
    }

    public Uri addVideoSync(String videoPath, ContentValues values, boolean isFinal) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v("ImageSaver", "addVideo: host is being destroyed.");
                return null;
            }
            VideoSaveRequest r = new VideoSaveRequest(this.mActivity, videoPath, values, isFinal);
            r.save();
            Uri -get0 = r.mUri;
            return -get0;
        }
    }

    public boolean shouldStopShot() {
        return this.mShouldStop;
    }

    public void onHostResume(boolean isCaptureIntent) {
        synchronized (this) {
            this.mIsCaptureIntent = isCaptureIntent;
            this.mHostState = 0;
            Log.v("ImageSaver", "onHostResume: isCapture=" + this.mIsCaptureIntent);
        }
    }

    public void onHostPause() {
        synchronized (this) {
            this.mHostState = 1;
        }
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mPendingThumbnail = null;
        }
        Log.v("ImageSaver", "onHostPause");
    }

    public void onHostDestroy() {
        synchronized (this) {
            this.mHostState = 2;
            this.mStop = true;
            quitAllSaveThread();
        }
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mPendingThumbnail = null;
        }
        Log.v("ImageSaver", "onHostDestroy");
    }

    private void updateThumbnail(boolean needAnimation) {
        Thumbnail t;
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacks(this.mUpdateThumbnail);
            t = this.mPendingThumbnail;
            this.mPendingThumbnail = null;
        }
        if (t != null) {
            this.mActivity.getThumbnailUpdater().setThumbnail(t, true, needAnimation);
            if (this.mActivity.isActivityPaused()) {
                this.mActivity.getThumbnailUpdater().saveThumbnailToFile();
            }
        }
    }

    private boolean needThumbnail(boolean finalImage) {
        boolean z;
        synchronized (this) {
            if (finalImage) {
                if (this.mHostState != 2 && isLastImageForThumbnail()) {
                    z = this.mIsCaptureIntent ^ 1;
                }
            }
            z = false;
        }
        return z;
    }

    private void postUpdateThumbnail(Thumbnail t) {
        postUpdateThumbnail(t, true);
    }

    private void postUpdateThumbnail(Thumbnail t, boolean needAnimation) {
        synchronized (this.mUpdateThumbnailLock) {
            this.mPendingThumbnail = t;
            this.mUpdateThumbnail.setNeedAnimation(needAnimation);
            this.mHandler.post(this.mUpdateThumbnail);
        }
    }

    private void updatePreviewThumbnailUri(Uri uri) {
        synchronized (this.mUpdateThumbnailLock) {
            this.mActivity.getThumbnailUpdater().updatePreviewThumbnailUri(uri);
        }
    }

    private void postHideThumbnailProgressing() {
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    ((ModeProtocol$ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).updateLoading(true);
                }
            });
        }
    }

    private void notifyNewImage(Uri uri, boolean addToSecure) {
        synchronized (this) {
            if (!this.mIsCaptureIntent) {
                Util.broadcastNewPicture(this.mActivity, uri);
                this.mLastImageUri = uri;
                if (addToSecure) {
                    this.mActivity.addSecureUri(uri);
                }
            }
        }
    }

    private void notifyNewVideo(Uri uri) {
        if (!this.mIsCaptureIntent) {
            this.mActivity.sendBroadcast(new Intent("android.hardware.action.NEW_VIDEO", uri));
            this.mActivity.addSecureUri(uri);
        }
    }

    private boolean isLastImageForThumbnail() {
        return true;
    }
}
