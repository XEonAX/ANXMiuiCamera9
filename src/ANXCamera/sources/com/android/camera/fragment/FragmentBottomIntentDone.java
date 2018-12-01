package com.android.camera.fragment;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.data.DataRepository;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$CameraAction;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;

public class FragmentBottomIntentDone extends BaseFragment implements OnClickListener, ModeProtocol$HandleBackTrace {
    private ImageView mApplyView;
    private View mMainView;
    private ImageView mRetryView;

    protected void initView(View v) {
        this.mMainView = v;
        ((MarginLayoutParams) v.getLayoutParams()).height = Util.getBottomHeight(getResources());
        adjustViewBackground(this.mMainView, this.mCurrentMode);
        this.mRetryView = (ImageView) v.findViewById(R.id.intent_done_retry);
        this.mApplyView = (ImageView) v.findViewById(R.id.intent_done_apply);
        this.mRetryView.setOnClickListener(this);
        this.mApplyView.setOnClickListener(this);
    }

    private void adjustViewBackground(View view, int currentMode) {
        if (currentMode == 165) {
            view.setBackgroundResource(R.color.black);
            return;
        }
        switch (DataRepository.dataItemRunning().getUiStyle()) {
            case 1:
            case 3:
                view.setBackgroundResource(R.color.fullscreen_background);
                break;
            default:
                view.setBackgroundResource(R.color.black);
                break;
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_intent_done;
    }

    public int getFragmentInto() {
        return 4083;
    }

    public void onClick(View v) {
        ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction != null) {
            switch (v.getId()) {
                case R.id.intent_done_retry /*2131361823*/:
                    cameraAction.onReviewCancelClicked();
                    break;
                case R.id.intent_done_apply /*2131361824*/:
                    cameraAction.onReviewDoneClicked();
                    break;
            }
        }
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        return FragmentAnimationFactory.wrapperAnimation(167, 161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(168, 162);
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        super.notifyDataChanged(dataChangeType, currentMode);
        switch (dataChangeType) {
            case 2:
                adjustViewBackground(this.mMainView, this.mCurrentMode);
                return;
            case 3:
                adjustViewBackground(this.mMainView, this.mCurrentMode);
                return;
            default:
                return;
        }
    }

    public boolean onBackEvent(int callingFrom) {
        switch (callingFrom) {
            case 1:
                if (!canProvide()) {
                    return false;
                }
                ModeProtocol$CameraAction cameraAction = (ModeProtocol$CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null) {
                    cameraAction.onReviewCancelClicked();
                    return true;
                }
                break;
        }
        return false;
    }
}
