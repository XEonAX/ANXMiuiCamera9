package com.android.camera.constant;

public class UpdateConstant {
    @UpdateType
    public static final int[] AI_SCENE_CONFIG = new int[]{13, 11, 28, 34, 27, 20, 26, 30, 16};
    @UpdateType
    public static final int[] CAMERA_TYPES_INIT = new int[]{1, 2, 26, 27, 28, 29};
    @UpdateType
    public static final int[] CAMERA_TYPES_MANUALLY = new int[]{6, 16, 15};
    @UpdateType
    public static final int[] CAMERA_TYPES_ON_PREVIEW_SUCCESS = new int[]{7, 8, 10, 11, 14, 19, 4, 13, 5, 9, 20, 21, 22, 34, 23, 25, 36, 37};
    @UpdateType
    public static final int[] FUN_TYPES_INIT = new int[]{1, 2, 29};
    @UpdateType
    public static final int[] FUN_TYPES_ON_PREVIEW_SUCCESS = new int[]{5, 9, 10, 14, 25, 31, 19};
    @UpdateType
    public static final int[] PANORAMA_ON_PREVIEW_SUCCESS = new int[]{32};
    @UpdateType
    public static final int[] PANORAMA_TYPES_INIT = new int[]{1};
    @UpdateType
    public static final int[] VIDEO_TYPES_INIT = new int[]{1, 29};
    @UpdateType
    public static final int[] VIDEO_TYPES_ON_PREVIEW_SUCCESS = new int[]{5, 9, 10, 14, 25, 31};
    @UpdateType
    public static final int[] VIDEO_TYPES_RECORD = new int[]{19, 31, 33};

    public @interface UpdateType {
    }
}
