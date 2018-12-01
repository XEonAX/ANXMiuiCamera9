package com.miui.filtersdk.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;

public class OpenGlUtils {
    public static int loadTexture(Context context, String name) {
        int[] textureHandle = new int[1];
        GLES20.glGenTextures(1, textureHandle, 0);
        if (textureHandle[0] != 0) {
            Bitmap bitmap = getImageFromAssetsFile(context, name);
            GLES20.glBindTexture(3553, textureHandle[0]);
            GLES20.glTexParameteri(3553, 10240, 9729);
            GLES20.glTexParameteri(3553, 10241, 9729);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
            bitmap.recycle();
        }
        if (textureHandle[0] != 0) {
            return textureHandle[0];
        }
        Log.e("OpenGlUtils", String.format("loadTexture failed,path:%s", new Object[]{name}));
        return -1;
    }

    public static Bitmap getImageFromAssetsFile(Context context, String fileName) {
        Bitmap image = null;
        InputStream is = null;
        try {
            is = context.getResources().getAssets().open(fileName);
            image = BitmapFactory.decodeStream(is);
            is.close();
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e2) {
            e2.printStackTrace();
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e22) {
                    e22.printStackTrace();
                }
            }
        } catch (Throwable th) {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e222) {
                    e222.printStackTrace();
                }
            }
        }
        return image;
    }

    public static int loadProgram(String strVSource, String strFSource) {
        int[] link = new int[1];
        int iVShader = loadShader(strVSource, 35633);
        if (iVShader != 0) {
            int iFShader = loadShader(strFSource, 35632);
            if (iFShader != 0) {
                int iProgId = GLES20.glCreateProgram();
                GLES20.glAttachShader(iProgId, iVShader);
                GLES20.glAttachShader(iProgId, iFShader);
                GLES20.glLinkProgram(iProgId);
                GLES20.glGetProgramiv(iProgId, 35714, link, 0);
                if (link[0] > 0) {
                    GLES20.glDeleteShader(iVShader);
                    GLES20.glDeleteShader(iFShader);
                    return iProgId;
                }
                Log.d("Load Program", "Linking Failed");
                return 0;
            }
            Log.d("Load Program", "Fragment Shader Failed");
            return 0;
        }
        Log.d("Load Program", "Vertex Shader Failed");
        return 0;
    }

    private static int loadShader(String strSource, int iType) {
        int[] compiled = new int[1];
        int iShader = GLES20.glCreateShader(iType);
        GLES20.glShaderSource(iShader, strSource);
        GLES20.glCompileShader(iShader);
        GLES20.glGetShaderiv(iShader, 35713, compiled, 0);
        if (compiled[0] != 0) {
            return iShader;
        }
        Log.e("Load Shader Failed", "Compilation\n" + GLES20.glGetShaderInfoLog(iShader));
        return 0;
    }
}
