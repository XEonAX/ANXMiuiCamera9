package com.android.camera.fragment.manually.adapter;

import android.support.v7.recyclerview.R;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.ui.ColorImageView;

public class ExtraRecyclerViewAdapter extends Adapter<CommonRecyclerViewHolder> implements OnClickListener {
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private int mItemWidth;
    private ManuallyListener mManuallyListener;

    public ExtraRecyclerViewAdapter(ComponentData componentData, int currentMode, ManuallyListener manuallyListener, int itemWidth) {
        this.mComponentData = componentData;
        this.mCurrentMode = currentMode;
        this.mManuallyListener = manuallyListener;
        this.mItemWidth = itemWidth;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.fragment_manually_extra_item, parent, false);
        view.getLayoutParams().width = this.mItemWidth;
        return new CommonRecyclerViewHolder(view);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder holder, int position) {
        int color;
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(position);
        String value = componentDataItem.mValue;
        holder.itemView.setOnClickListener(this);
        holder.itemView.setTag(value);
        TextView textView = (TextView) holder.getView(R.id.extra_item_text);
        ColorImageView colorImageView = (ColorImageView) holder.getView(R.id.extra_item_image);
        if (componentDataItem.mIconRes != -1) {
            colorImageView.setVisibility(0);
            colorImageView.setImageResource(componentDataItem.mIconRes);
            textView.setTextSize(0, (float) holder.itemView.getResources().getDimensionPixelSize(R.dimen.grid_setting_item_textSize));
        } else {
            colorImageView.setVisibility(8);
            textView.setTextSize(0, (float) holder.itemView.getResources().getDimensionPixelSize(R.dimen.grid_text_only_setting_item_textSize));
        }
        if (componentDataItem.mDisplayNameRes != -2) {
            textView.setVisibility(0);
            textView.setText(componentDataItem.mDisplayNameRes);
            colorImageView.setPadding(0, 0, 0, holder.itemView.getResources().getDimensionPixelSize(R.dimen.manually_item_image_padding_bottom));
        } else {
            colorImageView.setPadding(0, 0, 0, 0);
            textView.setVisibility(8);
        }
        if (value.equals(this.mCurrentValue)) {
            color = -16733953;
        } else {
            color = -1275068417;
        }
        colorImageView.setColor(color);
        textView.setTextColor(color);
    }

    public int getItemCount() {
        return this.mComponentData.getItems().size();
    }

    public int getValuePosition() {
        int size = getItemCount();
        for (int i = 0; i < size; i++) {
            if (this.mCurrentValue.equals(((ComponentDataItem) this.mComponentData.getItems().get(i)).mValue)) {
                return i;
            }
        }
        return -1;
    }

    public void onClick(View v) {
        String newValue = (String) v.getTag();
        if (couldNewValueTakeEffect(newValue)) {
            this.mComponentData.setComponentValue(this.mCurrentMode, newValue);
            notifyDataSetChanged();
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, newValue, false);
            }
            this.mCurrentValue = newValue;
        }
    }

    protected boolean couldNewValueTakeEffect(String newValue) {
        return newValue != null ? newValue.equals(this.mCurrentValue) ^ 1 : false;
    }
}
