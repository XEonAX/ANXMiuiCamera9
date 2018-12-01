.class final Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;
.super Lio/reactivex/internal/operators/flowable/FlowableObserveOn$BaseObserveOnSubscriber;
.source "FlowableObserveOn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableObserveOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ObserveOnConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$BaseObserveOnSubscriber",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x8f22a8b85feb275L


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field consumed:J


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/Scheduler$Worker;ZI)V
    .locals 0
    .param p2, "worker"    # Lio/reactivex/Scheduler$Worker;
    .param p3, "delayError"    # Z
    .param p4, "prefetch"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            "ZI)V"
        }
    .end annotation

    .prologue
    .line 493
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    invoke-direct {p0, p2, p3, p4}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$BaseObserveOnSubscriber;-><init>(Lio/reactivex/Scheduler$Worker;ZI)V

    .line 494
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 495
    return-void
.end method


# virtual methods
.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 5
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber<TT;>;"
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 499
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v2, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 534
    :goto_0
    return-void

    .line 500
    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 502
    instance-of v2, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-nez v2, :cond_2

    .line 528
    :cond_1
    new-instance v2, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->prefetch:I

    invoke-direct {v2, v3}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 530
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 532
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 504
    check-cast v0, Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 506
    .local v0, "f":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    const/4 v2, 0x7

    invoke-interface {v0, v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v1

    .line 508
    .local v1, "m":I
    if-eq v1, v3, :cond_3

    .line 516
    if-ne v1, v4, :cond_1

    .line 517
    iput v4, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->sourceMode:I

    .line 518
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 520
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 522
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->prefetch:I

    int-to-long v2, v2

    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 524
    return-void

    .line 509
    :cond_3
    iput v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->sourceMode:I

    .line 510
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 511
    iput-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->done:Z

    .line 513
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 514
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
    .line 703
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber<TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v3}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v2

    .line 704
    .local v2, "v":Ljava/lang/Object;, "TT;"
    if-nez v2, :cond_1

    .line 713
    :cond_0
    :goto_0
    return-object v2

    .line 704
    :cond_1
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->sourceMode:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 705
    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->consumed:J

    const-wide/16 v6, 0x1

    add-long v0, v4, v6

    .line 706
    .local v0, "p":J
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->limit:I

    int-to-long v4, v3

    cmp-long v3, v0, v4

    if-nez v3, :cond_2

    .line 707
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->consumed:J

    .line 708
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v3, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 710
    :cond_2
    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->consumed:J

    goto :goto_0
.end method

.method runAsync()V
    .locals 20

    .prologue
    .line 600
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber<TT;>;"
    const/4 v10, 0x1

    .line 602
    .local v10, "missed":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 603
    .local v4, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 605
    .local v11, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    move-object/from16 v0, p0

    iget-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->produced:J

    .line 606
    .local v6, "emitted":J
    move-object/from16 v0, p0

    iget-wide v12, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->consumed:J

    .line 610
    .local v12, "polled":J
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 612
    .local v14, "r":J
    :cond_1
    :goto_1
    cmp-long v18, v6, v14

    if-eqz v18, :cond_5

    .line 613
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->done:Z

    .line 616
    .local v5, "d":Z
    :try_start_0
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v16

    .line 627
    .local v16, "v":Ljava/lang/Object;, "TT;"
    if-eqz v16, :cond_2

    const/4 v8, 0x0

    .line 629
    .local v8, "empty":Z
    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v8, v4}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 633
    if-nez v8, :cond_5

    .line 637
    move-object/from16 v0, v16

    invoke-interface {v4, v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_4

    .line 641
    :goto_3
    const-wide/16 v18, 0x1

    add-long v12, v12, v18

    .line 643
    move-object/from16 v0, p0

    iget v0, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->limit:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    cmp-long v18, v12, v18

    if-nez v18, :cond_1

    .line 644
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 645
    const-wide/16 v12, 0x0

    goto :goto_1

    .line 617
    .end local v8    # "empty":Z
    .end local v16    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v9

    .line 618
    .local v9, "ex":Ljava/lang/Throwable;
    invoke-static {v9}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 620
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 621
    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 623
    invoke-interface {v4, v9}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 624
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 625
    return-void

    .line 627
    .end local v9    # "ex":Ljava/lang/Throwable;
    .restart local v16    # "v":Ljava/lang/Object;, "TT;"
    :cond_2
    const/4 v8, 0x1

    goto :goto_2

    .line 630
    .restart local v8    # "empty":Z
    :cond_3
    return-void

    .line 638
    :cond_4
    const-wide/16 v18, 0x1

    add-long v6, v6, v18

    goto :goto_3

    .line 649
    .end local v5    # "d":Z
    .end local v8    # "empty":Z
    .end local v16    # "v":Ljava/lang/Object;, "TT;"
    :cond_5
    cmp-long v18, v6, v14

    if-nez v18, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->done:Z

    move/from16 v18, v0

    invoke-interface {v11}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2, v4}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->checkTerminated(ZZLorg/reactivestreams/Subscriber;)Z

    move-result v18

    if-nez v18, :cond_7

    .line 653
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->get()I

    move-result v17

    .line 654
    .local v17, "w":I
    move/from16 v0, v17

    if-eq v10, v0, :cond_8

    .line 662
    move/from16 v10, v17

    goto/16 :goto_0

    .line 650
    .end local v17    # "w":I
    :cond_7
    return-void

    .line 655
    .restart local v17    # "w":I
    :cond_8
    move-object/from16 v0, p0

    iput-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->produced:J

    .line 656
    move-object/from16 v0, p0

    iput-wide v12, v0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->consumed:J

    .line 657
    neg-int v0, v10

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->addAndGet(I)I

    move-result v10

    .line 658
    if-nez v10, :cond_0

    .line 666
    return-void
