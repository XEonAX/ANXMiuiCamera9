package com.android.camera.data.cloud;

import android.content.SharedPreferences.Editor;

public interface DataCloud$CloudItem {
    Editor editor();

    boolean getCloudBooleanDefault(String str, boolean z);

    float getCloudFloatDefault(String str, float f);

    int getCloudIntDefault(String str, int i);

    long getCloudLongDefault(String str, long j);

    String getCloudStringDefault(String str, String str2);

    String provideKey();

    void setReady(boolean z);
}
