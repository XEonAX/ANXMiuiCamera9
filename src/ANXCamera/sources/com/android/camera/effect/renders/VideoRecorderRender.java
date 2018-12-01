package com.android.camera.effect.renders;

import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.Locale;

public class VideoRecorderRender extends RenderGroup {
    private static final String TAG = VideoRecorderRender.class.getSimpleName();
    private int mEffectId = FilterInfo.FILTER_ID_NONE;
    private boolean mFirstFrameDrawn;
    private PipeRenderPair mRenderPipe;
    private boolean mStickerEnabled;
    private PipeRenderPair mStickerPipeRender;

    public VideoRecorderRender(GLCanvas canvas) {
        super(canvas);
        this.mStickerPipeRender = new PipeRenderPair(canvas);
        this.mRenderPipe = new PipeRenderPair(canvas);
        this.mRenderPipe.setFirstRender(new SurfaceTextureRender(canvas));
        updateSecondRender();
        addRender(this.mRenderPipe);
    }

    public boolean draw(DrawAttribute attr) {
        switch (attr.getTarget()) {
            case 8:
                return drawPreview(attr);
            default:
                Log.e(TAG, "unsupported target " + attr.getTarget());
                return false;
        }
    }

    private boolean drawPreview(DrawAttribute attr) {
        if (!this.mFirstFrameDrawn) {
            this.mFirstFrameDrawn = true;
            setViewportSize(this.mViewportWidth, this.mViewportHeight);
            setPreviewSize(this.mPreviewWidth, this.mPreviewHeight);
        }
        super.draw(attr);
        return true;
    }

    private void updateSecondRender() {
        int oldId = this.mEffectId;
        this.mEffectId = EffectController.getInstance().getEffect(false);
        boolean oldStickerEnabled = this.mStickerEnabled;
        this.mStickerEnabled = EffectController.getInstance().isStickerEnable();
        Log.d(TAG, String.format(Locale.ENGLISH, "effectId: 0x%x->0x%x stickerEnabled: %b->%b", new Object[]{Integer.valueOf(oldId), Integer.valueOf(this.mEffectId), Boolean.valueOf(oldStickerEnabled), Boolean.valueOf(this.mStickerEnabled)}));
        if (this.mEffectId != oldId || this.mStickerEnabled != oldStickerEnabled) {
            this.mFirstFrameDrawn = false;
            this.mRenderPipe.setSecondRender(getSecondRender(this.mEffectId, this.mStickerEnabled));
        }
    }

    private Render getSecondRender(int renderId, boolean stickerEnabled) {
        Render second = null;
        if (renderId != FilterInfo.FILTER_ID_NONE) {
            second = this.mGLCanvas.getEffectRenderGroup().getRender(renderId);
            if (second == null) {
                this.mGLCanvas.prepareEffectRenders(false, renderId);
                second = this.mGLCanvas.getEffectRenderGroup().getRender(renderId);
            }
        }
        if (!stickerEnabled) {
            return second;
        }
        Render sticker = this.mGLCanvas.getEffectRenderGroup().getRender(FilterInfo.FILTER_ID_STICKER);
        if (sticker == null) {
            this.mGLCanvas.prepareEffectRenders(false, FilterInfo.FILTER_ID_STICKER);
            sticker = this.mGLCanvas.getEffectRenderGroup().getRender(FilterInfo.FILTER_ID_STICKER);
        }
        if (second == null) {
            return sticker;
        }
        this.mStickerPipeRender.setRenderPairs(second, sticker);
        return this.mStickerPipeRender;
    }
}
