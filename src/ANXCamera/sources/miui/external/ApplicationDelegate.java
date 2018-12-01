package miui.external;

import android.content.ComponentCallbacks;
import android.content.ComponentCallbacks2;
import android.content.ContextWrapper;
import android.content.res.Configuration;

public abstract class ApplicationDelegate extends ContextWrapper implements ComponentCallbacks2 {
    private Application k;

    public ApplicationDelegate() {
        super(null);
    }

    void z(Application application) {
        this.k = application;
        attachBaseContext(application);
    }

    public void onCreate() {
        this.k.g();
    }

    public void onTerminate() {
        this.k.i();
    }

    public void onConfigurationChanged(Configuration configuration) {
        this.k.f(configuration);
    }

    public void onLowMemory() {
        this.k.h();
    }

    public void onTrimMemory(int i) {
        this.k.j(i);
    }

    public void registerComponentCallbacks(ComponentCallbacks componentCallbacks) {
        this.k.registerComponentCallbacks(componentCallbacks);
    }

    public void unregisterComponentCallbacks(ComponentCallbacks componentCallbacks) {
        this.k.unregisterComponentCallbacks(componentCallbacks);
    }
}
