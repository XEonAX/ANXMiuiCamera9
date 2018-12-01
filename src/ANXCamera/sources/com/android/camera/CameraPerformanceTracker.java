package com.android.camera;

import com.android.camera.log.Log;

public class CameraPerformanceTracker {
    private static CameraPerformanceTracker sInstance;
    private long mAppResumeTime = -1;
    private long mAppStartTime = -1;
    private long mFirstPreviewFrameLatencyColdStart = -1;
    private long mFirstPreviewFrameLatencyWarmStart = 0;
    private long mModeSwitchDuration = -1;
    private long mModeSwitchStartTime = -1;

    private CameraPerformanceTracker() {
    }

    public static void onEvent(int eventType) {
        if (sInstance == null) {
            sInstance = new CameraPerformanceTracker();
        }
        long currentTime = System.currentTimeMillis();
        switch (eventType) {
            case 0:
                sInstance.mAppStartTime = currentTime;
                return;
            case 1:
                sInstance.mFirstPreviewFrameLatencyWarmStart = -1;
                return;
            case 2:
                sInstance.mAppResumeTime = currentTime;
                return;
            case 3:
                sInstance.mModeSwitchStartTime = currentTime;
                return;
            case 5:
                Log.d("CameraPerformanceTracker", "First preview frame received");
                if (sInstance.mFirstPreviewFrameLatencyColdStart == -1) {
                    sInstance.mFirstPreviewFrameLatencyColdStart = currentTime - sInstance.mAppStartTime;
                    if (Util.isKPILogEnabled()) {
                        Log.d("CameraPerformanceTracker", "[KPI] Cold start duration: " + sInstance.mFirstPreviewFrameLatencyColdStart + "ms");
                        return;
                    }
                    return;
                } else if (sInstance.mFirstPreviewFrameLatencyWarmStart == -1) {
                    sInstance.mFirstPreviewFrameLatencyWarmStart = currentTime - sInstance.mAppResumeTime;
                    if (Util.isKPILogEnabled()) {
                        Log.d("CameraPerformanceTracker", "[KPI] Warm start duration: " + sInstance.mFirstPreviewFrameLatencyWarmStart + "ms");
                        return;
                    }
                    return;
                } else if (sInstance.mModeSwitchStartTime != -1) {
                    sInstance.mModeSwitchDuration = currentTime - sInstance.mModeSwitchStartTime;
                    sInstance.mModeSwitchStartTime = -1;
                    if (Util.isKPILogEnabled()) {
                        Log.d("CameraPerformanceTracker", "[KPI] Mode switch duration: " + sInstance.mModeSwitchDuration + "ms");
                        return;
                    }
                    return;
                } else {
                    return;
                }
            default:
                return;
        }
    }
}
