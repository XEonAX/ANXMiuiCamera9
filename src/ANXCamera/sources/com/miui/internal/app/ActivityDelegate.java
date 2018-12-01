package com.miui.internal.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.util.SparseArray;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.miui.internal.R;
import com.miui.internal.variable.Android_View_Window_class.Factory;
import com.miui.internal.view.menu.MenuBuilder;
import com.miui.internal.view.menu.MenuPresenter.Callback;
import com.miui.internal.widget.ActionBarContainer;
import com.miui.internal.widget.ActionBarContextView;
import com.miui.internal.widget.ActionBarOverlayLayout;
import com.miui.internal.widget.ActionBarView;
import miui.app.ActionBar;
import miui.app.OnStatusBarChangeListener;
import miui.extension.ExtensionManager;
import miui.reflect.Method;
import miui.util.AppConstants;
import miui.util.AttributeResolver;

public class ActivityDelegate extends ActionBarDelegateImpl implements Callback, MenuBuilder.Callback {
    private static final String adZ = "miui:ActionBar";
    private static final Method aea = Method.of(Activity.class, "onCreatePanelMenu", "(ILandroid/view/Menu;)Z");
    private static final Method aeb = Method.of(Activity.class, "onMenuItemSelected", "(ILandroid/view/MenuItem;)Z");
    private static final Method aec = Method.of(Activity.class, "onPreparePanel", "(ILandroid/view/View;Landroid/view/Menu;)Z");
    private ActionBarContainer aed;
    private final Class<? extends Activity> aee;
    private final Runnable aef = new Runnable() {
        public void run() {
            Object createMenu = ActivityDelegate.this.createMenu();
            if (!ActivityDelegate.this.isImmersionMenuEnabled() && ActivityDelegate.this.zx(0, createMenu) && ActivityDelegate.this.zz(0, null, createMenu)) {
                ActivityDelegate.this.setMenu(createMenu);
            } else {
                ActivityDelegate.this.setMenu(null);
            }
        }
    };
    private ActionBarOverlayLayout aeg;

    public ActivityDelegate(Activity activity, Class<? extends Activity> cls) {
        super(activity);
        this.aee = cls;
    }

    public static int getDecorViewLayoutRes(Window window) {
        int i;
        Context context = window.getContext();
        if (!AttributeResolver.resolveBoolean(context, R.attr.windowActionBar, false)) {
            i = R.layout.screen_simple;
        } else if (AttributeResolver.resolveBoolean(context, R.attr.windowActionBarMovable, false)) {
            i = R.layout.screen_action_bar_movable;
        } else {
            i = R.layout.screen_action_bar;
        }
        int resolve = AttributeResolver.resolve(context, miui.R.attr.startingWindowOverlay);
        if (resolve > 0 && zv() && zw(context)) {
            i = resolve;
        }
        if (!window.isFloating() && (window.getCallback() instanceof Dialog)) {
            Factory.getInstance().get().setTranslucentStatus(window, AttributeResolver.resolveInt(context, R.attr.windowTranslucentStatus, 0));
        }
        return i;
    }

    private static boolean zv() {
        return "android".equals(AppConstants.getCurrentApplication().getApplicationInfo().packageName);
    }

    private static boolean zw(Context context) {
        return AttributeResolver.resolveBoolean(context, miui.R.attr.windowActionBar, true);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        installSubDecor();
        ExtensionManager.getInstance().invoke("Activity", "onCreate", new Object[]{this.mActivity, bundle});
    }

    public ActionBar createActionBar() {
        return new ActionBarImpl(this.mActivity);
    }

    public void onStop() {
        dismissImmersionMenu(false);
        ActionBarImpl actionBarImpl = (ActionBarImpl) getActionBar();
        if (actionBarImpl != null) {
            actionBarImpl.setShowHideAnimationEnabled(false);
        }
    }

    public void onPostResume() {
        ActionBarImpl actionBarImpl = (ActionBarImpl) getActionBar();
        if (actionBarImpl != null) {
            actionBarImpl.setShowHideAnimationEnabled(true);
        }
    }

