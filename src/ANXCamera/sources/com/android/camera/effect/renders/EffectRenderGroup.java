package com.android.camera.effect.renders;

import android.graphics.Color;
import android.support.v7.recyclerview.R;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectChangedListener;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.FillRectAttribute;
import com.android.gallery3d.ui.GLCanvas;

public class EffectRenderGroup extends RenderGroup implements EffectChangedListener {
    private static final String TAG = EffectRenderGroup.class.getSimpleName();
    private int mEffectId = FilterInfo.FILTER_ID_NONE;
    private boolean mFirstFrameDrawn;
    private boolean mIsFocusPeakEnabled;
    private boolean mIsGradienterEnabled;
    private boolean mIsMakeupEnabled;
    private boolean mIsStickerEnabled;
    private PipeRenderPair mPreviewPipeRender;
    private PipeRender mPreviewSecondRender;
    private RenderGroup mRenderCaches;
    private Boolean mRenderChanged = new Boolean(false);
    private String mTiltShiftMode;

    public EffectRenderGroup(GLCanvas canvas) {
        super(canvas);
        this.mRenderCaches = canvas.getEffectRenderGroup();
        this.mPreviewPipeRender = new PipeRenderPair(canvas);
        this.mPreviewPipeRender.setFirstRender(new SurfaceTextureRender(canvas));
        this.mPreviewSecondRender = new PipeRender(canvas);
        addRender(this.mPreviewPipeRender);
    }

    public boolean draw(DrawAttribute attr) {
        if (EffectController.getInstance().getEffect(true) != this.mEffectId && EffectController.getInstance().isBackGroundBlur()) {
            this.mPreviewPipeRender.prepareCopyBlurTexture();
        }
        switch (attr.getTarget()) {
            case 8:
                return drawPreview(attr);
            default:
                return false;
        }
    }

    public void onEffectChanged(int... changeTypes) {
        synchronized (this.mRenderChanged) {
            EffectController effectController = EffectController.getInstance();
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            for (int changeType : changeTypes) {
                switch (changeType) {
                    case 1:
                        this.mEffectId = effectController.getEffect(true);
                        break;
                    case 2:
                        this.mIsStickerEnabled = effectController.isStickerEnable();
                        break;
                    case 3:
                        this.mIsMakeupEnabled = effectController.isMakeupEnable();
                        break;
                    case 4:
                        this.mIsFocusPeakEnabled = effectController.isNeedDrawPeaking();
                        break;
                    case 5:
                        if (!effectController.isDrawTilt()) {
                            this.mTiltShiftMode = null;
                            break;
                        } else {
                            this.mTiltShiftMode = dataItemRunning.getComponentRunningTiltValue().getComponentValue(160);
                            break;
                        }
                    case 6:
                        this.mIsGradienterEnabled = effectController.isDrawGradienter();
                        break;
                    default:
                        break;
                }
            }
            this.mRenderChanged = Boolean.valueOf(true);
        }
    }

    private boolean drawPreview(DrawAttribute attr) {
        if (!this.mFirstFrameDrawn) {
            this.mFirstFrameDrawn = true;
            setViewportSize(this.mViewportWidth, this.mViewportHeight);
            setPreviewSize(this.mPreviewWidth, this.mPreviewHeight);
        }
        DrawExtTexAttribute ext = (DrawExtTexAttribute) attr;
        if (updatePreviewSecondRender()) {
            if (this.mPreviewSecondRender.getRenderSize() == 0) {
                this.mPreviewPipeRender.setSecondRender(null);
            } else if (this.mPreviewPipeRender.getRenderSize() == 1) {
                this.mPreviewPipeRender.setSecondRender(this.mPreviewSecondRender);
            }
        }
        this.mPreviewPipeRender.setUsedMiddleBuffer(EffectController.getInstance().isBackGroundBlur());
        this.mPreviewPipeRender.draw(attr);
        drawAnimationMask(attr);
        return true;
    }

    private void drawAnimationMask(DrawAttribute attr) {
        int alpha = EffectController.getInstance().getBlurAnimationValue();
        if (alpha > 0) {
            this.mGLCanvas.draw(new FillRectAttribute(0.0f, 0.0f, (float) ((DrawExtTexAttribute) attr).mWidth, (float) ((DrawExtTexAttribute) attr).mHeight, Color.argb(alpha, 0, 0, 0)));
        }
    }

    private Render fetchRender(int renderId) {
        Render render = this.mRenderCaches.getRender(renderId);
        if (render != null) {
            return render;
        }
        this.mGLCanvas.prepareEffectRenders(false, renderId);
        return this.mRenderCaches.getRender(renderId);
    }

    private void removeCache(int renderId) {
        this.mRenderCaches.removeRender(renderId);
    }

    private boolean updatePreviewSecondRender() {
        if (!this.mRenderChanged.booleanValue()) {
            return false;
        }
        synchronized (this.mRenderChanged) {
            Render effectRender = null;
            Render makeupRender = null;
            Render focusPeakRender = null;
            Render tiltShitRender = null;
            Render gradienterRender = null;
            this.mPreviewSecondRender.clearRenders();
            if (EffectController.getInstance().needDestroyMakeup()) {
                removeCache(FilterInfo.RENDER_ID_MAKEUP);
                EffectController.getInstance().setDestroyMakeup(false);
            }
            if (this.mIsStickerEnabled) {
                if (this.mEffectId != FilterInfo.FILTER_ID_NONE) {
                    effectRender = fetchRender(this.mEffectId);
                    if (effectRender != null) {
                        this.mPreviewSecondRender.addRender(effectRender);
                    }
                }
                Render stickerRender = fetchRender(FilterInfo.FILTER_ID_STICKER);
                if (stickerRender != null) {
                    this.mPreviewSecondRender.addRender(stickerRender);
                }
            } else {
                if (this.mIsMakeupEnabled) {
                    makeupRender = fetchRender(FilterInfo.RENDER_ID_MAKEUP);
                }
                if (this.mEffectId != FilterInfo.FILTER_ID_NONE) {
                    effectRender = fetchRender(this.mEffectId);
                }
                if (this.mIsGradienterEnabled) {
                    gradienterRender = fetchRender(FilterInfo.FILTER_ID_GRADIENTER);
                }
                if (this.mTiltShiftMode != null) {
                    if (CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_circle).equals(this.mTiltShiftMode)) {
                        tiltShitRender = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                    } else if (CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_parallel).equals(this.mTiltShiftMode)) {
                        tiltShitRender = fetchRender(FilterInfo.FILTER_ID_TILTSHIFT);
                    }
                }
                if (this.mIsFocusPeakEnabled) {
                    focusPeakRender = fetchRender(FilterInfo.FILTER_ID_PEAKINGMF);
                }
                if (makeupRender != null && EffectController.getInstance().isBeautyFrameReady()) {
                    this.mPreviewSecondRender.addRender(makeupRender);
                }
                if (effectRender != null) {
                    this.mPreviewSecondRender.addRender(effectRender);
                }
                if (gradienterRender != null) {
                    this.mPreviewSecondRender.addRender(gradienterRender);
                } else if (tiltShitRender != null) {
                    this.mPreviewSecondRender.addRender(tiltShitRender);
                } else if (focusPeakRender != null) {
                    this.mPreviewSecondRender.addRender(focusPeakRender);
                }
            }
            this.mPreviewSecondRender.setFrameBufferSize(this.mPreviewWidth, this.mPreviewHeight);
            this.mRenderChanged = Boolean.valueOf(false);
        }
        return true;
    }
}
