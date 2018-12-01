package com.miui.internal.view.menu;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.os.IBinder;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.View;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import com.miui.internal.R;
import com.miui.internal.view.menu.MenuPresenter.Callback;

public class MenuDialogHelper implements OnKeyListener, OnClickListener, OnDismissListener, Callback {
    private AlertDialog Qs;
    ListMenuPresenter Qt;
    private Callback Qu;
    private MenuBuilder mMenu;

    public MenuDialogHelper(MenuBuilder menuBuilder) {
        this.mMenu = menuBuilder;
    }

    public void show(IBinder iBinder) {
        MenuBuilder menuBuilder = this.mMenu;
        Builder builder = new Builder(menuBuilder.getContext());
        this.Qt = new ListMenuPresenter(R.layout.list_menu_item_layout, R.style.Theme_MenuDialog_Light);
        this.Qt.setCallback(this);
        this.mMenu.addMenuPresenter(this.Qt);
        builder.setAdapter(this.Qt.getAdapter(), this);
        View headerView = menuBuilder.getHeaderView();
        if (headerView != null) {
            builder.setCustomTitle(headerView);
        } else {
            builder.setIcon(menuBuilder.getHeaderIcon()).setTitle(menuBuilder.getHeaderTitle());
        }
        builder.setOnKeyListener(this);
        this.Qs = builder.create();
        this.Qs.setOnDismissListener(this);
        LayoutParams attributes = this.Qs.getWindow().getAttributes();
        attributes.type = 1003;
        if (iBinder != null) {
            attributes.token = iBinder;
        }
        attributes.flags |= 131072;
        this.Qs.show();
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        if (i == 82 || i == 4) {
            Window window;
            View decorView;
            DispatcherState keyDispatcherState;
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                window = this.Qs.getWindow();
                if (window != null) {
                    decorView = window.getDecorView();
                    if (decorView != null) {
                        keyDispatcherState = decorView.getKeyDispatcherState();
                        if (keyDispatcherState != null) {
                            keyDispatcherState.startTracking(keyEvent, this);
                            return true;
                        }
                    }
                }
            } else if (keyEvent.getAction() == 1 && (keyEvent.isCanceled() ^ 1) != 0) {
                window = this.Qs.getWindow();
                if (window != null) {
                    decorView = window.getDecorView();
                    if (decorView != null) {
                        keyDispatcherState = decorView.getKeyDispatcherState();
                        if (keyDispatcherState != null && keyDispatcherState.isTracking(keyEvent)) {
                            this.mMenu.sq(true);
                            dialogInterface.dismiss();
                            return true;
                        }
                    }
                }
            }
        }
        return this.mMenu.performShortcut(i, keyEvent, 0);
    }

    public void setPresenterCallback(Callback callback) {
        this.Qu = callback;
    }

    public void dismiss() {
        if (this.Qs != null) {
            this.Qs.dismiss();
        }
    }

    public void onDismiss(DialogInterface dialogInterface) {
        this.Qt.onCloseMenu(this.mMenu, true);
    }

    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (z || menuBuilder == this.mMenu) {
            dismiss();
        }
        if (this.Qu != null) {
            this.Qu.onCloseMenu(menuBuilder, z);
        }
    }

    public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
        return this.Qu != null ? this.Qu.onOpenSubMenu(menuBuilder) : false;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        this.mMenu.performItemAction((MenuItemImpl) this.Qt.getAdapter().getItem(i), 0);
    }
}
