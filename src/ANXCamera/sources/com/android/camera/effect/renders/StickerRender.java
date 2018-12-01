package com.android.camera.effect.renders;

import android.opengl.GLES20;
import android.text.TextUtils;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.renders.Render.FrameBufferCallback;
import com.android.camera.log.Log;
import com.android.camera.sticker.StickerHelper;
import com.android.camera.sticker.beautyprocessor.StickerBeautyProcessor;
import com.android.camera.sticker.glutils.GlUtil;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import com.sensetime.stmobile.STBeautifyNative;
import com.sensetime.stmobile.STHumanAction;
import com.sensetime.stmobile.STMobileHumanActionNative;
import com.sensetime.stmobile.STMobileStickerNative;
import com.sensetime.stmobile.model.STMobile106;
import java.nio.ByteBuffer;

public class StickerRender extends PixelEffectRender {
    private static final String TAG = StickerRender.class.getSimpleName();
    private int[] mBeautifyTextureId;
    private String mCurrentSticker;
    private int mFrameBufferHeight;
    private int mFrameBufferId;
    private int mFrameBufferWidth;
    private Object mHumanActionHandleLock = new Object();
    private boolean mHumanActionInitDone;
    private IntelligentBeautyProcessor mMakeupProcessor;
    private boolean mNeedBeautify = true;
    private ByteBuffer mRGBABuffer;
    private STMobileHumanActionNative mSTHumanActionNative = new STMobileHumanActionNative();
    private STBeautifyNative mStBeautifyNative = new STBeautifyNative();
    private STMobileStickerNative mStStickerNative = new STMobileStickerNative();
    private int[] mTextureOutId;

    public StickerRender(GLCanvas canvas, int id, String sticker) {
        super(canvas, id);
        this.mCurrentSticker = sticker;
        onInit();
    }

    public String getFragShaderString() {
        return "uniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() \n{ \n    gl_FragColor = texture2D(sTexture, vTexCoord); \n}";
    }

    protected void finalize() throws Throwable {
        onDestroy();
        super.finalize();
    }

    protected void drawTexture(BasicTexture texture, float x, float y, float w, float h, boolean isSnapShot) {
        if (texture.onBind(this.mGLCanvas)) {
            super.drawTexture(processTexture(texture.getId(), this.mFrameBufferId, this.mFrameBufferWidth, this.mFrameBufferHeight), x, y, w, h, isSnapShot);
            return;
        }
        Log.e(TAG, "drawTexture: fail to bind texture " + texture.getId());
    }

    protected void drawTexture(int textureId, float x, float y, float w, float h, boolean isSnapShot) {
        super.drawTexture(processTexture(textureId, this.mFrameBufferId, this.mFrameBufferWidth, this.mFrameBufferHeight), x, y, w, h, isSnapShot);
    }

    private int processTexture(int textureId, int bufferId, int inputWidth, int inputHeight) {
        if (this.mBeautifyTextureId == null) {
            this.mBeautifyTextureId = new int[1];
            GlUtil.initEffectTexture(inputWidth, inputHeight, this.mBeautifyTextureId, 3553);
        }
        if (this.mTextureOutId == null) {
            this.mTextureOutId = new int[1];
            GlUtil.initEffectTexture(inputWidth, inputHeight, this.mTextureOutId, 3553);
        }
        GLES20.glBindFramebuffer(36160, bufferId);
        GlUtil.checkGlError("glBindFramebuffer");
        GLES20.glReadPixels(0, 0, inputWidth, inputHeight, 6408, 5121, getRGBABuffer(inputWidth, inputHeight));
        GLES20.glBindFramebuffer(36160, this.mParentFrameBufferId);
        int result = -1;
        if (this.mNeedBeautify || (hasSticker() && this.mRGBABuffer != null)) {
            STMobile106[] arrayFaces = null;
            STMobile106[] arrayOutFaces = null;
            int orientation = getRotateType();
            STHumanAction humanAction = this.mSTHumanActionNative.humanActionDetect(this.mRGBABuffer.array(), 6, STMobileHumanActionNative.ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_DETECT, orientation, inputWidth, inputHeight);
            if (this.mNeedBeautify) {
                if (humanAction != null) {
                    arrayFaces = humanAction.getMobileFaces();
                    if (arrayFaces != null && arrayFaces.length > 0) {
                        arrayOutFaces = new STMobile106[arrayFaces.length];
                    }
                }
                if (this.mStBeautifyNative.processTexture(textureId, inputWidth, inputHeight, arrayFaces, this.mBeautifyTextureId[0], arrayOutFaces) == 0) {
                    textureId = this.mBeautifyTextureId[0];
                }
                if (!(arrayOutFaces == null || arrayOutFaces.length == 0 || humanAction == null)) {
                    humanAction.replaceMobile106(arrayOutFaces);
                }
            }
            FrameBufferCallback callback = getFrameBufferCallback();
            if (callback != null) {
                ByteBuffer outBuf = ByteBuffer.allocate((inputWidth * inputHeight) * 4);
                result = this.mStStickerNative.processTextureAndOutputBuffer(textureId, humanAction, orientation, inputWidth, inputHeight, false, this.mTextureOutId[0], 6, outBuf.array());
                if (result == 0) {
                    callback.onFrameBuffer(outBuf, inputWidth, inputHeight);
                }
            } else {
                result = this.mStStickerNative.processTexture(textureId, humanAction, orientation, inputWidth, inputHeight, false, this.mTextureOutId[0]);
            }
        }
        if (result == 0) {
            return this.mTextureOutId[0];
        }
        Log.e(TAG, "processTexture: result=" + result + " outTexId=" + this.mTextureOutId[0]);
        return textureId;
    }

