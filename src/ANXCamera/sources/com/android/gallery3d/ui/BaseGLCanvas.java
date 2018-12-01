package com.android.gallery3d.ui;

import android.opengl.GLES20;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.GLCanvasState;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.renders.RenderGroup;
import com.sensetime.stmobile.STMobileHumanActionNative;
import java.util.ArrayList;

public class BaseGLCanvas implements GLCanvas {
    public static int sMaxTextureSize = STMobileHumanActionNative.ST_MOBILE_HAND_PALM;
    private final IntArray mDeleteBuffers = new IntArray();
    private final IntArray mDeleteFrameBuffers = new IntArray();
    private final ArrayList<Integer> mDeletePrograms = new ArrayList();
    private final IntArray mDeleteTextures = new IntArray();
    private int mHeight;
    protected RenderGroup mRenderCaches;
    protected RenderGroup mRenderGroup;
    protected GLCanvasState mState = new GLCanvasState();
    private int mWidth;

    public BaseGLCanvas() {
        int[] size = new int[1];
        GLES20.glGetIntegerv(3379, size, 0);
        sMaxTextureSize = size[0];
    }

    protected void initialize() {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glClearStencil(0);
        GLES20.glEnable(3042);
        GLES20.glBlendFunc(770, 771);
        GLES20.glPixelStorei(3317, 1);
        GLES20.glPixelStorei(3333, 1);
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public void setSize(int width, int height) {
        boolean z = false;
        if (width >= 0 && height >= 0) {
            z = true;
        }
        Utils.assertTrue(z);
        this.mWidth = width;
        this.mHeight = height;
        this.mRenderGroup.setViewportSize(width, height);
        this.mRenderGroup.setPreviewSize(width, height);
        this.mState.identityAllM();
        this.mState.setAlpha(1.0f);
        this.mState.translate(0.0f, (float) height, 0.0f);
        this.mState.scale(1.0f, -1.0f, 1.0f);
    }

    public void setPreviewSize(int width, int height) {
        this.mRenderGroup.setPreviewSize(width, height);
    }

    public void clearBuffer() {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glClear(STMobileHumanActionNative.ST_MOBILE_HAND_LOVE);
    }

    public GLCanvasState getState() {
        return this.mState;
    }

    public boolean deleteTexture(BasicTexture texture) {
        synchronized (this.mDeleteTextures) {
            if (texture.isLoaded()) {
                this.mDeleteTextures.add(texture.getId());
                return true;
            }
            return false;
        }
    }

    public void deleteFrameBuffer(int frameBufferId) {
        synchronized (this.mDeleteFrameBuffers) {
            this.mDeleteFrameBuffers.add(frameBufferId);
        }
    }

    public void deleteProgram(int programId) {
        synchronized (this.mDeletePrograms) {
            this.mDeletePrograms.add(Integer.valueOf(programId));
        }
    }

    public void recycledResources() {
        synchronized (this.mDeleteTextures) {
            IntArray ids = this.mDeleteTextures;
            if (ids.size() > 0) {
                GLES20.glDeleteTextures(ids.size(), ids.getInternalArray(), 0);
                ids.clear();
            }
            ids = this.mDeleteBuffers;
            if (ids.size() > 0) {
                GLES20.glDeleteBuffers(ids.size(), ids.getInternalArray(), 0);
                ids.clear();
            }
            ids = this.mDeleteFrameBuffers;
            if (ids.size() > 0) {
                GLES20.glDeleteFramebuffers(ids.size(), ids.getInternalArray(), 0);
                ids.clear();
            }
            while (this.mDeletePrograms.size() > 0) {
                GLES20.glDeleteProgram(((Integer) this.mDeletePrograms.remove(0)).intValue());
            }
        }
    }

    public void draw(DrawAttribute attr) {
        this.mRenderGroup.draw(attr);
    }

    public void beginBindFrameBuffer(FrameBuffer frameBuffer) {
        this.mRenderGroup.beginBindFrameBuffer(frameBuffer);
    }

    public void endBindFrameBuffer() {
        this.mRenderGroup.endBindFrameBuffer();
    }

    public RenderGroup getEffectRenderGroup() {
        return this.mRenderCaches;
    }

    public void prepareEffectRenders(boolean isWhole, int renderId) {
        if (this.mRenderCaches.isNeedInit(renderId)) {
            EffectController.getInstance().getEffectGroup(this, this.mRenderCaches, isWhole, true, renderId);
        }
    }

    public void prepareBlurRenders() {
    }
}
