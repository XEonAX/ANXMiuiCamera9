package com.android.camera.log;

import android.os.SystemProperties;
import com.android.camera.Util;

public class Log {
    private static final int MAX_TAG_LEN = (23 - "CAM_".length());
    private static int sDebugPriority;

    static {
        int i = 2;
        sDebugPriority = 2;
        try {
            int overrideLevel = getOverrideLevel();
            if (overrideLevel != 0) {
                sDebugPriority = overrideLevel;
                return;
            }
            if (!Util.isDebugOsBuild()) {
                i = Integer.MAX_VALUE;
            }
            sDebugPriority = i;
        } catch (IllegalArgumentException ex) {
            System.out.println(ex.getMessage());
        }
    }

    private static String tagFormat(String tag) {
        int lenDiff = tag.length() - MAX_TAG_LEN;
        StringBuilder append = new StringBuilder().append("CAM_");
        if (lenDiff > 0) {
            tag = tag.substring(0, MAX_TAG_LEN);
        }
        return append.append(tag).toString();
    }

    public static int c(String tag, String msg) {
        String formattedTag = tagFormat("CONTINUAL_" + tag);
        if (shouldLogForDebug("CAM_CONTINUAL_", 2)) {
            return android.util.Log.v(formattedTag, msg);
        }
        return -1;
    }

    public static int v(String tag, String msg) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 2)) {
            return android.util.Log.v(formattedTag, msg);
        }
        return -1;
    }

    public static int d(String tag, String msg) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 3)) {
            return android.util.Log.d(formattedTag, msg);
        }
        return -1;
    }

    public static int d(String tag, String msg, Throwable tr) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 3)) {
            return android.util.Log.d(formattedTag, msg, tr);
        }
        return -1;
    }

    public static int i(String tag, String msg) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 4)) {
            return android.util.Log.i(formattedTag, msg);
        }
        return -1;
    }

    public static int i(String tag, String msg, Throwable tr) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 4)) {
            return android.util.Log.i(formattedTag, msg, tr);
        }
        return -1;
    }

    public static int w(String tag, String msg) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 5)) {
            return android.util.Log.w(formattedTag, msg);
        }
        return -1;
    }

    public static int w(String tag, String msg, Throwable tr) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 5)) {
            return android.util.Log.w(formattedTag, msg, tr);
        }
        return -1;
    }

    public static int w(String tag, Throwable tr) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 5)) {
            return android.util.Log.w(formattedTag, tr);
        }
        return -1;
    }

    public static int e(String tag, String msg) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 6)) {
            return android.util.Log.e(formattedTag, msg);
        }
        return -1;
    }

    public static int e(String tag, String msg, Throwable tr) {
        String formattedTag = tagFormat(tag);
        if (isLoggable(formattedTag, 6)) {
            return android.util.Log.e(formattedTag, msg, tr);
        }
        return -1;
    }

    public static int getOverrideLevel() {
        return SystemProperties.getInt("camera.debug.log_level", 2);
    }

    private static boolean isLoggable(String tag, int level) {
        return sDebugPriority > level ? shouldLog(tag, level) : true;
    }

    private static boolean shouldLogForDebug(String tag, int level) {
        return android.util.Log.isLoggable(tag, level);
    }

    private static boolean shouldLog(String tag, int level) {
        if (android.util.Log.isLoggable("CAM_", level)) {
            return true;
        }
        return android.util.Log.isLoggable(tag, level);
    }
}
