.class final Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ObservableCreate.java"

# interfaces
.implements Lio/reactivex/ObservableEmitter;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CreateEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/ObservableEmitter",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2faaddcf795eb55bL


# instance fields
.field final observer:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 57
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->observer:Lio/reactivex/Observer;

    .line 58
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 122
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 123
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 127
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    :goto_0
    return-void

    .line 98
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->observer:Lio/reactivex/Observer;

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->dispose()V

    goto :goto_0

    :catchall_0
    move-exception v0

    .local v0, "-l_1_R":Ljava/lang/Object;
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->dispose()V

    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->tryOnError(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    :goto_0
    return-void

    .line 74
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-eqz p1, :cond_0

    .line 66
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    :goto_0
    return-void

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->onError(Ljava/lang/Throwable;)V

    .line 64
    return-void

    .line 67
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->observer:Lio/reactivex/Observer;

    invoke-interface {v0, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public tryOnError(Ljava/lang/Throwable;)Z
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;, "Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter<TT;>;"
    const/4 v2, 0x0

    .line 80
    if-eqz p1, :cond_0

    .line 83
    :goto_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    return v2

    .line 81
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v1, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .restart local p1    # "t":Ljava/lang/Throwable;
    goto :goto_0

    .line 85
    :cond_1
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->observer:Lio/reactivex/Observer;

    invoke-interface {v1, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->dispose()V

    .line 89
    const/4 v1, 0x1

    return v1

    .line 87
    :catchall_0
    move-exception v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableCreate$CreateEmitter;->dispose()V

    throw v0
.end method
