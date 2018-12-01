package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.filter.base.GPUImageFilter;
import com.miui.filtersdk.utils.TextureRotationUtil;

public class BeautificationWrapperRender extends WrapperRender {
    private static final String TAG = BeautificationWrapperRender.class.getSimpleName();
    private NoneEffectRender mSimpleRender;

    public BeautificationWrapperRender(GLCanvas canvas, int id, GPUImageFilter filter, boolean isFront) {
        super(canvas, id, filter);
        this.mSimpleRender = new NoneEffectRender(canvas);
        adjustSize(isFront);
    }

    public void adjustSize(boolean isFront) {
        if (isFront) {
            TextureRotationUtil.adjustSize(90, false, false, this.mVertexBuffer, this.mTexCoorBuffer);
        } else {
            TextureRotationUtil.adjustSize(270, false, true, this.mVertexBuffer, this.mTexCoorBuffer);
        }
    }

    protected void drawTexture(BasicTexture texture, float x, float y, float w, float h) {
        int outTexId = this.mFilter.onDrawToTexture(texture.getId(), this.mVertexBuffer, this.mTexCoorBuffer);
        if (outTexId == -1) {
            outTexId = texture.getId();
        }
        GLES20.glDisable(2884);
        drawToFrameBuffer(outTexId, x, y, w, h);
    }

    protected void drawTexture(int textureId, float x, float y, float w, float h) {
        int outTexId = this.mFilter.onDrawToTexture(textureId, this.mVertexBuffer, this.mTexCoorBuffer);
        if (outTexId == -1) {
            outTexId = textureId;
        }
        GLES20.glDisable(2884);
        drawToFrameBuffer(outTexId, x, y, w, h);
    }

    private void drawToFrameBuffer(int texId, float x, float y, float w, float h) {
        if (this.mParentFrameBufferId != 0) {
            GLES20.glBindFramebuffer(36160, this.mParentFrameBufferId);
            GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        }
        this.mSimpleRender.drawTexture(texId, x, y, w, h, false);
    }

    public void setViewportSize(int w, int h) {
        super.setViewportSize(w, h);
        this.mSimpleRender.setViewportSize(w, h);
    }

    public void setPreviewSize(int w, int h) {
        super.setPreviewSize(w, h);
        this.mSimpleRender.setPreviewSize(w, h);
        this.mFilter.onDisplaySizeChanged(w, h);
    }
}
