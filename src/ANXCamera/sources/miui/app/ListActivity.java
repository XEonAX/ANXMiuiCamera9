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

public class ListActivity extends android.app.ListActivity implements IActivity {
    private ActivityDelegate EK = new ActivityDelegate(this, android.app.ListActivity.class);

    public ActionBar getActionBar() {
        return this.EK.getActionBar();
    }

    public MenuInflater getMenuInflater() {
        return this.EK.getMenuInflater();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.EK.onCreate(bundle);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.EK.onConfigurationChanged(configuration);
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        this.EK.onSaveInstanceState(bundle);
    }

    protected void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        this.EK.onRestoreInstanceState(bundle);
    }

    protected void onStop() {
        super.onStop();
        this.EK.onStop();
    }

    protected void onPostResume() {
        super.onPostResume();
        this.EK.onPostResume();
    }

    public View onCreatePanelView(int i) {
        if (i == 0) {
            return this.EK.onCreatePanelView(i);
        }
        return super.onCreatePanelView(i);
    }

    protected void onTitleChanged(CharSequence charSequence, int i) {
        super.onTitleChanged(charSequence, i);
        this.EK.onTitleChanged(charSequence);
    }

    public void invalidateOptionsMenu() {
        this.EK.invalidateOptionsMenu();
    }

    public boolean requestExtraWindowFeature(int i) {
        return this.EK.requestWindowFeature(i);
    }

    public ActionMode startActionMode(Callback callback) {
        return this.EK.startActionMode(callback);
    }

    public ActionMode onWindowStartingActionMode(Callback callback) {
        return this.EK.onWindowStartingActionMode(callback);
    }

    public void onActionModeStarted(ActionMode actionMode) {
        this.EK.onActionModeStarted(actionMode);
    }

    public void onActionModeFinished(ActionMode actionMode) {
        this.EK.onActionModeFinished(actionMode);
    }

    public boolean onCreatePanelMenu(int i, Menu menu) {
        return this.EK.onCreatePanelMenu(i, menu);
    }

    public boolean onPreparePanel(int i, View view, Menu menu) {
        return this.EK.onPreparePanel(i, view, menu);
    }

    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        return this.EK.onMenuItemSelected(i, menuItem);
    }

    public void onBackPressed() {
        if (!this.EK.onBackPressed()) {
            super.onBackPressed();
        }
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.EK.setImmersionMenuEnabled(z);
    }

    public void showImmersionMenu() {
        this.EK.showImmersionMenu();
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        this.EK.showImmersionMenu(view, viewGroup);
    }

    public void dismissImmersionMenu(boolean z) {
        this.EK.dismissImmersionMenu(z);
    }

    public void setTranslucentStatus(int i) {
        this.EK.setTranslucentStatus(i);
    }

    public int getTranslucentStatus() {
        return this.EK.getTranslucentStatus();
    }

    protected void onDestroy() {
        super.onDestroy();
        this.EK.dismissImmersionMenu(false);
    }
}
