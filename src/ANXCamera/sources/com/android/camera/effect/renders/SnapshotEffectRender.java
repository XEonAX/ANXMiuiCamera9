package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.location.Location;
import android.net.Uri;
import android.opengl.GLES20;
import android.os.ConditionVariable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.support.v7.recyclerview.R;
import android.text.TextUtils;
import android.util.TypedValue;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.JpegEncodingQualityMappings;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.ShaderNativeUtil;
import com.android.camera.effect.SnapshotCanvas;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.effect.draw_mode.DrawJPEGAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.storage.ImageSaver;
import com.android.camera.storage.Storage;
import com.android.gallery3d.exif.ExifInterface;
import com.android.gallery3d.ui.BaseGLCanvas;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;

public class SnapshotEffectRender {
    private static final int[] CONFIG_SPEC = new int[]{12352, 4, 12324, 8, 12323, 8, 12322, 8, 12344};
    private static final String TAG = SnapshotEffectRender.class.getSimpleName();
    private ActivityBase mActivity;
    private Bitmap mDualCameraWaterMark;
    private float mDualCameraWaterMarkPaddingXRatio;
    private float mDualCameraWaterMarkPaddingYRatio;
    private float mDualCameraWaterMarkSizeRatio;
    private EGL10 mEgl;
    private EGLConfig mEglConfig;
    private EGLContext mEglContext;
    private EGLDisplay mEglDisplay;
    private EGLHandler mEglHandler;
    private EGLSurface mEglSurface;
    private HandlerThread mEglThread;
    private ConditionVariable mEglThreadBlockVar = new ConditionVariable();
    private boolean mExifNeeded = true;
    private ImageSaver mImageSaver;
    private boolean mIsImageCaptureIntent;
    private volatile int mJpegQueueSize = 0;
    private final Object mLock = new Object();
    private int mQuality = 97;
    private boolean mRelease;
    private boolean mReleasePending;
    private Map<String, String> mTitleMap = new HashMap(7);

    private class EGLHandler extends Handler {
        private FrameBuffer mFrameBuffer;
        private SnapshotCanvas mGLCanvas;

        public EGLHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            if (SnapshotEffectRender.this.mActivity != null) {
                switch (msg.what) {
                    case 0:
                        initEGL();
                        this.mGLCanvas = new SnapshotCanvas();
                        this.mGLCanvas.setSize(SnapshotEffectRender.this.mActivity.getCameraScreenNail().getWidth(), SnapshotEffectRender.this.mActivity.getCameraScreenNail().getHeight());
                        SnapshotEffectRender.this.mEglThreadBlockVar.open();
                        break;
                    case 1:
                        drawMainJpeg((DrawJPEGAttribute) msg.obj, true);
                        this.mGLCanvas.recycledResources();
                        if (SnapshotEffectRender.this.mReleasePending && (hasMessages(1) ^ 1) != 0) {
                            release();
                        }
                        synchronized (SnapshotEffectRender.this.mLock) {
                            SnapshotEffectRender snapshotEffectRender = SnapshotEffectRender.this;
                            snapshotEffectRender.mJpegQueueSize = snapshotEffectRender.mJpegQueueSize - 1;
                        }
                    case 2:
                        DrawJPEGAttribute jpeg = msg.obj;
                        if (msg.arg1 > 0) {
                            drawThumbJpeg(jpeg, false);
                        }
                        drawMainJpeg(jpeg, false);
                        this.mGLCanvas.recycledResources();
                        SnapshotEffectRender.this.mEglThreadBlockVar.open();
                        break;
                    case 3:
                        drawThumbJpeg((DrawJPEGAttribute) msg.obj, true);
                        break;
                    case 4:
                        drawThumbJpeg((DrawJPEGAttribute) msg.obj, true);
                        SnapshotEffectRender.this.mEglThreadBlockVar.open();
                        break;
                    case 5:
                        release();
                        break;
                    case 6:
                        this.mGLCanvas.prepareEffectRenders(false, msg.arg1);
                        break;
                }
            }
        }

