package com.miui.internal.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcelable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow.OnDismissListener;
import com.miui.internal.R;
import com.miui.internal.view.menu.MenuPresenter.Callback;
import com.miui.internal.view.menu.MenuView.ItemView;
import java.util.ArrayList;
import miui.widget.ListPopupWindow;

public class MenuPopupHelper implements OnItemClickListener, OnKeyListener, OnGlobalLayoutListener, OnDismissListener, MenuPresenter {
    private static final int Om = R.layout.popup_menu_item_layout;
    private MenuAdapter On;
    private View Oo;
    boolean Op;
    private ViewGroup Oq;
    private int Or;
    private boolean Os;
    private ListPopupWindow Ot;
    private int Ou;
    private int Ov;
    private Callback Ow;
    private ViewTreeObserver Ox;
    private Context mContext;
    private LayoutInflater mInflater;
    private MenuBuilder mMenu;

    private class MenuAdapter extends BaseAdapter {
        private MenuBuilder Oy;
        private int Oz = -1;

        public MenuAdapter(MenuBuilder menuBuilder) {
            this.Oy = menuBuilder;
            sU();
        }

        public int getCount() {
            ArrayList nonActionItems = MenuPopupHelper.this.Os ? this.Oy.getNonActionItems() : this.Oy.getVisibleItems();
            if (this.Oz < 0) {
                return nonActionItems.size();
            }
            return nonActionItems.size() - 1;
        }

        public MenuItemImpl getItem(int i) {
            ArrayList nonActionItems = MenuPopupHelper.this.Os ? this.Oy.getNonActionItems() : this.Oy.getVisibleItems();
            if (this.Oz >= 0 && i >= this.Oz) {
                i++;
            }
            return (MenuItemImpl) nonActionItems.get(i);
        }

        public long getItemId(int i) {
            return (long) i;
        }

        public View getView(int i, View view, ViewGroup viewGroup) {
            View inflate;
            if (view == null) {
                inflate = MenuPopupHelper.this.mInflater.inflate(MenuPopupHelper.this.Or, viewGroup, false);
            } else {
                inflate = view;
            }
            ItemView itemView = (ItemView) inflate;
            if (MenuPopupHelper.this.Op) {
                ((ListMenuItemView) inflate).setForceShowIcon(true);
            }
            itemView.initialize(getItem(i), 0);
            return inflate;
        }

        void sU() {
            MenuItemImpl expandedItem = MenuPopupHelper.this.mMenu.getExpandedItem();
            if (expandedItem != null) {
                ArrayList nonActionItems = MenuPopupHelper.this.mMenu.getNonActionItems();
                int size = nonActionItems.size();
                for (int i = 0; i < size; i++) {
                    if (((MenuItemImpl) nonActionItems.get(i)) == expandedItem) {
                        this.Oz = i;
                        return;
                    }
                }
            }
            this.Oz = -1;
        }

        public void notifyDataSetChanged() {
            sU();
            super.notifyDataSetChanged();
        }
    }

    public MenuPopupHelper(Context context, MenuBuilder menuBuilder) {
        this(context, menuBuilder, null, false);
    }

    public MenuPopupHelper(Context context, MenuBuilder menuBuilder, View view) {
        this(context, menuBuilder, view, false);
    }

