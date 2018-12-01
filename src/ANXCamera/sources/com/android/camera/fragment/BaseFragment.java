package com.android.camera.fragment;

import android.os.Bundle;
import android.support.annotation.CallSuper;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import com.android.camera.Util;
import com.android.camera.animation.AnimationDelegate.AnimationResource;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$BaseProtocol;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import io.reactivex.Completable;
import java.util.List;

public abstract class BaseFragment extends Fragment implements AnimationResource, ModeProtocol$BaseProtocol {
    protected int mCurrentMode;
    protected int mDegree;
    private boolean mEnableClick = true;
    private boolean mInModeChanging;
    private boolean mIsFullScreenNavBarHidden;
    private int mLaseFragmentInfo = 240;
    private BaseLifecycleListener mLifecycleListener;
    private boolean mRegistered;
    private boolean mSilentRemove = false;

    public abstract int getFragmentInto();

    @LayoutRes
    protected abstract int getLayoutResourceId();

    protected abstract void initView(View view);

    public void setEnableClickInitValue(boolean enableClick) {
        this.mEnableClick = enableClick;
    }

    public void setLifecycleListener(BaseLifecycleListener lifecycleListener) {
        this.mLifecycleListener = lifecycleListener;
    }

    public void setLastFragmentInfo(int laseFragmentInfo) {
        this.mLaseFragmentInfo = laseFragmentInfo;
    }

    public void pendingShow() {
        setClickEnable(true);
    }

    public void pendingGone(boolean silent) {
        setClickEnable(false);
        this.mSilentRemove = silent;
    }

    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        this.mCurrentMode = ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode();
        this.mIsFullScreenNavBarHidden = Util.sIsFullScreenNavBarHidden;
        View v = inflater.inflate(getLayoutResourceId(), container, false);
        initView(v);
        return v;
    }

    @NonNull
    public final String getFragmentTag() {
        return String.valueOf(getFragmentInto());
    }

    public boolean canProvide() {
        return isAdded();
    }

    public Animation onCreateAnimation(int transit, boolean enter, int nextAnim) {
        if (enter) {
            return provideEnterAnimation(this.mLaseFragmentInfo);
        }
        if (this.mSilentRemove) {
            return null;
        }
        return provideExitAnimation();
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        return null;
    }

    protected Animation provideExitAnimation() {
        return null;
    }

    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mRegistered) {
            this.mRegistered = false;
            unRegisterProtocol();
            if (this.mLifecycleListener != null) {
                this.mLifecycleListener.onLifeDestroy(getFragmentTag());
                this.mLifecycleListener = null;
            }
        }
    }

    public final void registerProtocol() {
        this.mRegistered = true;
        register(ModeCoordinatorImpl.getInstance());
    }

    public final void unRegisterProtocol() {
        unRegister(ModeCoordinatorImpl.getInstance());
    }

    @CallSuper
    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
    }

    @CallSuper
    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
    }

    protected final void registerBackStack(ModeProtocol$ModeCoordinator modeCoordinator, ModeProtocol$HandleBackTrace handleBackTrace) {
        ((ModeProtocol$BackStack) modeCoordinator.getAttachProtocol(171)).addInBackStack(handleBackTrace);
    }

    protected final void unRegisterBackStack(ModeProtocol$ModeCoordinator modeCoordinator, ModeProtocol$HandleBackTrace handleBackTrace) {
        ModeProtocol$BackStack backStack = (ModeProtocol$BackStack) modeCoordinator.getAttachProtocol(171);
        if (backStack != null) {
            backStack.removeBackStack(handleBackTrace);
        }
    }

    public void onStart() {
        super.onStart();
        if (this.mLifecycleListener != null) {
            this.mLifecycleListener.onLifeStart(getFragmentTag());
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mLifecycleListener != null) {
            this.mLifecycleListener.onLifeStop(getFragmentTag());
        }
    }

    public void onResume() {
        super.onResume();
        if (this.mIsFullScreenNavBarHidden != Util.sIsFullScreenNavBarHidden) {
            initView(getView());
        }
        this.mIsFullScreenNavBarHidden = Util.sIsFullScreenNavBarHidden;
    }

    @CallSuper
    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        if (animateInElements != null) {
            this.mInModeChanging = true;
        }
        this.mCurrentMode = newMode;
    }

    public final void setDegree(int newDegree) {
        this.mDegree = newDegree;
    }

    @CallSuper
    public void provideRotateItem(List<View> list, int newDegree) {
        setDegree(newDegree);
    }

    @CallSuper
    public void setClickEnable(boolean enable) {
        this.mEnableClick = enable;
    }

    public boolean isEnableClick() {
        return this.mEnableClick;
    }

    protected boolean isInModeChanging() {
        return this.mInModeChanging;
    }

    @CallSuper
    public void notifyDataChanged(int dataChangeType, int currentMode) {
        this.mInModeChanging = false;
        this.mCurrentMode = currentMode;
    }

    @CallSuper
    public void notifyAfterFrameAvailable(int arrivedType) {
    }
}
