.class public Landroid/support/v7/util/SortedList;
.super Ljava/lang/Object;
.source "SortedList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/util/SortedList$BatchedCallback;,
        Landroid/support/v7/util/SortedList$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final CAPACITY_GROWTH:I = 0xa

.field private static final DELETION:I = 0x2

.field private static final INSERTION:I = 0x1

.field public static final INVALID_POSITION:I = -0x1

.field private static final LOOKUP:I = 0x4

.field private static final MIN_CAPACITY:I = 0xa


# instance fields
.field private mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

.field private mCallback:Landroid/support/v7/util/SortedList$Callback;

.field mData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private mMergedSize:I

.field private mOldData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private mOldDataSize:I

.field private mOldDataStart:I

.field private mSize:I

.field private final mTClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Landroid/support/v7/util/SortedList$Callback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "callback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT;>;"
    const/16 v0, 0xa

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/util/SortedList;-><init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V
    .registers 5
    .param p3, "initialCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Landroid/support/v7/util/SortedList$Callback",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "callback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-object p1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    .line 94
    invoke-static {p1, p3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    nop

    nop

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 95
    iput-object p2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 97
    return-void
.end method

.method private add(Ljava/lang/Object;Z)I
    .registers 11
    .param p2, "notify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 392
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v7

    .line 393
    .local v7, "index":I
    const/4 v0, -0x1

    if-eq v7, v0, :cond_19

    .line 395
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-lt v7, v0, :cond_1b

    .line 409
    :cond_13
    :goto_13
    invoke-direct {p0, v7, p1}, Landroid/support/v7/util/SortedList;->addToData(ILjava/lang/Object;)V

    .line 410
    if-nez p2, :cond_3e

    .line 413
    :goto_18
    return v7

    .line 394
    :cond_19
    const/4 v7, 0x0

    goto :goto_13

    .line 396
    :cond_1b
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v6, v0, v7

    .line 397
    .local v6, "existing":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, v6, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 398
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, v6, p1}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    .line 403
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v0, v7

    .line 404
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, v7, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    .line 405
    return v7

    .line 400
    :cond_39
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v0, v7

    .line 401
    return v7

    .line 411
    .end local v6    # "existing":Ljava/lang/Object;, "TT;"
    :cond_3e
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, v7, v5}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_18
.end method

