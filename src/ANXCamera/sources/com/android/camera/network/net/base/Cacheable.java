package com.android.camera.network.net.base;

public interface Cacheable {
    byte[] getData();

    boolean isFromCache();
}
