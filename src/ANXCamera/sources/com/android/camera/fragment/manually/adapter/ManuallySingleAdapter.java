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

public class ManuallySingleAdapter extends Adapter<CommonRecyclerViewHolder> implements OnClickListener {
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private ManuallyListener mManuallyListener;

    public ManuallySingleAdapter(ComponentData componentData, int currentMode, ManuallyListener manuallyListener, int itemWidth) {
        this.mComponentData = componentData;
        this.mCurrentMode = currentMode;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.fragment_manually_item, parent, false);
        view.getLayoutParams().width = view.getResources().getDisplayMetrics().widthPixels / getItemCount();
        return new CommonRecyclerViewHolder(view);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder holder, int position) {
        int color;
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(position);
        String value = componentDataItem.mValue;
        holder.itemView.setOnClickListener(this);
        holder.itemView.setTag(value);
        TextView textView = (TextView) holder.getView(R.id.manually_item_key);
        holder.getView(R.id.manually_item_value).setVisibility(8);
        holder.getView(R.id.manually_item_value_image).setVisibility(8);
        textView.setText(componentDataItem.mDisplayNameRes);
        if (value.equals(this.mCurrentValue)) {
            color = -16733953;
        } else {
            color = -1275068417;
        }
        textView.setTextColor(color);
    }

    public int getItemCount() {
        return this.mComponentData.getItems().size();
    }

    public void onClick(View v) {
        String newValue = (String) v.getTag();
        if (newValue != null && (newValue.equals(this.mCurrentValue) ^ 1) != 0) {
            this.mComponentData.setComponentValue(this.mCurrentMode, newValue);
            notifyDataSetChanged();
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, newValue, false);
            }
            this.mCurrentValue = newValue;
        }
    }
}
