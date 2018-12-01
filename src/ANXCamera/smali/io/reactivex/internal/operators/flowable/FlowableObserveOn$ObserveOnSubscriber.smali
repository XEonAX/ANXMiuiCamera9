.class final Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;
.super Lio/reactivex/internal/operators/flowable/FlowableObserveOn$BaseObserveOnSubscriber;
.source "FlowableObserveOn.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableObserveOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ObserveOnSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$BaseObserveOnSubscriber",
        "<TT;>;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3f1a97e8f84a341aL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/Scheduler$Worker;ZI)V
    .locals 0
    .param p2, "worker"    # Lio/reactivex/Scheduler$Worker;
    .param p3, "delayError"    # Z
    .param p4, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            "ZI)V"
        }
    .end annotation

    .prologue
    .line 254
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p2, p3, p4}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$BaseObserveOnSubscriber;-><init>(Lio/reactivex/Scheduler$Worker;ZI)V

    .line 255
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 256
    return-void
.end method


# virtual methods
.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 5
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber<TT;>;"
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 260
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v2, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 295
    :goto_0
    return-void

    .line 261
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 263
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-nez v2, :cond_2

    .line 289
    :cond_1
    new-instance v2, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->prefetch:I

    invoke-direct {v2, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 291
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 293
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 265
    check-cast v0, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 267
    .local v0, "f":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    const/4 v2, 0x7

    invoke-interface {v0, v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v1

    .line 269
    .local v1, "m":I
    if-eq v1, v3, :cond_3

    .line 277
    if-ne v1, v4, :cond_1

    .line 278
    iput v4, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->sourceMode:I

    .line 279
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 281
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 283
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 285
    return-void

    .line 270
    :cond_3
    iput v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->sourceMode:I

    .line 271
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 272
    iput-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->done:Z

    .line 274
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 275
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
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
    .line 464
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber<TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v3}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v2

    .line 465
    .local v2, "v":Ljava/lang/Object;, "TT;"
    if-nez v2, :cond_1

    .line 474
    :cond_0
    :goto_0
    return-object v2

    .line 465
    :cond_1
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->sourceMode:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 466
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    const-wide/16 v6, 0x1

    add-long v0, v4, v6

    .line 467
    .local v0, "p":J
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->limit:I

    int-to-long v4, v3

    cmp-long v3, v0, v4

    if-nez v3, :cond_2

    .line 468
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    .line 469
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 471
    :cond_2
    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    goto :goto_0
.end method

.method runAsync()V
    .locals 18

    .prologue
    .line 362
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber<TT;>;"
    const/4 v8, 0x1

    .line 364
    .local v8, "missed":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 365
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 367
    .local v9, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    move-object/from16 v0, p0

    iget-wide v4, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    .line 371
    .local v4, "e":J
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v10

    .line 373
    .local v10, "r":J
    :cond_1
    :goto_1
    cmp-long v14, v4, v10

    if-eqz v14, :cond_5

    .line 374
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->done:Z

    .line 378
    .local v3, "d":Z
    :try_start_0
    invoke-interface {v9}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v12

    .line 390
    .local v12, "v":Ljava/lang/Object;, "TT;"
    if-eqz v12, :cond_3

    const/4 v6, 0x0

    .line 392
    .local v6, "empty":Z
    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v6, v2}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 396
    if-nez v6, :cond_5

    .line 400
    invoke-interface {v2, v12}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 402
    const-wide/16 v14, 0x1

    add-long/2addr v4, v14

    .line 403
    move-object/from16 v0, p0

    iget v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->limit:I

    int-to-long v14, v14

    cmp-long v14, v4, v14

    if-nez v14, :cond_1

    .line 404
    const-wide v14, 0x7fffffffffffffffL

    cmp-long v14, v10, v14

    if-eqz v14, :cond_2

    .line 405
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v0, v4

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v10

    .line 407
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v14, v4, v5}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 408
    const-wide/16 v4, 0x0

    goto :goto_1

    .line 379
    .end local v6    # "empty":Z
    .end local v12    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v7

    .line 380
    .local v7, "ex":Ljava/lang/Throwable;
    invoke-static {v7}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 382
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v14}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 383
    invoke-interface {v9}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 385
    invoke-interface {v2, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 386
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v14}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 387
    return-void

    .line 390
    .end local v7    # "ex":Ljava/lang/Throwable;
    .restart local v12    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    const/4 v6, 0x1

    goto :goto_2

    .line 393
    .restart local v6    # "empty":Z
    :cond_4
    return-void

    .line 412
    .end local v3    # "d":Z
    .end local v6    # "empty":Z
    .end local v12    # "v":Ljava/lang/Object;, "TT;"
    :cond_5
    cmp-long v14, v4, v10

    if-nez v14, :cond_6

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->done:Z

    invoke-interface {v9}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15, v2}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 416
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->get()I

    move-result v13

    .line 417
    .local v13, "w":I
    if-eq v8, v13, :cond_8

    .line 424
    move v8, v13

    goto/16 :goto_0

    .line 413
    .end local v13    # "w":I
    :cond_7
    return-void

    .line 418
    .restart local v13    # "w":I
    :cond_8
    move-object/from16 v0, p0

    iput-wide v4, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    .line 419
    neg-int v14, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->addAndGet(I)I

    move-result v8

    .line 420
    if-nez v8, :cond_0

    .line 427
    return-void
