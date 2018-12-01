package com.android.camera.fragment.beauty;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.Resources;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.ColorImageView;
import java.util.List;

public class MakeupSingleCheckAdapter extends Adapter<SingleCheckViewHolder> {
    private Context mContext;
    private int mItemHorizontalMargin = 0;
    private int mPreSelectedItem = 0;
    private RecyclerView mRecyclerView;
    private int mSelectedItem = 0;
    private List<MakeupItem> mSingleCheckList;
    private OnItemClickListener onItemClickListener;

    public static class MakeupItem {
        private int mImageResource;
        private int mTextResource;

        public MakeupItem(int image, int name) {
            this.mImageResource = image;
            this.mTextResource = name;
        }

        public int getTextResource() {
            return this.mTextResource;
        }

        public int getImageResource() {
            return this.mImageResource;
        }
    }

    class SingleCheckViewHolder extends ViewHolder implements OnClickListener {
        private MakeupSingleCheckAdapter mAdapter;
        private ColorImageView mBase;
        private TextView mText;

        public SingleCheckViewHolder(View itemView, MakeupSingleCheckAdapter mAdapter) {
            super(itemView);
            this.mAdapter = mAdapter;
            this.mText = (TextView) itemView.findViewById(R.id.makeup_item_name);
            this.mBase = (ColorImageView) itemView.findViewById(R.id.makeup_item_icon);
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mBase.getLayoutParams();
            marginLayoutParams.setMarginStart(MakeupSingleCheckAdapter.this.mItemHorizontalMargin);
            marginLayoutParams.setMarginEnd(MakeupSingleCheckAdapter.this.mItemHorizontalMargin);
            itemView.setOnClickListener(this);
        }

        public void setDateToView(MakeupItem item, int position) throws Exception {
            int color;
            Resources res = MakeupSingleCheckAdapter.this.mContext.getResources();
            this.mText.setText(res.getString(item.getTextResource()));
            TextView textView = this.mText;
            if (position == MakeupSingleCheckAdapter.this.mSelectedItem) {
                color = res.getColor(R.color.beautycamera_beauty_advanced_item_text_pressed);
            } else {
                color = res.getColor(R.color.beautycamera_beauty_advanced_item_text_normal);
            }
            textView.setTextColor(color);
            if (Util.isAccessible()) {
                CharSequence charSequence;
                textView = this.mText;
                if (position == MakeupSingleCheckAdapter.this.mSelectedItem) {
                    charSequence = res.getString(item.getTextResource()) + res.getString(R.string.accessibility_open);
                } else {
                    charSequence = res.getString(item.getTextResource()) + res.getString(R.string.accessibility_closed);
                }
                textView.setContentDescription(charSequence);
            }
            this.mBase.setImageResource(item.getImageResource());
            ColorImageView colorImageView = this.mBase;
            if (position == MakeupSingleCheckAdapter.this.mSelectedItem) {
                color = res.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_pressed);
            } else {
                color = res.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal);
            }
            colorImageView.setColor(color);
        }

        public void onClick(View v) {
            int newPos = getAdapterPosition();
            if (newPos != MakeupSingleCheckAdapter.this.mSelectedItem) {
                MakeupSingleCheckAdapter.this.mPreSelectedItem = MakeupSingleCheckAdapter.this.mSelectedItem;
                MakeupSingleCheckAdapter.this.mSelectedItem = newPos;
                SingleCheckViewHolder pre = (SingleCheckViewHolder) MakeupSingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(MakeupSingleCheckAdapter.this.mPreSelectedItem);
                SingleCheckViewHolder curr = (SingleCheckViewHolder) MakeupSingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(MakeupSingleCheckAdapter.this.mSelectedItem);
                Resources res = MakeupSingleCheckAdapter.this.mContext.getResources();
                if (pre != null) {
                    colorAnimate(pre.mBase, res.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_pressed), res.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal));
                }
                colorAnimate(curr.mBase, res.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal), res.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_pressed));
                if (pre != null) {
                    textColorAnimate(pre.mText, res.getColor(R.color.beautycamera_beauty_advanced_item_text_pressed), res.getColor(R.color.beautycamera_beauty_advanced_item_text_normal));
                }
                textColorAnimate(curr.mText, res.getColor(R.color.beautycamera_beauty_advanced_item_text_normal), res.getColor(R.color.beautycamera_beauty_advanced_item_text_pressed));
                if (pre == null) {
                    this.mAdapter.notifyItemChanged(MakeupSingleCheckAdapter.this.mPreSelectedItem);
                }
                this.mAdapter.onItemHolderClick(this);
            }
        }

        private void textColorAnimate(final TextView tv, int fromColor, int toColor) {
            ValueAnimator colorAnimation = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[]{Integer.valueOf(fromColor), Integer.valueOf(toColor)});
            colorAnimation.setDuration(200);
            colorAnimation.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator animator) {
                    tv.setTextColor(((Integer) animator.getAnimatedValue()).intValue());
                }
            });
            colorAnimation.start();
        }

        private void colorAnimate(final ColorImageView v, int fromColor, int toColor) {
            ValueAnimator colorAnimation = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[]{Integer.valueOf(fromColor), Integer.valueOf(toColor)});
            colorAnimation.setDuration(200);
            colorAnimation.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator animator) {
                    v.setColorAndRefresh(((Integer) animator.getAnimatedValue()).intValue());
                }
            });
            colorAnimation.start();
        }
    }

    public MakeupSingleCheckAdapter(Context context, List<MakeupItem> listItems, int horizontalMargin) {
        this.mContext = context;
        this.mSingleCheckList = listItems;
        this.mItemHorizontalMargin = horizontalMargin;
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mRecyclerView = recyclerView;
    }

    public SingleCheckViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SingleCheckViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.makeup_item, viewGroup, false), this);
    }

    public void onBindViewHolder(SingleCheckViewHolder viewHolder, int position) {
        try {
            viewHolder.setDateToView((MakeupItem) this.mSingleCheckList.get(position), position);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getItemCount() {
        return this.mSingleCheckList.size();
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.onItemClickListener = onItemClickListener;
    }

    public void onItemHolderClick(SingleCheckViewHolder holder) {
        if (this.onItemClickListener != null) {
            this.onItemClickListener.onItemClick(null, holder.itemView, holder.getAdapterPosition(), holder.getItemId());
        }
    }

    public void setSelectedPosition(int position) {
        this.mSelectedItem = position;
    }
}
