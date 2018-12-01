.class public final Lio/reactivex/internal/observers/LambdaObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "LambdaObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;",
        "Lio/reactivex/observers/LambdaConsumerIntrospection;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x64a12a8486b15cccL


# instance fields
.field final onComplete:Lio/reactivex/functions/Action;

.field final onError:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field final onNext:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final onSubscribe:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Consumer;)V
    .locals 0
    .param p3, "onComplete"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    .local p1, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    .local p4, "onSubscribe":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Lio/reactivex/disposables/Disposable;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/observers/LambdaObserver;->onNext:Lio/reactivex/functions/Consumer;

    .line 41
    iput-object p2, p0, Lio/reactivex/internal/observers/LambdaObserver;->onError:Lio/reactivex/functions/Consumer;

    .line 42
    iput-object p3, p0, Lio/reactivex/internal/observers/LambdaObserver;->onComplete:Lio/reactivex/functions/Action;

    .line 43
    iput-object p4, p0, Lio/reactivex/internal/observers/LambdaObserver;->onSubscribe:Lio/reactivex/functions/Consumer;

    .line 44
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 101
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/LambdaObserver;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onComplete()V
    .locals 2

    .prologue
    .line 87
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/LambdaObserver;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    :goto_0
    return-void

    .line 88
    :cond_0
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {p0, v1}, Lio/reactivex/internal/observers/LambdaObserver;->lazySet(Ljava/lang/Object;)V

    .line 90
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/observers/LambdaObserver;->onComplete:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 93
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    const/4 v3, 0x0

    .line 74
    invoke-virtual {p0}, Lio/reactivex/internal/observers/LambdaObserver;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    :goto_0
    return-void

    .line 75
    :cond_0
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {p0, v1}, Lio/reactivex/internal/observers/LambdaObserver;->lazySet(Ljava/lang/Object;)V

    .line 77
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/observers/LambdaObserver;->onError:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 80
    new-instance v1, Lio/reactivex/exceptions/CompositeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Throwable;

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-direct {v1, v2}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-static {v1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

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
    .line 61
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lio/reactivex/internal/observers/LambdaObserver;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    :goto_0
    return-void

    .line 63
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/observers/LambdaObserver;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 66
    invoke-virtual {p0}, Lio/reactivex/internal/observers/LambdaObserver;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 67
    invoke-virtual {p0, v0}, Lio/reactivex/internal/observers/LambdaObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/observers/LambdaObserver;, "Lio/reactivex/internal/observers/LambdaObserver<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 57
    :goto_0
    return-void

    .line 50
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/observers/LambdaObserver;->onSubscribe:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p0}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 53
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 54
    invoke-virtual {p0, v0}, Lio/reactivex/internal/observers/LambdaObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
