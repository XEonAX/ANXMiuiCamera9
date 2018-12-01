package com.android.camera.effect.renders;

import com.android.camera.Device;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.Utils;
import java.util.ArrayList;

public final class PipeRenderPair extends RenderGroup {
    private static final String TAG = PipeRenderPair.class.getSimpleName();
    private DrawBasicTexAttribute mBasicTextureAttr = new DrawBasicTexAttribute();
    private FrameBuffer mBlurFrameBuffer;
    private int mBufferHeight = -1;
    private int mBufferWidth = -1;
    private DrawExtTexAttribute mExtTexture = new DrawExtTexAttribute();
    private Render mFirstRender;
    private FrameBuffer mFrameBuffer;
    private ArrayList<FrameBuffer> mFrameBuffers = new ArrayList();
    private FrameBuffer mMiddleFrameBuffer;
    private Render mSecondRender;
    private boolean mTextureFilled = false;
    private boolean mUseMiddleBuffer = false;

    public PipeRenderPair(GLCanvas canvas) {
        super(canvas);
    }

    public PipeRenderPair(GLCanvas canvas, Render first, Render second, boolean useMiddleBuffer) {
        super(canvas);
        setRenderPairs(first, second);
        this.mUseMiddleBuffer = useMiddleBuffer;
    }

    public PipeRenderPair(GLCanvas canvas, int id, Render first, Render second, boolean useMiddleBuffer) {
        super(canvas, id);
        setRenderPairs(first, second);
        this.mUseMiddleBuffer = useMiddleBuffer;
    }

    public void setRenderPairs(Render first, Render second) {
        if (first != this.mFirstRender || second != this.mSecondRender) {
            clearRenders();
            if (first != null) {
                addRender(first);
            }
            if (second != null) {
                addRender(second);
            }
            this.mFirstRender = first;
            this.mSecondRender = second;
        }
    }

    public void setPreviewSize(int w, int h) {
        super.setPreviewSize(w, h);
        this.mBufferWidth = this.mUseMiddleBuffer ? this.mPreviewWidth / 12 : this.mPreviewWidth;
        this.mBufferHeight = this.mUseMiddleBuffer ? this.mPreviewHeight / 12 : this.mPreviewHeight;
    }

    public void setFirstRender(Render first) {
        clearRenders();
        if (first != null) {
            addRender(first);
        }
        this.mFirstRender = first;
        if (this.mSecondRender != null) {
            addRender(this.mSecondRender);
        }
    }

    public void setSecondRender(Render second) {
        clearRenders();
        if (this.mFirstRender != null) {
            addRender(this.mFirstRender);
        }
        if (second != null) {
            addRender(second);
        }
        this.mSecondRender = second;
    }

    public void addRender(Render render) {
        if (getRenderSize() >= 2) {
            throw new RuntimeException("At most 2 renders are supported in PipeRenderPair!");
        }
        super.addRender(render);
    }

    public void copyBlurTexture(DrawExtTexAttribute ext) {
        if (EffectController.getInstance().isBackGroundBlur() && !this.mTextureFilled) {
            if (!(this.mBlurFrameBuffer != null && this.mBlurFrameBuffer.getWidth() == ext.mWidth && this.mBlurFrameBuffer.getHeight() == ext.mHeight)) {
                this.mBlurFrameBuffer = new FrameBuffer(this.mGLCanvas, ext.mWidth, ext.mHeight, this.mParentFrameBufferId);
            }
            beginBindFrameBuffer(this.mBlurFrameBuffer);
            this.mSecondRender.draw(this.mBasicTextureAttr.init(this.mUseMiddleBuffer ? this.mMiddleFrameBuffer.getTexture() : this.mFrameBuffer.getTexture(), ext.mX, ext.mY, ext.mWidth, ext.mHeight));
            endBindFrameBuffer();
            this.mTextureFilled = true;
        }
    }

    public void drawBlurTexture(DrawExtTexAttribute ext) {
        if (EffectController.getInstance().isBackGroundBlur() && this.mTextureFilled) {
            this.mGLCanvas.draw(new DrawBasicTexAttribute(this.mBlurFrameBuffer.getTexture(), ext.mX, ext.mY, ext.mWidth, ext.mHeight));
        }
    }

    private void setFrameBufferInfo(Render render, FrameBuffer buf) {
        render.setPreviousFrameBufferInfo(buf.getId(), buf.getWidth(), buf.getHeight());
    }

