.class public final Lio/reactivex/internal/queue/MpscLinkedQueue;
.super Ljava/lang/Object;
.source "MpscLinkedQueue.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/SimpleQueue;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/internal/fuseable/SimplePlainQueue",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final consumerNode:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private final producerNode:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 34
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v1, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->producerNode:Ljava/util/concurrent/atomic/AtomicReference;

    .line 36
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v1, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->consumerNode:Ljava/util/concurrent/atomic/AtomicReference;

    .line 37
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;-><init>()V

    .line 38
    .local v0, "node":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->spConsumerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)V

    .line 39
    invoke-virtual {p0, v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->xchgProducerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    .line 40
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 118
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 119
    :goto_0
    return-void

    .line 118
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .line 147
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->lvConsumerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v0

    invoke-virtual {p0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->lvProducerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method lpConsumerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->consumerNode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    return-object v0
.end method

.method lvConsumerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->consumerNode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    return-object v0
.end method

.method lvProducerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->producerNode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    return-object v0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    .local p1, "e":Ljava/lang/Object;, "TT;"
    if-eqz p1, :cond_0

    .line 62
    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    invoke-direct {v0, p1}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;-><init>(Ljava/lang/Object;)V

    .line 63
    .local v0, "nextNode":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->xchgProducerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v1

    .line 66
    .local v1, "prevProducerNode":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    invoke-virtual {v1, v0}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;->soNext(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)V

    .line 67
    const/4 v2, 0x1

    return v2

    .line 60
    .end local v0    # "nextNode":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    .end local v1    # "prevProducerNode":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    :cond_0
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "Null is not a valid element"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public poll()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    const/4 v4, 0x0

    .line 88
    invoke-virtual {p0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->lpConsumerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v0

    .line 89
    .local v0, "currConsumerNode":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    invoke-virtual {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;->lvNext()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v1

    .line 90
    .local v1, "nextNode":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    if-nez v1, :cond_0

    .line 96
    invoke-virtual {p0}, Lio/reactivex/internal/queue/MpscLinkedQueue;->lvProducerNode()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v3

    if-ne v0, v3, :cond_1

    .line 106
    return-object v4

    .line 92
    :cond_0
    invoke-virtual {v1}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;->getAndNullValue()Ljava/lang/Object;

    move-result-object v2

    .line 93
    .local v2, "nextValue":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lio/reactivex/internal/queue/MpscLinkedQueue;->spConsumerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)V

    .line 94
    return-object v2

    .line 98
    .end local v2    # "nextValue":Ljava/lang/Object;, "TT;"
    :cond_1
    invoke-virtual {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;->lvNext()Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 102
    invoke-virtual {v1}, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;->getAndNullValue()Ljava/lang/Object;

    move-result-object v2

    .line 103
    .restart local v2    # "nextValue":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lio/reactivex/internal/queue/MpscLinkedQueue;->spConsumerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)V

    .line 104
    return-object v2
.end method

.method spConsumerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    .local p1, "node":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->consumerNode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 135
    return-void
.end method

.method xchgProducerNode(Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;)Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;)",
            "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "this":Lio/reactivex/internal/queue/MpscLinkedQueue;, "Lio/reactivex/internal/queue/MpscLinkedQueue<TT;>;"
    .local p1, "node":Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;, "Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/queue/MpscLinkedQueue;->producerNode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/queue/MpscLinkedQueue$LinkedQueueNode;

    return-object v0
.end method
