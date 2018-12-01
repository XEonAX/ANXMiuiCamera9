package com.android.camera.fragment.beauty;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.Device;
import com.android.camera.Util;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$FrontBeautyProtocol;
import java.util.ArrayList;
import java.util.List;

public class BeautyLevelFragment extends Fragment {
    private RecyclerView mLevelItemList;
    private SingleCheckAdapter mSingleCheckAdapter;

    public class MyLayoutManager extends LinearLayoutManager {
        public MyLayoutManager(Context context) {
            super(context);
        }

        public void onMeasure(Recycler recycler, State state, int widthSpec, int heightSpec) {
            View view = recycler.getViewForPosition(0);
            if (view != null) {
                measureChild(view, widthSpec, heightSpec);
                setMeasuredDimension(MeasureSpec.getSize(widthSpec), view.getMeasuredHeight());
            }
        }
    }

    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_beauty_level, container, false);
        initView(v);
        return v;
    }

    private void initView(View view) {
        this.mLevelItemList = (RecyclerView) view.findViewById(R.id.beauty_level_item_list);
        MyLayoutManager layoutManager = new MyLayoutManager(getActivity());
        layoutManager.setOrientation(0);
        this.mLevelItemList.setLayoutManager(layoutManager);
        this.mLevelItemList.setFocusable(false);
        List<LevelItem> items = initItems();
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mLevelItemList.getLayoutParams();
        int itemHorizontalMargin = provideItemHorizontalMargin();
        marginLayoutParams.setMarginStart((getResources().getDisplayMetrics().widthPixels - (items.size() * (getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_size) + (itemHorizontalMargin * 2)))) / 2);
        this.mSingleCheckAdapter = new SingleCheckAdapter(getActivity(), items, itemHorizontalMargin);
        this.mSingleCheckAdapter.setOnItemClickListener(initOnItemClickListener());
        this.mSingleCheckAdapter.setSelectedPosition(beautyLevelToPosition(BeautyParameters.getInstance().getCurrentLevel(), items.size() - 1));
        this.mLevelItemList.setAdapter(this.mSingleCheckAdapter);
        this.mSingleCheckAdapter.notifyDataSetChanged();
    }

    protected List<LevelItem> initItems() {
        List<LevelItem> items = new ArrayList();
        items.add(new LevelItem(R.drawable.ff));
        items.add(new LevelItem(R.drawable.f1));
        items.add(new LevelItem(R.drawable.f2));
        items.add(new LevelItem(R.drawable.f3));
        items.add(new LevelItem(R.drawable.f4));
        items.add(new LevelItem(R.drawable.f5));
        return items;
    }

    protected int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_margin);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                BeautyLevelFragment.this.setBeautyLevel(position);
            }
        };
    }

    protected int beautyLevelToPosition(int beautyLevel, int maxPosition) {
        return Util.clamp(beautyLevel, 0, maxPosition);
    }

    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser) {
            if (this.mLevelItemList != null) {
                if (this.mSingleCheckAdapter != null) {
                    this.mSingleCheckAdapter.setEnableClick(true);
                }
                AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
                alphaAnimation.setDuration(300);
                this.mLevelItemList.startAnimation(alphaAnimation);
            }
        } else if (this.mSingleCheckAdapter != null) {
            this.mSingleCheckAdapter.setEnableClick(false);
        }
    }

    protected void setBeautyLevel(int level) {
        if (!Device.isLegacyFaceBeauty()) {
            boolean isOldFaceBeautyOn = BeautyParameters.getInstance().isFaceBeautyOn();
            ModeProtocol$FrontBeautyProtocol frontBeautyProtocol = (ModeProtocol$FrontBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (frontBeautyProtocol != null) {
                if (!isOldFaceBeautyOn && level > 0) {
                    frontBeautyProtocol.refreshBottomBeauty(false);
                } else if (isOldFaceBeautyOn && level == 0) {
                    frontBeautyProtocol.refreshBottomBeauty(true);
                }
            }
        }
        BeautyParameters.getInstance().setLevel(level);
    }
}
