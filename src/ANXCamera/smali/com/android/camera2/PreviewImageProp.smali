.class public Lcom/android/camera2/PreviewImageProp;
.super Ljava/lang/Object;
.source "PreviewImageProp.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mData:[B

.field private mImage:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/media/Image;",
            ">;"
        }
    .end annotation
.end field

.field private mReady:Z

.field private mUVStride:I

.field private mYLength:I

.field private mYStride:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/android/camera2/PreviewImageProp;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/PreviewImageProp;->TAG:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/media/Image;)V
    .locals 1
    .param p1, "image"    # Landroid/media/Image;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Ljava/lang/ref/WeakReference;

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    .line 30
    return-void
.end method

.method private convert()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x2

    const/4 v8, 0x0

    .line 61
    iget-object v5, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Ljava/lang/ref/WeakReference;

    if-eqz v5, :cond_0

    .line 62
    iget-object v5, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/Image;

    .line 63
    .local v4, "image":Landroid/media/Image;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/media/Image;->getFormat()I

    move-result v5

    const/16 v6, 0x23

    if-ne v5, v6, :cond_0

    .line 65
    invoke-virtual {v4}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v5

    aget-object v5, v5, v8

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 66
    .local v0, "buffer0":Ljava/nio/ByteBuffer;
    invoke-virtual {v4}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v5

    aget-object v5, v5, v9

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 67
    .local v2, "buffer2":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    .line 68
    .local v1, "buffer0_size":I
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    .line 69
    .local v3, "buffer2_size":I
    sget-object v5, Lcom/android/camera2/PreviewImageProp;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "convertYUV420888ToNV21: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Landroid/media/Image;->getWidth()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "x"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Landroid/media/Image;->getHeight()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 70
    const-string/jumbo v7, " "

    .line 69
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 70
    invoke-virtual {v4}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v7

    aget-object v7, v7, v9

    invoke-virtual {v7}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    .line 69
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    add-int v5, v1, v3

    new-array v5, v5, [B

    iput-object v5, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    .line 72
    iget-object v5, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    invoke-virtual {v0, v5, v8, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 73
    iget-object v5, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    invoke-virtual {v2, v5, v1, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 74
    iput v1, p0, Lcom/android/camera2/PreviewImageProp;->mYLength:I

    .line 75
    invoke-virtual {v4}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v5

    aget-object v5, v5, v8

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v5

    iput v5, p0, Lcom/android/camera2/PreviewImageProp;->mYStride:I

    .line 76
    invoke-virtual {v4}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v5

    aget-object v5, v5, v9

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v5

    iput v5, p0, Lcom/android/camera2/PreviewImageProp;->mUVStride:I

    .line 81
    .end local v0    # "buffer0":Ljava/nio/ByteBuffer;
    .end local v1    # "buffer0_size":I
    .end local v2    # "buffer2":Ljava/nio/ByteBuffer;
    .end local v3    # "buffer2_size":I
    .end local v4    # "image":Landroid/media/Image;
    :cond_0
    iput-object v10, p0, Lcom/android/camera2/PreviewImageProp;->mImage:Ljava/lang/ref/WeakReference;

    .line 82
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    .line 83
    return-void
.end method

.method public static removePadding(Lcom/android/camera2/PreviewImageProp;II)[B
    .locals 16
    .param p0, "image"    # Lcom/android/camera2/PreviewImageProp;
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 94
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera2/PreviewImageProp;->getData()[B

    move-result-object v6

    .line 95
    .local v6, "previewData":[B
    array-length v9, v6

    int-to-double v10, v9

    mul-int v9, p1, p2

    int-to-double v12, v9

    const-wide/high16 v14, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v12, v14

    cmpg-double v9, v10, v12

    if-gtz v9, :cond_0

    .line 96
    sget-object v9, Lcom/android/camera2/PreviewImageProp;->TAG:Ljava/lang/String;

    const-string/jumbo v10, "removePadding: no padding found in data"

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    return-object v6

    .line 100
    :cond_0
    mul-int v9, p1, p2

    int-to-double v10, v9

    const-wide/high16 v12, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v10, v12

    double-to-int v7, v10

    .line 101
    .local v7, "size":I
    const/4 v8, 0x0

    .line 102
    .local v8, "srcPos":I
    const/4 v2, 0x0

    .line 103
    .local v2, "destPos":I
    new-array v5, v7, [B

    .line 105
    .local v5, "noStrideData":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    move/from16 v0, p2

    if-ge v3, v0, :cond_2

    .line 106
    move/from16 v0, p1

    invoke-static {v6, v8, v5, v2, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 107
    add-int/lit8 v9, p2, -0x1

    if-ne v3, v9, :cond_1

    .line 108
    add-int v8, v8, p1

    .line 112
    :goto_1
    add-int v2, v2, p1

    .line 105
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 110
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera2/PreviewImageProp;->getYStride()I

    move-result v9

    add-int/2addr v8, v9

    goto :goto_1

    .line 115
    :cond_2
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2
    div-int/lit8 v9, p2, 0x2

    if-ge v4, v9, :cond_4

    .line 116
    div-int/lit8 v9, p2, 0x2

    add-int/lit8 v9, v9, -0x1

    if-ne v4, v9, :cond_3

    .line 118
    add-int/lit8 v9, p1, -0x1

    invoke-static {v6, v8, v5, v2, v9}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 122
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera2/PreviewImageProp;->getUVStride()I

    move-result v9

    add-int/2addr v8, v9

    .line 123
    add-int v2, v2, p1

    .line 115
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 120
    :cond_3
    move/from16 v0, p1

    invoke-static {v6, v8, v5, v2, v0}, Ljava/lang/System;->arraycopy([BI[BII)V

    goto :goto_3

    .line 125
    :cond_4
    return-object v5
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    .line 34
    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/PreviewImageProp;->mData:[B

    return-object v0
.end method

.method public getUVStride()I
    .locals 1

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    .line 55
    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    .line 57
    :cond_0
    iget v0, p0, Lcom/android/camera2/PreviewImageProp;->mUVStride:I

    return v0
.end method

.method public getYLength()I
    .locals 1

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    .line 41
    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    .line 43
    :cond_0
    iget v0, p0, Lcom/android/camera2/PreviewImageProp;->mYLength:I

    return v0
.end method

.method public getYStride()I
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/android/camera2/PreviewImageProp;->mReady:Z

    if-nez v0, :cond_0

    .line 48
    invoke-direct {p0}, Lcom/android/camera2/PreviewImageProp;->convert()V

    .line 50
    :cond_0
    iget v0, p0, Lcom/android/camera2/PreviewImageProp;->mYStride:I

    return v0
.end method
