.class final Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;
.super Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;
.source "FlowableCreate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BufferAsyncEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x21aef8f9f7f1cbc3L


# instance fields
.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;I)V
    .locals 1
    .param p2, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 450
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 451
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 452
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 453
    return-void
.end method


# virtual methods
.method drain()V
    .locals 14

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    const/4 v9, 0x0

    .line 504
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v12}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v12

    if-nez v12, :cond_2

    .line 508
    const/4 v6, 0x1

    .line 509
    .local v6, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->actual:Lorg/reactivestreams/Subscriber;

    .line 510
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 513
    .local v8, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->get()J

    move-result-wide v10

    .line 514
    .local v10, "r":J
    const-wide/16 v2, 0x0

    .line 516
    .local v2, "e":J
    :goto_0
    cmp-long v12, v2, v10

    if-eqz v12, :cond_7

    .line 517
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v12

    if-nez v12, :cond_3

    .line 522
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 524
    .local v1, "d":Z
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    .line 526
    .local v7, "o":Ljava/lang/Object;, "TT;"
    if-eqz v7, :cond_4

    move v4, v9

    .line 528
    .local v4, "empty":Z
    :goto_1
    if-nez v1, :cond_5

    .line 538
    :cond_1
    if-nez v4, :cond_7

    .line 542
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 544
    const-wide/16 v12, 0x1

    add-long/2addr v2, v12

    goto :goto_0

    .line 505
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v1    # "d":Z
    .end local v2    # "e":J
    .end local v4    # "empty":Z
    .end local v6    # "missed":I
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    .end local v8    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    .end local v10    # "r":J
    :cond_2
    return-void

    .line 518
    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .restart local v2    # "e":J
    .restart local v6    # "missed":I
    .restart local v8    # "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    .restart local v10    # "r":J
    :cond_3
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 519
    return-void

    .line 526
    .restart local v1    # "d":Z
    .restart local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_4
    const/4 v4, 0x1

    goto :goto_1

    .line 528
    .restart local v4    # "empty":Z
    :cond_5
    if-eqz v4, :cond_1

    .line 529
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 530
    .local v5, "ex":Ljava/lang/Throwable;
    if-nez v5, :cond_6

    .line 533
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->complete()V

    .line 535
    :goto_2
    return-void

    .line 531
    :cond_6
    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error(Ljava/lang/Throwable;)Z

    goto :goto_2

    .line 547
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_7
    cmp-long v12, v2, v10

    if-nez v12, :cond_8

    .line 548
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v12

    if-nez v12, :cond_a

    .line 553
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 555
    .restart local v1    # "d":Z
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->isEmpty()Z

    move-result v4

    .line 557
    .restart local v4    # "empty":Z
    if-nez v1, :cond_b

    .line 568
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    :cond_8
    const-wide/16 v12, 0x0

    cmp-long v12, v2, v12

    if-eqz v12, :cond_9

    .line 569
    invoke-static {p0, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 572
    :cond_9
    iget-object v12, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v13, v6

    invoke-virtual {v12, v13}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v6

    .line 573
    if-nez v6, :cond_0

    .line 577
    return-void

    .line 549
    :cond_a
    invoke-virtual {v8}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 550
    return-void

    .line 557
    .restart local v1    # "d":Z
    .restart local v4    # "empty":Z
    :cond_b
    if-eqz v4, :cond_8

    .line 558
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 559
    .restart local v5    # "ex":Ljava/lang/Throwable;
    if-nez v5, :cond_c

    .line 562
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->complete()V

    .line 564
    :goto_3
    return-void

    .line 560
    :cond_c
    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error(Ljava/lang/Throwable;)Z

    goto :goto_3
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 487
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 488
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    .line 489
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 457
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    if-eqz v0, :cond_1

    .line 458
    :cond_0
    return-void

    .line 457
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 461
    if-eqz p1, :cond_2

    .line 465
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 466
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    .line 467
    return-void

    .line 462
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    .line 463
    return-void
.end method

.method onRequested()V
    .locals 0

    .prologue
    .line 493
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    .line 494
    return-void
.end method

.method onUnsubscribed()V
    .locals 1

    .prologue
    .line 498
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 501
    :goto_0
    return-void

    .line 499
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0
.end method

.method public tryOnError(Ljava/lang/Throwable;)Z
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter<TT;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 471
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    if-eqz v0, :cond_1

    .line 472
    :cond_0
    return v1

    .line 471
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 475
    if-eqz p1, :cond_2

    .line 479
    :goto_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 480
    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->done:Z

    .line 481
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BufferAsyncEmitter;->drain()V

    .line 482
    return v2

    .line 476
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string/jumbo v0, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0
.end method
