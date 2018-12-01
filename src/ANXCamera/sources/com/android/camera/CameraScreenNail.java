package com.android.camera;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.opengl.GLES20;
import android.opengl.Matrix;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawBlurTexAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BitmapTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

public class CameraScreenNail extends SurfaceTextureScreenNail {
    private static final String TAG = CameraScreenNail.class.getSimpleName();
    private int mAnimState = 0;
    private CaptureAnimManager mCaptureAnimManager = new CaptureAnimManager();
    private boolean mDisableSwitchAnimationOnce;
    private boolean mFirstFrameArrived;
    private AtomicBoolean mFrameAvailableNotified = new AtomicBoolean(false);
    private int mFrameNumber = 0;
    private Object mLock = new Object();
    private SwitchAnimManager mModuleAnimManager = new SwitchAnimManager();
    private NailListener mNailListener;
    private List<RequestRenderListener> mRequestRenderListeners;
    private SwitchAnimManager mSwitchAnimManager = new SwitchAnimManager();
    private final float[] mTextureTransformMatrix = new float[16];
    private boolean mVisible;

    public interface NailListener {
        boolean isKeptBitmapTexture();

        void onFrameAvailable(int i);

        void onPreviewPixelsRead(byte[] bArr, int i, int i2);

        void onPreviewTextureCopied();
    }

    public interface RequestRenderListener {
        void requestRender();
    }

    public CameraScreenNail(NailListener nailListener, RequestRenderListener requestRenderListener) {
        this.mNailListener = nailListener;
        this.mRequestRenderListeners = new ArrayList();
        addRequestListener(requestRenderListener);
    }

    public void addRequestListener(RequestRenderListener requestRenderListener) {
        synchronized (this.mLock) {
            this.mRequestRenderListeners.add(requestRenderListener);
        }
    }

    private void postRequestListener() {
        for (RequestRenderListener listener : this.mRequestRenderListeners) {
            listener.requestRender();
        }
    }

    public void acquireSurfaceTexture() {
        Log.v(TAG, "acquireSurfaceTexture");
        synchronized (this.mLock) {
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mDisableSwitchAnimationOnce = false;
            super.acquireSurfaceTexture();
        }
    }

    public void releaseSurfaceTexture() {
        synchronized (this.mLock) {
            super.releaseSurfaceTexture();
            this.mAnimState = 0;
            Log.v(TAG, "release: state=NONE");
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
            this.mModuleSwitching = false;
        }
    }

    public void animateModuleCopyTexture() {
        synchronized (this.mLock) {
            if (this.mAnimTexture == null || (this.mFrameAvailableNotified.get() ^ 1) == 0) {
                this.mAnimState = 31;
                postRequestListener();
                Log.v(TAG, "state=MODULE_COPY_TEXTURE");
                return;
            }
        }
    }

    public void clearAnimation() {
        if (this.mAnimState != 0) {
            this.mAnimState = 0;
            this.mSwitchAnimManager.clearAnimation();
            this.mCaptureAnimManager.clearAnimation();
            this.mModuleAnimManager.clearAnimation();
        }
    }

    public void animateCapture(int animOrientation) {
        synchronized (this.mLock) {
            Log.v(TAG, "animateCapture: state=" + this.mAnimState);
            if (this.mAnimState == 0) {
                this.mCaptureAnimManager.animateHoldAndSlide();
                postRequestListener();
                this.mAnimState = 11;
            }
        }
    }

    public void requestHibernate() {
        synchronized (this.mLock) {
            if (this.mAnimState == 0) {
                this.mAnimState = 14;
                postRequestListener();
            }
        }
    }

    public void requestAwaken() {
        synchronized (this.mLock) {
            if (this.mAnimState == 14) {
                this.mAnimState = 0;
                this.mFirstFrameArrived = false;
                this.mFrameNumber = 0;
            }
        }
    }

    public void requestReadPixels() {
        synchronized (this.mLock) {
            if (this.mAnimState == 0) {
                this.mAnimState = 13;
                postRequestListener();
            }
        }
    }

    public boolean isAnimationRunning() {
        return this.mAnimState != 0;
    }

