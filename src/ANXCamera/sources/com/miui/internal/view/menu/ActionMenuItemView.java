package com.miui.internal.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.Button;
import com.miui.internal.R;
import com.miui.internal.view.menu.MenuBuilder.ItemInvoker;
import com.miui.internal.view.menu.MenuView.ItemView;

public class ActionMenuItemView extends Button implements ItemView {
    private boolean OS;
    private MenuItemImpl OT;
    private ItemInvoker OU;

    public ActionMenuItemView(Context context) {
        this(context, null, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ActionMenuItemView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void initialize(MenuItemImpl menuItemImpl, int i) {
        this.OT = menuItemImpl;
        setSelected(false);
        setTitle(menuItemImpl.getTitle());
        setIcon(menuItemImpl.getIcon());
        setCheckable(menuItemImpl.isCheckable());
        setChecked(menuItemImpl.isChecked());
        setEnabled(menuItemImpl.isEnabled());
        setClickable(true);
    }

    public MenuItemImpl getItemData() {
        return this.OT;
    }

    public void setTitle(CharSequence charSequence) {
        setText(charSequence);
    }

    public void setCheckable(boolean z) {
        this.OS = z;
    }

    public void setChecked(boolean z) {
        if (this.OS) {
            setSelected(z);
        }
    }

    public void setShortcut(boolean z, char c) {
    }

    public void setIcon(Drawable drawable) {
        if (getCompoundDrawables()[1] != drawable) {
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.action_button_icon_bounds);
            drawable.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
            setCompoundDrawables(null, drawable, null, null);
        }
    }

    public boolean prefersCondensedTitle() {
        return false;
    }

    public boolean showsIcon() {
        return true;
    }

    public boolean performClick() {
        if (super.performClick()) {
            return true;
        }
        if (this.OU == null || !this.OU.invokeItem(this.OT)) {
            return false;
        }
        playSoundEffect(0);
        return true;
    }

    public void setItemInvoker(ItemInvoker itemInvoker) {
        this.OU = itemInvoker;
    }
}
