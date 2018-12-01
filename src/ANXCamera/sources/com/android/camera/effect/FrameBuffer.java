package com.android.camera.effect;

import android.opengl.GLES20;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import java.util.Locale;

public class FrameBuffer {
    private int[] mFrameBufferID;
    private GLCanvas mGLCanvas;
    private RawTexture mTexture;

    public FrameBuffer(GLCanvas canvas, RawTexture texture, int parentFramebufferId) {
        this.mFrameBufferID = new int[1];
        if (!texture.isLoaded()) {
            texture.prepare(canvas);
        }
        GLES20.glGenFramebuffers(1, this.mFrameBufferID, 0);
        GLES20.glBindFramebuffer(36160, this.mFrameBufferID[0]);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, texture.getId(), 0);
        GLES20.glBindFramebuffer(36160, parentFramebufferId);
        this.mTexture = texture;
        this.mGLCanvas = canvas;
    }

    public FrameBuffer(GLCanvas canvas, int width, int height, int parentFramebufferId) {
        this.mFrameBufferID = new int[1];
        this.mTexture = new RawTexture(width, height, true);
        this.mTexture.prepare(canvas);
        GLES20.glGenFramebuffers(1, this.mFrameBufferID, 0);
        GLES20.glBindFramebuffer(36160, this.mFrameBufferID[0]);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mTexture.getId(), 0);
        GLES20.glBindFramebuffer(36160, parentFramebufferId);
        this.mGLCanvas = canvas;
    }

    public int getWidth() {
        return this.mTexture.getWidth();
    }

    public int getHeight() {
        return this.mTexture.getHeight();
    }

    public RawTexture getTexture() {
        return this.mTexture;
    }

    public int getId() {
        return this.mFrameBufferID[0];
    }

    protected void finalize() {
        if (this.mGLCanvas != null) {
            Log.d("FrameBuffer", String.format(Locale.ENGLISH, "Camera delete framebuffer thread=%d id=%d", new Object[]{Long.valueOf(Thread.currentThread().getId()), Integer.valueOf(getId())}));
            this.mGLCanvas.deleteFrameBuffer(getId());
        }
    }
}
