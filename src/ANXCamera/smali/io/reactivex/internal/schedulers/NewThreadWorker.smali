.class public Lio/reactivex/internal/schedulers/NewThreadWorker;
.super Lio/reactivex/Scheduler$Worker;
.source "NewThreadWorker.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# instance fields
.field volatile disposed:Z

.field private final executor:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 1
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 35
    invoke-direct {p0}, Lio/reactivex/Scheduler$Worker;-><init>()V

    .line 36
    invoke-static {p1}, Lio/reactivex/internal/schedulers/SchedulerPoolFactory;->create(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 37
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 163
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->disposed:Z

    if-eqz v0, :cond_0

    .line 167
    :goto_0
    return-void

    .line 164
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->disposed:Z

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 181
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->disposed:Z

    return v0
.end method

.method public schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;
    .locals 4
    .param p1, "run"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 42
    const/4 v0, 0x0

    const-wide/16 v2, 0x0

    invoke-virtual {p0, p1, v2, v3, v0}, Lio/reactivex/internal/schedulers/NewThreadWorker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 6
    .param p1, "action"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p2, "delayTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 48
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->disposed:Z

    if-nez v0, :cond_0

    .line 51
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lio/reactivex/internal/schedulers/NewThreadWorker;->scheduleActual(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/internal/disposables/DisposableContainer;)Lio/reactivex/internal/schedulers/ScheduledRunnable;

    move-result-object v0

    return-object v0

    .line 49
    :cond_0
    sget-object v0, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v0
.end method

.method public scheduleActual(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;Lio/reactivex/internal/disposables/DisposableContainer;)Lio/reactivex/internal/schedulers/ScheduledRunnable;
    .locals 8
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "delayTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p5, "parent"    # Lio/reactivex/internal/disposables/DisposableContainer;
        .annotation build Lio/reactivex/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 133
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    .line 135
    .local v0, "decoratedRun":Ljava/lang/Runnable;
    new-instance v3, Lio/reactivex/internal/schedulers/ScheduledRunnable;

    invoke-direct {v3, v0, p5}, Lio/reactivex/internal/schedulers/ScheduledRunnable;-><init>(Ljava/lang/Runnable;Lio/reactivex/internal/disposables/DisposableContainer;)V

    .line 137
    .local v3, "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    if-nez p5, :cond_2

    .line 145
    :cond_0
    const-wide/16 v6, 0x0

    cmp-long v5, p2, v6

    if-lez v5, :cond_1

    const/4 v4, 0x1

    :cond_1
    if-nez v4, :cond_3

    .line 146
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v4, v3}, Ljava/util/concurrent/ScheduledExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 150
    .local v2, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_0
    invoke-virtual {v3, v2}, Lio/reactivex/internal/schedulers/ScheduledRunnable;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .end local v2    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_1
    return-object v3

    .line 138
    :cond_2
    invoke-interface {p5, v3}, Lio/reactivex/internal/disposables/DisposableContainer;->add(Lio/reactivex/disposables/Disposable;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 139
    return-object v3

    .line 148
    :cond_3
    :try_start_1
    iget-object v4, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v4, v3, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .restart local v2    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    goto :goto_0

    .line 151
    .end local v2    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_0
    move-exception v1

    .line 152
    .local v1, "ex":Ljava/util/concurrent/RejectedExecutionException;
    if-nez p5, :cond_4

    .line 155
    :goto_2
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 153
    :cond_4
    invoke-interface {p5, v3}, Lio/reactivex/internal/disposables/DisposableContainer;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto :goto_2
.end method

.method public scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 6
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "delayTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 63
    new-instance v2, Lio/reactivex/internal/schedulers/ScheduledDirectTask;

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-direct {v2, v3}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;-><init>(Ljava/lang/Runnable;)V

    .line 66
    .local v2, "task":Lio/reactivex/internal/schedulers/ScheduledDirectTask;
    const-wide/16 v4, 0x0

    cmp-long v3, p2, v4

    if-lez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    if-nez v3, :cond_1

    .line 67
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v3, v2}, Ljava/util/concurrent/ScheduledExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 71
    .local v1, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_1
    invoke-virtual {v2, v1}, Lio/reactivex/internal/schedulers/ScheduledDirectTask;->setFuture(Ljava/util/concurrent/Future;)V

    .line 72
    return-object v2

    .line 66
    .end local v1    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 69
    :cond_1
    iget-object v3, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v3, v2, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    goto :goto_1

    .line 73
    .end local v1    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_0
    move-exception v0

    .line 74
    .local v0, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 75
    sget-object v3, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v3
.end method

.method public schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 16
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "initialDelay"    # J
    .param p4, "period"    # J
    .param p6, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 89
    invoke-static/range {p1 .. p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v11

    .line 90
    .local v11, "decoratedRun":Ljava/lang/Runnable;
    const-wide/16 v6, 0x0

    cmp-long v4, p4, v6

    if-lez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    if-nez v4, :cond_3

    .line 92
    new-instance v14, Lio/reactivex/internal/schedulers/InstantPeriodicTask;

    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v14, v11, v4}, Lio/reactivex/internal/schedulers/InstantPeriodicTask;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/ExecutorService;)V

    .line 95
    .local v14, "periodicWrapper":Lio/reactivex/internal/schedulers/InstantPeriodicTask;
    const-wide/16 v6, 0x0

    cmp-long v4, p2, v6

    if-lez v4, :cond_1

    const/4 v4, 0x1

    :goto_1
    if-nez v4, :cond_2

    .line 96
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v4, v14}, Ljava/util/concurrent/ScheduledExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v13

    .line 100
    .local v13, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_2
    invoke-virtual {v14, v13}, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->setFirst(Ljava/util/concurrent/Future;)V

    .line 106
    return-object v14

    .line 90
    .end local v13    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    .end local v14    # "periodicWrapper":Lio/reactivex/internal/schedulers/InstantPeriodicTask;
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 95
    .restart local v14    # "periodicWrapper":Lio/reactivex/internal/schedulers/InstantPeriodicTask;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 98
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    move-wide/from16 v0, p2

    move-object/from16 v2, p6

    invoke-interface {v4, v14, v0, v1, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v13

    .restart local v13    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    goto :goto_2

    .line 101
    .end local v13    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_0
    move-exception v12

    .line 102
    .local v12, "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v12}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 103
    sget-object v4, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v4

    .line 108
    .end local v12    # "ex":Ljava/util/concurrent/RejectedExecutionException;
    .end local v14    # "periodicWrapper":Lio/reactivex/internal/schedulers/InstantPeriodicTask;
    :cond_3
    new-instance v5, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;

    invoke-direct {v5, v11}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;-><init>(Ljava/lang/Runnable;)V

    .line 110
    .local v5, "task":Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    move-wide/from16 v6, p2

    move-wide/from16 v8, p4

    move-object/from16 v10, p6

    invoke-interface/range {v4 .. v10}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v13

    .line 111
    .restart local v13    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {v5, v13}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_1

    .line 112
    return-object v5

    .line 113
    .end local v13    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_1
    move-exception v12

    .line 114
    .restart local v12    # "ex":Ljava/util/concurrent/RejectedExecutionException;
    invoke-static {v12}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 115
    sget-object v4, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v4
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 173
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->disposed:Z

    if-eqz v0, :cond_0

    .line 177
    :goto_0
    return-void

    .line 174
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->disposed:Z

    .line 175
    iget-object v0, p0, Lio/reactivex/internal/schedulers/NewThreadWorker;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    goto :goto_0
.end method
