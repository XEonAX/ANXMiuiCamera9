.class final Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ExecutorScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/ExecutorScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DelayedRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Ljava/lang/Runnable;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lio/reactivex/disposables/Disposable;",
        "Lio/reactivex/schedulers/SchedulerRunnableIntrospection;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x38eadf8da9d2b4ecL


# instance fields
.field final direct:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final timed:Lio/reactivex/internal/disposables/SequentialDisposable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "run"    # Ljava/lang/Runnable;

    .prologue
    .line 304
    invoke-direct {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 305
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->timed:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 306
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->direct:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 307
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 330
    invoke-virtual {p0, v0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 334
    :goto_0
    return-void

    .line 331
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->timed:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 332
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->direct:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 325
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public run()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 311
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 312
    .local v1, "r":Ljava/lang/Runnable;
    if-nez v1, :cond_0

    .line 321
    :goto_0
    return-void

    .line 314
    :cond_0
    :try_start_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    invoke-virtual {p0, v2}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->lazySet(Ljava/lang/Object;)V

    .line 317
    iget-object v2, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->timed:Lio/reactivex/internal/disposables/SequentialDisposable;

    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {v2, v3}, Lio/reactivex/internal/disposables/SequentialDisposable;->lazySet(Ljava/lang/Object;)V

    .line 318
    iget-object v2, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->direct:Lio/reactivex/internal/disposables/SequentialDisposable;

    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {v2, v3}, Lio/reactivex/internal/disposables/SequentialDisposable;->lazySet(Ljava/lang/Object;)V

    goto :goto_0

    .line 316
    :catchall_0
    move-exception v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->lazySet(Ljava/lang/Object;)V

    .line 317
    iget-object v2, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->timed:Lio/reactivex/internal/disposables/SequentialDisposable;

    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {v2, v3}, Lio/reactivex/internal/disposables/SequentialDisposable;->lazySet(Ljava/lang/Object;)V

    .line 318
    iget-object v2, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$DelayedRunnable;->direct:Lio/reactivex/internal/disposables/SequentialDisposable;

    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {v2, v3}, Lio/reactivex/internal/disposables/SequentialDisposable;->lazySet(Ljava/lang/Object;)V

    throw v0
.end method
