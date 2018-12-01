package io.reactivex;

public interface FlowableEmitter<T> extends Emitter<T> {
    boolean isCancelled();
}
