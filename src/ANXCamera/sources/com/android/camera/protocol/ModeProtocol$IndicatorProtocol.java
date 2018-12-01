package com.android.camera.protocol;

import android.graphics.Rect;
import android.graphics.RectF;
import com.android.camera.ui.FocusView.ExposureViewListener;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera2.CameraHardwareFace;

public interface ModeProtocol$IndicatorProtocol {
    void clearFocusView(int i);

    void clearIndicator(int i);

    int getActiveIndicator();

    CameraHardwareFace[] getFaces();

    RectF getFocusRect(int i);

    void initializeFocusView(ExposureViewListener exposureViewListener);

    boolean initializeObjectTrack(RectF rectF, boolean z);

    boolean isEvAdjusted(boolean z);

    boolean isFaceExists(int i);

    boolean isIndicatorVisible(int i);

    boolean isNeedExposure(int i);

    void reShowFaceRect();

    void setActiveIndicator(int i);

    void setCameraDisplayOrientation(int i);

    void setEvAdjustable(boolean z);

    boolean setFaces(int i, CameraHardwareFace[] cameraHardwareFaceArr, Rect rect, float f);

    void setFocusViewPosition(int i, int i2, int i3);

    void setFocusViewType(boolean z);

    void setObjectViewListener(ObjectViewListener objectViewListener);

    void setPreviewSize(int i, int i2);

    void setShowGenderAndAge(boolean z);

    void setShowMagicMirror(boolean z);

    void setSkipDrawFace(boolean z);

    void showIndicator(int i, int i2);

    void updateFaceView(boolean z, boolean z2, boolean z3, boolean z4, int i);
}
