.class Landroid/support/v7/widget/OpReorderer;
.super Ljava/lang/Object;
.source "OpReorderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/OpReorderer$Callback;
    }
.end annotation


# instance fields
.field final mCallback:Landroid/support/v7/widget/OpReorderer$Callback;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/OpReorderer$Callback;)V
    .registers 2
    .param p1, "callback"    # Landroid/support/v7/widget/OpReorderer$Callback;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    .line 33
    return-void
.end method

.method private getLastMoveOutOfOrder(Ljava/util/List;)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    const/4 v0, 0x0

    .line 219
    .local v0, "foundNonMove":Z
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_7
    if-gez v1, :cond_b

    .line 229
    const/4 v3, -0x1

    return v3

    .line 220
    :cond_b
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 221
    .local v2, "op1":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_1a

    .line 226
    const/4 v0, 0x1

    .line 219
    :cond_17
    add-int/lit8 v1, v1, -0x1

    goto :goto_7

    .line 222
    :cond_1a
    if-eqz v0, :cond_17

    .line 223
    return v1
.end method

.method private swapMoveAdd(Ljava/util/List;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 9
    .param p2, "move"    # I
    .param p3, "moveOp"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .param p4, "add"    # I
    .param p5, "addOp"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;I",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            "I",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ")V"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    const/4 v0, 0x0

    .line 163
    .local v0, "offset":I
    iget v1, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v2, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-lt v1, v2, :cond_25

    .line 166
    :goto_7
    iget v1, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-lt v1, v2, :cond_27

    .line 169
    :goto_d
    iget v1, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-le v1, v2, :cond_2a

    .line 172
    :goto_13
    iget v1, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-le v1, v2, :cond_32

    .line 175
    :goto_19
    iget v1, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/2addr v1, v0

    iput v1, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 176
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 177
    invoke-interface {p1, p4, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 178
    return-void

    .line 164
    :cond_25
    const/4 v0, -0x1

    goto :goto_7

    .line 167
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 170
    :cond_2a
    iget v1, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v1, v2

    iput v1, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_13

    .line 173
    :cond_32
    iget v1, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v2, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v1, v2

    iput v1, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_19
.end method

.method private swapMoveOp(Ljava/util/List;II)V
    .registers 10
    .param p2, "badMove"    # I
    .param p3, "next"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 46
    .local v3, "moveOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 47
    .local v5, "nextOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v0, v5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_2a

    .line 58
    :goto_11
    return-void

    :pswitch_12
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    .line 49
    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/OpReorderer;->swapMoveRemove(Ljava/util/List;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_11

    :pswitch_1a
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    .line 52
    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/OpReorderer;->swapMoveAdd(Ljava/util/List;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_11

    :pswitch_22
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    .line 55
    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/OpReorderer;->swapMoveUpdate(Ljava/util/List;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_11

    .line 47
    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_12
        :pswitch_22
    .end packed-switch
.end method


# virtual methods
.method reorderOps(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "ops":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    :goto_0
    invoke-direct {p0, p1}, Landroid/support/v7/widget/OpReorderer;->getLastMoveOutOfOrder(Ljava/util/List;)I

    move-result v0

    .local v0, "badMove":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    .line 42
    return-void

    .line 40
    :cond_8
    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/OpReorderer;->swapMoveOp(Ljava/util/List;II)V

    goto :goto_0
.end method

.method swapMoveRemove(Ljava/util/List;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 15
    .param p2, "movePos"    # I
    .param p3, "moveOp"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .param p4, "removePos"    # I
    .param p5, "removeOp"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;I",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            "I",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 62
    const/4 v0, 0x0

    .line 64
    .local v0, "extraRm":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    const/4 v3, 0x0

    .line 67
    .local v3, "revertedMove":Z
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-lt v4, v5, :cond_52

    .line 74
    const/4 v1, 0x1

    .line 75
    .local v1, "moveIsBackwards":Z
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v5, v5, 0x1

    if-eq v4, v5, :cond_64

    .line 82
    :cond_13
    :goto_13
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-lt v4, v5, :cond_6f

    .line 84
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v6, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v5, v6

    if-lt v4, v5, :cond_76

    .line 98
    :goto_22
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-le v4, v5, :cond_8e

    .line 100
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v6, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v5, v6

    if-lt v4, v5, :cond_95

    .line 108
    .end local v0    # "extraRm":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :goto_31
    if-nez v3, :cond_b0

    .line 116
    if-nez v1, :cond_bc

    .line 132
    if-nez v0, :cond_f7

    .line 140
    :cond_37
    :goto_37
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v4, v5, :cond_114

    .line 143
    :goto_3d
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v4, v5, :cond_11d

    .line 148
    :cond_43
    :goto_43
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 149
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ne v4, v5, :cond_126

    .line 152
    invoke-interface {p1, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 154
    :goto_4f
    if-nez v0, :cond_12b

    .line 157
    :goto_51
    return-void

    .line 68
    .end local v1    # "moveIsBackwards":Z
    .restart local v0    # "extraRm":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_52
    const/4 v1, 0x0

    .line 69
    .restart local v1    # "moveIsBackwards":Z
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v4, v5, :cond_13

    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v6, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v5, v6

    if-ne v4, v5, :cond_13

    .line 71
    const/4 v3, 0x1

    goto :goto_13

    .line 75
    :cond_64
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v6, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v5, v6

    if-ne v4, v5, :cond_13

    .line 77
    const/4 v3, 0x1

    goto :goto_13

    .line 83
    :cond_6f
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_22

    .line 86
    :cond_76
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 87
    iput v8, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    .line 88
    iput v8, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 89
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eqz v4, :cond_85

    .line 94
    :goto_84
    return-void

    .line 90
    :cond_85
    invoke-interface {p1, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 91
    iget-object v4, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    invoke-interface {v4, p5}, Landroid/support/v7/widget/OpReorderer$Callback;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_84

    .line 99
    :cond_8e
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_31

    .line 101
    :cond_95
    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v4, v5

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int v2, v4, v5

    .line 103
    .local v2, "remaining":I
    iget-object v4, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    iget v5, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v5, v5, 0x1

    invoke-interface {v4, v8, v5, v2, v7}, Landroid/support/v7/widget/OpReorderer$Callback;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 104
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v4, v5

    iput v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_31

    .line 109
    .end local v0    # "extraRm":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local v2    # "remaining":I
    :cond_b0
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 110
    invoke-interface {p1, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 111
    iget-object v4, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    invoke-interface {v4, p3}, Landroid/support/v7/widget/OpReorderer$Callback;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 112
    return-void

    .line 117
    :cond_bc
    if-nez v0, :cond_d3

    .line 125
    :cond_be
    :goto_be
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v4, v5, :cond_ef

    .line 128
    :goto_c4
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-le v4, v5, :cond_43

    .line 129
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto/16 :goto_43

    .line 118
    :cond_d3
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v4, v5, :cond_e7

    .line 121
    :goto_d9
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-le v4, v5, :cond_be

    .line 122
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_be

    .line 119
    :cond_e7
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_d9

    .line 126
    :cond_ef
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_c4

    .line 133
    :cond_f7
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v4, v5, :cond_10c

    .line 136
    :goto_fd
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-lt v4, v5, :cond_37

    .line 137
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto/16 :goto_37

    .line 134
    :cond_10c
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_fd

    .line 141
    :cond_114
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto/16 :goto_3d

    .line 144
    :cond_11d
    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto/16 :goto_43

    .line 150
    :cond_126
    invoke-interface {p1, p4, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4f

    .line 155
    :cond_12b
    invoke-interface {p1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto/16 :goto_51
.end method

.method swapMoveUpdate(Ljava/util/List;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;ILandroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 14
    .param p2, "move"    # I
    .param p3, "moveOp"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .param p4, "update"    # I
    .param p5, "updateOp"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;I",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            "I",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    const/4 v7, 0x2

    .line 182
    const/4 v0, 0x0

    .line 183
    .local v0, "extraUp1":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    const/4 v1, 0x0

    .line 185
    .local v1, "extraUp2":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-lt v3, v4, :cond_35

    .line 187
    iget v3, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v4, v5

    if-lt v3, v4, :cond_3c

    .line 193
    .end local v0    # "extraUp1":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :goto_12
    iget v3, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-le v3, v4, :cond_4e

    .line 195
    iget v3, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v4, v5

    if-lt v3, v4, :cond_55

    .line 202
    .end local v1    # "extraUp2":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :goto_21
    invoke-interface {p1, p4, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 203
    iget v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gtz v3, :cond_70

    .line 206
    invoke-interface {p1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 207
    iget-object v3, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    invoke-interface {v3, p5}, Landroid/support/v7/widget/OpReorderer$Callback;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 209
    :goto_30
    if-nez v0, :cond_74

    .line 212
    :goto_32
    if-nez v1, :cond_78

    .line 215
    :goto_34
    return-void

    .line 186
    .restart local v0    # "extraUp1":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .restart local v1    # "extraUp2":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_35
    iget v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_12

    .line 189
    :cond_3c
    iget v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 190
    iget-object v3, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget-object v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    const/4 v6, 0x1

    invoke-interface {v3, v7, v4, v6, v5}, Landroid/support/v7/widget/OpReorderer$Callback;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    goto :goto_12

    .line 194
    .end local v0    # "extraUp1":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_4e
    iget v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_21

    .line 196
    :cond_55
    iget v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v3, v4

    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int v2, v3, v4

    .line 198
    .local v2, "remaining":I
    iget-object v3, p0, Landroid/support/v7/widget/OpReorderer;->mCallback:Landroid/support/v7/widget/OpReorderer$Callback;

    iget v4, p3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v3, v7, v4, v2, v5}, Landroid/support/v7/widget/OpReorderer$Callback;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v1

    .line 200
    iget v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr v3, v2

    iput v3, p5, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_21

    .line 204
    .end local v1    # "extraUp2":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local v2    # "remaining":I
    :cond_70
    invoke-interface {p1, p2, p5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_30

    .line 210
    :cond_74
    invoke-interface {p1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_32

    .line 213
    :cond_78
    invoke-interface {p1, p2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_34
.end method
