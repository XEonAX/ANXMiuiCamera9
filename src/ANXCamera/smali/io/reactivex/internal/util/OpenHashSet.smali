.class public final Lio/reactivex/internal/util/OpenHashSet;
.super Ljava/lang/Object;
.source "OpenHashSet.java"


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
.field keys:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field final loadFactor:F

.field mask:I

.field maxSize:I

.field size:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 37
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    const/16 v0, 0x10

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Lio/reactivex/internal/util/OpenHashSet;-><init>(IF)V

    .line 38
    return-void
.end method

.method public constructor <init>(IF)V
    .locals 2
    .param p1, "capacity"    # I
    .param p2, "loadFactor"    # F

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput p2, p0, Lio/reactivex/internal/util/OpenHashSet;->loadFactor:F

    .line 51
    invoke-static {p1}, Lio/reactivex/internal/util/Pow2;->roundToPowerOfTwo(I)I

    move-result v0

    .line 52
    .local v0, "c":I
    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lio/reactivex/internal/util/OpenHashSet;->mask:I

    .line 53
    int-to-float v1, v0

    mul-float/2addr v1, p2

    float-to-int v1, v1

    iput v1, p0, Lio/reactivex/internal/util/OpenHashSet;->maxSize:I

    .line 54
    new-array v1, v0, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, p0, Lio/reactivex/internal/util/OpenHashSet;->keys:[Ljava/lang/Object;

    .line 55
    return-void
.end method

.method static mix(I)I
    .locals 2
    .param p0, "x"    # I

    .prologue
    .line 164
    const v1, -0x61c88647

    mul-int v0, p0, v1

    .line 165
    .local v0, "h":I
    ushr-int/lit8 v1, v0, 0x10

    xor-int/2addr v1, v0

    return v1
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x0

    .line 58
    iget-object v0, p0, Lio/reactivex/internal/util/OpenHashSet;->keys:[Ljava/lang/Object;

    .line 59
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    iget v2, p0, Lio/reactivex/internal/util/OpenHashSet;->mask:I

    .line 61
    .local v2, "m":I
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-static {v4}, Lio/reactivex/internal/util/OpenHashSet;->mix(I)I

    move-result v4

    and-int v3, v4, v2

    .line 62
    .local v3, "pos":I
    aget-object v1, v0, v3

    .line 63
    .local v1, "curr":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 78
    :cond_0
    aput-object p1, v0, v3

    .line 79
    iget v4, p0, Lio/reactivex/internal/util/OpenHashSet;->size:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lio/reactivex/internal/util/OpenHashSet;->size:I

    iget v5, p0, Lio/reactivex/internal/util/OpenHashSet;->maxSize:I

    if-ge v4, v5, :cond_4

    .line 82
    :goto_0
    const/4 v4, 0x1

    return v4

    .line 64
    :cond_1
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 68
    :cond_2
    add-int/lit8 v4, v3, 0x1

    and-int v3, v4, v2

    .line 69
    aget-object v1, v0, v3

    .line 70
    if-eqz v1, :cond_0

    .line 73
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 74
    return v5

    .line 65
    :cond_3
    return v5

    .line 80
    :cond_4
    invoke-virtual {p0}, Lio/reactivex/internal/util/OpenHashSet;->rehash()V

    goto :goto_0
.end method

.method public keys()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/util/OpenHashSet;->keys:[Ljava/lang/Object;

    return-object v0
.end method

.method rehash()V
    .locals 10

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/util/OpenHashSet;->keys:[Ljava/lang/Object;

    .line 137
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    array-length v2, v0

    .line 138
    .local v2, "i":I
    shl-int/lit8 v6, v2, 0x1

    .line 139
    .local v6, "newCap":I
    add-int/lit8 v5, v6, -0x1

    .line 141
    .local v5, "m":I
    new-array v1, v6, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    .line 144
    .local v1, "b":[Ljava/lang/Object;, "[TT;"
    iget v3, p0, Lio/reactivex/internal/util/OpenHashSet;->size:I

    .local v3, "j":I
    move v4, v3

    .end local v3    # "j":I
    .local v4, "j":I
    :goto_0
    add-int/lit8 v3, v4, -0x1

    .end local v4    # "j":I
    .restart local v3    # "j":I
    if-nez v4, :cond_0

    .line 158
    iput v5, p0, Lio/reactivex/internal/util/OpenHashSet;->mask:I

    .line 159
    int-to-float v8, v6

    iget v9, p0, Lio/reactivex/internal/util/OpenHashSet;->loadFactor:F

    mul-float/2addr v8, v9

    float-to-int v8, v8

    iput v8, p0, Lio/reactivex/internal/util/OpenHashSet;->maxSize:I

    .line 160
    iput-object v1, p0, Lio/reactivex/internal/util/OpenHashSet;->keys:[Ljava/lang/Object;

    .line 161
    return-void

    .line 145
    :cond_0
    add-int/lit8 v2, v2, -0x1

    aget-object v8, v0, v2

    if-eqz v8, :cond_0

    .line 146
    aget-object v8, v0, v2

    invoke-virtual {v8}, Ljava/lang/Object;->hashCode()I

    move-result v8

    invoke-static {v8}, Lio/reactivex/internal/util/OpenHashSet;->mix(I)I

    move-result v8

    and-int v7, v8, v5

    .line 147
    .local v7, "pos":I
    aget-object v8, v1, v7

    if-nez v8, :cond_2

    .line 155
    :cond_1
    aget-object v8, v0, v2

    aput-object v8, v1, v7

    move v4, v3

    .line 156
    .end local v3    # "j":I
    .restart local v4    # "j":I
    goto :goto_0

    .line 149
    .end local v4    # "j":I
    .restart local v3    # "j":I
    :cond_2
    :goto_1
    add-int/lit8 v8, v7, 0x1

    and-int v7, v8, v5

    .line 150
    aget-object v8, v1, v7

    if-eqz v8, :cond_1

    goto :goto_1
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x0

    .line 85
    iget-object v0, p0, Lio/reactivex/internal/util/OpenHashSet;->keys:[Ljava/lang/Object;

    .line 86
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    iget v2, p0, Lio/reactivex/internal/util/OpenHashSet;->mask:I

    .line 87
    .local v2, "m":I
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-static {v4}, Lio/reactivex/internal/util/OpenHashSet;->mix(I)I

    move-result v4

    and-int v3, v4, v2

    .line 88
    .local v3, "pos":I
    aget-object v1, v0, v3

    .line 89
    .local v1, "curr":Ljava/lang/Object;, "TT;"
    if-eqz v1, :cond_1

    .line 92
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 96
    :cond_0
    add-int/lit8 v4, v3, 0x1

    and-int v3, v4, v2

    .line 97
    aget-object v1, v0, v3

    .line 98
    if-eqz v1, :cond_3

    .line 101
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 102
    invoke-virtual {p0, v3, v0, v2}, Lio/reactivex/internal/util/OpenHashSet;->removeEntry(I[Ljava/lang/Object;I)Z

    move-result v4

    return v4

    .line 90
    :cond_1
    return v5

    .line 93
    :cond_2
    invoke-virtual {p0, v3, v0, v2}, Lio/reactivex/internal/util/OpenHashSet;->removeEntry(I[Ljava/lang/Object;I)Z

    move-result v4

    return v4

    .line 99
    :cond_3
    return v5
.end method

.method removeEntry(I[Ljava/lang/Object;I)Z
    .locals 5
    .param p1, "pos"    # I
    .param p3, "m"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[TT;I)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<TT;>;"
    .local p2, "a":[Ljava/lang/Object;, "[TT;"
    const/4 v4, 0x0

    .line 108
    iget v3, p0, Lio/reactivex/internal/util/OpenHashSet;->size:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lio/reactivex/internal/util/OpenHashSet;->size:I

    .line 114
    :goto_0
    move v1, p1

    .line 115
    .local v1, "last":I
    add-int/lit8 v3, p1, 0x1

    and-int p1, v3, p3

    .line 117
    :goto_1
    aget-object v0, p2, p1

    .line 118
    .local v0, "curr":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Lio/reactivex/internal/util/OpenHashSet;->mix(I)I

    move-result v3

    and-int v2, v3, p3

    .line 124
    .local v2, "slot":I
    if-le v1, p1, :cond_1

    if-ge v1, v2, :cond_4

    .line 128
    :goto_2
    add-int/lit8 v3, p1, 0x1

    and-int p1, v3, p3

    goto :goto_1

    .line 119
    .end local v2    # "slot":I
    :cond_0
    aput-object v4, p2, v1

    .line 120
    const/4 v3, 0x1

    return v3

    .line 124
    .restart local v2    # "slot":I
    :cond_1
    if-lt v1, v2, :cond_3

    .line 130
    :cond_2
    aput-object v0, p2, v1

    goto :goto_0

    .line 124
    :cond_3
    if-gt v2, p1, :cond_2

    goto :goto_2

    :cond_4
    if-gt v2, p1, :cond_2

    goto :goto_2
.end method
