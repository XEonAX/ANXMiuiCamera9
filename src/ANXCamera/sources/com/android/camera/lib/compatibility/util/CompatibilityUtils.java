package com.android.camera.lib.compatibility.util;

import android.app.Activity;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.MediaRecorder;
import android.os.Handler;
import android.os.IPowerManager;
import android.text.TextPaint;
import com.android.camera.lib.compatibility.related.screenlight.ScreenLightUtils;
import com.android.camera.lib.compatibility.related.v21.V21Utils;
import com.android.camera.lib.compatibility.related.v23.V23Utils;
import com.android.camera.lib.compatibility.related.v24.V24Utils;
import com.android.camera.lib.compatibility.related.v26.V26Utils;

public class CompatibilityUtils {
    public static final boolean isInMultiWindowMode(Activity activity) {
        return V24Utils.isInMultiWindowMode(activity);
    }

    public static boolean isInVideoCall(Context context) {
        return V23Utils.isInVideoCall(context);
    }

    public static String getSdcardPath(Context context) {
        return V23Utils.getSdcardPath(context);
    }

    public static void setSurfaceTextureOnFrameAvailableListener(SurfaceTexture surfaceTexture, OnFrameAvailableListener listener, Handler handler) {
        V21Utils.setSurfaceTextureOnFrameAvailableListener(surfaceTexture, listener, handler);
    }

    public static void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        V24Utils.pauseMediaRecorder(mediaRecorder);
    }

    public static void resumeMediaRecorder(MediaRecorder mediaRecorder) {
        V24Utils.resumeMediaRecorder(mediaRecorder);
    }

    public static void setTextPaintLetterSpacing(TextPaint paint, float letterSpacing) {
        V21Utils.setTextPaintLetterSpacing(paint, letterSpacing);
    }

    public static void allocGraphicBuffers() {
        V26Utils.allocGraphicBuffers();
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, String filePath) {
        return V26Utils.setNextOutputFile(mediaRecorder, filePath);
    }

    public static void setZsl(Builder request, boolean enable) {
        V26Utils.setZsl(request, enable);
    }

    public static void setBrightnessRampRate(IPowerManager pm, int rate) {
        ScreenLightUtils.setBrightnessRampRate(pm, rate);
    }
}
