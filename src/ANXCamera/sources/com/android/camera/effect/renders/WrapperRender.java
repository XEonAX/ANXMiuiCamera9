package com.android.camera.effect.renders;

import android.opengl.GLES20;
import android.opengl.Matrix;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.filter.base.GPUImageFilter;

public class WrapperRender extends ShaderRender {
    private static final String TAG = WrapperRender.class.getSimpleName();
    private static final float[] VERTICES = new float[]{0.0f, 1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f};
    private float[] mConvertedVertex = new float[16];
    protected GPUImageFilter mFilter;
    private float mRenderHeight;
    private float mRenderWidth;
    private float mRenderX;
    private float mRenderY;

    public WrapperRender(GLCanvas canvas, int id, GPUImageFilter filter) {
        super(canvas, id);
        this.mFilter = filter;
        initFilter();
    }

    public void initFilter() {
        if (this.mFilter != null && (this.mFilter.isInitialized() ^ 1) != 0) {
            this.mFilter.init();
        }
    }

    public void releaseFilter() {
        if (this.mFilter != null && this.mFilter.isInitialized()) {
            this.mFilter.destroy();
        }
    }

    public void setViewportSize(int w, int h) {
        super.setViewportSize(w, h);
        this.mRenderWidth = 0.0f;
        this.mRenderHeight = 0.0f;
        if (this.mFilter != null) {
            this.mFilter.onDisplaySizeChanged(w, h);
        }
    }

    protected void initShader() {
    }

    protected void initVertexData() {
        int size = (VERTICES.length * 32) / 8;
        this.mVertexBuffer = ShaderRender.allocateByteBuffer(size).asFloatBuffer();
        this.mTexCoorBuffer = ShaderRender.allocateByteBuffer(size).asFloatBuffer();
    }

    protected void initSupportAttriList() {
        this.mAttriSupportedList.add(Integer.valueOf(5));
        this.mAttriSupportedList.add(Integer.valueOf(6));
    }

    public boolean draw(DrawAttribute attr) {
        if (!isAttriSupported(attr.getTarget())) {
            Log.w(TAG, "unsupported target " + attr.getTarget());
            return false;
        } else if (this.mFilter == null) {
            Log.e(TAG, "null filter!");
            return false;
        } else {
            switch (attr.getTarget()) {
                case 5:
                    DrawBasicTexAttribute texture = (DrawBasicTexAttribute) attr;
                    drawTexture(texture.mBasicTexture, (float) texture.mX, (float) texture.mY, (float) texture.mWidth, (float) texture.mHeight);
                    break;
                case 6:
                    DrawIntTexAttribute texture2 = (DrawIntTexAttribute) attr;
                    drawTexture(texture2.mTexId, (float) texture2.mX, (float) texture2.mY, (float) texture2.mWidth, (float) texture2.mHeight);
                    break;
            }
            return true;
        }
    }

    public String getFragShaderString() {
        return null;
    }

    public void destroy() {
        super.destroy();
        releaseFilter();
    }

    protected void drawTexture(BasicTexture texture, float x, float y, float w, float h) {
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
        }
        if (texture.onBind(this.mGLCanvas) && bindTexture(texture, 33984)) {
            setBlendEnabled(false);
            updateViewport();
            checkRenderRect(x, y, w, h);
            this.mFilter.onDrawFrame(texture.getId(), this.mVertexBuffer, this.mTexCoorBuffer);
        }
    }

    protected void drawTexture(int textureId, float x, float y, float w, float h) {
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
        }
        bindTexture(textureId, 33984);
        setBlendEnabled(false);
        updateViewport();
        checkRenderRect(x, y, w, h);
        this.mFilter.onDrawFrame(textureId, this.mVertexBuffer, this.mTexCoorBuffer);
    }

    private void checkRenderRect(float x, float y, float w, float h) {
        if (this.mRenderX != x || this.mRenderY != y || this.mRenderWidth != w || this.mRenderHeight != h) {
            this.mRenderX = x;
            this.mRenderY = y;
            this.mRenderWidth = w;
            this.mRenderHeight = h;
            updateVertexData(x, y, w, h);
        }
    }

    private void updateVertexData(float x, float y, float w, float h) {
        int i;
        int j;
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(x, y, 0.0f);
        this.mGLCanvas.getState().scale(w, h, 1.0f);
        Matrix.multiplyMM(this.mConvertedVertex, 0, this.mGLCanvas.getState().getFinalMatrix(), 0, VERTICES, 0);
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 2; j++) {
                this.mVertexBuffer.put(this.mConvertedVertex[(i * 4) + j]);
            }
        }
        this.mVertexBuffer.position(0);
        Matrix.multiplyMM(this.mConvertedVertex, 0, this.mGLCanvas.getState().getTexMatrix(), 0, VERTICES, 0);
        for (i = 0; i < 4; i++) {
            for (j = 0; j < 2; j++) {
                this.mTexCoorBuffer.put(this.mConvertedVertex[(i * 4) + j]);
            }
        }
        this.mTexCoorBuffer.position(0);
        this.mGLCanvas.getState().popState();
    }
}
