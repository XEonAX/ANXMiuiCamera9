.class final Lio/reactivex/internal/schedulers/InstantPeriodicTask;
.super Ljava/lang/Object;
.source "InstantPeriodicTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Void;",
        ">;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final CANCELLED:Ljava/util/concurrent/FutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/FutureTask",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final executor:Ljava/util/concurrent/ExecutorService;

.field final first:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/concurrent/Future",
            "<*>;>;"
        }
    .end annotation
.end field

.field final rest:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/concurrent/Future",
            "<*>;>;"
        }
    .end annotation
.end field

.field runner:Ljava/lang/Thread;

.field final task:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 41
    new-instance v0, Ljava/util/concurrent/FutureTask;

    sget-object v1, Lio/reactivex/internal/functions/Functions;->EMPTY_RUNNABLE:Ljava/lang/Runnable;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    sput-object v0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    return-void
.end method

.method constructor <init>(Ljava/lang/Runnable;Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;
    .param p2, "executor"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->task:Ljava/lang/Runnable;

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->first:Ljava/util/concurrent/atomic/AtomicReference;

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->rest:Ljava/util/concurrent/atomic/AtomicReference;

    .line 48
    iput-object p2, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->executor:Ljava/util/concurrent/ExecutorService;

    .line 49
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 54
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    :try_start_1
    iget-object v2, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->task:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 57
    iget-object v2, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v2, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->setRest(Ljava/util/concurrent/Future;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    :goto_0
    iput-object v3, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;

    .line 64
    return-object v3

    .line 58
    :catch_0
    move-exception v1

    .line 59
    .local v1, "ex":Ljava/lang/Throwable;
    :try_start_2
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 62
    .end local v1    # "ex":Ljava/lang/Throwable;
    :catchall_0
    move-exception v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    iput-object v3, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;

    throw v0
.end method

.method public dispose()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->first:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v4, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    .line 70
    .local v0, "current":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    if-nez v0, :cond_2

    .line 73
    :cond_0
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->rest:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v4, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    check-cast v0, Ljava/util/concurrent/Future;

    .line 74
    .restart local v0    # "current":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    if-nez v0, :cond_4

    .line 77
    :cond_1
    :goto_1
    return-void

    .line 70
    :cond_2
    sget-object v1, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    if-eq v0, v1, :cond_0

    .line 71
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    if-ne v1, v4, :cond_3

    move v1, v2

    :goto_2
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_0

    :cond_3
    move v1, v3

    goto :goto_2

    .line 74
    :cond_4
    sget-object v1, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    if-eq v0, v1, :cond_1

    .line 75
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    if-ne v1, v4, :cond_5

    :goto_3
    invoke-interface {v0, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_1

    :cond_5
    move v2, v3

    goto :goto_3
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->first:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method setFirst(Ljava/util/concurrent/Future;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    const/4 v2, 0x0

    .line 86
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->first:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    .line 87
    .local v0, "current":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    sget-object v1, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    if-eq v0, v1, :cond_1

    .line 90
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->first:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 91
    return-void

    .line 88
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    if-ne v1, v3, :cond_2

    move v1, v2

    :goto_1
    invoke-interface {p1, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_1
.end method

.method setRest(Ljava/util/concurrent/Future;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "f":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    const/4 v2, 0x0

    .line 98
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->rest:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Future;

    .line 99
    .local v0, "current":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    sget-object v1, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->CANCELLED:Ljava/util/concurrent/FutureTask;

    if-eq v0, v1, :cond_1

    .line 102
    :goto_0
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->rest:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    return-void

    .line 100
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/schedulers/InstantPeriodicTask;->runner:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    if-ne v1, v3, :cond_2

    move v1, v2

    :goto_1
    invoke-interface {p1, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_1
.end method
