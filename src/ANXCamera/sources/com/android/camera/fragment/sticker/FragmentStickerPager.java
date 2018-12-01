package com.android.camera.fragment.sticker;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.sticker.BaseSelectAdapter.BaseSelectHolder;
import com.android.camera.fragment.sticker.BaseSelectAdapter.ItemSelectChangeListener;
import com.android.camera.fragment.sticker.StickerAdapter.StickerHolder;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.network.resource.DownloadHelper;
import com.android.camera.network.resource.OnDownloadListener;
import com.android.camera.network.resource.Resource;
import com.android.camera.network.resource.ResourceDownloadManager;
import com.android.camera.network.resource.StickerResourceRequest;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$FilterProtocol;
import com.android.camera.protocol.ModeProtocol$StickerProtocol;
import com.android.camera.sticker.StickerHelper;
import com.android.camera.sticker.StickerInfo;
import java.util.List;

public class FragmentStickerPager extends Fragment {
    private StickerAdapter mAdapter;
    private DownloadHelper mDefaultDownloadHelper = new DownloadHelper() {
        public String getDownloadPath(Resource resource) {
            return StickerHelper.getInstance().getStickerPath(resource.id);
        }
    };
    private OnDownloadListener mDownloadListener = new OnDownloadListener() {
        public void onFinish(long id, int state) {
            Log.i("FragmentStickerPager", id + ":" + state);
            for (int i = 0; i < FragmentStickerPager.this.mList.size(); i++) {
                if (((StickerInfo) FragmentStickerPager.this.mList.get(i)).id == id) {
                    ((StickerInfo) FragmentStickerPager.this.mList.get(i)).downloadState = state;
                    Message.obtain(FragmentStickerPager.this.mHandler, 1, i, 0).sendToTarget();
                }
            }
        }
    };
    private Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    FragmentStickerPager.this.mAdapter.notifyItemChanged(msg.arg1);
                    Log.i("FragmentStickerPager", "MSG_NOTIFY_ITEM");
                    break;
                case 2:
                    FragmentStickerPager.this.mAdapter.notifyDataSetChanged();
                    break;
            }
            super.handleMessage(msg);
        }
    };
    private List<StickerInfo> mList;
    private RecyclerView mRecyclerView;

    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View v = inflater.inflate(R.layout.fragment_sticker_pager, container, false);
        initView(v);
        return v;
    }

    private void persistSticker(String sticker) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString("pref_sticker_path_key", sticker);
        editor.apply();
    }

    private void initView(View view) {
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.sticker_item_list);
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext(), 0, false));
        this.mAdapter = new StickerAdapter(getContext());
        this.mRecyclerView.setAdapter(this.mAdapter);
        this.mAdapter.setItemSelectChangeListener(new ItemSelectChangeListener() {
            public boolean onItemSelect(BaseSelectHolder holder, int position, boolean isChanged) {
                StickerInfo data = (StickerInfo) FragmentStickerPager.this.mAdapter.getItemData(position);
                int state = data.getDownloadState();
                if (state == 1 || state == 3) {
                    boolean z;
                    String srcPath = data.getSrcPath();
                    FragmentStickerPager.this.persistSticker(srcPath);
                    EffectController.getInstance().setCurrentSticker(srcPath);
                    EffectController instance = EffectController.getInstance();
                    if (position == 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    instance.enableMakeup(z);
                    ModeProtocol$StickerProtocol p = (ModeProtocol$StickerProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(178);
                    if (p != null) {
                        p.onStickerChanged(srcPath);
                    }
                    int filterId = data.getFilterId();
                    if (filterId != FilterInfo.FILTER_ID_NONE) {
                        ModeProtocol$FilterProtocol filterProtocol = (ModeProtocol$FilterProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(165);
                        if (filterProtocol != null) {
                            filterProtocol.onFilterChanged(1, filterId);
                        }
                    }
                    return true;
                }
                if ((state == 0 || state == 4) && CtaNoticeFragment.checkCta(FragmentStickerPager.this.getActivity().getFragmentManager())) {
                    ((StickerHolder) holder).mDownloadView.startDownload();
                    data.downloadState = 2;
                    ResourceDownloadManager.getInstance().download((Resource) FragmentStickerPager.this.mList.get(position), FragmentStickerPager.this.mDefaultDownloadHelper);
                }
                return false;
            }
        });
        ResourceDownloadManager.getInstance().addDownloadListener(this.mDownloadListener);
        loadData();
    }

    private void setSelectItem() {
        String currentSticker = EffectController.getInstance().getCurrentSticker();
        for (int i = 0; i < this.mList.size(); i++) {
            if (TextUtils.equals(currentSticker, ((StickerInfo) this.mList.get(i)).getSrcPath())) {
                this.mAdapter.initSelectItem(i);
                return;
            }
        }
    }

    public void onDestroy() {
        super.onDestroy();
        ResourceDownloadManager.getInstance().removeDownloadListener(this.mDownloadListener);
    }

    private void loadData() {
        new StickerResourceRequest().execute(new ResponseListener() {
            public void onResponse(Object... response) {
                List<StickerInfo> list = response[0];
                FragmentStickerPager.this.refreshDownloadState(list);
                FragmentStickerPager.this.refreshData(list);
                String str = "FragmentStickerPager";
                String str2 = "getStickerList %d ";
                Object[] objArr = new Object[1];
                objArr[0] = Integer.valueOf(list == null ? -1 : list.size());
                Log.d(str, String.format(str2, objArr));
            }

            public void onResponseError(ErrorCode errorCode, String errorMessage, Object responseData) {
                FragmentStickerPager.this.refreshData(null);
                Log.e("FragmentStickerPager", String.format("errorCode %d msg:%s", new Object[]{Integer.valueOf(errorCode.CODE), errorMessage}));
            }
        });
    }

    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser && this.mRecyclerView != null) {
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration(300);
            this.mRecyclerView.startAnimation(alphaAnimation);
        }
    }

    private void refreshDownloadState(List<StickerInfo> list) {
        for (StickerInfo data : list) {
            data.downloadState = ResourceDownloadManager.getInstance().getDownloadState(data.id);
        }
    }

    private void refreshData(List<StickerInfo> list) {
        this.mList = StickerHelper.getInstance().getLocalStick();
        if (list != null) {
            this.mList.addAll(list);
        }
        this.mAdapter.setList(this.mList);
        setSelectItem();
        this.mHandler.sendEmptyMessage(2);
    }
}
