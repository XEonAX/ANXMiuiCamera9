package com.android.camera.fragment.sticker;

import android.support.annotation.IdRes;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.support.v7.recyclerview.R;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import com.android.camera.protocol.ModeProtocol$BottomPopupTips;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import com.android.camera.ui.NoScrollViewPager;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;

public class FragmentSticker extends BaseFragment implements ModeProtocol$HandleBackTrace {
    private ImageView mBackButton;
    private OnRadioButtonChangedListener mOnRadioButtonChangedListener;
    private RadioGroup mRadioGroup;
    private NoScrollViewPager mViewPager;

    public interface OnRadioButtonChangedListener {
        void onChanged();
    }

    private class StickerPagerAdapter extends FragmentPagerAdapter {
        private List<Fragment> mFragmentList;

        public StickerPagerAdapter(FragmentManager fm, List<Fragment> fragmentList) {
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

    protected void initView(View v) {
        v.getLayoutParams().height = (int) (((float) getResources().getDisplayMetrics().heightPixels) - (((float) getResources().getDisplayMetrics().widthPixels) / 0.75f));
        this.mViewPager = (NoScrollViewPager) v.findViewById(R.id.viewPager);
        List<Fragment> fragmentList = new ArrayList();
        fragmentList.add(new FragmentStickerPager());
        fragmentList.add(new FragmentStickerPager());
        this.mViewPager.setAdapter(new StickerPagerAdapter(getChildFragmentManager(), fragmentList));
        this.mViewPager.setOnPageChangeListener(new OnPageChangeListener() {
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }

            public void onPageSelected(int position) {
                switch (position) {
                    case 0:
                        FragmentSticker.this.mRadioGroup.check(R.id.radio_button_sticker_one);
                        return;
                    case 1:
                        FragmentSticker.this.mRadioGroup.check(R.id.radio_button_sticker_two);
                        return;
                    default:
                        return;
                }
            }

            public void onPageScrollStateChanged(int state) {
            }
        });
        this.mRadioGroup = (RadioGroup) v.findViewById(R.id.radio_group_layout_sticker);
        this.mRadioGroup.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            public void onCheckedChanged(RadioGroup group, @IdRes int checkedId) {
                switch (checkedId) {
                    case R.id.radio_button_sticker_one /*2131361868*/:
                        FragmentSticker.this.mViewPager.setCurrentItem(0, false);
                        break;
                    case R.id.radio_button_sticker_two /*2131361869*/:
                        FragmentSticker.this.mViewPager.setCurrentItem(1, false);
                        break;
                }
                if (FragmentSticker.this.mOnRadioButtonChangedListener != null) {
                    FragmentSticker.this.mOnRadioButtonChangedListener.onChanged();
                }
            }
        });
        this.mRadioGroup.check(R.id.radio_button_sticker_one);
        this.mBackButton = (ImageView) v.findViewById(R.id.effect_back);
        this.mBackButton.setOnClickListener(new OnClickListener() {
            public void onClick(View v) {
                ((ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(4);
                switch (FragmentSticker.this.mCurrentMode) {
                    case 161:
                        ((ModeProtocol$BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
                        return;
                    default:
                        return;
                }
            }
        });
        CtaNoticeFragment.checkCta(getActivity().getFragmentManager());
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_sticker;
    }

    public int getFragmentInto() {
        return 255;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        super.provideAnimateElement(newMode, animateInElements, timeOut);
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        return FragmentAnimationFactory.wrapperAnimation(167, 161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(168, 162);
    }

    public boolean onBackEvent(int callingFrom) {
        ModeProtocol$BaseDelegate baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_action) != 255) {
            return false;
        }
        baseDelegate.delegateEvent(4);
        return true;
    }
}
