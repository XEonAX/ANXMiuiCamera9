package com.android.camera.fragment.beauty;

import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import com.android.camera.R;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.fragment.BaseFragment;

@Deprecated
public class FragmentPopupBeautyLevel extends BaseFragment {
    protected void initView(View v) {
        ((MarginLayoutParams) v.getLayoutParams()).bottomMargin = (int) (((float) getResources().getDisplayMetrics().heightPixels) - (((float) getResources().getDisplayMetrics().widthPixels) / 0.75f));
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_popup_beautylevel;
    }

    public int getFragmentInto() {
        return 4082;
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        return FragmentAnimationFactory.wrapperAnimation(167, 161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(168, 162);
    }
}
