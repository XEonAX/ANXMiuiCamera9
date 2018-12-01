package com.android.camera.protocol;

public interface ModeProtocol$ConfigChanges extends ModeProtocol$BaseProtocol {
    void closeMutexElement(String str, int... iArr);

    void configBokeh(String str);

    void configFlash(String str);

    void configGroupSwitch(int i);

    void configHdr(String str);

    void onConfigChanged(int i);

    void reCheckMutexConfigs();

    void restoreAllMutexElement(String str);

    void showSetting();
}
