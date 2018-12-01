.class final Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "SingleZipArray.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleZipArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZipCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4d1e29153b0426a9L


# instance fields
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-TR;>;"
        }
    .end annotation
.end field

.field final observers:[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver",
            "<TT;>;"
        }
    .end annotation
.end field

.field final values:[Ljava/lang/Object;

.field final zipper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;ILio/reactivex/functions/Function;)V
    .locals 3
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TR;>;I",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TR;>;"
    .local p3, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 84
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->actual:Lio/reactivex/SingleObserver;

    .line 85
    iput-object p3, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->zipper:Lio/reactivex/functions/Function;

    .line 86
    new-array v1, p2, [Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;

    .line 87
    .local v1, "o":[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;, "[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 90
    iput-object v1, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;

    .line 91
    new-array v2, p2, [Ljava/lang/Object;

    iput-object v2, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->values:[Ljava/lang/Object;

    .line 92
    return-void

    .line 88
    :cond_0
    new-instance v2, Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;

    invoke-direct {v2, p0, v0}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;-><init>(Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;I)V

    aput-object v2, v1, v0

    .line 87
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public dispose()V
    .locals 5

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    const/4 v4, 0x0

    .line 101
    invoke-virtual {p0, v4}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->getAndSet(I)I

    move-result v4

    if-gtz v4, :cond_1

    .line 106
    :cond_0
    return-void

    .line 102
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;

    .local v0, "-l_1_R":Ljava/lang/Object;
    array-length v1, v0

    .local v1, "-l_2_I":I
    const/4 v2, 0x0

    .local v2, "-l_3_I":I
    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 103
    .local v3, "d":Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver<*>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;->dispose()V

    .line 102
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method disposeExcept(I)V
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 126
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;

    .line 127
    .local v2, "observers":[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;, "[Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver<TT;>;"
    array-length v1, v2

    .line 128
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p1, :cond_0

    .line 131
    add-int/lit8 v0, p1, 0x1

    :goto_1
    if-lt v0, v1, :cond_1

    .line 134
    return-void

    .line 129
    :cond_0
    aget-object v3, v2, v0

    invoke-virtual {v3}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;->dispose()V

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 132
    :cond_1
    aget-object v3, v2, v0

    invoke-virtual {v3}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipSingleObserver;->dispose()V

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method innerError(Ljava/lang/Throwable;I)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;
    .param p2, "index"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    const/4 v0, 0x0

    .line 137
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->getAndSet(I)I

    move-result v0

    if-gtz v0, :cond_0

    .line 141
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 143
    :goto_0
    return-void

    .line 138
    :cond_0
    invoke-virtual {p0, p2}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->disposeExcept(I)V

    .line 139
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method innerSuccess(Ljava/lang/Object;I)V
    .locals 4
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->values:[Ljava/lang/Object;

    aput-object p1, v2, p2

    .line 110
    invoke-virtual {p0}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->decrementAndGet()I

    move-result v2

    if-eqz v2, :cond_0

    .line 123
    :goto_0
    return-void

    .line 114
    :cond_0
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->zipper:Lio/reactivex/functions/Function;

    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->values:[Ljava/lang/Object;

    invoke-interface {v2, v3}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The zipper returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 121
    .local v1, "v":Ljava/lang/Object;, "TR;"
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v2, v1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 115
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :catch_0
    move-exception v0

    .line 116
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 117
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v2, v0}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 118
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator<TT;TR;>;"
    const/4 v0, 0x0

    .line 96
    invoke-virtual {p0}, Lio/reactivex/internal/operators/single/SingleZipArray$ZipCoordinator;->get()I

    move-result v1

    if-lez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
