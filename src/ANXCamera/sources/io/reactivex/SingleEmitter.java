package io.reactivex;

import io.reactivex.annotations.NonNull;

public interface SingleEmitter<T> {
    boolean isDisposed();

    void onSuccess(@NonNull T t);
}
