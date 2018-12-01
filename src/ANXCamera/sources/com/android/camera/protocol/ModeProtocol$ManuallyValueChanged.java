package com.android.camera.protocol;

import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.ComponentManuallyFocus;
import com.android.camera.data.data.config.ComponentManuallyISO;
import com.android.camera.data.data.config.ComponentManuallyWB;

public interface ModeProtocol$ManuallyValueChanged extends ModeProtocol$BaseProtocol {
    void onDualLensSwitch(ComponentManuallyDualLens componentManuallyDualLens, int i);

    void onDualLensZooming(boolean z);

    void onDualZoomHappened(boolean z);

    void onDualZoomValueChanged(float f, boolean z);

    void onETValueChanged(ComponentManuallyET componentManuallyET, String str);

    void onFocusValueChanged(ComponentManuallyFocus componentManuallyFocus, String str, String str2);

    void onISOValueChanged(ComponentManuallyISO componentManuallyISO, String str);

    void onWBValueChanged(ComponentManuallyWB componentManuallyWB, String str, boolean z);
}
