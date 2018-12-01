package com.miui.filtersdk.utils;

public enum Rotation {
    NORMAL,
    ROTATION_90,
    ROTATION_180,
    ROTATION_270;

    public static Rotation fromInt(int rotation) {
        switch (rotation) {
            case 0:
                return NORMAL;
            case 90:
                return ROTATION_90;
            case 180:
                return ROTATION_180;
            case 270:
                return ROTATION_270;
            case 360:
                return NORMAL;
            default:
                throw new IllegalStateException(rotation + " is an unknown rotation. Needs to be either 0, 90, 180 or 270!");
        }
    }
}
