package com.android.camera.protocol;

import com.android.camera.ui.ToggleSwitch.OnCheckedChangeListener;

public interface ModeProtocol$TopAlert extends ModeProtocol$BaseProtocol {
    void alertAiSceneSelector(int i, OnCheckedChangeListener onCheckedChangeListener);

    void alertAiSceneSwitchHint(int i);

    void alertFlash(int i, boolean z, boolean z2);

    void alertHDR(int i, boolean z, boolean z2);

    void alertUpdateValue(int i);

    void hideConfigMenu();

    void hideExtraMenu();

    void insertConfigItem(int i);

    void refreshExtraMenu();

    void removeConfigItem(int i);

    void removeExtraMenu(int i);

    void setAiSceneImageLevel(int i);

    void setRecordingTimeState(int i);

    void updateConfigItem(int... iArr);

    void updateContentDescription();

    void updateRecordingTime(String str);
}
