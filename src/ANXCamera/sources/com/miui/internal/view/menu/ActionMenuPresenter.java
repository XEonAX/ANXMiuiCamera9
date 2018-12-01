package com.miui.internal.view.menu;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.SparseBooleanArray;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.Button;
import com.miui.internal.R;
import com.miui.internal.util.DeviceHelper;
import com.miui.internal.view.ActionBarPolicy;
import com.miui.internal.view.menu.ActionMenuView.ActionMenuChildView;
import com.miui.internal.view.menu.MenuBuilder.ItemInvoker;
import com.miui.internal.view.menu.MenuPresenter.Callback;
import com.miui.internal.view.menu.MenuView.ItemView;
import java.util.ArrayList;

public class ActionMenuPresenter extends BaseMenuPresenter {
    private final SparseBooleanArray OV;
    private ActionButtonSubMenu OW;
    private int OX;
    private boolean OY;
    private int OZ;
    private int Pa;
    private OverflowMenu Pb;
    private int Pc;
    private boolean Pd;
    int Pe;
    private View Pf;
    private OverflowMenu Pg;
    private int Ph;
    private MenuItemImpl Pi;
    final PopupPresenterCallback Pj;
    private OpenOverflowRunnable Pk;
    private boolean Pl;
    private boolean Pm;
    private View Pn;
    private boolean Po;
    private int Pp;
    private boolean Pq;

    private class ActionButtonSubMenu extends MenuDialogHelper {
        public ActionButtonSubMenu(SubMenuBuilder subMenuBuilder) {
            super(subMenuBuilder);
            ActionMenuPresenter.this.setCallback(ActionMenuPresenter.this.Pj);
        }

        public void onDismiss(DialogInterface dialogInterface) {
            super.onDismiss(dialogInterface);
            ActionMenuPresenter.this.OW = null;
            ActionMenuPresenter.this.Pe = 0;
        }
    }

    private interface OverflowMenu {
        void dismiss(boolean z);

        boolean isShowing();

        void th(MenuBuilder menuBuilder);

        boolean tryShow();
    }

    private class ListOverflowMenu implements OverflowMenu {
        private ListMenuPresenter Pt;

        /* synthetic */ ListOverflowMenu(ActionMenuPresenter actionMenuPresenter, ListOverflowMenu listOverflowMenu) {
            this();
        }

        private ListOverflowMenu() {
        }

        private ListMenuPresenter ti(MenuBuilder menuBuilder) {
            if (this.Pt == null) {
                this.Pt = new ListMenuPresenter(ActionMenuPresenter.this.mContext, ActionMenuPresenter.this.Pa, ActionMenuPresenter.this.OZ);
            }
            menuBuilder.addMenuPresenter(this.Pt);
            return this.Pt;
        }

        public View tj(MenuBuilder menuBuilder) {
            return (menuBuilder == null || menuBuilder.getNonActionItems().size() <= 0) ? null : (View) ti(menuBuilder).getMenuView((ViewGroup) ActionMenuPresenter.this.mMenuView);
        }

        public boolean tryShow() {
            return ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).showOverflowMenu();
        }

