package com.android.camera;

import android.os.SystemClock;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;

public class SwitchAnimManager {
    private long mAnimStartTime;
    private float mExtScale = 1.0f;
    private Interpolator mInterpolator = new AccelerateDecelerateInterpolator();
    private boolean mMoveBack;
    private boolean mNewPreview;
    private int mPreviewFrameLayoutWidth;
    private boolean mRecurBlur;
    private int mReviewDrawingHeight;
    private int mReviewDrawingWidth;
    private int mReviewDrawingX;
    private int mReviewDrawingY;

    public void setReviewDrawingSize(int x, int y, int width, int height) {
        this.mReviewDrawingX = x;
        this.mReviewDrawingY = y;
        this.mReviewDrawingWidth = width;
        this.mReviewDrawingHeight = height;
        this.mMoveBack = CameraSettings.isBackCamera();
        this.mNewPreview = false;
    }

    public void setPreviewFrameLayoutSize(int width, int height) {
        this.mPreviewFrameLayoutWidth = width;
        if (width == 0) {
            Log.e("SwitchAnimManager", "invalid preview frame width", new RuntimeException());
        }
    }

    public void startAnimation() {
        Log.v("SwitchAnimManager", "startAnimation");
        this.mAnimStartTime = SystemClock.uptimeMillis();
        this.mRecurBlur = true;
    }

    public void clearAnimation() {
        this.mAnimStartTime = 0;
        this.mRecurBlur = false;
    }

    public void startResume() {
        Log.v("SwitchAnimManager", "startResume");
        this.mNewPreview = true;
        this.mRecurBlur = false;
    }

    private boolean drawAnimationBlend(GLCanvas canvas, int x, int y, int width, int height, CameraScreenNail preview, RawTexture review) {
        if (this.mNewPreview) {
            return false;
        }
        boolean result = true;
        long timeDiff = SystemClock.uptimeMillis() - this.mAnimStartTime;
        if (((float) timeDiff) > 300.0f) {
            result = false;
            timeDiff = 300;
        }
        if (!result && this.mRecurBlur) {
            this.mRecurBlur = false;
        }
        drawBlurTexture(canvas, x, y, width, height, preview, this.mInterpolator.getInterpolation(((float) timeDiff) / 300.0f));
        return result;
    }

    private void drawBlurTexture(GLCanvas canvas, int x, int y, int width, int height, CameraScreenNail preview, float fraction) {
        if (this.mRecurBlur) {
            preview.renderBlurTexture(canvas);
        }
        canvas.getState().pushState();
        preview.drawBlurTexture(canvas, this.mReviewDrawingX, this.mReviewDrawingY, this.mReviewDrawingWidth, this.mReviewDrawingHeight);
        canvas.getState().popState();
    }

    public boolean drawPreview(GLCanvas canvas, int x, int y, int width, int height, RawTexture review) {
        float centerX = ((float) x) + (((float) width) / 2.0f);
        float centerY = ((float) y) + (((float) height) / 2.0f);
        float scaleRatio = 1.0f;
        if (this.mPreviewFrameLayoutWidth != 0) {
            scaleRatio = ((float) width) / ((float) this.mPreviewFrameLayoutWidth);
        } else {
            Log.e("SwitchAnimManager", "previewFrameLayoutWidth=0");
        }
        float reviewWidth = ((float) this.mReviewDrawingWidth) * scaleRatio;
        float reviewHeight = ((float) this.mReviewDrawingHeight) * scaleRatio;
        int reviewX = Math.round(centerX - (reviewWidth / 2.0f));
        int reviewY = Math.round(centerY - (reviewHeight / 2.0f));
        float alpha = canvas.getState().getAlpha();
        review.draw(canvas, reviewX, reviewY, Math.round(reviewWidth), Math.round(reviewHeight));
        canvas.getState().setAlpha(alpha);
        return true;
    }

    public boolean drawAnimation(GLCanvas canvas, int x, int y, int width, int height, CameraScreenNail preview, RawTexture review) {
        return drawAnimationBlend(canvas, x, y, width, height, preview, review);
    }

    public float getExtScaleX() {
        return this.mExtScale;
    }

    public float getExtScaleY() {
        return this.mExtScale;
    }
}
