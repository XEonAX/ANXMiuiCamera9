package com.android.camera.module.loader;

public final class NullHolder<T> {
    private int mException;
    private final T mValue;

    public static final <T> NullHolder<T> ofNullable(T value) {
        return of(value, 224);
    }

    public static final <T> NullHolder<T> ofNullable(T value, int exception) {
        return of(value, exception);
    }

    public T get() {
        return this.mValue;
    }

    private static <T> NullHolder<T> of(T value, int exception) {
        return new NullHolder(value, exception);
    }

    private NullHolder(T value, int exception) {
        this.mValue = value;
        this.mException = exception;
    }

    public boolean isPresent() {
        return this.mValue != null;
    }

    public int getException() {
        return this.mException;
    }
}
