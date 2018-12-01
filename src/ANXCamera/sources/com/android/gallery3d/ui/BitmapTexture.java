package com.android.gallery3d.ui;

import android.graphics.Bitmap;

public class BitmapTexture extends UploadedTexture {
    protected Bitmap mContentBitmap;

    public BitmapTexture(Bitmap bitmap) {
        this(bitmap, false);
    }

    private BitmapTexture(Bitmap bitmap, boolean hasBorder) {
        super(hasBorder);
        Utils.assertTrue(bitmap != null ? bitmap.isRecycled() ^ 1 : false);
        this.mContentBitmap = bitmap;
    }

    protected void onFreeBitmap(Bitmap bitmap) {
    }

    protected Bitmap onGetBitmap() {
        return this.mContentBitmap;
    }
}
