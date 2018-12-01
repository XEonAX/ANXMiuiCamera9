package miui.app;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.internal.app.FragmentDelegate;

public class ListFragment extends android.app.ListFragment implements IFragment {
    private FragmentDelegate Ep;
    private boolean Eq = true;
    private boolean Er = true;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.Ep = new FragmentDelegate(this);
        this.Ep.onCreate(bundle);
    }

    public void onStop() {
        super.onStop();
        this.Ep.onStop();
    }

    public void onResume() {
        super.onResume();
        this.Ep.onPostResume();
    }

    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return this.Ep.onCreateView(viewGroup, bundle);
    }

    public View getView() {
        return this.Ep.getView();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.Ep.onConfigurationChanged(configuration);
    }

    public ActionBar getActionBar() {
        return this.Ep.getActionBar();
    }

    public MenuInflater getMenuInflater() {
        return this.Ep.getMenuInflater();
    }

    public ActionMode startActionMode(Callback callback) {
        return this.Ep.startActionMode(callback);
    }

    public void setThemeRes(int i) {
        this.Ep.setExtraThemeRes(i);
    }

    public Context getThemedContext() {
        return this.Ep.getThemedContext();
    }

    public void setHasOptionsMenu(boolean z) {
        super.setHasOptionsMenu(z);
        if (this.Eq != z) {
            this.Eq = z;
            if (!isHidden() && isAdded() && this.Ep != null) {
                this.Ep.invalidateOptionsMenu();
            }
        }
    }

    public void setMenuVisibility(boolean z) {
        super.setMenuVisibility(z);
        if (this.Er != z) {
            this.Er = z;
            if (!isHidden() && isAdded() && this.Ep != null) {
                this.Ep.invalidateOptionsMenu();
            }
        }
    }

    public boolean requestWindowFeature(int i) {
        return this.Ep.requestWindowFeature(i);
    }

    public void invalidateOptionsMenu() {
        if (this.Ep != null) {
            this.Ep.updateOptionsMenu(1);
            if (!isHidden() && this.Eq && this.Er && isAdded()) {
                this.Ep.invalidateOptionsMenu();
            }
        }
    }

    public void updateOptionsMenuContent() {
        if (this.Ep != null && (isHidden() ^ 1) != 0 && this.Eq && this.Er && isAdded()) {
            this.Ep.invalidateOptionsMenu();
        }
    }

    public final void onActionModeStarted(ActionMode actionMode) {
    }

    public final void onActionModeFinished(ActionMode actionMode) {
    }

    public boolean onCreatePanelMenu(int i, Menu menu) {
        boolean z = false;
        if (i != 0) {
            return false;
        }
        if (this.Eq && this.Er && !isHidden() && isAdded()) {
            z = onCreateOptionsMenu(menu);
        }
        return z;
    }

    public void onPreparePanel(int i, View view, Menu menu) {
        if (i == 0 && this.Eq && this.Er && !isHidden() && isAdded()) {
            onPrepareOptionsMenu(menu);
        }
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        return true;
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return super.onCreateView(layoutInflater, viewGroup, bundle);
    }

    public final void onHiddenChanged(boolean z) {
        super.onHiddenChanged(z);
        if (!(z || this.Ep == null)) {
            this.Ep.invalidateOptionsMenu();
        }
        onVisibilityChanged(z ^ 1);
    }

    public void onVisibilityChanged(boolean z) {
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.Ep.setImmersionMenuEnabled(z);
    }

    public void showImmersionMenu() {
        this.Ep.showImmersionMenu();
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        this.Ep.showImmersionMenu(view, viewGroup);
    }

    public void dismissImmersionMenu(boolean z) {
        this.Ep.dismissImmersionMenu(z);
    }

    public void onDestroy() {
        super.onDestroy();
        this.Ep.dismissImmersionMenu(false);
    }
}
