package miui.external;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.text.TextUtils;
import android.util.Log;
import java.io.File;

public class SdkHelper {
    private SdkHelper() {
    }

    public static boolean isMiuiSystem() {
        return TextUtils.isEmpty(H("ro.miui.ui.version.code", "")) ^ 1;
    }

    static String D(Context context, String str, String str2) {
        if (context == null) {
            return I(str, str2);
        }
        PackageInfo F = F(context, str);
        if (F != null) {
            return F.applicationInfo.publicSourceDir;
        }
        return null;
    }

    private static String I(String str, String str2) {
        String J = J(str);
        if (J == null) {
            return L(str2);
        }
        return J;
    }

    private static String J(String str) {
        return M(new String[]{"/data/app/" + str + "-1.apk", "/data/app/" + str + "-2.apk", "/data/app/" + str + "-1/base.apk", "/data/app/" + str + "-2/base.apk"});
    }

    private static String L(String str) {
        return M(new String[]{"/system/app/" + str + ".apk", "/system/priv-app/" + str + ".apk", "/system/app/" + str + "/" + str + ".apk", "/system/priv-app/" + str + "/" + str + ".apk"});
    }

    private static String M(String[] strArr) {
        for (String str : strArr) {
            if (new File(str).exists()) {
                return str;
            }
        }
        return null;
    }

    static String E(Context context, String str) {
        if (context == null) {
            context = G();
        }
        if (context == null) {
            return K(str);
        }
        PackageInfo F = F(context, str);
        if (F != null) {
            return F.applicationInfo.nativeLibraryDir;
        }
        return null;
    }

    private static String K(String str) {
        return "/data/data/" + str + "/lib/";
    }

    private static PackageInfo F(Context context, String str) {
        PackageInfo packageInfo = null;
        try {
            return context.getPackageManager().getPackageInfo(str, 128);
        } catch (NameNotFoundException e) {
            e.printStackTrace();
            return packageInfo;
        }
    }

    private static Context G() {
        try {
            Class cls = Class.forName("android.app.ActivityThread");
            return (Context) cls.getDeclaredMethod("getSystemContext", new Class[0]).invoke(cls.getDeclaredMethod("currentActivityThread", new Class[0]).invoke(null, new Object[0]), new Object[0]);
        } catch (Throwable e) {
            Log.e("miuisdk", "getSystemContext error", e);
            return null;
        }
    }

    private static String H(String str, String str2) {
        try {
            return (String) Class.forName("android.os.SystemProperties").getDeclaredMethod("get", new Class[]{String.class, String.class}).invoke(null, new Object[]{str, str2});
        } catch (Throwable e) {
            Log.e("miuisdk", "getSystemProperty error", e);
            return str2;
        }
    }
}
