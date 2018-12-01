package com.android.camera.effect.renders;

import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.StringTexture;
import com.sensetime.stmobile.STCommon;

class TextWaterMark extends WaterMark {
    private static final String TAG = TextWaterMark.class.getSimpleName();
    private final int[][] PIC_WIDTHS = new int[][]{new int[]{0, 149}, new int[]{150, 239}, new int[]{240, 279}, new int[]{280, 400}, new int[]{401, 1439}, new int[]{1440, 1511}, new int[]{1512, 1799}, new int[]{1800, 1899}, new int[]{1900, 2299}, new int[]{2300, 3120}, new int[]{3121, 4000}};
    private final int[][] WATERMARK_FONT_SIZES = new int[][]{new int[]{5, 4, 2, 4, 3, 7}, new int[]{8, 6, 2, 6, 3, 7}, new int[]{11, 6, 5, 6, 5, 12}, new int[]{12, 7, 5, 7, 5, 12}, new int[]{50, 32, 11, 31, 20, 47}, new int[]{58, 36, 19, 38, 24, 55}, new int[]{65, 41, 24, 42, 27, 63}, new int[]{80, 50, 24, 50, 32, 75}, new int[]{83, 52, 25, 52, 33, 78}, new int[]{104, 65, 33, 65, 42, 98}, new int[]{STCommon.ST_MOBILE_ENABLE_HAND_DETECT, 80, 40, 80, 48, 132}};
    private int mCenterX;
    private int mCenterY;
    private int mCharMargin;
    private int mFontIndex;
    private int mPadding;
    private int mWaterHeight;
    private String mWaterText;
    private BasicTexture mWaterTexture;
    private int mWaterWidth;

    public TextWaterMark(String text, int width, int height, int orientation) {
        super(width, height, orientation);
        this.mWaterText = text;
        this.mWaterTexture = StringTexture.newInstance(this.mWaterText, 144.0f, -262152, 0.0f, false, 1);
        this.mFontIndex = getFontIndex(width, height);
        this.mWaterWidth = getWaterMarkWidth(this.mWaterText, this.mFontIndex);
        this.mWaterHeight = (int) (((float) this.WATERMARK_FONT_SIZES[this.mFontIndex][0]) / 0.82f);
        this.mPadding = this.WATERMARK_FONT_SIZES[this.mFontIndex][5];
        this.mCharMargin = (int) ((((float) this.mWaterHeight) * 0.18f) / 2.0f);
        calcCenterAxis();
        if (Util.sIsDumpLog) {
            print();
        }
    }

    private int getFontIndex(int width, int height) {
        int shotL = Math.min(width, height);
        int index = this.WATERMARK_FONT_SIZES.length - 1;
        int i = 0;
        while (i < this.PIC_WIDTHS.length) {
            if (shotL >= this.PIC_WIDTHS[i][0] && shotL <= this.PIC_WIDTHS[i][1]) {
                return i;
            }
            i++;
        }
        return index;
    }

    private int getWaterMarkWidth(String text, int index) {
        int dw = this.WATERMARK_FONT_SIZES[index][1];
        int mw = this.WATERMARK_FONT_SIZES[index][2];
        int sw = this.WATERMARK_FONT_SIZES[index][3];
        int cw = this.WATERMARK_FONT_SIZES[index][4];
        int length = 0;
        for (char c : text.toCharArray()) {
            if (c >= '0' && c <= '9') {
                length += dw;
            } else if (c == ':') {
                length += cw;
            } else if (c == '-') {
                length += mw;
            } else if (c == ' ') {
                length += sw;
            }
        }
        return length;
    }

    private void calcCenterAxis() {
        switch (this.mOrientation) {
            case 0:
                this.mCenterX = (this.mPictureWidth - this.mPadding) - (this.mWaterWidth / 2);
                this.mCenterY = ((this.mPictureHeight - this.mPadding) - (this.mWaterHeight / 2)) + this.mCharMargin;
                return;
            case 90:
                this.mCenterX = ((this.mPictureWidth - this.mPadding) - (this.mWaterHeight / 2)) + this.mCharMargin;
                this.mCenterY = this.mPadding + (this.mWaterWidth / 2);
                return;
            case 180:
                this.mCenterX = this.mPadding + (this.mWaterWidth / 2);
                this.mCenterY = (this.mPadding + (this.mWaterHeight / 2)) - this.mCharMargin;
                return;
            case 270:
                this.mCenterX = (this.mPadding + (this.mWaterHeight / 2)) - this.mCharMargin;
                this.mCenterY = (this.mPictureHeight - this.mPadding) - (this.mWaterWidth / 2);
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
        Log.v(TAG, "WaterMark mPictureWidth=" + this.mPictureWidth + " mPictureHeight =" + this.mPictureHeight + " mWaterText=" + this.mWaterText + " mFontIndex=" + this.mFontIndex + " mCenterX=" + this.mCenterX + " mCenterY=" + this.mCenterY + " mWaterWidth=" + this.mWaterWidth + " mWaterHeight=" + this.mWaterHeight + " mPadding=" + this.mPadding);
    }
}
