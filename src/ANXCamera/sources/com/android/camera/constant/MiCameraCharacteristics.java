package com.android.camera.constant;

import android.hardware.camera2.CameraCharacteristics.Key;

public class MiCameraCharacteristics {
    public static final Key<int[]> EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS = new Key("org.codeaurora.qcamera3.additional_hfr_video_sizes.hfr_video_size", int[].class);
    public static final Key<Integer> EXTRA_HIGH_SPEED_VIDEO_NUMBER = new Key("org.codeaurora.qcamera3.additional_hfr_video_sizes.valid_number", Integer.class);
    public static Key<Byte> IS_QCFA_SENSOR = new Key("org.codeaurora.qcamera3.quadra_cfa.is_qcfa_sensor", Byte.class);
}
