package com.android.camera.data.backup;

import com.android.camera.data.data.runing.DataItemRunning;

public interface DataBackUp {
    void backupRunning(DataItemRunning dataItemRunning, int i, int i2, boolean z);

    void clearBackUp();

    String getBackupFilter(int i, int i2);

    boolean isLastVideoFastMotion();

    boolean isLastVideoHFRMode();

    boolean isLastVideoSlowMotion();

    void revertRunning(DataItemRunning dataItemRunning, int i, int i2);
}
