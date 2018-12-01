package com.android.camera.effect.renders;

import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.StringTexture;

public class NewStyleTextWaterMark extends WaterMark {
    private static final String TAG = NewStyleTextWaterMark.class.getSimpleName();
    private int mCenterX;
    private int mCenterY;
    private int mCharMargin;
    private int mHorizontalPadding;
    private int mPadding;
    private int mVerticalPadding;
    private int mWaterHeight = this.mWaterTexture.getHeight();
    private String mWaterText;
    private BasicTexture mWaterTexture;
    private int mWaterWidth = this.mWaterTexture.getWidth();

    public NewStyleTextWaterMark(String text, int width, int height, int orientation) {
        super(width, height, orientation);
        float ratio = ((float) Math.min(width, height)) / 1080.0f;
        this.mWaterText = text;
        this.mWaterTexture = StringTexture.newInstance(this.mWaterText, 30.079576f * ratio, -1, 2);
        this.mPadding = (int) Math.round(((double) ratio) * 43.687002653d);
        this.mCharMargin = (int) ((((float) this.mWaterHeight) * 0.13f) / 2.0f);
        this.mHorizontalPadding = this.mPadding & -2;
        this.mVerticalPadding = (this.mPadding - this.mCharMargin) & -2;
        calcCenterAxis();
        if (Util.sIsDumpLog) {
            print();
        }
    }

    private void calcCenterAxis() {
        switch (this.mOrientation) {
            case 0:
                this.mCenterX = (this.mPictureWidth - this.mHorizontalPadding) - (this.mWaterWidth / 2);
                this.mCenterY = (this.mPictureHeight - this.mVerticalPadding) - (this.mWaterHeight / 2);
                return;
            case 90:
                this.mCenterX = (this.mPictureWidth - this.mVerticalPadding) - (this.mWaterHeight / 2);
                this.mCenterY = this.mHorizontalPadding + (this.mWaterWidth / 2);
                return;
            case 180:
                this.mCenterX = this.mHorizontalPadding + (this.mWaterWidth / 2);
                this.mCenterY = this.mVerticalPadding + (this.mWaterHeight / 2);
                return;
            case 270:
                this.mCenterX = this.mVerticalPadding + (this.mWaterHeight / 2);
                this.mCenterY = (this.mPictureHeight - this.mHorizontalPadding) - (this.mWaterWidth / 2);
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
        return this.mWaterWidth;
    }

    public int getHeight() {
        return this.mWaterHeight;
    }

    public BasicTexture getTexture() {
        return this.mWaterTexture;
    }

    private void print() {
        Log.v(TAG, "WaterMark mPictureWidth=" + this.mPictureWidth + " mPictureHeight =" + this.mPictureHeight + " mWaterText=" + this.mWaterText + " mCenterX=" + this.mCenterX + " mCenterY=" + this.mCenterY + " mWaterWidth=" + this.mWaterWidth + " mWaterHeight=" + this.mWaterHeight + " mPadding=" + this.mPadding);
    }
}
