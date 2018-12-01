package com.miui.internal.view.menu;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.view.ActionProvider;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;

public class ActionMenuItem implements MenuItem {
    private static final int OB = 1;
    private static final int OC = 2;
    private static final int OD = 16;
    private static final int OE = 4;
    private static final int OF = 8;
    private final int OG;
    private OnMenuItemClickListener OH;
    private int OI = 16;
    private final int OJ;
    private Drawable OK;
    private final int OL;
    private Intent OM;
    private final int ON;
    private char OO;
    private char OP;
    private CharSequence OQ;
    private CharSequence OR;
    private Context mContext;

    public ActionMenuItem(Context context, int i, int i2, int i3, int i4, CharSequence charSequence) {
        this.mContext = context;
        this.OL = i2;
        this.OJ = i;
        this.OG = i3;
        this.ON = i4;
        this.OQ = charSequence;
    }

    public char getAlphabeticShortcut() {
        return this.OO;
    }

    public int getGroupId() {
        return this.OJ;
    }

    public Drawable getIcon() {
        return this.OK;
    }

    public Intent getIntent() {
        return this.OM;
    }

    public int getItemId() {
        return this.OL;
    }

    public ContextMenuInfo getMenuInfo() {
        return null;
    }

    public char getNumericShortcut() {
        return this.OP;
    }

    public int getOrder() {
        return this.ON;
    }

    public SubMenu getSubMenu() {
        return null;
    }

    public CharSequence getTitle() {
        return this.OQ;
    }

    public CharSequence getTitleCondensed() {
        return this.OR;
    }

    public boolean hasSubMenu() {
        return false;
    }

    public boolean isCheckable() {
        return (this.OI & 1) != 0;
    }

    public boolean isChecked() {
        return (this.OI & 2) != 0;
    }

    public boolean isEnabled() {
        return (this.OI & 16) != 0;
    }

    public boolean isVisible() {
        return (this.OI & 8) == 0;
    }

    public MenuItem setAlphabeticShortcut(char c) {
        this.OO = c;
        return this;
    }

    public MenuItem setCheckable(boolean z) {
        this.OI = (z ? 1 : 0) | (this.OI & -2);
        return this;
    }

    public ActionMenuItem setExclusiveCheckable(boolean z) {
        this.OI = (z ? 4 : 0) | (this.OI & -5);
        return this;
    }

    public MenuItem setChecked(boolean z) {
        this.OI = (z ? 2 : 0) | (this.OI & -3);
        return this;
    }

    public MenuItem setEnabled(boolean z) {
        this.OI = (z ? 16 : 0) | (this.OI & -17);
        return this;
    }

    public MenuItem setIcon(Drawable drawable) {
        this.OK = drawable;
        return this;
    }

    public MenuItem setIcon(int i) {
        this.OK = this.mContext.getResources().getDrawable(i);
        return this;
    }

    public MenuItem setIntent(Intent intent) {
        this.OM = intent;
        return this;
    }

    public MenuItem setNumericShortcut(char c) {
        this.OP = c;
        return this;
    }

    public MenuItem setOnMenuItemClickListener(OnMenuItemClickListener onMenuItemClickListener) {
        this.OH = onMenuItemClickListener;
        return this;
    }

    public MenuItem setShortcut(char c, char c2) {
        this.OP = c;
        this.OO = c2;
        return this;
    }

    public MenuItem setTitle(CharSequence charSequence) {
        this.OQ = charSequence;
        return this;
    }

    public MenuItem setTitle(int i) {
        this.OQ = this.mContext.getResources().getString(i);
        return this;
    }

    public MenuItem setTitleCondensed(CharSequence charSequence) {
        this.OR = charSequence;
        return this;
    }

    public MenuItem setVisible(boolean z) {
        this.OI = (z ? 0 : 8) | (this.OI & 8);
        return this;
    }

    public boolean invoke() {
        if (this.OH != null && this.OH.onMenuItemClick(this)) {
            return true;
        }
        if (this.OM == null) {
            return false;
        }
        this.mContext.startActivity(this.OM);
        return true;
    }

    public void setShowAsAction(int i) {
    }

    public MenuItem setActionView(View view) {
        throw new UnsupportedOperationException();
    }

    public View getActionView() {
        return null;
    }

    public MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException();
    }

    public ActionProvider getActionProvider() {
        throw new UnsupportedOperationException();
    }

    public MenuItem setActionView(int i) {
        throw new UnsupportedOperationException();
    }

    public ActionProvider getSupportActionProvider() {
        return null;
    }

    public MenuItem setSupportActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException();
    }

    public MenuItem setShowAsActionFlags(int i) {
        setShowAsAction(i);
        return this;
    }

    public boolean expandActionView() {
        return false;
    }

    public boolean collapseActionView() {
        return false;
    }

    public boolean isActionViewExpanded() {
        return false;
    }

    public MenuItem setOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        throw new UnsupportedOperationException();
    }

    public MenuItem setSupportOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        return this;
    }
}