    public boolean draw(DrawAttribute attr) {
        if (getRenderSize() == 0) {
            return false;
        }
        if (getRenderSize() == 1 || this.mFirstRender == this.mSecondRender) {
            return getRenderByIndex(0).draw(attr);
        }
        if (attr.getTarget() == 8) {
            DrawExtTexAttribute ext = (DrawExtTexAttribute) attr;
            this.mFrameBuffer = getFrameBuffer(this.mPreviewWidth, this.mPreviewHeight);
            beginBindFrameBuffer(this.mFrameBuffer);
            this.mFirstRender.draw(this.mExtTexture.init(ext.mExtTexture, ext.mTextureTransform, 0, 0, this.mFrameBuffer.getTexture().getTextureWidth(), this.mFrameBuffer.getTexture().getTextureHeight()));
            endBindFrameBuffer();
            setFrameBufferInfo(this.mSecondRender, this.mFrameBuffer);
            if (this.mUseMiddleBuffer) {
                updateMiddleBuffer(this.mPreviewWidth, this.mPreviewHeight);
                this.mMiddleFrameBuffer = getFrameBuffer(this.mBufferWidth, this.mBufferHeight);
                beginBindFrameBuffer(this.mMiddleFrameBuffer);
                this.mFirstRender.draw(this.mExtTexture.init(ext.mExtTexture, ext.mTextureTransform, 0, 0, this.mBufferWidth, this.mBufferHeight));
                endBindFrameBuffer();
            }
            if (EffectController.getInstance().isMainFrameDisplay()) {
                if (Device.isHoldBlurBackground() && EffectController.getInstance().isBackGroundBlur()) {
                    copyBlurTexture(ext);
                    drawBlurTexture(ext);
                } else {
                    this.mSecondRender.draw(this.mBasicTextureAttr.init(this.mUseMiddleBuffer ? this.mMiddleFrameBuffer.getTexture() : this.mFrameBuffer.getTexture(), ext.mX, ext.mY, ext.mWidth, ext.mHeight));
                }
            }
            return true;
        } else if (attr.getTarget() == 5 || attr.getTarget() == 10) {
            DrawBasicTexAttribute basic = (DrawBasicTexAttribute) attr;
            if (attr.getTarget() == 10) {
                updateMiddleBuffer(basic.mWidth, basic.mHeight);
            }
            this.mFrameBuffer = getFrameBuffer(this.mBufferWidth, this.mBufferHeight);
            beginBindFrameBuffer(this.mFrameBuffer);
            this.mFirstRender.draw(this.mBasicTextureAttr.init(basic.mBasicTexture, 0, 0, this.mFrameBuffer.getTexture().getTextureWidth(), this.mFrameBuffer.getTexture().getTextureHeight()));
            endBindFrameBuffer();
            setFrameBufferInfo(this.mSecondRender, this.mFrameBuffer);
            this.mSecondRender.draw(this.mBasicTextureAttr.init(this.mFrameBuffer.getTexture(), basic.mX, basic.mY, basic.mWidth, basic.mHeight));
            return true;
        } else if (attr.getTarget() != 6) {
            return false;
        } else {
            DrawIntTexAttribute intTex = (DrawIntTexAttribute) attr;
            this.mFrameBuffer = getFrameBuffer(intTex.mWidth, intTex.mHeight);
            beginBindFrameBuffer(this.mFrameBuffer);
            this.mFirstRender.draw(new DrawIntTexAttribute(intTex.mTexId, 0, 0, intTex.mWidth, intTex.mHeight, intTex.mIsSnapshot));
            endBindFrameBuffer();
            setFrameBufferInfo(this.mSecondRender, this.mFrameBuffer);
            this.mSecondRender.draw(this.mBasicTextureAttr.init(this.mFrameBuffer.getTexture(), intTex.mX, intTex.mY, intTex.mWidth, intTex.mHeight, intTex.mIsSnapshot));
            return true;
        }
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        this.mFrameBuffers.clear();
        this.mFrameBuffer = null;
        this.mMiddleFrameBuffer = null;
    }

    private FrameBuffer getFrameBuffer(int w, int h) {
        FrameBuffer buffer = null;
        if (!this.mFrameBuffers.isEmpty()) {
            for (int i = this.mFrameBuffers.size() - 1; i >= 0; i--) {
                double ratio;
                int bufferW = ((FrameBuffer) this.mFrameBuffers.get(i)).getWidth();
                int bufferH = ((FrameBuffer) this.mFrameBuffers.get(i)).getHeight();
                if (w < h) {
                    ratio = Math.abs((((double) bufferH) / ((double) bufferW)) - (((double) h) / ((double) w)));
                } else {
                    ratio = Math.abs((((double) bufferW) / ((double) bufferH)) - (((double) w) / ((double) h)));
                }
                if (ratio <= 0.1d && Utils.nextPowerOf2(bufferW) == Utils.nextPowerOf2(w) && Utils.nextPowerOf2(bufferH) == Utils.nextPowerOf2(h)) {
                    buffer = (FrameBuffer) this.mFrameBuffers.get(i);
                    break;
                }
            }
        }
        if (buffer == null) {
            buffer = new FrameBuffer(this.mGLCanvas, w, h, this.mParentFrameBufferId);
            if (this.mFrameBuffers.size() > 5) {
                this.mFrameBuffers.remove(this.mFrameBuffers.size() - 1);
            }
            this.mFrameBuffers.add(buffer);
        }
        return buffer;
    }

    public void setUsedMiddleBuffer(boolean useMiddleBuffer) {
        this.mUseMiddleBuffer = useMiddleBuffer;
    }

    private void updateMiddleBuffer(int width, int height) {
        if (this.mUseMiddleBuffer) {
            this.mBufferWidth = width / 12;
            this.mBufferHeight = height / 12;
            return;
        }
        this.mBufferWidth = width;
        this.mBufferHeight = height;
    }

    public void prepareCopyBlurTexture() {
        this.mTextureFilled = false;
    }
}
