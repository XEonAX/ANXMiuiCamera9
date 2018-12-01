package com.android.camera.lib.compatibility.related.v26;

import android.annotation.TargetApi;
import android.graphics.GraphicBuffer;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.MediaRecorder;
import android.os.Build.VERSION;
import android.util.Log;
import java.io.File;
import java.io.IOException;

@TargetApi(26)
public class V26Utils {
    public static void allocGraphicBuffers() {
        GraphicBuffer.create(12800, 2560, 1, 51).destroy();
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, String filePath) {
        if (VERSION.SDK_INT < 26) {
            return false;
        }
        try {
            mediaRecorder.setNextOutputFile(new File(filePath));
            return true;
        } catch (IOException e) {
            Log.e("V26Utils", e.getMessage(), e);
            return false;
        }
    }

    public static void setZsl(Builder request, boolean enable) {
        if (VERSION.SDK_INT >= 26) {
            request.set(CaptureRequest.CONTROL_ENABLE_ZSL, Boolean.valueOf(enable));
        }
    }
}