.end method

.method runBackfused()V
    .locals 5

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber<TT;>;"
    const/4 v4, 0x0

    .line 431
    const/4 v2, 0x1

    .line 435
    .local v2, "missed":I
    :cond_0
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->cancelled:Z

    if-nez v3, :cond_1

    .line 439
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->done:Z

    .line 441
    .local v0, "d":Z
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v4}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 443
    if-nez v0, :cond_2

    .line 454
    neg-int v3, v2

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->addAndGet(I)I

    move-result v2

    .line 455
    if-nez v2, :cond_0

    .line 459
    return-void

    .line 436
    .end local v0    # "d":Z
    :cond_1
    return-void

    .line 444
    .restart local v0    # "d":Z
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->error:Ljava/lang/Throwable;

    .line 445
    .local v1, "e":Ljava/lang/Throwable;
    if-nez v1, :cond_3

    .line 448
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 450
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v3}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 451
    return-void

    .line 446
    :cond_3
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method runSync()V
    .locals 12

    .prologue
    .line 299
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber<TT;>;"
    const/4 v4, 0x1

    .line 301
    .local v4, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 302
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 304
    .local v5, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    .line 308
    .local v2, "e":J
    :cond_0
    :goto_0
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    .line 310
    .local v6, "r":J
    :goto_1
    cmp-long v10, v2, v6

    if-eqz v10, :cond_3

    .line 314
    :try_start_0
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 323
    .local v8, "v":Ljava/lang/Object;, "TT;"
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->cancelled:Z

    if-nez v10, :cond_1

    .line 326
    if-eqz v8, :cond_2

    .line 332
    invoke-interface {v0, v8}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 334
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    goto :goto_1

    .line 315
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v1

    .line 316
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 317
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v10}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 318
    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 319
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v10}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 320
    return-void

    .line 324
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_1
    return-void

    .line 327
    :cond_2
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 328
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v10}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 329
    return-void

    .line 337
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->cancelled:Z

    if-nez v10, :cond_4

    .line 341
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_5

    .line 347
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->get()I

    move-result v9

    .line 348
    .local v9, "w":I
    if-eq v4, v9, :cond_6

    .line 355
    move v4, v9

    goto :goto_0

    .line 338
    .end local v9    # "w":I
    :cond_4
    return-void

    .line 342
    :cond_5
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 343
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v10}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 344
    return-void

    .line 349
    .restart local v9    # "w":I
    :cond_6
    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->produced:J

    .line 350
    neg-int v10, v4

    invoke-virtual {p0, v10}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnSubscriber;->addAndGet(I)I

    move-result v4

    .line 351
    if-nez v4, :cond_0

    .line 358
    return-void
.end method
