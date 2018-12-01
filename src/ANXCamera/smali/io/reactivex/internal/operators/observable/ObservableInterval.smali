.class public final Lio/reactivex/internal/operators/observable/ObservableInterval;
.super Lio/reactivex/Observable;
.source "ObservableInterval.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/Observable",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final initialDelay:J

.field final period:J

.field final scheduler:Lio/reactivex/Scheduler;

.field final unit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public constructor <init>(JJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V
    .locals 1
    .param p1, "initialDelay"    # J
    .param p3, "period"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lio/reactivex/Scheduler;

    .prologue
    .line 31
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 32
    iput-wide p1, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->initialDelay:J

    .line 33
    iput-wide p3, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->period:J

    .line 34
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->unit:Ljava/util/concurrent/TimeUnit;

    .line 35
    iput-object p6, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->scheduler:Lio/reactivex/Scheduler;

    .line 36
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Long;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;-><init>(Lio/reactivex/Observer;)V

    .line 41
    .local v1, "is":Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;
    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 43
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->scheduler:Lio/reactivex/Scheduler;

    .line 45
    .local v2, "sch":Lio/reactivex/Scheduler;
    instance-of v3, v2, Lio/reactivex/internal/schedulers/TrampolineScheduler;

    if-nez v3, :cond_0

    .line 50
    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->initialDelay:J

    iget-wide v6, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->period:J

    iget-object v8, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->unit:Ljava/util/concurrent/TimeUnit;

    move-object v3, v1

    invoke-virtual/range {v2 .. v8}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v9

    .line 51
    .local v9, "d":Lio/reactivex/disposables/Disposable;
    invoke-virtual {v1, v9}, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;->setResource(Lio/reactivex/disposables/Disposable;)V

    .line 53
    .end local v2    # "sch":Lio/reactivex/Scheduler;
    .end local v9    # "d":Lio/reactivex/disposables/Disposable;
    :goto_0
    return-void

    .line 46
    .restart local v2    # "sch":Lio/reactivex/Scheduler;
    :cond_0
    invoke-virtual {v2}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object v0

    .line 47
    .local v0, "worker":Lio/reactivex/Scheduler$Worker;
    invoke-virtual {v1, v0}, Lio/reactivex/internal/operators/observable/ObservableInterval$IntervalObserver;->setResource(Lio/reactivex/disposables/Disposable;)V

    .line 48
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->initialDelay:J

    .end local v2    # "sch":Lio/reactivex/Scheduler;
    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->period:J

    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableInterval;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method
