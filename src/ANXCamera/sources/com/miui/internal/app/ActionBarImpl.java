package com.miui.internal.app;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.ActionBar.LayoutParams;
import android.app.ActionBar.OnMenuVisibilityListener;
import android.app.ActionBar.OnNavigationListener;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.Activity;
import android.app.Dialog;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.SpinnerAdapter;
import com.miui.internal.R;
import com.miui.internal.view.ActionBarPolicy;
import com.miui.internal.view.ActionModeImpl;
import com.miui.internal.view.ActionModeImpl.ActionModeCallback;
import com.miui.internal.view.EditActionModeImpl;
import com.miui.internal.view.SearchActionModeImpl;
import com.miui.internal.view.menu.ActionMenuView;
import com.miui.internal.view.menu.PhoneActionMenuView;
import com.miui.internal.widget.ActionBarContainer;
import com.miui.internal.widget.ActionBarContextView;
import com.miui.internal.widget.ActionBarOverlayLayout;
import com.miui.internal.widget.ActionBarView;
import com.miui.internal.widget.ActionModeView;
import com.miui.internal.widget.ScrollingTabContainerView;
import com.miui.internal.widget.SearchActionModeView;
import java.util.ArrayList;
import miui.app.ActionBar;
import miui.app.ActionBar.FragmentViewPagerChangeListener;
import miui.app.IFragment;
import miui.view.SearchActionMode;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class ActionBarImpl extends ActionBar {
    private static final int aeA = 1;
    private static final int aeB = -1;
    private static final int aez = 0;
    private static TabListener aff = new TabListener() {
        public void onTabSelected(Tab tab, FragmentTransaction fragmentTransaction) {
            TabImpl tabImpl = (TabImpl) tab;
            if (tabImpl.afk != null) {
                tabImpl.afk.onTabSelected(tab, fragmentTransaction);
            }
            if (tabImpl.afg != null) {
                tabImpl.afg.onTabSelected(tab, fragmentTransaction);
            }
        }

        public void onTabUnselected(Tab tab, FragmentTransaction fragmentTransaction) {
            TabImpl tabImpl = (TabImpl) tab;
            if (tabImpl.afk != null) {
                tabImpl.afk.onTabUnselected(tab, fragmentTransaction);
            }
            if (tabImpl.afg != null) {
                tabImpl.afg.onTabUnselected(tab, fragmentTransaction);
            }
        }

        public void onTabReselected(Tab tab, FragmentTransaction fragmentTransaction) {
            TabImpl tabImpl = (TabImpl) tab;
            if (tabImpl.afk != null) {
                tabImpl.afk.onTabReselected(tab, fragmentTransaction);
            }
            if (tabImpl.afg != null) {
                tabImpl.afg.onTabReselected(tab, fragmentTransaction);
            }
        }
    };
    private ActionModeCallback aeC = new ActionModeCallback() {
        public void onActionModeFinish(ActionMode actionMode) {
            ActionBarImpl.this.zI(false);
            ActionBarImpl.this.mActionMode = null;
        }
    };
    private ActionModeView aeD;
    private ActionBarView aeE;
    private Animator aeF;
    private ActionBarContainer aeG;
    private View aeH;
    private OnClickListener aeI;
    private int aeJ;
    private ActionBarContextView aeK;
    private int aeL = 0;
    private boolean aeM;
    private FragmentManager aeN;
    private boolean aeO;
    private boolean aeP;
    private boolean aeQ;
    private ArrayList<OnMenuVisibilityListener> aeR = new ArrayList();
    private boolean aeS = true;
    private ActionBarOverlayLayout aeT;
    private int aeU = -1;
    private SearchActionModeView aeV;
    private TabImpl aeW;
    private boolean aeX;
    private boolean aeY;
    private PhoneActionMenuView aeZ;
    private Animator afa;
    private ScrollingTabContainerView afb;
    private ArrayList<TabImpl> afc = new ArrayList();
    private Context afd;
    private ActionBarViewPagerController afe;
    ActionMode mActionMode;
    private Context mContext;
    private ActionBarContainer mSplitView;

    public class TabImpl extends Tab {
        private TabListener afg;
        private CharSequence afh;
        private View afi;
        private Drawable afj;
        private TabListener afk;
        private int afl = -1;
        private Object afm;
        private CharSequence afn;

        public Object getTag() {
            return this.afm;
        }

        public Tab setTag(Object obj) {
            this.afm = obj;
            return this;
        }

        public TabListener getCallback() {
            return ActionBarImpl.aff;
        }

        public Tab setTabListener(TabListener tabListener) {
            this.afg = tabListener;
            return this;
        }

        public Tab setInternalTabListener(TabListener tabListener) {
            this.afk = tabListener;
            return this;
        }

        public View getCustomView() {
            return this.afi;
        }

        public Tab setCustomView(View view) {
            this.afi = view;
            if (this.afl >= 0) {
                ActionBarImpl.this.afb.updateTab(this.afl);
            }
            return this;
        }

        public Tab setCustomView(int i) {
            return setCustomView(LayoutInflater.from(ActionBarImpl.this.getThemedContext()).inflate(i, null));
        }

        public Drawable getIcon() {
            return this.afj;
        }

        public int getPosition() {
            return this.afl;
        }

        public void setPosition(int i) {
            this.afl = i;
        }

        public CharSequence getText() {
            return this.afn;
        }

        public Tab setIcon(Drawable drawable) {
            this.afj = drawable;
            if (this.afl >= 0) {
                ActionBarImpl.this.afb.updateTab(this.afl);
            }
            return this;
        }

        public Tab setIcon(int i) {
            return setIcon(ActionBarImpl.this.mContext.getResources().getDrawable(i));
        }

        public Tab setText(CharSequence charSequence) {
            this.afn = charSequence;
            if (this.afl >= 0) {
                ActionBarImpl.this.afb.updateTab(this.afl);
            }
            return this;
        }

        public Tab setText(int i) {
            return setText(ActionBarImpl.this.mContext.getResources().getText(i));
        }

        public void select() {
            ActionBarImpl.this.selectTab(this);
        }

        public Tab setContentDescription(int i) {
            return setContentDescription(ActionBarImpl.this.mContext.getResources().getText(i));
        }

        public Tab setContentDescription(CharSequence charSequence) {
            this.afh = charSequence;
            if (this.afl >= 0) {
                ActionBarImpl.this.afb.updateTab(this.afl);
            }
            return this;
        }

        public CharSequence getContentDescription() {
            return this.afh;
        }
    }

    public ActionBarImpl(Activity activity) {
        this.mContext = activity;
        this.aeN = activity.getFragmentManager();
        init((ViewGroup) activity.getWindow().getDecorView().findViewById(R.id.action_bar_overlay_layout));
        setTitle(activity.getTitle());
    }

    public ActionBarImpl(Fragment fragment) {
        CharSequence title;
        this.mContext = ((IFragment) fragment).getThemedContext();
        this.aeN = fragment.getFragmentManager();
        init((ViewGroup) fragment.getView());
        Activity activity = fragment.getActivity();
        if (activity != null) {
            title = activity.getTitle();
        } else {
            title = null;
        }
        setTitle(title);
    }

    public ActionBarImpl(Dialog dialog) {
        this.mContext = dialog.getContext();
        init((ViewGroup) dialog.getWindow().getDecorView().findViewById(R.id.action_bar_overlay_layout));
    }

    public static ActionBarImpl getActionBar(View view) {
        for (View view2 = view; view2 != null; view2 = view2.getParent() instanceof View ? (View) view2.getParent() : null) {
            if (view2 instanceof ActionBarOverlayLayout) {
                return (ActionBarImpl) ((ActionBarOverlayLayout) view2).getActionBar();
            }
        }
        return null;
    }

    private static boolean zJ(boolean z, boolean z2, boolean z3) {
        if (z3) {
            return true;
        }
        if (z || z2) {
            return false;
        }
        return true;
    }

    protected void init(ViewGroup viewGroup) {
        boolean z = true;
        this.aeT = (ActionBarOverlayLayout) viewGroup;
        this.aeT.setActionBar(this);
        this.aeE = (ActionBarView) viewGroup.findViewById(R.id.action_bar);
        this.aeK = (ActionBarContextView) viewGroup.findViewById(R.id.action_context_bar);
        this.aeG = (ActionBarContainer) viewGroup.findViewById(R.id.action_bar_container);
        this.mSplitView = (ActionBarContainer) viewGroup.findViewById(R.id.split_action_bar);
        this.aeH = viewGroup.findViewById(R.id.content_mask);
        if (this.aeH != null) {
            this.aeI = new OnClickListener() {
                public void onClick(View view) {
                    if (ActionBarImpl.this.aeZ != null && ActionBarImpl.this.aeZ.isOverflowMenuShowing()) {
                        ActionBarImpl.this.aeZ.getPresenter().hideOverflowMenu(true);
                    }
                }
            };
        }
        if (this.aeE == null || this.aeK == null || this.aeG == null) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with a compatible window decor layout");
        }
        int i;
        boolean z2;
        if (this.aeE.isSplitActionBar()) {
            i = 1;
        } else {
            i = 0;
        }
        this.aeJ = i;
        if ((this.aeE.getDisplayOptions() & 4) != 0) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (z2) {
            this.aeM = true;
        }
        ActionBarPolicy actionBarPolicy = ActionBarPolicy.get(this.mContext);
        if (!actionBarPolicy.enableHomeButtonByDefault()) {
            z = z2;
        }
        setHomeButtonEnabled(z);
        Ab(actionBarPolicy.hasEmbeddedTabs());
    }

    public void onConfigurationChanged(Configuration configuration) {
        Ab(ActionBarPolicy.get(this.mContext).hasEmbeddedTabs());
    }

    private void Ab(boolean z) {
        boolean z2;
        this.aeO = z;
        if (this.aeO) {
            this.aeG.setTabContainer(null);
            this.aeE.setEmbeddedTabView(this.afb);
        } else {
            this.aeE.setEmbeddedTabView(null);
            this.aeG.setTabContainer(this.afb);
        }
        if (getNavigationMode() == 2) {
            z2 = true;
        } else {
            z2 = false;
        }
        if (this.afb != null) {
            if (z2) {
                this.afb.setVisibility(0);
            } else {
                this.afb.setVisibility(8);
            }
            this.afb.setEmbeded(this.aeO);
        }
        ActionBarView actionBarView = this.aeE;
        if (this.aeO) {
            z2 = false;
        }
        actionBarView.setCollapsable(z2);
    }

    public boolean hasNonEmbeddedTabs() {
        return !this.aeO && getNavigationMode() == 2;
    }

    public void setTabsMode(boolean z) {
        Ab(z);
    }

    public void setTabBadgeVisibility(int i, boolean z) {
        this.afb.setBadgeVisibility(i, z);
    }

    public void setCustomView(View view) {
        this.aeE.setCustomNavigationView(view);
    }

    public void setCustomView(View view, LayoutParams layoutParams) {
        view.setLayoutParams(layoutParams);
        this.aeE.setCustomNavigationView(view);
    }

    public void setIcon(int i) {
        this.aeE.setIcon(i);
    }

    public void setIcon(Drawable drawable) {
        this.aeE.setIcon(drawable);
    }

    public void setLogo(int i) {
        this.aeE.setLogo(i);
    }

    public void setLogo(Drawable drawable) {
        this.aeE.setLogo(drawable);
    }

    public void setListNavigationCallbacks(SpinnerAdapter spinnerAdapter, OnNavigationListener onNavigationListener) {
        this.aeE.setDropdownAdapter(spinnerAdapter);
        this.aeE.setCallback(onNavigationListener);
    }

    public void setSelectedNavigationItem(int i) {
        switch (this.aeE.getNavigationMode()) {
            case 1:
                this.aeE.setDropdownSelectedPosition(i);
                return;
            case 2:
                selectTab((Tab) this.afc.get(i));
                return;
            default:
                throw new IllegalStateException("setSelectedNavigationIndex not valid for current navigation mode");
        }
    }

    public int getSelectedNavigationIndex() {
        int i = -1;
        switch (this.aeE.getNavigationMode()) {
            case 1:
                return this.aeE.getDropdownSelectedPosition();
            case 2:
                if (this.aeW != null) {
                    i = this.aeW.getPosition();
                }
                return i;
            default:
                return -1;
        }
    }

    public int getNavigationItemCount() {
        int i = 0;
        switch (this.aeE.getNavigationMode()) {
            case 1:
                SpinnerAdapter dropdownAdapter = this.aeE.getDropdownAdapter();
                if (dropdownAdapter != null) {
                    i = dropdownAdapter.getCount();
                }
                return i;
            case 2:
                return this.afc.size();
            default:
                return 0;
        }
    }

    public void setTitle(CharSequence charSequence) {
        this.aeE.setTitle(charSequence);
    }

    public void setSubtitle(CharSequence charSequence) {
        this.aeE.setSubtitle(charSequence);
    }

    public void setDisplayOptions(int i, int i2) {
        int displayOptions = this.aeE.getDisplayOptions();
        if ((i2 & 4) != 0) {
            this.aeM = true;
        }
        this.aeE.setDisplayOptions((displayOptions & (~i2)) | (i & i2));
    }

    public void setDisplayUseLogoEnabled(boolean z) {
        setDisplayOptions(z ? 1 : 0, 1);
    }

    public void setDisplayShowHomeEnabled(boolean z) {
        setDisplayOptions(z ? 2 : 0, 2);
    }

    public void setDisplayHomeAsUpEnabled(boolean z) {
        setDisplayOptions(z ? 4 : 0, 4);
    }

    public void setDisplayShowTitleEnabled(boolean z) {
        setDisplayOptions(z ? 8 : 0, 8);
    }

    public void setDisplayShowCustomEnabled(boolean z) {
        setDisplayOptions(z ? 16 : 0, 16);
    }

    public void setHomeButtonEnabled(boolean z) {
        this.aeE.setHomeButtonEnabled(z);
    }

    public void setBackgroundDrawable(Drawable drawable) {
        this.aeG.setPrimaryBackground(drawable);
    }

    public void setSplitBackgroundDrawable(Drawable drawable) {
        if (this.mSplitView != null) {
            for (int i = 0; i < this.mSplitView.getChildCount(); i++) {
                if (this.mSplitView.getChildAt(i) instanceof ActionMenuView) {
                    this.mSplitView.getChildAt(i).setBackground(drawable);
                }
            }
        }
    }

    public View getCustomView() {
        return this.aeE.getCustomNavigationView();
    }

    public void setCustomView(int i) {
        setCustomView(LayoutInflater.from(getThemedContext()).inflate(i, this.aeE, false));
    }

    public CharSequence getTitle() {
        return this.aeE.getTitle();
    }

    public void setTitle(int i) {
        setTitle(this.mContext.getString(i));
    }

    public CharSequence getSubtitle() {
        return this.aeE.getSubtitle();
    }

    public void setSubtitle(int i) {
        setSubtitle(this.mContext.getString(i));
    }

    public int getNavigationMode() {
        return this.aeE.getNavigationMode();
    }

    public void setNavigationMode(int i) {
        boolean z = false;
        switch (this.aeE.getNavigationMode()) {
            case 2:
                this.aeU = getSelectedNavigationIndex();
                selectTab(null);
                this.afb.setVisibility(8);
                break;
        }
        this.aeE.setNavigationMode(i);
        switch (i) {
            case 2:
                zN();
                this.afb.setVisibility(0);
                if (this.aeU != -1) {
                    setSelectedNavigationItem(this.aeU);
                    this.aeU = -1;
                    break;
                }
                break;
        }
        ActionBarView actionBarView = this.aeE;
        if (i == 2) {
            z = this.aeO ^ 1;
        }
        actionBarView.setCollapsable(z);
    }

    public int getDisplayOptions() {
        return this.aeE.getDisplayOptions();
    }

    public void setDisplayOptions(int i) {
        if ((i & 4) != 0) {
            this.aeM = true;
        }
        this.aeE.setDisplayOptions(i);
    }

    public Tab newTab() {
        return new TabImpl();
    }

    public void addTab(Tab tab) {
        addTab(tab, this.afc.isEmpty());
    }

    public void addTab(Tab tab, boolean z) {
        if (isFragmentViewPagerMode()) {
            throw new IllegalStateException("Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab().");
        }
        zU(tab, z);
    }

    public void addTab(Tab tab, int i) {
        addTab(tab, i, this.afc.isEmpty());
    }

    public void addTab(Tab tab, int i, boolean z) {
        if (isFragmentViewPagerMode()) {
            throw new IllegalStateException("Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab().");
        }
        zW(tab, i, z);
    }

    ActionBarOverlayLayout zO() {
        return this.aeT;
    }

    void zT(Tab tab) {
        boolean z = false;
        if (getTabCount() == 0) {
            z = true;
        }
        zU(tab, z);
    }

    void zU(Tab tab, boolean z) {
        zN();
        this.afb.addTab(tab, z);
        zL(tab, this.afc.size());
        if (z) {
            selectTab(tab);
        }
    }

    void zV(Tab tab, int i) {
        zW(tab, i, i == getTabCount());
    }

    void zW(Tab tab, int i, boolean z) {
        zN();
        this.afb.addTab(tab, i, z);
        zL(tab, i);
        if (z) {
            selectTab(tab);
        }
    }

    public void removeTab(Tab tab) {
        if (isFragmentViewPagerMode()) {
            throw new IllegalStateException("Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab().");
        }
        zY(tab);
    }

    public void removeTabAt(int i) {
        if (isFragmentViewPagerMode()) {
            throw new IllegalStateException("Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab().");
        }
        zZ(i);
    }

    public void removeAllTabs() {
        if (isFragmentViewPagerMode()) {
            throw new IllegalStateException("Cannot add tab directly in fragment view pager mode!\n Please using addFragmentTab().");
        }
        zX();
    }

    void zY(Tab tab) {
        zZ(tab.getPosition());
    }

    void zZ(int i) {
        if (this.afb != null) {
            int position = this.aeW != null ? this.aeW.getPosition() : this.aeU;
            this.afb.removeTabAt(i);
            TabImpl tabImpl = (TabImpl) this.afc.remove(i);
            if (tabImpl != null) {
                tabImpl.setPosition(-1);
            }
            int size = this.afc.size();
            for (int i2 = i; i2 < size; i2++) {
                ((TabImpl) this.afc.get(i2)).setPosition(i2);
            }
            if (position == i) {
                Tab tab;
                if (this.afc.isEmpty()) {
                    tab = null;
                } else {
                    tabImpl = (TabImpl) this.afc.get(Math.max(0, i - 1));
                }
                selectTab(tab);
            }
        }
    }

    void zX() {
        zK();
    }

    public void selectTab(Tab tab) {
        int i = -1;
        if (getNavigationMode() != 2) {
            if (tab != null) {
                i = tab.getPosition();
            }
            this.aeU = i;
            return;
        }
        FragmentTransaction disallowAddToBackStack = this.aeN.beginTransaction().disallowAddToBackStack();
        if (this.aeW != tab) {
            ScrollingTabContainerView scrollingTabContainerView = this.afb;
            if (tab != null) {
                i = tab.getPosition();
            }
            scrollingTabContainerView.setTabSelected(i);
            if (this.aeW != null) {
                this.aeW.getCallback().onTabUnselected(this.aeW, disallowAddToBackStack);
            }
            this.aeW = (TabImpl) tab;
            if (this.aeW != null) {
                this.aeW.getCallback().onTabSelected(this.aeW, disallowAddToBackStack);
            }
        } else if (this.aeW != null) {
            this.aeW.getCallback().onTabReselected(this.aeW, disallowAddToBackStack);
            this.afb.animateToTab(tab.getPosition());
        }
        if (!disallowAddToBackStack.isEmpty()) {
            disallowAddToBackStack.commit();
        }
    }

    public Tab getSelectedTab() {
        return this.aeW;
    }

    public Tab getTabAt(int i) {
        return (Tab) this.afc.get(i);
    }

    public int getTabCount() {
        return this.afc.size();
    }

    public Context getThemedContext() {
        if (this.afd == null) {
            TypedValue typedValue = new TypedValue();
            this.mContext.getTheme().resolveAttribute(16843671, typedValue, true);
            int i = typedValue.resourceId;
            if (i != 0) {
                this.afd = new ContextThemeWrapper(this.mContext, i);
            } else {
                this.afd = this.mContext;
            }
        }
        return this.afd;
    }

    public int getHeight() {
        return this.aeG.getHeight();
    }

    public void show() {
        if (this.aeP) {
            this.aeP = false;
            Ae(false);
        }
    }

    void Ac() {
        if (!this.aeY) {
            this.aeY = true;
            Ae(false);
        }
    }

    public void hide() {
        if (!this.aeP) {
            this.aeP = true;
            Ae(false);
        }
    }

    void zS() {
        if (this.aeY) {
            this.aeY = false;
            Ae(false);
        }
    }

    public boolean isShowing() {
        return this.aeS;
    }

    public void addOnMenuVisibilityListener(OnMenuVisibilityListener onMenuVisibilityListener) {
        this.aeR.add(onMenuVisibilityListener);
    }

    public void removeOnMenuVisibilityListener(OnMenuVisibilityListener onMenuVisibilityListener) {
        this.aeR.remove(onMenuVisibilityListener);
    }

    public ActionMode startActionMode(Callback callback) {
        if (this.mActionMode != null) {
            this.mActionMode.finish();
        }
        ActionMode zM = zM(callback);
        if (((this.aeD instanceof SearchActionModeView) && (zM instanceof SearchActionModeImpl)) || ((this.aeD instanceof ActionBarContextView) && (zM instanceof EditActionModeImpl))) {
            this.aeD.closeMode();
            this.aeD.killMode();
        }
        this.aeD = createActionModeView(callback);
        if (zM instanceof ActionModeImpl) {
            ActionModeImpl actionModeImpl = (ActionModeImpl) zM;
            actionModeImpl.setActionModeView(this.aeD);
            actionModeImpl.setActionModeCallback(this.aeC);
            if (actionModeImpl.dispatchOnCreate()) {
                zM.invalidate();
                this.aeD.initForMode(zM);
                zI(true);
                if (!(this.mSplitView == null || this.aeJ != 1 || this.mSplitView.getVisibility() == 0)) {
                    this.mSplitView.setVisibility(0);
                }
                if (this.aeD instanceof ActionBarContextView) {
                    ((ActionBarContextView) this.aeD).sendAccessibilityEvent(32);
                }
                this.mActionMode = zM;
                return zM;
            }
        }
        return null;
    }

    void zI(boolean z) {
        if (z) {
            Ac();
        } else {
            zS();
        }
        this.aeD.animateToVisibility(z);
        if (this.afb != null && (this.aeE.hasEmbeddedTabs() ^ 1) != 0 && this.aeE.isCollapsed()) {
            this.afb.setVisibility(z ? 8 : 0);
        }
    }

    private ActionMode zM(Callback callback) {
        if (callback instanceof SearchActionMode.Callback) {
            return new SearchActionModeImpl(this.mContext, callback);
        }
        return new EditActionModeImpl(this.mContext, callback);
    }

    public ActionModeView createActionModeView(Callback callback) {
        if (!(callback instanceof SearchActionMode.Callback)) {
            return this.aeK;
        }
        if (this.aeV == null) {
            this.aeV = createSearchActionModeView();
        }
        if (this.aeT != this.aeV.getParent()) {
            this.aeT.addView(this.aeV);
        }
        return this.aeV;
    }

    public SearchActionModeView createSearchActionModeView() {
        SearchActionModeView searchActionModeView = (SearchActionModeView) LayoutInflater.from(getThemedContext()).inflate(R.layout.search_action_mode_view, this.aeT, false);
        searchActionModeView.setOnBackClickListener(new OnClickListener() {
            public void onClick(View view) {
                if (ActionBarImpl.this.mActionMode != null) {
                    ActionBarImpl.this.mActionMode.finish();
                }
            }
        });
        Rect pendingInsets = this.aeG.getPendingInsets();
        if (pendingInsets != null) {
            searchActionModeView.setStatusBarPaddingTop(pendingInsets.top);
        }
        return searchActionModeView;
    }

    public void showActionBarShadow(boolean z) {
    }

    public void showSplitActionBar(boolean z, boolean z2) {
        if (!this.aeE.isSplitActionBar()) {
            return;
        }
        if (z) {
            this.mSplitView.show(z2);
        } else {
            this.mSplitView.hide(z2);
        }
    }

    public boolean isFragmentViewPagerMode() {
        return this.afe != null;
    }

    public void setFragmentViewPagerMode(Context context, FragmentManager fragmentManager) {
        setFragmentViewPagerMode(context, fragmentManager, true);
    }

    public void setFragmentViewPagerMode(Context context, FragmentManager fragmentManager, boolean z) {
        if (!isFragmentViewPagerMode()) {
            removeAllTabs();
            setNavigationMode(2);
            this.afe = new ActionBarViewPagerController(this, fragmentManager, z);
            addOnFragmentViewPagerChangeListener(this.afb);
            addOnFragmentViewPagerChangeListener(this.mSplitView);
            this.mSplitView.setFragmentViewPagerMode(true);
        }
    }

    public void addOnFragmentViewPagerChangeListener(FragmentViewPagerChangeListener fragmentViewPagerChangeListener) {
        this.afe.addOnFragmentViewPagerChangeListener(fragmentViewPagerChangeListener);
    }

    public void removeOnFragmentViewPagerChangeListener(FragmentViewPagerChangeListener fragmentViewPagerChangeListener) {
        this.afe.removeOnFragmentViewPagerChangeListener(fragmentViewPagerChangeListener);
    }

    public int getFragmentTabCount() {
        return this.afe.getFragmentTabCount();
    }

    public Fragment getFragmentAt(int i) {
        return this.afe.getFragmentAt(i);
    }

    public int addFragmentTab(String str, Tab tab, Class<? extends Fragment> cls, Bundle bundle, boolean z) {
        return this.afe.addFragmentTab(str, tab, cls, bundle, z);
    }

    public int addFragmentTab(String str, Tab tab, int i, Class<? extends Fragment> cls, Bundle bundle, boolean z) {
        return this.afe.addFragmentTab(str, tab, i, cls, bundle, z);
    }

    public void removeFragmentTabAt(int i) {
        this.afe.An(i);
    }

    public void removeFragmentTab(String str) {
        this.afe.removeFragmentTab(str);
    }

    public void removeFragmentTab(Tab tab) {
        this.afe.removeFragmentTab(tab);
    }

    public void removeFragmentTab(Fragment fragment) {
        this.afe.Ao(fragment);
    }

    public void removeAllFragmentTab() {
        this.afe.removeAllFragmentTab();
    }

    public void setFragmentActionMenuAt(int i, boolean z) {
        this.afe.setFragmentActionMenuAt(i, z);
    }

    public void setProgressBarVisibility(boolean z) {
        this.aeE.setProgressBarVisibility(z);
    }

    public void setProgressBarIndeterminateVisibility(boolean z) {
        this.aeE.setProgressBarIndeterminateVisibility(z);
    }

    public void setProgressBarIndeterminate(boolean z) {
        this.aeE.setProgressBarIndeterminate(z);
    }

    public void setProgress(int i) {
        this.aeE.setProgress(i);
    }

    public int getViewPagerOffscreenPageLimit() {
        return this.afe.getViewPagerOffscreenPageLimit();
    }

    public void setViewPagerOffscreenPageLimit(int i) {
        this.afe.setViewPagerOffscreenPageLimit(i);
    }

    public void setStartView(View view) {
        this.aeE.setStartView(view);
    }

    public void setEndView(View view) {
        this.aeE.setEndView(view);
    }

    public void setViewPagerDecor(View view) {
        this.afe.setViewPagerDecor(view);
    }

    private void zN() {
        if (this.afb == null) {
            ScrollingTabContainerView scrollingTabContainerView = new ScrollingTabContainerView(this.mContext);
            if (this.aeO) {
                scrollingTabContainerView.setVisibility(0);
                this.aeE.setEmbeddedTabView(scrollingTabContainerView);
            } else {
                if (getNavigationMode() == 2) {
                    scrollingTabContainerView.setVisibility(0);
                } else {
                    scrollingTabContainerView.setVisibility(8);
                }
                this.aeG.setTabContainer(scrollingTabContainerView);
            }
            scrollingTabContainerView.setEmbeded(this.aeO);
            this.afb = scrollingTabContainerView;
        }
    }

    private void zL(Tab tab, int i) {
        TabImpl tabImpl = (TabImpl) tab;
        if (tabImpl.getCallback() == null) {
            throw new IllegalStateException("Action Bar Tab must have a Callback");
        }
        tabImpl.setPosition(i);
        this.afc.add(i, tabImpl);
        int size = this.afc.size();
        for (int i2 = i + 1; i2 < size; i2++) {
            ((TabImpl) this.afc.get(i2)).setPosition(i2);
        }
    }

    private void zK() {
        if (this.aeW != null) {
            selectTab(null);
        }
        this.afc.clear();
        if (this.afb != null) {
            this.afb.removeAllTabs();
        }
        this.aeU = -1;
    }

    private void Ae(boolean z) {
        if (zJ(this.aeP, this.aeQ, this.aeY)) {
            if (!this.aeS) {
                this.aeS = true;
                doShow(z);
            }
        } else if (this.aeS) {
            this.aeS = false;
            doHide(z);
        }
    }

    private Animator zP(boolean z) {
        Animator animatorSet = new AnimatorSet();
        int height = this.aeG.getHeight();
        ObjectAnimator ofFloat;
        ObjectAnimator ofFloat2;
        if (z) {
            ofFloat = ObjectAnimator.ofFloat(this.aeG, "TranslationY", new float[]{this.aeG.getTranslationY(), 0.0f});
            ofFloat2 = ObjectAnimator.ofFloat(this.aeG, "Alpha", new float[]{this.aeG.getAlpha(), 1.0f});
            animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2});
            animatorSet.setInterpolator(new CubicEaseOutInterpolator());
            animatorSet.setDuration((long) this.mContext.getResources().getInteger(R.integer.action_bar_appear_duration));
        } else {
            ofFloat = ObjectAnimator.ofFloat(this.aeG, "TranslationY", new float[]{this.aeG.getTranslationY(), (float) (-height)});
            ofFloat2 = ObjectAnimator.ofFloat(this.aeG, "Alpha", new float[]{this.aeG.getAlpha(), 0.0f});
            animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2});
            animatorSet.setInterpolator(new CubicEaseInInterpolator());
            animatorSet.setDuration((long) this.mContext.getResources().getInteger(R.integer.action_bar_disappear_duration));
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    ActionBarImpl.this.aeG.setVisibility(8);
                }
            });
        }
        return animatorSet;
    }

    private int zQ() {
        int height = this.mSplitView.getHeight();
        if (this.mSplitView.getChildCount() == 1) {
            View childAt = this.mSplitView.getChildAt(0);
            if (childAt == null) {
                return height;
            }
            if (childAt instanceof PhoneActionMenuView) {
                PhoneActionMenuView phoneActionMenuView = (PhoneActionMenuView) childAt;
                if (!phoneActionMenuView.isOverflowMenuShowing()) {
                    return phoneActionMenuView.getCollapsedHeight();
                }
            }
        }
        return height;
    }

    private Animator zR(boolean z) {
        Animator animatorSet = new AnimatorSet();
        int zQ = zQ();
        ObjectAnimator ofFloat;
        ObjectAnimator ofFloat2;
        if (z) {
            ofFloat = ObjectAnimator.ofFloat(this.mSplitView, "TranslationY", new float[]{this.mSplitView.getTranslationY(), 0.0f});
            ofFloat2 = ObjectAnimator.ofFloat(this.mSplitView, "Alpha", new float[]{this.mSplitView.getAlpha(), 1.0f});
            animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2});
            animatorSet.setInterpolator(new CubicEaseOutInterpolator());
            animatorSet.setDuration((long) this.mContext.getResources().getInteger(R.integer.action_bar_appear_duration));
        } else {
            ofFloat = ObjectAnimator.ofFloat(this.mSplitView, "TranslationY", new float[]{this.mSplitView.getTranslationY(), (float) zQ});
            ofFloat2 = ObjectAnimator.ofFloat(this.mSplitView, "Alpha", new float[]{this.mSplitView.getAlpha(), 0.0f});
            animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2});
            animatorSet.setInterpolator(new CubicEaseInInterpolator());
            animatorSet.setDuration((long) this.mContext.getResources().getInteger(R.integer.action_bar_disappear_duration));
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    ActionBarImpl.this.mSplitView.setVisibility(8);
                }
            });
        }
        return animatorSet;
    }

    public void doShow(boolean z) {
        if (this.aeF != null) {
            this.aeF.cancel();
        }
        if (Aa()) {
            z = true;
        }
        this.aeG.setVisibility(0);
        if (z) {
            this.aeF = zP(true);
            this.aeF.start();
        } else {
            this.aeG.setTranslationY(0.0f);
            this.aeG.setAlpha(1.0f);
        }
        if (this.mSplitView != null) {
            if (this.afa != null) {
                this.afa.cancel();
            }
            this.mSplitView.setVisibility(0);
            if (z) {
                this.afa = zR(true);
                this.afa.start();
                if (this.aeE.isSplitActionBar() && this.mSplitView.getChildCount() > 0) {
                    View childAt = this.mSplitView.getChildAt(0);
                    if (!(childAt == null || !(childAt instanceof PhoneActionMenuView) || (((PhoneActionMenuView) childAt).isOverflowMenuShowing() ^ 1) == 0)) {
                        ((ActionMenuView) childAt).startLayoutAnimation();
                    }
                }
            } else {
                this.mSplitView.setTranslationY(0.0f);
                this.mSplitView.setAlpha(1.0f);
            }
            Ad(true);
        }
    }

    public void doHide(boolean z) {
        if (this.aeF != null) {
            this.aeF.cancel();
        }
        if (Aa()) {
            z = true;
        }
        if (z) {
            this.aeF = zP(false);
            this.aeF.start();
        } else {
            this.aeG.setTranslationY((float) (-this.aeG.getHeight()));
            this.aeG.setAlpha(0.0f);
            this.aeG.setVisibility(8);
        }
        if (this.mSplitView != null) {
            if (this.afa != null) {
                this.afa.cancel();
            }
            if (z) {
                this.afa = zR(false);
                this.afa.start();
            } else {
                this.mSplitView.setTranslationY((float) zQ());
                this.mSplitView.setAlpha(0.0f);
                this.mSplitView.setVisibility(8);
            }
            Ad(false);
        }
    }

    boolean Aa() {
        return this.aeX;
    }

    public void setShowHideAnimationEnabled(boolean z) {
        this.aeX = z;
        if (!z) {
            if (isShowing()) {
                doShow(false);
            } else {
                doHide(false);
            }
        }
    }

    private void Ad(boolean z) {
        if (this.mSplitView.getChildCount() == 1 && (this.mSplitView.getChildAt(0) instanceof PhoneActionMenuView)) {
            this.aeZ = (PhoneActionMenuView) this.mSplitView.getChildAt(0);
            if (this.aeZ.isOverflowMenuShowing() && this.aeH != null) {
                if (z) {
                    this.aeT.getContentMaskAnimator(this.aeI).show().start();
                } else {
                    this.aeT.getContentMaskAnimator(null).hide().start();
                }
            }
        }
    }
}
