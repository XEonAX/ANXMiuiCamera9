package com.android.camera.module.loader;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public interface SurfaceStateListener {

    @Retention(RetentionPolicy.SOURCE)
    public @interface SurfaceState {
    }

    boolean hasSurface();
}
