.class final Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;
.super Ljava/lang/Object;
.source "ObservablePublish.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservablePublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PublishObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

.field static final TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;


# instance fields
.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field final shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 127
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 129
    new-array v0, v1, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    .local p1, "current":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    .line 143
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 144
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 146
    return-void
.end method


# virtual methods
.method add(Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    .local p1, "producer":Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    const/4 v4, 0x0

    .line 209
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 212
    .local v0, "c":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    sget-object v3, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    if-eq v0, v3, :cond_1

    .line 216
    array-length v1, v0

    .line 218
    .local v1, "len":I
    add-int/lit8 v3, v1, 0x1

    new-array v2, v3, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 219
    .local v2, "u":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    invoke-static {v0, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 220
    aput-object p1, v2, v1

    .line 222
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 223
    const/4 v3, 0x1

    return v3

    .line 213
    .end local v1    # "len":I
    .end local v2    # "u":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    :cond_1
    return v4
.end method

.method public dispose()V
    .locals 3

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    if-ne v1, v2, :cond_1

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 152
    :cond_1
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 153
    .local v0, "ps":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;
    sget-object v1, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    if-eq v0, v1, :cond_0

    .line 154
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onComplete()V
    .locals 6

    .prologue
    .line 193
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v5, 0x0

    invoke-virtual {v4, p0, v5}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .local v0, "-l_1_R":Ljava/lang/Object;
    array-length v1, v0

    .local v1, "-l_2_I":I
    const/4 v2, 0x0

    .local v2, "-l_3_I":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 197
    return-void

    .line 194
    :cond_0
    aget-object v3, v0, v2

    .line 195
    .local v3, "inner":Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;->child:Lio/reactivex/Observer;

    invoke-interface {v4}, Lio/reactivex/Observer;->onComplete()V

    .line 194
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 180
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v6, 0x0

    invoke-virtual {v5, p0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 181
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->TERMINATED:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 182
    .local v3, "a":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    array-length v5, v3

    if-nez v5, :cond_1

    .line 187
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 189
    :cond_0
    return-void

    .line 183
    :cond_1
    move-object v0, v3

    .local v0, "-l_3_R":Ljava/lang/Object;
    array-length v1, v3

    .local v1, "-l_4_I":I
    const/4 v2, 0x0

    .local v2, "-l_5_I":I
    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v4, v3, v2

    .line 184
    .local v4, "inner":Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    iget-object v5, v4, Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;->child:Lio/reactivex/Observer;

    invoke-interface {v5, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 183
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .local v0, "-l_2_R":Ljava/lang/Object;
    array-length v1, v0

    .local v1, "-l_3_I":I
    const/4 v2, 0x0

    .local v2, "-l_4_I":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 176
    return-void

    .line 173
    :cond_0
    aget-object v3, v0, v2

    .line 174
    .local v3, "inner":Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;->child:Lio/reactivex/Observer;

    invoke-interface {v4, p1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 173
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 169
    return-void
.end method

.method remove(Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;, "Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver<TT;>;"
    .local p1, "producer":Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    const/4 v7, 0x0

    .line 239
    :cond_0
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 241
    .local v0, "c":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    array-length v3, v0

    .line 242
    .local v3, "len":I
    if-eqz v3, :cond_1

    .line 247
    const/4 v2, -0x1

    .line 248
    .local v2, "j":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v3, :cond_2

    .line 255
    :goto_1
    if-ltz v2, :cond_4

    .line 262
    const/4 v5, 0x1

    if-eq v3, v5, :cond_5

    .line 266
    add-int/lit8 v5, v3, -0x1

    new-array v4, v5, [Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .line 268
    .local v4, "u":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    invoke-static {v0, v7, v4, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    add-int/lit8 v5, v2, 0x1

    sub-int v6, v3, v2

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v4, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 273
    :goto_2
    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 274
    return-void

    .line 243
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v4    # "u":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    :cond_1
    return-void

    .line 249
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    :cond_2
    aget-object v5, v0, v1

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 248
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 250
    :cond_3
    move v2, v1

    goto :goto_1

    .line 256
    :cond_4
    return-void

    .line 263
    :cond_5
    sget-object v4, Lio/reactivex/internal/operators/observable/ObservablePublish$PublishObserver;->EMPTY:[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;

    .restart local v4    # "u":[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable;, "[Lio/reactivex/internal/operators/observable/ObservablePublish$InnerDisposable<TT;>;"
    goto :goto_2
.end method
