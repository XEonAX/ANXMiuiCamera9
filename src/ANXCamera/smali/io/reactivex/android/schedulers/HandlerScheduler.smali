.class final Lio/reactivex/android/schedulers/HandlerScheduler;
.super Lio/reactivex/Scheduler;
.source "HandlerScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;,
        Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;
    }
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Handler;)V
    .locals 0
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 27
    invoke-direct {p0}, Lio/reactivex/Scheduler;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/android/schedulers/HandlerScheduler;->handler:Landroid/os/Handler;

    .line 29
    return-void
.end method


# virtual methods
.method public createWorker()Lio/reactivex/Scheduler$Worker;
    .locals 2

    .prologue
    .line 44
    new-instance v0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;

    iget-object v1, p0, Lio/reactivex/android/schedulers/HandlerScheduler;->handler:Landroid/os/Handler;

    invoke-direct {v0, v1}, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;-><init>(Landroid/os/Handler;)V

    return-object v0
.end method

.method public scheduleDirect(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 6
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 33
    if-eqz p1, :cond_0

    .line 34
    if-eqz p4, :cond_1

    .line 36
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    .line 37
    new-instance v0, Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;

    iget-object v1, p0, Lio/reactivex/android/schedulers/HandlerScheduler;->handler:Landroid/os/Handler;

    invoke-direct {v0, v1, p1}, Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;-><init>(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 38
    .local v0, "scheduled":Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;
    iget-object v1, p0, Lio/reactivex/android/schedulers/HandlerScheduler;->handler:Landroid/os/Handler;

    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 39
    return-object v0

    .line 33
    .end local v0    # "scheduled":Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;
    :cond_0
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "run == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_1
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "unit == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
