package miui.preference;

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
import android.widget.ListView;
import com.miui.internal.R;
import com.miui.internal.app.FragmentDelegate;
import miui.app.ActionBar;
import miui.app.IFragment;
import miui.util.AttributeResolver;

public class PreferenceFragment extends android.preference.PreferenceFragment implements IFragment {
    private FragmentDelegate iV;
    private boolean iW = true;
    private boolean iX = true;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.iV = new FragmentDelegate(this);
        this.iV.onCreate(bundle);
    }

    public void onStop() {
        super.onStop();
        this.iV.onStop();
    }

    public void onResume() {
        super.onResume();
        this.iV.onPostResume();
    }

    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onCreateView = this.iV.onCreateView(viewGroup, bundle);
        ListView listView = (ListView) onCreateView.findViewById(16908298);
        if (listView != null) {
            listView.setClipToPadding(false);
            listView.setPadding(0, 0, 0, (int) AttributeResolver.resolveDimension(onCreateView.getContext(), R.attr.preferenceScreenPaddingBottom));
        }
        return onCreateView;
    }

    public View getView() {
        return this.iV.getView();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.iV.onConfigurationChanged(configuration);
    }

    public ActionBar getActionBar() {
        return this.iV.getActionBar();
    }

    public MenuInflater getMenuInflater() {
        return this.iV.getMenuInflater();
    }

    public ActionMode startActionMode(Callback callback) {
        return this.iV.startActionMode(callback);
    }

    public void setThemeRes(int i) {
        this.iV.setExtraThemeRes(i);
    }

    public Context getThemedContext() {
        return this.iV.getThemedContext();
    }

    public void setHasOptionsMenu(boolean z) {
        super.setHasOptionsMenu(z);
        if (this.iW != z) {
            this.iW = z;
            if (!isHidden() && isAdded() && this.iV != null) {
                this.iV.invalidateOptionsMenu();
            }
        }
    }

    public void setMenuVisibility(boolean z) {
        super.setMenuVisibility(z);
        if (this.iX != z) {
            this.iX = z;
            if (!isHidden() && isAdded() && this.iV != null) {
                this.iV.invalidateOptionsMenu();
            }
        }
    }

    public boolean requestWindowFeature(int i) {
        return this.iV.requestWindowFeature(i);
    }

    public void invalidateOptionsMenu() {
        if (this.iV != null) {
            this.iV.updateOptionsMenu(1);
            if (!isHidden() && this.iW && this.iX && isAdded()) {
                this.iV.invalidateOptionsMenu();
            }
        }
    }

    public void updateOptionsMenuContent() {
        if (this.iV != null && (isHidden() ^ 1) != 0 && this.iW && this.iX && isAdded()) {
            this.iV.invalidateOptionsMenu();
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
        if (this.iW && this.iX && !isHidden() && isAdded()) {
            z = onCreateOptionsMenu(menu);
        }
        return z;
    }

    public void onPreparePanel(int i, View view, Menu menu) {
        if (i == 0 && this.iW && this.iX && !isHidden() && isAdded()) {
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
        if (!(z || this.iV == null)) {
            this.iV.invalidateOptionsMenu();
        }
        onVisibilityChanged(z ^ 1);
    }

    public void onVisibilityChanged(boolean z) {
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.iV.setImmersionMenuEnabled(z);
    }

    public void showImmersionMenu() {
        this.iV.showImmersionMenu();
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        this.iV.showImmersionMenu(view, viewGroup);
    }

    public void dismissImmersionMenu(boolean z) {
        this.iV.dismissImmersionMenu(z);
    }

    public void onDestroy() {
        super.onDestroy();
        this.iV.dismissImmersionMenu(false);
    }
}
