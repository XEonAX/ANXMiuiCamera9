.class final Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;
.super Lio/reactivex/internal/observers/BasicFuseableObserver;
.source "ObservableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MapObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicFuseableObserver",
        "<TT;TU;>;"
    }
.end annotation


# instance fields
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TU;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TU;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;, "Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver<TT;TU;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TU;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/observers/BasicFuseableObserver;-><init>(Lio/reactivex/Observer;)V

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->mapper:Lio/reactivex/functions/Function;

    .line 43
    return-void
.end method


# virtual methods
.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;, "Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->done:Z

    if-nez v2, :cond_0

    .line 51
    iget v2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->sourceMode:I

    if-nez v2, :cond_1

    .line 59
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper function returned a null value."

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 64
    .local v1, "v":Ljava/lang/Object;, "TU;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v2, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 65
    return-void

    .line 48
    .end local v1    # "v":Ljava/lang/Object;, "TU;"
    :cond_0
    return-void

    .line 52
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->actual:Lio/reactivex/Observer;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 53
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->fail(Ljava/lang/Throwable;)V

    .line 62
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;, "Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver<TT;TU;>;"
    const/4 v1, 0x0

    .line 75
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/QueueDisposable;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 76
    .local v0, "t":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v1, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "The mapper function returned a null value."

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;, "Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver<TT;TU;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableMap$MapObserver;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method
