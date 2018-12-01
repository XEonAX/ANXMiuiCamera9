package com.android.camera.lib.compatibility.related.v21;

import android.annotation.TargetApi;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.os.Handler;
import android.text.TextPaint;

@TargetApi(21)
public class V21Utils {
    public static void setSurfaceTextureOnFrameAvailableListener(SurfaceTexture surfaceTexture, OnFrameAvailableListener listener, Handler handler) {
        surfaceTexture.setOnFrameAvailableListener(listener, handler);
    }

    public static void setTextPaintLetterSpacing(TextPaint paint, float letterSpacing) {
        paint.setLetterSpacing(letterSpacing);
    }
}
