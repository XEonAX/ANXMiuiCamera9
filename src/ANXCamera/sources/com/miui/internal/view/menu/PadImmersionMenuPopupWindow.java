package com.miui.internal.view.menu;

import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.PopupWindow.OnDismissListener;
import com.miui.internal.R;
import com.miui.internal.app.ActionBarDelegateImpl;
import miui.widget.ListPopupWindow;

public class PadImmersionMenuPopupWindow extends ListPopupWindow implements ImmersionMenuPopupWindow {
    private ActionBarDelegateImpl NT;
    private ImmersionMenuAdapter NU;
    private View NV;
    private ViewGroup NW;

    public PadImmersionMenuPopupWindow(ActionBarDelegateImpl actionBarDelegateImpl, Menu menu) {
        super(actionBarDelegateImpl.getActivity());
        this.NT = actionBarDelegateImpl;
        this.NU = new ImmersionMenuAdapter(actionBarDelegateImpl.getActivity(), menu);
        setAdapter(this.NU);
        setWidth(actionBarDelegateImpl.getActivity().getResources().getDimensionPixelSize(R.dimen.immersion_menu_window_width));
        setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                MenuItem item = PadImmersionMenuPopupWindow.this.NU.getItem(i);
                if (item.hasSubMenu()) {
                    final SubMenu subMenu = item.getSubMenu();
                    PadImmersionMenuPopupWindow.this.setOnDismissListener(new OnDismissListener() {
                        public void onDismiss() {
                            PadImmersionMenuPopupWindow.this.setOnDismissListener(null);
                            PadImmersionMenuPopupWindow.this.update(subMenu);
                            PadImmersionMenuPopupWindow.this.fastShow(PadImmersionMenuPopupWindow.this.NV, PadImmersionMenuPopupWindow.this.NW);
                        }
                    });
                } else {
                    PadImmersionMenuPopupWindow.this.NT.onMenuItemSelected(0, item);
                }
                PadImmersionMenuPopupWindow.this.dismiss(true);
            }
        });
    }

    public void update(Menu menu) {
        this.NU.update(menu);
    }

    public void show(View view, ViewGroup viewGroup) {
        this.NV = view;
        this.NW = viewGroup;
        setAnchorView(view);
        show();
    }

    public void fastShow(View view, ViewGroup viewGroup) {
        this.NV = view;
        this.NW = viewGroup;
        setAnchorView(view);
        postShow();
    }
}
