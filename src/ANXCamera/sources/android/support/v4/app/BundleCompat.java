package android.support.v4.app;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.IBinder;

public class BundleCompat {
    public static IBinder getBinder(Bundle bundle, String key) {
        if (VERSION.SDK_INT < 18) {
            return BundleCompatDonut.getBinder(bundle, key);
        }
        return BundleCompatJellybeanMR2.getBinder(bundle, key);
    }

    public static void putBinder(Bundle bundle, String key, IBinder binder) {
        if (VERSION.SDK_INT < 18) {
            BundleCompatDonut.putBinder(bundle, key, binder);
        } else {
            BundleCompatJellybeanMR2.putBinder(bundle, key, binder);
        }
    }
}
