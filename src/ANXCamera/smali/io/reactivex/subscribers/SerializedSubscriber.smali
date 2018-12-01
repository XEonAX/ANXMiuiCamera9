.class public final Lio/reactivex/subscribers/SerializedSubscriber;
.super Ljava/lang/Object;
.source "SerializedSubscriber.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final delayError:Z

.field volatile done:Z

.field emitting:Z

.field queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field subscription:Lorg/reactivestreams/Subscription;


# direct methods
.method public constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/reactivex/subscribers/SerializedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Z)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/reactivestreams/Subscriber;Z)V
    .locals 0
    .param p2, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;Z)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 63
    iput-boolean p2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->delayError:Z

    .line 64
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 197
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 198
    return-void
.end method

.method emitLoop()V
    .locals 4

    .prologue
    .line 175
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    :cond_0
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 176
    :try_start_0
    iget-object v2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 177
    .local v2, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-eqz v2, :cond_1

    .line 181
    const/4 v3, 0x0

    iput-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 182
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    iget-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-virtual {v2, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->accept(Lorg/reactivestreams/Subscriber;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 185
    return-void

    .line 178
    :cond_1
    const/4 v3, 0x0

    :try_start_1
    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 179
    monitor-exit p0

    return-void

    .line 182
    .end local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    .local v1, "-l_3_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onComplete()V
    .locals 4

    .prologue
    .line 148
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-nez v3, :cond_0

    .line 151
    move-object v0, p0

    .local v0, "-l_1_R":Ljava/lang/Object;
    monitor-enter p0

    .line 152
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-nez v3, :cond_1

    .line 155
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    if-nez v3, :cond_2

    .line 164
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    .line 165
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 166
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    iget-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 170
    return-void

    .line 149
    .end local v0    # "-l_1_R":Ljava/lang/Object;
    :cond_0
    return-void

    .line 153
    .restart local v0    # "-l_1_R":Ljava/lang/Object;
    :cond_1
    :try_start_1
    monitor-exit p0

    return-void

    .line 156
    :cond_2
    iget-object v2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 157
    .local v2, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-eqz v2, :cond_3

    .line 161
    :goto_0
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 162
    monitor-exit p0

    return-void

    .line 158
    :cond_3
    new-instance v2, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 159
    .restart local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    goto :goto_0

    .line 166
    .end local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    .local v1, "-l_3_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-nez v5, :cond_0

    .line 112
    move-object v0, p0

    .local v0, "-l_3_R":Ljava/lang/Object;
    monitor-enter p0

    .line 113
    :try_start_0
    iget-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-nez v5, :cond_1

    .line 116
    iget-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    if-nez v5, :cond_2

    .line 131
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    .line 132
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 133
    const/4 v4, 0x0

    .line 135
    .local v4, "reportError":Z
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    if-nez v4, :cond_5

    .line 142
    iget-object v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v5, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 144
    return-void

    .line 108
    .end local v0    # "-l_3_R":Ljava/lang/Object;
    .end local v4    # "reportError":Z
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 109
    return-void

    .line 114
    .restart local v0    # "-l_3_R":Ljava/lang/Object;
    :cond_1
    const/4 v4, 0x1

    .restart local v4    # "reportError":Z
    goto :goto_0

    .line 117
    .end local v4    # "reportError":Z
    :cond_2
    const/4 v5, 0x1

    :try_start_1
    iput-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    .line 118
    iget-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 119
    .local v3, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-eqz v3, :cond_3

    .line 123
    :goto_1
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v2

    .line 124
    .local v2, "err":Ljava/lang/Object;
    iget-boolean v5, p0, Lio/reactivex/subscribers/SerializedSubscriber;->delayError:Z

    if-nez v5, :cond_4

    .line 127
    invoke-virtual {v3, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->setFirst(Ljava/lang/Object;)V

    .line 129
    :goto_2
    monitor-exit p0

    return-void

    .line 120
    .end local v2    # "err":Ljava/lang/Object;
    :cond_3
    new-instance v3, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v3    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v5, 0x4

    invoke-direct {v3, v5}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 121
    .restart local v3    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    goto :goto_1

    .line 135
    .end local v3    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    .local v1, "-l_6_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 125
    .end local v1    # "-l_6_R":Ljava/lang/Object;
    .restart local v2    # "err":Ljava/lang/Object;
    .restart local v3    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :cond_4
    :try_start_2
    invoke-virtual {v3, v2}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 138
    .end local v2    # "err":Ljava/lang/Object;
    .end local v3    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    .restart local v4    # "reportError":Z
    :cond_5
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 139
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-nez v3, :cond_0

    .line 79
    if-eqz p1, :cond_1

    .line 84
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 85
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->done:Z

    if-nez v3, :cond_2

    .line 88
    iget-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    if-nez v3, :cond_3

    .line 97
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->emitting:Z

    .line 98
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    iget-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v3, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 102
    invoke-virtual {p0}, Lio/reactivex/subscribers/SerializedSubscriber;->emitLoop()V

    .line 103
    return-void

    .line 77
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_0
    return-void

    .line 80
    :cond_1
    iget-object v3, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-interface {v3}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 81
    new-instance v3, Ljava/lang/NullPointerException;

    const-string/jumbo v4, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lio/reactivex/subscribers/SerializedSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 82
    return-void

    .line 86
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_2
    :try_start_1
    monitor-exit p0

    return-void

    .line 89
    :cond_3
    iget-object v2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .line 90
    .local v2, "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    if-eqz v2, :cond_4

    .line 94
    :goto_0
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->add(Ljava/lang/Object;)V

    .line 95
    monitor-exit p0

    return-void

    .line 91
    :cond_4
    new-instance v2, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    .end local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;-><init>(I)V

    .line 92
    .restart local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    iput-object v2, p0, Lio/reactivex/subscribers/SerializedSubscriber;->queue:Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;

    goto :goto_0

    .line 98
    .end local v2    # "q":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    .local v1, "-l_4_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    :goto_0
    return-void

    .line 69
    :cond_0
    iput-object p1, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    .line 70
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/subscribers/SerializedSubscriber;, "Lio/reactivex/subscribers/SerializedSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/subscribers/SerializedSubscriber;->subscription:Lorg/reactivestreams/Subscription;

    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 193
    return-void
.end method
