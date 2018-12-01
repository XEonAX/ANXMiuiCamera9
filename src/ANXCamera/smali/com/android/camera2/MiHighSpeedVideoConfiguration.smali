.class public Lcom/android/camera2/MiHighSpeedVideoConfiguration;
.super Ljava/lang/Object;
.source "MiHighSpeedVideoConfiguration.java"


# instance fields
.field private final mBatchSizeMax:I

.field private final mFpsMax:I

.field private final mFpsMin:I

.field private final mFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mHeight:I

.field private final mSize:Landroid/util/Size;

.field private final mWidth:I


# direct methods
.method private constructor <init>(IIIII)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "fpsMin"    # I
    .param p4, "fpsMax"    # I
    .param p5, "batchSizeMax"    # I

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/16 v0, 0x78

    if-ge p4, v0, :cond_0

    .line 43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "fpsMax must be at least 120"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    iput p4, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMax:I

    .line 47
    const-string/jumbo v0, "width must be positive"

    invoke-static {p1, v0}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mWidth:I

    .line 48
    const-string/jumbo v0, "height must be positive"

    invoke-static {p2, v0}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mHeight:I

    .line 49
    const-string/jumbo v0, "fpsMin must be positive"

    invoke-static {p3, v0}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMin:I

    .line 50
    new-instance v0, Landroid/util/Size;

    iget v1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mWidth:I

    iget v2, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mHeight:I

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mSize:Landroid/util/Size;

    .line 51
    const-string/jumbo v0, "batchSizeMax must be positive"

    invoke-static {p5, v0}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->checkArgumentPositive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mBatchSizeMax:I

    .line 52
    new-instance v0, Landroid/util/Range;

    iget v1, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMin:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsMax:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    iput-object v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsRange:Landroid/util/Range;

    .line 53
    return-void
.end method

.method private static checkArgumentPositive(ILjava/lang/String;)I
    .locals 1
    .param p0, "value"    # I
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 119
    if-gtz p0, :cond_0

    .line 120
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_0
    return p0
.end method

.method public static unmarshal([II)Ljava/util/List;
    .locals 12
    .param p0, "buffer"    # [I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([II)",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera2/MiHighSpeedVideoConfiguration;",
            ">;"
        }
    .end annotation

    .prologue
    .line 15
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v10, "empty buffer"

    invoke-direct {v0, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 19
    :cond_1
    array-length v0, p0

    mul-int/lit8 v10, p1, 0x5

    if-ge v0, v10, :cond_2

    .line 20
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "invalid buffer length "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, p0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v0, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 25
    .local v6, "configurations":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera2/MiHighSpeedVideoConfiguration;>;"
    const/4 v8, 0x0

    .line 26
    .local v8, "index":I
    const/4 v7, 0x0

    .local v7, "i":I
    move v9, v8

    .end local v8    # "index":I
    .local v9, "index":I
    :goto_0
    if-ge v7, p1, :cond_3

    .line 27
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "index":I
    .restart local v8    # "index":I
    aget v1, p0, v9

    .line 28
    .local v1, "width":I
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "index":I
    .restart local v9    # "index":I
    aget v2, p0, v8

    .line 29
    .local v2, "height":I
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "index":I
    .restart local v8    # "index":I
    aget v3, p0, v9

    .line 30
    .local v3, "fpsMin":I
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "index":I
    .restart local v9    # "index":I
    aget v4, p0, v8

    .line 31
    .local v4, "fpsMax":I
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "index":I
    .restart local v8    # "index":I
    aget v5, p0, v9

    .line 33
    .local v5, "batchSizeMax":I
    new-instance v0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;

    invoke-direct/range {v0 .. v5}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;-><init>(IIIII)V

    .line 32
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    add-int/lit8 v7, v7, 0x1

    move v9, v8

    .end local v8    # "index":I
    .restart local v9    # "index":I
    goto :goto_0

    .line 36
    .end local v1    # "width":I
    .end local v2    # "height":I
    .end local v3    # "fpsMin":I
    .end local v4    # "fpsMax":I
    .end local v5    # "batchSizeMax":I
    :cond_3
    return-object v6
.end method


# virtual methods
.method public getFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getSize()Landroid/util/Size;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->mSize:Landroid/util/Size;

    return-object v0
.end method
