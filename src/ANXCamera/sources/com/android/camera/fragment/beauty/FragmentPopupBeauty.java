package com.android.camera.fragment.beauty;

import android.support.v7.recyclerview.R;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BaseDelegate;
import io.reactivex.Completable;
import java.util.List;

@Deprecated
public class FragmentPopupBeauty extends BaseFragment implements OnClickListener {
    private View mIconBeauty;
    private View mIconSticker;

    protected void initView(View v) {
        ((MarginLayoutParams) v.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mIconSticker = v.findViewById(R.id.icon_sticker);
        this.mIconBeauty = v.findViewById(R.id.icon_beauty);
        this.mIconSticker.setOnClickListener(this);
        this.mIconBeauty.setOnClickListener(this);
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_popup_beauty;
    }

    public int getFragmentInto() {
        return 249;
    }

    public void provideAnimateElement(int newMode, List<Completable> animateInElements, boolean timeOut) {
        int newState;
        super.provideAnimateElement(newMode, animateInElements, timeOut);
        switch (newMode) {
            case 163:
            case 165:
                newState = 1;
                break;
            default:
                newState = -1;
                break;
        }
        if (this.mIconSticker.getTag() == null || ((Integer) this.mIconSticker.getTag()).intValue() != newState) {
            this.mIconSticker.setTag(Integer.valueOf(newState));
            if (animateInElements == null) {
                if (newState == 1) {
                    AlphaInOnSubscribe.directSetResult(this.mIconSticker);
                    AlphaInOnSubscribe.directSetResult(this.mIconBeauty);
                } else {
                    AlphaOutOnSubscribe.directSetResult(this.mIconSticker);
                    AlphaOutOnSubscribe.directSetResult(this.mIconBeauty);
                }
            } else if (newState == 1) {
                animateInElements.add(Completable.create(new SlideInOnSubscribe(this.mIconSticker, 3)));
                animateInElements.add(Completable.create(new SlideInOnSubscribe(this.mIconBeauty, 5)));
            } else {
                animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mIconSticker, 3)));
                animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mIconBeauty, 5)));
            }
        }
    }

    public void onClick(View v) {
        if (isEnableClick()) {
            ModeProtocol$BaseDelegate baseDelegate;
            switch (v.getId()) {
                case R.id.icon_sticker /*2131361863*/:
                    baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                    if (baseDelegate != null) {
                        baseDelegate.delegateEvent(4);
                        break;
                    }
                    return;
                case R.id.icon_beauty /*2131361864*/:
                    baseDelegate = (ModeProtocol$BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                    if (baseDelegate != null) {
                        baseDelegate.delegateEvent(2);
                        break;
                    }
                    return;
            }
            AlphaOutOnSubscribe.directSetResult(getView());
        }
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        switch (lastFragmentInfo) {
            case 240:
                return null;
            default:
                return FragmentAnimationFactory.wrapperAnimation(161);
        }
    }
}
