package com.android.camera.fragment;

import android.support.annotation.IdRes;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class BaseFragmentOperation {
    @IdRes
    public int containerViewId;
    public int operateType = -1;
    public int pendingFragmentInfo;

    @Retention(RetentionPolicy.SOURCE)
    public @interface OperateFragment {
    }

    private BaseFragmentOperation(@IdRes int containerViewId) {
        this.containerViewId = containerViewId;
    }

    public static BaseFragmentOperation create(@IdRes int containerViewId) {
        return new BaseFragmentOperation(containerViewId);
    }

    public BaseFragmentOperation replaceWith(int newFragmentInfo) {
        checkOperation();
        this.operateType = 1;
        this.pendingFragmentInfo = newFragmentInfo;
        return this;
    }

    public BaseFragmentOperation removeCurrent() {
        checkOperation();
        this.operateType = 3;
        return this;
    }

    public BaseFragmentOperation push(int newFragmentInfo) {
        checkOperation();
        this.operateType = 4;
        this.pendingFragmentInfo = newFragmentInfo;
        return this;
    }

    public BaseFragmentOperation popAndClearOthers(int fragmentInfo) {
        checkOperation();
        this.operateType = 5;
        this.pendingFragmentInfo = fragmentInfo;
        return this;
    }

    public BaseFragmentOperation show(int fragmentInfo) {
        checkOperation();
        this.operateType = 6;
        this.pendingFragmentInfo = fragmentInfo;
        return this;
    }

    public BaseFragmentOperation hideCurrent() {
        checkOperation();
        this.operateType = 7;
        return this;
    }

    private void checkOperation() {
        if (this.operateType > 0) {
            throw new RuntimeException("already set!");
        }
    }
}
