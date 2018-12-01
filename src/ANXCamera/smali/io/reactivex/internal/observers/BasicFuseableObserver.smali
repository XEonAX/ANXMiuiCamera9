.class public abstract Lio/reactivex/internal/observers/BasicFuseableObserver;
.super Ljava/lang/Object;
.source "BasicFuseableObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/internal/fuseable/QueueDisposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/QueueDisposable",
        "<TR;>;"
    }
.end annotation


# instance fields
.field protected final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TR;>;"
        }
    .end annotation
.end field

.field protected done:Z

.field protected qs:Lio/reactivex/internal/fuseable/QueueDisposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/QueueDisposable",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected s:Lio/reactivex/disposables/Disposable;

.field protected sourceMode:I


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->actual:Lio/reactivex/Observer;

    .line 51
    return-void
.end method


# virtual methods
.method protected afterDownstream()V
    .locals 0

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    return-void
.end method

.method protected beforeDownstream()Z
    .locals 1

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueDisposable;->clear()V

    .line 168
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 152
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 153
    return-void
.end method

.method protected final fail(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    invoke-static {p1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 109
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 110
    invoke-virtual {p0, p1}, Lio/reactivex/internal/observers/BasicFuseableObserver;->onError(Ljava/lang/Throwable;)V

    .line 111
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 157
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 162
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/QueueDisposable;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final offer(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)Z"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    .local p1, "e":Ljava/lang/Object;, "TR;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Should not be called!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 115
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->done:Z

    if-nez v0, :cond_0

    .line 118
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->done:Z

    .line 119
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 120
    return-void

    .line 116
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 95
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->done:Z

    if-nez v0, :cond_0

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->done:Z

    .line 100
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 101
    return-void

    .line 96
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 97
    return-void
.end method

.method public final onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 72
    .end local p1    # "s":Lio/reactivex/disposables/Disposable;
    :cond_0
    :goto_0
    return-void

    .line 59
    .restart local p1    # "s":Lio/reactivex/disposables/Disposable;
    :cond_1
    iput-object p1, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 60
    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-nez v0, :cond_2

    .line 64
    .end local p1    # "s":Lio/reactivex/disposables/Disposable;
    :goto_1
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BasicFuseableObserver;->beforeDownstream()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 68
    invoke-virtual {p0}, Lio/reactivex/internal/observers/BasicFuseableObserver;->afterDownstream()V

    goto :goto_0

    .line 61
    .restart local p1    # "s":Lio/reactivex/disposables/Disposable;
    :cond_2
    check-cast p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    .end local p1    # "s":Lio/reactivex/disposables/Disposable;
    iput-object p1, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    goto :goto_1
.end method

.method protected final transitiveBoundaryFusion(I)I
    .locals 4
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/observers/BasicFuseableObserver;, "Lio/reactivex/internal/observers/BasicFuseableObserver<TT;TR;>;"
    const/4 v3, 0x0

    .line 133
    iget-object v1, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->qs:Lio/reactivex/internal/fuseable/QueueDisposable;

    .line 134
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueDisposable;, "Lio/reactivex/internal/fuseable/QueueDisposable<TT;>;"
    if-nez v1, :cond_1

    .line 143
    :cond_0
    return v3

    .line 135
    :cond_1
    and-int/lit8 v2, p1, 0x4

    if-nez v2, :cond_0

    .line 136
    invoke-interface {v1, p1}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    .line 137
    .local v0, "m":I
    if-nez v0, :cond_2

    .line 140
    :goto_0
    return v0

    .line 138
    :cond_2
    iput v0, p0, Lio/reactivex/internal/observers/BasicFuseableObserver;->sourceMode:I

    goto :goto_0
.end method