        private void initEGL() {
            SnapshotEffectRender.this.mEgl = (EGL10) EGLContext.getEGL();
            SnapshotEffectRender.this.mEglDisplay = SnapshotEffectRender.this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (SnapshotEffectRender.this.mEglDisplay == EGL10.EGL_NO_DISPLAY) {
                throw new RuntimeException("eglGetDisplay failed");
            }
            int[] version = new int[2];
            if (SnapshotEffectRender.this.mEgl.eglInitialize(SnapshotEffectRender.this.mEglDisplay, version)) {
                Log.v(SnapshotEffectRender.TAG, "EGL version: " + version[0] + '.' + version[1]);
                int[] attrList = new int[]{12440, 2, 12344};
                SnapshotEffectRender.this.mEglConfig = SnapshotEffectRender.chooseConfig(SnapshotEffectRender.this.mEgl, SnapshotEffectRender.this.mEglDisplay);
                SnapshotEffectRender.this.mEglContext = SnapshotEffectRender.this.mEgl.eglCreateContext(SnapshotEffectRender.this.mEglDisplay, SnapshotEffectRender.this.mEglConfig, EGL10.EGL_NO_CONTEXT, attrList);
                if (SnapshotEffectRender.this.mEglContext == null || SnapshotEffectRender.this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                    throw new RuntimeException("failed to createContext");
                }
                SnapshotEffectRender.this.mEglSurface = SnapshotEffectRender.this.mEgl.eglCreatePbufferSurface(SnapshotEffectRender.this.mEglDisplay, SnapshotEffectRender.this.mEglConfig, new int[]{12375, Util.sWindowWidth, 12374, Util.sWindowHeight, 12344});
                if (SnapshotEffectRender.this.mEglSurface == null || SnapshotEffectRender.this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                    throw new RuntimeException("failed to createWindowSurface");
                } else if (!SnapshotEffectRender.this.mEgl.eglMakeCurrent(SnapshotEffectRender.this.mEglDisplay, SnapshotEffectRender.this.mEglSurface, SnapshotEffectRender.this.mEglSurface, SnapshotEffectRender.this.mEglContext)) {
                    throw new RuntimeException("failed to eglMakeCurrent");
                } else {
                    return;
                }
            }
            throw new RuntimeException("eglInitialize failed");
        }

        private void drawWaterMark(WaterMark waterMark, int x, int y, int orientation) {
            this.mGLCanvas.getState().pushState();
            if (orientation != 0) {
                this.mGLCanvas.getState().translate((float) (waterMark.getCenterX() + x), (float) (waterMark.getCenterY() + y));
                this.mGLCanvas.getState().rotate((float) (-orientation), 0.0f, 0.0f, 1.0f);
                this.mGLCanvas.getState().translate((float) ((-x) - waterMark.getCenterX()), (float) ((-y) - waterMark.getCenterY()));
            }
            this.mGLCanvas.getBasicRender().draw(new DrawBasicTexAttribute(waterMark.getTexture(), waterMark.getLeft() + x, waterMark.getTop() + y, waterMark.getWidth(), waterMark.getHeight()));
            this.mGLCanvas.getState().popState();
        }

        private void drawWaterMark(int x, int y, int width, int height, int orientation) {
            if (Device.isEffectWatermarkFilted()) {
                if (CameraSettings.isTimeWaterMarkOpen()) {
                    WaterMark waterMark;
                    String waterMarkText = Util.getTimeWatermark();
                    if (Device.isSupportedNewStyleTimeWaterMark()) {
                        waterMark = new NewStyleTextWaterMark(waterMarkText, width, height, orientation);
                    } else {
                        waterMark = new TextWaterMark(waterMarkText, width, height, orientation);
                    }
                    drawWaterMark(waterMark, x, y, orientation);
                }
                if (CameraSettings.isDualCameraWaterMarkOpen() && SnapshotEffectRender.this.mDualCameraWaterMark != null) {
                    drawWaterMark(new ImageWaterMark(SnapshotEffectRender.this.mDualCameraWaterMark, width, height, orientation, SnapshotEffectRender.this.mDualCameraWaterMarkSizeRatio, SnapshotEffectRender.this.mDualCameraWaterMarkPaddingXRatio, SnapshotEffectRender.this.mDualCameraWaterMarkPaddingYRatio), x, y, orientation);
                }
            }
        }

