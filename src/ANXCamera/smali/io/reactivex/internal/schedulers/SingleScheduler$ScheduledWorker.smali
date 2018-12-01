.class final Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;
.super Lio/reactivex/Scheduler$Worker;
.source "SingleScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/SingleScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScheduledWorker"
.end annotation


# instance fields
.field volatile disposed:Z

.field final executor:Ljava/util/concurrent/ScheduledExecutorService;

.field final tasks:Lio/reactivex/disposables/CompositeDisposable;


# direct methods
.method constructor <init>(Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/ScheduledExecutorService;

    .prologue
    .line 168
    invoke-direct {p0}, Lio/reactivex/Scheduler$Worker;-><init>()V

    .line 169
    iput-object p1, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 170
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    .line 171
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 205
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->disposed:Z

    if-eqz v0, :cond_0

    .line 209
    :goto_0
    return-void

    .line 206
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->disposed:Z

    .line 207
    iget-object v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 213
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->disposed:Z

    return v0
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 8
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 176
    iget-boolean v5, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->disposed:Z

    if-nez v5, :cond_1

    .line 180
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    .line 182
    .local v0, "decoratedRun":Ljava/lang/Runnable;
    new-instance v3, Lio/reactivex/internal/schedulers/ScheduledRunnable;

    iget-object v5, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v3, v0, v5}, Lio/reactivex/internal/schedulers/ScheduledRunnable;-><init>(Ljava/lang/Runnable;Lio/reactivex/internal/disposables/DisposableContainer;)V

    .line 183
    .local v3, "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    iget-object v5, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v5, v3}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 187
    const-wide/16 v6, 0x0

    cmp-long v5, p2, v6

    if-lez v5, :cond_0

    const/4 v4, 0x1

    :cond_0
    if-nez v4, :cond_2

    .line 188
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v4, v3}, Ljava/util/concurrent/ScheduledExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 193
    .local v2, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_0
    invoke-virtual {v3, v2}, Lio/reactivex/internal/schedulers/ScheduledRunnable;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    return-object v3

    .line 177
    .end local v0    # "decoratedRun":Ljava/lang/Runnable;
    .end local v2    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    .end local v3    # "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    :cond_1
    sget-object v4, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v4

    .line 190
    .restart local v0    # "decoratedRun":Ljava/lang/Runnable;
    .restart local v3    # "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    :cond_2
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v4, v3, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .restart local v2    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    goto :goto_0

    .line 194
    .end local v2    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_0
    move-exception v1

    .line 195
    .local v1, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/SingleScheduler$ScheduledWorker;->dispose()V

    .line 196
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 197
    sget-object v4, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v4
.end method
