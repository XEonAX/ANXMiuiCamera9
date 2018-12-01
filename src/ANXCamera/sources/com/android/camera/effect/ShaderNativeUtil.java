package com.android.camera.effect;

import com.android.camera.log.Log;

public class ShaderNativeUtil {
    private static native byte[] getJpegPicture(int i, int i2, int i3, int i4, int i5);

    private static native int[] initJpegTexture(byte[] bArr, int i, int i2);

    static {
        try {
            System.loadLibrary("CameraEffectJNI");
        } catch (Throwable e) {
            Log.e("ShaderNativeUtil", "ShaderNativeUtil load CameraEffectJNI.so failed.", e);
        }
    }

    public static int[] initTexture(byte[] data, int texId, int downScale) {
        return initJpegTexture(data, texId, downScale);
    }

    public static byte[] getPicture(int x, int y, int w, int h, int quality) {
        return getJpegPicture(x, y, w, h, quality);
    }
}
