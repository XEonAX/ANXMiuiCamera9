package io.reactivex;

import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.SchedulerSupport;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.ConsumerSingleObserver;
import io.reactivex.internal.operators.single.SingleCreate;
import io.reactivex.internal.operators.single.SingleError;
import io.reactivex.internal.operators.single.SingleJust;
import io.reactivex.internal.operators.single.SingleMap;
import io.reactivex.internal.operators.single.SingleObserveOn;
import io.reactivex.internal.operators.single.SingleSubscribeOn;
import io.reactivex.internal.operators.single.SingleZipArray;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.NoSuchElementException;
import java.util.concurrent.Callable;

public abstract class Single<T> implements SingleSource<T> {
    protected abstract void subscribeActual(@NonNull SingleObserver<? super T> singleObserver);

    @CheckReturnValue
    @SchedulerSupport("none")
    public static <T> Single<T> create(SingleOnSubscribe<T> source) {
        ObjectHelper.requireNonNull(source, "source is null");
        return RxJavaPlugins.onAssembly(new SingleCreate(source));
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public static <T> Single<T> error(Callable<? extends Throwable> errorSupplier) {
        ObjectHelper.requireNonNull(errorSupplier, "errorSupplier is null");
        return RxJavaPlugins.onAssembly(new SingleError(errorSupplier));
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public static <T> Single<T> error(Throwable exception) {
        ObjectHelper.requireNonNull(exception, "error is null");
        return error(Functions.justCallable(exception));
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public static <T> Single<T> just(T item) {
        ObjectHelper.requireNonNull(item, "value is null");
        return RxJavaPlugins.onAssembly(new SingleJust(item));
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public static <T1, T2, R> Single<R> zip(SingleSource<? extends T1> source1, SingleSource<? extends T2> source2, BiFunction<? super T1, ? super T2, ? extends R> zipper) {
        ObjectHelper.requireNonNull(source1, "source1 is null");
        ObjectHelper.requireNonNull(source2, "source2 is null");
        return zipArray(Functions.toFunction(zipper), source1, source2);
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public static <T, R> Single<R> zipArray(Function<? super Object[], ? extends R> zipper, SingleSource<? extends T>... sources) {
        ObjectHelper.requireNonNull(zipper, "zipper is null");
        ObjectHelper.requireNonNull(sources, "sources is null");
        if (sources.length != 0) {
            return RxJavaPlugins.onAssembly(new SingleZipArray(sources, zipper));
        }
        return error(new NoSuchElementException());
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public final <R> Single<R> map(Function<? super T, ? extends R> mapper) {
        ObjectHelper.requireNonNull(mapper, "mapper is null");
        return RxJavaPlugins.onAssembly(new SingleMap(this, mapper));
    }

    @CheckReturnValue
    @SchedulerSupport("custom")
    public final Single<T> observeOn(Scheduler scheduler) {
        ObjectHelper.requireNonNull(scheduler, "scheduler is null");
        return RxJavaPlugins.onAssembly(new SingleObserveOn(this, scheduler));
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public final Disposable subscribe(Consumer<? super T> onSuccess) {
        return subscribe(onSuccess, Functions.ON_ERROR_MISSING);
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public final Disposable subscribe(Consumer<? super T> onSuccess, Consumer<? super Throwable> onError) {
        ObjectHelper.requireNonNull(onSuccess, "onSuccess is null");
        ObjectHelper.requireNonNull(onError, "onError is null");
        SingleObserver s = new ConsumerSingleObserver(onSuccess, onError);
        subscribe(s);
        return s;
    }

    @SchedulerSupport("none")
    public final void subscribe(SingleObserver<? super T> subscriber) {
        ObjectHelper.requireNonNull(subscriber, "subscriber is null");
        subscriber = RxJavaPlugins.onSubscribe(this, (SingleObserver) subscriber);
        ObjectHelper.requireNonNull(subscriber, "subscriber returned by the RxJavaPlugins hook is null");
        try {
            subscribeActual(subscriber);
        } catch (NullPointerException ex) {
            throw ex;
        } catch (Throwable ex2) {
            Exceptions.throwIfFatal(ex2);
            new NullPointerException("subscribeActual failed").initCause(ex2);
        }
    }

    @CheckReturnValue
    @SchedulerSupport("custom")
    public final Single<T> subscribeOn(Scheduler scheduler) {
        ObjectHelper.requireNonNull(scheduler, "scheduler is null");
        return RxJavaPlugins.onAssembly(new SingleSubscribeOn(this, scheduler));
    }

    @CheckReturnValue
    @SchedulerSupport("none")
    public final <U, R> Single<R> zipWith(SingleSource<U> other, BiFunction<? super T, ? super U, ? extends R> zipper) {
        return zip(this, other, zipper);
    }
}
