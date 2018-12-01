package com.android.camera.fragment.manually.adapter;

import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import java.util.List;

public class ManuallyAdapter extends Adapter<CommonRecyclerViewHolder> {
    private List<ComponentData> mComponentDataList;
    private int mCurrentMode;
    private OnClickListener mOnClickListener;
    @StringRes
    private int mSelectedTitle;

    public ManuallyAdapter(int currentMode, OnClickListener onClickListener, List<ComponentData> componentDataList) {
        this.mCurrentMode = currentMode;
        this.mOnClickListener = onClickListener;
        this.mComponentDataList = componentDataList;
    }

    public void setSelectedTitle(@StringRes int selectedTitle) {
        this.mSelectedTitle = selectedTitle;
        notifyDataSetChanged();
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.fragment_manually_item, parent, false);
        view.getLayoutParams().width = view.getResources().getDisplayMetrics().widthPixels / getItemCount();
        return new CommonRecyclerViewHolder(view);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder holder, int position) {
        int color;
        ComponentData componentData = (ComponentData) this.mComponentDataList.get(position);
        holder.itemView.setOnClickListener(this.mOnClickListener);
        holder.itemView.setTag(componentData);
        TextView key = (TextView) holder.getView(R.id.manually_item_key);
        if (componentData.getDisplayTitleString() > 0) {
            key.setText(componentData.getDisplayTitleString());
        }
        if (componentData.getDisplayTitleString() == this.mSelectedTitle) {
            color = -16733953;
        } else {
            color = -1275068417;
        }
        key.setTextColor(color);
        TextView value = (TextView) holder.getView(R.id.manually_item_value);
        ImageView valueImage = (ImageView) holder.getView(R.id.manually_item_value_image);
        int text = componentData.getValueDisplayString(this.mCurrentMode);
        if (text != -2) {
            value.setVisibility(0);
            value.setText(text);
            valueImage.setVisibility(8);
            return;
        }
        value.setVisibility(8);
        valueImage.setImageResource(componentData.getValueSelectedDrawable(this.mCurrentMode));
        valueImage.setVisibility(0);
    }

    public int getItemCount() {
        return this.mComponentDataList.size();
    }
}
