.class final Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;
.super Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;
.source "FlowableCreate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LatestAsyncEmitter"
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
.field private static final serialVersionUID:J = 0x37d61f4a35bdda6fL


# instance fields
.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final queue:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


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
    .line 593
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$BaseEmitter;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 594
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 595
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 596
    return-void
.end method


# virtual methods
.method drain()V
    .locals 14

    .prologue
    .line 645
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v9

    if-nez v9, :cond_2

    .line 649
    const/4 v6, 0x1

    .line 650
    .local v6, "missed":I
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->actual:Lorg/reactivestreams/Subscriber;

    .line 651
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    .line 654
    .local v8, "q":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<TT;>;"
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->get()J

    move-result-wide v10

    .line 655
    .local v10, "r":J
    const-wide/16 v2, 0x0

    .line 657
    .local v2, "e":J
    :goto_0
    cmp-long v9, v2, v10

    if-eqz v9, :cond_7

    .line 658
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v9

    if-nez v9, :cond_3

    .line 663
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 665
    .local v1, "d":Z
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 667
    .local v7, "o":Ljava/lang/Object;, "TT;"
    if-eqz v7, :cond_4

    const/4 v4, 0x0

    .line 669
    .local v4, "empty":Z
    :goto_1
    if-nez v1, :cond_5

    .line 679
    :cond_1
    if-nez v4, :cond_7

    .line 683
    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 685
    const-wide/16 v12, 0x1

    add-long/2addr v2, v12

    goto :goto_0

    .line 646
    .end local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .end local v1    # "d":Z
    .end local v2    # "e":J
    .end local v4    # "empty":Z
    .end local v6    # "missed":I
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    .end local v8    # "q":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<TT;>;"
    .end local v10    # "r":J
    :cond_2
    return-void

    .line 659
    .restart local v0    # "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .restart local v2    # "e":J
    .restart local v6    # "missed":I
    .restart local v8    # "q":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<TT;>;"
    .restart local v10    # "r":J
    :cond_3
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 660
    return-void

    .line 667
    .restart local v1    # "d":Z
    .restart local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_4
    const/4 v4, 0x1

    goto :goto_1

    .line 669
    .restart local v4    # "empty":Z
    :cond_5
    if-eqz v4, :cond_1

    .line 670
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 671
    .local v5, "ex":Ljava/lang/Throwable;
    if-nez v5, :cond_6

    .line 674
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->complete()V

    .line 676
    :goto_2
    return-void

    .line 672
    :cond_6
    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error(Ljava/lang/Throwable;)Z

    goto :goto_2

    .line 688
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    .end local v5    # "ex":Ljava/lang/Throwable;
    .end local v7    # "o":Ljava/lang/Object;, "TT;"
    :cond_7
    cmp-long v9, v2, v10

    if-nez v9, :cond_8

    .line 689
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v9

    if-nez v9, :cond_a

    .line 694
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 696
    .restart local v1    # "d":Z
    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_b

    const/4 v4, 0x0

    .line 698
    .restart local v4    # "empty":Z
    :goto_3
    if-nez v1, :cond_c

    .line 709
    .end local v1    # "d":Z
    .end local v4    # "empty":Z
    :cond_8
    const-wide/16 v12, 0x0

    cmp-long v9, v2, v12

    if-eqz v9, :cond_9

    .line 710
    invoke-static {p0, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 713
    :cond_9
    iget-object v9, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v12, v6

    invoke-virtual {v9, v12}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v6

    .line 714
    if-nez v6, :cond_0

    .line 718
    return-void

    .line 690
    :cond_a
    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 691
    return-void

    .line 696
    .restart local v1    # "d":Z
    :cond_b
    const/4 v4, 0x1

    goto :goto_3

    .line 698
    .restart local v4    # "empty":Z
    :cond_c
    if-eqz v4, :cond_8

    .line 699
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 700
    .restart local v5    # "ex":Ljava/lang/Throwable;
    if-nez v5, :cond_d

    .line 703
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->complete()V

    .line 705
    :goto_4
    return-void

    .line 701
    :cond_d
    invoke-virtual {p0, v5}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error(Ljava/lang/Throwable;)Z

    goto :goto_4
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 628
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 629
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    .line 630
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
    .line 600
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    if-eqz v0, :cond_1

    .line 601
    :cond_0
    return-void

    .line 600
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 604
    if-eqz p1, :cond_2

    .line 608
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 609
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    .line 610
    return-void

    .line 605
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    .line 606
    return-void
.end method

.method onRequested()V
    .locals 0

    .prologue
    .line 634
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    .line 635
    return-void
.end method

.method onUnsubscribed()V
    .locals 2

    .prologue
    .line 639
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 642
    :goto_0
    return-void

    .line 640
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->queue:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public tryOnError(Ljava/lang/Throwable;)Z
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter<TT;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 614
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    if-eqz v0, :cond_1

    .line 615
    :cond_0
    return v1

    .line 614
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 617
    if-eqz p1, :cond_2

    .line 620
    :goto_0
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 621
    iput-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->done:Z

    .line 622
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->drain()V

    .line 623
    return v2

    .line 618
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$LatestAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
