package com.android.camera;

import android.support.annotation.NonNull;

public class CameraSize implements Comparable<CameraSize> {
    public int height;
    public int width;

    public CameraSize(String value) {
        parseString(value);
    }

    public void parseString(String value) {
        int index = value == null ? -1 : value.indexOf(120);
        if (index == -1) {
            this.width = 0;
            this.height = 0;
            return;
        }
        this.width = Integer.parseInt(value.substring(0, index));
        this.height = Integer.parseInt(value.substring(index + 1));
    }

    public CameraSize(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public CameraSize parseSize(CameraSize cameraSize) {
        this.width = cameraSize.width;
        this.height = cameraSize.height;
        return this;
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public boolean equals(Object o) {
        boolean z = true;
        if (o == null) {
            return false;
        }
        if (this == o) {
            return true;
        }
        if (!(o instanceof CameraSize)) {
            return false;
        }
        CameraSize cameraSize = (CameraSize) o;
        if (!(this.width == cameraSize.width && this.height == cameraSize.height)) {
            z = false;
        }
        return z;
    }

    public String toString() {
        return this.width + "x" + this.height;
    }

    public int hashCode() {
        return this.height ^ ((this.width << 16) | (this.width >>> 16));
    }

    public int compareTo(@NonNull CameraSize another) {
        return (this.width * this.height) - (another.width * another.height);
    }

    public boolean isEmpty() {
        return this.width * this.height <= 0;
    }

    public int area() {
        return isEmpty() ? 0 : this.width * this.height;
    }

    public boolean isAspectRatio18_9() {
        if (isEmpty()) {
            return false;
        }
        return CameraSettings.isAspectRatio18_9(this.width, this.height);
    }

    public boolean isAspectRatio16_9() {
        if (isEmpty()) {
            return false;
        }
        return CameraSettings.isAspectRatio16_9(this.width, this.height);
    }

    public boolean isAspectRatio4_3() {
        if (isEmpty()) {
            return false;
        }
        return CameraSettings.isAspectRatio4_3(this.width, this.height);
    }

    public boolean isAspectRatio1_1() {
        if (isEmpty()) {
            return false;
        }
        return CameraSettings.isAspectRatio1_1(this.width, this.height);
    }
}