    protected void installSubDecor() {
        if (!this.mSubDecorInstalled) {
            this.mSubDecorInstalled = true;
            TypedArray obtainStyledAttributes = this.mActivity.obtainStyledAttributes(miui.R.styleable.Window);
            if (obtainStyledAttributes.getInt(miui.R.styleable.Window_windowLayoutMode, 0) == 1) {
                this.mActivity.getWindow().setGravity(80);
            }
            if (obtainStyledAttributes.hasValue(miui.R.styleable.Window_windowActionBar)) {
                if (obtainStyledAttributes.getBoolean(miui.R.styleable.Window_windowActionBar, false)) {
                    requestWindowFeature(8);
                }
                if (obtainStyledAttributes.getBoolean(miui.R.styleable.Window_windowActionBarOverlay, false)) {
                    requestWindowFeature(9);
                }
                setTranslucentStatus(obtainStyledAttributes.getInt(R.styleable.Window_windowTranslucentStatus, 0));
                ViewGroup viewGroup = (ViewGroup) ((ViewGroup) this.mActivity.getWindow().getDecorView()).getChildAt(0);
                if (viewGroup instanceof ActionBarOverlayLayout) {
                    this.aeg = (ActionBarOverlayLayout) viewGroup;
                } else {
                    this.aeg = (ActionBarOverlayLayout) viewGroup.getChildAt(0);
                }
                this.aeg.setCallback(this.mActivity);
                this.aeg.setTranslucentStatus(getTranslucentStatus());
                if (this.aeh) {
                    boolean z;
                    this.aed = (ActionBarContainer) this.aeg.findViewById(R.id.action_bar_container);
                    this.aeg.setOverlayMode(this.aei);
                    this.mActionBarView = (ActionBarView) this.aeg.findViewById(R.id.action_bar);
                    this.mActionBarView.setWindowCallback(this.mActivity);
                    if (this.mFeatureProgress) {
                        this.mActionBarView.initProgress();
                    }
                    if (this.mFeatureIndeterminateProgress) {
                        this.mActionBarView.initIndeterminateProgress();
                    }
                    this.mImmersionLayoutResourceId = obtainStyledAttributes.getResourceId(R.styleable.Window_immersionMenuLayout, 0);
                    if (isImmersionMenuEnabled()) {
                        this.mActionBarView.initImmersionMore(this.mImmersionLayoutResourceId, this);
                    }
                    if (this.mActionBarView.getCustomNavigationView() != null) {
                        this.mActionBarView.setDisplayOptions(this.mActionBarView.getDisplayOptions() | 16);
                    }
                    boolean equals = "splitActionBarWhenNarrow".equals(getUiOptionsFromMetadata());
                    if (equals) {
                        z = this.mActivity.getResources().getBoolean(R.bool.abc_split_action_bar_is_narrow);
                    } else {
                        z = obtainStyledAttributes.getBoolean(miui.R.styleable.Window_windowSplitActionBar, false);
                    }
                    ActionBarContainer actionBarContainer = (ActionBarContainer) this.aeg.findViewById(R.id.split_action_bar);
                    if (actionBarContainer != null) {
                        this.mActionBarView.setSplitView(actionBarContainer);
                        this.mActionBarView.setSplitActionBar(z);
                        this.mActionBarView.setSplitWhenNarrow(equals);
                        ActionBarContextView actionBarContextView = (ActionBarContextView) this.aeg.findViewById(R.id.action_context_bar);
                        actionBarContainer.setActionBarContextView(actionBarContextView);
                        actionBarContextView.setSplitView(actionBarContainer);
                        actionBarContextView.setSplitActionBar(z);
                        actionBarContextView.setSplitWhenNarrow(equals);
                    }
                    this.mActivity.getWindow().getDecorView().post(this.aef);
                }
                if (obtainStyledAttributes.getBoolean(R.styleable.Window_immersionMenuEnabled, false)) {
                    setImmersionMenuEnabled(true);
                }
                obtainStyledAttributes.recycle();
                return;
            }
            obtainStyledAttributes.recycle();
            throw new IllegalStateException("You need to use a miui theme (or descendant) with this activity.");
        }
    }

    public void onTitleChanged(CharSequence charSequence) {
        if (this.mActionBarView != null) {
            this.mActionBarView.setWindowTitle(charSequence);
        }
    }

