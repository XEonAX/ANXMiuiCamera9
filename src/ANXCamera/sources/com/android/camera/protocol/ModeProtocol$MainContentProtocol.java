package com.android.camera.protocol;

import android.graphics.Bitmap;
import android.view.MotionEvent;

public interface ModeProtocol$MainContentProtocol extends ModeProtocol$BaseProtocol, ModeProtocol$EffectCropViewController, ModeProtocol$IndicatorProtocol {
    int getPreviewWidth();

    void hideDelayNumber();

    void hideReviewViews();

    boolean onViewTouchEvent(int i, MotionEvent motionEvent);

    void performHapticFeedback(int i);

    void setPreviewAspectRatio(float f);

    void showDelayNumber(int i);

    void showReviewViews(Bitmap bitmap);
}
