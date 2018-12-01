package com.android.camera.fragment;

import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.util.SparseArray;
import android.util.SparseIntArray;
import com.android.camera.Camera;
import com.android.camera.Device;
import com.android.camera.animation.AnimationComposite;
import com.android.camera.fragment.beauty.FragmentPopupBeauty;
import com.android.camera.fragment.beauty.FragmentPopupBeautyLevel;
import com.android.camera.fragment.beauty.FragmentPopupMakeup;
import com.android.camera.fragment.dual.FragmentDualCameraAdjust;
import com.android.camera.fragment.dual.FragmentDualStereo;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.fragment.manually.FragmentManually;
import com.android.camera.fragment.sticker.FragmentSticker;
import com.android.camera.fragment.top.FragmentTopConfig;
import com.android.camera.module.loader.StartControl;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import io.reactivex.Completable;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public class BaseFragmentDelegate implements ModeProtocol$BaseDelegate {
    private static final String TAG = BaseFragmentDelegate.class.getSimpleName();
    private AnimationComposite animationComposite = new AnimationComposite();
    private SparseArray<List<Integer>> currentFragments;
    private Camera mActivity;
    private SparseIntArray originalFragments = new SparseIntArray();

    @Retention(RetentionPolicy.SOURCE)
    public @interface FragmentInto {
    }

    public BaseFragmentDelegate(Camera activity) {
        this.mActivity = activity;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(160, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(160, this);
        this.animationComposite.destroy();
        this.mActivity = null;
    }

    public void init(FragmentManager supportFragmentManager, int initMode, BaseLifecycleListener baseLifecycleListener) {
        registerProtocol();
        BaseFragment fragmentTopConfig = constructFragment(true, 244, 240, baseLifecycleListener);
        BaseFragment fragmentManually = constructFragment(true, 247, 240, baseLifecycleListener);
        BaseFragment fragmentBottomPopupTips = constructFragment(true, 4081, 240, baseLifecycleListener);
        BaseFragment fragmentBottomAction = constructFragment(true, 241, 240, baseLifecycleListener);
        BaseFragment fragmentMainContent = constructFragment(true, 243, 240, baseLifecycleListener);
        BaseFragment fragmentPanorama = constructFragment(true, 4080, 240, baseLifecycleListener);
        BaseFragment fragmentScreenLight = constructFragment(true, 4086, 240, baseLifecycleListener);
        FragmentTransaction fragmentTransaction = supportFragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.bottom_popup_tips, fragmentBottomPopupTips, fragmentBottomPopupTips.getFragmentTag());
        fragmentTransaction.replace(R.id.bottom_action, fragmentBottomAction, fragmentBottomAction.getFragmentTag());
        fragmentTransaction.replace(R.id.main_top, fragmentTopConfig, fragmentTopConfig.getFragmentTag());
        fragmentTransaction.replace(R.id.bottom_popup_manually, fragmentManually, fragmentManually.getFragmentTag());
        fragmentTransaction.replace(R.id.main_content, fragmentMainContent, fragmentMainContent.getFragmentTag());
        fragmentTransaction.replace(R.id.panorama_content, fragmentPanorama, fragmentPanorama.getFragmentTag());
        fragmentTransaction.replace(R.id.screen_light_content, fragmentScreenLight, fragmentScreenLight.getFragmentTag());
        fragmentTransaction.hide(fragmentScreenLight);
        Fragment dualFragment = null;
        if (Device.isSupportedOpticalZoom()) {
            dualFragment = constructFragment(true, 4084, 240, baseLifecycleListener);
        } else if (Device.isSupportedStereo()) {
            dualFragment = constructFragment(true, 4085, 240, baseLifecycleListener);
        }
        if (dualFragment != null) {
            this.originalFragments.put(R.id.bottom_popup_dual_camera_adjust, dualFragment.getFragmentInto());
            this.animationComposite.put(dualFragment.getFragmentInto(), dualFragment);
            fragmentTransaction.replace(R.id.bottom_popup_dual_camera_adjust, dualFragment, dualFragment.getFragmentTag());
        } else {
            this.originalFragments.put(R.id.bottom_popup_dual_camera_adjust, 240);
        }
        this.originalFragments.put(R.id.bottom_popup_tips, fragmentBottomPopupTips.getFragmentInto());
        this.originalFragments.put(R.id.bottom_action, fragmentBottomAction.getFragmentInto());
        this.originalFragments.put(R.id.main_top, fragmentTopConfig.getFragmentInto());
        this.originalFragments.put(R.id.bottom_popup_beauty, 240);
        this.originalFragments.put(R.id.bottom_popup_manually, fragmentManually.getFragmentInto());
        this.originalFragments.put(R.id.main_content, fragmentMainContent.getFragmentInto());
        this.originalFragments.put(R.id.panorama_content, fragmentPanorama.getFragmentInto());
        this.originalFragments.put(R.id.screen_light_content, 240);
        this.animationComposite.put(fragmentBottomPopupTips.getFragmentInto(), fragmentBottomPopupTips);
        this.animationComposite.put(fragmentTopConfig.getFragmentInto(), fragmentTopConfig);
        this.animationComposite.put(fragmentManually.getFragmentInto(), fragmentManually);
        this.animationComposite.put(fragmentMainContent.getFragmentInto(), fragmentMainContent);
        this.animationComposite.put(fragmentBottomAction.getFragmentInto(), fragmentBottomAction);
        this.animationComposite.put(fragmentPanorama.getFragmentInto(), fragmentPanorama);
        this.animationComposite.put(fragmentScreenLight.getFragmentInto(), fragmentScreenLight);
        initCurrentFragments(this.originalFragments);
        fragmentTransaction.commitAllowingStateLoss();
        baseLifecycleListener.onLifeAlive();
    }

    private void initCurrentFragments(SparseIntArray originalFragments) {
        int size = originalFragments.size();
        this.currentFragments = new SparseArray(size);
        for (int i = 0; i < size; i++) {
            List<Integer> list = new ArrayList();
            list.add(Integer.valueOf(originalFragments.valueAt(i)));
            this.currentFragments.put(originalFragments.keyAt(i), list);
        }
    }

    public Disposable delegateMode(@Nullable Completable prefixCompletable, StartControl startControl, final BaseLifecycleListener lifecycleListener) {
        if (this.mActivity == null) {
            return null;
        }
        Action action = null;
        if (lifecycleListener != null) {
            action = new Action() {
                public void run() throws Exception {
                    lifecycleListener.onLifeAlive();
                }
            };
        }
        return this.animationComposite.dispose(prefixCompletable, action, startControl);
    }

    private void applyUpdateSet(List<BaseFragmentOperation> replaceInfoList, BaseLifecycleListener baseLifecycleListener) {
        if (replaceInfoList == null || replaceInfoList.isEmpty()) {
            throw new RuntimeException("need operation info");
        } else if (this.mActivity == null || !this.mActivity.isFinishing()) {
            FragmentManager fragmentManager = this.mActivity.getSupportFragmentManager();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            for (BaseFragmentOperation replaceInfo : replaceInfoList) {
                int lastFragmentInfo = getActiveFragment(replaceInfo.containerViewId);
                int pendingFragmentInfo = replaceInfo.pendingFragmentInfo;
                BaseFragment newFragment;
                BaseFragment removeFragment;
                BaseFragment lastFragment;
                switch (replaceInfo.operateType) {
                    case 1:
                        lastFragmentInfo = getActiveFragment(replaceInfo.containerViewId);
                        this.animationComposite.remove(lastFragmentInfo);
                        newFragment = constructFragment(false, pendingFragmentInfo, lastFragmentInfo, baseLifecycleListener);
                        fragmentTransaction.replace(replaceInfo.containerViewId, newFragment, newFragment.getFragmentTag());
                        this.animationComposite.put(newFragment.getFragmentInto(), newFragment);
                        updateCurrentFragments(replaceInfo.containerViewId, pendingFragmentInfo, replaceInfo.operateType);
                        break;
                    case 2:
                        this.animationComposite.remove(pendingFragmentInfo);
                        removeFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(pendingFragmentInfo));
                        if (removeFragment != null) {
                            removeFragment.pendingGone(false);
                            fragmentTransaction.remove(removeFragment);
                        }
                        updateCurrentFragments(replaceInfo.containerViewId, pendingFragmentInfo, replaceInfo.operateType);
                        break;
                    case 3:
                        this.animationComposite.remove(lastFragmentInfo);
                        lastFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(lastFragmentInfo));
                        if (lastFragment != null) {
                            lastFragment.pendingGone(false);
                            fragmentTransaction.remove(lastFragment);
                        }
                        updateCurrentFragments(replaceInfo.containerViewId, lastFragmentInfo, replaceInfo.operateType);
                        break;
                    case 4:
                        lastFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(lastFragmentInfo));
                        if (lastFragment != null) {
                            lastFragment.pendingGone(false);
                            fragmentTransaction.hide(lastFragment);
                        }
                        newFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(pendingFragmentInfo));
                        if (newFragment != null) {
                            newFragment.pendingShow();
                            fragmentTransaction.show(newFragment);
                        } else {
                            newFragment = constructFragment(false, pendingFragmentInfo, lastFragmentInfo, baseLifecycleListener);
                            fragmentTransaction.add(replaceInfo.containerViewId, newFragment, newFragment.getFragmentTag());
                        }
                        this.animationComposite.put(newFragment.getFragmentInto(), newFragment);
                        updateCurrentFragments(replaceInfo.containerViewId, pendingFragmentInfo, replaceInfo.operateType);
                        break;
                    case 5:
                        List<Integer> fragments = (List) this.currentFragments.get(replaceInfo.containerViewId);
                        for (int i = 0; i < fragments.size(); i++) {
                            int fragmentInfo = ((Integer) fragments.get(i)).intValue();
                            if (fragmentInfo != pendingFragmentInfo) {
                                this.animationComposite.remove(fragmentInfo);
                                removeFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(fragmentInfo));
                                if (removeFragment != null) {
                                    if (fragmentInfo != lastFragmentInfo) {
                                        removeFragment.pendingGone(true);
                                    } else {
                                        removeFragment.pendingGone(false);
                                    }
                                    fragmentTransaction.remove(removeFragment);
                                }
                            }
                        }
                        newFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(pendingFragmentInfo));
                        newFragment.setLastFragmentInfo(lastFragmentInfo);
                        newFragment.pendingShow();
                        fragmentTransaction.show(newFragment);
                        updateCurrentFragments(replaceInfo.containerViewId, pendingFragmentInfo, replaceInfo.operateType);
                        break;
                    case 6:
                        if (lastFragmentInfo != pendingFragmentInfo) {
                            lastFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(lastFragmentInfo));
                            if (lastFragment != null) {
                                lastFragment.pendingGone(true);
                                fragmentTransaction.hide(lastFragment);
                            }
                        }
                        newFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(pendingFragmentInfo));
                        newFragment.setLastFragmentInfo(lastFragmentInfo);
                        newFragment.pendingShow();
                        fragmentTransaction.show(newFragment);
                        updateCurrentFragments(replaceInfo.containerViewId, pendingFragmentInfo, replaceInfo.operateType);
                        break;
                    case 7:
                        lastFragment = (BaseFragment) fragmentManager.findFragmentByTag(String.valueOf(lastFragmentInfo));
                        if (lastFragment != null) {
                            fragmentTransaction.hide(lastFragment);
                        }
                        updateCurrentFragments(replaceInfo.containerViewId, lastFragmentInfo, replaceInfo.operateType);
                        break;
                    default:
                        break;
                }
            }
            fragmentTransaction.commitAllowingStateLoss();
        }
    }

    private void updateCurrentFragments(@IdRes int containerViewId, int fragmentInfo, int type) {
        List<Integer> list = (List) this.currentFragments.get(containerViewId);
        int i;
        switch (type) {
            case 1:
                list.clear();
                list.add(Integer.valueOf(fragmentInfo));
                return;
            case 2:
                for (i = 0; i < list.size(); i++) {
                    if (((Integer) list.get(i)).intValue() == fragmentInfo) {
                        list.remove(i);
                        return;
                    }
                }
                return;
            case 3:
                for (i = 0; i < list.size(); i++) {
                    if (((Integer) list.get(i)).intValue() == fragmentInfo) {
                        list.remove(i);
                        return;
                    }
                }
                return;
            case 4:
                list.add(Integer.valueOf(fragmentInfo));
                return;
            case 5:
                list.clear();
                list.add(Integer.valueOf(fragmentInfo));
                return;
            case 6:
                for (i = 0; i < list.size(); i++) {
                    if (((Integer) list.get(i)).intValue() == fragmentInfo) {
                        list.remove(i);
                        list.add(Integer.valueOf(fragmentInfo));
                        return;
                    }
                }
                list.add(Integer.valueOf(fragmentInfo));
                return;
            case 7:
                for (i = 0; i < list.size(); i++) {
                    if (((Integer) list.get(i)).intValue() == fragmentInfo) {
                        list.remove(i);
                        return;
                    }
                }
                return;
            default:
                return;
        }
    }

    private BaseFragment constructFragment(boolean isInit, int fragmentId, int lastFragmentInfo, BaseLifecycleListener baseLifecycleListener) {
        BaseFragment baseFragment = null;
        switch (fragmentId) {
            case 240:
                return null;
            case 241:
                baseFragment = new FragmentBottomAction();
                break;
            case 243:
                baseFragment = new FragmentMainContent();
                break;
            case 244:
                baseFragment = new FragmentTopConfig();
                break;
            case 247:
                baseFragment = new FragmentManually();
                break;
            case 249:
                baseFragment = new FragmentPopupBeauty();
                break;
            case Callback.DEFAULT_SWIPE_ANIMATION_DURATION /*250*/:
                baseFragment = new FragmentFilter();
                break;
            case 251:
                baseFragment = new FragmentBeauty();
                break;
            case 252:
                baseFragment = new FragmentPopupMakeup();
                break;
            case 255:
                baseFragment = new FragmentSticker();
                break;
            case 4080:
                baseFragment = new FragmentPanorama();
                break;
            case 4081:
                baseFragment = new FragmentBottomPopupTips();
                break;
            case 4082:
                baseFragment = new FragmentPopupBeautyLevel();
                break;
            case 4083:
                baseFragment = new FragmentBottomIntentDone();
                break;
            case 4084:
                baseFragment = new FragmentDualCameraAdjust();
                break;
            case 4085:
                baseFragment = new FragmentDualStereo();
                break;
            case 4086:
                baseFragment = new FragmentScreenLight();
                break;
        }
        baseFragment.setLastFragmentInfo(lastFragmentInfo);
        baseFragment.setLifecycleListener(baseLifecycleListener);
        baseFragment.registerProtocol();
        baseFragment.setEnableClickInitValue(isInit ^ 1);
        return baseFragment;
    }

    public void delegateEvent(int event) {
        List<BaseFragmentOperation> replaceInfoList = new ArrayList();
        switch (event) {
            case 1:
                if (getActiveFragment(R.id.bottom_action) != Callback.DEFAULT_SWIPE_ANIMATION_DURATION) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).push(Callback.DEFAULT_SWIPE_ANIMATION_DURATION));
                } else {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                }
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                break;
            case 2:
                if (getActiveFragment(R.id.bottom_action) == 251) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    break;
                }
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).push(251));
                break;
            case 3:
                if (getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    break;
                } else {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).replaceWith(252));
                    break;
                }
            case 4:
                if (getActiveFragment(R.id.bottom_action) == 255) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).replaceWith(4081));
                    break;
                }
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).push(255));
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                break;
            case 5:
                if (getActiveFragment(R.id.bottom_popup_beauty) == 4082) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    break;
                } else {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).replaceWith(4082));
                    break;
                }
            case 6:
                if (getActiveFragment(R.id.bottom_action) == 4083) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.main_top).show(getOriginalFragment(R.id.main_top)));
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_manually).show(getOriginalFragment(R.id.bottom_popup_manually)));
                    if (!this.mActivity.getCameraIntentManager().isVideoCaptureIntent()) {
                        replaceInfoList.add(BaseFragmentOperation.create(R.id.main_content).show(getOriginalFragment(R.id.main_content)));
                    }
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).show(getOriginalFragment(R.id.bottom_popup_tips)));
                    if (Device.isSupportedOpticalZoom() || Device.isSupportedStereo()) {
                        replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_dual_camera_adjust).show(getOriginalFragment(R.id.bottom_popup_dual_camera_adjust)));
                        break;
                    }
                }
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).push(4083));
                replaceInfoList.add(BaseFragmentOperation.create(R.id.main_top).hideCurrent());
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_manually).hideCurrent());
                if (!this.mActivity.getCameraIntentManager().isVideoCaptureIntent()) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.main_content).hideCurrent());
                }
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).hideCurrent());
                replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_dual_camera_adjust).hideCurrent());
                break;
            case 7:
                if (getActiveFragment(R.id.bottom_action) != 241) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).replaceWith(4081));
                    break;
                }
                break;
            case 8:
                if (getActiveFragment(R.id.screen_light_content) != 240) {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.screen_light_content).hideCurrent());
                    break;
                } else {
                    replaceInfoList.add(BaseFragmentOperation.create(R.id.screen_light_content).show(4086));
                    break;
                }
        }
        applyUpdateSet(replaceInfoList, null);
    }

    public int getActiveFragment(@IdRes int layoutId) {
        List<Integer> fragments = (List) this.currentFragments.get(layoutId);
        if (fragments.isEmpty()) {
            return 240;
        }
        return ((Integer) fragments.get(fragments.size() - 1)).intValue();
    }

    public int getOriginalFragment(@IdRes int layoutId) {
        return this.originalFragments.get(layoutId, 240);
    }

    public AnimationComposite getAnimationComposite() {
        return this.animationComposite;
    }
}
