.class public final Lio/reactivex/internal/operators/single/SingleError;
.super Lio/reactivex/Single;
.source "SingleError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final errorSupplier:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleError;, "Lio/reactivex/internal/operators/single/SingleError<TT;>;"
    .local p1, "errorSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleError;->errorSupplier:Ljava/util/concurrent/Callable;

    .line 29
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleError;, "Lio/reactivex/internal/operators/single/SingleError<TT;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleError;->errorSupplier:Ljava/util/concurrent/Callable;

    invoke-interface {v2}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "Callable returned null throwable. Null values are generally not allowed in 2.x operators and sources."

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .local v1, "error":Ljava/lang/Throwable;
    :goto_0
    invoke-static {v1, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    .line 43
    return-void

    .line 37
    .end local v1    # "error":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 39
    move-object v1, v0

    .restart local v1    # "error":Ljava/lang/Throwable;
    goto :goto_0
.end method
