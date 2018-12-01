package com.miui.internal.app;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.ActionMode;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.internal.R;
import com.miui.internal.util.DeviceHelper;
import com.miui.internal.variable.Android_View_Window_class.Factory;
import com.miui.internal.view.menu.ImmersionMenuPopupWindow;
import com.miui.internal.view.menu.MenuBuilder;
import com.miui.internal.view.menu.MenuPresenter.Callback;
import com.miui.internal.view.menu.PadImmersionMenuPopupWindow;
import com.miui.internal.view.menu.PhoneImmersionMenuPopupWindow;
import com.miui.internal.widget.ActionBarView;
import miui.app.ActionBar;

public abstract class ActionBarDelegateImpl implements a, Callback, MenuBuilder.Callback {
    private static final String TAG = "ActionBarDelegate";
    static final String aej = "splitActionBarWhenNarrow";
    static final String aek = "android.support.UI_OPTIONS";
    boolean aeh;
    boolean aei;
    private ActionBar ael;
    private MenuBuilder aem;
    private boolean aen;
    private MenuInflater aeo;
    private ImmersionMenuPopupWindow aep;
    private int aeq = 0;
    protected ActionBarView mActionBarView;
    protected ActionMode mActionMode;
    final Activity mActivity;
    protected boolean mFeatureIndeterminateProgress;
    protected boolean mFeatureProgress;
    protected int mImmersionLayoutResourceId;
    protected MenuBuilder mMenu;
    protected boolean mSubDecorInstalled;

    public abstract Context getThemedContext();

    protected abstract boolean onCreateImmersionMenu(MenuBuilder menuBuilder);

    protected abstract boolean onPrepareImmersionMenu(MenuBuilder menuBuilder);

    ActionBarDelegateImpl(Activity activity) {
        this.mActivity = activity;
    }

    public final ActionBar getActionBar() {
        if (!this.aeh && !this.aei) {
            this.ael = null;
        } else if (this.ael == null) {
            this.ael = createActionBar();
        }
        return this.ael;
    }

    public MenuInflater getMenuInflater() {
        if (this.aeo == null) {
            ActionBar actionBar = getActionBar();
            if (actionBar != null) {
                this.aeo = new MenuInflater(actionBar.getThemedContext());
            } else {
                this.aeo = new MenuInflater(this.mActivity);
            }
        }
        return this.aeo;
    }

    public void onCreate(Bundle bundle) {
    }

    protected final String getUiOptionsFromMetadata() {
        String str = null;
        try {
            ActivityInfo activityInfo = this.mActivity.getPackageManager().getActivityInfo(this.mActivity.getComponentName(), 128);
            if (activityInfo.metaData != null) {
                str = activityInfo.metaData.getString(aek);
            }
            return str;
        } catch (NameNotFoundException e) {
            Log.e(TAG, "getUiOptionsFromMetadata: Activity '" + this.mActivity.getClass().getSimpleName() + "' not in manifest");
            return null;
        }
    }

