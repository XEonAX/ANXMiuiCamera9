package com.android.camera.module.encoder;

import android.graphics.SurfaceTexture;
import android.opengl.EGLContext;
import android.text.TextUtils;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.android.camera.effect.VideoRecorderCanvas;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.EGLBase.EglSurface;
import java.util.Locale;

public final class RenderHandler implements Runnable {
    private static final String TAG = RenderHandler.class.getSimpleName();
    private VideoRecorderCanvas mCanvas;
    private EGLBase mEgl;
    private DrawExtTexAttribute mExtTexture = new DrawExtTexAttribute();
    private EglSurface mInputSurface;
    private boolean mIsReady;
    private boolean mIsRecordable;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private int mRequestDraw;
    private boolean mRequestRelease;
    private boolean mRequestSetEglContext;
    private EGLContext mShardContext;
    private Object mSurface;
    private final Object mSync = new Object();

    public static final RenderHandler createHandler(String name, int previewWidth, int previewHeight) {
        Log.v(TAG, String.format(Locale.ENGLISH, "init: previewSize=%dx%d", new Object[]{Integer.valueOf(previewWidth), Integer.valueOf(previewHeight)}));
        RenderHandler handler = new RenderHandler(previewWidth, previewHeight);
        synchronized (handler.mSync) {
            handler.mIsReady = false;
            if (TextUtils.isEmpty(name)) {
                name = TAG;
            }
            new Thread(handler, name).start();
            if (!handler.mIsReady) {
                try {
                    handler.mSync.wait();
                } catch (InterruptedException e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
        return handler;
    }

    private RenderHandler(int previewWidth, int previewHeight) {
        this.mPreviewWidth = previewWidth;
        this.mPreviewHeight = previewHeight;
    }

    public final void setEglContext(EGLContext sharedContext, Object surface, boolean isRecordable) {
        Log.v(TAG, "setEglContext");
        if ((surface instanceof Surface) || ((surface instanceof SurfaceTexture) ^ 1) == 0 || ((surface instanceof SurfaceHolder) ^ 1) == 0) {
            synchronized (this.mSync) {
                if (this.mRequestRelease) {
                    return;
                }
                this.mShardContext = sharedContext;
                this.mSurface = surface;
                this.mIsRecordable = isRecordable;
                this.mRequestSetEglContext = true;
                this.mSync.notifyAll();
                try {
                    this.mSync.wait();
                } catch (InterruptedException e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        } else {
            throw new RuntimeException("unsupported window type:" + surface);
        }
    }

    public final void draw(DrawExtTexAttribute ext) {
        synchronized (this.mSync) {
            if (this.mRequestRelease) {
                return;
            }
            this.mExtTexture.init(ext.mExtTexture, ext.mTextureTransform, 0, 0, this.mPreviewWidth, this.mPreviewHeight);
            this.mRequestDraw++;
            this.mSync.notifyAll();
        }
    }

    public final void release() {
        Log.v(TAG, "release");
        synchronized (this.mSync) {
            if (this.mRequestRelease) {
                return;
            }
            this.mRequestRelease = true;
            this.mSync.notifyAll();
            try {
                this.mSync.wait();
            } catch (InterruptedException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    /* JADX WARNING: Missing block: B:43:0x0079, code:
            r3 = r4.mSync;
     */
    /* JADX WARNING: Missing block: B:44:0x007b, code:
            monitor-enter(r3);
     */
    /* JADX WARNING: Missing block: B:46:?, code:
            r4.mSync.wait();
     */
    public final void run() {
        /*
        r4 = this;
        r2 = TAG;
        r3 = "renderHandlerThread>>>";
        com.android.camera.log.Log.d(r2, r3);
        r3 = r4.mSync;
        monitor-enter(r3);
        r2 = 0;
        r4.mRequestSetEglContext = r2;	 Catch:{ all -> 0x003d }
        r2 = 0;
        r4.mRequestRelease = r2;	 Catch:{ all -> 0x003d }
        r2 = 0;
        r4.mRequestDraw = r2;	 Catch:{ all -> 0x003d }
        r2 = 1;
        r4.mIsReady = r2;	 Catch:{ all -> 0x003d }
        r2 = r4.mSync;	 Catch:{ all -> 0x003d }
        r2.notifyAll();	 Catch:{ all -> 0x003d }
    L_0x001c:
        monitor-exit(r3);
    L_0x001d:
        r3 = r4.mSync;
        monitor-enter(r3);
        r2 = r4.mRequestRelease;	 Catch:{ all -> 0x0076 }
        if (r2 == 0) goto L_0x0040;
    L_0x0024:
        monitor-exit(r3);
        r3 = r4.mSync;
        monitor-enter(r3);
        r2 = 1;
        r4.mRequestRelease = r2;	 Catch:{ all -> 0x0087 }
        r4.internalRelease();	 Catch:{ all -> 0x0087 }
        r2 = r4.mSync;	 Catch:{ all -> 0x0087 }
        r2.notifyAll();	 Catch:{ all -> 0x0087 }
        monitor-exit(r3);
        r2 = TAG;
        r3 = "renderHandlerThread<<<";
        com.android.camera.log.Log.d(r2, r3);
        return;
    L_0x003d:
        r2 = move-exception;
        monitor-exit(r3);
        throw r2;
    L_0x0040:
        r2 = r4.mRequestSetEglContext;	 Catch:{ all -> 0x0076 }
        if (r2 == 0) goto L_0x004a;
    L_0x0044:
        r2 = 0;
        r4.mRequestSetEglContext = r2;	 Catch:{ all -> 0x0076 }
        r4.internalPrepare();	 Catch:{ all -> 0x0076 }
    L_0x004a:
        r2 = r4.mRequestDraw;	 Catch:{ all -> 0x0076 }
        if (r2 <= 0) goto L_0x0074;
    L_0x004e:
        r1 = 1;
    L_0x004f:
        if (r1 == 0) goto L_0x0057;
    L_0x0051:
        r2 = r4.mRequestDraw;	 Catch:{ all -> 0x0076 }
        r2 = r2 + -1;
        r4.mRequestDraw = r2;	 Catch:{ all -> 0x0076 }
    L_0x0057:
        monitor-exit(r3);
        if (r1 == 0) goto L_0x0079;
    L_0x005a:
        r2 = r4.mEgl;
        if (r2 == 0) goto L_0x001d;
    L_0x005e:
        r2 = r4.mExtTexture;
        if (r2 == 0) goto L_0x001d;
    L_0x0062:
        r2 = r4.mInputSurface;
        r2.makeCurrent();
        r2 = r4.mCanvas;
        r3 = r4.mExtTexture;
        r2.draw(r3);
        r2 = r4.mInputSurface;
        r2.swap();
        goto L_0x001d;
    L_0x0074:
        r1 = 0;
        goto L_0x004f;
    L_0x0076:
        r2 = move-exception;
        monitor-exit(r3);
        throw r2;
    L_0x0079:
        r3 = r4.mSync;
        monitor-enter(r3);
        r2 = r4.mSync;	 Catch:{ InterruptedException -> 0x0082, all -> 0x0084 }
        r2.wait();	 Catch:{ InterruptedException -> 0x0082, all -> 0x0084 }
        goto L_0x001c;
    L_0x0082:
        r0 = move-exception;
        goto L_0x0024;
    L_0x0084:
        r2 = move-exception;
        monitor-exit(r3);
        throw r2;
    L_0x0087:
        r2 = move-exception;
        monitor-exit(r3);
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.RenderHandler.run():void");
    }

    private final void internalPrepare() {
        Log.v(TAG, "internalPrepare");
        internalRelease();
        this.mEgl = new EGLBase(this.mShardContext, false, this.mIsRecordable);
        this.mInputSurface = this.mEgl.createFromSurface(this.mSurface);
        this.mInputSurface.makeCurrent();
        this.mCanvas = new VideoRecorderCanvas();
        this.mCanvas.setSize(this.mPreviewWidth, this.mPreviewHeight);
        this.mSurface = null;
        this.mSync.notifyAll();
    }

    private final void internalRelease() {
        Log.v(TAG, "internalRelease");
        if (this.mInputSurface != null) {
            this.mInputSurface.release();
            this.mInputSurface = null;
        }
        if (this.mCanvas != null) {
            this.mCanvas.recycledResources();
            this.mCanvas = null;
        }
        if (this.mEgl != null) {
            this.mEgl.release();
            this.mEgl = null;
        }
    }
}
