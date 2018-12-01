package com.android.camera.protocol;

import com.android.camera.fragment.manually.ManuallyListener;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public interface ModeProtocol$ManuallyAdjust extends ModeProtocol$BaseProtocol {

    @Retention(RetentionPolicy.SOURCE)
    public @interface AdjustType {
    }

    int setManuallyVisible(int i, int i2, ManuallyListener manuallyListener);

    int visibleHeight();
}
