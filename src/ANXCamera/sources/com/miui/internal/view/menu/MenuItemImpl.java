package com.miui.internal.view.menu;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.ActionProvider;
import android.view.ActionProvider.VisibilityListener;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewDebug.CapturedViewProperty;
import android.widget.LinearLayout;
import com.miui.internal.view.menu.MenuView.ItemView;

public final class MenuItemImpl implements MenuItem {
    private static final int QA = 32;
    static final int QB = 0;
    private static final int QC = 3;
    private static String QY = null;
    private static String QZ = null;
    private static final int Qv = 1;
    private static final int Qw = 2;
    private static final int Qx = 16;
    private static final int Qy = 4;
    private static final int Qz = 8;
    private static String Ra = null;
    private static String Rb = null;
    private static final String TAG = "MenuItemImpl";
    private ActionProvider QD;
    private View QE;
    private final int QF;
    private OnMenuItemClickListener QG;
    private int QH = 16;
    private final int QI;
    private Drawable QJ;
    private int QK = 0;
    private final int QL;
    private Intent QM;
    private boolean QN = false;
    private Runnable QO;
    private ContextMenuInfo QP;
    private OnActionExpandListener QQ;
    private final int QR;
    private char QS;
    private char QT;
    private int QU = 0;
    private SubMenuBuilder QV;
    private CharSequence QW;
    private CharSequence QX;
    private MenuBuilder mMenu;

    MenuItemImpl(MenuBuilder menuBuilder, int i, int i2, int i3, int i4, CharSequence charSequence, int i5) {
        this.mMenu = menuBuilder;
        this.QL = i2;
        this.QI = i;
        this.QF = i3;
        this.QR = i4;
        this.QW = charSequence;
        this.QU = i5;
    }

    public boolean invoke() {
        if ((this.QG != null && this.QG.onMenuItemClick(this)) || this.mMenu.dispatchMenuItemSelected(this.mMenu.getRootMenu(), this)) {
            return true;
        }
        if (this.QO != null) {
            this.QO.run();
            return true;
        }
        if (this.QM != null) {
            try {
                this.mMenu.getContext().startActivity(this.QM);
                return true;
            } catch (Throwable e) {
                Log.e(TAG, "Can't find activity to handle intent; ignoring", e);
            }
        }
        return this.QD != null ? this.QD.onPerformDefaultAction() : false;
    }

    public boolean isEnabled() {
        return (this.QH & 16) != 0;
    }

    public MenuItem setEnabled(boolean z) {
        if (z) {
            this.QH |= 16;
        } else {
            this.QH &= -17;
        }
        this.mMenu.sC(false);
        return this;
    }

    public int getGroupId() {
        return this.QI;
    }

    @CapturedViewProperty
    public int getItemId() {
        return this.QL;
    }

    public int getOrder() {
        return this.QF;
    }

    public int getOrdering() {
        return this.QR;
    }

    public Intent getIntent() {
        return this.QM;
    }

    public MenuItem setIntent(Intent intent) {
        this.QM = intent;
        return this;
    }

    Runnable getCallback() {
        return this.QO;
    }

    public MenuItem setCallback(Runnable runnable) {
        this.QO = runnable;
        return this;
    }

    public char getAlphabeticShortcut() {
        return this.QS;
    }

    public MenuItem setAlphabeticShortcut(char c) {
        if (this.QS == c) {
            return this;
        }
        this.QS = Character.toLowerCase(c);
        this.mMenu.sC(false);
        return this;
    }

    public char getNumericShortcut() {
        return this.QT;
    }

    public MenuItem setNumericShortcut(char c) {
        if (this.QT == c) {
            return this;
        }
        this.QT = c;
        this.mMenu.sC(false);
        return this;
    }

    public MenuItem setShortcut(char c, char c2) {
        this.QT = c;
        this.QS = Character.toLowerCase(c2);
        this.mMenu.sC(false);
        return this;
    }

    char tH() {
        return this.QS;
    }

