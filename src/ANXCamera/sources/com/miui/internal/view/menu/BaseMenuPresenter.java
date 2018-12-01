package com.miui.internal.view.menu;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.internal.view.menu.MenuPresenter.Callback;
import com.miui.internal.view.menu.MenuView.ItemView;
import java.util.Iterator;

public abstract class BaseMenuPresenter implements MenuPresenter {
    private Callback Oi;
    private int Oj;
    private int Ok;
    private int Ol;
    protected Context mContext;
    protected LayoutInflater mInflater;
    protected MenuBuilder mMenu;
    protected MenuView mMenuView;
    protected Context mSystemContext;
    protected LayoutInflater mSystemInflater;

    public abstract void bindItemView(MenuItemImpl menuItemImpl, ItemView itemView);

    public BaseMenuPresenter(Context context, int i, int i2) {
        this.mSystemContext = context;
        this.mSystemInflater = LayoutInflater.from(context);
        this.Ol = i;
        this.Ok = i2;
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
        this.mContext = context;
        this.mInflater = LayoutInflater.from(this.mContext);
        this.mMenu = menuBuilder;
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        if (this.mMenuView == null) {
            this.mMenuView = (MenuView) this.mSystemInflater.inflate(this.Ol, viewGroup, false);
            this.mMenuView.initialize(this.mMenu);
            updateMenuView(true);
        }
        return this.mMenuView;
    }

    public void updateMenuView(boolean z) {
        ViewGroup viewGroup = (ViewGroup) this.mMenuView;
        if (viewGroup != null) {
            int i;
            int i2;
            if (this.mMenuView.hasBackgroundView()) {
                i = 1;
            } else {
                i = 0;
            }
            if (this.mMenu != null) {
                this.mMenu.flagActionItems();
                Iterator it = this.mMenu.getVisibleItems().iterator();
                while (true) {
                    i2 = i;
                    if (!it.hasNext()) {
                        break;
                    }
                    MenuItemImpl menuItemImpl = (MenuItemImpl) it.next();
                    if (shouldIncludeItem(i2, menuItemImpl)) {
                        View childAt = viewGroup.getChildAt(i2);
                        MenuItemImpl itemData = childAt instanceof ItemView ? ((ItemView) childAt).getItemData() : null;
                        View itemView = getItemView(menuItemImpl, childAt, viewGroup);
                        if (menuItemImpl != itemData) {
                            itemView.setPressed(false);
                        }
                        if (itemView != childAt) {
                            addItemView(itemView, i2);
                        }
                        i = i2 + 1;
                    } else {
                        i = i2;
                    }
                }
            } else {
                i2 = i;
            }
            while (i2 < viewGroup.getChildCount()) {
                if (!this.mMenuView.filterLeftoverView(i2)) {
                    i2++;
                }
            }
        }
    }

    protected void addItemView(View view, int i) {
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        if (viewGroup != null) {
            viewGroup.removeView(view);
        }
        ((ViewGroup) this.mMenuView).addView(view, i);
    }

    public void setCallback(Callback callback) {
        this.Oi = callback;
    }

    public ItemView createItemView(ViewGroup viewGroup) {
        return (ItemView) this.mSystemInflater.inflate(this.Ok, viewGroup, false);
    }

    public View getItemView(MenuItemImpl menuItemImpl, View view, ViewGroup viewGroup) {
        ItemView itemView;
        if (view instanceof ItemView) {
            itemView = (ItemView) view;
        } else {
            itemView = createItemView(viewGroup);
        }
        bindItemView(menuItemImpl, itemView);
        return (View) itemView;
    }

    public boolean shouldIncludeItem(int i, MenuItemImpl menuItemImpl) {
        return true;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (this.Oi != null) {
            this.Oi.onCloseMenu(menuBuilder, z);
        }
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        return this.Oi != null ? this.Oi.onOpenSubMenu(subMenuBuilder) : false;
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
        return this.Oj;
    }

    public void setId(int i) {
        this.Oj = i;
    }
}
