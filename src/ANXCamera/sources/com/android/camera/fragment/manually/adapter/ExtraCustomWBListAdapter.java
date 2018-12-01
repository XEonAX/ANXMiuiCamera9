package com.android.camera.fragment.manually.adapter;

import android.support.v7.recyclerview.R;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.ui.ColorActivateTextView;
import com.android.camera.ui.ColorImageView;
import com.android.camera.ui.HorizontalListView;
import com.android.camera.ui.HorizontalListView.OnSingleTapDownListener;

public class ExtraCustomWBListAdapter extends BaseAdapter implements OnItemClickListener, OnSingleTapDownListener {
    private ManuallyListener mManuallyListener;
    private ComponentManuallyWB mManuallyWB;
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

    public ExtraCustomWBListAdapter(ComponentManuallyWB componentData, ManuallyListener manuallyListener) {
        this.mManuallyWB = componentData;
        this.mManuallyListener = manuallyListener;
    }

    public int getCount() {
        return 61;
    }

    public long getItemId(int position) {
        return (long) position;
    }

    public Object getItem(int position) {
        return this.mManuallyWB.getItems().get(position);
    }

    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
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
        holder.mText.setText(String.valueOf((position * 100) + 2000));
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
        parent.setSelection(position);
        changeValue(position);
    }

    private void changeValue(int position) {
        int newValue = (position * 100) + 2000;
        int oldValue = this.mManuallyWB.getCustomWB();
        if (newValue != oldValue) {
            this.mManuallyWB.setCustomWB(newValue);
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mManuallyWB, String.valueOf(oldValue), String.valueOf(newValue), true);
            }
        }
    }

    public int getValuePosition() {
        return (this.mManuallyWB.getCustomWB() - 2000) / 100;
    }
}
