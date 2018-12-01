.class final Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;
.super Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber;
.source "FlowableFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FilterConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final filter:Lio/reactivex/functions/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "filter":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;)V

    .line 114
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->filter:Lio/reactivex/functions/Predicate;

    .line 115
    return-void
.end method


# virtual methods
.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    :goto_0
    return-void

    .line 120
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide/16 v2, 0x1

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 7
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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber<TT;>;"
    const/4 v6, 0x0

    .line 152
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    .line 153
    .local v1, "qs":Lio/reactivex/internal/fuseable/QueueSubscription;, "Lio/reactivex/internal/fuseable/QueueSubscription<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->filter:Lio/reactivex/functions/Predicate;

    .line 156
    .local v0, "f":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v2

    .line 157
    .local v2, "t":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_1

    .line 161
    invoke-interface {v0, v2}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 165
    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->sourceMode:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 166
    const-wide/16 v4, 0x1

    invoke-interface {v1, v4, v5}, Lio/reactivex/internal/fuseable/QueueSubscription;->request(J)V

    goto :goto_0

    .line 158
    :cond_1
    return-object v6

    .line 162
    :cond_2
    return-object v2
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 146
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 126
    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->done:Z

    if-nez v4, :cond_1

    .line 130
    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->sourceMode:I

    if-nez v4, :cond_2

    .line 136
    :try_start_0
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->filter:Lio/reactivex/functions/Predicate;

    invoke-interface {v4, p1}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 141
    .local v0, "b":Z
    if-nez v0, :cond_3

    :goto_0
    move v2, v3

    :cond_0
    return v2

    .line 127
    .end local v0    # "b":Z
    :cond_1
    return v3

    .line 131
    :cond_2
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 137
    :catch_0
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->fail(Ljava/lang/Throwable;)V

    .line 139
    return v2

    .line 141
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "b":Z
    :cond_3
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFilter$FilterConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v4, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0
.end method
