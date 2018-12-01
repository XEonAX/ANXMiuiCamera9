package com.android.camera.fragment.manually;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ListAdapter;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.manually.adapter.ExtraCustomWBListAdapter;
import com.android.camera.fragment.manually.adapter.ExtraHorizontalListAdapter;
import com.android.camera.fragment.manually.adapter.ExtraRecyclerViewAdapter;
import com.android.camera.fragment.manually.adapter.ExtraSlideFocusAdapter;
import com.android.camera.ui.HorizontalListView;
import com.android.camera.ui.HorizontalSlideView;
import io.reactivex.Completable;
import io.reactivex.functions.Action;
import java.util.List;

public class FragmentManuallyExtra extends BaseFragment {
    private int mCurrentTitle = -1;
    private ComponentData mData;
    private RecyclerView mExtraList;
    private HorizontalListView mExtraListHorizontal;
    private HorizontalSlideView mHorizontalSlideView;
    private ManuallyListener mManuallyListener;
    private boolean mNeedAnimation;
    private View mTargetView;

    public void setComponentData(ComponentData data, int currentMode, boolean needAnimation, ManuallyListener manuallyListener) {
        this.mData = data;
        this.mCurrentMode = currentMode;
        this.mNeedAnimation = needAnimation;
        this.mManuallyListener = manuallyListener;
    }

    protected void initView(View v) {
        this.mExtraList = (RecyclerView) v.findViewById(R.id.manually_extra_list);
        this.mExtraListHorizontal = (HorizontalListView) v.findViewById(R.id.manually_extra_list_horizon);
        this.mHorizontalSlideView = (HorizontalSlideView) v.findViewById(R.id.manually_extra_horizon_slideview);
        if (this.mData != null) {
            adjustViewBackground(v, this.mCurrentMode);
            initAdapter(this.mData);
            this.mCurrentTitle = this.mData.getDisplayTitleString();
        }
    }

    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.mNeedAnimation) {
            this.mNeedAnimation = false;
            Completable.create(new SlideInOnSubscribe(view, 80)).subscribe();
        }
    }

    public void resetData(ComponentData data) {
        this.mData = data;
        initAdapter(this.mData);
        this.mCurrentTitle = this.mData.getDisplayTitleString();
    }

    public int getCurrentTitle() {
        return this.mCurrentTitle;
    }

    public void updateData() {
        initAdapter(this.mData);
    }

    public void animateOut() {
        Completable.create(new SlideOutOnSubscribe(getView(), 80)).subscribe(new Action() {
            public void run() throws Exception {
                FragmentUtils.removeFragmentByTag(FragmentManuallyExtra.this.getFragmentManager(), FragmentManuallyExtra.this.getFragmentTag());
            }
        });
    }

    private void initAdapter(ComponentData data) {
        switch (data.getDisplayTitleString()) {
            case R.string.pref_camera_whitebalance_title /*2131689563*/:
                initWBRecyclerView(data);
                return;
            case R.string.pref_camera_iso_title /*2131689629*/:
            case R.string.pref_manual_exposure_title /*2131689738*/:
                initHorizontalListView(data);
                return;
            case R.string.pref_qc_focus_position_title /*2131689786*/:
                initSlideFocusView(data);
                return;
            default:
                return;
        }
    }

    private void initWBRecyclerView(ComponentData data) {
        if (this.mTargetView != null) {
            this.mTargetView.setVisibility(8);
        }
        this.mTargetView = this.mExtraList;
        int itemWidth = (int) (((float) getResources().getDisplayMetrics().widthPixels) / 5.5f);
        if (data.getItems().size() * itemWidth < getResources().getDisplayMetrics().widthPixels) {
            itemWidth = getResources().getDisplayMetrics().widthPixels / data.getItems().size();
        }
        ExtraRecyclerViewAdapter adapter = new ExtraRecyclerViewAdapter(data, this.mCurrentMode, this.mManuallyListener, itemWidth) {
            protected boolean couldNewValueTakeEffect(String newValue) {
                if (newValue == null || !newValue.equals("manual")) {
                    return super.couldNewValueTakeEffect(newValue);
                }
                return true;
            }
        };
        LinearLayoutManager layoutManager = new LinearLayoutManager(getContext());
        layoutManager.setOrientation(0);
        this.mExtraList.setLayoutManager(layoutManager);
        this.mExtraList.setAdapter(adapter);
        this.mExtraList.scrollToPosition(adapter.getValuePosition());
        this.mExtraList.setVisibility(0);
    }

    private void initHorizontalListView(ComponentData data) {
        if (this.mTargetView != null) {
            this.mTargetView.setVisibility(8);
        }
        this.mTargetView = this.mExtraListHorizontal;
        ListAdapter adapter = new ExtraHorizontalListAdapter(data, this.mCurrentMode, this.mManuallyListener);
        this.mExtraListHorizontal.setAdapter(adapter);
        this.mExtraListHorizontal.setOnItemClickListener(adapter);
        this.mExtraListHorizontal.setOnItemSingleTapDownListener(adapter);
        this.mExtraListHorizontal.setSelection(adapter.getValuePosition());
        this.mExtraListHorizontal.setVisibility(0);
    }

    private void initSlideFocusView(ComponentData data) {
        if (this.mTargetView != null) {
            this.mTargetView.setVisibility(8);
        }
        this.mTargetView = this.mHorizontalSlideView;
        ExtraSlideFocusAdapter slideViewAdapter = new ExtraSlideFocusAdapter(getContext(), data, this.mCurrentMode, this.mManuallyListener);
        this.mHorizontalSlideView.setOnItemSelectListener(slideViewAdapter);
        this.mHorizontalSlideView.setDrawAdapter(slideViewAdapter);
        this.mHorizontalSlideView.setSelection(slideViewAdapter.mapFocusToIndex(Integer.valueOf(data.getComponentValue(this.mCurrentMode)).intValue()));
        this.mHorizontalSlideView.setVisibility(0);
    }

    public void showCustomWB(ComponentManuallyWB componentManuallyWB) {
        this.mTargetView = this.mExtraListHorizontal;
        ListAdapter adapter = new ExtraCustomWBListAdapter(componentManuallyWB, this.mManuallyListener);
        this.mExtraListHorizontal.setAdapter(adapter);
        this.mExtraListHorizontal.setOnItemClickListener(adapter);
        this.mExtraListHorizontal.setOnItemSingleTapDownListener(adapter);
        this.mExtraListHorizontal.setSelection(adapter.getValuePosition());
        this.mExtraListHorizontal.setVisibility(0);
        this.mExtraList.setVisibility(8);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_manually_extra;
    }

    public int getFragmentInto() {
        return 254;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        adjustViewBackground(getView(), this.mCurrentMode);
    }

    private void adjustViewBackground(View view, int currentMode) {
        switch (DataRepository.dataItemRunning().getUiStyle()) {
            case 0:
                view.setBackgroundResource(R.color.halfscreen_background);
                return;
            case 1:
            case 3:
                view.setBackgroundResource(R.color.fullscreen_background);
                return;
            default:
                return;
        }
    }
}
