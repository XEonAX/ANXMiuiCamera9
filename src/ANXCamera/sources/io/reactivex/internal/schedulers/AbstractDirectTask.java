package io.reactivex.internal.schedulers;

import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.Functions;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicReference;

abstract class AbstractDirectTask extends AtomicReference<Future<?>> implements Disposable {
    protected static final FutureTask<Void> DISPOSED = new FutureTask(Functions.EMPTY_RUNNABLE, null);
    protected static final FutureTask<Void> FINISHED = new FutureTask(Functions.EMPTY_RUNNABLE, null);
    private static final long serialVersionUID = 1811839108042568751L;
    protected final Runnable runnable;
    protected Thread runner;

    AbstractDirectTask(Runnable runnable) {
        this.runnable = runnable;
    }

    public final void dispose() {
        boolean z = false;
        Future<?> f = (Future) get();
        if (f != FINISHED && f != DISPOSED && compareAndSet(f, DISPOSED) && f != null) {
            if (this.runner != Thread.currentThread()) {
                z = true;
            }
            f.cancel(z);
        }
    }

    public final boolean isDisposed() {
        Future<?> f = (Future) get();
        return f == FINISHED || f == DISPOSED;
    }

    public final void setFuture(Future<?> future) {
        boolean z = false;
        Future<?> f;
        do {
            f = (Future) get();
            if (f == FINISHED) {
                return;
            }
            if (f == DISPOSED) {
                if (this.runner != Thread.currentThread()) {
                    z = true;
                }
                future.cancel(z);
                return;
            }
        } while (!compareAndSet(f, future));
    }
}
