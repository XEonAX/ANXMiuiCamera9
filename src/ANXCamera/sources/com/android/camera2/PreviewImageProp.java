package com.android.camera2;

import android.media.Image;
import com.android.camera.log.Log;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;

public class PreviewImageProp {
    private static final String TAG = PreviewImageProp.class.getSimpleName();
    private byte[] mData;
    private WeakReference<Image> mImage;
    private boolean mReady = false;
    private int mUVStride;
    private int mYLength;
    private int mYStride;

    public PreviewImageProp(Image image) {
        this.mImage = new WeakReference(image);
    }

    public byte[] getData() {
        if (!this.mReady) {
            convert();
        }
        return this.mData;
    }

    public int getYLength() {
        if (!this.mReady) {
            convert();
        }
        return this.mYLength;
    }

    public int getYStride() {
        if (!this.mReady) {
            convert();
        }
        return this.mYStride;
    }

    public int getUVStride() {
        if (!this.mReady) {
            convert();
        }
        return this.mUVStride;
    }

    private void convert() {
        if (this.mImage != null) {
            Image image = (Image) this.mImage.get();
            if (image != null && image.getFormat() == 35) {
                ByteBuffer buffer0 = image.getPlanes()[0].getBuffer();
                ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
                int buffer0_size = buffer0.limit();
                int buffer2_size = buffer2.limit();
                Log.v(TAG, "convertYUV420888ToNV21: " + image.getWidth() + "x" + image.getHeight() + " " + image.getPlanes()[2].getRowStride());
                this.mData = new byte[(buffer0_size + buffer2_size)];
                buffer0.get(this.mData, 0, buffer0_size);
                buffer2.get(this.mData, buffer0_size, buffer2_size);
                this.mYLength = buffer0_size;
                this.mYStride = image.getPlanes()[0].getRowStride();
                this.mUVStride = image.getPlanes()[2].getRowStride();
            }
        }
        this.mImage = null;
        this.mReady = true;
    }

    public static byte[] removePadding(PreviewImageProp image, int width, int height) {
        byte[] previewData = image.getData();
        if (((double) previewData.length) <= ((double) (width * height)) * 1.5d) {
            Log.d(TAG, "removePadding: no padding found in data");
            return previewData;
        }
        int srcPos = 0;
        int destPos = 0;
        byte[] noStrideData = new byte[((int) (((double) (width * height)) * 1.5d))];
        for (int i = 0; i < height; i++) {
            System.arraycopy(previewData, srcPos, noStrideData, destPos, width);
            if (i == height - 1) {
                srcPos += width;
            } else {
                srcPos += image.getYStride();
            }
            destPos += width;
        }
        for (int j = 0; j < height / 2; j++) {
            if (j == (height / 2) - 1) {
                System.arraycopy(previewData, srcPos, noStrideData, destPos, width - 1);
            } else {
                System.arraycopy(previewData, srcPos, noStrideData, destPos, width);
            }
            srcPos += image.getUVStride();
            destPos += width;
        }
        return noStrideData;
    }
}
