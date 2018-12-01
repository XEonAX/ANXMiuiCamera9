package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.BitmapTexture;

class ImageWaterMark extends WaterMark {
    private int mCenterX;
    private int mCenterY;
    private int mHeight;
    private BitmapTexture mImageTexture;
    private int mPaddingX;
    private int mPaddingY;
    private int mWidth;

    public ImageWaterMark(Bitmap image, int width, int height, int orientation, float sizeRatio, float paddingXRation, float padddingYRatio) {
        super(width, height, orientation);
        float ratio = ((float) Math.min(width, height)) / 1080.0f;
        this.mHeight = Math.round(sizeRatio * ratio) & -2;
        this.mWidth = ((this.mHeight * image.getWidth()) / image.getHeight()) & -2;
        this.mPaddingX = Math.round(paddingXRation * ratio) & -2;
        this.mPaddingY = Math.round(padddingYRatio * ratio) & -2;
        this.mImageTexture = new BitmapTexture(image);
        this.mImageTexture.setOpaque(false);
        calcCenterAxis();
    }

    private void calcCenterAxis() {
        switch (this.mOrientation) {
            case 0:
                this.mCenterX = this.mPaddingX + (getWidth() / 2);
                this.mCenterY = (this.mPictureHeight - this.mPaddingY) - (getHeight() / 2);
                return;
            case 90:
                this.mCenterX = (this.mPictureWidth - this.mPaddingY) - (getHeight() / 2);
                this.mCenterY = (this.mPictureHeight - this.mPaddingX) - (getWidth() / 2);
                return;
            case 180:
                this.mCenterX = (this.mPictureWidth - this.mPaddingX) - (getWidth() / 2);
                this.mCenterY = this.mPaddingY + (getHeight() / 2);
                return;
            case 270:
                this.mCenterX = this.mPaddingY + (getHeight() / 2);
                this.mCenterY = this.mPaddingX + (getWidth() / 2);
                return;
            default:
                return;
        }
    }

    public int getCenterX() {
        return this.mCenterX;
    }

    public int getCenterY() {
        return this.mCenterY;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public BasicTexture getTexture() {
        return this.mImageTexture;
    }
}
