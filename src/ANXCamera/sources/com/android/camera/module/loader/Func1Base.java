package com.android.camera.module.loader;

import io.reactivex.functions.Function;

public abstract class Func1Base<T, R> implements Function<NullHolder<T>, NullHolder<R>> {
    protected int mTargetMode;

    public Func1Base(int targetMode) {
        this.mTargetMode = targetMode;
    }
}
