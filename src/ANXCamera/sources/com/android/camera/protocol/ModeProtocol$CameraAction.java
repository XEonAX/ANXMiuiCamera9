package com.android.camera.protocol;

import android.view.View;

public interface ModeProtocol$CameraAction extends ModeProtocol$BaseProtocol {
    boolean isDoingAction();

    void onReviewCancelClicked();

    void onReviewDoneClicked();

    void onShutterButtonClick(int i);

    void onShutterButtonFocus(boolean z, int i);

    boolean onShutterButtonLongClick();

    void onShutterButtonLongClickCancel(boolean z);

    void onThumbnailClicked(View view);
}
