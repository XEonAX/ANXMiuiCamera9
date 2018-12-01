package com.android.camera.protocol;

public interface ModeProtocol$DualController extends ModeProtocol$BaseProtocol {
    void hideZoomButton();

    boolean isZoomVisible();

    void showZoomButton();

    void updateZoomValue();

    int visibleHeight();
}
