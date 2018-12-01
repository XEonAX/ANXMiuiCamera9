package com.android.camera.fragment.top;

import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$ConfigChanges;
import com.android.camera.protocol.ModeProtocol$TopAlert;
import com.android.camera.protocol.ModeProtocol$TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class FragmentTopConfigExtra extends BaseFragment implements OnClickListener {
    private ExtraAdapter mExtraAdapter;
    private RecyclerView mRecyclerView;

    protected void initView(View v) {
        this.mRecyclerView = (RecyclerView) v.findViewById(R.id.top_config_extra_recyclerview);
        int cameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        SupportedConfigs supportedConfigs = SupportedConfigFactory.getSupportedExtraConfigs(this.mCurrentMode, cameraId, DataRepository.dataCloudMgr().DataCloudFeature(), Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(cameraId, this.mCurrentMode));
        int count = supportedConfigs.getLength() > 4 ? 4 : supportedConfigs.getLength();
        ((MarginLayoutParams) this.mRecyclerView.getLayoutParams()).height = getResources().getDimensionPixelSize(R.dimen.config_item_height) * ((int) Math.ceil((double) (((float) supportedConfigs.getLength()) / ((float) count))));
        this.mRecyclerView.setLayoutManager(new GridLayoutManager(getContext(), count));
        this.mExtraAdapter = new ExtraAdapter(supportedConfigs, this);
        this.mExtraAdapter.setNewDegree(this.mDegree);
        this.mRecyclerView.setAdapter(this.mExtraAdapter);
        this.mRecyclerView.setFocusable(false);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_top_config_extra;
    }

    public int getFragmentInto() {
        return 245;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$ConfigChanges configChanges = (ModeProtocol$ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                int tag = ((Integer) v.getTag()).intValue();
                configChanges.onConfigChanged(tag);
                ModeProtocol$TopAlert topAlert = (ModeProtocol$TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (Util.isAccessible()) {
                    this.mExtraAdapter.setOnClictTag(tag);
                }
                switch (tag) {
                    case 225:
                        topAlert.removeExtraMenu(5);
                        break;
                    case 242:
                        topAlert.hideExtraMenu();
                        ((ModeProtocol$TopConfigProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(193)).startAiLens();
                        CameraStat.recordCountEvent("counter", "ai_detect_changed");
                        break;
                    default:
                        this.mRecyclerView.getAdapter().notifyDataSetChanged();
                        break;
                }
            }
        }
    }

    public void reFresh() {
        this.mRecyclerView.getAdapter().notifyDataSetChanged();
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        AnimationSet animationSet = new AnimationSet(true);
        AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
        TranslateAnimation translateAnimation = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, -0.1f, 1, 0.0f);
        animationSet.addAnimation(alphaAnimation);
        animationSet.addAnimation(translateAnimation);
        animationSet.setInterpolator(new CubicEaseOutInterpolator());
        animationSet.setDuration(350);
        return animationSet;
    }

    protected Animation provideExitAnimation() {
        return null;
    }

    public void animateOut() {
        AnimationSet animationSet = new AnimationSet(true);
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        TranslateAnimation translateAnimation = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, 0.0f, 1, -0.07f);
        animationSet.addAnimation(alphaAnimation);
        animationSet.addAnimation(translateAnimation);
        animationSet.setInterpolator(new CubicEaseOutInterpolator());
        animationSet.setDuration(200);
        animationSet.setAnimationListener(new AnimationListener() {
            public void onAnimationStart(Animation animation) {
                FragmentTopConfigExtra.this.setClickEnable(false);
            }

            public void onAnimationEnd(Animation animation) {
                FragmentUtils.removeFragmentByTag(FragmentTopConfigExtra.this.getFragmentManager(), FragmentTopConfigExtra.this.getFragmentTag());
            }

            public void onAnimationRepeat(Animation animation) {
            }
        });
        getView().startAnimation(animationSet);
    }

    public void provideRotateItem(List<View> pendingRotateItems, int degree) {
        super.provideRotateItem(pendingRotateItems, degree);
        this.mExtraAdapter.setNewDegree(degree);
        for (int i = 0; i < this.mRecyclerView.getChildCount(); i++) {
            pendingRotateItems.add(this.mRecyclerView.getChildAt(i));
        }
    }
}
