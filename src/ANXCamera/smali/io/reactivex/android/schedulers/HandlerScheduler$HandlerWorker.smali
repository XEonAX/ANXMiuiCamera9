.class final Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;
.super Lio/reactivex/Scheduler$Worker;
.source "HandlerScheduler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/android/schedulers/HandlerScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HandlerWorker"
.end annotation


# instance fields
.field private volatile disposed:Z

.field private final handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Handler;)V
    .locals 0
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 52
    invoke-direct {p0}, Lio/reactivex/Scheduler$Worker;-><init>()V

    .line 53
    iput-object p1, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->handler:Landroid/os/Handler;

    .line 54
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->disposed:Z

    .line 86
    iget-object v0, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 87
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 91
    iget-boolean v0, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->disposed:Z

    return v0
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;
    .locals 8
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 58
    if-eqz p1, :cond_0

    .line 59
    if-eqz p4, :cond_1

    .line 61
    iget-boolean v2, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->disposed:Z

    if-nez v2, :cond_2

    .line 65
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSchedule(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    .line 67
    new-instance v1, Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;

    iget-object v2, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->handler:Landroid/os/Handler;

    invoke-direct {v1, v2, p1}, Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;-><init>(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 69
    .local v1, "scheduled":Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;
    iget-object v2, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->handler:Landroid/os/Handler;

    invoke-static {v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    move-result-object v0

    .line 70
    .local v0, "message":Landroid/os/Message;
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 72
    iget-object v2, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->handler:Landroid/os/Handler;

    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-virtual {v2, v0, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 75
    iget-boolean v2, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->disposed:Z

    if-nez v2, :cond_3

    .line 80
    return-object v1

    .line 58
    .end local v0    # "message":Landroid/os/Message;
    .end local v1    # "scheduled":Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;
    :cond_0
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "run == null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 59
    :cond_1
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "unit == null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 62
    :cond_2
    invoke-static {}, Lio/reactivex/disposables/Disposables;->disposed()Lio/reactivex/disposables/Disposable;

    move-result-object v2

    return-object v2

    .line 76
    .restart local v0    # "message":Landroid/os/Message;
    .restart local v1    # "scheduled":Lio/reactivex/android/schedulers/HandlerScheduler$ScheduledRunnable;
    :cond_3
    iget-object v2, p0, Lio/reactivex/android/schedulers/HandlerScheduler$HandlerWorker;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 77
    invoke-static {}, Lio/reactivex/disposables/Disposables;->disposed()Lio/reactivex/disposables/Disposable;

    move-result-object v2

    return-object v2
.end method