        private byte[] applyEffect(DrawJPEGAttribute jpeg, int downScale, boolean applyToThumb, Size targetSize, Size originSize) {
            Log.d(SnapshotEffectRender.TAG, "applyEffect: applyToThumb = " + applyToThumb);
            byte[] data = applyToThumb ? jpeg.mExif.getThumbnailBytes() : jpeg.mData;
            if (data == null) {
                Log.w(SnapshotEffectRender.TAG, "Null " + (applyToThumb ? "thumb!" : "jpeg!"));
                return null;
            }
            long lastTime = System.currentTimeMillis();
            int[] texId = new int[1];
            GLES20.glGenTextures(1, texId, 0);
            int[] textureSize = ShaderNativeUtil.initTexture(data, texId[0], downScale);
            Log.d(SnapshotEffectRender.TAG, "initTime=" + (System.currentTimeMillis() - lastTime));
            int width = applyToThumb ? textureSize[0] : jpeg.mWidth;
            int height = applyToThumb ? textureSize[1] : jpeg.mHeight;
            int previewWidth = applyToThumb ? textureSize[0] : jpeg.mPreviewWidth;
            int previewHeight = applyToThumb ? textureSize[1] : jpeg.mPreviewHeight;
            Render render = getEffectRender(jpeg.mEffectIndex);
            if (render == null) {
                Log.w(SnapshotEffectRender.TAG, "init render failed");
                return data;
            }
            if (render instanceof PipeRender) {
                ((PipeRender) render).setFrameBufferSize(width, height);
            }
            render.setPreviewSize(previewWidth, previewHeight);
            render.setEffectRangeAttribute(jpeg.mAttribute);
            render.setMirror(jpeg.mMirror);
            if (applyToThumb) {
                render.setSnapshotSize(width, height);
            } else {
                render.setSnapshotSize(originSize.width, originSize.height);
            }
            render.setOrientation(jpeg.mOrientation);
            render.setShootRotation(jpeg.mShootRotation);
            render.setJpegOrientation(jpeg.mJpegOrientation);
            checkFrameBuffer(width, height);
            this.mGLCanvas.beginBindFrameBuffer(this.mFrameBuffer);
            lastTime = System.currentTimeMillis();
            render.setParentFrameBufferId(this.mFrameBuffer.getId());
            render.draw(new DrawIntTexAttribute(texId[0], 0, 0, width, height, true));
            render.deleteBuffer();
            int offsetX = 0;
            int offsetY = 0;
            if (ModuleManager.isSquareModule()) {
                if (width > height) {
                    offsetX = (width - height) / 2;
                    width = height;
                } else {
                    offsetY = (height - width) / 2;
                    height = width;
                }
            }
            if (!applyToThumb) {
                jpeg.mWidth = width;
                jpeg.mHeight = height;
            } else if (targetSize != null) {
                targetSize.width = width;
                targetSize.height = height;
                Log.d(SnapshotEffectRender.TAG, "thumbSize=" + targetSize.width + "*" + targetSize.height);
            }
            if (jpeg.mApplyWaterMark) {
                drawWaterMark(offsetX, offsetY, width, height, jpeg.mJpegOrientation);
            }
            Log.d(SnapshotEffectRender.TAG, "drawTime=" + (System.currentTimeMillis() - lastTime));
            GLES20.glPixelStorei(3333, 1);
            lastTime = System.currentTimeMillis();
            int quality = SnapshotEffectRender.this.mQuality;
            if (applyToThumb) {
                quality = Math.min(SnapshotEffectRender.this.mQuality, JpegEncodingQualityMappings.getQualityNumber("normal"));
            }
            byte[] outData = ShaderNativeUtil.getPicture(offsetX, offsetY, width, height, quality);
            Log.d(SnapshotEffectRender.TAG, "readTime=" + (System.currentTimeMillis() - lastTime));
            if (GLES20.glIsTexture(texId[0])) {
                GLES20.glDeleteTextures(1, texId, 0);
            }
            this.mGLCanvas.endBindFrameBuffer();
            return outData;
        }