.method private addAllInternal([Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "newItems":[Ljava/lang/Object;, "[TT;"
    const/4 v2, 0x0

    .line 189
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v3, v3, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v3, :cond_2a

    move v0, v2

    .line 190
    .local v0, "forceBatchedUpdates":Z
    :goto_8
    if-nez v0, :cond_2c

    .line 194
    :goto_a
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iput-object v3, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    .line 195
    iput v2, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    .line 196
    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iput v3, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    .line 198
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-static {p1, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 200
    invoke-direct {p0, p1}, Landroid/support/v7/util/SortedList;->deduplicate([Ljava/lang/Object;)I

    move-result v1

    .line 201
    .local v1, "newSize":I
    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-eqz v3, :cond_30

    .line 207
    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->merge([Ljava/lang/Object;I)V

    .line 210
    :goto_24
    const/4 v2, 0x0

    iput-object v2, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    .line 212
    if-nez v0, :cond_3c

    .line 215
    :goto_29
    return-void

    .line 189
    .end local v0    # "forceBatchedUpdates":Z
    .end local v1    # "newSize":I
    :cond_2a
    const/4 v0, 0x1

    goto :goto_8

    .line 191
    .restart local v0    # "forceBatchedUpdates":Z
    :cond_2c
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList;->beginBatchedUpdates()V

    goto :goto_a

    .line 202
    .restart local v1    # "newSize":I
    :cond_30
    iput-object p1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 203
    iput v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 204
    iput v1, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    .line 205
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, v1}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_24

    .line 213
    :cond_3c
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList;->endBatchedUpdates()V

    goto :goto_29
.end method

.method private addToData(ILjava/lang/Object;)V
    .registers 8
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    .line 643
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-gt p1, v1, :cond_23

    .line 647
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v2, v2

    if-eq v1, v2, :cond_4a

    .line 656
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 657
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v1, p1

    .line 659
    :goto_1c
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 660
    return-void

    .line 644
    :cond_23
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "cannot add item to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " because size is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 649
    :cond_4a
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    nop

    nop

    .line 650
    .local v0, "newData":[Ljava/lang/Object;, "[TT;"
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    invoke-static {v1, v3, v0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 651
    aput-object p2, v0, p1

    .line 652
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    invoke-static {v1, p1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 653
    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    goto :goto_1c
.end method

.method private deduplicate([Ljava/lang/Object;)I
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)I"
        }
    .end annotation

    .prologue
    .line 224
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "items":[Ljava/lang/Object;, "[TT;"
    array-length v7, p1

    if-eqz v7, :cond_a

    .line 230
    const/4 v5, 0x0

    .line 231
    .local v5, "rangeStart":I
    const/4 v3, 0x1

    .line 233
    .local v3, "rangeEnd":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_6
    array-length v7, p1

    if-lt v2, v7, :cond_13

    .line 262
    return v3

    .line 225
    .end local v2    # "i":I
    .end local v3    # "rangeEnd":I
    .end local v5    # "rangeStart":I
    :cond_a
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "Input array must be non-empty"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 234
    .restart local v2    # "i":I
    .restart local v3    # "rangeEnd":I
    .restart local v5    # "rangeStart":I
    :cond_13
    aget-object v1, p1, v2

    .line 236
    .local v1, "currentItem":Ljava/lang/Object;, "TT;"
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    aget-object v8, p1, v5

    invoke-virtual {v7, v8, v1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 237
    .local v0, "compare":I
    if-gtz v0, :cond_2a

    .line 241
    if-eqz v0, :cond_33

    .line 256
    if-ne v3, v2, :cond_45

    .line 259
    :goto_23
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "rangeEnd":I
    .local v4, "rangeEnd":I
    move v5, v3

    move v3, v4

    .line 233
    .end local v4    # "rangeEnd":I
    .restart local v3    # "rangeEnd":I
    :goto_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 238
    :cond_2a
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "Input must be sorted in ascending order."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 243
    :cond_33
    invoke-direct {p0, v1, p1, v5, v3}, Landroid/support/v7/util/SortedList;->findSameItem(Ljava/lang/Object;[Ljava/lang/Object;II)I

    move-result v6

    .line 244
    .local v6, "sameItemPos":I
    const/4 v7, -0x1

    if-ne v6, v7, :cond_3f

    .line 249
    if-ne v3, v2, :cond_42

    .line 252
    :goto_3c
    add-int/lit8 v3, v3, 0x1

    goto :goto_27

    .line 246
    :cond_3f
    aput-object v1, p1, v6

    goto :goto_27

    .line 250
    :cond_42
    aput-object v1, p1, v3

    goto :goto_3c

    .line 257
    .end local v6    # "sameItemPos":I
    :cond_45
    aput-object v1, p1, v3

    goto :goto_23
.end method

.method private findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I
    .registers 13
    .param p3, "left"    # I
    .param p4, "right"    # I
    .param p5, "reason"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[TT;III)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    .local p2, "mData":[Ljava/lang/Object;, "[TT;"
    const/4 v6, 0x1

    const/4 v4, -0x1

    .line 593
    :goto_2
    if-lt p3, p4, :cond_8

    .line 614
    if-eq p5, v6, :cond_7

    move p3, v4

    .end local p3    # "left":I
    :cond_7
    return p3

    .line 594
    .restart local p3    # "left":I
    :cond_8
    add-int v5, p3, p4

    div-int/lit8 v2, v5, 0x2

    .line 595
    .local v2, "middle":I
    aget-object v3, p2, v2

    .line 596
    .local v3, "myItem":Ljava/lang/Object;, "TT;"
    iget-object v5, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v5, v3, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 597
    .local v0, "cmp":I
    if-ltz v0, :cond_1a

    .line 599
    if-eqz v0, :cond_1d

    .line 611
    move p4, v2

    goto :goto_2

    .line 598
    :cond_1a
    add-int/lit8 p3, v2, 0x1

    goto :goto_2

    .line 600
    :cond_1d
    iget-object v5, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v5, v3, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2c

    .line 603
    invoke-direct {p0, p1, v2, p3, p4}, Landroid/support/v7/util/SortedList;->linearEqualitySearch(Ljava/lang/Object;III)I

    move-result v1

    .line 604
    .local v1, "exact":I
    if-eq p5, v6, :cond_2d

    .line 607
    return v1

    .line 601
    .end local v1    # "exact":I
    :cond_2c
    return v2

    .line 605
    .restart local v1    # "exact":I
    :cond_2d
    if-eq v1, v4, :cond_30

    .end local v1    # "exact":I
    :goto_2f
    return v1

    .restart local v1    # "exact":I
    :cond_30
    move v1, v2

    goto :goto_2f
.end method

.method private findSameItem(Ljava/lang/Object;[Ljava/lang/Object;II)I
    .registers 8
    .param p3, "from"    # I
    .param p4, "to"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[TT;II)I"
        }
    .end annotation

    .prologue
    .line 267
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    .local p2, "items":[Ljava/lang/Object;, "[TT;"
    move v0, p3

    .local v0, "pos":I
    :goto_1
    if-lt v0, p4, :cond_5

    .line 272
    const/4 v1, -0x1

    return v1

    .line 268
    :cond_5
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    aget-object v2, p2, v0

    invoke-virtual {v1, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 267
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 269
    :cond_12
    return v0
.end method

.method private linearEqualitySearch(Ljava/lang/Object;III)I
    .registers 9
    .param p2, "middle"    # I
    .param p3, "left"    # I
    .param p4, "right"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;III)I"
        }
    .end annotation

    .prologue
    .line 619
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    add-int/lit8 v1, p2, -0x1

    .local v1, "next":I
    :goto_2
    if-ge v1, p3, :cond_a

    .line 629
    :cond_4
    add-int/lit8 v1, p2, 0x1

    :goto_6
    if-lt v1, p4, :cond_22

    .line 639
    :cond_8
    const/4 v3, -0x1

    return v3

    .line 620
    :cond_a
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v3, v1

    .line 621
    .local v2, "nextItem":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 622
    .local v0, "cmp":I
    if-nez v0, :cond_4

    .line 625
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_21

    .line 619
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 626
    :cond_21
    return v1

    .line 630
    .end local v0    # "cmp":I
    .end local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_22
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v3, v1

    .line 631
    .restart local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 632
    .restart local v0    # "cmp":I
    if-nez v0, :cond_8

    .line 635
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_39

    .line 629
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 636
    :cond_39
    return v1
.end method

.method private merge([Ljava/lang/Object;I)V
    .registers 13
    .param p2, "newDataSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;I)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "newData":[Ljava/lang/Object;, "[TT;"
    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 279
    iget v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/2addr v6, p2

    add-int/lit8 v2, v6, 0xa

    .line 280
    .local v2, "mergedCapacity":I
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    nop

    nop

    iput-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 281
    iput v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    .line 283
    const/4 v3, 0x0

    .line 284
    .local v3, "newDataStart":I
    :cond_16
    :goto_16
    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v7, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    if-ge v6, v7, :cond_47

    .line 285
    :cond_1c
    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v7, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    if-eq v6, v7, :cond_4a

    .line 295
    if-eq v3, p2, :cond_66

    .line 303
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    aget-object v5, v6, v7

    .line 304
    .local v5, "oldItem":Ljava/lang/Object;, "TT;"
    aget-object v4, p1, v3

    .line 305
    .local v4, "newItem":Ljava/lang/Object;, "TT;"
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v5, v4}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 306
    .local v0, "compare":I
    if-gtz v0, :cond_7d

    .line 312
    if-eqz v0, :cond_9a

    .line 323
    :cond_36
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    aput-object v5, v6, v7

    .line 324
    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    goto :goto_16

    .line 284
    .end local v0    # "compare":I
    .end local v4    # "newItem":Ljava/lang/Object;, "TT;"
    .end local v5    # "oldItem":Ljava/lang/Object;, "TT;"
    :cond_47
    if-lt v3, p2, :cond_1c

    .line 327
    :goto_49
    return-void

    .line 287
    :cond_4a
    sub-int v1, p2, v3

    .line 288
    .local v1, "itemCount":I
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    invoke-static {p1, v3, v6, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 289
    iget v6, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/2addr v6, v1

    iput v6, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    .line 290
    iget v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/2addr v6, v1

    iput v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 291
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    sub-int/2addr v7, v1

    invoke-virtual {v6, v7, v1}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_49

    .line 297
    .end local v1    # "itemCount":I
    :cond_66
    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    iget v7, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    sub-int v1, v6, v7

    .line 298
    .restart local v1    # "itemCount":I
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget-object v8, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v9, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    invoke-static {v6, v7, v8, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    iget v6, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/2addr v6, v1

    iput v6, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    goto :goto_49

    .line 308
    .end local v1    # "itemCount":I
    .restart local v0    # "compare":I
    .restart local v4    # "newItem":Ljava/lang/Object;, "TT;"
    .restart local v5    # "oldItem":Ljava/lang/Object;, "TT;"
    :cond_7d
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    aput-object v4, v6, v7

    .line 309
    iget v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 310
    add-int/lit8 v3, v3, 0x1

    .line 311
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7, v9}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto/16 :goto_16

    .line 312
    :cond_9a
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v5, v4}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_36

    .line 314
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    aput-object v4, v6, v7

    .line 315
    add-int/lit8 v3, v3, 0x1

    .line 316
    iget v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    .line 317
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v5, v4}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_16

    .line 318
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v7, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7, v9}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto/16 :goto_16
.end method

.method private remove(Ljava/lang/Object;Z)Z
    .registers 10
    .param p2, "notify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    .line 443
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v6

    .line 444
    .local v6, "index":I
    const/4 v0, -0x1

    if-eq v6, v0, :cond_14

    .line 447
    invoke-direct {p0, v6, p2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 448
    const/4 v0, 0x1

    return v0

    .line 445
    :cond_14
    return v3
.end method

.method private removeItemAtIndex(IZ)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "notify"    # Z

    .prologue
    .line 452
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 453
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 454
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 455
    if-nez p2, :cond_1e

    .line 458
    :goto_1d
    return-void

    .line 456
    :cond_1e
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    goto :goto_1d
.end method

.method private throwIfMerging()V
    .registers 3

    .prologue
    .line 330
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-nez v0, :cond_5

    .line 333
    return-void

    .line 331
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Cannot call this method from within addAll"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 135
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "items":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    nop

    nop

    .line 185
    .local v0, "copy":[Ljava/lang/Object;, "[TT;"
    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/util/SortedList;->addAll([Ljava/lang/Object;Z)V

    .line 186
    return-void
.end method

.method public varargs addAll([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "items":[Ljava/lang/Object;, "[TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/util/SortedList;->addAll([Ljava/lang/Object;Z)V

    .line 174
    return-void
.end method

.method public addAll([Ljava/lang/Object;Z)V
    .registers 7
    .param p2, "mayModifyInput"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;Z)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "items":[Ljava/lang/Object;, "[TT;"
    const/4 v3, 0x0

    .line 151
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 152
    array-length v1, p1

    if-eqz v1, :cond_1d

    .line 155
    if-nez p2, :cond_1e

    .line 158
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    array-length v2, p1

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    nop

    nop

    .line 159
    .local v0, "copy":[Ljava/lang/Object;, "[TT;"
    array-length v1, p1

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    invoke-direct {p0, v0}, Landroid/support/v7/util/SortedList;->addAllInternal([Ljava/lang/Object;)V

    .line 163
    .end local v0    # "copy":[Ljava/lang/Object;, "[TT;"
    :goto_1c
    return-void

    .line 153
    :cond_1d
    return-void

    .line 156
    :cond_1e
    invoke-direct {p0, p1}, Landroid/support/v7/util/SortedList;->addAllInternal([Ljava/lang/Object;)V

    goto :goto_1c
.end method

.method public beginBatchedUpdates()V
    .registers 3

    .prologue
    .line 368
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 369
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-nez v0, :cond_12

    .line 372
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_13

    .line 375
    :goto_d
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 376
    return-void

    .line 370
    :cond_12
    return-void

    .line 373
    :cond_13
    new-instance v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-direct {v0, v1}, Landroid/support/v7/util/SortedList$BatchedCallback;-><init>(Landroid/support/v7/util/SortedList$Callback;)V

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    goto :goto_d
.end method

.method public clear()V
    .registers 5

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    const/4 v3, 0x0

    .line 666
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 667
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-eqz v1, :cond_18

    .line 670
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 671
    .local v0, "prevSize":I
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v1, v3, v0, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 672
    iput v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 673
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v1, v3, v0}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    .line 674
    return-void

    .line 668
    .end local v0    # "prevSize":I
    :cond_18
    return-void
.end method

.method public endBatchedUpdates()V
    .registers 3

    .prologue
    .line 382
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 383
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-nez v0, :cond_10

    .line 386
    :goto_9
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eq v0, v1, :cond_18

    .line 389
    :goto_f
    return-void

    .line 384
    :cond_10
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    check-cast v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    goto :goto_9

    .line 387
    :cond_18
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    invoke-static {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    goto :goto_f
.end method

.method public get(I)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 555
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-lt p1, v0, :cond_2b

    .line 556
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Asked to get item at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " but size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 555
    :cond_2b
    if-ltz p1, :cond_4

    .line 559
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-nez v0, :cond_36

    .line 566
    :cond_31
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0

    .line 562
    :cond_36
    iget v0, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    if-lt p1, v0, :cond_31

    .line 563
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    sub-int v1, p1, v1

    iget v2, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    add-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    const/4 v5, 0x4

    const/4 v7, -0x1

    .line 578
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    if-nez v0, :cond_12

    .line 589
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v0

    return v0

    .line 579
    :cond_12
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v6

    .line 580
    .local v6, "index":I
    if-ne v6, v7, :cond_2d

    .line 583
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mOldData:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    iget v4, p0, Landroid/support/v7/util/SortedList;->mOldDataSize:I

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;[Ljava/lang/Object;III)I

    move-result v6

    .line 584
    if-ne v6, v7, :cond_2e

    .line 587
    return v7

    .line 581
    :cond_2d
    return v6

    .line 585
    :cond_2e
    iget v0, p0, Landroid/support/v7/util/SortedList;->mOldDataStart:I

    sub-int v0, v6, v0

    iget v1, p0, Landroid/support/v7/util/SortedList;->mMergedSize:I

    add-int/2addr v0, v1

    return v0
.end method

.method public recalculatePositionOfItemAt(I)V
    .registers 5
    .param p1, "index"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    const/4 v2, 0x0

    .line 535
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 537
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 538
    .local v0, "item":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1, v2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 539
    invoke-direct {p0, v0, v2}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v1

    .line 540
    .local v1, "newIndex":I
    if-ne p1, v1, :cond_12

    .line 543
    :goto_11
    return-void

    .line 541
    :cond_12
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    goto :goto_11
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 424
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 425
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->remove(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public removeItemAt(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 436
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 437
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 438
    .local v0, "item":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 439
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 105
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    return v0
.end method

.method public updateItemAt(ILjava/lang/Object;)V
    .registers 10
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 481
    invoke-direct {p0}, Landroid/support/v7/util/SortedList;->throwIfMerging()V

    .line 482
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 484
    .local v2, "existing":Ljava/lang/Object;, "TT;"
    if-ne v2, p2, :cond_1a

    :cond_b
    move v1, v5

    .line 485
    .local v1, "contentsChanged":Z
    :goto_c
    if-ne v2, p2, :cond_24

    .line 496
    :cond_e
    if-nez v1, :cond_39

    .line 500
    :goto_10
    invoke-direct {p0, p1, v4}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 501
    invoke-direct {p0, p2, v4}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v3

    .line 502
    .local v3, "newIndex":I
    if-ne p1, v3, :cond_3f

    .line 505
    :goto_19
    return-void

    .line 484
    .end local v1    # "contentsChanged":Z
    .end local v3    # "newIndex":I
    :cond_1a
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    move v1, v4

    goto :goto_c

    .line 487
    .restart local v1    # "contentsChanged":Z
    :cond_24
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 488
    .local v0, "cmp":I
    if-nez v0, :cond_e

    .line 489
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v4, p1

    .line 490
    if-nez v1, :cond_33

    .line 493
    :goto_32
    return-void

    .line 491
    :cond_33
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto :goto_32

    .line 497
    .end local v0    # "cmp":I
    :cond_39
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, p1, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto :goto_10

    .line 503
    .restart local v3    # "newIndex":I
    :cond_3f
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v3}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    goto :goto_19
.end method
