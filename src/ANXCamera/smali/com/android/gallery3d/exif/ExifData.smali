.class Lcom/android/gallery3d/exif/ExifData;
.super Ljava/lang/Object;
.source "ExifData.java"


# static fields
.field private static final USER_COMMENT_ASCII:[B

.field private static final USER_COMMENT_JIS:[B

.field private static final USER_COMMENT_UNICODE:[B


# instance fields
.field private final mByteOrder:Ljava/nio/ByteOrder;

.field private final mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

.field private mStripBytes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation
.end field

.field private mThumbnail:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 37
    new-array v0, v1, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/gallery3d/exif/ExifData;->USER_COMMENT_ASCII:[B

    .line 40
    new-array v0, v1, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/gallery3d/exif/ExifData;->USER_COMMENT_JIS:[B

    .line 43
    new-array v0, v1, [B

    fill-array-data v0, :array_2

    sput-object v0, Lcom/android/gallery3d/exif/ExifData;->USER_COMMENT_UNICODE:[B

    .line 35
    return-void

    .line 37
    :array_0
    .array-data 1
        0x41t
        0x53t
        0x43t
        0x49t
        0x49t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 40
    :array_1
    .array-data 1
        0x4at
        0x49t
        0x53t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 43
    :array_2
    .array-data 1
        0x55t
        0x4et
        0x49t
        0x43t
        0x4ft
        0x44t
        0x45t
        0x0t
    .end array-data
.end method

.method constructor <init>(Ljava/nio/ByteOrder;)V
    .locals 1
    .param p1, "order"    # Ljava/nio/ByteOrder;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/android/gallery3d/exif/IfdData;

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    .line 53
    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    .line 54
    return-void
.end method


# virtual methods
.method protected addIfdData(Lcom/android/gallery3d/exif/IfdData;)V
    .locals 2
    .param p1, "data"    # Lcom/android/gallery3d/exif/IfdData;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    invoke-virtual {p1}, Lcom/android/gallery3d/exif/IfdData;->getId()I

    move-result v1

    aput-object p1, v0, v1

    .line 141
    return-void
.end method

.method protected addTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;
    .locals 2
    .param p1, "tag"    # Lcom/android/gallery3d/exif/ExifTag;

    .prologue
    const/4 v1, 0x0

    .line 170
    if-eqz p1, :cond_0

    .line 171
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifTag;->getIfd()I

    move-result v0

    .line 172
    .local v0, "ifd":I
    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/exif/ExifData;->addTag(Lcom/android/gallery3d/exif/ExifTag;I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    return-object v1

    .line 174
    .end local v0    # "ifd":I
    :cond_0
    return-object v1
.end method

.method protected addTag(Lcom/android/gallery3d/exif/ExifTag;I)Lcom/android/gallery3d/exif/ExifTag;
    .locals 3
    .param p1, "tag"    # Lcom/android/gallery3d/exif/ExifTag;
    .param p2, "ifdId"    # I

    .prologue
    const/4 v2, 0x0

    .line 182
    if-eqz p1, :cond_0

    invoke-static {p2}, Lcom/android/gallery3d/exif/ExifTag;->isValidIfd(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    invoke-virtual {p0, p2}, Lcom/android/gallery3d/exif/ExifData;->getOrCreateIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v0

    .line 184
    .local v0, "ifdData":Lcom/android/gallery3d/exif/IfdData;
    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    return-object v1

    .line 186
    .end local v0    # "ifdData":Lcom/android/gallery3d/exif/IfdData;
    :cond_0
    return-object v2
.end method

.method protected clearThumbnailAndStrips()V
    .locals 1

    .prologue
    .line 190
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mThumbnail:[B

    .line 191
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 192
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 315
    if-ne p0, p1, :cond_0

    .line 316
    return v7

    .line 318
    :cond_0
    if-nez p1, :cond_1

    .line 319
    return v6

    .line 321
    :cond_1
    instance-of v4, p1, Lcom/android/gallery3d/exif/ExifData;

    if-eqz v4, :cond_8

    move-object v0, p1

    .line 322
    check-cast v0, Lcom/android/gallery3d/exif/ExifData;

    .line 323
    .local v0, "data":Lcom/android/gallery3d/exif/ExifData;
    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_2

    .line 324
    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v4, v5, :cond_3

    .line 326
    :cond_2
    return v6

    .line 325
    :cond_3
    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifData;->mThumbnail:[B

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifData;->mThumbnail:[B

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    .line 323
    if-nez v4, :cond_2

    .line 328
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_5

    .line 329
    iget-object v4, v0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_4

    .line 330
    return v6

    .line 328
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 333
    :cond_5
    const/4 v1, 0x0

    :goto_1
    const/4 v4, 0x5

    if-ge v1, v4, :cond_7

    .line 334
    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v2

    .line 335
    .local v2, "ifd1":Lcom/android/gallery3d/exif/IfdData;
    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v3

    .line 336
    .local v3, "ifd2":Lcom/android/gallery3d/exif/IfdData;
    if-eq v2, v3, :cond_6

    if-eqz v2, :cond_6

    invoke-virtual {v2, v3}, Lcom/android/gallery3d/exif/IfdData;->equals(Ljava/lang/Object;)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_6

    .line 337
    return v6

    .line 333
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 340
    .end local v2    # "ifd1":Lcom/android/gallery3d/exif/IfdData;
    .end local v3    # "ifd2":Lcom/android/gallery3d/exif/IfdData;
    :cond_7
    return v7

    .line 342
    .end local v0    # "data":Lcom/android/gallery3d/exif/ExifData;
    .end local v1    # "i":I
    :cond_8
    return v6
.end method

.method protected getAllTags()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 257
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 258
    .local v1, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/gallery3d/exif/ExifTag;>;"
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    array-length v5, v4

    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v0, v4, v3

    .line 259
    .local v0, "d":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v0, :cond_0

    .line 260
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/IfdData;->getAllTags()[Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v2

    .line 261
    .local v2, "tags":[Lcom/android/gallery3d/exif/ExifTag;
    if-eqz v2, :cond_0

    .line 262
    invoke-static {v1, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 258
    .end local v2    # "tags":[Lcom/android/gallery3d/exif/ExifTag;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 266
    .end local v0    # "d":Lcom/android/gallery3d/exif/IfdData;
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 267
    return-object v6

    .line 269
    :cond_2
    return-object v1
.end method

.method protected getByteOrder()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method protected getCompressedThumbnail()[B
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mThumbnail:[B

    return-object v0
.end method

.method protected getIfdData(I)Lcom/android/gallery3d/exif/IfdData;
    .locals 1
    .param p1, "ifdId"    # I

    .prologue
    .line 129
    invoke-static {p1}, Lcom/android/gallery3d/exif/ExifTag;->isValidIfd(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    aget-object v0, v0, p1

    return-object v0

    .line 132
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getOrCreateIfdData(I)Lcom/android/gallery3d/exif/IfdData;
    .locals 2
    .param p1, "ifdId"    # I

    .prologue
    .line 148
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    aget-object v0, v1, p1

    .line 149
    .local v0, "ifdData":Lcom/android/gallery3d/exif/IfdData;
    if-nez v0, :cond_0

    .line 150
    new-instance v0, Lcom/android/gallery3d/exif/IfdData;

    .end local v0    # "ifdData":Lcom/android/gallery3d/exif/IfdData;
    invoke-direct {v0, p1}, Lcom/android/gallery3d/exif/IfdData;-><init>(I)V

    .line 151
    .restart local v0    # "ifdData":Lcom/android/gallery3d/exif/IfdData;
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    aput-object v0, v1, p1

    .line 153
    :cond_0
    return-object v0
.end method

.method protected getStrip(I)[B
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 107
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method protected getStripCount()I
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected hasCompressedThumbnail()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifData;->mThumbnail:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hasUncompressedStrip()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 114
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected removeTag(SI)V
    .locals 2
    .param p1, "tagId"    # S
    .param p2, "ifdId"    # I

    .prologue
    .line 206
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mIfdDatas:[Lcom/android/gallery3d/exif/IfdData;

    aget-object v0, v1, p2

    .line 207
    .local v0, "ifdData":Lcom/android/gallery3d/exif/IfdData;
    if-nez v0, :cond_0

    .line 208
    return-void

    .line 210
    :cond_0
    invoke-virtual {v0, p1}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 211
    return-void
.end method

.method protected setCompressedThumbnail([B)V
    .locals 0
    .param p1, "thumbnail"    # [B

    .prologue
    .line 70
    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifData;->mThumbnail:[B

    .line 71
    return-void
.end method

.method protected setStripBytes(I[B)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "strip"    # [B

    .prologue
    .line 84
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 85
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 92
    :goto_0
    return-void

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_1

    .line 88
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 90
    :cond_1
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
