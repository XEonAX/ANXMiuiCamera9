.class public Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;
.super Ljava/lang/Object;
.source "AppendOnlyLinkedArrayList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final capacity:I

.field final head:[Ljava/lang/Object;

.field offset:I

.field tail:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->capacity:I

    .line 38
    add-int/lit8 v0, p1, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->head:[Ljava/lang/Object;

    .line 39
    iget-object v0, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->head:[Ljava/lang/Object;

    iput-object v0, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->tail:[Ljava/lang/Object;

    .line 40
    return-void
.end method


# virtual methods
.method public accept(Lorg/reactivestreams/Subscriber;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<TT;>;"
    .local p1, "subscriber":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    const/4 v5, 0x0

    .line 110
    iget-object v0, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->head:[Ljava/lang/Object;

    .line 111
    .local v0, "a":[Ljava/lang/Object;
    iget v1, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->capacity:I

    .line 112
    .local v1, "c":I
    :goto_0
    if-nez v0, :cond_0

    .line 125
    return v5

    .line 113
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-lt v2, v1, :cond_2

    .line 123
    :cond_1
    aget-object v4, v0, v1

    check-cast v4, [Ljava/lang/Object;

    move-object v0, v4

    check-cast v0, [Ljava/lang/Object;

    goto :goto_0

    .line 114
    :cond_2
    aget-object v3, v0, v2

    .line 115
    .local v3, "o":Ljava/lang/Object;
    if-eqz v3, :cond_1

    .line 119
    invoke-static {v3, p1}, Lio/reactivex/internal/util/NotificationLite;->acceptFull(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 113
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 120
    :cond_3
    const/4 v4, 0x1

    return v4
.end method

.method public add(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->capacity:I

    .line 49
    .local v0, "c":I
    iget v2, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->offset:I

    .line 50
    .local v2, "o":I
    if-eq v2, v0, :cond_0

    .line 56
    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->tail:[Ljava/lang/Object;

    aput-object p1, v3, v2

    .line 57
    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->offset:I

    .line 58
    return-void

    .line 51
    :cond_0
    add-int/lit8 v3, v0, 0x1

    new-array v1, v3, [Ljava/lang/Object;

    .line 52
    .local v1, "next":[Ljava/lang/Object;
    iget-object v3, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->tail:[Ljava/lang/Object;

    aput-object v1, v3, v0

    .line 53
    iput-object v1, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->tail:[Ljava/lang/Object;

    .line 54
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setFirst(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;, "Lio/reactivex/internal/util/AppendOnlyLinkedArrayList<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/util/AppendOnlyLinkedArrayList;->head:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 66
    return-void
.end method
