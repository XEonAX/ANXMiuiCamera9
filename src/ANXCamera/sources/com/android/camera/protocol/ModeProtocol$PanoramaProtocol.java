package com.android.camera.protocol;

import android.graphics.Bitmap;
import android.graphics.Point;

public interface ModeProtocol$PanoramaProtocol extends ModeProtocol$BaseProtocol {
    void initPreviewLayout(int i, int i2, int i3, int i4);

    boolean isShown();

    void onCaptureOrientationDecided(int i, int i2, int i3);

    void onPreviewMoving();

    void requestRender();

    void resetShootUI();

    void setDirectionPosition(Point point, int i);

    void setDirectionTooFast(boolean z, int i);

    void setDisplayPreviewBitmap(Bitmap bitmap);

    void setShootUI();

    void showSmallPreview(boolean z);
}
