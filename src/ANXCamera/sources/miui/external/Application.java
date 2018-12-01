package miui.external;

import android.content.Context;
import android.content.res.Configuration;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

public class Application extends android.app.Application {
    private ApplicationDelegate b;
    private boolean c;
    private boolean d;

    public Application() {
        if (d() && c()) {
            this.c = true;
        }
    }

    private boolean d() {
        try {
            if (SdkHelper.isMiuiSystem() || d.N(SdkHelper.D(null, "com.miui.core", "miui"), null, SdkHelper.E(null, "com.miui.core"), Application.class.getClassLoader())) {
                return true;
            }
            a.A(SdkConstants$SdkError.NO_SDK);
            return false;
        } catch (Throwable th) {
            a(th);
            return false;
        }
    }

    private boolean c() {
        try {
            HashMap hashMap = new HashMap();
            int intValue = ((Integer) c.C().getMethod("initialize", new Class[]{android.app.Application.class, Map.class}).invoke(null, new Object[]{this, hashMap})).intValue();
            if (intValue == 0) {
                return true;
            }
            b("initialize", intValue);
            return false;
        } catch (Throwable th) {
            a(th);
            return false;
        }
    }

    private boolean e() {
        try {
            HashMap hashMap = new HashMap();
            int intValue = ((Integer) c.C().getMethod("start", new Class[]{Map.class}).invoke(null, new Object[]{hashMap})).intValue();
            if (intValue == 1) {
                a.A(SdkConstants$SdkError.LOW_SDK_VERSION);
                return false;
            } else if (intValue == 0) {
                return true;
            } else {
                b("start", intValue);
                return false;
            }
        } catch (Throwable th) {
            a(th);
            return false;
        }
    }

    private void a(Throwable th) {
        while (th != null && th.getCause() != null) {
            if (!(th instanceof InvocationTargetException)) {
                if (!(th instanceof ExceptionInInitializerError)) {
                    break;
                }
                th = th.getCause();
            } else {
                th = th.getCause();
            }
        }
        Log.e("miuisdk", "MIUI SDK encounter errors, please contact miuisdk@xiaomi.com for support.", th);
        a.A(SdkConstants$SdkError.GENERIC);
    }

    private void b(String str, int i) {
        Log.e("miuisdk", "MIUI SDK encounter errors, please contact miuisdk@xiaomi.com for support. phase: " + str + " code: " + i);
        a.A(SdkConstants$SdkError.GENERIC);
    }

    public ApplicationDelegate onCreateApplicationDelegate() {
        return null;
    }

    protected void attachBaseContext(Context context) {
        super.attachBaseContext(context);
        if (this.c && e()) {
            this.b = onCreateApplicationDelegate();
            if (this.b != null) {
                this.b.z(this);
            }
            this.d = true;
        }
    }

    public final void onCreate() {
        if (this.d) {
            if (this.b != null) {
                this.b.onCreate();
            } else {
                g();
            }
        }
    }

    final void g() {
        super.onCreate();
    }

    public final void onTerminate() {
        if (this.b != null) {
            this.b.onTerminate();
        } else {
            i();
        }
    }

    final void i() {
        super.onTerminate();
    }

    public final void onLowMemory() {
        if (this.b != null) {
            this.b.onLowMemory();
        } else {
            h();
        }
    }

    final void h() {
        super.onLowMemory();
    }

    public final void onTrimMemory(int i) {
        if (this.b != null) {
            this.b.onTrimMemory(i);
        } else {
            j(i);
        }
    }

    final void j(int i) {
        super.onTrimMemory(i);
    }

    public final void onConfigurationChanged(Configuration configuration) {
        if (this.b != null) {
            this.b.onConfigurationChanged(configuration);
        } else {
            f(configuration);
        }
    }

    final void f(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }
}
