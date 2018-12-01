.class final Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;
.super Ljava/lang/Object;
.source "TrampolineScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/schedulers/TrampolineScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SleepingRunnable"
.end annotation


# instance fields
.field private final execTime:J

.field private final run:Ljava/lang/Runnable;

.field private final worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;J)V
    .locals 1
    .param p1, "run"    # Ljava/lang/Runnable;
    .param p2, "worker"    # Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;
    .param p3, "execTime"    # J

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    iput-object p1, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->run:Ljava/lang/Runnable;

    .line 183
    iput-object p2, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    .line 184
    iput-wide p3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->execTime:J

    .line 185
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 189
    iget-object v7, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    iget-boolean v7, v7, Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;->disposed:Z

    if-eqz v7, :cond_1

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 190
    :cond_1
    iget-object v7, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v8}, Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    .line 191
    .local v4, "t":J
    iget-wide v8, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->execTime:J

    cmp-long v7, v8, v4

    if-gtz v7, :cond_3

    move v7, v3

    :goto_1
    if-nez v7, :cond_2

    .line 192
    iget-wide v8, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->execTime:J

    sub-long v0, v8, v4

    .line 193
    .local v0, "delay":J
    const-wide/16 v8, 0x0

    cmp-long v7, v0, v8

    if-gtz v7, :cond_4

    :goto_2
    if-nez v3, :cond_2

    .line 195
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    .end local v0    # "delay":J
    :cond_2
    iget-object v3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->worker:Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;

    iget-boolean v3, v3, Lio/reactivex/internal/schedulers/TrampolineScheduler$TrampolineWorker;->disposed:Z

    if-nez v3, :cond_0

    .line 205
    iget-object v3, p0, Lio/reactivex/internal/schedulers/TrampolineScheduler$SleepingRunnable;->run:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_3
    move v7, v6

    .line 191
    goto :goto_1

    .restart local v0    # "delay":J
    :cond_4
    move v3, v6

    .line 193
    goto :goto_2

    .line 196
    :catch_0
    move-exception v2

    .line 197
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 198
    invoke-static {v2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 199
    return-void
.end method
