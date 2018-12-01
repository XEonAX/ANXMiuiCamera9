.class final Lio/reactivex/Scheduler$Worker$PeriodicTask;
.super Ljava/lang/Object;
.source "Scheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/Scheduler$Worker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "PeriodicTask"
.end annotation


# instance fields
.field count:J

.field final decoratedRun:Ljava/lang/Runnable;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation
.end field

.field lastNowNanoseconds:J

.field final periodInNanoseconds:J

.field final sd:Lio/reactivex/internal/disposables/SequentialDisposable;
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation
.end field

.field startInNanoseconds:J

.field final synthetic this$0:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/Scheduler$Worker;JLjava/lang/Runnable;JLio/reactivex/internal/disposables/SequentialDisposable;J)V
    .locals 0
    .param p1, "this$0"    # Lio/reactivex/Scheduler$Worker;
    .param p2, "firstStartInNanoseconds"    # J
    .param p4, "decoratedRun"    # Ljava/lang/Runnable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p5, "firstNowNanoseconds"    # J
    .param p7, "sd"    # Lio/reactivex/internal/disposables/SequentialDisposable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .param p8, "periodInNanoseconds"    # J

    .prologue
    .line 362
    iput-object p1, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->this$0:Lio/reactivex/Scheduler$Worker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 363
    iput-object p4, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->decoratedRun:Ljava/lang/Runnable;

    .line 364
    iput-object p7, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 365
    iput-wide p8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    .line 366
    iput-wide p5, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    .line 367
    iput-wide p2, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->startInNanoseconds:J

    .line 368
    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 372
    iget-object v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->decoratedRun:Ljava/lang/Runnable;

    invoke-interface {v8}, Ljava/lang/Runnable;->run()V

    .line 374
    iget-object v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v8}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 396
    :goto_0
    return-void

    .line 378
    :cond_0
    iget-object v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->this$0:Lio/reactivex/Scheduler$Worker;

    sget-object v9, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v9}, Lio/reactivex/Scheduler$Worker;->now(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    .line 380
    .local v4, "nowNanoseconds":J
    sget-wide v8, Lio/reactivex/Scheduler;->CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J

    add-long/2addr v8, v4

    iget-wide v10, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_2

    move v8, v6

    :goto_1
    if-nez v8, :cond_1

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    iget-wide v10, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    add-long/2addr v8, v10

    sget-wide v10, Lio/reactivex/Scheduler;->CLOCK_DRIFT_TOLERANCE_NANOSECONDS:J

    add-long/2addr v8, v10

    cmp-long v8, v4, v8

    if-gez v8, :cond_3

    :goto_2
    if-nez v6, :cond_4

    .line 382
    :cond_1
    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    add-long v2, v4, v6

    .line 387
    .local v2, "nextTick":J
    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    add-long/2addr v8, v12

    iput-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    mul-long/2addr v6, v8

    sub-long v6, v2, v6

    iput-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->startInNanoseconds:J

    .line 391
    :goto_3
    iput-wide v4, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->lastNowNanoseconds:J

    .line 393
    sub-long v0, v2, v4

    .line 394
    .local v0, "delay":J
    iget-object v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->sd:Lio/reactivex/internal/disposables/SequentialDisposable;

    iget-object v7, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->this$0:Lio/reactivex/Scheduler$Worker;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, p0, v0, v1, v8}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v7

    invoke-virtual {v6, v7}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    goto :goto_0

    .end local v0    # "delay":J
    .end local v2    # "nextTick":J
    :cond_2
    move v8, v7

    .line 380
    goto :goto_1

    :cond_3
    move v6, v7

    goto :goto_2

    .line 389
    :cond_4
    iget-wide v6, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->startInNanoseconds:J

    iget-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    add-long/2addr v8, v12

    iput-wide v8, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->count:J

    iget-wide v10, p0, Lio/reactivex/Scheduler$Worker$PeriodicTask;->periodInNanoseconds:J

    mul-long/2addr v8, v10

    add-long v2, v6, v8

    .restart local v2    # "nextTick":J
    goto :goto_3
.end method
