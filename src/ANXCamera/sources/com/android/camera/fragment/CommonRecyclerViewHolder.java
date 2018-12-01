package com.android.camera.fragment;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.SparseArray;
import android.view.View;

public class CommonRecyclerViewHolder extends ViewHolder {
    private final SparseArray<View> mViews = new SparseArray();

    public CommonRecyclerViewHolder(View itemView) {
        super(itemView);
    }

    public <T extends View> T getView(int id) {
        View view = (View) this.mViews.get(id);
        if (view != null) {
            return view;
        }
        view = this.itemView.findViewById(id);
        this.mViews.put(id, view);
        return view;
    }
}
