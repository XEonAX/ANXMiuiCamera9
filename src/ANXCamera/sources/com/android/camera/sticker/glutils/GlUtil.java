package com.android.camera.sticker.glutils;

import android.opengl.GLES20;
import com.android.camera.log.Log;

public class GlUtil {
    private GlUtil() {
    }

    public static int initEffectTexture(int width, int height, int[] textureId, int type) {
        GLES20.glGenTextures(1, textureId, 0);
        GLES20.glBindTexture(type, textureId[0]);
        GLES20.glTexParameterf(type, 10240, 9729.0f);
        GLES20.glTexParameterf(type, 10241, 9729.0f);
        GLES20.glTexParameterf(type, 10242, 33071.0f);
        GLES20.glTexParameterf(type, 10243, 33071.0f);
        GLES20.glTexImage2D(type, 0, 6408, width, height, 0, 6408, 5121, null);
        return textureId[0];
    }

    public static void checkGlError(String op) {
        int error = GLES20.glGetError();
        if (error != 0) {
            String msg = op + ": glError 0x" + Integer.toHexString(error);
            Log.e("GlDemoUtil", msg);
            throw new RuntimeException(msg);
        }
    }
}
