package com.miui.internal.view.menu;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.ActionProvider;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyCharacterMap.KeyData;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import com.miui.internal.R;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class MenuBuilder implements Menu {
    public static final int CATEGORY_MASK = -65536;
    public static final int CATEGORY_SHIFT = 16;
    private static final int[] NS = new int[]{1, 4, 5, 3, 2, 0};
    private static final String Nu = "android:menu:actionviewstates";
    private static final String Nv = "android:menu:expandedactionview";
    private static final String Nw = "android:menu:presenters";
    public static final int USER_MASK = 65535;
    private MenuItemImpl NA;
    Drawable NB;
    CharSequence NC;
    View ND;
    private boolean NE;
    private boolean NF = false;
    private boolean NG;
    private ArrayList<MenuItemImpl> NH;
    private boolean NI = false;
    private ArrayList<MenuItemImpl> NJ;
    private boolean NK = false;
    private CopyOnWriteArrayList<WeakReference<MenuPresenter>> NL = new CopyOnWriteArrayList();
    private boolean NM = false;
    private boolean NN;
    private final Resources NO;
    private boolean NP;
    private ArrayList<MenuItemImpl> NQ = new ArrayList();
    private ArrayList<MenuItemImpl> NR;
    private Callback Nx;
    private ContextMenuInfo Ny;
    private int Nz = 0;
    private ArrayList<MenuItemImpl> mActionItems;
    private final Context mContext;

    public interface Callback {
        boolean onMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem);

        void onMenuModeChange(MenuBuilder menuBuilder);
    }

    public interface ItemInvoker {
        boolean invokeItem(MenuItemImpl menuItemImpl);
    }

    public MenuBuilder(Context context) {
        this.mContext = context;
        this.NO = context.getResources();
        this.NH = new ArrayList();
        this.NR = new ArrayList();
        this.NG = true;
        this.mActionItems = new ArrayList();
        this.NJ = new ArrayList();
        this.NE = true;
        sH(true);
    }

    public MenuBuilder setDefaultShowAsAction(int i) {
        this.Nz = i;
        return this;
    }

    public void addMenuPresenter(MenuPresenter menuPresenter) {
        this.NL.add(new WeakReference(menuPresenter));
        menuPresenter.initForMenu(this.mContext, this);
        this.NE = true;
    }

    public void removeMenuPresenter(MenuPresenter menuPresenter) {
        for (WeakReference weakReference : this.NL) {
            MenuPresenter menuPresenter2 = (MenuPresenter) weakReference.get();
            if (menuPresenter2 == null || menuPresenter2 == menuPresenter) {
                this.NL.remove(weakReference);
            }
        }
    }

    private void sr(boolean z) {
        if (!this.NL.isEmpty()) {
            stopDispatchingItemsChanged();
            for (WeakReference weakReference : this.NL) {
                MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
                if (menuPresenter == null) {
                    this.NL.remove(weakReference);
                } else {
                    menuPresenter.updateMenuView(z);
                }
            }
            startDispatchingItemsChanged();
        }
    }

    private boolean su(SubMenuBuilder subMenuBuilder) {
        boolean z = false;
        if (this.NL.isEmpty()) {
            return false;
        }
        Iterator it = this.NL.iterator();
        while (true) {
            boolean z2 = z;
            if (!it.hasNext()) {
                return z2;
            }
            WeakReference weakReference = (WeakReference) it.next();
            MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
            if (menuPresenter == null) {
                this.NL.remove(weakReference);
            } else if (!z2) {
                z2 = menuPresenter.onSubMenuSelected(subMenuBuilder);
            }
            z = z2;
        }
    }

    private void st(Bundle bundle) {
        if (!this.NL.isEmpty()) {
            SparseArray sparseArray = new SparseArray();
            for (WeakReference weakReference : this.NL) {
                MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
                if (menuPresenter == null) {
                    this.NL.remove(weakReference);
                } else {
                    int id = menuPresenter.getId();
                    if (id > 0) {
                        Parcelable onSaveInstanceState = menuPresenter.onSaveInstanceState();
                        if (onSaveInstanceState != null) {
                            sparseArray.put(id, onSaveInstanceState);
                        }
                    }
                }
            }
            bundle.putSparseParcelableArray(Nw, sparseArray);
        }
    }

    private void ss(Bundle bundle) {
        SparseArray sparseParcelableArray = bundle.getSparseParcelableArray(Nw);
        if (sparseParcelableArray != null && !this.NL.isEmpty()) {
            for (WeakReference weakReference : this.NL) {
                MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
                if (menuPresenter == null) {
                    this.NL.remove(weakReference);
                } else {
                    int id = menuPresenter.getId();
                    if (id > 0) {
                        Parcelable parcelable = (Parcelable) sparseParcelableArray.get(id);
                        if (parcelable != null) {
                            menuPresenter.onRestoreInstanceState(parcelable);
                        }
                    }
                }
            }
        }
    }

    public void savePresenterStates(Bundle bundle) {
        st(bundle);
    }

    public void restorePresenterStates(Bundle bundle) {
        ss(bundle);
    }

    public void saveActionViewStates(Bundle bundle) {
        int size = size();
        int i = 0;
        SparseArray sparseArray = null;
        while (i < size) {
            SparseArray sparseArray2;
            MenuItem item = getItem(i);
            View actionView = item.getActionView();
            if (actionView == null || actionView.getId() == -1) {
                sparseArray2 = sparseArray;
            } else {
                if (sparseArray == null) {
                    sparseArray = new SparseArray();
                }
                actionView.saveHierarchyState(sparseArray);
                if (item.isActionViewExpanded()) {
                    bundle.putInt(Nv, item.getItemId());
                    sparseArray2 = sparseArray;
                } else {
                    sparseArray2 = sparseArray;
                }
            }
            if (item.hasSubMenu()) {
                ((SubMenuBuilder) item.getSubMenu()).saveActionViewStates(bundle);
            }
            i++;
            sparseArray = sparseArray2;
        }
        if (sparseArray != null) {
            bundle.putSparseParcelableArray(getActionViewStatesKey(), sparseArray);
        }
    }

    public void restoreActionViewStates(Bundle bundle) {
        if (bundle != null) {
            MenuItem item;
            SparseArray sparseParcelableArray = bundle.getSparseParcelableArray(getActionViewStatesKey());
            int size = size();
            for (int i = 0; i < size; i++) {
                item = getItem(i);
                View actionView = item.getActionView();
                if (!(actionView == null || actionView.getId() == -1)) {
                    actionView.restoreHierarchyState(sparseParcelableArray);
                }
                if (item.hasSubMenu()) {
                    ((SubMenuBuilder) item.getSubMenu()).restoreActionViewStates(bundle);
                }
            }
            int i2 = bundle.getInt(Nv);
            if (i2 > 0) {
                item = findItem(i2);
                if (item != null) {
                    item.expandActionView();
                }
            }
        }
    }

    protected String getActionViewStatesKey() {
        return Nu;
    }

    public void setCallback(Callback callback) {
        this.Nx = callback;
    }

    private MenuItem sp(int i, int i2, int i3, CharSequence charSequence) {
        int sz = sz(i3);
        MenuItem menuItemImpl = new MenuItemImpl(this, i, i2, i3, sz, charSequence, this.Nz);
        if (this.Ny != null) {
            menuItemImpl.tB(this.Ny);
        }
        this.NH.add(sv(this.NH, sz), menuItemImpl);
        sC(true);
        return menuItemImpl;
    }

    public MenuItem add(CharSequence charSequence) {
        return sp(0, 0, 0, charSequence);
    }

    public MenuItem add(int i) {
        return sp(0, 0, 0, this.NO.getString(i));
    }

    public MenuItem add(int i, int i2, int i3, CharSequence charSequence) {
        return sp(i, i2, i3, charSequence);
    }

    public MenuItem add(int i, int i2, int i3, int i4) {
        return sp(i, i2, i3, this.NO.getString(i4));
    }

    public SubMenu addSubMenu(CharSequence charSequence) {
        return addSubMenu(0, 0, 0, charSequence);
    }

    public SubMenu addSubMenu(int i) {
        return addSubMenu(0, 0, 0, this.NO.getString(i));
    }

    public SubMenu addSubMenu(int i, int i2, int i3, CharSequence charSequence) {
        MenuItemImpl menuItemImpl = (MenuItemImpl) sp(i, i2, i3, charSequence);
        SubMenu subMenuBuilder = new SubMenuBuilder(this.mContext, this, menuItemImpl);
        menuItemImpl.tC(subMenuBuilder);
        return subMenuBuilder;
    }

    public SubMenu addSubMenu(int i, int i2, int i3, int i4) {
        return addSubMenu(i, i2, i3, this.NO.getString(i4));
    }

    public int addIntentOptions(int i, int i2, int i3, ComponentName componentName, Intent[] intentArr, Intent intent, int i4, MenuItem[] menuItemArr) {
        PackageManager packageManager = this.mContext.getPackageManager();
        List queryIntentActivityOptions = packageManager.queryIntentActivityOptions(componentName, intentArr, intent, 0);
        int size = queryIntentActivityOptions != null ? queryIntentActivityOptions.size() : 0;
        if ((i4 & 1) == 0) {
            removeGroup(i);
        }
        for (int i5 = 0; i5 < size; i5++) {
            Intent intent2;
            ResolveInfo resolveInfo = (ResolveInfo) queryIntentActivityOptions.get(i5);
            if (resolveInfo.specificIndex < 0) {
                intent2 = intent;
            } else {
                intent2 = intentArr[resolveInfo.specificIndex];
            }
            Intent intent3 = new Intent(intent2);
            intent3.setComponent(new ComponentName(resolveInfo.activityInfo.applicationInfo.packageName, resolveInfo.activityInfo.name));
            MenuItem intent4 = add(i, i2, i3, resolveInfo.loadLabel(packageManager)).setIcon(resolveInfo.loadIcon(packageManager)).setIntent(intent3);
            if (menuItemArr != null && resolveInfo.specificIndex >= 0) {
                menuItemArr[resolveInfo.specificIndex] = intent4;
            }
        }
        return size;
    }

    public void removeItem(int i) {
        sD(findItemIndex(i), true);
    }

    public void removeGroup(int i) {
        int findGroupIndex = findGroupIndex(i);
        if (findGroupIndex >= 0) {
            int size = this.NH.size() - findGroupIndex;
            int i2 = 0;
            while (true) {
                int i3 = i2 + 1;
                if (i2 >= size || ((MenuItemImpl) this.NH.get(findGroupIndex)).getGroupId() != i) {
                    sC(true);
                } else {
                    sD(findGroupIndex, false);
                    i2 = i3;
                }
            }
            sC(true);
        }
    }

    private void sD(int i, boolean z) {
        if (i >= 0 && i < this.NH.size()) {
            this.NH.remove(i);
            if (z) {
                sC(true);
            }
        }
    }

    public void removeItemAt(int i) {
        sD(i, true);
    }

    public void clearAll() {
        this.NM = true;
        clear();
        clearHeader();
        this.NM = false;
        this.NI = false;
        sC(true);
    }

    public void clear() {
        if (this.NA != null) {
            collapseItemActionView(this.NA);
        }
        this.NH.clear();
        sC(true);
    }

    void sE(MenuItem menuItem) {
        int groupId = menuItem.getGroupId();
        for (MenuItem menuItem2 : this.NH) {
            if (menuItem2.getGroupId() == groupId && menuItem2.isExclusiveCheckable() && menuItem2.isCheckable()) {
                menuItem2.tD(menuItem2 == menuItem);
            }
        }
    }

    public void setGroupCheckable(int i, boolean z, boolean z2) {
        for (MenuItemImpl menuItemImpl : this.NH) {
            if (menuItemImpl.getGroupId() == i) {
                menuItemImpl.setExclusiveCheckable(z2);
                menuItemImpl.setCheckable(z);
            }
        }
    }

    public void setGroupVisible(int i, boolean z) {
        boolean z2;
        boolean z3 = false;
        Iterator it = this.NH.iterator();
        while (true) {
            z2 = z3;
            if (!it.hasNext()) {
                break;
            }
            MenuItemImpl menuItemImpl = (MenuItemImpl) it.next();
            if (menuItemImpl.getGroupId() == i && menuItemImpl.tE(z)) {
                z3 = true;
            } else {
                z3 = z2;
            }
        }
        if (z2) {
            sC(true);
        }
    }

    public void setGroupEnabled(int i, boolean z) {
        for (MenuItemImpl menuItemImpl : this.NH) {
            if (menuItemImpl.getGroupId() == i) {
                menuItemImpl.setEnabled(z);
            }
        }
    }

    public boolean hasVisibleItems() {
        int size = size();
        for (int i = 0; i < size; i++) {
            if (((MenuItemImpl) this.NH.get(i)).isVisible()) {
                return true;
            }
        }
        return false;
    }

    public MenuItem findItem(int i) {
        int size = size();
        for (int i2 = 0; i2 < size; i2++) {
            MenuItemImpl menuItemImpl = (MenuItemImpl) this.NH.get(i2);
            if (menuItemImpl.getItemId() == i) {
                return menuItemImpl;
            }
            if (menuItemImpl.hasSubMenu()) {
                MenuItem findItem = menuItemImpl.getSubMenu().findItem(i);
                if (findItem != null) {
                    return findItem;
                }
            }
        }
        return null;
    }

    public int findItemIndex(int i) {
        int size = size();
        for (int i2 = 0; i2 < size; i2++) {
            if (((MenuItemImpl) this.NH.get(i2)).getItemId() == i) {
                return i2;
            }
        }
        return -1;
    }

    public int findGroupIndex(int i) {
        return findGroupIndex(i, 0);
    }

    public int findGroupIndex(int i, int i2) {
        int size = size();
        if (i2 < 0) {
            i2 = 0;
        }
        while (i2 < size) {
            if (((MenuItemImpl) this.NH.get(i2)).getGroupId() == i) {
                return i2;
            }
            i2++;
        }
        return -1;
    }

    public int size() {
        return this.NH.size();
    }

    public MenuItem getItem(int i) {
        return (MenuItem) this.NH.get(i);
    }

    public boolean isShortcutKey(int i, KeyEvent keyEvent) {
        return sw(i, keyEvent) != null;
    }

    public void setQwertyMode(boolean z) {
        this.NN = z;
        sC(false);
    }

    private static int sz(int i) {
        int i2 = (-65536 & i) >> 16;
        if (i2 >= 0 && i2 < NS.length) {
            return (NS[i2] << 16) | (65535 & i);
        }
        throw new IllegalArgumentException("order does not contain a valid category.");
    }

    boolean isQwertyMode() {
        return this.NN;
    }

    public void setShortcutsVisible(boolean z) {
        if (this.NP != z) {
            sH(z);
            sC(false);
        }
    }

    private void sH(boolean z) {
        boolean z2;
        if (!z || this.NO.getConfiguration().keyboard == 1) {
            z2 = false;
        } else {
            z2 = this.NO.getBoolean(R.bool.abc_config_showMenuShortcutsWhenKeyboardPresent);
        }
        this.NP = z2;
    }

    public boolean isShortcutsVisible() {
        return this.NP;
    }

    Resources getResources() {
        return this.NO;
    }

    public Context getContext() {
        return this.mContext;
    }

    boolean dispatchMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
        return this.Nx != null ? this.Nx.onMenuItemSelected(menuBuilder, menuItem) : false;
    }

    public void changeMenuMode() {
        if (this.Nx != null) {
            this.Nx.onMenuModeChange(this);
        }
    }

    private static int sv(ArrayList<MenuItemImpl> arrayList, int i) {
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            if (((MenuItemImpl) arrayList.get(size)).getOrdering() <= i) {
                return size + 1;
            }
        }
        return 0;
    }

    public boolean performShortcut(int i, KeyEvent keyEvent, int i2) {
        boolean z = false;
        MenuItem sw = sw(i, keyEvent);
        if (sw != null) {
            z = performItemAction(sw, i2);
        }
        if ((i2 & 2) != 0) {
            sq(true);
        }
        return z;
    }

    void sx(List<MenuItemImpl> list, int i, KeyEvent keyEvent) {
        boolean isQwertyMode = isQwertyMode();
        int metaState = keyEvent.getMetaState();
        KeyData keyData = new KeyData();
        if (keyEvent.getKeyData(keyData) || i == 67) {
            for (MenuItemImpl menuItemImpl : this.NH) {
                char alphabeticShortcut;
                if (menuItemImpl.hasSubMenu()) {
                    ((MenuBuilder) menuItemImpl.getSubMenu()).sx(list, i, keyEvent);
                }
                if (isQwertyMode) {
                    alphabeticShortcut = menuItemImpl.getAlphabeticShortcut();
                } else {
                    alphabeticShortcut = menuItemImpl.getNumericShortcut();
                }
                if ((metaState & 5) == 0 && alphabeticShortcut != 0) {
                    if ((alphabeticShortcut == keyData.meta[0] || alphabeticShortcut == keyData.meta[2] || (isQwertyMode && alphabeticShortcut == 8 && i == 67)) && menuItemImpl.isEnabled()) {
                        list.add(menuItemImpl);
                    }
                }
            }
        }
    }

    MenuItemImpl sw(int i, KeyEvent keyEvent) {
        Iterable<MenuItemImpl> iterable = this.NQ;
        iterable.clear();
        sx(iterable, i, keyEvent);
        if (iterable.isEmpty()) {
            return null;
        }
        int metaState = keyEvent.getMetaState();
        KeyData keyData = new KeyData();
        keyEvent.getKeyData(keyData);
        if (iterable.size() == 1) {
            return (MenuItemImpl) iterable.get(0);
        }
        boolean isQwertyMode = isQwertyMode();
        for (MenuItemImpl menuItemImpl : iterable) {
            char alphabeticShortcut;
            if (isQwertyMode) {
                alphabeticShortcut = menuItemImpl.getAlphabeticShortcut();
            } else {
                alphabeticShortcut = menuItemImpl.getNumericShortcut();
            }
            if ((alphabeticShortcut == keyData.meta[0] && (metaState & 2) == 0) || ((alphabeticShortcut == keyData.meta[2] && (metaState & 2) != 0) || (isQwertyMode && alphabeticShortcut == 8 && i == 67))) {
                return menuItemImpl;
            }
        }
        return null;
    }

    public boolean performIdentifierAction(int i, int i2) {
        return performItemAction(findItem(i), i2);
    }

    public boolean performItemAction(MenuItem menuItem, int i) {
        MenuItemImpl menuItemImpl = (MenuItemImpl) menuItem;
        if (menuItemImpl == null || (menuItemImpl.isEnabled() ^ 1) != 0) {
            return false;
        }
        boolean expandActionView;
        boolean invoke = menuItemImpl.invoke();
        ActionProvider supportActionProvider = menuItemImpl.getSupportActionProvider();
        boolean hasSubMenu = supportActionProvider != null ? supportActionProvider.hasSubMenu() : false;
        if (menuItemImpl.hasCollapsibleActionView()) {
            expandActionView = menuItemImpl.expandActionView() | invoke;
            if (expandActionView) {
                sq(true);
            }
        } else if (menuItemImpl.hasSubMenu() || hasSubMenu) {
            sq(false);
            if (!menuItemImpl.hasSubMenu()) {
                menuItemImpl.tC(new SubMenuBuilder(getContext(), this, menuItemImpl));
            }
            SubMenuBuilder subMenuBuilder = (SubMenuBuilder) menuItemImpl.getSubMenu();
            if (hasSubMenu) {
                supportActionProvider.onPrepareSubMenu(subMenuBuilder);
            }
            expandActionView = su(subMenuBuilder) | invoke;
            if (!expandActionView) {
                sq(true);
            }
        } else if ((i & 1) == 0) {
            sq(true);
            expandActionView = invoke;
        } else {
            expandActionView = invoke;
        }
        return expandActionView;
    }

    final void sq(boolean z) {
        if (!this.NF) {
            this.NF = true;
            for (WeakReference weakReference : this.NL) {
                MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
                if (menuPresenter == null) {
                    this.NL.remove(weakReference);
                } else {
                    menuPresenter.onCloseMenu(this, z);
                }
            }
            this.NF = false;
        }
    }

    public void close() {
        sq(true);
    }

    void sC(boolean z) {
        if (this.NM) {
            this.NI = true;
            return;
        }
        if (z) {
            this.NG = true;
            this.NE = true;
        }
        sr(z);
    }

    public void stopDispatchingItemsChanged() {
        if (!this.NM) {
            this.NM = true;
            this.NI = false;
        }
    }

    public void startDispatchingItemsChanged() {
        this.NM = false;
        if (this.NI) {
            this.NI = false;
            sC(true);
        }
    }

    void sB(MenuItemImpl menuItemImpl) {
        this.NG = true;
        sC(true);
    }

    void sA(MenuItemImpl menuItemImpl) {
        this.NE = true;
        sC(true);
    }

    public ArrayList<MenuItemImpl> getVisibleItems() {
        if (!this.NG) {
            return this.NR;
        }
        this.NR.clear();
        for (MenuItemImpl menuItemImpl : this.NH) {
            if (menuItemImpl.isVisible()) {
                this.NR.add(menuItemImpl);
            }
        }
        this.NG = false;
        this.NE = true;
        return this.NR;
    }

    public void flagActionItems() {
        if (this.NE) {
            int i = 0;
            for (WeakReference weakReference : this.NL) {
                int i2;
                MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
                if (menuPresenter == null) {
                    this.NL.remove(weakReference);
                    i2 = i;
                } else {
                    i2 = menuPresenter.flagActionItems() | i;
                }
                i = i2;
            }
            if (i != 0) {
                this.mActionItems.clear();
                this.NJ.clear();
                for (MenuItemImpl menuItemImpl : getVisibleItems()) {
                    if (menuItemImpl.isActionButton()) {
                        this.mActionItems.add(menuItemImpl);
                    } else {
                        this.NJ.add(menuItemImpl);
                    }
                }
            } else {
                this.mActionItems.clear();
                this.NJ.clear();
                this.NJ.addAll(getVisibleItems());
            }
            this.NE = false;
        }
    }

    public ArrayList<MenuItemImpl> getActionItems() {
        flagActionItems();
        return this.mActionItems;
    }

    public ArrayList<MenuItemImpl> getNonActionItems() {
        flagActionItems();
        return this.NJ;
    }

    public void clearHeader() {
        this.NB = null;
        this.NC = null;
        this.ND = null;
        sC(false);
    }

    private void sF(int i, CharSequence charSequence, int i2, Drawable drawable, View view) {
        Resources resources = getResources();
        if (view != null) {
            this.ND = view;
            this.NC = null;
            this.NB = null;
        } else {
            if (i > 0) {
                this.NC = resources.getText(i);
            } else if (charSequence != null) {
                this.NC = charSequence;
            }
            if (i2 > 0) {
                this.NB = resources.getDrawable(i2);
            } else if (drawable != null) {
                this.NB = drawable;
            }
            this.ND = null;
        }
        sC(false);
    }

    protected MenuBuilder setHeaderTitleInt(CharSequence charSequence) {
        sF(0, charSequence, 0, null, null);
        return this;
    }

    protected MenuBuilder setHeaderTitleInt(int i) {
        sF(i, null, 0, null, null);
        return this;
    }

    protected MenuBuilder setHeaderIconInt(Drawable drawable) {
        sF(0, null, 0, drawable, null);
        return this;
    }

    protected MenuBuilder setHeaderIconInt(int i) {
        sF(0, null, i, null, null);
        return this;
    }

    protected MenuBuilder setHeaderViewInt(View view) {
        sF(0, null, 0, null, view);
        return this;
    }

    public CharSequence getHeaderTitle() {
        return this.NC;
    }

    public Drawable getHeaderIcon() {
        return this.NB;
    }

    public View getHeaderView() {
        return this.ND;
    }

    public MenuBuilder getRootMenu() {
        return this;
    }

    public void setCurrentMenuInfo(ContextMenuInfo contextMenuInfo) {
        this.Ny = contextMenuInfo;
    }

    void sG(boolean z) {
        this.NK = z;
    }

    boolean sy() {
        return this.NK;
    }

    public boolean expandItemActionView(MenuItemImpl menuItemImpl) {
        boolean z = false;
        if (this.NL.isEmpty()) {
            return false;
        }
        stopDispatchingItemsChanged();
        Iterator it = this.NL.iterator();
        while (true) {
            boolean z2 = z;
            if (!it.hasNext()) {
                z = z2;
                break;
            }
            WeakReference weakReference = (WeakReference) it.next();
            MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
            if (menuPresenter == null) {
                this.NL.remove(weakReference);
                z = z2;
            } else {
                z = menuPresenter.expandItemActionView(this, menuItemImpl);
                if (z) {
                    break;
                }
            }
        }
        startDispatchingItemsChanged();
        if (z) {
            this.NA = menuItemImpl;
        }
        return z;
    }

    public boolean collapseItemActionView(MenuItemImpl menuItemImpl) {
        boolean z = false;
        if (this.NL.isEmpty() || this.NA != menuItemImpl) {
            return false;
        }
        stopDispatchingItemsChanged();
        Iterator it = this.NL.iterator();
        while (true) {
            boolean z2 = z;
            if (!it.hasNext()) {
                z = z2;
                break;
            }
            WeakReference weakReference = (WeakReference) it.next();
            MenuPresenter menuPresenter = (MenuPresenter) weakReference.get();
            if (menuPresenter == null) {
                this.NL.remove(weakReference);
                z = z2;
            } else {
                z = menuPresenter.collapseItemActionView(this, menuItemImpl);
                if (z) {
                    break;
                }
            }
        }
        startDispatchingItemsChanged();
        if (z) {
            this.NA = null;
        }
        return z;
    }

    public MenuItemImpl getExpandedItem() {
        return this.NA;
    }
}
