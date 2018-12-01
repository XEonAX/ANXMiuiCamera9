package com.miui.internal.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.PopupWindow.OnDismissListener;
import com.miui.internal.app.ActionBarDelegateImpl;
import miui.R;
import miui.util.AttributeResolver;
import miui.widget.ImmersionListPopupWindow;

public class PhoneImmersionMenuPopupWindow extends ImmersionListPopupWindow implements ImmersionMenuPopupWindow {
    private ActionBarDelegateImpl Rc;
    private ImmersionMenuAdapter Rd;
    private Drawable Re;
    private View Rf;
    private ViewGroup Rg;

    public PhoneImmersionMenuPopupWindow(ActionBarDelegateImpl actionBarDelegateImpl, Menu menu) {
        super(actionBarDelegateImpl.getThemedContext());
        Context themedContext = actionBarDelegateImpl.getThemedContext();
        this.Rc = actionBarDelegateImpl;
        this.Rd = new ImmersionMenuAdapter(themedContext, menu);
        setAdapter(this.Rd);
        setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                MenuItem item = PhoneImmersionMenuPopupWindow.this.Rd.getItem(i);
                if (item.hasSubMenu()) {
                    final SubMenu subMenu = item.getSubMenu();
                    PhoneImmersionMenuPopupWindow.this.setOnDismissListener(new OnDismissListener() {
                        public void onDismiss() {
                            PhoneImmersionMenuPopupWindow.this.setOnDismissListener(null);
                            PhoneImmersionMenuPopupWindow.this.update(subMenu);
                            PhoneImmersionMenuPopupWindow.this.fastShow(PhoneImmersionMenuPopupWindow.this.Rf, PhoneImmersionMenuPopupWindow.this.Rg);
                        }
                    });
                } else {
                    PhoneImmersionMenuPopupWindow.this.Rc.onMenuItemSelected(0, item);
                }
                PhoneImmersionMenuPopupWindow.this.dismiss(true);
            }
        });
        this.Re = AttributeResolver.resolveDrawable(themedContext, R.attr.immersionWindowBackground);
    }

    public void update(Menu menu) {
        this.Rd.update(menu);
    }

    public void show(View view, ViewGroup viewGroup) {
        this.Rf = view;
        this.Rg = viewGroup;
        super.show(view, viewGroup);
    }

    protected Drawable getBlurBackground(Context context, View view) {
        if (this.Re != null) {
            return this.Re;
        }
        return super.getBlurBackground(context, view);
    }
}
