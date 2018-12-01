.class abstract Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "FlowableCreate.java"

# interfaces
.implements Lio/reactivex/FlowableEmitter;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BaseEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicLong;",
        "Lio/reactivex/FlowableEmitter",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x65ac35ee8a56a4bfL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final serial:Lio/reactivex/internal/disposables/SequentialDisposable;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 248
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->actual:Lorg/reactivestreams/Subscriber;

    .line 249
    new-instance v0, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    .line 250
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 1

    .prologue
    .line 297
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 298
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onUnsubscribed()V

    .line 299
    return-void
.end method

.method protected complete()V
    .locals 2

    .prologue
    .line 258
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 262
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 266
    return-void

    .line 259
    :cond_0
    return-void

    .line 264
    :catchall_0
    move-exception v0

    .local v0, "-l_1_R":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    throw v0
.end method

.method protected error(Ljava/lang/Throwable;)Z
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    const/4 v2, 0x0

    .line 281
    if-eqz p1, :cond_0

    .line 284
    :goto_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 288
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    .line 292
    const/4 v1, 0x1

    return v1

    .line 282
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string/jumbo v1, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0

    .line 285
    :cond_1
    return v2

    .line 290
    :catchall_0
    move-exception v0

    .local v0, "-l_2_R":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v1}, Lio/reactivex/internal/disposables/SequentialDisposable;->dispose()V

    throw v0
.end method

.method public final isCancelled()Z
    .locals 1

    .prologue
    .line 307
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->serial:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->isDisposed()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 0

    .prologue
    .line 254
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->complete()V

    .line 255
    return-void
.end method

.method public final onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 270
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->tryOnError(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method onRequested()V
    .locals 0

    .prologue
    .line 320
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    return-void
.end method

.method onUnsubscribed()V
    .locals 0

    .prologue
    .line 303
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    return-void
.end method

.method public final request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 312
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    :goto_0
    return-void

    .line 313
    :cond_0
    invoke-static {p0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 314
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->onRequested()V

    goto :goto_0
.end method

.method public tryOnError(Ljava/lang/Throwable;)Z
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 277
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;->error(Ljava/lang/Throwable;)Z

    move-result v0

    return v0
.end method
