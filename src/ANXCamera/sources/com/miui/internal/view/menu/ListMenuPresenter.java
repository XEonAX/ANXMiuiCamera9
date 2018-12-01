package com.miui.internal.view.menu;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import com.miui.internal.R;
import com.miui.internal.view.menu.MenuPresenter.Callback;
import com.miui.internal.view.menu.MenuView.ItemView;
import java.util.ArrayList;

public class ListMenuPresenter implements MenuPresenter, OnItemClickListener {
    public static final String VIEWS_TAG = "android:menu:list";
    MenuAdapter PM;
    private Callback PN;
    private int PO;
    private int PP;
    int PQ;
    int PR;
    ExpandedMenuView PS;
    int PT;
    Context mContext;
    LayoutInflater mInflater;
    MenuBuilder mMenu;

    private class MenuAdapter extends BaseAdapter {
        private int PU = -1;

        public MenuAdapter() {
            tq();
        }

        public int getCount() {
            int size = ListMenuPresenter.this.mMenu.getNonActionItems().size() - ListMenuPresenter.this.PP;
            if (this.PU < 0) {
                return size;
            }
            return size - 1;
        }

        public MenuItemImpl getItem(int i) {
            ArrayList nonActionItems = ListMenuPresenter.this.mMenu.getNonActionItems();
            int tp = ListMenuPresenter.this.PP + i;
            if (this.PU >= 0 && tp >= this.PU) {
                tp++;
            }
            return (MenuItemImpl) nonActionItems.get(tp);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            View inflate;
            if (view == null) {
                inflate = ListMenuPresenter.this.mInflater.inflate(ListMenuPresenter.this.PQ, viewGroup, false);
            } else {
                inflate = view;
            }
            ((ItemView) inflate).initialize(getItem(i), 0);
            return inflate;
        }

        void tq() {
            MenuItemImpl expandedItem = ListMenuPresenter.this.mMenu.getExpandedItem();
            if (expandedItem != null) {
                ArrayList nonActionItems = ListMenuPresenter.this.mMenu.getNonActionItems();
                int size = nonActionItems.size();
                for (int i = 0; i < size; i++) {
                    if (((MenuItemImpl) nonActionItems.get(i)) == expandedItem) {
                        this.PU = i;
                        return;
                    }
                }
            }
            this.PU = -1;
        }

        public void notifyDataSetChanged() {
            tq();
            super.notifyDataSetChanged();
        }
    }

    public ListMenuPresenter(Context context, int i, int i2) {
        this(i, i2, 0);
        this.mContext = context;
        this.mInflater = LayoutInflater.from(this.mContext);
    }

    public ListMenuPresenter(int i, int i2) {
        this(R.layout.expanded_menu_layout, i, i2);
    }

    public ListMenuPresenter(int i, int i2, int i3) {
        this.PQ = i2;
        this.PR = i;
        this.PT = i3;
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
        if (this.PT != 0) {
            this.mContext = new ContextThemeWrapper(context, this.PT);
            this.mInflater = LayoutInflater.from(this.mContext);
        } else if (this.mContext != null) {
            this.mContext = context;
            if (this.mInflater == null) {
                this.mInflater = LayoutInflater.from(this.mContext);
            }
        }
        if (this.mMenu != null) {
            this.mMenu.removeMenuPresenter(this);
        }
        this.mMenu = menuBuilder;
        if (this.PM != null) {
            this.PM.notifyDataSetChanged();
        }
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        if (this.PM == null) {
            this.PM = new MenuAdapter();
        }
        if (this.PM.isEmpty()) {
            return null;
        }
        if (this.PS == null) {
            this.PS = (ExpandedMenuView) this.mInflater.inflate(this.PR, viewGroup, false);
            this.PS.setAdapter(this.PM);
            this.PS.setOnItemClickListener(this);
        }
        return this.PS;
    }

    public ListAdapter getAdapter() {
        if (this.PM == null) {
            this.PM = new MenuAdapter();
        }
        return this.PM;
    }

    public void updateMenuView(boolean z) {
        if (this.PM != null) {
            this.PM.notifyDataSetChanged();
        }
    }

    public void setCallback(Callback callback) {
        this.PN = callback;
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        if (!subMenuBuilder.hasVisibleItems()) {
            return false;
        }
        new MenuDialogHelper(subMenuBuilder).show(null);
        if (this.PN != null) {
            this.PN.onOpenSubMenu(subMenuBuilder);
        }
        return true;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (this.PN != null) {
            this.PN.onCloseMenu(menuBuilder, z);
        }
    }

    int to() {
        return this.PP;
    }

    public void setItemIndexOffset(int i) {
        this.PP = i;
        if (this.PS != null) {
            updateMenuView(false);
        }
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        this.mMenu.performItemAction(this.PM.getItem(i), 0);
    }

    public boolean flagActionItems() {
        return false;
    }

    public boolean expandItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        return false;
    }

    public boolean collapseItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        return false;
    }

    public void saveHierarchyState(Bundle bundle) {
        SparseArray sparseArray = new SparseArray();
        if (this.PS != null) {
            this.PS.saveHierarchyState(sparseArray);
        }
        bundle.putSparseParcelableArray(VIEWS_TAG, sparseArray);
    }

    public void restoreHierarchyState(Bundle bundle) {
        SparseArray sparseParcelableArray = bundle.getSparseParcelableArray(VIEWS_TAG);
        if (sparseParcelableArray != null) {
            this.PS.restoreHierarchyState(sparseParcelableArray);
        }
    }

    public void setId(int i) {
        this.PO = i;
    }

    public int getId() {
        return this.PO;
    }

    public Parcelable onSaveInstanceState() {
        if (this.PS == null) {
            return null;
        }
        Parcelable bundle = new Bundle();
        saveHierarchyState(bundle);
        return bundle;
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        restoreHierarchyState((Bundle) parcelable);
    }
}
