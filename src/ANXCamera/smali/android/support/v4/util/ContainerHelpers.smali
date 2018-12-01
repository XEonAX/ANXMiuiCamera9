.class Landroid/support/v4/util/ContainerHelpers;
.super Ljava/lang/Object;
.source "ContainerHelpers.java"


# static fields
.field static final EMPTY_INTS:[I

.field static final EMPTY_LONGS:[J

.field static final EMPTY_OBJECTS:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 20
    new-array v0, v1, [I

    sput-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    .line 21
    new-array v0, v1, [J

    sput-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_LONGS:[J

    .line 22
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static binarySearch([III)I
    .registers 8
    .param p0, "array"    # [I
    .param p1, "size"    # I
    .param p2, "value"    # I

    .prologue
    .line 46
    const/4 v1, 0x0

    .line 47
    .local v1, "lo":I
    add-int/lit8 v0, p1, -0x1

    .line 49
    .local v0, "hi":I
    :goto_3
    if-le v1, v0, :cond_8

    .line 61
    xor-int/lit8 v4, v1, -0x1

    return v4

    .line 50
    :cond_8
    add-int v4, v1, v0

    ushr-int/lit8 v2, v4, 0x1

    .line 51
    .local v2, "mid":I
    aget v3, p0, v2

    .line 53
    .local v3, "midVal":I
    if-lt v3, p2, :cond_13

    .line 55
    if-gt v3, p2, :cond_16

    .line 58
    return v2

    .line 54
    :cond_13
    add-int/lit8 v1, v2, 0x1

    goto :goto_3

    .line 56
    :cond_16
    add-int/lit8 v0, v2, -0x1

    goto :goto_3
.end method

.method static binarySearch([JIJ)I
    .registers 12
    .param p0, "array"    # [J
    .param p1, "size"    # I
    .param p2, "value"    # J

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 65
    const/4 v1, 0x0

    .line 66
    .local v1, "lo":I
    add-int/lit8 v0, p1, -0x1

    .line 68
    .local v0, "hi":I
    :goto_5
    if-le v1, v0, :cond_a

    .line 80
    xor-int/lit8 v3, v1, -0x1

    return v3

    .line 69
    :cond_a
    add-int v3, v1, v0

    ushr-int/lit8 v2, v3, 0x1

    .line 70
    .local v2, "mid":I
    aget-wide v4, p0, v2

    .line 72
    .local v4, "midVal":J
    cmp-long v3, v4, p2

    if-ltz v3, :cond_1a

    move v3, v6

    :goto_15
    if-nez v3, :cond_1c

    .line 73
    add-int/lit8 v1, v2, 0x1

    goto :goto_5

    :cond_1a
    move v3, v7

    .line 72
    goto :goto_15

    .line 74
    :cond_1c
    cmp-long v3, v4, p2

    if-gtz v3, :cond_26

    move v3, v6

    :goto_21
    if-nez v3, :cond_28

    .line 75
    add-int/lit8 v0, v2, -0x1

    goto :goto_5

    :cond_26
    move v3, v7

    .line 74
    goto :goto_21

    .line 77
    :cond_28
    return v2
.end method

.method public static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 41
    if-ne p0, p1, :cond_5

    :cond_3
    const/4 v0, 0x1

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-eqz p0, :cond_4

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_4
.end method

.method public static idealByteArraySize(I)I
    .registers 4
    .param p0, "need"    # I

    .prologue
    const/4 v2, 0x1

    .line 33
    const/4 v0, 0x4

    .local v0, "i":I
    :goto_2
    const/16 v1, 0x20

    if-lt v0, v1, :cond_7

    .line 37
    return p0

    .line 34
    :cond_7
    shl-int v1, v2, v0

    add-int/lit8 v1, v1, -0xc

    if-le p0, v1, :cond_10

    .line 33
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 35
    :cond_10
    shl-int v1, v2, v0

    add-int/lit8 v1, v1, -0xc

    return v1
.end method

.method public static idealIntArraySize(I)I
    .registers 2
    .param p0, "need"    # I

    .prologue
    .line 25
    mul-int/lit8 v0, p0, 0x4

    invoke-static {v0}, Landroid/support/v4/util/ContainerHelpers;->idealByteArraySize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public static idealLongArraySize(I)I
    .registers 2
    .param p0, "need"    # I

    .prologue
    .line 29
    mul-int/lit8 v0, p0, 0x8

    invoke-static {v0}, Landroid/support/v4/util/ContainerHelpers;->idealByteArraySize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x8

    return v0
.end method
