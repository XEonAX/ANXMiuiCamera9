.class public Lcom/android/camera2/ArcsoftDepthMap;
.super Ljava/lang/Object;
.source "ArcsoftDepthMap.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static final TAG_DEPTH_MAP_BLUR_LEVEL:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final TAG_DEPTH_MAP_FOCUS_POINT:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private mDepthMapHeader:[B

.field private mDepthMapOriginalData:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 31
    const-class v0, Lcom/android/camera2/ArcsoftDepthMap;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    .line 38
    const/16 v0, -0x7770

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    .line 37
    sput v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG_DEPTH_MAP_FOCUS_POINT:I

    .line 45
    const/16 v0, -0x776f

    invoke-static {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->defineTag(IS)I

    move-result v0

    .line 44
    sput v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG_DEPTH_MAP_BLUR_LEVEL:I

    .line 30
    return-void
.end method

.method public constructor <init>([B)V
    .locals 4
    .param p1, "originalData"    # [B

    .prologue
    const/16 v3, 0x80

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    sget-object v0, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ArcsoftDepthMap: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/android/camera2/ArcsoftDepthMap;->getHeaderTag([B)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "; 0x80 = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/android/camera2/ArcsoftDepthMap;->getHeaderTag([B)I

    move-result v0

    if-eq v0, v3, :cond_1

    .line 64
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Not a legal depth format!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1
    iput-object p1, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    .line 67
    invoke-virtual {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getDepthMapHeader()[B

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    .line 68
    return-void
.end method

.method private static getBytes([BII)[B
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "from"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 180
    if-lez p2, :cond_0

    if-gez p1, :cond_1

    .line 181
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "WRONG ARGUMENT: from ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 182
    const-string/jumbo v3, ", length = "

    .line 181
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 180
    :cond_1
    array-length v1, p0

    sub-int/2addr v1, p1

    if-gt p2, v1, :cond_0

    .line 184
    new-array v0, p2, [B

    .line 185
    .local v0, "destArray":[B
    invoke-static {p0, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 186
    return-object v0
.end method

.method private static getHeaderTag([B)I
    .locals 2
    .param p0, "originalData"    # [B

    .prologue
    .line 158
    const/4 v0, 0x0

    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    return v0
.end method

.method private static getInteger([B)I
    .locals 5
    .param p0, "bytes"    # [B

    .prologue
    const/4 v4, 0x4

    .line 162
    array-length v2, p0

    if-eq v2, v4, :cond_0

    .line 163
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "bytes can not covert to a integer value!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 166
    :cond_0
    const/4 v1, 0x0

    .line 167
    .local v1, "value":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_1

    .line 168
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    mul-int/lit8 v3, v0, 0x8

    shl-int/2addr v2, v3

    add-int/2addr v1, v2

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 170
    :cond_1
    return v1
.end method

.method public static isDepthMapData([B)Z
    .locals 3
    .param p0, "data"    # [B

    .prologue
    const/4 v0, 0x0

    .line 75
    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getHeaderTag([B)I

    move-result v1

    const/16 v2, 0x80

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method


# virtual methods
.method public getBlurLevel()I
    .locals 3

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v1, 0x10

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    return v0
.end method

.method public getDepthMapData()[B
    .locals 3

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    invoke-virtual {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getDepthMapLength()I

    move-result v1

    const/16 v2, 0x98

    invoke-static {v0, v2, v1}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    return-object v0
.end method

.method public getDepthMapHeader()[B
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 90
    iget-object v1, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    invoke-static {v1, v2, v2}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    .line 91
    .local v0, "headerLength":I
    iget-object v1, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapOriginalData:[B

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v1

    return-object v1
.end method

.method public getDepthMapLength()I
    .locals 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v1, 0x94

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    return v0
.end method

.method public getFocusPoint()Landroid/graphics/Point;
    .locals 5

    .prologue
    const/4 v4, 0x4

    .line 99
    iget-object v2, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v3, 0x8

    invoke-static {v2, v3, v4}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v0

    .line 100
    .local v0, "pointX":I
    iget-object v2, p0, Lcom/android/camera2/ArcsoftDepthMap;->mDepthMapHeader:[B

    const/16 v3, 0xc

    invoke-static {v2, v3, v4}, Lcom/android/camera2/ArcsoftDepthMap;->getBytes([BII)[B

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera2/ArcsoftDepthMap;->getInteger([B)I

    move-result v1

    .line 101
    .local v1, "pointY":I
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    return-object v2
.end method

.method public writeDepthExif([B[B[B)[B
    .locals 8
    .param p1, "jpeg"    # [B
    .param p2, "dulWaterMark"    # [B
    .param p3, "timeWaterMark"    # [B

    .prologue
    .line 129
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 131
    .local v4, "s":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v1, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v1}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    .line 132
    .local v1, "exif":Lcom/android/gallery3d/exif/ExifInterface;
    invoke-virtual {v1, p1}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    .line 133
    invoke-virtual {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getFocusPoint()Landroid/graphics/Point;

    move-result-object v3

    .line 134
    .local v3, "point":Landroid/graphics/Point;
    sget-object v5, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "writeDepthExif: focusPoint: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-virtual {v1, v3}, Lcom/android/gallery3d/exif/ExifInterface;->addDepthMapFocusPoint(Landroid/graphics/Point;)Z

    .line 136
    invoke-virtual {p0}, Lcom/android/camera2/ArcsoftDepthMap;->getBlurLevel()I

    move-result v2

    .line 137
    .local v2, "level":I
    sget-object v5, Lcom/android/camera2/ArcsoftDepthMap;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "writeDepthExif: blurLevel: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-virtual {v1, v2}, Lcom/android/gallery3d/exif/ExifInterface;->addDepthMapBlurLevel(I)Z

    .line 139
    if-eqz p2, :cond_0

    .line 140
    invoke-virtual {v1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->addDulCameraWaterMark([B)Z

    .line 142
    :cond_0
    if-eqz p3, :cond_1

    .line 143
    invoke-virtual {v1, p3}, Lcom/android/gallery3d/exif/ExifInterface;->addTimeWaterMark([B)Z

    .line 145
    :cond_1
    invoke-virtual {v1, p1, v4}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    .line 146
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 147
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    return-object p1

    .line 149
    .end local v1    # "exif":Lcom/android/gallery3d/exif/ExifInterface;
    .end local v2    # "level":I
    .end local v3    # "point":Landroid/graphics/Point;
    :catch_0
    move-exception v0

    .line 150
    .local v0, "e":Ljava/io/IOException;
    const-class v5, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    return-object p1
.end method
