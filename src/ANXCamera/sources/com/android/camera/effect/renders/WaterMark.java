package com.android.camera.effect.renders;

import com.android.gallery3d.ui.BasicTexture;

abstract class WaterMark {
    protected int mOrientation;
    protected int mPictureHeight;
    protected int mPictureWidth;

    public abstract int getCenterX();

    public abstract int getCenterY();

    public abstract int getHeight();

    public abstract BasicTexture getTexture();

    public abstract int getWidth();

    public WaterMark(int width, int height, int orientation) {
        this.mPictureWidth = width;
        this.mPictureHeight = height;
        this.mOrientation = orientation;
    }

    public int getLeft() {
        return getCenterX() - (getWidth() / 2);
    }

    public int getTop() {
        return getCenterY() - (getHeight() / 2);
    }
}
