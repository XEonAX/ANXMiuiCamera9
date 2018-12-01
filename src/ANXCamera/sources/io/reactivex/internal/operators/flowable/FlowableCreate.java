package io.reactivex.internal.operators.flowable;

import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableCreate<T> extends Flowable<T> {
    final BackpressureStrategy backpressure;
    final FlowableOnSubscribe<T> source;

    /* renamed from: io.reactivex.internal.operators.flowable.FlowableCreate$1 */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$io$reactivex$BackpressureStrategy = new int[BackpressureStrategy.values().length];

        static {
            try {
                $SwitchMap$io$reactivex$BackpressureStrategy[BackpressureStrategy.MISSING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$io$reactivex$BackpressureStrategy[BackpressureStrategy.ERROR.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$io$reactivex$BackpressureStrategy[BackpressureStrategy.DROP.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$io$reactivex$BackpressureStrategy[BackpressureStrategy.LATEST.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    static abstract class BaseEmitter<T> extends AtomicLong implements FlowableEmitter<T>, Subscription {
        private static final long serialVersionUID = 7326289992464377023L;
        final Subscriber<? super T> actual;
        final SequentialDisposable serial = new SequentialDisposable();

        BaseEmitter(Subscriber<? super T> actual) {
            this.actual = actual;
        }

        public void onComplete() {
            complete();
        }

        protected void complete() {
            if (!isCancelled()) {
                try {
                    this.actual.onComplete();
                } finally {
                    this.serial.dispose();
                }
            }
        }

        public final void onError(Throwable e) {
            if (!tryOnError(e)) {
                RxJavaPlugins.onError(e);
            }
        }

        public boolean tryOnError(Throwable e) {
            return error(e);
        }

        protected boolean error(Throwable e) {
            if (e == null) {
                e = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
            }
            if (isCancelled()) {
                return false;
            }
            try {
                this.actual.onError(e);
                return true;
            } finally {
                this.serial.dispose();
            }
        }

        public final void cancel() {
            this.serial.dispose();
            onUnsubscribed();
        }

        void onUnsubscribed() {
        }

        public final boolean isCancelled() {
            return this.serial.isDisposed();
        }

        public final void request(long n) {
            if (SubscriptionHelper.validate(n)) {
                BackpressureHelper.add(this, n);
                onRequested();
            }
        }

        void onRequested() {
        }
    }

    static final class BufferAsyncEmitter<T> extends BaseEmitter<T> {
        private static final long serialVersionUID = 2427151001689639875L;
        volatile boolean done;
        Throwable error;
        final SpscLinkedArrayQueue<T> queue;
        final AtomicInteger wip = new AtomicInteger();

        BufferAsyncEmitter(Subscriber<? super T> actual, int capacityHint) {
            super(actual);
            this.queue = new SpscLinkedArrayQueue(capacityHint);
        }

        public void onNext(T t) {
            if (!this.done && !isCancelled()) {
                if (t != null) {
                    this.queue.offer(t);
                    drain();
                    return;
                }
                onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
            }
        }

        public boolean tryOnError(Throwable e) {
            if (this.done || isCancelled()) {
                return false;
            }
            if (e == null) {
                e = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
            }
            this.error = e;
            this.done = true;
            drain();
            return true;
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        void onRequested() {
            drain();
        }

        void onUnsubscribed() {
            if (this.wip.getAndIncrement() == 0) {
                this.queue.clear();
            }
        }

        void drain() {
            if (this.wip.getAndIncrement() == 0) {
                int missed = 1;
                Subscriber<? super T> a = this.actual;
                SpscLinkedArrayQueue<T> q = this.queue;
                do {
                    boolean d;
                    boolean empty;
                    Throwable ex;
                    long r = get();
                    long e = 0;
                    while (e != r) {
                        if (!isCancelled()) {
                            d = this.done;
                            T o = q.poll();
                            empty = o == null;
                            if (!d || !empty) {
                                if (empty) {
                                    break;
                                }
                                a.onNext(o);
                                e++;
                            } else {
                                ex = this.error;
                                if (ex == null) {
                                    complete();
                                } else {
                                    error(ex);
                                }
                                return;
                            }
                        }
                        q.clear();
                        return;
                    }
                    if (e == r) {
                        if (isCancelled()) {
                            q.clear();
                            return;
                        }
                        d = this.done;
                        empty = q.isEmpty();
                        if (d && empty) {
                            ex = this.error;
                            if (ex == null) {
                                complete();
                            } else {
                                error(ex);
                            }
                            return;
                        }
                    }
                    if (e != 0) {
                        BackpressureHelper.produced(this, e);
                    }
                    missed = this.wip.addAndGet(-missed);
                } while (missed != 0);
            }
        }
    }

    static abstract class NoOverflowBaseAsyncEmitter<T> extends BaseEmitter<T> {
        private static final long serialVersionUID = 4127754106204442833L;

        abstract void onOverflow();

        NoOverflowBaseAsyncEmitter(Subscriber<? super T> actual) {
            super(actual);
        }

        public final void onNext(T t) {
            if (!isCancelled()) {
                if (t != null) {
                    if (get() != 0) {
                        this.actual.onNext(t);
                        BackpressureHelper.produced(this, 1);
                    } else {
                        onOverflow();
                    }
                    return;
                }
                onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
            }
        }
    }

    static final class DropAsyncEmitter<T> extends NoOverflowBaseAsyncEmitter<T> {
        private static final long serialVersionUID = 8360058422307496563L;

        DropAsyncEmitter(Subscriber<? super T> actual) {
            super(actual);
        }

        void onOverflow() {
        }
    }

    static final class ErrorAsyncEmitter<T> extends NoOverflowBaseAsyncEmitter<T> {
        private static final long serialVersionUID = 338953216916120960L;

        ErrorAsyncEmitter(Subscriber<? super T> actual) {
            super(actual);
        }

        void onOverflow() {
            onError(new MissingBackpressureException("create: could not emit value due to lack of requests"));
        }
    }

    static final class LatestAsyncEmitter<T> extends BaseEmitter<T> {
        private static final long serialVersionUID = 4023437720691792495L;
        volatile boolean done;
        Throwable error;
        final AtomicReference<T> queue = new AtomicReference();
        final AtomicInteger wip = new AtomicInteger();

        LatestAsyncEmitter(Subscriber<? super T> actual) {
            super(actual);
        }

        public void onNext(T t) {
            if (!this.done && !isCancelled()) {
                if (t != null) {
                    this.queue.set(t);
                    drain();
                    return;
                }
                onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
            }
        }

        public boolean tryOnError(Throwable e) {
            if (this.done || isCancelled()) {
                return false;
            }
            if (e == null) {
                onError(new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources."));
            }
            this.error = e;
            this.done = true;
            drain();
            return true;
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        void onRequested() {
            drain();
        }

        void onUnsubscribed() {
            if (this.wip.getAndIncrement() == 0) {
                this.queue.lazySet(null);
            }
        }

        void drain() {
            if (this.wip.getAndIncrement() == 0) {
                int missed = 1;
                Subscriber<? super T> a = this.actual;
                AtomicReference<T> q = this.queue;
                do {
                    boolean d;
                    boolean empty;
                    Throwable ex;
                    long r = get();
                    long e = 0;
                    while (e != r) {
                        if (!isCancelled()) {
                            d = this.done;
                            T o = q.getAndSet(null);
                            empty = o == null;
                            if (!d || !empty) {
                                if (empty) {
                                    break;
                                }
                                a.onNext(o);
                                e++;
                            } else {
                                ex = this.error;
                                if (ex == null) {
                                    complete();
                                } else {
                                    error(ex);
                                }
                                return;
                            }
                        }
                        q.lazySet(null);
                        return;
                    }
                    if (e == r) {
                        if (isCancelled()) {
                            q.lazySet(null);
                            return;
                        }
                        d = this.done;
                        empty = q.get() == null;
                        if (d && empty) {
                            ex = this.error;
                            if (ex == null) {
                                complete();
                            } else {
                                error(ex);
                            }
                            return;
                        }
                    }
                    if (e != 0) {
                        BackpressureHelper.produced(this, e);
                    }
                    missed = this.wip.addAndGet(-missed);
                } while (missed != 0);
            }
        }
    }

    static final class MissingEmitter<T> extends BaseEmitter<T> {
        private static final long serialVersionUID = 3776720187248809713L;

        MissingEmitter(Subscriber<? super T> actual) {
            super(actual);
        }

        public void onNext(T t) {
            if (!isCancelled()) {
                if (t == null) {
                    onError(new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources."));
                    return;
                }
                this.actual.onNext(t);
                long r;
                do {
                    r = get();
                    if (r == 0) {
                        break;
                    }
                } while (!compareAndSet(r, r - 1));
            }
        }
    }

    public FlowableCreate(FlowableOnSubscribe<T> source, BackpressureStrategy backpressure) {
        this.source = source;
        this.backpressure = backpressure;
    }

    public void subscribeActual(Subscriber<? super T> t) {
        BaseEmitter<T> emitter;
        switch (AnonymousClass1.$SwitchMap$io$reactivex$BackpressureStrategy[this.backpressure.ordinal()]) {
            case 1:
                emitter = new MissingEmitter(t);
                break;
            case 2:
                emitter = new ErrorAsyncEmitter(t);
                break;
            case 3:
                emitter = new DropAsyncEmitter(t);
                break;
            case 4:
                emitter = new LatestAsyncEmitter(t);
                break;
            default:
                emitter = new BufferAsyncEmitter(t, Flowable.bufferSize());
                break;
        }
        t.onSubscribe(emitter);
        try {
            this.source.subscribe(emitter);
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            emitter.onError(ex);
        }
    }
}
