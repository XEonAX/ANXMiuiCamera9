.class final Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;
.super Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber;
.source "FlowableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MapConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber",
        "<TT;TU;>;"
    }
.end annotation


# instance fields
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TU;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TU;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TU;>;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber<TT;TU;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TU;>;"
    .local p2, "function":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TU;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;)V

    .line 90
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 91
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
    .line 95
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->done:Z

    if-nez v2, :cond_0

    .line 99
    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->sourceMode:I

    if-nez v2, :cond_1

    .line 107
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper function returned a null value."

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 112
    .local v1, "v":Ljava/lang/Object;, "TU;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    .line 113
    return-void

    .line 96
    .end local v1    # "v":Ljava/lang/Object;, "TU;"
    :cond_0
    return-void

    .line 100
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    .line 101
    return-void

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->fail(Ljava/lang/Throwable;)V

    .line 110
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
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
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber<TT;TU;>;"
    const/4 v1, 0x0

    .line 140
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v2}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 141
    .local v0, "t":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v1, v0}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "The mapper function returned a null value."

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 134
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber<TT;TU;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber<TT;TU;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    .line 117
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->done:Z

    if-nez v2, :cond_0

    .line 124
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The mapper function returned a null value."

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 129
    .local v1, "v":Ljava/lang/Object;, "TU;"
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 118
    .end local v1    # "v":Ljava/lang/Object;, "TU;"
    :cond_0
    return v3

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableMap$MapConditionalSubscriber;->fail(Ljava/lang/Throwable;)V

    .line 127
    const/4 v2, 0x1

    return v2
.end method
