package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.internal.functions.ObjectHelper;

abstract class AbstractFlowableWithUpstream<T, R> extends Flowable<R> {
    protected final Flowable<T> source;

    AbstractFlowableWithUpstream(Flowable<T> source) {
        this.source = (Flowable) ObjectHelper.requireNonNull(source, "source is null");
    }
}
