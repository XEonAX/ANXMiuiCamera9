package com.android.gallery3d.ui;

import android.opengl.GLES20;
import com.android.camera.Util;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.renders.BasicRender;
import com.android.camera.effect.renders.EffectRenderGroup;
import com.android.camera.effect.renders.RenderGroup;
import com.android.camera.log.Log;

public class GLCanvasImpl extends BaseGLCanvas {
    public GLCanvasImpl() {
        this.mRenderCaches = new RenderGroup(this);
        this.mRenderGroup = new RenderGroup(this);
        EffectRenderGroup effectControlRenderGroup = new EffectRenderGroup(this);
        EffectController.getInstance().addChangeListener(effectControlRenderGroup);
        this.mRenderGroup.addRender(effectControlRenderGroup);
        this.mRenderGroup.addRender(new BasicRender(this));
        initialize();
    }

    protected void initialize() {
        super.initialize();
        GLES20.glEnable(3024);
        GLES20.glLineWidth(1.0f);
    }

    public void setSize(int width, int height) {
        super.setSize(width, height);
        Log.c("GLCanvasImpl", "setSize: size=" + width + "x" + height + " modelMatrix=" + Util.dumpMatrix(this.mState.getModelMatrix()));
    }

    public void draw(DrawAttribute attr) {
        this.mRenderGroup.draw(attr);
    }

    public void prepareEffectRenders(boolean isWhole, int renderId) {
        if (this.mRenderCaches.isNeedInit(renderId)) {
            EffectController.getInstance().getEffectGroup(this, this.mRenderCaches, isWhole, false, renderId);
        }
    }

    public void prepareBlurRenders() {
        if (this.mRenderGroup.getRender(FilterInfo.FILTER_ID_BLUR) == null) {
            if (this.mRenderCaches.getRender(FilterInfo.FILTER_ID_BLUR) == null) {
                prepareEffectRenders(false, FilterInfo.FILTER_ID_BLUR);
            }
            this.mRenderGroup.addRender(this.mRenderCaches.getRender(FilterInfo.FILTER_ID_BLUR));
        }
    }

    public void setSticker(String sticker) {
        this.mRenderGroup.setSticker(sticker);
    }
}