        private Render fetchRender(int renderId) {
            RenderGroup renderCaches = this.mGLCanvas.getEffectRenderGroup();
            Render render = renderCaches.getRender(renderId);
            if (render != null) {
                return render;
            }
            this.mGLCanvas.prepareEffectRenders(false, renderId);
            return renderCaches.getRender(renderId);
        }

        private Render getEffectRender(int renderId) {
            PipeRender snapshotRender = new PipeRender(this.mGLCanvas);
            if (renderId != FilterInfo.FILTER_ID_NONE) {
                Render effectRender = fetchRender(renderId);
                if (effectRender != null) {
                    snapshotRender.addRender(effectRender);
                }
            }
            if (CameraSettings.isGradienterOn()) {
                Render gradienterRender = fetchRender(FilterInfo.FILTER_ID_GRADIENTER);
                if (gradienterRender != null) {
                    snapshotRender.addRender(gradienterRender);
                }
            } else if (CameraSettings.isTiltShiftOn()) {
                Render tiltShitRender = null;
                String mode = DataRepository.dataItemRunning().getComponentRunningTiltValue().getComponentValue(160);
                if (mode.equals(CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_circle))) {
                    tiltShitRender = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                } else if (mode.equals(CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_parallel))) {
                    tiltShitRender = fetchRender(FilterInfo.FILTER_ID_TILTSHIFT);
                }
                if (tiltShitRender != null) {
                    snapshotRender.addRender(tiltShitRender);
                }
            }
            if (snapshotRender.getRenderSize() == 0) {
                snapshotRender.addRender(fetchRender(renderId));
            }
            return snapshotRender;
        }

        private boolean drawMainJpeg(DrawJPEGAttribute jpeg, boolean save) {
            int downScale = 1;
            Size originSize = new Size(jpeg.mWidth, jpeg.mHeight);
            while (true) {
                if (jpeg.mWidth <= BaseGLCanvas.sMaxTextureSize && jpeg.mHeight <= BaseGLCanvas.sMaxTextureSize) {
                    break;
                }
                jpeg.mWidth /= 2;
                jpeg.mHeight /= 2;
                downScale *= 2;
            }
            Log.d(SnapshotEffectRender.TAG, "downScale: " + downScale + " " + jpeg.mWidth + " " + jpeg.mPreviewWidth);
            byte[] data = applyEffect(jpeg, downScale, false, null, originSize);
            Log.d(SnapshotEffectRender.TAG, "mainLen=" + (data == null ? "null" : Integer.valueOf(data.length)));
            if (data != null) {
                jpeg.mData = data;
            }
            if (save) {
                String title;
                synchronized (SnapshotEffectRender.this) {
                    title = (String) SnapshotEffectRender.this.mTitleMap.get(jpeg.mTitle);
                    SnapshotEffectRender.this.mTitleMap.remove(jpeg.mTitle);
                }
                String str;
                Object -get1;
                if (SnapshotEffectRender.this.mImageSaver != null) {
                    ImageSaver -get13 = SnapshotEffectRender.this.mImageSaver;
                    byte[] bArr = jpeg.mData;
                    boolean z = jpeg.mNeedThumbnail;
                    if (title == null) {
                        str = jpeg.mTitle;
                    } else {
                        str = title;
                    }
                    -get13.addImage(bArr, z, str, title == null ? null : jpeg.mTitle, jpeg.mDate, jpeg.mUri, jpeg.mLoc, jpeg.mWidth, jpeg.mHeight, jpeg.mExif, jpeg.mJpegOrientation, false, false, title == null ? jpeg.mFinalImage : false, false, false, jpeg.mAlgorithmName);
                } else if (jpeg.mUri == null) {
                    String str2;
                    -get1 = SnapshotEffectRender.this.mActivity;
                    if (title == null) {
                        str2 = jpeg.mTitle;
                    } else {
                        str2 = title;
                    }
                    Storage.addImage(-get1, str2, jpeg.mDate, jpeg.mLoc, jpeg.mJpegOrientation, jpeg.mData, jpeg.mWidth, jpeg.mHeight, false, jpeg.mAlgorithmName);
                } else {
                    String str3;
                    -get1 = SnapshotEffectRender.this.mActivity;
                    byte[] bArr2 = jpeg.mData;
                    ExifInterface exifInterface = jpeg.mExif;
                    Uri uri = jpeg.mUri;
                    if (title == null) {
                        str = jpeg.mTitle;
                    } else {
                        str = title;
                    }
                    Location location = jpeg.mLoc;
                    int i = jpeg.mJpegOrientation;
                    int i2 = jpeg.mWidth;
                    int i3 = jpeg.mHeight;
                    if (title == null) {
                        str3 = null;
                    } else {
                        str3 = jpeg.mTitle;
                    }
                    Storage.updateImage(-get1, bArr2, exifInterface, uri, str, location, i, i2, i3, str3);
                }
            } else if (jpeg.mExif != null) {
                OutputStream s = new ByteArrayOutputStream();
                try {
                    jpeg.mExif.writeExif(jpeg.mData, s);
                    byte[] outData = s.toByteArray();
                    if (outData != null) {
                        jpeg.mData = outData;
                    }
                    s.close();
                } catch (Throwable e) {
                    Log.e(SnapshotEffectRender.TAG, e.getMessage(), e);
                }
            }
            return true;
        }

        private boolean drawThumbJpeg(DrawJPEGAttribute jpeg, boolean save) {
            if (jpeg.mExif == null) {
                jpeg.mExif = Util.getExif(jpeg.mData);
                if (!TextUtils.isEmpty(jpeg.mAlgorithmName)) {
                    jpeg.mExif.addAlgorithmComment(jpeg.mAlgorithmName);
                }
            }
            Size size = new Size();
            byte[] data = applyEffect(jpeg, 1, true, size, null);
            Log.d(SnapshotEffectRender.TAG, "drawThumbJpeg: thumbLen=" + (data == null ? "null" : Integer.valueOf(data.length)));
            if (data != null) {
                jpeg.mExif.setCompressedThumbnail(data);
            }
            boolean appendExif = jpeg.mJpegOrientation != 0;
            if (save && jpeg.mExif.getThumbnailBytes() != null) {
                jpeg.mUri = Storage.addImage(SnapshotEffectRender.this.mActivity, jpeg.mTitle, jpeg.mDate, jpeg.mLoc, jpeg.mJpegOrientation, jpeg.mExif.getThumbnailBytes(), size.width, size.height, false, false, false, appendExif, false, jpeg.mAlgorithmName);
                if (jpeg.mUri != null) {
                    SnapshotEffectRender.this.mActivity.addSecureUri(jpeg.mUri);
                }
            }
            return true;
        }

        private void checkFrameBuffer(int w, int h) {
            if (this.mFrameBuffer == null || this.mFrameBuffer.getWidth() < w || this.mFrameBuffer.getHeight() < h) {
                this.mFrameBuffer = null;
                this.mFrameBuffer = new FrameBuffer(this.mGLCanvas, w, h, 0);
            }
        }

        private void release() {
            SnapshotEffectRender.this.mRelease = true;
            SnapshotEffectRender.this.mReleasePending = false;
            SnapshotEffectRender.this.mEgl.eglDestroySurface(SnapshotEffectRender.this.mEglDisplay, SnapshotEffectRender.this.mEglSurface);
            SnapshotEffectRender.this.mEgl.eglDestroyContext(SnapshotEffectRender.this.mEglDisplay, SnapshotEffectRender.this.mEglContext);
            SnapshotEffectRender.this.mEgl.eglMakeCurrent(SnapshotEffectRender.this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            SnapshotEffectRender.this.mEgl.eglTerminate(SnapshotEffectRender.this.mEglDisplay);
            SnapshotEffectRender.this.mEglSurface = null;
            SnapshotEffectRender.this.mEglContext = null;
            SnapshotEffectRender.this.mEglDisplay = null;
            SnapshotEffectRender.this.mActivity = null;
            this.mFrameBuffer = null;
            System.gc();
            this.mGLCanvas.recycledResources();
            SnapshotEffectRender.this.mEglThread.quit();
            this.mGLCanvas = null;
        }

        public void sendMessageSync(int msg) {
            SnapshotEffectRender.this.mEglThreadBlockVar.close();
            sendEmptyMessage(msg);
            SnapshotEffectRender.this.mEglThreadBlockVar.block();
        }
    }

    private class Size {
        public int height;
        public int width;

        Size(int width, int height) {
            this.width = width;
            this.height = height;
        }
    }

    public SnapshotEffectRender(ActivityBase activity, boolean isImageCaptureIntent) {
        this.mActivity = activity;
        this.mIsImageCaptureIntent = isImageCaptureIntent;
        this.mEglThread = new HandlerThread("SnapshotEffectProcessor");
        this.mEglThread.start();
        this.mEglHandler = new EGLHandler(this.mEglThread.getLooper());
        this.mEglHandler.sendMessageSync(0);
        this.mRelease = false;
        if (CameraSettings.isSupportedDualCameraWaterMark()) {
            Options options = new Options();
            options.inScaled = false;
            options.inPurgeable = true;
            options.inPremultiplied = false;
            this.mDualCameraWaterMark = BitmapFactory.decodeFile(getDualCameraWaterMarkFilePathVendor(), options);
            this.mDualCameraWaterMarkSizeRatio = getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, 0.0f);
            this.mDualCameraWaterMarkPaddingXRatio = getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, 0.0f);
            this.mDualCameraWaterMarkPaddingYRatio = getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, 0.0f);
        }
    }

    public static final String getDualCameraWaterMarkFilePathVendor() {
        if (Device.IS_E10) {
            if ("india".equalsIgnoreCase(SystemProperties.get("ro.boot.hwc"))) {
                return "/vendor/etc/camera/dualcamera_india.png";
            }
        }
        return "/vendor/etc/camera/dualcamera.png";
    }

    public float getResourceFloat(int resId, float defaultValue) {
        TypedValue value = new TypedValue();
        try {
            this.mActivity.getResources().getValue(resId, value, true);
            return value.getFloat();
        } catch (Exception e) {
            Log.e(TAG, "Missing resource " + Integer.toHexString(resId));
            return defaultValue;
        }
    }

    public void setImageSaver(ImageSaver imageSaver) {
        this.mImageSaver = imageSaver;
    }

    public void setQuality(int quality) {
        if (quality >= 0 && quality <= 97) {
            this.mQuality = quality;
        }
    }

    public boolean processorJpegAsync(DrawJPEGAttribute jpeg) {
        Log.d(TAG, "queueSize=" + this.mJpegQueueSize);
        if (this.mJpegQueueSize >= 7) {
            Log.d(TAG, "queueSize is full, drop it " + jpeg.mTitle);
            return false;
        }
        boolean sync = this.mJpegQueueSize == 0;
        boolean isThumbnailProsessDone = false;
        if (sync) {
            isThumbnailProsessDone = processorThumSync(jpeg);
        } else {
            processorThumAsync(jpeg);
        }
        if (!this.mIsImageCaptureIntent && sync && this.mExifNeeded && isThumbnailProsessDone) {
            if (jpeg.mNeedThumbnail) {
                Bitmap bitmap = jpeg.mExif.getThumbnailBitmap();
                if (!(bitmap == null || jpeg.mUri == null)) {
                    jpeg.mFinalImage = false;
                    this.mActivity.getThumbnailUpdater().setThumbnail(Thumbnail.createThumbnail(jpeg.mUri, bitmap, jpeg.mJpegOrientation, false), true, true);
                }
            } else {
                this.mActivity.getThumbnailUpdater().updatePreviewThumbnailUri(jpeg.mUri);
            }
        }
        synchronized (this.mLock) {
            this.mJpegQueueSize++;
        }
        this.mEglHandler.obtainMessage(1, jpeg).sendToTarget();
        return true;
    }

    public void processorJpegSync(DrawJPEGAttribute jpeg) {
        int i;
        this.mEglThreadBlockVar.close();
        EGLHandler eGLHandler = this.mEglHandler;
        if (this.mExifNeeded) {
            i = 1;
        } else {
            i = 0;
        }
        eGLHandler.obtainMessage(2, i, 0, jpeg).sendToTarget();
        this.mEglThreadBlockVar.block();
    }

    private void processorThumAsync(DrawJPEGAttribute jpeg) {
        if (this.mExifNeeded) {
            this.mEglHandler.obtainMessage(3, jpeg).sendToTarget();
        } else {
            jpeg.mUri = Storage.newImage(this.mActivity, jpeg.mTitle, jpeg.mDate, jpeg.mJpegOrientation, jpeg.mPreviewWidth, jpeg.mPreviewHeight);
        }
    }

    private boolean processorThumSync(DrawJPEGAttribute jpeg) {
        if (this.mExifNeeded) {
            jpeg.mExif = Util.getExif(jpeg.mData);
            if (!TextUtils.isEmpty(jpeg.mAlgorithmName)) {
                jpeg.mExif.addAlgorithmComment(jpeg.mAlgorithmName);
            }
            if (jpeg.mExif.getThumbnailBytes() != null) {
                this.mEglThreadBlockVar.close();
                this.mEglHandler.obtainMessage(4, jpeg).sendToTarget();
                this.mEglThreadBlockVar.block();
                return true;
            }
        }
        jpeg.mUri = Storage.newImage(this.mActivity, jpeg.mTitle, jpeg.mDate, jpeg.mJpegOrientation, jpeg.mPreviewWidth, jpeg.mPreviewHeight);
        return false;
    }

    public void release() {
        if (this.mEglHandler.hasMessages(1)) {
            this.mReleasePending = true;
        } else {
            this.mEglHandler.sendEmptyMessage(5);
        }
    }

    private static EGLConfig chooseConfig(EGL10 egl, EGLDisplay display) {
        int[] numConfig = new int[1];
        if (egl.eglChooseConfig(display, CONFIG_SPEC, null, 0, numConfig)) {
            int numConfigs = numConfig[0];
            if (numConfigs <= 0) {
                throw new IllegalArgumentException("No configs match configSpec");
            }
            EGLConfig[] configs = new EGLConfig[numConfigs];
            if (egl.eglChooseConfig(display, CONFIG_SPEC, configs, numConfigs, numConfig)) {
                return configs[0];
            }
            throw new IllegalArgumentException("eglChooseConfig#2 failed");
        }
        throw new IllegalArgumentException("eglChooseConfig failed");
    }

    public void prepareEffectRender(int effect) {
        this.mEglHandler.obtainMessage(6, effect, 0).sendToTarget();
    }
}
