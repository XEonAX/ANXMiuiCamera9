package com.android.camera.fragment.top;

import android.support.v7.recyclerview.R;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.sensetime.stmobile.STCommon;

public class ExpandAdapter extends Adapter<CommonRecyclerViewHolder> implements OnClickListener {
    private ComponentData mComponentData;
    private int mCurrentMode = ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode();
    private String mCurrentValue = this.mComponentData.getComponentValue(this.mCurrentMode);
    private ExpandListener mExpandListener;

    public interface ExpandListener {
        void onExpandValueChange(ComponentData componentData, String str);
    }

    public ExpandAdapter(ComponentData componentData, ExpandListener expandListener) {
        this.mComponentData = componentData;
        this.mExpandListener = expandListener;
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return new CommonRecyclerViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.grid_setting_expanded_text_item, parent, false));
    }

    public void onBindViewHolder(CommonRecyclerViewHolder holder, int position) {
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(position);
        String value = componentDataItem.mValue;
        holder.itemView.setOnClickListener(this);
        holder.itemView.setTag(value);
        final TextView textView = (TextView) holder.getView(R.id.text);
        textView.setText(holder.itemView.getResources().getString(componentDataItem.mDisplayNameRes));
        if (this.mCurrentValue.equals(componentDataItem.mValue)) {
            textView.setShadowLayer(0.0f, 0.0f, 0.0f, 0);
            textView.setBackgroundResource(R.drawable.bg_top_expanded_selected);
            if (Util.isAccessible()) {
                final String selectedStr = holder.itemView.getResources().getString(R.string.accessibility_selected);
                textView.postDelayed(new Runnable() {
                    public void run() {
                        textView.setContentDescription(textView.getText() + ", " + selectedStr);
                        textView.sendAccessibilityEvent(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
                    }
                }, 100);
                return;
            }
            return;
        }
        textView.setShadowLayer(4.0f, 0.0f, 0.0f, -1073741824);
        textView.setBackground(null);
    }

    public int getItemCount() {
        return this.mComponentData.getItems().size();
    }

    public void onClick(View v) {
        String newValue = (String) v.getTag();
        if (newValue != null && (newValue.equals(this.mCurrentValue) ^ 1) != 0) {
            this.mCurrentValue = newValue;
            this.mComponentData.setComponentValue(this.mCurrentMode, newValue);
            notifyDataSetChanged();
            if (this.mExpandListener != null) {
                this.mExpandListener.onExpandValueChange(this.mComponentData, newValue);
                this.mExpandListener = null;
            }
        }
    }
}
