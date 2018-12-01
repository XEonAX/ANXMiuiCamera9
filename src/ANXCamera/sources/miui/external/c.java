package miui.external;

import android.util.Log;

class c {
    c() {
    }

    public static Class<?> C() throws ClassNotFoundException {
        try {
            return Class.forName("miui.core.SdkManager");
        } catch (ClassNotFoundException e) {
            try {
                Class<?> cls = Class.forName("com.miui.internal.core.SdkManager");
                Log.w("miuisdk", "using legacy sdk");
                return cls;
            } catch (ClassNotFoundException e2) {
                Log.e("miuisdk", "no sdk found");
                throw e2;
            }
        }
    }
}