    public MenuPopupHelper(Context context, MenuBuilder menuBuilder, View view, boolean z) {
        this.Or = Om;
        this.mContext = context;
        this.mInflater = LayoutInflater.from(context);
        this.mMenu = menuBuilder;
        this.Os = z;
        Resources resources = context.getResources();
        this.Ou = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(R.dimen.config_prefDialogWidth));
        this.Oo = view;
        menuBuilder.addMenuPresenter(this);
    }

    public void setAnchorView(View view) {
        this.Oo = view;
    }

    public void setForceShowIcon(boolean z) {
        this.Op = z;
    }

    public void setVerticalOffset(int i) {
        this.Ov = i;
    }

    public void setMenuItemLayout(int i) {
        this.Or = i;
    }

    public void show() {
        if (!tryShow()) {
            throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
        }
    }

    public boolean tryShow() {
        boolean z = false;
        this.Ot = new ListPopupWindow(this.mContext, null, 16843520);
        this.Ot.setOnDismissListener(this);
        this.Ot.setOnItemClickListener(this);
        this.Ot.setVerticalOffset(this.Ov);
        this.On = new MenuAdapter(this.mMenu);
        this.Ot.setAdapter(this.On);
        this.Ot.setModal(true);
        View view = this.Oo;
        if (view == null) {
            return false;
        }
        if (this.Ox == null) {
            z = true;
        }
        this.Ox = view.getViewTreeObserver();
        if (z) {
            this.Ox.addOnGlobalLayoutListener(this);
        }
        this.Ot.setAnchorView(view);
        this.Ot.setContentWidth(Math.min(sP(this.On), this.Ou));
        this.Ot.setInputMethodMode(2);
        this.Ot.show();
        this.Ot.getListView().setOnKeyListener(this);
        return true;
    }

    public void dismiss(boolean z) {
        if (isShowing()) {
            this.Ot.dismiss(z);
        }
    }

    public void onDismiss() {
        this.Ot = null;
        this.mMenu.close();
        if (this.Ox != null) {
            if (!this.Ox.isAlive()) {
                this.Ox = this.Oo.getViewTreeObserver();
            }
            this.Ox.removeOnGlobalLayoutListener(this);
            this.Ox = null;
        }
    }

    public boolean isShowing() {
        return this.Ot != null ? this.Ot.isShowing() : false;
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        MenuAdapter menuAdapter = this.On;
        menuAdapter.Oy.performItemAction(menuAdapter.getItem(i), 0);
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i != 82) {
            return false;
        }
        dismiss(false);
        return true;
    }

    private int sP(ListAdapter listAdapter) {
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.Ou, Integer.MIN_VALUE);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(this.Ou, Integer.MIN_VALUE);
        int count = listAdapter.getCount();
        int i = 0;
        int i2 = 0;
        View view = null;
        int i3 = 0;
        while (i < count) {
            View view2;
            int itemViewType = listAdapter.getItemViewType(i);
            if (itemViewType != i2) {
                view2 = null;
            } else {
                itemViewType = i2;
                view2 = view;
            }
            if (this.Oq == null) {
                this.Oq = new FrameLayout(this.mContext);
            }
            view = listAdapter.getView(i, view2, this.Oq);
            view.measure(makeMeasureSpec, makeMeasureSpec2);
            i3 = Math.max(i3, view.getMeasuredWidth());
            i++;
            i2 = itemViewType;
        }
        return i3;
    }

    public void onGlobalLayout() {
        if (isShowing()) {
            View view = this.Oo;
            if (view == null || (view.isShown() ^ 1) != 0) {
                dismiss(false);
            } else if (isShowing()) {
                this.Ot.setContentWidth(Math.min(sP(this.On), this.Ou));
                this.Ot.show();
            }
        }
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        throw new UnsupportedOperationException("MenuPopupHelpers manage their own views");
    }

    public void updateMenuView(boolean z) {
        if (this.On != null) {
            this.On.notifyDataSetChanged();
        }
    }

    public void setCallback(Callback callback) {
        this.Ow = callback;
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        if (subMenuBuilder.hasVisibleItems()) {
            boolean z;
            MenuPopupHelper menuPopupHelper = new MenuPopupHelper(this.mContext, subMenuBuilder, this.Oo, false);
            menuPopupHelper.setCallback(this.Ow);
            int size = subMenuBuilder.size();
            for (int i = 0; i < size; i++) {
                MenuItem item = subMenuBuilder.getItem(i);
                if (item.isVisible() && item.getIcon() != null) {
                    z = true;
                    break;
                }
            }
            z = false;
            menuPopupHelper.setForceShowIcon(z);
            if (menuPopupHelper.tryShow()) {
                if (this.Ow != null) {
                    this.Ow.onOpenSubMenu(subMenuBuilder);
                }
                return true;
            }
        }
        return false;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (menuBuilder == this.mMenu) {
            dismiss(true);
            if (this.Ow != null) {
                this.Ow.onCloseMenu(menuBuilder, z);
            }
        }
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

    public int getId() {
        return 0;
    }

    public Parcelable onSaveInstanceState() {
        return null;
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
    }
}
