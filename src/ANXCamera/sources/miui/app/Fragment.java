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

public class Fragment extends android.app.Fragment implements IFragment {
    private FragmentDelegate EL;
    private boolean EM = true;
    private boolean EN = true;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.EL = new FragmentDelegate(this);
        this.EL.onCreate(bundle);
    }

    public void onStop() {
        super.onStop();
        this.EL.onStop();
    }

    public void onResume() {
        super.onResume();
        this.EL.onPostResume();
    }

    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return this.EL.onCreateView(viewGroup, bundle);
    }

    public View getView() {
        return this.EL.getView();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.EL.onConfigurationChanged(configuration);
    }

    public ActionBar getActionBar() {
        return this.EL.getActionBar();
    }

    public MenuInflater getMenuInflater() {
        return this.EL.getMenuInflater();
    }

    public ActionMode startActionMode(Callback callback) {
        return this.EL.startActionMode(callback);
    }

    public void setThemeRes(int i) {
        this.EL.setExtraThemeRes(i);
    }

    public Context getThemedContext() {
        return this.EL.getThemedContext();
    }

    public void setHasOptionsMenu(boolean z) {
        super.setHasOptionsMenu(z);
        if (this.EM != z) {
            this.EM = z;
            if (this.EM && this.EL != null && (this.EL.isImmersionMenuEnabled() ^ 1) != 0 && (isHidden() ^ 1) != 0 && isAdded()) {
                this.EL.invalidateOptionsMenu();
            }
        }
    }

    public void setMenuVisibility(boolean z) {
        super.setMenuVisibility(z);
        if (this.EN != z) {
            this.EN = z;
            if (!isHidden() && isAdded() && this.EL != null) {
                this.EL.invalidateOptionsMenu();
            }
        }
    }

    public boolean requestWindowFeature(int i) {
        return this.EL.requestWindowFeature(i);
    }

    public void invalidateOptionsMenu() {
        if (this.EL != null) {
            this.EL.updateOptionsMenu(1);
            if (!isHidden() && this.EM && (this.EL.isImmersionMenuEnabled() ^ 1) != 0 && this.EN && isAdded()) {
                this.EL.invalidateOptionsMenu();
            }
        }
    }

    public void updateOptionsMenuContent() {
        if (this.EL != null && (isHidden() ^ 1) != 0 && this.EM && (this.EL.isImmersionMenuEnabled() ^ 1) != 0 && this.EN && isAdded()) {
            this.EL.invalidateOptionsMenu();
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
        if (this.EM && (this.EL.isImmersionMenuEnabled() ^ 1) != 0 && this.EN && !isHidden() && isAdded()) {
            z = onCreateOptionsMenu(menu);
        }
        return z;
    }

    public void onPreparePanel(int i, View view, Menu menu) {
        if (i == 0 && this.EM && (this.EL.isImmersionMenuEnabled() ^ 1) != 0 && this.EN && !isHidden() && isAdded()) {
            onPrepareOptionsMenu(menu);
        }
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        return true;
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public final void onHiddenChanged(boolean z) {
        super.onHiddenChanged(z);
        if (!(z || this.EL == null)) {
            this.EL.invalidateOptionsMenu();
        }
        onVisibilityChanged(z ^ 1);
    }

    public void onVisibilityChanged(boolean z) {
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.EL.setImmersionMenuEnabled(z);
    }

    public void showImmersionMenu() {
        this.EL.showImmersionMenu();
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        this.EL.showImmersionMenu(view, viewGroup);
    }

    public void dismissImmersionMenu(boolean z) {
        this.EL.dismissImmersionMenu(z);
    }

    public void onDestroy() {
        super.onDestroy();
        this.EL.dismissImmersionMenu(false);
    }

    public void setOnStatusBarChangeListener(OnStatusBarChangeListener onStatusBarChangeListener) {
        this.EL.setOnStatusBarChangeListener(onStatusBarChangeListener);
    }
}
