package miui.preference;

import android.content.res.Configuration;
import android.os.Bundle;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import com.miui.internal.R;
import com.miui.internal.app.ActivityDelegate;
import com.miui.internal.variable.Android_App_PreferenceActivity_class.Factory;
import miui.app.ActionBar;
import miui.app.IActivity;
import miui.util.AttributeResolver;

public class PreferenceActivity extends android.preference.PreferenceActivity implements IActivity {
    private ActivityDelegate iR = new ActivityDelegate(this, android.preference.PreferenceActivity.class);

    public ActionBar getActionBar() {
        return this.iR.getActionBar();
    }

    public MenuInflater getMenuInflater() {
        return this.iR.getMenuInflater();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.iR.onCreate(bundle);
        ListView listView = (ListView) findViewById(16908298);
        if (listView != null) {
            listView.setClipToPadding(false);
            listView.setPadding(0, 0, 0, (int) AttributeResolver.resolveDimension(this, R.attr.preferenceScreenPaddingBottom));
            ViewGroup viewGroup = (ViewGroup) listView.getParent();
            if (viewGroup != null) {
                viewGroup.setPadding(0, 0, 0, 0);
            }
        }
        Factory.getInstance().get().onCreate(this, bundle);
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.iR.onConfigurationChanged(configuration);
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        this.iR.onSaveInstanceState(bundle);
    }

    protected void onRestoreInstanceState(Bundle bundle) {
        super.onRestoreInstanceState(bundle);
        this.iR.onRestoreInstanceState(bundle);
    }

    protected void onStop() {
        super.onStop();
        this.iR.onStop();
    }

    protected void onPostResume() {
        super.onPostResume();
        this.iR.onPostResume();
    }

    public View onCreatePanelView(int i) {
        if (i == 0) {
            return this.iR.onCreatePanelView(i);
        }
        return super.onCreatePanelView(i);
    }

    protected void onTitleChanged(CharSequence charSequence, int i) {
        super.onTitleChanged(charSequence, i);
        this.iR.onTitleChanged(charSequence);
    }

    public void invalidateOptionsMenu() {
        this.iR.invalidateOptionsMenu();
    }

    public boolean requestExtraWindowFeature(int i) {
        return this.iR.requestWindowFeature(i);
    }

    public ActionMode startActionMode(Callback callback) {
        return this.iR.startActionMode(callback);
    }

    public ActionMode onWindowStartingActionMode(Callback callback) {
        return this.iR.onWindowStartingActionMode(callback);
    }

    public void onActionModeStarted(ActionMode actionMode) {
        this.iR.onActionModeStarted(actionMode);
    }

    public void onActionModeFinished(ActionMode actionMode) {
        this.iR.onActionModeFinished(actionMode);
    }

    public boolean onCreatePanelMenu(int i, Menu menu) {
        return this.iR.onCreatePanelMenu(i, menu);
    }

    public boolean onPreparePanel(int i, View view, Menu menu) {
        return this.iR.onPreparePanel(i, view, menu);
    }

    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        return this.iR.onMenuItemSelected(i, menuItem);
    }

    public void onBackPressed() {
        if (!this.iR.onBackPressed()) {
            super.onBackPressed();
        }
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.iR.setImmersionMenuEnabled(z);
    }

    public void showImmersionMenu() {
        this.iR.showImmersionMenu();
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        this.iR.showImmersionMenu(view, viewGroup);
    }

    public void dismissImmersionMenu(boolean z) {
        this.iR.dismissImmersionMenu(z);
    }

    public void setTranslucentStatus(int i) {
        this.iR.setTranslucentStatus(i);
    }

    public int getTranslucentStatus() {
        return this.iR.getTranslucentStatus();
    }

    protected void onDestroy() {
        super.onDestroy();
        this.iR.dismissImmersionMenu(false);
    }
}
