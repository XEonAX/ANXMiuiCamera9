.class public final Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;
.super Lio/reactivex/Scheduler$Worker;
.source "ExecutorScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/ExecutorScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ExecutorWorker"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;,
        Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$SequentialDispose;
    }
.end annotation


# instance fields
.field volatile disposed:Z

.field final executor:Ljava/util/concurrent/Executor;

.field final queue:Lio/reactivex/internal/queue/MpscLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/MpscLinkedQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final tasks:Lio/reactivex/disposables/CompositeDisposable;

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 124
    invoke-direct {p0}, Lio/reactivex/Scheduler$Worker;-><init>()V

    .line 120
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 122
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    .line 125
    iput-object p1, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->executor:Ljava/util/concurrent/Executor;

    .line 126
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->queue:Lio/reactivex/internal/queue/MpscLinkedQueue;

    .line 127
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    if-eqz v0, :cond_1

    .line 203
    :cond_0
    :goto_0
    return-void

    .line 197
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    .line 198
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 199
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 200
    iget-object v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->queue:Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 207
    iget-boolean v0, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    return v0
.end method

.method public run()V
    .locals 5

    .prologue
    .line 212
    const/4 v0, 0x1

    .line 213
    .local v0, "missed":I
    iget-object v1, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->queue:Lio/reactivex/internal/queue/MpscLinkedQueue;

    .line 216
    .local v1, "q":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<Ljava/lang/Runnable;>;"
    :cond_0
    iget-boolean v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    if-nez v3, :cond_2

    .line 222
    :cond_1
    invoke-virtual {v1}, Lio/reactivex/internal/queue/MpscLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    .line 223
    .local v2, "run":Ljava/lang/Runnable;
    if-eqz v2, :cond_3

    .line 226
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 228
    iget-boolean v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    if-eqz v3, :cond_1

    .line 229
    invoke-virtual {v1}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 230
    return-void

    .line 217
    .end local v2    # "run":Ljava/lang/Runnable;
    :cond_2
    invoke-virtual {v1}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 218
    return-void

    .line 234
    .restart local v2    # "run":Ljava/lang/Runnable;
    :cond_3
    iget-boolean v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    if-nez v3, :cond_4

    .line 239
    iget-object v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v4, v0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v0

    .line 240
    if-nez v0, :cond_0

    .line 244
    return-void

    .line 235
    :cond_4
    invoke-virtual {v1}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 236
    return-void
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
    .line 132
    iget-boolean v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    if-nez v3, :cond_0

    .line 136
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v1

    .line 137
    .local v1, "decoratedRun":Ljava/lang/Runnable;
    new-instance v0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;

    invoke-direct {v0, v1}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;-><init>(Ljava/lang/Runnable;)V

    .line 139
    .local v0, "br":Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;
    iget-object v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->queue:Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-virtual {v3, v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 141
    iget-object v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v3

    if-eqz v3, :cond_1

    .line 152
    :goto_0
    return-object v0

    .line 133
    .end local v0    # "br":Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;
    .end local v1    # "decoratedRun":Ljava/lang/Runnable;
    :cond_0
    sget-object v3, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v3

    .line 143
    .restart local v0    # "br":Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;
    .restart local v1    # "decoratedRun":Ljava/lang/Runnable;
    :cond_1
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v3, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 144
    :catch_0
    move-exception v2

    .line 145
    .local v2, "ex":Ljava/util/concurrent/RejectedExecutionException;
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    .line 146
    iget-object v3, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->queue:Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-virtual {v3}, Lio/reactivex/internal/queue/MpscLinkedQueue;->clear()V

    .line 147
    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 148
    sget-object v3, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v3
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 10
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
    .line 158
    const-wide/16 v8, 0x0

    cmp-long v7, p2, v8

    if-lez v7, :cond_0

    const/4 v7, 0x1

    :goto_0
    if-nez v7, :cond_1

    .line 159
    invoke-virtual {p0, p1}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    return-object v7

    .line 158
    :cond_0
    const/4 v7, 0x0

    goto :goto_0

    .line 161
    :cond_1
    iget-boolean v7, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    if-nez v7, :cond_2

    .line 166
    new-instance v4, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v4}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    .line 168
    .local v4, "first":Lio/reactivex/internal/disposables/SequentialDisposable;
    new-instance v5, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v5, v4}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>(Lio/reactivex/disposables/Disposable;)V

    .line 170
    .local v5, "mar":Lio/reactivex/internal/disposables/SequentialDisposable;
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v1

    .line 172
    .local v1, "decoratedRun":Ljava/lang/Runnable;
    new-instance v6, Lio/reactivex/internal/schedulers/ScheduledRunnable;

    new-instance v7, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$SequentialDispose;

    invoke-direct {v7, p0, v5, v1}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$SequentialDispose;-><init>(Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;Lio/reactivex/internal/disposables/SequentialDisposable;Ljava/lang/Runnable;)V

    iget-object v8, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v6, v7, v8}, Lio/reactivex/internal/schedulers/ScheduledRunnable;-><init>(Ljava/lang/Runnable;Lio/reactivex/internal/disposables/DisposableContainer;)V

    .line 173
    .local v6, "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    iget-object v7, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->tasks:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v7, v6}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 175
    iget-object v7, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->executor:Ljava/util/concurrent/Executor;

    instance-of v7, v7, Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v7, :cond_3

    .line 185
    sget-object v7, Lio/reactivex/internal/schedulers/ExecutorScheduler;->HELPER:Lio/reactivex/Scheduler;

    invoke-virtual {v7, v6, p2, p3, p4}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 186
    .local v0, "d":Lio/reactivex/disposables/Disposable;
    new-instance v7, Lio/reactivex/internal/schedulers/DisposeOnCancel;

    invoke-direct {v7, v0}, Lio/reactivex/internal/schedulers/DisposeOnCancel;-><init>(Lio/reactivex/disposables/Disposable;)V

    invoke-virtual {v6, v7}, Lio/reactivex/internal/schedulers/ScheduledRunnable;->setFuture(Ljava/util/concurrent/Future;)V

    .line 189
    .end local v0    # "d":Lio/reactivex/disposables/Disposable;
    :goto_1
    invoke-virtual {v4, v6}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 191
    return-object v5

    .line 162
    .end local v1    # "decoratedRun":Ljava/lang/Runnable;
    .end local v4    # "first":Lio/reactivex/internal/disposables/SequentialDisposable;
    .end local v5    # "mar":Lio/reactivex/internal/disposables/SequentialDisposable;
    .end local v6    # "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    :cond_2
    sget-object v7, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v7

    .line 177
    .restart local v1    # "decoratedRun":Ljava/lang/Runnable;
    .restart local v4    # "first":Lio/reactivex/internal/disposables/SequentialDisposable;
    .restart local v5    # "mar":Lio/reactivex/internal/disposables/SequentialDisposable;
    .restart local v6    # "sr":Lio/reactivex/internal/schedulers/ScheduledRunnable;
    :cond_3
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->executor:Ljava/util/concurrent/Executor;

    check-cast v7, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v7, v6, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v3

    .line 178
    .local v3, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {v6, v3}, Lio/reactivex/internal/schedulers/ScheduledRunnable;->setFuture(Ljava/util/concurrent/Future;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 179
    .end local v3    # "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :catch_0
    move-exception v2

    .line 180
    .local v2, "ex":Ljava/util/concurrent/RejectedExecutionException;
    const/4 v7, 0x1

    iput-boolean v7, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;->disposed:Z

    .line 181
    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 182
    sget-object v7, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    return-object v7
.end method
