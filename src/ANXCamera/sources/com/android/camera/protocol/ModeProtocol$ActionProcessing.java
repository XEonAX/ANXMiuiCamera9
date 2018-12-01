package com.android.camera.protocol;

import com.android.camera.Thumbnail;

public interface ModeProtocol$ActionProcessing extends ModeProtocol$BaseProtocol {
    void filterUiChange();

    boolean isShowFilter();

    void processingFailed();

    void processingFinish();

    void processingPause();

    void processingResume();

    void processingStart();

    void showOrHideFilter();

    void updateLoading(boolean z);

    void updateThumbnail(Thumbnail thumbnail, boolean z);
}
