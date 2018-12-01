.class public final Lio/reactivex/internal/operators/completable/CompletableSubscribeOn;
.super Lio/reactivex/Completable;
.source "CompletableSubscribeOn.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableSubscribeOn$SubscribeOnObserver;
    }
.end annotation


# instance fields
.field final scheduler:Lio/reactivex/Scheduler;

.field final source:Lio/reactivex/CompletableSource;


# direct methods
.method public constructor <init>(Lio/reactivex/CompletableSource;Lio/reactivex/Scheduler;)V
    .locals 0
    .param p1, "source"    # Lio/reactivex/CompletableSource;
    .param p2, "scheduler"    # Lio/reactivex/Scheduler;

    .prologue
    .line 27
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn;->source:Lio/reactivex/CompletableSource;

    .line 29
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn;->scheduler:Lio/reactivex/Scheduler;

    .line 30
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 3
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 35
    new-instance v1, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn$SubscribeOnObserver;

    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn;->source:Lio/reactivex/CompletableSource;

    invoke-direct {v1, p1, v2}, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn$SubscribeOnObserver;-><init>(Lio/reactivex/CompletableObserver;Lio/reactivex/CompletableSource;)V

    .line 36
    .local v1, "parent":Lio/reactivex/internal/operators/completable/CompletableSubscribeOn$SubscribeOnObserver;
    invoke-interface {p1, v1}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 38
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn;->scheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v2, v1}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    .line 40
    .local v0, "f":Lio/reactivex/disposables/Disposable;
    iget-object v2, v1, Lio/reactivex/internal/operators/completable/CompletableSubscribeOn$SubscribeOnObserver;->task:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v2, v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    .line 42
    return-void
.end method
