package com.android.camera.statistic;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemProperties;
import android.support.v7.recyclerview.R;
import com.android.camera.log.Log;
import com.xiaomi.mistatistic.sdk.CustomSettings;
import com.xiaomi.mistatistic.sdk.MiStatInterface;
import java.util.Map;
import java.util.Map.Entry;
import miui.os.Build;

public class CameraStat {
    private static final String CHANNEL = SystemProperties.get("ro.product.mod_device", Build.DEVICE);
    private static final String TAG = CameraStat.class.getSimpleName();
    private static boolean sDumpStatEvent;
    private static boolean sIsAnonymous;
    private static boolean sIsCounterEventEnabled;
    private static boolean sIsEnabled = true;

    public static void initialize(Context context) {
        sDumpStatEvent = SystemProperties.getBoolean("camera.debug.dump_stat_event", false);
        Resources res = context.getResources();
        sIsEnabled = res.getBoolean(R.bool.pref_camera_statistic_default);
        if (sIsEnabled) {
            sIsCounterEventEnabled = res.getBoolean(R.bool.pref_camera_statistic_counter_event_default);
            sIsAnonymous = Build.IS_INTERNATIONAL_BUILD;
            MiStatInterface.initialize(context, "2882303761517373386", "5641737344386", CHANNEL);
            MiStatInterface.enableExceptionCatcher(sIsAnonymous ^ 1);
            MiStatInterface.setUploadPolicy(4, 90000);
            CustomSettings.setUseSystemUploadingService(true);
        }
    }

    public static boolean isCounterEventDisabled() {
        return sIsCounterEventEnabled ^ 1;
    }

    public static void recordPageStart(Context context, String pageName) {
        if (sIsEnabled) {
            MiStatInterface.recordPageStart(context, pageName);
        }
    }

    public static void recordPageEnd() {
        if (sIsEnabled) {
            MiStatInterface.recordPageEnd();
        }
    }

    public static void recordCountEvent(String category, String key) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCountEventAnonymous(category, key);
            } else {
                MiStatInterface.recordCountEvent(category, key);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CountEvent", category, key, null, null);
        }
    }

    public static void recordCountEvent(String category, String key, Map<String, String> params) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCountEventAnonymous(category, key, params);
            } else {
                MiStatInterface.recordCountEvent(category, key, params);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CountEvent", category, key, null, params);
        }
    }

    public static void recordCalculateEvent(String category, String key, long value) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCalculateEventAnonymous(category, key, value);
            } else {
                MiStatInterface.recordCalculateEvent(category, key, value);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CalculateEvent", category, key, String.valueOf(value), null);
        }
    }

    public static void recordCalculateEvent(String category, String key, long value, Map<String, String> params) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCalculateEventAnonymous(category, key, value, params);
            } else {
                MiStatInterface.recordCalculateEvent(category, key, value, params);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CalculateEvent", category, key, String.valueOf(value), params);
        }
    }

    public static void recordStringPropertyEvent(String category, String key, String value) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordStringPropertyEventAnonymous(category, key, value);
            } else {
                MiStatInterface.recordStringPropertyEvent(category, key, value);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("PropertyEvent", category, key, value, null);
        }
    }

    private static void dumpEvent(String type, String category, String key, String value, Map<String, String> params) {
        StringBuilder sb = new StringBuilder();
        sb.append(type).append(" category:").append(category).append(" key:").append(key);
        if (value != null) {
            sb.append(" value:").append(value);
        }
        if (params != null) {
            sb.append("\n");
            sb.append("params:").append("[");
            for (Entry<String, String> entry : params.entrySet()) {
                sb.append((String) entry.getKey()).append(":").append((String) entry.getValue()).append(" ");
            }
            int length = sb.length();
            sb.replace(length - 1, length, "]");
        }
        Log.d(TAG, sb.toString());
    }
}
