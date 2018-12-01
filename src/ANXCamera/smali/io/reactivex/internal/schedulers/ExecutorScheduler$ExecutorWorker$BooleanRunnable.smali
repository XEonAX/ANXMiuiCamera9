.class final Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;
.super Ljava/util/concurrent/atomic/AtomicBoolean;
.source "ExecutorScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BooleanRunnable"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x219a85f0c5b2daecL


# instance fields
.field final actual:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "actual"    # Ljava/lang/Runnable;

    .prologue
    .line 251
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 252
    iput-object p1, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->actual:Ljava/lang/Runnable;

    .line 253
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 269
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->lazySet(Z)V

    .line 270
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 274
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->get()Z

    move-result v0

    return v0
.end method

.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 257
    invoke-virtual {p0}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->get()Z

    move-result v1

    if-nez v1, :cond_0

    .line 261
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->actual:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    invoke-virtual {p0, v2}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->lazySet(Z)V

    .line 265
    return-void

    .line 258
    :cond_0
    return-void

    .line 263
    :catchall_0
    move-exception v0

    .local v0, "-l_1_R":Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lio/reactivex/internal/schedulers/ExecutorScheduler$ExecutorWorker$BooleanRunnable;->lazySet(Z)V

    throw v0
.end method