    /* JADX WARNING: Missing block: B:29:0x008a, code:
            return;
     */
    /* JADX WARNING: Missing block: B:45:0x00d0, code:
            return;
     */
    public void draw(com.android.gallery3d.ui.GLCanvas r25, int r26, int r27, int r28, int r29) {
        /*
        r24 = this;
        r0 = r24;
        r0 = r0.mLock;
        r23 = r0;
        monitor-enter(r23);
        r0 = r24;
        r4 = r0.mVisible;	 Catch:{ all -> 0x00d5 }
        if (r4 != 0) goto L_0x0012;
    L_0x000d:
        r4 = 1;
        r0 = r24;
        r0.mVisible = r4;	 Catch:{ all -> 0x00d5 }
    L_0x0012:
        r0 = r24;
        r4 = r0.mBitmapTexture;	 Catch:{ all -> 0x00d5 }
        if (r4 == 0) goto L_0x0048;
    L_0x0018:
        r6 = r26;
        r7 = r27;
        r4 = com.android.camera.module.ModuleManager.isSquareModule();	 Catch:{ all -> 0x00d5 }
        if (r4 == 0) goto L_0x0030;
    L_0x0022:
        r0 = r28;
        r1 = r29;
        if (r0 <= r1) goto L_0x003f;
    L_0x0028:
        r4 = r28 - r29;
        r4 = r4 / 2;
        r6 = r26 + r4;
        r28 = r29;
    L_0x0030:
        r0 = r24;
        r4 = r0.mBitmapTexture;	 Catch:{ all -> 0x00d5 }
        r5 = r25;
        r8 = r28;
        r9 = r29;
        r4.draw(r5, r6, r7, r8, r9);	 Catch:{ all -> 0x00d5 }
        monitor-exit(r23);
        return;
    L_0x003f:
        r4 = r29 - r28;
        r4 = r4 / 2;
        r7 = r27 + r4;
        r29 = r28;
        goto L_0x0030;
    L_0x0048:
        r20 = r24.getSurfaceTexture();	 Catch:{ all -> 0x00d5 }
        if (r20 == 0) goto L_0x005a;
    L_0x004e:
        r0 = r24;
        r4 = r0.mFirstFrameArrived;	 Catch:{ all -> 0x00d5 }
        if (r4 != 0) goto L_0x008b;
    L_0x0054:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        if (r4 != 0) goto L_0x008b;
    L_0x005a:
        r4 = TAG;	 Catch:{ all -> 0x00d5 }
        r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x00d5 }
        r5.<init>();	 Catch:{ all -> 0x00d5 }
        r8 = "draw: firstFrame=";
        r5 = r5.append(r8);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r8 = r0.mFirstFrameArrived;	 Catch:{ all -> 0x00d5 }
        r5 = r5.append(r8);	 Catch:{ all -> 0x00d5 }
        r8 = " surface=";
        r5 = r5.append(r8);	 Catch:{ all -> 0x00d5 }
        r0 = r20;
        r5 = r5.append(r0);	 Catch:{ all -> 0x00d5 }
        r5 = r5.toString();	 Catch:{ all -> 0x00d5 }
        com.android.camera.log.Log.w(r4, r5);	 Catch:{ all -> 0x00d5 }
        if (r20 == 0) goto L_0x0089;
    L_0x0086:
        r20.updateTexImage();	 Catch:{ all -> 0x00d5 }
    L_0x0089:
        monitor-exit(r23);
        return;
    L_0x008b:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        switch(r4) {
            case 0: goto L_0x00d1;
            case 11: goto L_0x0173;
            case 13: goto L_0x00d8;
            case 14: goto L_0x011e;
            case 21: goto L_0x0126;
            case 22: goto L_0x0159;
            case 31: goto L_0x01a4;
            default: goto L_0x0092;
        };	 Catch:{ all -> 0x00d5 }
    L_0x0092:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 23;
        if (r4 == r5) goto L_0x00a2;
    L_0x009a:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 24;
        if (r4 != r5) goto L_0x01dc;
    L_0x00a2:
        r20.updateTexImage();	 Catch:{ all -> 0x00d5 }
        r16 = 0;
        r0 = r24;
        r4 = r0.mDisableSwitchAnimationOnce;	 Catch:{ all -> 0x00d5 }
        if (r4 == 0) goto L_0x0201;
    L_0x00ad:
        r0 = r24;
        r8 = r0.mSwitchAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r14 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r9 = r25;
        r10 = r26;
        r11 = r27;
        r12 = r28;
        r13 = r29;
        r8.drawPreview(r9, r10, r11, r12, r13, r14);	 Catch:{ all -> 0x00d5 }
    L_0x00c2:
        if (r16 != 0) goto L_0x00cc;
    L_0x00c4:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 25;
        if (r4 == r5) goto L_0x021b;
    L_0x00cc:
        r24.postRequestListener();	 Catch:{ all -> 0x00d5 }
    L_0x00cf:
        monitor-exit(r23);
        return;
    L_0x00d1:
        super.draw(r25, r26, r27, r28, r29);	 Catch:{ all -> 0x00d5 }
        goto L_0x0092;
    L_0x00d5:
        r4 = move-exception;
        monitor-exit(r23);
        throw r4;
    L_0x00d8:
        super.draw(r25, r26, r27, r28, r29);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r22 = r4.getWidth();	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r21 = r4.getHeight();	 Catch:{ all -> 0x00d5 }
        r4 = r28 * r21;
        r5 = r29 * r22;
        if (r4 <= r5) goto L_0x0117;
    L_0x00f1:
        r19 = r22;
        r4 = r29 * r22;
        r18 = r4 / r28;
    L_0x00f7:
        r0 = r24;
        r1 = r25;
        r2 = r19;
        r3 = r18;
        r17 = r0.readPreviewPixels(r1, r2, r3);	 Catch:{ all -> 0x00d5 }
        r4 = 0;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mNailListener;	 Catch:{ all -> 0x00d5 }
        r0 = r17;
        r1 = r19;
        r2 = r18;
        r4.onPreviewPixelsRead(r0, r1, r2);	 Catch:{ all -> 0x00d5 }
        goto L_0x0092;
    L_0x0117:
        r4 = r28 * r21;
        r19 = r4 / r29;
        r18 = r21;
        goto L_0x00f7;
    L_0x011e:
        r20.updateTexImage();	 Catch:{ all -> 0x00d5 }
        r25.clearBuffer();	 Catch:{ all -> 0x00d5 }
        goto L_0x0092;
    L_0x0126:
        r0 = r24;
        r4 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r5 = r0.mFrameBuffer;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r1 = r25;
        r0.copyPreviewTexture(r1, r4, r5);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mSwitchAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r26;
        r1 = r27;
        r2 = r28;
        r3 = r29;
        r4.setReviewDrawingSize(r0, r1, r2, r3);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mNailListener;	 Catch:{ all -> 0x00d5 }
        r4.onPreviewTextureCopied();	 Catch:{ all -> 0x00d5 }
        r4 = 22;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        r4 = TAG;	 Catch:{ all -> 0x00d5 }
        r5 = "draw: state=SWITCH_DRAW_PREVIEW";
        com.android.camera.log.Log.v(r4, r5);	 Catch:{ all -> 0x00d5 }
    L_0x0159:
        r20.updateTexImage();	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r8 = r0.mSwitchAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r14 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r9 = r25;
        r10 = r26;
        r11 = r27;
        r12 = r28;
        r13 = r29;
        r8.drawPreview(r9, r10, r11, r12, r13, r14);	 Catch:{ all -> 0x00d5 }
        goto L_0x0092;
    L_0x0173:
        super.draw(r25, r26, r27, r28, r29);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mCaptureAnimTexture;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r5 = r0.mCaptureAnimFrameBuffer;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r1 = r25;
        r0.copyPreviewTexture(r1, r4, r5);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mCaptureAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r26;
        r1 = r27;
        r2 = r28;
        r3 = r29;
        r4.startAnimation(r0, r1, r2, r3);	 Catch:{ all -> 0x00d5 }
        r4 = 12;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        r4 = TAG;	 Catch:{ all -> 0x00d5 }
        r5 = "draw: state=CAPTURE_RUNNING";
        com.android.camera.log.Log.v(r4, r5);	 Catch:{ all -> 0x00d5 }
        goto L_0x0092;
    L_0x01a4:
        r0 = r24;
        r4 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r5 = r0.mFrameBuffer;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r1 = r25;
        r0.copyPreviewTexture(r1, r4, r5);	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mModuleAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r26;
        r1 = r27;
        r2 = r28;
        r3 = r29;
        r4.setReviewDrawingSize(r0, r1, r2, r3);	 Catch:{ all -> 0x00d5 }
        r4 = TAG;	 Catch:{ all -> 0x00d5 }
        r5 = "draw: state=MODULE_DRAW_PREVIEW";
        com.android.camera.log.Log.v(r4, r5);	 Catch:{ all -> 0x00d5 }
        r4 = 33;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r4 = r0.mModuleAnimManager;	 Catch:{ all -> 0x00d5 }
        r4.startAnimation();	 Catch:{ all -> 0x00d5 }
        r24.postRequestListener();	 Catch:{ all -> 0x00d5 }
        goto L_0x0092;
    L_0x01dc:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 25;
        if (r4 == r5) goto L_0x00a2;
    L_0x01e4:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 12;
        if (r4 != r5) goto L_0x0234;
    L_0x01ec:
        r0 = r24;
        r4 = r0.mCaptureAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r5 = r0.mCaptureAnimTexture;	 Catch:{ all -> 0x00d5 }
        r0 = r25;
        r16 = r4.drawAnimation(r0, r5);	 Catch:{ all -> 0x00d5 }
        if (r16 == 0) goto L_0x022a;
    L_0x01fc:
        r24.postRequestListener();	 Catch:{ all -> 0x00d5 }
        goto L_0x00cf;
    L_0x0201:
        r0 = r24;
        r8 = r0.mSwitchAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r15 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r9 = r25;
        r10 = r26;
        r11 = r27;
        r12 = r28;
        r13 = r29;
        r14 = r24;
        r16 = r8.drawAnimation(r9, r10, r11, r12, r13, r14, r15);	 Catch:{ all -> 0x00d5 }
        goto L_0x00c2;
    L_0x021b:
        r4 = 0;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        r4 = 0;
        r0 = r24;
        r0.mDisableSwitchAnimationOnce = r4;	 Catch:{ all -> 0x00d5 }
        super.draw(r25, r26, r27, r28, r29);	 Catch:{ all -> 0x00d5 }
        goto L_0x00cf;
    L_0x022a:
        r4 = 0;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        super.draw(r25, r26, r27, r28, r29);	 Catch:{ all -> 0x00d5 }
        goto L_0x00cf;
    L_0x0234:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 33;
        if (r4 == r5) goto L_0x0244;
    L_0x023c:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 34;
        if (r4 != r5) goto L_0x026e;
    L_0x0244:
        r20.updateTexImage();	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r8 = r0.mModuleAnimManager;	 Catch:{ all -> 0x00d5 }
        r0 = r24;
        r15 = r0.mAnimTexture;	 Catch:{ all -> 0x00d5 }
        r9 = r25;
        r10 = r26;
        r11 = r27;
        r12 = r28;
        r13 = r29;
        r14 = r24;
        r16 = r8.drawAnimation(r9, r10, r11, r12, r13, r14, r15);	 Catch:{ all -> 0x00d5 }
        if (r16 != 0) goto L_0x0269;
    L_0x0261:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 35;
        if (r4 == r5) goto L_0x0277;
    L_0x0269:
        r24.postRequestListener();	 Catch:{ all -> 0x00d5 }
        goto L_0x00cf;
    L_0x026e:
        r0 = r24;
        r4 = r0.mAnimState;	 Catch:{ all -> 0x00d5 }
        r5 = 35;
        if (r4 != r5) goto L_0x00cf;
    L_0x0276:
        goto L_0x0244;
    L_0x0277:
        r4 = 0;
        r0 = r24;
        r0.mAnimState = r4;	 Catch:{ all -> 0x00d5 }
        super.draw(r25, r26, r27, r28, r29);	 Catch:{ all -> 0x00d5 }
        goto L_0x00cf;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.CameraScreenNail.draw(com.android.gallery3d.ui.GLCanvas, int, int, int, int):void");
    }

    private byte[] readPreviewPixels(GLCanvas canvas, int width, int height) {
        ByteBuffer buffer = ByteBuffer.allocate((width * height) * 4);
        getSurfaceTexture().getTransformMatrix(this.mTextureTransformMatrix);
        updateTransformMatrix(this.mTextureTransformMatrix);
        if (this.mFrameBuffer == null) {
            this.mFrameBuffer = new FrameBuffer(canvas, this.mAnimTexture, 0);
        }
        canvas.beginBindFrameBuffer(this.mFrameBuffer);
        canvas.draw(new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, width, height));
        GLES20.glReadPixels(0, 0, width, height, 6408, 5121, buffer);
        canvas.endBindFrameBuffer();
        return buffer.array();
    }

    private void copyPreviewTexture(GLCanvas canvas, RawTexture texture, FrameBuffer frameBuffer) {
        int width = texture.getWidth();
        int height = texture.getHeight();
        getSurfaceTexture().getTransformMatrix(this.mTextureTransformMatrix);
        updateTransformMatrix(this.mTextureTransformMatrix);
        if (frameBuffer == null) {
            frameBuffer = new FrameBuffer(canvas, texture, 0);
        }
        canvas.beginBindFrameBuffer(frameBuffer);
        canvas.draw(new DrawExtTexAttribute(this.mExtTexture, this.mTextureTransformMatrix, 0, 0, width, height));
        canvas.endBindFrameBuffer();
    }

    public void drawBlurTexture(GLCanvas canvas, int x, int y, int width, int height) {
        canvas.draw(new DrawBasicTexAttribute(this.mAnimTexture, x, y, width, height));
    }

    public void renderBlurTexture(GLCanvas canvas) {
        renderBlurTexture(canvas, this.mAnimTexture);
    }

    private void renderBlurTexture(GLCanvas canvas, RawTexture texture) {
        int width = texture.getWidth();
        int height = texture.getHeight();
        if (this.mFrameBuffer == null) {
            this.mFrameBuffer = new FrameBuffer(canvas, texture, 0);
        }
        canvas.prepareBlurRenders();
        canvas.beginBindFrameBuffer(this.mFrameBuffer);
        canvas.draw(new DrawBlurTexAttribute(texture, 0, 0, width, height));
        canvas.endBindFrameBuffer();
    }

    public void renderBitmapToCanvas(Bitmap bitmap) {
        this.mVisible = false;
        this.mBitmapTexture = new BitmapTexture(bitmap);
        postRequestListener();
    }

    public void releaseBitmapIfNeeded() {
        if (this.mBitmapTexture != null && (this.mNailListener.isKeptBitmapTexture() ^ 1) != 0) {
            this.mBitmapTexture = null;
            postRequestListener();
        }
    }

    /* JADX WARNING: Missing block: B:23:0x0067, code:
            return;
     */
    public void onFrameAvailable(android.graphics.SurfaceTexture r4) {
        /*
        r3 = this;
        r0 = r3.getSurfaceTexture();
        if (r0 == r4) goto L_0x000f;
    L_0x0006:
        r0 = TAG;
        r1 = "onFrameAvailable: surface changed";
        com.android.camera.log.Log.e(r0, r1);
        return;
    L_0x000f:
        r1 = r3.mLock;
        monitor-enter(r1);
        r0 = r3.mFirstFrameArrived;	 Catch:{ all -> 0x0080 }
        if (r0 != 0) goto L_0x0041;
    L_0x0016:
        r0 = TAG;	 Catch:{ all -> 0x0080 }
        r2 = "onFrameAvailable first frame arrived.";
        com.android.camera.log.Log.d(r0, r2);	 Catch:{ all -> 0x0080 }
        r0 = r3.mFrameNumber;	 Catch:{ all -> 0x0080 }
        r2 = com.android.camera.CameraSettings.getSkipFrameNumber();	 Catch:{ all -> 0x0080 }
        if (r0 >= r2) goto L_0x0031;
    L_0x0026:
        r0 = r3.mFrameNumber;	 Catch:{ all -> 0x0080 }
        r0 = r0 + 1;
        r3.mFrameNumber = r0;	 Catch:{ all -> 0x0080 }
        r3.postRequestListener();	 Catch:{ all -> 0x0080 }
        monitor-exit(r1);
        return;
    L_0x0031:
        com.android.camera.statistic.ScenarioTrackUtil.trackAppLunchTimeEnd();	 Catch:{ all -> 0x0080 }
        com.android.camera.statistic.ScenarioTrackUtil.trackSwitchCameraEnd();	 Catch:{ all -> 0x0080 }
        com.android.camera.statistic.ScenarioTrackUtil.trackSwitchModeEnd();	 Catch:{ all -> 0x0080 }
        r0 = 1;
        r3.notifyFrameAvailable(r0);	 Catch:{ all -> 0x0080 }
        r0 = 1;
        r3.mVisible = r0;	 Catch:{ all -> 0x0080 }
    L_0x0041:
        r0 = 1;
        r3.mFirstFrameArrived = r0;	 Catch:{ all -> 0x0080 }
        r0 = r3.mVisible;	 Catch:{ all -> 0x0080 }
        if (r0 == 0) goto L_0x0066;
    L_0x0048:
        r0 = r3.mAnimState;	 Catch:{ all -> 0x0080 }
        r2 = 24;
        if (r0 != r2) goto L_0x0068;
    L_0x004e:
        r0 = 25;
        r3.mAnimState = r0;	 Catch:{ all -> 0x0080 }
        r0 = TAG;	 Catch:{ all -> 0x0080 }
        r2 = "SWITCH_WAITING_FIRST_FRAME->SWITCH_RESUME";
        com.android.camera.log.Log.v(r0, r2);	 Catch:{ all -> 0x0080 }
        r0 = r3.mSwitchAnimManager;	 Catch:{ all -> 0x0080 }
        r0.startResume();	 Catch:{ all -> 0x0080 }
    L_0x005f:
        r3.postRequestListener();	 Catch:{ all -> 0x0080 }
        r0 = 4;
        r3.notifyFrameAvailable(r0);	 Catch:{ all -> 0x0080 }
    L_0x0066:
        monitor-exit(r1);
        return;
    L_0x0068:
        r0 = r3.mAnimState;	 Catch:{ all -> 0x0080 }
        r2 = 34;
        if (r0 != r2) goto L_0x005f;
    L_0x006e:
        r0 = 35;
        r3.mAnimState = r0;	 Catch:{ all -> 0x0080 }
        r0 = TAG;	 Catch:{ all -> 0x0080 }
        r2 = "MODULE_WAITING_FIRST_FRAME->MODULE_RESUME";
        com.android.camera.log.Log.v(r0, r2);	 Catch:{ all -> 0x0080 }
        r0 = r3.mModuleAnimManager;	 Catch:{ all -> 0x0080 }
        r0.startResume();	 Catch:{ all -> 0x0080 }
        goto L_0x005f;
    L_0x0080:
        r0 = move-exception;
        monitor-exit(r1);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.CameraScreenNail.onFrameAvailable(android.graphics.SurfaceTexture):void");
    }

    public void setPreviewFrameLayoutSize(int width, int height) {
        int i = 720;
        synchronized (this.mLock) {
            Log.d(TAG, String.format(Locale.ENGLISH, "setPreviewFrameLayoutSize: %dx%d", new Object[]{Integer.valueOf(width), Integer.valueOf(height)}));
            if (!Device.isSurfaceSizeLimited()) {
                i = width;
            }
            this.mSurfaceWidth = i;
            if (Device.isSurfaceSizeLimited()) {
                height = (height * 720) / width;
            }
            this.mSurfaceHeight = height;
            this.mSwitchAnimManager.setPreviewFrameLayoutSize(this.mSurfaceWidth, this.mSurfaceHeight);
            updateRenderRect();
        }
    }

    protected void updateExtraTransformMatrix(float[] matrix) {
        float scaleX = 1.0f;
        float scaleY = 1.0f;
        if (this.mAnimState == 23 || this.mAnimState == 24 || this.mAnimState == 25) {
            scaleX = this.mSwitchAnimManager.getExtScaleX();
            scaleY = this.mSwitchAnimManager.getExtScaleY();
        }
        if (scaleX != 1.0f || scaleY != 1.0f) {
            Matrix.translateM(matrix, 0, 0.5f, 0.5f, 0.0f);
            Matrix.scaleM(matrix, 0, scaleX, scaleY, 1.0f);
            Matrix.translateM(matrix, 0, -0.5f, -0.5f, 0.0f);
        }
    }

    public Rect getRenderRect() {
        return this.mRenderLayoutRect;
    }

    public void resetFrameAvailableFlag() {
        this.mFrameAvailableNotified.set(false);
        synchronized (this.mLock) {
            this.mFirstFrameArrived = false;
            this.mFrameNumber = 0;
        }
    }

    public boolean getFrameAvailableFlag() {
        return this.mFrameAvailableNotified.get();
    }

    private void notifyFrameAvailable(int arrivedType) {
        if (!this.mFrameAvailableNotified.get()) {
            this.mFrameAvailableNotified.set(true);
            this.mNailListener.onFrameAvailable(arrivedType);
        }
    }
}
