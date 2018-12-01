package miui.app;

import android.content.res.Configuration;
import android.os.Bundle;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.miui.internal.app.ActivityDelegate;

public class Activity extends android.app.Activity implements IActivity {
    private ActivityDelegate Eo = new ActivityDelegate(this, android.app.Activity.class);

    public ActionBar getActionBar() {
        return this.Eo.getActionBar();
    }

    public MenuInflater getMenuInflater() {
        return this.Eo.getMenuInflater();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.Eo.onCreate(bundle);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.Eo.onConfigurationChanged(configuration);
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        this.Eo.onSaveInstanceState(bundle);
    }

    protected void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        this.Eo.onRestoreInstanceState(bundle);
    }

    protected void onStop() {
        super.onStop();
        this.Eo.onStop();
    }

    protected void onPostResume() {
        super.onPostResume();
        this.Eo.onPostResume();
    }

    public View onCreatePanelView(int i) {
        if (i == 0) {
            return this.Eo.onCreatePanelView(i);
        }
        return super.onCreatePanelView(i);
    }

    protected void onTitleChanged(CharSequence charSequence, int i) {
        super.onTitleChanged(charSequence, i);
        this.Eo.onTitleChanged(charSequence);
    }

    public void invalidateOptionsMenu() {
        this.Eo.invalidateOptionsMenu();
    }

    public boolean requestExtraWindowFeature(int i) {
        return this.Eo.requestWindowFeature(i);
    }

    public boolean onCreatePanelMenu(int i, Menu menu) {
        return this.Eo.onCreatePanelMenu(i, menu);
    }

    public boolean onPreparePanel(int i, View view, Menu menu) {
        return this.Eo.onPreparePanel(i, view, menu);
    }

    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        return this.Eo.onMenuItemSelected(i, menuItem);
    }

    public ActionMode startActionMode(Callback callback) {
        return this.Eo.startActionMode(callback);
    }

    public ActionMode onWindowStartingActionMode(Callback callback) {
        return this.Eo.onWindowStartingActionMode(callback);
    }

    public ActionMode onWindowStartingActionMode(Callback callback, int i) {
        if (i == 0) {
            return this.Eo.onWindowStartingActionMode(callback);
        }
        return null;
    }

    public void onActionModeStarted(ActionMode actionMode) {
        this.Eo.onActionModeStarted(actionMode);
    }

    public void onActionModeFinished(ActionMode actionMode) {
        this.Eo.onActionModeFinished(actionMode);
    }

    public void onBackPressed() {
        if (!this.Eo.onBackPressed()) {
            super.onBackPressed();
        }
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.Eo.setImmersionMenuEnabled(z);
    }

    public void showImmersionMenu() {
        this.Eo.showImmersionMenu();
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        this.Eo.showImmersionMenu(view, viewGroup);
    }

    public void dismissImmersionMenu(boolean z) {
        this.Eo.dismissImmersionMenu(z);
    }

    public void setTranslucentStatus(int i) {
        this.Eo.setTranslucentStatus(i);
    }

    public int getTranslucentStatus() {
        return this.Eo.getTranslucentStatus();
    }

    public void setOnStatusBarChangeListener(OnStatusBarChangeListener onStatusBarChangeListener) {
        this.Eo.setOnStatusBarChangeListener(onStatusBarChangeListener);
    }
}
