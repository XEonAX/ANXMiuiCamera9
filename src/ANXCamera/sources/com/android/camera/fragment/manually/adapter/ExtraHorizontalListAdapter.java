package com.android.camera.fragment.manually.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.ui.ColorActivateTextView;
import com.android.camera.ui.ColorImageView;
import com.android.camera.ui.HorizontalListView;
import com.android.camera.ui.HorizontalListView.OnSingleTapDownListener;

public class ExtraHorizontalListAdapter extends BaseAdapter implements OnItemClickListener, OnSingleTapDownListener {
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private ManuallyListener mManuallyListener;
    private boolean mOnCreated = true;

    private static class ViewHolder {
        private ColorImageView mColorImageView;
        private ColorActivateTextView mText;

        /* synthetic */ ViewHolder(ViewHolder -this0) {
            this();
        }

        private ViewHolder() {
        }
    }

    public ExtraHorizontalListAdapter(ComponentData componentData, int currentMode, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = currentMode;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
    }

    public int getCount() {
        return this.mComponentData.getItems().size();
    }

    public long getItemId(int position) {
        return (long) position;
    }

    public Object getItem(int position) {
        return this.mComponentData.getItems().get(position);
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
        int color;
        if (convertView == null) {
            convertView = LayoutInflater.from(parent.getContext()).inflate(R.layout.fragment_manually_extra_item, null);
            holder = new ViewHolder();
            holder.mColorImageView = (ColorImageView) convertView.findViewById(R.id.extra_item_image);
            holder.mText = (ColorActivateTextView) convertView.findViewById(R.id.extra_item_text);
            holder.mText.setNormalCor(-1275068417);
            holder.mText.setActivateColor(-16733953);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(position);
        String value = componentDataItem.mValue;
        if (componentDataItem.mIconRes != -1) {
            holder.mColorImageView.setVisibility(0);
            holder.mColorImageView.setImageResource(componentDataItem.mIconRes);
        } else {
            holder.mColorImageView.setVisibility(8);
        }
        holder.mText.setText(componentDataItem.mDisplayNameRes);
        if (value.equals(this.mCurrentValue)) {
            color = -16733953;
        } else {
            color = -1275068417;
        }
        holder.mColorImageView.setColor(color);
        return convertView;
    }

    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        if (this.mOnCreated) {
            this.mOnCreated = false;
            return;
        }
        parent.setSelection(position);
        if (!((HorizontalListView) parent).isScrolling()) {
            changeValue(position);
        }
    }

    public void onSingleTapDown(AdapterView<?> parent, View view, int position, long id) {
        ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            parent.setSelection(position);
            changeValue(position);
        }
    }

    private void changeValue(int position) {
        String newValue = ((ComponentDataItem) this.mComponentData.getItems().get(position)).mValue;
        if (newValue != null && (newValue.equals(this.mCurrentValue) ^ 1) != 0) {
            this.mComponentData.setComponentValue(this.mCurrentMode, newValue);
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, newValue, false);
            }
            this.mCurrentValue = newValue;
        }
    }

    public int getValuePosition() {
        int size = getCount();
        for (int i = 0; i < size; i++) {
            if (this.mCurrentValue.equals(((ComponentDataItem) this.mComponentData.getItems().get(i)).mValue)) {
                return i;
            }
        }
        return -1;
    }
}