    public View onCreatePanelView(int i) {
        if (i == 0 && (isImmersionMenuEnabled() ^ 1) != 0) {
            boolean z = true;
            MenuBuilder menuBuilder = this.mMenu;
            if (this.mActionMode == null) {
                if (menuBuilder == null) {
                    menuBuilder = createMenu();
                    setMenu(menuBuilder);
                    menuBuilder.stopDispatchingItemsChanged();
                    z = zx(0, menuBuilder);
                }
                if (z) {
                    menuBuilder.stopDispatchingItemsChanged();
                    z = zz(0, null, menuBuilder);
                }
            }
            if (z) {
                menuBuilder.startDispatchingItemsChanged();
            } else {
                setMenu(null);
            }
        }
        return null;
    }

    public boolean onCreatePanelMenu(int i, Menu menu) {
        return i != 0 ? zx(i, menu) : false;
    }

    public boolean onPreparePanel(int i, View view, Menu menu) {
        return i != 0 ? zz(i, view, menu) : false;
    }

    public void onSaveInstanceState(Bundle bundle) {
        if (this.aed != null) {
            SparseArray sparseArray = new SparseArray();
            this.aed.saveHierarchyState(sparseArray);
            bundle.putSparseParcelableArray(adZ, sparseArray);
        }
    }

    public void onRestoreInstanceState(Bundle bundle) {
        if (this.aed != null) {
            SparseArray sparseParcelableArray = bundle.getSparseParcelableArray(adZ);
            if (sparseParcelableArray != null) {
                this.aed.restoreHierarchyState(sparseParcelableArray);
            }
        }
    }

    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (!(zy(i, menuItem) || i != 0 || menuItem.getItemId() != 16908332 || getActionBar() == null || (getActionBar().getDisplayOptions() & 4) == 0)) {
            boolean onNavigateUp;
            if (this.mActivity.getParent() == null) {
                onNavigateUp = this.mActivity.onNavigateUp();
            } else {
                onNavigateUp = this.mActivity.getParent().onNavigateUpFromChild(this.mActivity);
            }
            if (!onNavigateUp) {
                this.mActivity.finish();
            }
        }
        return true;
    }

    public boolean onMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
        return this.mActivity.onMenuItemSelected(0, menuItem);
    }

    public void invalidateOptionsMenu() {
        this.aef.run();
    }

    public ActionMode startActionMode(ActionMode.Callback callback) {
        return this.aeg.startActionMode(callback);
    }

    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        if (getActionBar() != null) {
            return ((ActionBarImpl) getActionBar()).startActionMode(callback);
        }
        return null;
    }

    public void onActionModeStarted(ActionMode actionMode) {
        this.mActionMode = actionMode;
    }

    public void onActionModeFinished(ActionMode actionMode) {
        this.mActionMode = null;
    }

    public boolean onBackPressed() {
        if (this.mActionMode != null) {
            this.mActionMode.finish();
            return true;
        } else if (this.mActionBarView == null || !this.mActionBarView.hasExpandedActionView()) {
            return false;
        } else {
            this.mActionBarView.collapseActionView();
            return true;
        }
    }

    private boolean zx(int i, Menu menu) {
        return aea.invokeBoolean(this.aee, getActivity(), Integer.valueOf(i), menu);
    }

    private boolean zz(int i, View view, Menu menu) {
        return aec.invokeBoolean(this.aee, getActivity(), Integer.valueOf(i), view, menu);
    }

    private boolean zy(int i, MenuItem menuItem) {
        return aeb.invokeBoolean(this.aee, getActivity(), Integer.valueOf(i), menuItem);
    }

    protected boolean onCreateImmersionMenu(MenuBuilder menuBuilder) {
        return this.mActivity.onCreateOptionsMenu(menuBuilder);
    }

    protected boolean onPrepareImmersionMenu(MenuBuilder menuBuilder) {
        return this.mActivity.onPrepareOptionsMenu(menuBuilder);
    }

    public void setOnStatusBarChangeListener(OnStatusBarChangeListener onStatusBarChangeListener) {
        if (this.aeg != null) {
            this.aeg.setOnStatusBarChangeListener(onStatusBarChangeListener);
        }
    }

    public Context getThemedContext() {
        return this.mActivity;
    }
}
