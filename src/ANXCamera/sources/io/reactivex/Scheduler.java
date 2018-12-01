package io.reactivex;

import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.schedulers.NewThreadWorker;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.TimeUnit;

public abstract class Scheduler {
    static final long CLOCK_DRIFT_TOLERANCE_NANOSECONDS = TimeUnit.MINUTES.toNanos(Long.getLong("rx2.scheduler.drift-tolerance", 15).longValue());

    static final class DisposeTask implements Disposable, Runnable {
        final Runnable decoratedRun;
        Thread runner;
        final Worker w;

        DisposeTask(Runnable decoratedRun, Worker w) {
            this.decoratedRun = decoratedRun;
            this.w = w;
        }

        public void run() {
            this.runner = Thread.currentThread();
            try {
                this.decoratedRun.run();
            } finally {
                dispose();
                this.runner = null;
            }
        }

        public void dispose() {
            if (this.runner == Thread.currentThread() && (this.w instanceof NewThreadWorker)) {
                ((NewThreadWorker) this.w).shutdown();
            } else {
                this.w.dispose();
            }
        }

        public boolean isDisposed() {
            return this.w.isDisposed();
        }
    }

    static class PeriodicDirectTask implements Disposable, Runnable {
        @NonNull
        volatile boolean disposed;
        final Runnable run;
        @NonNull
        final Worker worker;

        PeriodicDirectTask(@NonNull Runnable run, @NonNull Worker worker) {
            this.run = run;
            this.worker = worker;
        }

        public void run() {
            if (!this.disposed) {
                try {
                    this.run.run();
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    this.worker.dispose();
                    RuntimeException wrapOrThrow = ExceptionHelper.wrapOrThrow(ex);
                }
            }
        }

        public void dispose() {
            this.disposed = true;
            this.worker.dispose();
        }

        public boolean isDisposed() {
            return this.disposed;
        }
    }

    public static abstract class Worker implements Disposable {

        final class PeriodicTask implements Runnable {
            long count;
            @NonNull
            final Runnable decoratedRun;
            long lastNowNanoseconds;
            final long periodInNanoseconds;
            @NonNull
            final SequentialDisposable sd;
            long startInNanoseconds;

            PeriodicTask(long firstStartInNanoseconds, Runnable decoratedRun, @NonNull long firstNowNanoseconds, SequentialDisposable sd, @NonNull long periodInNanoseconds) {
                this.decoratedRun = decoratedRun;
                this.sd = sd;
                this.periodInNanoseconds = periodInNanoseconds;
                this.lastNowNanoseconds = firstNowNanoseconds;
                this.startInNanoseconds = firstStartInNanoseconds;
            }

            public void run() {
                Object obj = 1;
                this.decoratedRun.run();
                if (!this.sd.isDisposed()) {
                    Object obj2;
                    long j;
                    long j2;
                    long nextTick;
                    long nowNanoseconds = Worker.this.now(TimeUnit.NANOSECONDS);
                    if (Scheduler.CLOCK_DRIFT_TOLERANCE_NANOSECONDS + nowNanoseconds < this.lastNowNanoseconds) {
                        obj2 = 1;
                    } else {
                        obj2 = null;
                    }
                    if (obj2 == null) {
                        if (nowNanoseconds >= (this.lastNowNanoseconds + this.periodInNanoseconds) + Scheduler.CLOCK_DRIFT_TOLERANCE_NANOSECONDS) {
                            obj = null;
                        }
                        if (obj != null) {
                            j = this.startInNanoseconds;
                            j2 = this.count + 1;
                            this.count = j2;
                            nextTick = j + (j2 * this.periodInNanoseconds);
                            this.lastNowNanoseconds = nowNanoseconds;
                            this.sd.replace(Worker.this.schedule(this, nextTick - nowNanoseconds, TimeUnit.NANOSECONDS));
                        }
                    }
                    nextTick = nowNanoseconds + this.periodInNanoseconds;
                    j = this.periodInNanoseconds;
                    j2 = this.count + 1;
                    this.count = j2;
                    this.startInNanoseconds = nextTick - (j * j2);
                    this.lastNowNanoseconds = nowNanoseconds;
                    this.sd.replace(Worker.this.schedule(this, nextTick - nowNanoseconds, TimeUnit.NANOSECONDS));
                }
            }
        }

        @NonNull
        public abstract Disposable schedule(@NonNull Runnable runnable, long j, @NonNull TimeUnit timeUnit);

        @NonNull
        public Disposable schedule(@NonNull Runnable run) {
            return schedule(run, 0, TimeUnit.NANOSECONDS);
        }

        @NonNull
        public Disposable schedulePeriodically(@NonNull Runnable run, long initialDelay, long period, @NonNull TimeUnit unit) {
            SequentialDisposable first = new SequentialDisposable();
            SequentialDisposable sd = new SequentialDisposable(first);
            Runnable decoratedRun = RxJavaPlugins.onSchedule(run);
            long periodInNanoseconds = unit.toNanos(period);
            long firstNowNanoseconds = now(TimeUnit.NANOSECONDS);
            Disposable d = schedule(new PeriodicTask(firstNowNanoseconds + unit.toNanos(initialDelay), decoratedRun, firstNowNanoseconds, sd, periodInNanoseconds), initialDelay, unit);
            if (d == EmptyDisposable.INSTANCE) {
                return d;
            }
            first.replace(d);
            return sd;
        }

        public long now(@NonNull TimeUnit unit) {
            return unit.convert(System.currentTimeMillis(), TimeUnit.MILLISECONDS);
        }
    }

    @NonNull
    public abstract Worker createWorker();

    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable run) {
        return scheduleDirect(run, 0, TimeUnit.NANOSECONDS);
    }

    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable run, long delay, @NonNull TimeUnit unit) {
        Worker w = createWorker();
        DisposeTask task = new DisposeTask(RxJavaPlugins.onSchedule(run), w);
        w.schedule(task, delay, unit);
        return task;
    }

    @NonNull
    public Disposable schedulePeriodicallyDirect(@NonNull Runnable run, long initialDelay, long period, @NonNull TimeUnit unit) {
        Worker w = createWorker();
        PeriodicDirectTask periodicTask = new PeriodicDirectTask(RxJavaPlugins.onSchedule(run), w);
        Disposable d = w.schedulePeriodically(periodicTask, initialDelay, period, unit);
        if (d != EmptyDisposable.INSTANCE) {
            return periodicTask;
        }
        return d;
    }
}
