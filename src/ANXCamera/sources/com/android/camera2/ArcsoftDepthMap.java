package com.android.camera2;

import android.graphics.Point;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.sensetime.stmobile.STCommon;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ArcsoftDepthMap {
    private static final String TAG = ArcsoftDepthMap.class.getSimpleName();
    @Deprecated
    public static final int TAG_DEPTH_MAP_BLUR_LEVEL = ExifInterface.defineTag(2, (short) -30575);
    @Deprecated
    public static final int TAG_DEPTH_MAP_FOCUS_POINT = ExifInterface.defineTag(2, (short) -30576);
    private byte[] mDepthMapHeader;
    private byte[] mDepthMapOriginalData;

    public ArcsoftDepthMap(byte[] originalData) {
        Log.d(TAG, "ArcsoftDepthMap: " + getHeaderTag(originalData) + "; 0x80 = " + STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
        if (originalData == null || getHeaderTag(originalData) != STCommon.ST_MOBILE_ENABLE_HAND_DETECT) {
            throw new IllegalArgumentException("Not a legal depth format!");
        }
        this.mDepthMapOriginalData = originalData;
        this.mDepthMapHeader = getDepthMapHeader();
    }

    public static boolean isDepthMapData(byte[] data) {
        return data != null && getHeaderTag(data) == STCommon.ST_MOBILE_ENABLE_HAND_DETECT;
    }

    public byte[] getDepthMapHeader() {
        return getBytes(this.mDepthMapOriginalData, 0, getInteger(getBytes(this.mDepthMapOriginalData, 4, 4)));
    }

    public Point getFocusPoint() {
        return new Point(getInteger(getBytes(this.mDepthMapHeader, 8, 4)), getInteger(getBytes(this.mDepthMapHeader, 12, 4)));
    }

    public int getBlurLevel() {
        return getInteger(getBytes(this.mDepthMapHeader, 16, 4));
    }

    public int getDepthMapLength() {
        return getInteger(getBytes(this.mDepthMapHeader, 148, 4));
    }

    public byte[] getDepthMapData() {
        return getBytes(this.mDepthMapOriginalData, 152, getDepthMapLength());
    }

    public byte[] writeDepthExif(byte[] jpeg, byte[] dulWaterMark, byte[] timeWaterMark) {
        OutputStream s = new ByteArrayOutputStream();
        try {
            ExifInterface exif = new ExifInterface();
            exif.readExif(jpeg);
            Point point = getFocusPoint();
            Log.d(TAG, "writeDepthExif: focusPoint: " + point);
            exif.addDepthMapFocusPoint(point);
            int level = getBlurLevel();
            Log.d(TAG, "writeDepthExif: blurLevel: " + level);
            exif.addDepthMapBlurLevel(level);
            if (dulWaterMark != null) {
                exif.addDulCameraWaterMark(dulWaterMark);
            }
            if (timeWaterMark != null) {
                exif.addTimeWaterMark(timeWaterMark);
            }
            exif.writeExif(jpeg, s);
            jpeg = s.toByteArray();
            s.close();
            return jpeg;
        } catch (IOException e) {
            Log.e(ExifInterface.class.getName(), e.getMessage(), e);
            return jpeg;
        }
    }

    private static int getHeaderTag(byte[] originalData) {
        return getInteger(getBytes(originalData, 0, 4));
    }

    private static int getInteger(byte[] bytes) {
        if (bytes.length != 4) {
            throw new IllegalArgumentException("bytes can not covert to a integer value!");
        }
        int value = 0;
        for (int i = 0; i < 4; i++) {
            value += (bytes[i] & 255) << (i * 8);
        }
        return value;
    }

    private static byte[] getBytes(byte[] bytes, int from, int length) {
        if (length <= 0 || from < 0 || length > bytes.length - from) {
            throw new IllegalArgumentException("WRONG ARGUMENT: from =" + from + ", length = " + length);
        }
        byte[] destArray = new byte[length];
        System.arraycopy(bytes, from, destArray, 0, length);
        return destArray;
    }
}
