package com.android.camera.animation;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.View;
import android.view.animation.LinearInterpolator;
import com.android.camera.animation.AnimationDelegate.AnimationResource;
import com.android.camera.data.DataRepository;
import com.android.camera.module.loader.StartControl;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;
import java.util.List;

public class AnimationComposite implements Consumer<Integer> {
    private Disposable mAfterFrameArrivedDisposable = Observable.create(new ObservableOnSubscribe<Integer>() {
        public void subscribe(ObservableEmitter<Integer> e) throws Exception {
            AnimationComposite.this.mAfterFrameArrivedEmitter = e;
        }
    }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer) this);
    private ObservableEmitter<Integer> mAfterFrameArrivedEmitter;
    private Disposable mAnimationDisposable;
    private int mCurrentDegree = 0;
    private int mOrientation = -1;
    private SparseArray<AnimationResource> mResourceSparseArray = new SparseArray();
    private ValueAnimator mRotationAnimator;
    private int mStartDegree = 0;
    private int mTargetDegree = 0;

    public void put(int fragmentInfo, AnimationResource resource) {
        this.mResourceSparseArray.put(fragmentInfo, resource);
    }

    public void remove(int fragmentInfo) {
        this.mResourceSparseArray.remove(fragmentInfo);
    }

    public Disposable dispose(@Nullable Completable prefixCompletable, @Nullable Action resultAction, StartControl startControl) {
        List<Completable> inElements = new ArrayList();
        if (prefixCompletable != null) {
            inElements.add(prefixCompletable);
        }
        if (startControl.mNeedReConfigureView) {
            int newMode = startControl.mTargetMode;
            boolean needViewAnimation = startControl.mNeedViewAnimation;
            boolean timeOut = startControl.mResetType == 2;
            for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
                AnimationResource resource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
                if (resource.canProvide()) {
                    resource.provideAnimateElement(newMode, needViewAnimation ? inElements : null, timeOut);
                }
            }
        }
        if (!(this.mAnimationDisposable == null || (this.mAnimationDisposable.isDisposed() ^ 1) == 0)) {
            this.mAnimationDisposable.dispose();
        }
        if (resultAction != null) {
            this.mAnimationDisposable = Completable.merge(inElements).subscribe(resultAction);
        } else {
            this.mAnimationDisposable = Completable.merge(inElements).subscribe();
        }
        return this.mAnimationDisposable;
    }

    public void disposeRotation(int orientation) {
        orientation = orientation >= 0 ? orientation % 360 : (orientation % 360) + 360;
        if (this.mOrientation != orientation) {
            boolean needAnimation = this.mOrientation != -1;
            int diff = orientation - this.mOrientation;
            if (diff < 0) {
                diff += 360;
            }
            if (diff > 180) {
                diff -= 360;
            }
            boolean clockWise = diff <= 0;
            this.mOrientation = orientation;
            if (this.mOrientation != 0 || this.mCurrentDegree != 0) {
                this.mTargetDegree = (360 - orientation) % 360;
                final List<View> pendingViews = new ArrayList();
                for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
                    AnimationResource resource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
                    if (resource.canProvide()) {
                        resource.provideRotateItem(pendingViews, this.mTargetDegree);
                    }
                }
                if (needAnimation) {
                    int animateStart;
                    int animateEnd;
                    if (this.mRotationAnimator != null) {
                        this.mRotationAnimator.cancel();
                    }
                    this.mStartDegree = this.mCurrentDegree;
                    if (clockWise) {
                        animateStart = this.mStartDegree == 360 ? 0 : this.mStartDegree;
                        animateEnd = this.mTargetDegree == 0 ? 360 : this.mTargetDegree;
                    } else {
                        animateStart = this.mStartDegree == 0 ? 360 : this.mStartDegree;
                        animateEnd = this.mTargetDegree == 360 ? 0 : this.mTargetDegree;
                    }
                    this.mRotationAnimator = ValueAnimator.ofInt(new int[]{animateStart, animateEnd});
                    this.mRotationAnimator.setInterpolator(new LinearInterpolator());
                    this.mRotationAnimator.removeAllUpdateListeners();
                    this.mRotationAnimator.addUpdateListener(new AnimatorUpdateListener() {
                        public void onAnimationUpdate(ValueAnimator animation) {
                            AnimationComposite.this.mCurrentDegree = ((Integer) animation.getAnimatedValue()).intValue();
                            for (View view : pendingViews) {
                                ViewCompat.setRotation(view, (float) AnimationComposite.this.mCurrentDegree);
                            }
                        }
                    });
                    this.mRotationAnimator.start();
                    return;
                }
                this.mCurrentDegree = this.mTargetDegree;
                for (View view : pendingViews) {
                    ViewCompat.setRotation(view, (float) this.mTargetDegree);
                }
            }
        }
    }

    public void setClickEnable(boolean enable) {
        for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
            AnimationResource resource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (resource.canProvide() && resource.isEnableClick() != enable) {
                resource.setClickEnable(enable);
            }
        }
    }

    public void notifyDataChanged(int dataChangeType, int currentMode) {
        for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
            AnimationResource resource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (resource.canProvide()) {
                resource.notifyDataChanged(dataChangeType, currentMode);
            }
        }
    }

    public void notifyAfterFirstFrameArrived(int arrivedType) {
        if (this.mAfterFrameArrivedDisposable != null && !this.mAfterFrameArrivedDisposable.isDisposed()) {
            this.mAfterFrameArrivedEmitter.onNext(Integer.valueOf(arrivedType));
        }
    }

    public void destroy() {
        if (this.mResourceSparseArray != null) {
            this.mResourceSparseArray.clear();
            this.mResourceSparseArray = null;
        }
        if (this.mAfterFrameArrivedDisposable != null && (this.mAfterFrameArrivedDisposable.isDisposed() ^ 1) != 0) {
            this.mAfterFrameArrivedEmitter.onComplete();
            this.mAfterFrameArrivedDisposable.dispose();
            this.mAfterFrameArrivedDisposable = null;
        }
    }

    public void accept(@NonNull Integer integer) throws Exception {
        DataRepository.dataItemGlobal().setRetriedIfCameraError(false);
        for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
            AnimationResource resource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (resource.canProvide()) {
                if (!resource.isEnableClick()) {
                    resource.setClickEnable(true);
                }
                resource.notifyAfterFrameAvailable(integer.intValue());
            }
        }
    }
}
