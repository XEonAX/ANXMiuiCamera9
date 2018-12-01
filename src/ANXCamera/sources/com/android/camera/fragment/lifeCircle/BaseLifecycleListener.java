package com.android.camera.fragment.lifeCircle;

public interface BaseLifecycleListener {
    void onLifeAlive();

    void onLifeDestroy(String str);

    void onLifeStart(String str);

    void onLifeStop(String str);
}
