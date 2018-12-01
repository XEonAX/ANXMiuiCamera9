package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Process;
import android.support.annotation.NonNull;
import java.io.File;

public class ContextCompat {
    private static final String DIR_ANDROID = "Android";
    private static final String DIR_CACHE = "cache";
    private static final String DIR_DATA = "data";
    private static final String DIR_FILES = "files";
    private static final String DIR_OBB = "obb";
    private static final String TAG = "ContextCompat";

    public static boolean startActivities(Context context, Intent[] intents) {
        return startActivities(context, intents, null);
    }

    public static boolean startActivities(Context context, Intent[] intents, Bundle options) {
        int version = VERSION.SDK_INT;
        if (version >= 16) {
            ContextCompatJellybean.startActivities(context, intents, options);
            return true;
        } else if (version < 11) {
            return false;
        } else {
            ContextCompatHoneycomb.startActivities(context, intents);
            return true;
        }
    }

    public static File[] getObbDirs(Context context) {
        int version = VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getObbDirs(context);
        }
        File single;
        if (version < 11) {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_OBB, context.getPackageName());
        } else {
            single = ContextCompatHoneycomb.getObbDir(context);
        }
        return new File[]{single};
    }

    public static File[] getExternalFilesDirs(Context context, String type) {
        int version = VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getExternalFilesDirs(context, type);
        }
        File single;
        if (version < 8) {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_DATA, context.getPackageName(), DIR_FILES, type);
        } else {
            single = ContextCompatFroyo.getExternalFilesDir(context, type);
        }
        return new File[]{single};
    }

    public static File[] getExternalCacheDirs(Context context) {
        int version = VERSION.SDK_INT;
        if (version >= 19) {
            return ContextCompatKitKat.getExternalCacheDirs(context);
        }
        File single;
        if (version < 8) {
            single = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_DATA, context.getPackageName(), DIR_CACHE);
        } else {
            single = ContextCompatFroyo.getExternalCacheDir(context);
        }
        return new File[]{single};
    }

    private static File buildPath(File base, String... segments) {
        File cur = base;
        String[] arr$ = segments;
        int len$ = segments.length;
        int i$ = 0;
        File cur2 = cur;
        while (i$ < len$) {
            String segment = segments[i$];
            if (cur2 == null) {
                cur = new File(segment);
            } else if (segment == null) {
                cur = cur2;
            } else {
                cur = new File(cur2, segment);
            }
            i$++;
            cur2 = cur;
        }
        return cur2;
    }

    public static final Drawable getDrawable(Context context, int id) {
        if (VERSION.SDK_INT < 21) {
            return context.getResources().getDrawable(id);
        }
        return ContextCompatApi21.getDrawable(context, id);
    }

    public static final ColorStateList getColorStateList(Context context, int id) {
        if (VERSION.SDK_INT < 23) {
            return context.getResources().getColorStateList(id);
        }
        return ContextCompatApi23.getColorStateList(context, id);
    }

    public static final int getColor(Context context, int id) {
        if (VERSION.SDK_INT < 23) {
            return context.getResources().getColor(id);
        }
        return ContextCompatApi23.getColor(context, id);
    }

    public static int checkSelfPermission(@NonNull Context context, @NonNull String permission) {
        if (permission != null) {
            return context.checkPermission(permission, Process.myPid(), Process.myUid());
        }
        throw new IllegalArgumentException("permission is null");
    }

    public final File getNoBackupFilesDir(Context context) {
        if (VERSION.SDK_INT < 21) {
            return createFilesDir(new File(context.getApplicationInfo().dataDir, "no_backup"));
        }
        return ContextCompatApi21.getNoBackupFilesDir(context);
    }

    public final File getCodeCacheDir(Context context) {
        if (VERSION.SDK_INT < 21) {
            return createFilesDir(new File(context.getApplicationInfo().dataDir, "code_cache"));
        }
        return ContextCompatApi21.getCodeCacheDir(context);
    }

    /* JADX WARNING: Missing block: B:6:0x000a, code:
            return r3;
     */
    private static synchronized java.io.File createFilesDir(java.io.File r3) {
        /*
        r1 = android.support.v4.content.ContextCompat.class;
        monitor-enter(r1);
        r0 = r3.exists();	 Catch:{ all -> 0x003a }
        if (r0 == 0) goto L_0x000b;
    L_0x0009:
        monitor-exit(r1);
        return r3;
    L_0x000b:
        r0 = r3.mkdirs();	 Catch:{ all -> 0x003a }
        if (r0 != 0) goto L_0x0009;
    L_0x0011:
        r0 = r3.exists();	 Catch:{ all -> 0x003a }
        if (r0 != 0) goto L_0x0038;
    L_0x0017:
        r0 = new java.lang.StringBuilder;	 Catch:{ all -> 0x003a }
        r0.<init>();	 Catch:{ all -> 0x003a }
        r2 = "Unable to create files subdir ";
        r0 = r0.append(r2);	 Catch:{ all -> 0x003a }
        r2 = r3.getPath();	 Catch:{ all -> 0x003a }
        r0 = r0.append(r2);	 Catch:{ all -> 0x003a }
        r0 = r0.toString();	 Catch:{ all -> 0x003a }
        r2 = "ContextCompat";
        android.util.Log.w(r2, r0);	 Catch:{ all -> 0x003a }
        r0 = 0;
        monitor-exit(r1);
        return r0;
    L_0x0038:
        monitor-exit(r1);
        return r3;
    L_0x003a:
        r0 = move-exception;
        monitor-exit(r1);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.content.ContextCompat.createFilesDir(java.io.File):java.io.File");
    }
}
