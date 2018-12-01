package com.android.camera.fragment;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$ConfigChanges;
import com.android.camera.protocol.ModeProtocol$FilterProtocol;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import com.sensetime.stmobile.STCommon;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class FragmentFilter extends BaseFragment implements OnClickListener {
    private static final String TAG = FragmentFilter.class.getSimpleName();
    private boolean isAnimation = false;
    private ComponentConfigFilter mComponentConfigFilter;
    private CubicEaseOutInterpolator mCubicEaseOut;
    private int mCurrentIndex = -1;
    private EffectItemAdapter mEffectItemAdapter;
    private List<EffectItemHolder> mEffectItemHolderList = new LinkedList();
    private int mHolderWidth;
    private boolean mIgnoreSameItemClick = true;
    private int mIsShowIndex = -1;
    private int mLastIndex = -1;
    private LinearLayoutManager mLayoutManager;
    private RecyclerView mRecyclerView;
    private int mTotalWidth;

    protected class EffectItemAdapter extends Adapter {
        protected ComponentConfigFilter mFilters;
        protected LayoutInflater mLayoutInflater;

        public EffectItemAdapter(Context context, ComponentConfigFilter filters) {
            this.mFilters = filters;
            this.mLayoutInflater = LayoutInflater.from(context);
        }

        public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View view = this.mLayoutInflater.inflate(R.layout.effect_still_item, parent, false);
            EffectItemHolder holder = new EffectStillItemHolder(view);
            view.setOnClickListener(FragmentFilter.this);
            FragmentFilter.this.mEffectItemHolderList.add(holder);
            return holder;
        }

        public void onBindViewHolder(ViewHolder holder, int position) {
            ComponentDataItem componentDataItem = (ComponentDataItem) this.mFilters.getItems().get(position);
            EffectItemHolder effectHolder = (EffectItemHolder) holder;
            effectHolder.itemView.setTag(Integer.valueOf(position));
            effectHolder.bindEffectIndex(position, componentDataItem);
        }

        public int getItemCount() {
            return this.mFilters.getItems().size();
        }

        public void updateData(ComponentConfigFilter filters) {
            this.mFilters = filters;
            notifyDataSetChanged();
        }
    }

    protected abstract class EffectItemHolder extends ViewHolder {
        protected int mEffectIndex;
        protected TextView mTextView;

        public EffectItemHolder(View itemView) {
            super(itemView);
            this.mTextView = (TextView) itemView.findViewById(R.id.effect_item_text);
        }

        public void bindEffectIndex(int index, ComponentDataItem componentDataItem) {
            this.mEffectIndex = getRenderId(index, componentDataItem);
            this.mTextView.setText(componentDataItem.mDisplayNameRes);
        }

        protected int getRenderId(int index, ComponentDataItem componentDataItem) {
            return Integer.parseInt(componentDataItem.mValue);
        }
    }

    protected class EffectItemPadding extends ItemDecoration {
        protected int mEffectListLeft;
        protected int mHorizontalPadding;
        protected int mVerticalPadding;

        public EffectItemPadding() {
            this.mHorizontalPadding = FragmentFilter.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_item_padding_horizontal);
            this.mVerticalPadding = FragmentFilter.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_item_padding_vertical);
            this.mEffectListLeft = FragmentFilter.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_list_padding_left);
        }

        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, State state) {
            int i = 0;
            if (parent.getChildPosition(view) == 0) {
                i = this.mEffectListLeft;
            }
            outRect.set(i, this.mVerticalPadding, this.mHorizontalPadding, this.mVerticalPadding);
        }
    }

    protected class EffectStillItemHolder extends EffectItemHolder {
        private ImageView mImageView;
        private ImageView mSelectedIndicator;

        public EffectStillItemHolder(View itemView) {
            super(itemView);
            this.mImageView = (ImageView) itemView.findViewById(R.id.effect_item_image);
            this.mSelectedIndicator = (ImageView) itemView.findViewById(R.id.effect_item_selected_indicator);
        }

        public void bindEffectIndex(int index, ComponentDataItem componentDataItem) {
            super.bindEffectIndex(index, componentDataItem);
            this.mImageView.setImageResource(componentDataItem.mIconRes);
            if (index == FragmentFilter.this.mCurrentIndex) {
                this.itemView.setActivated(true);
                FragmentFilter.this.showSelected(this.mImageView, componentDataItem.mIconRes);
                if (Util.isAccessible()) {
                    this.itemView.setContentDescription(FragmentFilter.this.getContext().getString(componentDataItem.mDisplayNameRes) + FragmentFilter.this.getString(R.string.accessibility_selected));
                    this.itemView.postDelayed(new Runnable() {
                        public void run() {
                            if (FragmentFilter.this.isAdded()) {
                                EffectStillItemHolder.this.itemView.sendAccessibilityEvent(STCommon.ST_MOBILE_ENABLE_HAND_DETECT);
                            }
                        }
                    }, 100);
                }
                if (FragmentFilter.this.isAnimation) {
                    ViewCompat.setAlpha(this.mSelectedIndicator, 0.0f);
                    ViewCompat.animate(this.mSelectedIndicator).setDuration(500).alpha(1.0f).setInterpolator(FragmentFilter.this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                        public void onAnimationStart(View view) {
                            EffectStillItemHolder.this.mSelectedIndicator.setVisibility(0);
                        }

                        public void onAnimationEnd(View view) {
                        }

                        public void onAnimationCancel(View view) {
                        }
                    }).start();
                    return;
                }
                this.mSelectedIndicator.setVisibility(0);
                this.mSelectedIndicator.setAlpha(1.0f);
                return;
            }
            this.itemView.setActivated(false);
            if (FragmentFilter.this.isAnimation && index == FragmentFilter.this.mLastIndex) {
                ViewCompat.setAlpha(this.mSelectedIndicator, 1.0f);
                ViewCompat.animate(this.mSelectedIndicator).setDuration(500).alpha(0.0f).setInterpolator(FragmentFilter.this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                    public void onAnimationStart(View view) {
                    }

                    public void onAnimationEnd(View view) {
                        EffectStillItemHolder.this.mSelectedIndicator.setVisibility(8);
                    }

                    public void onAnimationCancel(View view) {
                    }
                }).start();
                return;
            }
            this.mSelectedIndicator.setVisibility(8);
            this.mSelectedIndicator.setAlpha(0.0f);
        }
    }

    protected void initView(View v) {
        this.mRecyclerView = (RecyclerView) v.findViewById(R.id.effect_list);
        ArrayList<FilterInfo> filterInfoList = getFilterInfo();
        this.mComponentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        this.mComponentConfigFilter.mapToItems(filterInfoList);
        Context context = getContext();
        this.mTotalWidth = context.getResources().getDisplayMetrics().widthPixels;
        this.mHolderWidth = context.getResources().getDimensionPixelSize(R.dimen.effect_item_width);
        this.mEffectItemAdapter = new EffectItemAdapter(context, this.mComponentConfigFilter);
        this.mLayoutManager = new LinearLayoutManager(context);
        this.mLayoutManager.setOrientation(0);
        this.mRecyclerView.getRecycledViewPool().setMaxRecycledViews(0, EffectController.getInstance().getEffectCount(1));
        this.mRecyclerView.setLayoutManager(this.mLayoutManager);
        this.mRecyclerView.addItemDecoration(new EffectItemPadding());
        this.mRecyclerView.setAdapter(this.mEffectItemAdapter);
        this.mRecyclerView.addOnScrollListener(new OnScrollListener() {
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                super.onScrollStateChanged(recyclerView, newState);
                FragmentFilter.this.isAnimation = false;
            }
        });
        ItemAnimator animator = new DefaultItemAnimator();
        animator.setChangeDuration(150);
        animator.setMoveDuration(150);
        animator.setAddDuration(150);
        this.mRecyclerView.setItemAnimator(animator);
        this.mCubicEaseOut = new CubicEaseOutInterpolator();
    }

    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        updateCurrentIndex();
    }

    private ArrayList<FilterInfo> getFilterInfo() {
        int category;
        switch (DataRepository.dataItemGlobal().getCurrentMode()) {
            case 161:
                category = 3;
                break;
            case 163:
            case 165:
                if (!CameraSettings.isFrontCamera()) {
                    category = 1;
                    break;
                }
                category = 2;
                break;
            case 171:
                category = 2;
                break;
            default:
                category = 1;
                break;
        }
        return EffectController.getInstance().getFilterInfo(category);
    }

    public void isShowAnimation(List<Completable> animateInElements) {
        if (animateInElements == null) {
            this.isAnimation = false;
        } else {
            this.isAnimation = true;
        }
    }

    public void updateFilterData() {
        ArrayList<FilterInfo> filterInfoList = getFilterInfo();
        this.mComponentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        this.mComponentConfigFilter.mapToItems(filterInfoList);
        this.mEffectItemAdapter.updateData(this.mComponentConfigFilter);
        updateCurrentIndex();
    }

    private void updateCurrentIndex() {
        String currentValue = this.mComponentConfigFilter.getComponentValue(DataRepository.dataItemGlobal().getCurrentMode());
        int index = this.mComponentConfigFilter.findIndexOfValue(currentValue);
        if (index == -1) {
            Log.w(TAG, "invalid filter " + currentValue);
            index = 0;
        }
        setItemInCenter(index);
    }

    public void delayShowSelected(boolean isShow) {
        if (isShow) {
            this.mCurrentIndex = this.mIsShowIndex;
            this.isAnimation = true;
        } else {
            this.mIsShowIndex = this.mCurrentIndex;
            setItemInCenter(this.mIsShowIndex);
            this.mCurrentIndex = -1;
        }
        this.mEffectItemAdapter.notifyItemChanged(this.mIsShowIndex);
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
    }

    private void setItemInCenter(int index) {
        this.mCurrentIndex = index;
        this.mIsShowIndex = index;
        this.mLayoutManager.scrollToPositionWithOffset(index, (this.mTotalWidth / 2) - (this.mHolderWidth / 2));
    }

    private void selectItem(int index) {
        if (index != -1) {
            this.mLastIndex = this.mCurrentIndex;
            this.mCurrentIndex = index;
            scrollIfNeed(index);
            notifyItemChanged(this.mLastIndex, this.mCurrentIndex);
        }
    }

    private void notifyItemChanged(int oldIndex, int newIndex) {
        if (oldIndex > -1) {
            this.mEffectItemAdapter.notifyItemChanged(oldIndex);
        }
        if (newIndex > -1) {
            this.mEffectItemAdapter.notifyItemChanged(newIndex);
        }
    }

    private void scrollIfNeed(int selected) {
        if (selected == this.mLayoutManager.findFirstVisibleItemPosition() || selected == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.max(0, selected - 1));
        } else if (selected == this.mLayoutManager.findLastVisibleItemPosition() || selected == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.min(selected + 1, this.mEffectItemAdapter.getItemCount() - 1));
        }
    }

    public void onClick(View v) {
        if (this.mRecyclerView.isEnabled()) {
            ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                int index = ((Integer) v.getTag()).intValue();
                if (this.mCurrentIndex != index || !this.mIgnoreSameItemClick) {
                    this.isAnimation = false;
                    onFilterSelected(index, true);
                }
            }
        }
    }

    private void onFilterSelected(int index, boolean fromClick) {
        try {
            String filterValue = ((ComponentDataItem) this.mComponentConfigFilter.getItems().get(index)).mValue;
            this.mComponentConfigFilter.setClosed(false, this.mCurrentMode);
            int filterId = Integer.valueOf(filterValue).intValue();
            CameraStatUtil.trackFilterChanged(this.mCurrentMode, filterId, fromClick);
            persistFilter(filterId);
            selectItem(index);
            onFilterChanged(filterId);
        } catch (NumberFormatException e) {
            Log.e(TAG, "invalid filter id: " + e.getMessage());
        }
    }

    private void persistFilter(int filterId) {
        CameraSettings.setShaderEffect(filterId);
    }

    private void onFilterChanged(int filterId) {
        int oldFilterId = EffectController.getInstance().getEffect(false);
        EffectController.getInstance().setInvertFlag(0);
        ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (CameraSettings.isGroupShotOn()) {
            ((ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).configGroupSwitch(4);
            topAlert.refreshExtraMenu();
        }
        ModeProtocol$FilterProtocol p = (ModeProtocol$FilterProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(165);
        if (p != null) {
            p.onFilterChanged(FilterInfo.getCategory(filterId), FilterInfo.getIndex(filterId));
        }
        topAlert.updateConfigItem(196);
    }

    public void switchFilter(int gravity) {
        int index = -1;
        switch (gravity) {
            case 3:
                if (this.mCurrentIndex > 0) {
                    index = this.mCurrentIndex - 1;
                    break;
                }
                break;
            case 5:
                if (this.mCurrentIndex < this.mComponentConfigFilter.getItems().size() - 1) {
                    index = this.mCurrentIndex + 1;
                    break;
                }
                break;
            default:
                Log.e(TAG, "unexpected gravity " + gravity);
                break;
        }
        if (index > -1) {
            onFilterSelected(index, false);
        }
    }

    private void showSelected(ImageView imageView, int resourceId) {
        Canvas canvas = new Canvas();
        Bitmap mainImage = BitmapFactory.decodeResource(getResources(), R.drawable.filter_item_selected_view);
        Bitmap maskImage = BitmapFactory.decodeResource(getResources(), resourceId);
        Bitmap result = Bitmap.createBitmap(mainImage.getWidth(), mainImage.getHeight(), Config.ARGB_8888);
        canvas.setBitmap(result);
        Paint paint = new Paint();
        paint.setFilterBitmap(false);
        canvas.drawBitmap(mainImage, 0.0f, 0.0f, paint);
        paint.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
        canvas.drawBitmap(maskImage, 0.0f, 0.0f, paint);
        paint.setXfermode(null);
        imageView.setImageBitmap(result);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_filter;
    }

    public int getFragmentInto() {
        return 250;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
    }
}
