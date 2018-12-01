package com.miui.internal.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import com.miui.internal.view.menu.MenuBuilder.Callback;

public class SubMenuBuilder extends MenuBuilder implements SubMenu {
    private MenuItemImpl NY;
    private MenuBuilder NZ;

    public SubMenuBuilder(Context context, MenuBuilder menuBuilder, MenuItemImpl menuItemImpl) {
        super(context);
        this.NZ = menuBuilder;
        this.NY = menuItemImpl;
    }

    public void setQwertyMode(boolean z) {
        this.NZ.setQwertyMode(z);
    }

    public boolean isQwertyMode() {
        return this.NZ.isQwertyMode();
    }

    public void setShortcutsVisible(boolean z) {
        this.NZ.setShortcutsVisible(z);
    }

    public boolean isShortcutsVisible() {
        return this.NZ.isShortcutsVisible();
    }

    public Menu getParentMenu() {
        return this.NZ;
    }

    public MenuItem getItem() {
        return this.NY;
    }

    public void setCallback(Callback callback) {
        this.NZ.setCallback(callback);
    }

    public MenuBuilder getRootMenu() {
        return this.NZ;
    }

    public boolean dispatchMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
        if (super.dispatchMenuItemSelected(menuBuilder, menuItem)) {
            return true;
        }
        return this.NZ.dispatchMenuItemSelected(menuBuilder, menuItem);
    }

    public SubMenu setIcon(Drawable drawable) {
        this.NY.setIcon(drawable);
        return this;
    }

    public SubMenu setIcon(int i) {
        this.NY.setIcon(i);
        return this;
    }

    public SubMenu setHeaderIcon(Drawable drawable) {
        super.setHeaderIconInt(drawable);
        return this;
    }

    public SubMenu setHeaderIcon(int i) {
        super.setHeaderIconInt(getContext().getResources().getDrawable(i));
        return this;
    }

    public SubMenu setHeaderTitle(CharSequence charSequence) {
        super.setHeaderTitleInt(charSequence);
        return this;
    }

    public SubMenu setHeaderTitle(int i) {
        super.setHeaderTitleInt(getContext().getResources().getString(i));
        return this;
    }

    public SubMenu setHeaderView(View view) {
        super.setHeaderViewInt(view);
        return this;
    }

    public void clearHeader() {
    }

    public boolean expandItemActionView(MenuItemImpl menuItemImpl) {
        return this.NZ.expandItemActionView(menuItemImpl);
    }

    public boolean collapseItemActionView(MenuItemImpl menuItemImpl) {
        return this.NZ.collapseItemActionView(menuItemImpl);
    }

    public String getActionViewStatesKey() {
        int i = 0;
        if (this.NY != null) {
            i = this.NY.getItemId();
        }
        if (i == 0) {
            return null;
        }
        return super.getActionViewStatesKey() + ":" + i;
    }
}