        public boolean isShowing() {
            return ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).isOverflowMenuShowing();
        }

        public void dismiss(boolean z) {
            ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).hideOverflowMenu();
        }

        public void th(MenuBuilder menuBuilder) {
            ((PhoneActionMenuView) ActionMenuPresenter.this.mMenuView).setOverflowMenuView(tj(menuBuilder));
        }
    }

    private class OpenOverflowRunnable implements Runnable {
        private OverflowMenu Py;

        public OpenOverflowRunnable(OverflowMenu overflowMenu) {
            this.Py = overflowMenu;
        }

        public void run() {
            ActionMenuPresenter.this.mMenu.changeMenuMode();
            View view = (View) ActionMenuPresenter.this.mMenuView;
            if (!(view == null || view.getWindowToken() == null || !this.Py.tryShow())) {
                ActionMenuPresenter.this.Pg = this.Py;
            }
            ActionMenuPresenter.this.Pk = null;
        }
    }

    private class OverflowMenuButton extends Button implements ActionMenuChildView {
        public OverflowMenuButton(Context context) {
            super(context, null, ActionMenuPresenter.this.Ph);
            setClickable(true);
            setFocusable(true);
            setVisibility(0);
            setEnabled(true);
            Drawable drawable = getCompoundDrawables()[1];
            if (drawable != null) {
                int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.action_button_icon_bounds);
                drawable.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
                setCompoundDrawables(null, drawable, null, null);
            }
        }

        private boolean isVisible() {
            View thisR;
            while (thisR != null && thisR.getVisibility() == 0) {
                View view;
                ViewParent parent = thisR.getParent();
                if (parent instanceof ViewGroup) {
                    view = (ViewGroup) parent;
                } else {
                    view = null;
                }
                thisR = view;
            }
            return thisR == null;
        }

        public boolean performClick() {
            if (super.performClick() || !isVisible()) {
                return true;
            }
            if (ActionMenuPresenter.this.mMenu != null) {
                ActionMenuPresenter.this.mMenu.dispatchMenuItemSelected(ActionMenuPresenter.this.mMenu.getRootMenu(), ActionMenuPresenter.this.sY());
            }
            playSoundEffect(0);
            if (isSelected()) {
                ActionMenuPresenter.this.hideOverflowMenu(true);
            } else {
                ActionMenuPresenter.this.showOverflowMenu();
            }
            return true;
        }

        public boolean needsDividerBefore() {
            return false;
        }

        public boolean needsDividerAfter() {
            return false;
        }
    }

    private class PopupOverflowMenu extends MenuPopupHelper implements OverflowMenu {
        public PopupOverflowMenu(Context context, MenuBuilder menuBuilder, View view, boolean z) {
            super(context, menuBuilder, view, z);
            setCallback(ActionMenuPresenter.this.Pj);
            setMenuItemLayout(R.layout.overflow_popup_menu_item_layout);
        }

        public void onDismiss() {
            super.onDismiss();
            ActionMenuPresenter.this.mMenu.close();
            ActionMenuPresenter.this.Pg = null;
        }

        public void th(MenuBuilder menuBuilder) {
        }

        public void dismiss(boolean z) {
            super.dismiss(z);
            if (ActionMenuPresenter.this.Pf != null) {
                ActionMenuPresenter.this.Pf.setSelected(false);
            }
        }
    }

    private class PopupPresenterCallback implements Callback {
        /* synthetic */ PopupPresenterCallback(ActionMenuPresenter actionMenuPresenter, PopupPresenterCallback popupPresenterCallback) {
            this();
        }

        private PopupPresenterCallback() {
        }

        public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            if (menuBuilder == null) {
                return false;
            }
            ActionMenuPresenter.this.Pe = ((SubMenuBuilder) menuBuilder).getItem().getItemId();
            return false;
        }

        public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
            if (menuBuilder instanceof SubMenuBuilder) {
                menuBuilder.getRootMenu().sq(false);
            }
        }
    }

    private static class SavedState implements Parcelable {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public int Pr;

        SavedState() {
        }

        SavedState(Parcel parcel) {
            this.Pr = parcel.readInt();
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(this.Pr);
        }
    }

    public ActionMenuPresenter(Context context, int i, int i2) {
        this(context, i, i2, 0, 0);
    }

    public ActionMenuPresenter(Context context, int i, int i2, int i3, int i4) {
        super(context, i, i2);
        this.Ph = 16843510;
        this.OV = new SparseBooleanArray();
        this.Pj = new PopupPresenterCallback(this, null);
        this.Pa = i3;
        this.OZ = i4;
    }

    public void initForMenu(Context context, MenuBuilder menuBuilder) {
        super.initForMenu(context, menuBuilder);
        context.getResources();
        ActionBarPolicy actionBarPolicy = ActionBarPolicy.get(context);
        if (!this.Pm) {
            this.Pl = actionBarPolicy.showsOverflowMenuButton();
        }
        if (!this.Pq) {
            this.Pp = actionBarPolicy.getEmbeddedMenuWidthLimit();
        }
        if (!this.Pd) {
            this.Pc = actionBarPolicy.getMaxActionButtons();
        }
        int i = this.Pp;
        if (this.Pl) {
            if (this.Pf == null) {
                this.Pf = createOverflowMenuButton(this.mSystemContext);
                int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
                this.Pf.measure(makeMeasureSpec, makeMeasureSpec);
            }
            i -= this.Pf.getMeasuredWidth();
        } else {
            this.Pf = null;
        }
        this.OX = i;
        this.Pn = null;
    }

    public void onConfigurationChanged(Configuration configuration) {
        if (!this.Pd) {
            this.Pc = this.mContext.getResources().getInteger(R.integer.abc_max_action_buttons);
        }
        if (this.mMenu != null) {
            this.mMenu.sC(true);
        }
    }

    public void setWidthLimit(int i, boolean z) {
        this.Pp = i;
        this.Po = z;
        this.Pq = true;
    }

    public void setReserveOverflow(boolean z) {
        this.Pl = z;
        this.Pm = true;
    }

    public void setItemLimit(int i) {
        this.Pc = i;
        this.Pd = true;
    }

    public void setExpandedActionViewsExclusive(boolean z) {
        this.OY = z;
    }

    public void setActionEditMode(boolean z) {
        if (z) {
            this.Ph = R.attr.actionModeOverflowButtonStyle;
        }
    }

    public MenuView getMenuView(ViewGroup viewGroup) {
        MenuView menuView = super.getMenuView(viewGroup);
        ((ActionMenuView) menuView).setPresenter(this);
        return menuView;
    }

    public View getItemView(MenuItemImpl menuItemImpl, View view, ViewGroup viewGroup) {
        View itemView;
        View actionView = menuItemImpl.getActionView();
        if (actionView == null || menuItemImpl.hasCollapsibleActionView()) {
            if (!(view instanceof ActionMenuItemView)) {
                view = null;
            }
            itemView = super.getItemView(menuItemImpl, view, viewGroup);
        } else {
            itemView = actionView;
        }
        itemView.setVisibility(menuItemImpl.isActionViewExpanded() ? 8 : 0);
        ActionMenuView actionMenuView = (ActionMenuView) viewGroup;
        LayoutParams layoutParams = itemView.getLayoutParams();
        if (!actionMenuView.checkLayoutParams(layoutParams)) {
            itemView.setLayoutParams(actionMenuView.generateLayoutParams(layoutParams));
        }
        return itemView;
    }

    public void bindItemView(MenuItemImpl menuItemImpl, ItemView itemView) {
        itemView.initialize(menuItemImpl, 0);
        itemView.setItemInvoker((ItemInvoker) this.mMenuView);
    }

    public boolean shouldIncludeItem(int i, MenuItemImpl menuItemImpl) {
        return menuItemImpl.isActionButton();
    }

    public void updateMenuView(boolean z) {
        ArrayList arrayList = null;
        super.updateMenuView(z);
        if (this.mMenuView != null) {
            int i;
            if (this.mMenu != null) {
                arrayList = this.mMenu.getNonActionItems();
            }
            if (!this.Pl || arrayList == null) {
                i = 0;
            } else {
                int size = arrayList.size();
                i = size == 1 ? ((MenuItemImpl) arrayList.get(0)).isActionViewExpanded() ^ 1 : size > 0 ? 1 : 0;
            }
            if (i != 0) {
                if (this.Pf == null) {
                    this.Pf = createOverflowMenuButton(this.mSystemContext);
                } else {
                    this.Pf.setTranslationY(0.0f);
                }
                ViewGroup viewGroup = (ViewGroup) this.Pf.getParent();
                if (viewGroup != this.mMenuView) {
                    if (viewGroup != null) {
                        viewGroup.removeView(this.Pf);
                    }
                    ActionMenuView actionMenuView = (ActionMenuView) this.mMenuView;
                    actionMenuView.addView(this.Pf, actionMenuView.generateOverflowButtonLayoutParams());
                }
            } else if (this.Pf != null && this.Pf.getParent() == this.mMenuView) {
                ((ViewGroup) this.mMenuView).removeView(this.Pf);
            }
            ((ActionMenuView) this.mMenuView).setOverflowReserved(this.Pl);
            if (!DeviceHelper.IS_TABLET) {
                sX().th(this.mMenu);
            }
        }
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder) {
        if (!subMenuBuilder.hasVisibleItems()) {
            return false;
        }
        SubMenuBuilder subMenuBuilder2 = subMenuBuilder;
        while (subMenuBuilder2.getParentMenu() != this.mMenu) {
            subMenuBuilder2 = (SubMenuBuilder) subMenuBuilder2.getParentMenu();
        }
        if (sW(subMenuBuilder2.getItem()) == null) {
            if (this.Pf == null) {
                return false;
            }
            View view = this.Pf;
        }
        this.Pe = subMenuBuilder.getItem().getItemId();
        this.OW = new ActionButtonSubMenu(subMenuBuilder);
        this.OW.show(null);
        super.onSubMenuSelected(subMenuBuilder);
        return true;
    }

    private View sW(MenuItem menuItem) {
        ViewGroup viewGroup = (ViewGroup) this.mMenuView;
        if (viewGroup == null) {
            return null;
        }
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            if ((childAt instanceof ItemView) && ((ItemView) childAt).getItemData() == menuItem) {
                return childAt;
            }
        }
        return null;
    }

    public boolean showOverflowMenu() {
        if (!this.Pl || (isOverflowMenuShowing() ^ 1) == 0 || this.mMenu == null || this.mMenuView == null || this.Pk != null) {
            return false;
        }
        this.Pk = new OpenOverflowRunnable(sX());
        ((View) this.mMenuView).post(this.Pk);
        super.onSubMenuSelected(null);
        this.Pf.setSelected(true);
        return true;
    }

    private OverflowMenu sX() {
        if (DeviceHelper.IS_TABLET) {
            return new PopupOverflowMenu(this.mContext, this.mMenu, this.Pf, true);
        }
        if (this.Pb == null) {
            this.Pb = new ListOverflowMenu(this, null);
        }
        return this.Pb;
    }

    private MenuItemImpl sY() {
        if (this.Pi == null) {
            this.Pi = new MenuItemImpl(this.mMenu, 0, R.id.more, 0, 0, this.mContext.getString(R.string.more), 0);
        }
        return this.Pi;
    }

    public boolean hideOverflowMenu(boolean z) {
        if (this.Pk != null && this.mMenuView != null) {
            this.Pf.setSelected(false);
            ((View) this.mMenuView).removeCallbacks(this.Pk);
            this.Pk = null;
            return true;
        } else if (this.Pg == null) {
            return false;
        } else {
            boolean isShowing = this.Pg.isShowing();
            if (isShowing) {
                this.Pf.setSelected(false);
            }
            this.Pg.dismiss(z);
            return isShowing;
        }
    }

    public boolean dismissPopupMenus(boolean z) {
        return hideOverflowMenu(z);
    }

    public boolean hideSubMenus() {
        if (this.OW == null) {
            return false;
        }
        this.OW.dismiss();
        return true;
    }

    public boolean isOverflowMenuShowing() {
        return this.Pg != null ? this.Pg.isShowing() : false;
    }

    public boolean isOverflowReserved() {
        return this.Pl;
    }

    public boolean flagActionItems() {
        ArrayList visibleItems = this.mMenu.getVisibleItems();
        int size = visibleItems.size();
        int i = 0;
        int i2 = this.Pc < size ? this.Pc - 1 : this.Pc;
        while (i < size && i2 > 0) {
            int i3;
            MenuItemImpl menuItemImpl = (MenuItemImpl) visibleItems.get(i);
            boolean requiresActionButton = !menuItemImpl.requestsActionButton() ? menuItemImpl.requiresActionButton() : true;
            menuItemImpl.setIsActionButton(requiresActionButton);
            if (requiresActionButton) {
                i3 = i2 - 1;
            } else {
                i3 = i2;
            }
            i++;
            i2 = i3;
        }
        for (int i4 = i; i4 < size; i4++) {
            ((MenuItemImpl) visibleItems.get(i4)).setIsActionButton(false);
        }
        return true;
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        dismissPopupMenus(true);
        super.onCloseMenu(menuBuilder, z);
    }

    public Parcelable onSaveInstanceState() {
        Parcelable savedState = new SavedState();
        savedState.Pr = this.Pe;
        return savedState;
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        if (savedState.Pr > 0) {
            MenuItem findItem = this.mMenu.findItem(savedState.Pr);
            if (findItem != null) {
                onSubMenuSelected((SubMenuBuilder) findItem.getSubMenu());
            }
        }
    }

    public void onSubUiVisibilityChanged(boolean z) {
        if (z) {
            super.onSubMenuSelected(null);
        } else {
            this.mMenu.sq(false);
        }
    }

    protected View createOverflowMenuButton(Context context) {
        return new OverflowMenuButton(context);
    }
}
