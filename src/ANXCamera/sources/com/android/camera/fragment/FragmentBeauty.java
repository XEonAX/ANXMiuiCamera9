package com.android.camera.fragment;

import android.graphics.drawable.Drawable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.animation.Animation;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.Device;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyLevelFragment;
import com.android.camera.fragment.beauty.LegacyBeautyLevelFragment;
import com.android.camera.fragment.beauty.LegacyMakeupParamsFragment;
import com.android.camera.fragment.beauty.MakeupParamsFragment;
import com.android.camera.fragment.beauty.RemodelingParamsFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$FaceBeautyProtocol;
import com.android.camera.protocol.ModeProtocol$FrontBeautyProtocol;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.ui.NoScrollViewPager;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class FragmentBeauty extends BaseFragment implements ModeProtocol$HandleBackTrace, ModeProtocol$FrontBeautyProtocol, OnClickListener {
    private ImageView mBackButton;
    private TextView mBeautyAdvance;
    private TextView mBeautyLevel;
    private BeautyPagerAdapter mBeautyPagerAdapter;
    private CubicEaseOutInterpolator mCubicEaseOut;
    private Drawable mDotHintDrawable;
    private NoScrollViewPager mViewPager;

    private class BeautyPagerAdapter extends FragmentPagerAdapter {
        private List<Fragment> mFragmentList;

        public BeautyPagerAdapter(FragmentManager fm, List<Fragment> fragmentList) {
            super(fm);
            this.mFragmentList = fragmentList;
        }

        public Fragment getItem(int position) {
            return (Fragment) this.mFragmentList.get(position);
        }

        public int getCount() {
            return this.mFragmentList == null ? 0 : this.mFragmentList.size();
        }
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        modeCoordinator.attachProtocol(194, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        modeCoordinator.detachProtocol(194, this);
    }

    protected void initView(View v) {
        v.getLayoutParams().height = Util.getBottomHeight(getResources());
        this.mCubicEaseOut = new CubicEaseOutInterpolator();
        this.mBackButton = (ImageView) v.findViewById(R.id.effect_back);
        if (Util.sNavigationBarHeight > 0) {
            this.mBackButton.getLayoutParams().height = Util.sNavigationBarHeight;
            this.mBackButton.setVisibility(4);
        } else {
            if (Util.isAccessible()) {
                this.mBackButton.setContentDescription(getContext().getString(R.string.accessibility_beauty_panel_closed));
            }
            this.mBackButton.setOnClickListener(new OnClickListener() {
                public void onClick(View v) {
                    FragmentBeauty.this.onBackEvent(5);
                }
            });
        }
        this.mViewPager = (NoScrollViewPager) v.findViewById(R.id.viewPager);
        List<Fragment> fragmentList = new ArrayList();
        if (Device.isLegacyFaceBeauty()) {
            fragmentList.add(new LegacyBeautyLevelFragment());
            fragmentList.add(new LegacyMakeupParamsFragment());
        } else if (Device.isSupportNewFaceBeauty()) {
            fragmentList.add(new BeautyLevelFragment());
            if (BeautyParameters.getInstance().getAdjustableTypes().length > 0) {
                fragmentList.add(new RemodelingParamsFragment());
            }
        } else {
            fragmentList.add(new BeautyLevelFragment());
            fragmentList.add(new MakeupParamsFragment());
        }
        this.mBeautyPagerAdapter = new BeautyPagerAdapter(getChildFragmentManager(), fragmentList);
        this.mViewPager.setAdapter(this.mBeautyPagerAdapter);
        this.mViewPager.setFocusable(false);
        this.mViewPager.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View v, MotionEvent event) {
                return true;
            }
        });
        this.mViewPager.setOnPageChangeListener(new OnPageChangeListener() {
            private int mPrePosition = 0;

            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
                this.mPrePosition = position;
            }

            public void onPageSelected(int position) {
                int type = 5;
                switch (position) {
                    case 1:
                        type = 3;
                        ModeProtocol$BottomPopupTips bottomPopupTips = (ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                        if (bottomPopupTips != null) {
                            bottomPopupTips.directlyHideTips();
                            break;
                        }
                        break;
                }
                ModeProtocol$FaceBeautyProtocol faceBeautyProtocol = (ModeProtocol$FaceBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(185);
                if (faceBeautyProtocol != null) {
                    faceBeautyProtocol.onFaceBeautySwitched(3 == type);
                }
                ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                if (baseDelegate != null) {
                    baseDelegate.delegateEvent(type);
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        });
        this.mBeautyLevel = (TextView) v.findViewById(R.id.effect_beauty_level);
        this.mBeautyAdvance = (TextView) v.findViewById(R.id.effect_beauty_makeup);
        this.mBeautyAdvance.setOnClickListener(this);
        this.mBeautyLevel.setOnClickListener(this);
        if (Device.isSupportNewFaceBeauty()) {
            this.mBeautyLevel.setText(R.string.beauty_fragment_tab_name_3d_beauty);
            this.mBeautyAdvance.setText(R.string.beauty_fragment_tab_name_3d_remodeling);
        }
        if (Device.isSupport3DFaceBeauty()) {
            this.mDotHintDrawable = getResources().getDrawable(R.drawable.ic_dot_hint);
            if (!CameraSettings.isBeautyRemodelingClicked()) {
                this.mBeautyAdvance.setCompoundDrawablesWithIntrinsicBounds(null, null, this.mDotHintDrawable, null);
            }
        }
        boolean hideAdvance = (Device.isLegacyFaceBeauty() || (BeautyParameters.getInstance().isFaceBeautyOn() ^ 1) == 0) ? BeautyParameters.getInstance().getAdjustableTypes().length == 0 : true;
        if ("pref_camera_face_beauty_key".equals(CameraSettings.getFaceBeautySwitch()) || hideAdvance) {
            this.mViewPager.setCurrentItem(0, false);
            this.mBeautyLevel.setActivated(true);
            if (hideAdvance) {
                hideAdvance();
                return;
            }
            return;
        }
        this.mViewPager.setCurrentItem(1, false);
        this.mBeautyAdvance.setActivated(true);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_beauty;
    }

    public int getFragmentInto() {
        return 251;
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        Animation animation = FragmentAnimationFactory.wrapperAnimation(167, 161);
        animation.setDuration(300);
        animation.setInterpolator(this.mCubicEaseOut);
        return animation;
    }

    protected Animation provideExitAnimation() {
        Animation animation = FragmentAnimationFactory.wrapperAnimation(168, 162);
        animation.setDuration(200);
        animation.setInterpolator(this.mCubicEaseOut);
        return animation;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        if (!onBackEvent(4)) {
        }
    }

    public boolean onBackEvent(int callingFrom) {
        return removeFragmentBeauty();
    }

    public void refreshBottomBeauty(boolean isClose) {
        if (isClose || BeautyParameters.getInstance().getAdjustableTypes().length == 0) {
            this.mBeautyAdvance.setEnabled(false);
            animateExpanding(false);
            return;
        }
        this.mBeautyAdvance.setEnabled(true);
        animateExpanding(isClose ^ 1);
    }

    private void hideAdvance() {
        int distanceAdvance = Util.getChildMeasureWidth(this.mBeautyLevel) / 2;
        ViewCompat.setTranslationX(this.mBeautyLevel, (float) (Util.getChildMeasureWidth(this.mBeautyAdvance) / 2));
        ViewCompat.setTranslationX(this.mBeautyAdvance, (float) (-distanceAdvance));
        ViewCompat.setAlpha(this.mBeautyAdvance, 0.0f);
        this.mBeautyAdvance.setVisibility(4);
    }

    private void animateExpanding(boolean expand) {
        int distanceLevel = this.mBeautyAdvance.getWidth() / 2;
        int distanceAdvance = this.mBeautyLevel.getWidth() / 2;
        if (expand) {
            ViewCompat.animate(this.mBeautyLevel).translationX(0.0f).setDuration(300).start();
            ViewCompat.animate(this.mBeautyAdvance).alpha(1.0f).setDuration(200).start();
            ViewCompat.animate(this.mBeautyAdvance).translationX(0.0f).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                public void onAnimationStart(View view) {
                    FragmentBeauty.this.mBeautyAdvance.setVisibility(0);
                }

                public void onAnimationEnd(View view) {
                }

                public void onAnimationCancel(View view) {
                }
            }).start();
            return;
        }
        ViewCompat.animate(this.mBeautyLevel).translationX((float) distanceLevel).setDuration(300).setInterpolator(this.mCubicEaseOut).start();
        ViewCompat.animate(this.mBeautyAdvance).alpha(0.0f).setDuration(200).start();
        ViewCompat.animate(this.mBeautyAdvance).translationX((float) (-distanceAdvance)).setDuration(300).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
            public void onAnimationStart(View view) {
            }

            public void onAnimationEnd(View view) {
                FragmentBeauty.this.mBeautyAdvance.setVisibility(4);
            }

            public void onAnimationCancel(View view) {
            }
        }).start();
    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.effect_beauty_level /*2131361804*/:
                this.mBeautyLevel.setActivated(true);
                this.mBeautyAdvance.setActivated(false);
                this.mViewPager.setCurrentItem(0, false);
                return;
            case R.id.effect_beauty_makeup /*2131361805*/:
                this.mBeautyLevel.setActivated(false);
                this.mBeautyAdvance.setActivated(true);
                this.mViewPager.setCurrentItem(1, false);
                if (Device.isSupport3DFaceBeauty() && (CameraSettings.isBeautyRemodelingClicked() ^ 1) != 0) {
                    CameraSettings.setBeautyRemodelingClicked();
                    this.mDotHintDrawable.setAlpha(0);
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void onPause() {
        super.onPause();
    }

    private boolean removeFragmentBeauty() {
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_action) != 251) {
            return false;
        }
        baseDelegate.delegateEvent(2);
        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
        return true;
    }
}
