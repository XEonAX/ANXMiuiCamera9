package io.reactivex.internal.operators.flowable;

import io.reactivex.functions.Consumer;
import org.reactivestreams.Subscription;

public enum FlowableInternalHelper$RequestMax implements Consumer<Subscription> {
    INSTANCE;

    public void accept(Subscription t) throws Exception {
        t.request(Long.MAX_VALUE);
    }
}