    String tI() {
        char tH = tH();
        if (tH == 0) {
            return "";
        }
        StringBuilder stringBuilder = new StringBuilder(Ra);
        switch (tH) {
            case 8:
                stringBuilder.append(QY);
                break;
            case 10:
                stringBuilder.append(QZ);
                break;
            case ' ':
                stringBuilder.append(Rb);
                break;
            default:
                stringBuilder.append(tH);
                break;
        }
        return stringBuilder.toString();
    }

    boolean tG() {
        return this.mMenu.isShortcutsVisible() && tH() != 0;
    }

    public SubMenu getSubMenu() {
        return this.QV;
    }

    public boolean hasSubMenu() {
        return this.QV != null;
    }

    void tC(SubMenuBuilder subMenuBuilder) {
        this.QV = subMenuBuilder;
        subMenuBuilder.setHeaderTitle(getTitle());
    }

    @CapturedViewProperty
    public CharSequence getTitle() {
        return this.QW;
    }

    CharSequence tF(ItemView itemView) {
        if (itemView == null || !itemView.prefersCondensedTitle()) {
            return getTitle();
        }
        return getTitleCondensed();
    }

    public MenuItem setTitle(CharSequence charSequence) {
        this.QW = charSequence;
        this.mMenu.sC(false);
        if (this.QV != null) {
            this.QV.setHeaderTitle(charSequence);
        }
        return this;
    }

    public MenuItem setTitle(int i) {
        return setTitle(this.mMenu.getContext().getString(i));
    }

    public CharSequence getTitleCondensed() {
        return this.QX != null ? this.QX : this.QW;
    }

    public MenuItem setTitleCondensed(CharSequence charSequence) {
        this.QX = charSequence;
        this.mMenu.sC(false);
        return this;
    }

    public Drawable getIcon() {
        if (this.QJ != null) {
            return this.QJ;
        }
        if (this.QK == 0) {
            return null;
        }
        Drawable drawable = this.mMenu.getResources().getDrawable(this.QK);
        this.QK = 0;
        this.QJ = drawable;
        return drawable;
    }

    public MenuItem setIcon(Drawable drawable) {
        this.QK = 0;
        this.QJ = drawable;
        this.mMenu.sC(false);
        return this;
    }

    public MenuItem setIcon(int i) {
        this.QJ = null;
        this.QK = i;
        this.mMenu.sC(false);
        return this;
    }

    public boolean isCheckable() {
        return (this.QH & 1) == 1;
    }

    public MenuItem setCheckable(boolean z) {
        int i = this.QH;
        this.QH = (z ? 1 : 0) | (this.QH & -2);
        if (i != this.QH) {
            this.mMenu.sC(false);
        }
        return this;
    }

    public void setExclusiveCheckable(boolean z) {
        this.QH = (z ? 4 : 0) | (this.QH & -5);
    }

    public boolean isExclusiveCheckable() {
        return (this.QH & 4) != 0;
    }

    public boolean isChecked() {
        return (this.QH & 2) == 2;
    }

    public MenuItem setChecked(boolean z) {
        if ((this.QH & 4) != 0) {
            this.mMenu.sE(this);
        } else {
            tD(z);
        }
        return this;
    }

    void tD(boolean z) {
        int i;
        int i2 = this.QH;
        int i3 = this.QH & -3;
        if (z) {
            i = 2;
        } else {
            i = 0;
        }
        this.QH = i | i3;
        if (i2 != this.QH) {
            this.mMenu.sC(false);
        }
    }

    public boolean isVisible() {
        boolean z = false;
        if (this.QD == null || !this.QD.overridesItemVisibility()) {
            if ((this.QH & 8) == 0) {
                z = true;
            }
            return z;
        }
        if ((this.QH & 8) == 0) {
            z = this.QD.isVisible();
        }
        return z;
    }

    boolean tE(boolean z) {
        int i = this.QH;
        this.QH = (z ? 0 : 8) | (this.QH & -9);
        if (i != this.QH) {
            return true;
        }
        return false;
    }

    public MenuItem setVisible(boolean z) {
        if (tE(z)) {
            this.mMenu.sB(this);
        }
        return this;
    }

    public MenuItem setOnMenuItemClickListener(OnMenuItemClickListener onMenuItemClickListener) {
        this.QG = onMenuItemClickListener;
        return this;
    }