.end method

.method runBackfused()V
    .locals 5

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber<TT;>;"
    const/4 v4, 0x0

    .line 670
    const/4 v2, 0x1

    .line 674
    .local v2, "missed":I
    :cond_0
    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->cancelled:Z

    if-nez v3, :cond_1

    .line 678
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->done:Z

    .line 680
    .local v0, "d":Z
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v3, v4}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    .line 682
    if-nez v0, :cond_2

    .line 693
    neg-int v3, v2

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->addAndGet(I)I

    move-result v2

    .line 694
    if-nez v2, :cond_0

    .line 698
    return-void

    .line 675
    .end local v0    # "d":Z
    :cond_1
    return-void

    .line 683
    .restart local v0    # "d":Z
    :cond_2
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->error:Ljava/lang/Throwable;

    .line 684
    .local v1, "e":Ljava/lang/Throwable;
    if-nez v1, :cond_3

    .line 687
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 689
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v3}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 690
    return-void

    .line 685
    :cond_3
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v3, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method runSync()V
    .locals 12

    .prologue
    .line 538
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber<TT;>;"
    const/4 v4, 0x1

    .line 540
    .local v4, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 541
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 543
    .local v5, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->produced:J

    .line 547
    .local v2, "e":J
    :cond_0
    :goto_0
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    .line 549
    .local v6, "r":J
    :cond_1
    :goto_1
    cmp-long v10, v2, v6

    if-eqz v10, :cond_4

    .line 552
    :try_start_0
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 561
    .local v8, "v":Ljava/lang/Object;, "TT;"
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->cancelled:Z

    if-nez v10, :cond_2

    .line 564
    if-eqz v8, :cond_3

    .line 570
    invoke-interface {v0, v8}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 571
    const-wide/16 v10, 0x1

    add-long/2addr v2, v10

    goto :goto_1

    .line 553
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v1

    .line 554
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 555
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v10}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 556
    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 557
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v10}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 558
    return-void

    .line 562
    .end local v1    # "ex":Ljava/lang/Throwable;
    .restart local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_2
    return-void

    .line 565
    :cond_3
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 566
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v10}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 567
    return-void

    .line 575
    .end local v8    # "v":Ljava/lang/Object;, "TT;"
    :cond_4
    iget-boolean v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->cancelled:Z

    if-nez v10, :cond_5

    .line 579
    invoke-interface {v5}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_6

    .line 585
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->get()I

    move-result v9

    .line 586
    .local v9, "w":I
    if-eq v4, v9, :cond_7

    .line 593
    move v4, v9

    goto :goto_0

    .line 576
    .end local v9    # "w":I
    :cond_5
    return-void

    .line 580
    :cond_6
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 581
    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v10}, Lio/reactivex/Scheduler$Worker;->dispose()V

    .line 582
    return-void

    .line 587
    .restart local v9    # "w":I
    :cond_7
    iput-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->produced:J

    .line 588
    neg-int v10, v4

    invoke-virtual {p0, v10}, Lio/reactivex/internal/operators/flowable/FlowableObserveOn$ObserveOnConditionalSubscriber;->addAndGet(I)I

    move-result v4

    .line 589
    if-nez v4, :cond_0

    .line 596
    return-void
.end method
