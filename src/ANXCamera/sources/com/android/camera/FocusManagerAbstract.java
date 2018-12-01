package com.android.camera;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.v7.recyclerview.R;
import com.android.camera.log.Log;

public abstract class FocusManagerAbstract {
    protected final int FOCUS_AREA_HEIGHT = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_height);
    protected final float FOCUS_AREA_SCALE = 1.0f;
    protected final int FOCUS_AREA_WIDTH = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_width);
    protected final float METERING_AREA_SCALE = 1.8f;
    protected boolean mCancelAutoFocusIfMove;
    protected int mDisplayOrientation;
    protected boolean mInitialized = false;
    protected Matrix mMatrix = new Matrix();
    protected boolean mMirror;
    protected int mPreviewHeight;
    protected int mPreviewWidth;
    protected int mRenderHeight;
    protected int mRenderWidth;
    protected int mState = 0;

    protected void setMatrix() {
        if (this.mPreviewWidth != 0 && this.mPreviewHeight != 0) {
            Matrix matrix = new Matrix();
            Util.prepareMatrix(matrix, this.mMirror, this.mDisplayOrientation, this.mRenderWidth, this.mRenderHeight, Math.round(((float) this.mPreviewWidth) / 2.0f), Math.round(((float) this.mPreviewHeight) / 2.0f));
            matrix.invert(this.mMatrix);
            this.mInitialized = true;
        }
    }

    public void setRenderSize(int width, int height) {
        if (width != this.mRenderWidth || height != this.mRenderHeight) {
            this.mRenderWidth = width;
            this.mRenderHeight = height;
            Log.e("focus setRenderSize: ", this.mRenderWidth + " | " + this.mRenderHeight);
            setMatrix();
        }
    }

    protected void calculateTapArea(int focusWidth, int focusHeight, float areaMultiple, int x, int y, int previewWidth, int previewHeight, Rect rect) {
        int areaWidth = (int) (((float) focusWidth) * areaMultiple);
        int areaHeight = (int) (((float) focusHeight) * areaMultiple);
        int left = Util.clamp(x - (areaWidth / 2), 0, previewWidth - areaWidth);
        int top = Util.clamp(y - (areaHeight / 2), 0, previewHeight - areaHeight);
        RectF rectF = new RectF((float) left, (float) top, (float) (left + areaWidth), (float) (top + areaHeight));
        this.mMatrix.mapRect(rectF);
        Util.rectFToRect(rectF, rect);
    }

    protected Rect convertToCamera2Coordinates(Rect camera1Region, Rect cropRegion) {
        Matrix matrix2 = new Matrix();
        matrix2.preTranslate(((float) (-cropRegion.width())) / 2.0f, ((float) (-cropRegion.height())) / 2.0f);
        matrix2.postScale(2000.0f / ((float) cropRegion.width()), 2000.0f / ((float) cropRegion.height()));
        matrix2.invert(matrix2);
        RectF rectF = new RectF(camera1Region);
        matrix2.mapRect(rectF);
        Rect camera2Region = new Rect();
        Util.rectFToRect(rectF, camera2Region);
        camera2Region.left = Util.clamp(camera2Region.left, cropRegion.left, cropRegion.right);
        camera2Region.top = Util.clamp(camera2Region.top, cropRegion.top, cropRegion.bottom);
        camera2Region.right = Util.clamp(camera2Region.right, cropRegion.left, cropRegion.right);
        camera2Region.bottom = Util.clamp(camera2Region.bottom, cropRegion.top, cropRegion.bottom);
        return camera2Region;
    }

    public void setMirror(boolean mirror) {
        this.mMirror = mirror;
        setMatrix();
    }

    public void setDisplayOrientation(int displayOrientation) {
        this.mDisplayOrientation = displayOrientation;
        setMatrix();
    }
}
