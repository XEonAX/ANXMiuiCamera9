.class public final Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;
.super Lio/reactivex/internal/schedulers/AbstractDirectTask;
.source "ScheduledDirectPeriodicTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final serialVersionUID:J = 0x1924f211b909b42fL


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lio/reactivex/internal/schedulers/AbstractDirectTask;-><init>(Ljava/lang/Runnable;)V

    .line 32
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 36
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iput-object v2, p0, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->runner:Ljava/lang/Thread;

    .line 39
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->runnable:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :goto_0
    iput-object v3, p0, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->runner:Ljava/lang/Thread;

    .line 47
    return-void

    .line 40
    :catch_0
    move-exception v1

    .line 41
    .local v1, "ex":Ljava/lang/Throwable;
    :try_start_1
    sget-object v2, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->FINISHED:Ljava/util/concurrent/FutureTask;

    invoke-virtual {p0, v2}, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->lazySet(Ljava/lang/Object;)V

    .line 42
    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 45
    .end local v1    # "ex":Ljava/lang/Throwable;
    :catchall_0
    move-exception v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    iput-object v3, p0, Lio/reactivex/internal/schedulers/ScheduledDirectPeriodicTask;->runner:Ljava/lang/Thread;

    throw v0
.end method
