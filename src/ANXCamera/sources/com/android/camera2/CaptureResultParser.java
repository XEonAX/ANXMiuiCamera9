package com.android.camera2;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.CaptureResult.Key;
import android.hardware.camera2.marshal.MarshalRegistry;
import com.android.camera2.AWBFrameControl.MarshalQueryableAWBFrameControl;

public class CaptureResultParser {
    private static final Key<Byte> AI_HDR_DETECTED = new Key("xiaomi.hdr.hdrDetected", Byte.TYPE);
    private static final Key<Integer> AI_SCENE_DETECTED = new Key("xiaomi.ai.asd.sceneDetected", Integer.TYPE);
    private static final Key<Byte> AI_SCENE_ENABLE = new Key("xiaomi.ai.asd.enabled", Byte.TYPE);
    private static final Key<AWBFrameControl> AWB_FRAME_CONTROL = new Key("org.quic.camera2.statsconfigs.AWBFrameControl", AWBFrameControl.class);
    private static final Key<Integer> LENS_DIRTY_DETECTED = new Key("xiaomi.ai.add.lensDirtyDetected", Integer.TYPE);
    private static final String TAG = CaptureResultParser.class.getSimpleName();

    static {
        MarshalRegistry.registerMarshalQueryable(new MarshalQueryableAWBFrameControl());
    }

    public static int getAsdDetectedModes(CaptureResult result) {
        Integer b = (Integer) result.get(AI_SCENE_DETECTED);
        if (b != null) {
            return b.intValue();
        }
        return 0;
    }

    public static int getHDRDetectedScene(CaptureResult result) {
        Byte b = (Byte) result.get(AI_HDR_DETECTED);
        if (b != null) {
            return b.byteValue();
        }
        return 0;
    }

    public static boolean isLensDirtyDetected(CaptureResult result) {
        boolean z = true;
        Integer data = (Integer) result.get(LENS_DIRTY_DETECTED);
        if (data == null) {
            return false;
        }
        if (data.intValue() != 1) {
            z = false;
        }
        return z;
    }

    public static AWBFrameControl getAWBFrameControl(CaptureResult result) {
        return (AWBFrameControl) result.get(AWB_FRAME_CONTROL);
    }
}
