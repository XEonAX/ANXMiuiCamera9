package com.android.camera.fragment.sticker;

import android.content.Context;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import java.util.List;

public abstract class BaseSelectAdapter<T> extends Adapter<BaseSelectHolder> implements OnClickListener {
    protected Context mContext;
    private ItemSelectChangeListener mItemSelectChangeListener;
    protected int mLastSelectedItemPosition = -1;
    protected List<T> mList;
    protected int mSelectedItemPosition = 0;

    public static abstract class BaseSelectHolder extends ViewHolder {
        protected View mIVSelected;

        public abstract void bindView(int i);

        public BaseSelectHolder(View itemView) {
            super(itemView);
            itemView.setTag(R.id.item_root, this);
            this.mIVSelected = itemView.findViewById(R.id.iv_selected);
        }
    }

    public interface ItemSelectChangeListener {
        boolean onItemSelect(BaseSelectHolder baseSelectHolder, int i, boolean z);
    }

    protected abstract BaseSelectHolder getHolder(View view);

    protected abstract int getLayoutId();

    public void initSelectItem(int position) {
        this.mSelectedItemPosition = position;
    }

    public void setSelectedItemPosition(int position) {
        this.mLastSelectedItemPosition = this.mSelectedItemPosition;
        this.mSelectedItemPosition = position;
        notifyItemChanged(this.mLastSelectedItemPosition, Boolean.valueOf(true));
        notifyItemChanged(this.mSelectedItemPosition, Boolean.valueOf(true));
    }

    public void setItemSelectChangeListener(ItemSelectChangeListener itemSelectChangeListener) {
        this.mItemSelectChangeListener = itemSelectChangeListener;
    }

    public void setList(List<T> list) {
        this.mList = list;
    }

    public BaseSelectAdapter(Context context) {
        this.mContext = context;
    }

    public BaseSelectHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return getHolder(LayoutInflater.from(this.mContext).inflate(getLayoutId(), parent, false));
    }

    public void onBindViewHolder(BaseSelectHolder holder, int position) {
        holder.itemView.setOnClickListener(this);
        setSelected(holder, position == this.mSelectedItemPosition);
        holder.bindView(position);
    }

    private void setSelected(BaseSelectHolder holder, boolean selected) {
        holder.itemView.setSelected(selected);
        holder.mIVSelected.setVisibility(selected ? 0 : 4);
    }

    public void onBindViewHolder(BaseSelectHolder holder, int position, List<Object> payloads) {
        boolean z = false;
        if (payloads == null || payloads.size() <= 0) {
            super.onBindViewHolder(holder, position, payloads);
            return;
        }
        if (position == this.mSelectedItemPosition) {
            z = true;
        }
        setSelected(holder, z);
    }

    public void onClick(View v) {
        BaseSelectHolder holder = (BaseSelectHolder) v.getTag(R.id.item_root);
        int position = holder.getAdapterPosition();
        if (this.mSelectedItemPosition != position) {
            if (this.mItemSelectChangeListener != null && this.mItemSelectChangeListener.onItemSelect(holder, position, true)) {
                setSelectedItemPosition(position);
            }
        } else if (this.mItemSelectChangeListener != null) {
            this.mItemSelectChangeListener.onItemSelect(holder, position, false);
        }
    }

    public int getItemCount() {
        return this.mList == null ? 0 : this.mList.size();
    }

    public T getItemData(int pos) {
        return this.mList.get(pos);
    }
}