    public void setPreviousFrameBufferInfo(int bufId, int w, int h) {
        this.mFrameBufferId = bufId;
        if (this.mFrameBufferWidth != w || this.mFrameBufferHeight != h) {
            this.mFrameBufferWidth = w;
            this.mFrameBufferHeight = h;
            destroyGLResource();
        }
    }

    public void setSticker(String newSticker) {
        Log.d(TAG, "setSticker: " + newSticker);
        if (!TextUtils.equals(newSticker, this.mCurrentSticker)) {
            this.mStStickerNative.changeSticker(newSticker);
        }
        this.mCurrentSticker = newSticker;
    }

    private boolean hasSticker() {
        return this.mCurrentSticker.isEmpty() ^ 1;
    }

    private int getRotateType() {
        switch (EffectController.getInstance().getOrientation()) {
            case 90:
                return 1;
            case 180:
                return 2;
            case 270:
                return 3;
            default:
                return 0;
        }
    }

    private ByteBuffer getRGBABuffer(int width, int height) {
        if (this.mRGBABuffer == null) {
            this.mRGBABuffer = ByteBuffer.allocate((width * height) * 4);
        }
        this.mRGBABuffer.rewind();
        return this.mRGBABuffer;
    }

    private void initHumanAction() {
        new Thread(new Runnable() {
            public void run() {
                synchronized (StickerRender.this.mHumanActionHandleLock) {
                    int result = StickerRender.this.mSTHumanActionNative.createInstance(StickerHelper.getInstance().getTrackModelPath(), STMobileHumanActionNative.ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_VIDEO);
                    if (result == 0) {
                        StickerRender.this.mSTHumanActionNative.setParam(2, 0.35f);
                    }
                    StickerRender.this.mHumanActionInitDone = true;
                    StickerRender.this.mHumanActionHandleLock.notify();
                    Log.d(StickerRender.TAG, "initHumanAction: result=" + result);
                }
            }
        }).start();
    }

    private void initSticker() {
        Log.d(TAG, "initSticker: result=" + this.mStStickerNative.createInstance(this.mCurrentSticker));
    }

    private void initBeauty() {
        int result = this.mStBeautifyNative.createInstance(this.mPreviewWidth, this.mPreviewHeight);
        this.mMakeupProcessor = new StickerBeautyProcessor(this.mStBeautifyNative);
        Log.d(TAG, "initBeautify: result=" + result);
        if (result == 0) {
            this.mStBeautifyNative.setParam(1, 0.36f);
            this.mStBeautifyNative.setParam(3, 0.74f);
            this.mStBeautifyNative.setParam(4, 0.02f);
            this.mStBeautifyNative.setParam(5, 0.13f);
            this.mStBeautifyNative.setParam(6, 0.11f);
            this.mStBeautifyNative.setParam(7, 0.1f);
        }
    }

    private void onInit() {
        initHumanAction();
        initBeauty();
        initSticker();
        synchronized (this.mHumanActionHandleLock) {
            while (!this.mHumanActionInitDone) {
                try {
                    this.mHumanActionHandleLock.wait();
                } catch (InterruptedException e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
        return;
    }

    private void destroyGLResource() {
        this.mRGBABuffer = null;
        if (this.mBeautifyTextureId != null) {
            GLES20.glDeleteTextures(1, this.mBeautifyTextureId, 0);
            this.mBeautifyTextureId = null;
        }
        if (this.mTextureOutId != null) {
            GLES20.glDeleteTextures(1, this.mTextureOutId, 0);
            this.mTextureOutId = null;
        }
    }

    private void onDestroy() {
        this.mSTHumanActionNative.destroyInstance();
        this.mStStickerNative.destroyInstance();
        this.mStBeautifyNative.destroyBeautify();
        destroyGLResource();
    }

    public IntelligentBeautyProcessor getMakeupProcessor() {
        return this.mMakeupProcessor;
    }
}
