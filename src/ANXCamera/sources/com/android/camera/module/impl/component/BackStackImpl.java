package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol$BackStack;
import com.android.camera.protocol.ModeProtocol$HandleBackTrace;
import java.util.Stack;

public class BackStackImpl implements ModeProtocol$BackStack {
    private ActivityBase mActivity;
    private Stack<ModeProtocol$HandleBackTrace> mStacks = new Stack();

    public static BackStackImpl create(ActivityBase activityBase) {
        return new BackStackImpl(activityBase);
    }

    public BackStackImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(171, this);
    }

    public void unRegisterProtocol() {
        this.mStacks.clear();
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(171, this);
    }

    public <P extends ModeProtocol$HandleBackTrace> void addInBackStack(P handleBackTrack) {
        this.mStacks.add(handleBackTrack);
    }

    public <P extends ModeProtocol$HandleBackTrace> void removeBackStack(P handleBackTrack) {
        this.mStacks.remove(handleBackTrack);
    }

    private final boolean handleBackStack(int callingFrom) {
        if (this.mStacks.isEmpty()) {
            return false;
        }
        for (ModeProtocol$HandleBackTrace backTrace : this.mStacks) {
            if (backTrace.onBackEvent(callingFrom)) {
                return true;
            }
        }
        return false;
    }

    public boolean handleBackStackFromShutter() {
        return handleBackStack(3);
    }

    public boolean handleBackStackFromKeyBack() {
        return handleBackStack(1);
    }

    public boolean handleBackStackFromTapDown(int x, int y) {
        if (this.mActivity.getCameraScreenNail().getRenderRect().contains(x, y)) {
            return handleBackStack(2);
        }
        return false;
    }
}
