package com.android.camera.fragment.beauty;

import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ItemDecoration;
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
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.effect.BeautyParameters.Type;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$MakeupProtocol;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.util.ArrayList;
import java.util.List;

public class MakeupParamsFragment extends Fragment {
    /* renamed from: -com-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static final /* synthetic */ int[] f6-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = null;
    protected OnItemClickListener mClickListener;
    private int mItemWidth;
    int mLastSelectedParam = -1;
    private MyLayoutManager mLayoutManager;
    private MakeupSingleCheckAdapter mMakeupAdapter;
    private RecyclerView mMakeupItemList;
    int mSelectedParam = 0;
    private int mTotalWidth;

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

    /* renamed from: -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues */
    private static /* synthetic */ int[] m6xed999735() {
        if (f6-com-android-camera-effect-BeautyParameters$TypeSwitchesValues != null) {
            return f6-com-android-camera-effect-BeautyParameters$TypeSwitchesValues;
        }
        int[] iArr = new int[Type.values().length];
        try {
            iArr[Type.CHIN_RATIO.ordinal()] = 5;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr[Type.ENLARGE_EYE_RATIO.ordinal()] = 1;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr[Type.LIPS_RATIO.ordinal()] = 6;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr[Type.NECK_RATIO.ordinal()] = 7;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr[Type.NOSE_RATIO.ordinal()] = 8;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr[Type.RISORIUS_RATIO.ordinal()] = 9;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr[Type.SHRINK_FACE_RATIO.ordinal()] = 2;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr[Type.SLIM_NOSE_RATIO.ordinal()] = 10;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr[Type.SMILE_RATIO.ordinal()] = 11;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr[Type.SMOOTH_STRENGTH.ordinal()] = 3;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr[Type.WHITEN_STRENGTH.ordinal()] = 4;
        } catch (NoSuchFieldError e11) {
        }
        f6-com-android-camera-effect-BeautyParameters$TypeSwitchesValues = iArr;
        return iArr;
    }

    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_beauty_makeup, container, false);
        initView(v);
        return v;
    }

    private void initView(View view) {
        int margin;
        this.mMakeupItemList = (RecyclerView) view.findViewById(R.id.makeup_item_list);
        this.mLayoutManager = new MyLayoutManager(getActivity());
        this.mLayoutManager.setOrientation(0);
        this.mMakeupItemList.setLayoutManager(this.mLayoutManager);
        this.mMakeupItemList.setFocusable(false);
        List<MakeupItem> items = initItems();
        int itemMargin = provideItemHorizontalMargin();
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mMakeupItemList.getLayoutParams();
        this.mItemWidth = getResources().getDimensionPixelSize(R.dimen.beautycamera_makeup_item_width) + (itemMargin * 2);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        int marginStart = (this.mTotalWidth - (this.mItemWidth * items.size())) / 2;
        final boolean isRTL = Util.isLayoutRTL(getContext());
        if (marginStart > 0) {
            margin = marginStart;
        } else {
            margin = getResources().getDimensionPixelSize(R.dimen.beautycamera_makeup_item_min_margin_horizontal);
        }
        this.mMakeupAdapter = new MakeupSingleCheckAdapter(getActivity(), items, itemMargin);
        this.mClickListener = initOnItemClickListener();
        this.mMakeupAdapter.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                MakeupParamsFragment.this.mLastSelectedParam = MakeupParamsFragment.this.mSelectedParam;
                MakeupParamsFragment.this.mClickListener.onItemClick(parent, view, position, id);
                if (MakeupParamsFragment.this.scrollIfNeed(MakeupParamsFragment.this.mSelectedParam)) {
                    MakeupParamsFragment.this.notifyItemChanged(MakeupParamsFragment.this.mLastSelectedParam, MakeupParamsFragment.this.mSelectedParam);
                }
            }
        });
        this.mSelectedParam = beautyTypetoPosition(BeautyParameters.getInstance().getCurrentType());
        this.mMakeupAdapter.setSelectedPosition(this.mSelectedParam);
        this.mMakeupItemList.setAdapter(this.mMakeupAdapter);
        ItemAnimator animator = new DefaultItemAnimator();
        animator.setChangeDuration(150);
        animator.setMoveDuration(150);
        animator.setAddDuration(150);
        this.mMakeupItemList.setItemAnimator(animator);
        this.mMakeupItemList.addItemDecoration(new ItemDecoration() {
            public void getItemOffsets(Rect outRect, View view, RecyclerView parent, State state) {
                int position = parent.getChildAdapterPosition(view);
                if (isRTL) {
                    if (position == 0) {
                        outRect.set(0, 0, margin, 0);
                    } else if (position == parent.getLayoutManager().getItemCount()) {
                        outRect.set(margin, 0, 0, 0);
                    }
                } else if (position == 0) {
                    outRect.set(margin, 0, 0, 0);
                } else if (position == parent.getLayoutManager().getItemCount()) {
                    outRect.set(0, 0, margin, 0);
                }
            }
        });
        this.mMakeupAdapter.notifyDataSetChanged();
        setItemInCenter(this.mSelectedParam);
    }

    protected List<MakeupItem> initItems() {
        List<MakeupItem> items = new ArrayList();
        items.add(new MakeupItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender));
        items.add(new MakeupItem(R.drawable.icon_eye_large_n, R.string.edit_eye_large));
        items.add(new MakeupItem(R.drawable.icon_skin_white_n, R.string.edit_skin_white));
        items.add(new MakeupItem(R.drawable.icon_smooth_n, R.string.edit_skin_smooth));
        return items;
    }

    protected int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.beautycamera_makeup_radiogroup_item_margin_horizontal);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
                BeautyParameterType type;
                MakeupParamsFragment.this.mSelectedParam = position;
                switch (position) {
                    case 0:
                        type = BeautyParameterType.SHRINK_FACE_RATIO;
                        break;
                    case 1:
                        type = BeautyParameterType.ENLARGE_EYE_RATIO;
                        break;
                    case 2:
                        type = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                    case 3:
                        type = BeautyParameterType.SMOOTH_STRENGTH;
                        break;
                    default:
                        type = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                }
                BeautyParameters.getInstance().setType(type);
                ((ModeProtocol$MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180)).onMakeupItemSelected();
            }
        };
    }

    protected int beautyTypetoPosition(Type type) {
        switch (m6xed999735()[type.ordinal()]) {
            case 1:
                return 1;
            case 2:
                return 0;
            case 3:
                return 3;
            case 4:
                return 2;
            default:
                return 0;
        }
    }

    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser && this.mMakeupItemList != null) {
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration(300);
            this.mMakeupItemList.startAnimation(alphaAnimation);
        }
    }

    private void setItemInCenter(int position) {
        this.mLayoutManager.scrollToPositionWithOffset(position, (this.mTotalWidth / 2) - (this.mItemWidth / 2));
    }

    private void notifyItemChanged(int oldIndex, int newIndex) {
        if (oldIndex > -1) {
            this.mMakeupAdapter.notifyItemChanged(oldIndex);
        }
        if (newIndex > -1) {
            this.mMakeupAdapter.notifyItemChanged(newIndex);
        }
    }

    private boolean scrollIfNeed(int selected) {
        int destination = selected;
        if (selected == this.mLayoutManager.findFirstVisibleItemPosition() || selected == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            destination = Math.max(0, selected - 1);
        } else if (selected == this.mLayoutManager.findLastVisibleItemPosition() || selected == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            destination = Math.min(selected + 1, this.mLayoutManager.getItemCount() - 1);
        }
        if (destination == selected) {
            return false;
        }
        this.mLayoutManager.scrollToPosition(destination);
        return true;
    }
}