    public String toString() {
        return this.QW.toString();
    }

    void tB(ContextMenuInfo contextMenuInfo) {
        this.QP = contextMenuInfo;
    }

    public ContextMenuInfo getMenuInfo() {
        return this.QP;
    }

    public void actionFormatChanged() {
        this.mMenu.sA(this);
    }

    public boolean shouldShowIcon() {
        return this.mMenu.sy();
    }

    public boolean isActionButton() {
        return (this.QH & 32) == 32;
    }

    public boolean requestsActionButton() {
        return (this.QU & 1) == 1;
    }

    public boolean requiresActionButton() {
        return (this.QU & 2) == 2;
    }

    public void setIsActionButton(boolean z) {
        if (z) {
            this.QH |= 32;
        } else {
            this.QH &= -33;
        }
    }

    public boolean showsTextAsAction() {
        return (this.QU & 4) == 4;
    }

    public void setShowAsAction(int i) {
        switch (i & 3) {
            case 0:
            case 1:
            case 2:
                this.QU = i;
                this.mMenu.sA(this);
                return;
            default:
                throw new IllegalArgumentException("SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive.");
        }
    }

    public MenuItem setActionView(View view) {
        this.QE = view;
        this.QD = null;
        if (view != null && view.getId() == -1 && this.QL > 0) {
            view.setId(this.QL);
        }
        this.mMenu.sA(this);
        return this;
    }

    public MenuItem setActionView(int i) {
        Context context = this.mMenu.getContext();
        setActionView(LayoutInflater.from(context).inflate(i, new LinearLayout(context), false));
        return this;
    }

    public View getActionView() {
        if (this.QE != null) {
            return this.QE;
        }
        if (this.QD == null) {
            return null;
        }
        this.QE = this.QD.onCreateActionView(this);
        return this.QE;
    }

    public MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException("Implementation should use setSupportActionProvider!");
    }

    public ActionProvider getActionProvider() {
        throw new UnsupportedOperationException("Implementation should use getSupportActionProvider!");
    }

    public ActionProvider getSupportActionProvider() {
        return this.QD;
    }

    public MenuItem setSupportActionProvider(ActionProvider actionProvider) {
        if (this.QD == actionProvider) {
            return this;
        }
        this.QE = null;
        if (this.QD != null) {
            this.QD.setVisibilityListener(null);
        }
        this.QD = actionProvider;
        this.mMenu.sC(true);
        if (actionProvider != null) {
            actionProvider.setVisibilityListener(new VisibilityListener() {
                public void onActionProviderVisibilityChanged(boolean z) {
                    MenuItemImpl.this.mMenu.sB(MenuItemImpl.this);
                }
            });
        }
        return this;
    }

    public MenuItem setShowAsActionFlags(int i) {
        setShowAsAction(i);
        return this;
    }

    public boolean expandActionView() {
        if ((this.QU & 8) == 0 || this.QE == null) {
            return false;
        }
        if (this.QQ == null || this.QQ.onMenuItemActionExpand(this)) {
            return this.mMenu.expandItemActionView(this);
        }
        return false;
    }

    public boolean collapseActionView() {
        if ((this.QU & 8) == 0) {
            return false;
        }
        if (this.QE == null) {
            return true;
        }
        if (this.QQ == null || this.QQ.onMenuItemActionCollapse(this)) {
            return this.mMenu.collapseItemActionView(this);
        }
        return false;
    }

    public MenuItem setSupportOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        this.QQ = onActionExpandListener;
        return this;
    }

    public boolean hasCollapsibleActionView() {
        return ((this.QU & 8) == 0 || this.QE == null) ? false : true;
    }

    public void setActionViewExpanded(boolean z) {
        this.QN = z;
        this.mMenu.sC(false);
    }

    public boolean isActionViewExpanded() {
        return this.QN;
    }

    public MenuItem setOnActionExpandListener(OnActionExpandListener onActionExpandListener) {
        throw new UnsupportedOperationException("Implementation should use setSupportOnActionExpandListener!");
    }
}
