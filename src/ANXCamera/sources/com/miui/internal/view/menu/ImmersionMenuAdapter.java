package com.miui.internal.view.menu;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.miui.internal.R;
import java.util.ArrayList;

public class ImmersionMenuAdapter extends BaseAdapter {
    private ArrayList<MenuItem> NX = new ArrayList();
    private LayoutInflater mInflater;

    ImmersionMenuAdapter(Context context, Menu menu) {
        this.mInflater = LayoutInflater.from(context);
        sM(menu, this.NX);
    }

    private void sM(Menu menu, ArrayList<MenuItem> arrayList) {
        arrayList.clear();
        if (menu != null) {
            int size = menu.size();
            for (int i = 0; i < size; i++) {
                MenuItem item = menu.getItem(i);
                if (item.isVisible()) {
                    arrayList.add(item);
                }
            }
        }
    }

    public int getCount() {
        return this.NX.size();
    }

    public MenuItem getItem(int i) {
        return (MenuItem) this.NX.get(i);
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.mInflater.inflate(R.layout.immersion_popup_menu_item, viewGroup, false);
            view.setTag((TextView) view.findViewById(16908308));
        }
        ((TextView) view.getTag()).setText(getItem(i).getTitle());
        return view;
    }

    public void update(Menu menu) {
        sM(menu, this.NX);
        notifyDataSetChanged();
    }
}
