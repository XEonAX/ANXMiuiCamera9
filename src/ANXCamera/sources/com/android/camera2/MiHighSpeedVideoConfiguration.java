package com.android.camera2;

import android.util.Range;
import android.util.Size;
import java.util.ArrayList;
import java.util.List;

public class MiHighSpeedVideoConfiguration {
    private final int mBatchSizeMax;
    private final int mFpsMax;
    private final int mFpsMin;
    private final Range<Integer> mFpsRange;
    private final int mHeight;
    private final Size mSize;
    private final int mWidth;

    public static List<MiHighSpeedVideoConfiguration> unmarshal(int[] buffer, int count) {
        if (buffer == null || buffer.length == 0) {
            throw new IllegalArgumentException("empty buffer");
        } else if (buffer.length < count * 5) {
            throw new IllegalArgumentException("invalid buffer length " + buffer.length);
        } else {
            List<MiHighSpeedVideoConfiguration> configurations = new ArrayList(count);
            int i = 0;
            int index = 0;
            while (i < count) {
                int index2 = index + 1;
                int width = buffer[index];
                index = index2 + 1;
                int height = buffer[index2];
                index2 = index + 1;
                int fpsMin = buffer[index];
                index = index2 + 1;
                int fpsMax = buffer[index2];
                index2 = index + 1;
                configurations.add(new MiHighSpeedVideoConfiguration(width, height, fpsMin, fpsMax, buffer[index]));
                i++;
                index = index2;
            }
            return configurations;
        }
    }

    private MiHighSpeedVideoConfiguration(int width, int height, int fpsMin, int fpsMax, int batchSizeMax) {
        if (fpsMax < 120) {
            throw new IllegalArgumentException("fpsMax must be at least 120");
        }
        this.mFpsMax = fpsMax;
        this.mWidth = checkArgumentPositive(width, "width must be positive");
        this.mHeight = checkArgumentPositive(height, "height must be positive");
        this.mFpsMin = checkArgumentPositive(fpsMin, "fpsMin must be positive");
        this.mSize = new Size(this.mWidth, this.mHeight);
        this.mBatchSizeMax = checkArgumentPositive(batchSizeMax, "batchSizeMax must be positive");
        this.mFpsRange = new Range(Integer.valueOf(this.mFpsMin), Integer.valueOf(this.mFpsMax));
    }

    public Size getSize() {
        return this.mSize;
    }

    public Range<Integer> getFpsRange() {
        return this.mFpsRange;
    }

    private static int checkArgumentPositive(int value, String errorMessage) {
        if (value > 0) {
            return value;
        }
        throw new IllegalArgumentException(errorMessage);
    }
}
