package com.android.camera.fragment.beauty;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.effect.BeautyParameters;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeProtocol$MakeupProtocol;
import com.android.camera.protocol.ModeProtocol$ModeCoordinator;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.List;

public class FragmentPopupMakeup extends BaseFragment implements ModeProtocol$MakeupProtocol, Consumer<Integer> {
    private int mActiveProgress;
    private Disposable mDisposable;
    private FlowableEmitter<Integer> mFlowableEmitter;
    private boolean mIsRTL;
    private SeekBar mSeekBar;

    protected void initView(View v) {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        ((MarginLayoutParams) v.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        v.setOnClickListener(new OnClickListener() {
            public void onClick(View v) {
            }
        });
        this.mDisposable = Flowable.create(new FlowableOnSubscribe<Integer>() {
            public void subscribe(FlowableEmitter<Integer> e) throws Exception {
                FragmentPopupMakeup.this.mFlowableEmitter = e;
            }
        }, BackpressureStrategy.DROP).observeOn(Schedulers.computation()).onBackpressureDrop(new Consumer<Integer>() {
            public void accept(@NonNull Integer integer) throws Exception {
                Log.e("VIEW_", "seekbar change too fast :" + integer.toString());
            }
        }).subscribe((Consumer) this);
        this.mActiveProgress = BeautyParameters.getInstance().getCurrentProgress() * 1;
        this.mSeekBar = (SeekBar) v.findViewById(R.id.makeup_params_level);
        this.mSeekBar.setMax(100);
        this.mSeekBar.setProgress(this.mActiveProgress);
        this.mSeekBar.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (progress == 0 || progress == 100 || Math.abs(progress - FragmentPopupMakeup.this.mActiveProgress) > 5) {
                    FragmentPopupMakeup.this.mActiveProgress = progress;
                    FragmentPopupMakeup.this.mFlowableEmitter.onNext(Integer.valueOf(progress / 1));
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        this.mSeekBar.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getAction()) {
                    case 0:
                        if (!FragmentPopupMakeup.this.mSeekBar.getThumb().getBounds().contains((int) event.getX(), (int) event.getY())) {
                            return true;
                        }
                        break;
                    case 1:
                    case 2:
                        break;
                    default:
                        return false;
                }
                int width = FragmentPopupMakeup.this.mSeekBar.getWidth();
                FragmentPopupMakeup.this.mSeekBar.setProgress(Util.clamp((int) (((FragmentPopupMakeup.this.mIsRTL ? ((float) width) - event.getX() : event.getX()) / ((float) width)) * 100.0f), 0, 100));
                return true;
            }
        });
    }

    protected void register(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(180, this);
    }

    protected void unRegister(ModeProtocol$ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(180, this);
        if (this.mDisposable != null && (this.mDisposable.isDisposed() ^ 1) != 0) {
            this.mDisposable.dispose();
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_popup_makeup;
    }

    public int getFragmentInto() {
        return 252;
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
        if (getView().getTag() == null || ((Integer) getView().getTag()).intValue() != newState) {
            getView().setTag(Integer.valueOf(newState));
            if (newState == 1) {
                if (getView().getVisibility() != 0) {
                    getView().setVisibility(0);
                }
                if (animateInElements == null) {
                    SlideInOnSubscribe.directSetResult(this.mSeekBar, 80);
                } else {
                    animateInElements.add(Completable.create(new SlideInOnSubscribe(this.mSeekBar, 80)));
                }
            } else if (animateInElements == null) {
                SlideOutOnSubscribe.directSetResult(this.mSeekBar, 80);
            } else {
                animateInElements.add(Completable.create(new SlideOutOnSubscribe(this.mSeekBar, 80)));
            }
        }
    }

    protected Animation provideEnterAnimation(int lastFragmentInfo) {
        return FragmentAnimationFactory.wrapperAnimation(167, 161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(168, 162);
    }

    public void onMakeupItemSelected() {
        this.mSeekBar.setProgress(BeautyParameters.getInstance().getCurrentProgress() * 1);
    }

    public void accept(@NonNull Integer integer) throws Exception {
        BeautyParameters.getInstance().setProgress(integer.intValue());
    }
}
