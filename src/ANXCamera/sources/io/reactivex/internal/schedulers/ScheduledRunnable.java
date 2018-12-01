package io.reactivex.internal.schedulers;

import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableContainer;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicReferenceArray;

public final class ScheduledRunnable extends AtomicReferenceArray<Object> implements Runnable, Callable<Object>, Disposable {
    static final Object ASYNC_DISPOSED = new Object();
    static final Object DONE = new Object();
    static final Object PARENT_DISPOSED = new Object();
    static final Object SYNC_DISPOSED = new Object();
    private static final long serialVersionUID = -6120223772001106981L;
    final Runnable actual;

    public ScheduledRunnable(Runnable actual, DisposableContainer parent) {
        super(3);
        this.actual = actual;
        lazySet(0, parent);
    }

    public Object call() {
        run();
        return null;
    }

    public void run() {
        Object o;
        lazySet(2, Thread.currentThread());
        try {
            this.actual.run();
        } catch (Throwable th) {
            lazySet(2, null);
            o = get(0);
            if (!(o == PARENT_DISPOSED || !compareAndSet(0, o, DONE) || o == null)) {
                ((DisposableContainer) o).delete(this);
            }
            while (true) {
                o = get(1);
                if (!(o == SYNC_DISPOSED || o == ASYNC_DISPOSED || compareAndSet(1, o, DONE))) {
                }
            }
        }
        lazySet(2, null);
        o = get(0);
        if (!(o == PARENT_DISPOSED || !compareAndSet(0, o, DONE) || o == null)) {
            ((DisposableContainer) o).delete(this);
        }
        while (true) {
            o = get(1);
            if (o == SYNC_DISPOSED || o == ASYNC_DISPOSED || compareAndSet(1, o, DONE)) {
                return;
            }
        }
    }

    public void setFuture(Future<?> f) {
        Object o;
        do {
            o = get(1);
            if (o == DONE) {
                return;
            }
            if (o == SYNC_DISPOSED) {
                f.cancel(false);
                return;
            } else if (o == ASYNC_DISPOSED) {
                f.cancel(true);
                return;
            }
        } while (!compareAndSet(1, o, f));
    }

    public void dispose() {
        Object o;
        boolean async;
        do {
            o = get(1);
            if (o == DONE || o == SYNC_DISPOSED || o == ASYNC_DISPOSED) {
                break;
            }
            if (get(2) == Thread.currentThread()) {
                async = false;
            } else {
                async = true;
            }
        } while (!compareAndSet(1, o, !async ? SYNC_DISPOSED : ASYNC_DISPOSED));
        if (o != null) {
            ((Future) o).cancel(async);
        }
        do {
            o = get(0);
            if (o == DONE || o == PARENT_DISPOSED || o == null) {
                return;
            }
        } while (!compareAndSet(0, o, PARENT_DISPOSED));
        ((DisposableContainer) o).delete(this);
    }

    public boolean isDisposed() {
        Object o = get(0);
        if (o == PARENT_DISPOSED || o == DONE) {
            return true;
        }
        return false;
    }
}
