package com.android.camera.fragment;

import android.support.v7.recyclerview.R;
import android.view.View;
import android.view.animation.Animation;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.protocol.ModeProtocol$ScreenLightProtocol;

public class FragmentScreenLight extends BaseFragment implements ModeProtocol$ScreenLightProtocol {
    private View mRootView;

    protected void initView(View v) {
        this.mRootView = v;
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(196, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(196, this);
    }

    public void showScreenLight() {
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.screen_light_content) == 240) {
            baseDelegate.delegateEvent(8);
        }
    }

    public void hideScreenLight() {
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        Log.d("FragmentScreenLight", "hideScreenLight: baseDelegate = " + baseDelegate);
        if (baseDelegate != null) {
            int type = baseDelegate.getActiveFragment(R.id.screen_light_content);
            Log.d("FragmentScreenLight", "hideScreenLight: type = " + type);
            if (type != 240) {
                baseDelegate.delegateEvent(8);
            }
        }
    }

    public void setScreenLightColor(int color) {
        this.mRootView.setBackgroundColor(color);
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        Animation animation = FragmentAnimationFactory.wrapperAnimation(161);
        animation.setDuration(100);
        return animation;
    }

    protected Animation provideExitAnimation() {
        Animation animation = FragmentAnimationFactory.wrapperAnimation(162);
        animation.setDuration(200);
        return animation;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_screen_light;
    }

    public int getFragmentInto() {
        return 4086;
    }
}
