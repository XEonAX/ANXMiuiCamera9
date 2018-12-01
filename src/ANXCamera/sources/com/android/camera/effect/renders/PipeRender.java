package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.List;
import java.util.Locale;

public class PipeRender extends RenderGroup {
    private static final String TAG = PipeRender.class.getSimpleName();
    private int mBufferHeight;
    private int mBufferWidth;
    private int[] mFrameBufferTextures;
    private int[] mFrameBuffers;

    public PipeRender(GLCanvas canvas) {
        super(canvas);
    }

    public boolean draw(DrawAttribute attr) {
        if (this.mFrameBuffers == null || this.mFrameBufferTextures == null) {
            Log.e(TAG, "framebuffer hasn't been initialized");
            return false;
        }
        int x = 0;
        int y = 0;
        int width = 0;
        int height = 0;
        int textureId = 0;
        boolean isSnapshot = false;
        int target = attr.getTarget();
        switch (target) {
            case 5:
                DrawBasicTexAttribute basic = (DrawBasicTexAttribute) attr;
                x = basic.mX;
                y = basic.mY;
                width = basic.mWidth;
                height = basic.mHeight;
                textureId = basic.mBasicTexture.getId();
                isSnapshot = basic.mIsSnapshot;
                break;
            case 6:
                DrawIntTexAttribute texture = (DrawIntTexAttribute) attr;
                x = texture.mX;
                y = texture.mY;
                width = texture.mWidth;
                height = texture.mHeight;
                textureId = texture.mTexId;
                isSnapshot = texture.mIsSnapshot;
                break;
            default:
                Log.w(TAG, "unsupported target " + target);
                break;
        }
        if (width == 0 || height == 0) {
            return false;
        }
        int bufWidth = this.mBufferWidth;
        int bufHeight = this.mBufferHeight;
        DrawIntTexAttribute inputTexture = null;
        List<Render> renders = getRenders();
        if (renders != null) {
            int size = renders.size();
            int i = 0;
            while (i < size) {
                Render render = (Render) renders.get(i);
                boolean isNotLast = i < size + -1;
                if (isNotLast) {
                    beginBindFrameBuffer(this.mFrameBuffers[i], bufWidth, bufHeight);
                }
                DrawAttribute inputTexture2;
                if (i != 0) {
                    render.setPreviousFrameBufferInfo(this.mFrameBuffers[i - 1], bufWidth, bufHeight);
                    if (!isNotLast) {
                        inputTexture2.mX = x;
                        inputTexture2.mY = y;
                        inputTexture2.mWidth = width;
                        inputTexture2.mHeight = height;
                    }
                    render.draw(inputTexture2);
                } else if (isNotLast) {
                    inputTexture2 = new DrawIntTexAttribute(textureId, 0, 0, bufWidth, bufHeight, isSnapshot);
                    render.draw(inputTexture2);
                } else {
                    render.draw(attr);
                }
                if (isNotLast) {
                    DrawAttribute drawIntTexAttribute = new DrawIntTexAttribute(this.mFrameBufferTextures[i], 0, 0, bufWidth, bufHeight, isSnapshot);
                    endBindFrameBuffer();
                }
                i++;
            }
        }
        return true;
    }

    public void setFrameBufferSize(int w, int h) {
        if (this.mBufferWidth != w || this.mBufferHeight != h) {
            this.mBufferWidth = w;
            this.mBufferHeight = h;
            reInitFrameBuffers(w, h);
        }
    }

    public void addRender(Render render) {
        super.addRender(render);
        int count = getRenderSize() - 1;
        if ((this.mFrameBuffers == null || count > this.mFrameBuffers.length) && this.mBufferWidth > 0 && this.mBufferHeight > 0) {
            reInitFrameBuffers(this.mBufferWidth, this.mBufferHeight);
        }
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        destroyFrameBuffers();
    }

    public void reInitFrameBuffers(int w, int h) {
        destroyFrameBuffers();
        initFrameBuffers(Math.max(2, getRenderSize() - 1), w, h);
    }

    private synchronized void destroyFrameBuffers() {
        if (this.mFrameBufferTextures != null) {
            GLES20.glDeleteTextures(this.mFrameBufferTextures.length, this.mFrameBufferTextures, 0);
            this.mFrameBufferTextures = null;
        }
        if (this.mFrameBuffers != null) {
            GLES20.glDeleteFramebuffers(this.mFrameBuffers.length, this.mFrameBuffers, 0);
            this.mFrameBuffers = null;
        }
    }

    private synchronized void initFrameBuffers(int count, int w, int h) {
        if (count > 0) {
            Log.v(TAG, "initFrameBuffers: count=" + count + " size=" + w + "x" + h);
            this.mFrameBuffers = new int[count];
            this.mFrameBufferTextures = new int[count];
            for (int i = 0; i < count; i++) {
                GLES20.glGenFramebuffers(1, this.mFrameBuffers, i);
                GLES20.glGenTextures(1, this.mFrameBufferTextures, i);
                GLES20.glBindTexture(3553, this.mFrameBufferTextures[i]);
                GLES20.glTexImage2D(3553, 0, 6408, w, h, 0, 6408, 5121, null);
                GLES20.glTexParameterf(3553, 10240, 9729.0f);
                GLES20.glTexParameterf(3553, 10241, 9729.0f);
                GLES20.glTexParameterf(3553, 10242, 33071.0f);
                GLES20.glTexParameterf(3553, 10243, 33071.0f);
                GLES20.glBindFramebuffer(36160, this.mFrameBuffers[i]);
                GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mFrameBufferTextures[i], 0);
                Log.v(TAG, String.format(Locale.ENGLISH, "fbo[%d]: %d %d", new Object[]{Integer.valueOf(i), Integer.valueOf(this.mFrameBuffers[i]), Integer.valueOf(this.mFrameBufferTextures[i])}));
                GLES20.glBindTexture(3553, 0);
                GLES20.glBindFramebuffer(36160, 0);
            }
        }
    }
}