    protected final Context getActionBarThemedContext() {
        Context context = this.mActivity;
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            return actionBar.getThemedContext();
        }
        return context;
    }

    public Activity getActivity() {
        return this.mActivity;
    }

    public void onConfigurationChanged(Configuration configuration) {
        if (this.aeh && this.mSubDecorInstalled) {
            ((ActionBarImpl) getActionBar()).onConfigurationChanged(configuration);
        }
    }

    public void onStop() {
        dismissImmersionMenu(false);
        if (this.aeh && this.mSubDecorInstalled) {
            ActionBarImpl actionBarImpl = (ActionBarImpl) getActionBar();
            if (actionBarImpl != null) {
                actionBarImpl.setShowHideAnimationEnabled(false);
            }
        }
    }

    public void onPostResume() {
        if (this.aeh && this.mSubDecorInstalled) {
            ActionBarImpl actionBarImpl = (ActionBarImpl) getActionBar();
            if (actionBarImpl != null) {
                actionBarImpl.setShowHideAnimationEnabled(true);
            }
        }
    }

    public boolean requestWindowFeature(int i) {
        switch (i) {
            case 2:
                this.mFeatureProgress = true;
                return true;
            case 5:
                this.mFeatureIndeterminateProgress = true;
                return true;
            case 8:
                this.aeh = true;
                return true;
            case 9:
                this.aei = true;
                return true;
            default:
                return this.mActivity.requestWindowFeature(i);
        }
    }

    public ActionMode startActionMode(ActionMode.Callback callback) {
        return null;
    }

    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        return null;
    }

    public void onActionModeStarted(ActionMode actionMode) {
    }

    public void onActionModeFinished(ActionMode actionMode) {
    }

    protected void reopenMenu(MenuBuilder menuBuilder, boolean z) {
        if (this.mActionBarView == null || !this.mActionBarView.isOverflowReserved()) {
            menuBuilder.close();
            return;
        }
        if (this.mActionBarView.isOverflowMenuShowing() && (z ^ 1) == 0) {
            this.mActionBarView.hideOverflowMenu();
        } else if (this.mActionBarView.getVisibility() == 0) {
            this.mActionBarView.showOverflowMenu();
        }
    }

    protected void setMenu(MenuBuilder menuBuilder) {
        if (menuBuilder != this.mMenu) {
            this.mMenu = menuBuilder;
            if (this.mActionBarView != null) {
                this.mActionBarView.setMenu(menuBuilder, this);
            }
        }
    }

    protected MenuBuilder createMenu() {
        MenuBuilder menuBuilder = new MenuBuilder(getActionBarThemedContext());
        menuBuilder.setCallback(this);
        return menuBuilder;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        this.mActivity.closeOptionsMenu();
    }

    public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
        return false;
    }

    public void onMenuModeChange(MenuBuilder menuBuilder) {
        reopenMenu(menuBuilder, true);
    }

    public void setTranslucentStatus(int i) {
        int integer = this.mActivity.getResources().getInteger(R.integer.window_translucent_status);
        if (integer >= 0 && integer <= 2) {
            i = integer;
        }
        if (this.aeq != i && Factory.getInstance().get().setTranslucentStatus(this.mActivity.getWindow(), i)) {
            this.aeq = i;
        }
    }

    public int getTranslucentStatus() {
        return this.aeq;
    }

    public void setImmersionMenuEnabled(boolean z) {
        this.aen = z;
        if (this.mSubDecorInstalled && this.aeh) {
            if (!z) {
                this.mActionBarView.hideImmersionMore();
            } else if (!this.mActionBarView.showImmersionMore()) {
                this.mActionBarView.initImmersionMore(this.mImmersionLayoutResourceId, this);
            }
            invalidateOptionsMenu();
        }
    }

    public boolean isImmersionMenuEnabled() {
        return this.aen;
    }

    public void showImmersionMenu() {
        if (this.mActionBarView != null) {
            View findViewById = this.mActionBarView.findViewById(R.id.more);
            if (findViewById != null) {
                showImmersionMenu(findViewById, this.mActionBarView);
                return;
            }
        }
        throw new IllegalStateException("Can't find anchor view in actionbar. Do you use default actionbar and immersion menu is enabled?");
    }

    public void showImmersionMenu(View view, ViewGroup viewGroup) {
        if (!this.aen) {
            Log.w(TAG, "Try to show immersion menu when immersion menu disabled");
        } else if (view == null) {
            throw new IllegalArgumentException("You must specify a valid anchor view");
        } else {
            if (this.aem == null) {
                this.aem = createMenu();
                onCreateImmersionMenu(this.aem);
            }
            if (onPrepareImmersionMenu(this.aem) && this.aem.hasVisibleItems()) {
                if (this.aep != null) {
                    this.aep.update(this.aem);
                } else if (DeviceHelper.IS_TABLET) {
                    this.aep = new PadImmersionMenuPopupWindow(this, this.aem);
                } else {
                    this.aep = new PhoneImmersionMenuPopupWindow(this, this.aem);
                }
                if (!this.aep.isShowing()) {
                    this.aep.show(view, viewGroup);
                }
            }
        }
    }

    public void dismissImmersionMenu(boolean z) {
        if (this.aep != null) {
            this.aep.dismiss(z);
        }
    }
}
