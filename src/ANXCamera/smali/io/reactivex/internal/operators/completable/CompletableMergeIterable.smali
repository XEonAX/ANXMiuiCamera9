.class public final Lio/reactivex/internal/operators/completable/CompletableMergeIterable;
.super Lio/reactivex/Completable;
.source "CompletableMergeIterable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;
    }
.end annotation


# instance fields
.field final sources:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lio/reactivex/CompletableSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lio/reactivex/CompletableSource;>;"
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 29
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableMergeIterable;->sources:Ljava/lang/Iterable;

    .line 30
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 9
    .param p1, "s"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 34
    new-instance v4, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v4}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    .line 36
    .local v4, "set":Lio/reactivex/disposables/CompositeDisposable;
    invoke-interface {p1, v4}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 41
    :try_start_0
    iget-object v7, p0, Lio/reactivex/internal/operators/completable/CompletableMergeIterable;->sources:Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const-string/jumbo v8, "The source iterator returned is null"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    new-instance v6, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 50
    .local v6, "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    new-instance v5, Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;

    invoke-direct {v5, p1, v4, v6}, Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;-><init>(Lio/reactivex/CompletableObserver;Lio/reactivex/disposables/CompositeDisposable;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 52
    .local v5, "shared":Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;
    :goto_0
    invoke-virtual {v4}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v7

    if-nez v7, :cond_0

    .line 58
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    .line 66
    .local v0, "b":Z
    if-eqz v0, :cond_3

    .line 70
    invoke-virtual {v4}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v7

    if-nez v7, :cond_1

    .line 77
    :try_start_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    const-string/jumbo v8, "The iterator returned a null CompletableSource"

    invoke-static {v7, v8}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/CompletableSource;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 85
    .local v1, "c":Lio/reactivex/CompletableSource;
    invoke-virtual {v4}, Lio/reactivex/disposables/CompositeDisposable;->isDisposed()Z

    move-result v7

    if-nez v7, :cond_2

    .line 89
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 91
    invoke-interface {v1, v5}, Lio/reactivex/CompletableSource;->subscribe(Lio/reactivex/CompletableObserver;)V

    goto :goto_0

    .line 42
    .end local v0    # "b":Z
    .end local v1    # "c":Lio/reactivex/CompletableSource;
    .end local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    .end local v5    # "shared":Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;
    .end local v6    # "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    :catch_0
    move-exception v2

    .line 43
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 44
    invoke-interface {p1, v2}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 45
    return-void

    .line 53
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/CompletableSource;>;"
    .restart local v5    # "shared":Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;
    .restart local v6    # "wip":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_0
    return-void

    .line 59
    :catch_1
    move-exception v2

    .line 60
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 61
    invoke-virtual {v4}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 62
    invoke-virtual {v5, v2}, Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 63
    return-void

    .line 71
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_1
    return-void

    .line 78
    :catch_2
    move-exception v2

    .line 79
    .restart local v2    # "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 80
    invoke-virtual {v4}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 81
    invoke-virtual {v5, v2}, Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 82
    return-void

    .line 86
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v1    # "c":Lio/reactivex/CompletableSource;
    :cond_2
    return-void

    .line 94
    .end local v1    # "c":Lio/reactivex/CompletableSource;
    :cond_3
    invoke-virtual {v5}, Lio/reactivex/internal/operators/completable/CompletableMergeIterable$MergeCompletableObserver;->onComplete()V

    .line 95
    return-void
.end method
