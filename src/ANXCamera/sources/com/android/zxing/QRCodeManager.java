package com.android.zxing;

import android.app.Activity;
import android.content.Context;
import android.graphics.ImageFormat;
import android.graphics.Point;
import android.graphics.Rect;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v7.recyclerview.R;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.android.camera.CameraAppImpl;
import com.android.camera.Device;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.android.camera2.PreviewImageProp;
import com.google.zxing.Result;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.WeakHashMap;

public class QRCodeManager {
    private static int CENTER_FRAME_WIDTH;
    private static final int DECODE_TOTAL_TIME = (Device.isLowPowerQRScan() ? 15000 : -1);
    private static int MAX_FRAME_HEIGHT;
    private static int MAX_FRAME_WIDTH;
    private static final String TAG = QRCodeManager.class.getSimpleName();
    private static WeakHashMap<Context, QRCodeManager> sMap = new WeakHashMap();
    private Activity mActivity;
    private Handler mCallBackHandler;
    private boolean mCreated;
    private DecodeHandlerFactory mDecodeHandlerFactory;
    private boolean mDecoding;
    private boolean mFuncEnable;
    private Handler mHandler;
    private long mLastPreviewReceivedTime;
    private OnImageAvailableListener mOnImageAvailableListener = new OnImageAvailableListener() {
        /* JADX WARNING: Missing block: B:4:0x001c, code:
            return;
     */
        public void onImageAvailable(android.media.ImageReader r9) {
            /*
            r8 = this;
            r3 = com.android.zxing.QRCodeManager.TAG;
            r4 = "a new ImageReader received";
            com.android.camera.log.Log.c(r3, r4);
            r3 = com.android.zxing.QRCodeManager.this;
            r3 = r3.shouldScan();
            if (r3 == 0) goto L_0x001c;
        L_0x0012:
            r3 = com.android.zxing.QRCodeManager.this;
            r3 = r3.mDecoding;
            r3 = r3 ^ 1;
            if (r3 == 0) goto L_0x001d;
        L_0x001c:
            return;
        L_0x001d:
            r4 = java.lang.System.currentTimeMillis();
            r3 = com.android.zxing.QRCodeManager.this;
            r6 = r3.mLastPreviewReceivedTime;
            r4 = r4 - r6;
            r6 = 1000; // 0x3e8 float:1.401E-42 double:4.94E-321;
            r3 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1));
            if (r3 >= 0) goto L_0x002f;
        L_0x002e:
            return;
        L_0x002f:
            r3 = com.android.zxing.QRCodeManager.this;
            r4 = java.lang.System.currentTimeMillis();
            r3.mLastPreviewReceivedTime = r4;
            r2 = r9.acquireNextImage();
            r3 = r2.getPlanes();
            r4 = 0;
            r3 = r3[r4];
            r0 = r3.getBuffer();
            r3 = r0.remaining();
            r1 = new byte[r3];
            r0.get(r1);
            r3 = com.android.zxing.QRCodeManager.this;
            r3.sendDecodeMessage(r1);
            r2.close();
            return;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.zxing.QRCodeManager.2.onImageAvailable(android.media.ImageReader):void");
        }
    };
    private PreviewCallback mPreviewCallback = new PreviewCallback() {
        public void onPreviewFrame(PreviewImageProp previewImage, Camera2Proxy camera) {
            Log.c(QRCodeManager.TAG, "preview frame buffer received");
            if (!QRCodeManager.this.shouldScan() || (QRCodeManager.this.mDecoding ^ 1) != 0) {
                return;
            }
            if ((QRCodeManager.DECODE_TOTAL_TIME < 0 || System.currentTimeMillis() - QRCodeManager.this.mStartTime <= ((long) QRCodeManager.DECODE_TOTAL_TIME)) && System.currentTimeMillis() - QRCodeManager.this.mLastPreviewReceivedTime >= 1000) {
                QRCodeManager.this.mLastPreviewReceivedTime = System.currentTimeMillis();
                QRCodeManager.this.sendDecodeMessage(PreviewImageProp.removePadding(previewImage, QRCodeManager.this.mPreviewWidth, QRCodeManager.this.mPreviewHeight));
            }
        }
    };
    private int mPreviewFormat = 17;
    private int mPreviewHeight;
    private int mPreviewLayoutHeight;
    private int mPreviewLayoutWidth;
    private int mPreviewWidth;
    private ImageReader mQRCodeImageReader;
    private QRCode$QRCodeResultCallback mQRCodeResultCallback;
    private Rect mRectFinderCenter = new Rect(0, 0, 0, 0);
    private Rect mRectFinderFocusArea = new Rect(0, 0, 0, 0);
    private Rect mRectPreviewCenter = new Rect(0, 0, 0, 0);
    private Rect mRectPreviewFocusArea = new Rect(0, 0, 0, 0);
    private boolean mResumed;
    private String mScanResult;
    private long mStartTime;
    private Object objLock = new Object();

    private class MainThreadHandler extends Handler {
        MainThreadHandler(Looper loop) {
            super(loop);
        }

        public void handleMessage(final Message msg) {
            switch (msg.what) {
                case R.id.find_timeout /*2131361794*/:
                    Log.d(QRCodeManager.TAG, "dispatchMessage: find_timeout");
                    QRCodeManager.this.responseCallback(new Runnable() {
                        public void run() {
                            if (QRCodeManager.this.mQRCodeResultCallback != null) {
                                QRCodeManager.this.mQRCodeResultCallback.onDecodeTimeOut();
                            }
                        }
                    });
                    return;
                case R.id.find_qrcode /*2131361795*/:
                    QRCodeManager.this.mScanResult = QRCodeManager.transcoding(((Result) msg.obj).getText());
                    Log.d(QRCodeManager.TAG, "dispatchMessage: find_qrcode");
                    QRCodeManager.this.responseCallback(new Runnable() {
                        public void run() {
                            Log.d(QRCodeManager.TAG, "run: ");
                            if (QRCodeManager.this.mQRCodeResultCallback != null) {
                                QRCodeManager.this.mQRCodeResultCallback.onFindQRCode((Result) msg.obj);
                            }
                        }
                    });
                    QRCodeManager.this.restartAfter(4000);
                    return;
                case R.id.decode_fail /*2131361797*/:
                    Log.d(QRCodeManager.TAG, "dispatchMessage: decode_fail");
                    QRCodeManager.this.responseCallback(new Runnable() {
                        public void run() {
                            if (QRCodeManager.this.mQRCodeResultCallback != null) {
                                QRCodeManager.this.mQRCodeResultCallback.onFailed();
                            }
                        }
                    });
                    return;
                case R.id.decode_exit /*2131361798*/:
                    Log.d(QRCodeManager.TAG, "dispatchMessage: exit");
                    QRCodeManager.this.stopDecode();
                    return;
                default:
                    return;
            }
        }
    }

    static {
        MAX_FRAME_HEIGHT = 360;
        MAX_FRAME_WIDTH = 480;
        CENTER_FRAME_WIDTH = 720;
        DisplayMetrics metrics = new DisplayMetrics();
        ((WindowManager) CameraAppImpl.getAndroidContext().getSystemService("window")).getDefaultDisplay().getMetrics(metrics);
        CENTER_FRAME_WIDTH = metrics.widthPixels;
        MAX_FRAME_HEIGHT = CENTER_FRAME_WIDTH;
        MAX_FRAME_WIDTH = CENTER_FRAME_WIDTH;
    }

    private QRCodeManager(Activity activity) {
        this.mActivity = activity;
        this.mHandler = new MainThreadHandler(activity.getMainLooper());
    }

    public static QRCodeManager instance(Activity activity) {
        QRCodeManager instance = (QRCodeManager) sMap.get(activity);
        if (instance != null) {
            return instance;
        }
        instance = new QRCodeManager(activity);
        sMap.put(activity, instance);
        return instance;
    }

    private static void removeInstance(Activity activity) {
        QRCodeManager instance = (QRCodeManager) sMap.remove(activity);
        if (instance != null && instance.mResumed) {
            instance.pause();
        }
    }

    public void create() {
        this.mCreated = true;
    }

    public void resume() {
        this.mResumed = true;
        this.mStartTime = System.currentTimeMillis();
    }

    public void pause() {
        if (this.mDecoding) {
            stopDecode();
        }
        this.mResumed = false;
    }

    public void destroy() {
        if (this.mResumed) {
            pause();
        }
        this.mCreated = false;
        removeInstance(this.mActivity);
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
        this.mHandler = null;
        this.mScanResult = null;
        this.mQRCodeResultCallback = null;
        this.mCallBackHandler = null;
    }

    public void setEnable(boolean enable) {
        if (this.mDecoding) {
            stopDecode();
        }
        this.mFuncEnable = enable;
    }

    public void setResultCallback(QRCode$QRCodeResultCallback callback) {
        this.mQRCodeResultCallback = callback;
        this.mCallBackHandler = this.mHandler;
    }

    public void startDecode() {
        if (!this.mFuncEnable) {
            Log.w(TAG, "startDecode: Function has not been enabled!");
        } else if (this.mDecoding) {
            Log.w(TAG, "startDecode: already started!");
        } else if (shouldScan()) {
            if (this.mDecodeHandlerFactory == null) {
                this.mDecodeHandlerFactory = new DecodeHandlerFactory(this, false);
            }
            this.mDecodeHandlerFactory.start();
            if (this.mQRCodeImageReader != null) {
                this.mQRCodeImageReader.setOnImageAvailableListener(this.mOnImageAvailableListener, this.mHandler);
            }
            responseCallback(new Runnable() {
                public void run() {
                    if (QRCodeManager.this.mQRCodeResultCallback != null) {
                        QRCodeManager.this.mQRCodeResultCallback.onStart();
                    }
                }
            });
            this.mDecoding = true;
            reset();
        } else {
            Log.w(TAG, "startDecode: can not start decode!");
        }
    }

    public void reset() {
        if (this.mDecoding && this.mHandler != null && DECODE_TOTAL_TIME != -1) {
            this.mHandler.removeMessages(R.id.decode_exit);
            this.mHandler.sendEmptyMessageDelayed(R.id.decode_exit, (long) DECODE_TOTAL_TIME);
        }
    }

    public void stopDecode() {
        if (this.mDecoding) {
            this.mDecoding = false;
            if (this.mQRCodeImageReader != null) {
                this.mQRCodeImageReader.setOnImageAvailableListener(null, null);
            }
            if (this.mHandler != null) {
                this.mHandler.removeMessages(R.id.decode_fail);
                this.mHandler.removeMessages(R.id.find_qrcode);
                this.mHandler.removeMessages(R.id.find_timeout);
                this.mHandler.removeMessages(R.id.decode_exit);
            }
            synchronized (this.objLock) {
                if (this.mDecodeHandlerFactory != null) {
                    this.mDecodeHandlerFactory.quit();
                    this.mDecodeHandlerFactory = null;
                }
            }
            responseCallback(new Runnable() {
                public void run() {
                    if (QRCodeManager.this.mQRCodeResultCallback != null) {
                        QRCodeManager.this.mQRCodeResultCallback.onStop();
                    }
                }
            });
            return;
        }
        Log.w(TAG, "stopDecode: already stopped!");
    }

    public String getScanResult() {
        return this.mScanResult;
    }

    public void setPreviewFormat(int format) {
        if (ImageFormat.isPublicFormat(format)) {
            this.mPreviewFormat = format;
            return;
        }
        throw new IllegalArgumentException("Format is unknown");
    }

    public void setTransposePreviewSize(int width, int height) {
        Log.d(TAG, "setTransposePreviewSize:  " + width + " x " + height);
        if (this.mPreviewWidth != width || this.mPreviewHeight != height) {
            this.mPreviewWidth = width;
            this.mPreviewHeight = height;
            updateRectInPreview();
        }
    }

    public void setPreviewLayoutSize(int width, int height) {
        Log.d(TAG, "setPreviewLayoutSize: " + width + " x " + height);
        if (this.mPreviewLayoutWidth != width || this.mPreviewLayoutHeight != height) {
            this.mPreviewLayoutWidth = width;
            this.mPreviewLayoutHeight = height;
            updateViewFinderRect(null);
        }
    }

    public PreviewCallback getPreviewCallback() {
        return this.mPreviewCallback;
    }

    YUVLuminanceSource buildLuminanceSource(byte[] data, int width, int height, boolean center) {
        if (this.mPreviewFormat == 17 && this.mDecoding) {
            if (center) {
                try {
                    if ((this.mRectPreviewCenter.isEmpty() ^ 1) != 0) {
                        return new YUVLuminanceSource(data, width, height, this.mRectPreviewCenter.left, this.mRectPreviewCenter.top, this.mRectPreviewCenter.width(), this.mRectPreviewCenter.height());
                    }
                } catch (IllegalArgumentException e) {
                    Log.e(TAG, "buildLuminanceSource: " + e.getMessage());
                }
            }
            if (!(this.mRectPreviewFocusArea.isEmpty() || (this.mRectPreviewCenter.contains(this.mRectPreviewFocusArea) ^ 1) == 0)) {
                return new YUVLuminanceSource(data, width, height, this.mRectPreviewFocusArea.left, this.mRectPreviewFocusArea.top, this.mRectPreviewFocusArea.width(), this.mRectPreviewFocusArea.height());
            }
        }
        return null;
    }

    Handler getHandler() {
        return this.mHandler;
    }

    private void updateViewFinderRect(Point area) {
        int width = Math.min(this.mPreviewLayoutWidth, CENTER_FRAME_WIDTH);
        int height = Math.min(this.mPreviewLayoutHeight, CENTER_FRAME_WIDTH);
        int left = (this.mPreviewLayoutWidth - width) / 2;
        int top = (this.mPreviewLayoutHeight - height) / 2;
        this.mRectFinderCenter.set(left, top, left + width, top + height);
        if (area != null) {
            width = Math.min(this.mPreviewLayoutWidth, MAX_FRAME_WIDTH);
            height = Math.min(this.mPreviewLayoutHeight, MAX_FRAME_HEIGHT);
            this.mRectFinderFocusArea.set(Math.max(area.x - (width / 2), 0), Math.max(area.y - (height / 2), 0), Math.min(area.x + (width / 2), this.mPreviewLayoutWidth), Math.min(area.y + (height / 2), this.mPreviewLayoutHeight));
        } else {
            this.mRectFinderFocusArea.set(0, 0, 0, 0);
        }
        updateRectInPreview();
    }

    private void updateRectInPreview() {
        if (this.mPreviewLayoutWidth != 0) {
            float scaleWidth = ((float) this.mPreviewWidth) / ((float) this.mPreviewLayoutWidth);
            float scaleHeight = ((float) this.mPreviewHeight) / ((float) this.mPreviewLayoutHeight);
            this.mRectPreviewFocusArea.set((int) (((float) this.mRectFinderFocusArea.left) * scaleWidth), (int) (((float) this.mRectFinderFocusArea.top) * scaleHeight), (int) (((float) this.mRectFinderFocusArea.right) * scaleWidth), (int) (((float) this.mRectFinderFocusArea.bottom) * scaleHeight));
            this.mRectPreviewCenter.set((int) (((float) this.mRectFinderCenter.left) * scaleWidth), (int) (((float) this.mRectFinderCenter.top) * scaleHeight), (int) (((float) this.mRectFinderCenter.right) * scaleWidth), (int) (((float) this.mRectFinderCenter.bottom) * scaleHeight));
        }
    }

    private void sendDecodeMessage(byte[] data) {
        if (shouldScan() && (this.mDecoding ^ 1) == 0) {
            Log.d(TAG, "sendDecodeMessage: received a preview data");
            synchronized (this.objLock) {
                if (!(this.mDecodeHandlerFactory == null || data == null)) {
                    this.mDecodeHandlerFactory.getHandler().removeMessages(R.id.decode);
                    this.mDecodeHandlerFactory.getHandler().obtainMessage(R.id.decode, this.mPreviewWidth, this.mPreviewHeight, data).sendToTarget();
                }
            }
        }
    }

    private void restartAfter(int delay) {
        if (this.mFuncEnable && this.mResumed && this.mHandler != null) {
            this.mHandler.sendEmptyMessageDelayed(R.id.decode_exit, 0);
            this.mHandler.postDelayed(new Runnable() {
                public void run() {
                    QRCodeManager.this.startDecode();
                }
            }, (long) delay);
            return;
        }
        Log.w(TAG, "restart decode failed after:" + delay);
    }

    private boolean shouldScan() {
        if (!this.mFuncEnable || !this.mCreated || !this.mResumed || this.mQRCodeResultCallback == null || this.mPreviewWidth == 0 || this.mPreviewLayoutWidth == 0) {
            return false;
        }
        return true;
    }

    private void responseCallback(Runnable runnable) {
        if (!shouldScan()) {
            return;
        }
        if (this.mCallBackHandler == this.mHandler || this.mCallBackHandler == null) {
            runnable.run();
        } else {
            this.mCallBackHandler.post(runnable);
        }
    }

    private static String transcoding(String str) {
        String format = "";
        try {
            if (Charset.forName("ISO-8859-1").newEncoder().canEncode(str)) {
                return new String(str.getBytes("ISO-8859-1"), "GB2312");
            }
            return str;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return format;
        }
    }
}
