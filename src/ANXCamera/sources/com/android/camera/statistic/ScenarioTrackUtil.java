package com.android.camera.statistic;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import com.android.camera.log.Log;
import com.android.camera.statistic.E2EScenarioPerfTracerInterface.E2EScenario;
import com.android.camera.statistic.E2EScenarioPerfTracerInterface.E2EScenarioPayload;
import com.android.camera.statistic.E2EScenarioPerfTracerInterface.E2EScenarioSettings;
import java.util.HashMap;
import java.util.Map;

public class ScenarioTrackUtil {
    private static final String TAG = ScenarioTrackUtil.class.getSimpleName();
    public static final CameraEventScenario sCaptureTimeScenario = new CameraEventScenario("CaptureTime");
    public static final CameraEventScenario sLaunchTimeScenario = new CameraEventScenario("CameraLaunchTime");
    public static final CameraEventScenario sStartVideoRecordTimeScenario = new CameraEventScenario("StartVideoRecordTime");
    public static final CameraEventScenario sStopVideoRecordTimeScenario = new CameraEventScenario("StopVideoRecordTime");
    public static final CameraEventScenario sSwitchCameraTimeScenario = new CameraEventScenario("SwitchCameraTime");
    public static final CameraEventScenario sSwitchModeTimeScenario = new CameraEventScenario("SwitchModeTime");

    public static class CameraEventScenario {
        E2EScenario e2eScenario;
        public volatile boolean isTrackStarted = false;
        String mEventName;

        CameraEventScenario(String eventName) {
            this.e2eScenario = initE2EScenario(eventName);
            this.mEventName = eventName;
        }

        private E2EScenario initE2EScenario(String eventName) {
            E2EScenario result = null;
            try {
                return E2EScenarioPerfTracerInterface.createE2EScenario("com.android.camera", "Performance", eventName);
            } catch (Exception e) {
                Log.w(ScenarioTrackUtil.TAG, eventName + " initializer failed: " + e.getMessage());
                return result;
            }
        }

        public String toString() {
            return this.mEventName;
        }
    }

    public static void trackAppLunchTimeStart(@NonNull boolean isColdLaunch) {
        Map<String, String> map = new HashMap();
        map.put("LaunchMode", isColdLaunch ? "COLD" : "HOT");
        beginScenario(sLaunchTimeScenario, map);
    }

    public static void trackAppLunchTimeEnd() {
        finishScenario(sLaunchTimeScenario);
    }

    public static void trackCaptureTimeStart(@NonNull boolean isFrontCamera, @NonNull int modeIndex) {
        Map<String, String> map = new HashMap();
        map.put("CameraID", CameraStatUtil.cameraIdToName(isFrontCamera));
        map.put("Module", CameraStatUtil.modeIdToName(modeIndex));
        beginScenario(sCaptureTimeScenario, map);
    }

    public static void trackCaptureTimeEnd() {
        finishScenario(sCaptureTimeScenario);
    }

    public static void trackSwitchCameraStart(@NonNull boolean isFrontCameraFrom, @NonNull boolean isFrontCameraTo, @NonNull int inMode) {
        Map<String, String> map = new HashMap();
        map.put("from", CameraStatUtil.cameraIdToName(isFrontCameraFrom));
        map.put("to", CameraStatUtil.cameraIdToName(isFrontCameraTo));
        map.put("inMode", CameraStatUtil.modeIdToName(inMode));
        beginScenario(sSwitchCameraTimeScenario, map);
    }

    public static void trackSwitchCameraEnd() {
        finishScenario(sSwitchCameraTimeScenario);
    }

    public static void trackSwitchModeStart(@NonNull int fromMode, @NonNull int toMode, @NonNull boolean isFrontCamera) {
        Map<String, String> map = new HashMap();
        map.put("from", CameraStatUtil.modeIdToName(fromMode));
        map.put("to", CameraStatUtil.modeIdToName(toMode));
        map.put("cameraId", CameraStatUtil.cameraIdToName(isFrontCamera));
        beginScenario(sSwitchModeTimeScenario, map);
    }

    public static void trackSwitchModeEnd() {
        finishScenario(sSwitchModeTimeScenario);
    }

    public static void trackStartVideoRecordStart(@NonNull String mode, @NonNull boolean isFrontCamera) {
        Map<String, String> map = new HashMap();
        map.put("mode", mode);
        map.put("cameraId", CameraStatUtil.cameraIdToName(isFrontCamera));
        beginScenario(sStartVideoRecordTimeScenario, map);
    }

    public static void trackStartVideoRecordEnd() {
        finishScenario(sStartVideoRecordTimeScenario);
    }

    public static void trackStopVideoRecordStart(@NonNull String mode, @NonNull boolean isFrontCamera) {
        Map<String, String> map = new HashMap();
        map.put("mode", mode);
        map.put("cameraId", CameraStatUtil.cameraIdToName(isFrontCamera));
        beginScenario(sStopVideoRecordTimeScenario, map);
    }

    public static void trackStopVideoRecordEnd() {
        finishScenario(sStopVideoRecordTimeScenario);
    }

    public static void trackScenarioAbort(@NonNull CameraEventScenario scenario) {
        abortScenario(scenario);
    }

    private static void beginScenario(@NonNull CameraEventScenario scenario, @Nullable Map payLoadMap) {
        if (scenario.e2eScenario == null) {
            Log.w(TAG, "track " + scenario.toString() + " event start cancel due to scenario is null!");
            return;
        }
        if (scenario.isTrackStarted) {
            E2EScenarioPerfTracerInterface.abortScenario(scenario.e2eScenario);
        }
        try {
            E2EScenarioSettings scenarioSettings = E2EScenarioPerfTracerInterface.createE2EScenarioSettings();
            if (scenarioSettings != null) {
                scenarioSettings.setStatisticsMode(3);
                scenarioSettings.setHistoryLimitPerDay(Callback.DEFAULT_DRAG_ANIMATION_DURATION);
            }
            if (payLoadMap != null) {
                E2EScenarioPayload payload = E2EScenarioPerfTracerInterface.createE2EScenarioPayload();
                payload.putAll(payLoadMap);
                E2EScenarioPerfTracerInterface.beginScenario(scenario.e2eScenario, scenarioSettings, payload);
            } else {
                E2EScenarioPerfTracerInterface.beginScenario(scenario.e2eScenario, scenarioSettings);
            }
            scenario.isTrackStarted = true;
        } catch (Exception e) {
            Log.w(TAG, "track " + scenario.toString() + " event start failed: " + e.getMessage());
        }
    }

    private static void finishScenario(@NonNull CameraEventScenario scenario) {
        if (scenario.e2eScenario == null) {
            Log.w(TAG, "track " + scenario.toString() + " event end cancel, due to scenario is null!");
        } else if (scenario.isTrackStarted) {
            try {
                E2EScenarioPerfTracerInterface.finishScenario(scenario.e2eScenario);
                scenario.isTrackStarted = false;
            } catch (Exception e) {
                Log.w(TAG, "track " + scenario.toString() + " event end failed: " + e.getMessage());
            }
        } else {
            Log.w(TAG, "track " + scenario.toString() + " event end cancel, due to scenario has not started!");
        }
    }

    private static void abortScenario(@NonNull CameraEventScenario scenario) {
        if (scenario.e2eScenario == null) {
            Log.w(TAG, "track " + scenario.toString() + " event start cancel due to scenario is null!");
            return;
        }
        if (scenario.isTrackStarted) {
            E2EScenarioPerfTracerInterface.abortScenario(scenario.e2eScenario);
        }
    }
}
