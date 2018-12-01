package com.android.camera.fragment.beauty;

import android.animation.ArgbEvaluator;
import android.animation.FloatEvaluator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.LinearInterpolator;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.ColorImageView;
import java.util.List;

public class SingleCheckAdapter extends Adapter<SingleCheckViewHolder> {
    private ArgbEvaluator mArgbEvaluator;
    private int mColorNormal;
    private int mColorSelected;
    private Context mContext;
    private boolean mEnableClick = true;
    private FloatEvaluator mFloatEvaluator;
    private int mItemHorizontalMargin = 0;
    private OnItemClickListener mOnItemClickListener;
    private int mPreSelectedItem = 0;
    private RecyclerView mRecyclerView;
    private int mSelectedItem = 0;
    private List<LevelItem> mSingleCheckList;

    public static class LevelItem {
        private int mTextResource;

        public LevelItem(int name) {
            this.mTextResource = name;
        }

        public int getTextResource() {
            return this.mTextResource;
        }
    }

    class SingleCheckViewHolder extends ViewHolder implements OnClickListener {
        private SingleCheckAdapter mAdapter;
        private ColorImageView mBase;
        private ColorImageView mText;

        public SingleCheckViewHolder(View itemView, SingleCheckAdapter adapter) {
            super(itemView);
            this.mAdapter = adapter;
            this.mText = (ColorImageView) itemView.findViewById(R.id.second_text);
            this.mBase = (ColorImageView) itemView.findViewById(R.id.second_base);
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mBase.getLayoutParams();
            marginLayoutParams.setMarginStart(SingleCheckAdapter.this.mItemHorizontalMargin);
            marginLayoutParams.setMarginEnd(SingleCheckAdapter.this.mItemHorizontalMargin);
            itemView.setOnClickListener(this);
        }

        public void setDateToView(LevelItem item, int position) throws Exception {
            this.mText.setBackgroundResource(item.getTextResource());
            this.mText.setAlpha(position == SingleCheckAdapter.this.mSelectedItem ? 1.0f : 0.6f);
            this.mBase.setColor(position == SingleCheckAdapter.this.mSelectedItem ? SingleCheckAdapter.this.mColorSelected : SingleCheckAdapter.this.mColorNormal);
            if (!Util.isAccessible()) {
                return;
            }
            ColorImageView colorImageView;
            CharSequence string;
            if (position == 0) {
                colorImageView = this.mText;
                if (position == SingleCheckAdapter.this.mSelectedItem) {
                    string = SingleCheckAdapter.this.mContext.getString(R.string.accessibility_beauty_switch_closed);
                } else {
                    string = SingleCheckAdapter.this.mContext.getString(R.string.accessibility_beauty_switch_open);
                }
                colorImageView.setContentDescription(string);
                return;
            }
            colorImageView = this.mText;
            if (position == SingleCheckAdapter.this.mSelectedItem) {
                string = position + SingleCheckAdapter.this.mContext.getString(R.string.accessibility_open);
            } else {
                string = position + SingleCheckAdapter.this.mContext.getString(R.string.accessibility_closed);
            }
            colorImageView.setContentDescription(string);
        }

        public void onClick(View v) {
            if (SingleCheckAdapter.this.mEnableClick) {
                int newPos = getAdapterPosition();
                if (newPos != SingleCheckAdapter.this.mSelectedItem) {
                    SingleCheckAdapter.this.mPreSelectedItem = SingleCheckAdapter.this.mSelectedItem;
                    SingleCheckAdapter.this.mSelectedItem = newPos;
                    SingleCheckViewHolder pre = (SingleCheckViewHolder) SingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(SingleCheckAdapter.this.mPreSelectedItem);
                    SingleCheckViewHolder curr = (SingleCheckViewHolder) SingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(SingleCheckAdapter.this.mSelectedItem);
                    animateOut(pre.mBase, pre.mText);
                    animateIn(curr.mBase, curr.mText);
                    this.mAdapter.onItemHolderClick(this);
                }
            }
        }

        private void animateOut(final ColorImageView imageView, final ColorImageView textImage) {
            ValueAnimator animator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            animator.setDuration(100);
            animator.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float input) {
                    float interpolation = super.getInterpolation(input);
                    imageView.setColorAndRefresh(((Integer) SingleCheckAdapter.this.mArgbEvaluator.evaluate(interpolation, Integer.valueOf(SingleCheckAdapter.this.mColorSelected), Integer.valueOf(SingleCheckAdapter.this.mColorNormal))).intValue());
                    ViewCompat.setAlpha(textImage, SingleCheckAdapter.this.mFloatEvaluator.evaluate(interpolation, Float.valueOf(1.0f), Float.valueOf(0.6f)).floatValue());
                    return interpolation;
                }
            });
            animator.start();
        }

        private void animateIn(final ColorImageView imageView, final ColorImageView textImage) {
            ValueAnimator animator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            animator.setDuration(100);
            animator.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float input) {
                    float interpolation = super.getInterpolation(input);
                    imageView.setColorAndRefresh(((Integer) SingleCheckAdapter.this.mArgbEvaluator.evaluate(interpolation, Integer.valueOf(SingleCheckAdapter.this.mColorNormal), Integer.valueOf(SingleCheckAdapter.this.mColorSelected))).intValue());
                    ViewCompat.setAlpha(textImage, SingleCheckAdapter.this.mFloatEvaluator.evaluate(interpolation, Float.valueOf(0.6f), Float.valueOf(1.0f)).floatValue());
                    return interpolation;
                }
            });
            animator.start();
        }
    }

    public void setEnableClick(boolean enableClick) {
        this.mEnableClick = enableClick;
    }

    public SingleCheckAdapter(Context context, List<LevelItem> listItems, int horizontalMargin) {
        this.mSingleCheckList = listItems;
        this.mColorNormal = context.getResources().getColor(R.color.beautycamera_beauty_level_item_backgroud_normal);
        this.mColorSelected = context.getResources().getColor(R.color.beautycamera_beauty_level_item_backgroud_pressed);
        this.mItemHorizontalMargin = horizontalMargin;
        this.mArgbEvaluator = new ArgbEvaluator();
        this.mFloatEvaluator = new FloatEvaluator();
        this.mContext = context;
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mRecyclerView = recyclerView;
    }

    public SingleCheckViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SingleCheckViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.beauty_level_item, viewGroup, false), this);
    }

    public void onBindViewHolder(SingleCheckViewHolder viewHolder, int position) {
        try {
            viewHolder.setDateToView((LevelItem) this.mSingleCheckList.get(position), position);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getItemCount() {
        return this.mSingleCheckList.size();
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mOnItemClickListener = onItemClickListener;
    }

    public void onItemHolderClick(SingleCheckViewHolder holder) {
        if (this.mOnItemClickListener != null) {
            this.mOnItemClickListener.onItemClick(null, holder.itemView, holder.getAdapterPosition(), holder.getItemId());
        }
    }

    public void setSelectedPosition(int position) {
        this.mSelectedItem = position;
    }
}
