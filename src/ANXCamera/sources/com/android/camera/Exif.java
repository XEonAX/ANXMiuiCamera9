package com.android.camera;

import com.android.camera.log.Log;

public class Exif {
    public static int getOrientation(byte[] jpeg) {
        if (jpeg == null) {
            return 0;
        }
        int offset = 0;
        int length = 0;
        while (offset + 3 < jpeg.length) {
            int offset2 = offset + 1;
            if ((jpeg[offset] & 255) != 255) {
                offset = offset2;
                break;
            }
            int marker = jpeg[offset2] & 255;
            if (marker != 255) {
                offset = offset2 + 1;
                if (!(marker == 216 || marker == 1)) {
                    if (marker != 217 && marker != 218) {
                        length = pack(jpeg, offset, 2, false);
                        if (length >= 2 && offset + length <= jpeg.length) {
                            if (marker == 225 && length >= 8 && pack(jpeg, offset + 2, 4, false) == 1165519206 && pack(jpeg, offset + 6, 2, false) == 0) {
                                offset += 8;
                                length -= 8;
                                break;
                            }
                            offset += length;
                            length = 0;
                        } else {
                            Log.e("CameraExif", "Invalid length");
                            return 0;
                        }
                    }
                    break;
                }
            }
            offset = offset2;
        }
        if (length > 8) {
            int tag = pack(jpeg, offset, 4, false);
            if (tag == 1229531648 || tag == 1296891946) {
                boolean littleEndian = tag == 1229531648;
                int count = pack(jpeg, offset + 4, 4, littleEndian) + 2;
                if (count >= 10 && count <= length) {
                    offset += count;
                    length -= count;
                    count = pack(jpeg, offset - 2, 2, littleEndian);
                    while (true) {
                        int count2 = count;
                        count = count2 - 1;
                        if (count2 <= 0 || length < 12) {
                            break;
                        } else if (pack(jpeg, offset, 2, littleEndian) == 274) {
                            switch (pack(jpeg, offset + 8, 2, littleEndian)) {
                                case 1:
                                    return 0;
                                case 3:
                                    return 180;
                                case 6:
                                    return 90;
                                case 8:
                                    return 270;
                                default:
                                    Log.i("CameraExif", "Unsupported orientation");
                                    return 0;
                            }
                        } else {
                            offset += 12;
                            length -= 12;
                        }
                    }
                } else {
                    Log.e("CameraExif", "Invalid offset");
                    return 0;
                }
            }
            Log.e("CameraExif", "Invalid byte order");
            return 0;
        }
        Log.i("CameraExif", "Orientation not found");
        return 0;
    }

    private static int pack(byte[] bytes, int offset, int length, boolean littleEndian) {
        int step = 1;
        if (littleEndian) {
            offset += length - 1;
            step = -1;
        }
        int value = 0;
        while (true) {
            int length2 = length;
            length = length2 - 1;
            if (length2 <= 0) {
                return value;
            }
            value = (value << 8) | (bytes[offset] & 255);
            offset += step;
        }
    }
}
