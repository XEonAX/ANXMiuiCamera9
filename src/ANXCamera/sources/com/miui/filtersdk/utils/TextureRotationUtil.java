package com.miui.filtersdk.utils;

import java.nio.FloatBuffer;

public class TextureRotationUtil {
    public static final float[] CUBE = new float[]{-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    public static final float[] TEXTURE_NO_ROTATION = new float[]{0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    public static final float[] TEXTURE_ROTATED_180 = new float[]{1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f};
    public static final float[] TEXTURE_ROTATED_270 = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f, 1.0f};
    public static final float[] TEXTURE_ROTATED_90 = new float[]{1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f};

    /* renamed from: com.miui.filtersdk.utils.TextureRotationUtil$1 */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$miui$filtersdk$utils$Rotation = new int[Rotation.values().length];

        static {
            try {
                $SwitchMap$com$miui$filtersdk$utils$Rotation[Rotation.ROTATION_90.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$utils$Rotation[Rotation.ROTATION_180.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$utils$Rotation[Rotation.ROTATION_270.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$miui$filtersdk$utils$Rotation[Rotation.NORMAL.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    private TextureRotationUtil() {
    }

    public static float[] getRotation(Rotation rotation, boolean flipHorizontal, boolean flipVertical) {
        float[] rotatedTex;
        switch (AnonymousClass1.$SwitchMap$com$miui$filtersdk$utils$Rotation[rotation.ordinal()]) {
            case 1:
                rotatedTex = TEXTURE_ROTATED_90;
                break;
            case 2:
                rotatedTex = TEXTURE_ROTATED_180;
                break;
            case 3:
                rotatedTex = TEXTURE_ROTATED_270;
                break;
            default:
                rotatedTex = TEXTURE_NO_ROTATION;
                break;
        }
        if (flipHorizontal) {
            rotatedTex = new float[]{flip(rotatedTex[0]), rotatedTex[1], flip(rotatedTex[2]), rotatedTex[3], flip(rotatedTex[4]), rotatedTex[5], flip(rotatedTex[6]), rotatedTex[7]};
        }
        if (!flipVertical) {
            return rotatedTex;
        }
        return new float[]{rotatedTex[0], flip(rotatedTex[1]), rotatedTex[2], flip(rotatedTex[3]), rotatedTex[4], flip(rotatedTex[5]), rotatedTex[6], flip(rotatedTex[7])};
    }

    private static float flip(float i) {
        if (i == 0.0f) {
            return 1.0f;
        }
        return 0.0f;
    }

    public static void adjustSize(int rotation, boolean flipHorizontal, boolean flipVertical, FloatBuffer gLCubeBuffer, FloatBuffer gLTextureBuffer) {
        float[] textureCords = getRotation(Rotation.fromInt(rotation), flipHorizontal, flipVertical);
        float[] cube = CUBE;
        gLCubeBuffer.clear();
        gLCubeBuffer.put(cube).position(0);
        gLTextureBuffer.clear();
        gLTextureBuffer.put(textureCords).position(0);
    }
}
