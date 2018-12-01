.class Lcom/android/gallery3d/exif/ExifOutputStream;
.super Ljava/io/FilterOutputStream;
.source "ExifOutputStream.java"


# instance fields
.field private mBuffer:Ljava/nio/ByteBuffer;

.field private mByteToCopy:I

.field private mByteToSkip:I

.field private mExifData:Lcom/android/gallery3d/exif/ExifData;

.field private final mInterface:Lcom/android/gallery3d/exif/ExifInterface;

.field private mSingleByteArray:[B

.field private mState:I


# direct methods
.method protected constructor <init>(Ljava/io/OutputStream;Lcom/android/gallery3d/exif/ExifInterface;)V
    .locals 2
    .param p1, "ou"    # Ljava/io/OutputStream;
    .param p2, "iRef"    # Lcom/android/gallery3d/exif/ExifInterface;

    .prologue
    .line 87
    new-instance v0, Ljava/io/BufferedOutputStream;

    const/high16 v1, 0x10000

    invoke-direct {v0, p1, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    invoke-direct {p0, v0}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 79
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mState:I

    .line 82
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mSingleByteArray:[B

    .line 83
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    .line 88
    iput-object p2, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    .line 89
    return-void
.end method

.method private calculateAllOffset()I
    .locals 12

    .prologue
    .line 439
    const/16 v6, 0x8

    .line 440
    .local v6, "offset":I
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v3

    .line 441
    .local v3, "ifd0":Lcom/android/gallery3d/exif/IfdData;
    invoke-direct {p0, v3, v6}, Lcom/android/gallery3d/exif/ExifOutputStream;->calculateOffsetOfIfd(Lcom/android/gallery3d/exif/IfdData;I)I

    move-result v6

    .line 442
    sget v9, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-static {v9}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v3, v9}, Lcom/android/gallery3d/exif/IfdData;->getTag(S)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    .line 444
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v0

    .line 445
    .local v0, "exifIfd":Lcom/android/gallery3d/exif/IfdData;
    invoke-direct {p0, v0, v6}, Lcom/android/gallery3d/exif/ExifOutputStream;->calculateOffsetOfIfd(Lcom/android/gallery3d/exif/IfdData;I)I

    move-result v6

    .line 447
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v5

    .line 448
    .local v5, "interIfd":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v5, :cond_0

    .line 449
    sget v9, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-static {v9}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v0, v9}, Lcom/android/gallery3d/exif/IfdData;->getTag(S)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    .line 451
    invoke-direct {p0, v5, v6}, Lcom/android/gallery3d/exif/ExifOutputStream;->calculateOffsetOfIfd(Lcom/android/gallery3d/exif/IfdData;I)I

    move-result v6

    .line 454
    :cond_0
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v1

    .line 455
    .local v1, "gpsIfd":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v1, :cond_1

    .line 456
    sget v9, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-static {v9}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v3, v9}, Lcom/android/gallery3d/exif/IfdData;->getTag(S)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    .line 457
    invoke-direct {p0, v1, v6}, Lcom/android/gallery3d/exif/ExifOutputStream;->calculateOffsetOfIfd(Lcom/android/gallery3d/exif/IfdData;I)I

    move-result v6

    .line 460
    :cond_1
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    .line 461
    .local v4, "ifd1":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v4, :cond_2

    .line 462
    invoke-virtual {v3, v6}, Lcom/android/gallery3d/exif/IfdData;->setOffsetToNextIfd(I)V

    .line 463
    invoke-direct {p0, v4, v6}, Lcom/android/gallery3d/exif/ExifOutputStream;->calculateOffsetOfIfd(Lcom/android/gallery3d/exif/IfdData;I)I

    move-result v6

    .line 467
    :cond_2
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v9}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 468
    sget v9, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v9}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v4, v9}, Lcom/android/gallery3d/exif/IfdData;->getTag(S)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    .line 470
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v9}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v6, v9

    .line 481
    :cond_3
    :goto_0
    return v6

    .line 471
    :cond_4
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v9}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 472
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v9}, Lcom/android/gallery3d/exif/ExifData;->getStripCount()I

    move-result v8

    .line 473
    .local v8, "stripCount":I
    new-array v7, v8, [J

    .line 474
    .local v7, "offsets":[J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v9}, Lcom/android/gallery3d/exif/ExifData;->getStripCount()I

    move-result v9

    if-ge v2, v9, :cond_5

    .line 475
    int-to-long v10, v6

    aput-wide v10, v7, v2

    .line 476
    iget-object v9, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v9, v2}, Lcom/android/gallery3d/exif/ExifData;->getStrip(I)[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v6, v9

    .line 474
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 478
    :cond_5
    sget v9, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v9}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v9

    invoke-virtual {v4, v9}, Lcom/android/gallery3d/exif/IfdData;->getTag(S)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/android/gallery3d/exif/ExifTag;->setValue([J)Z

    goto :goto_0
.end method

.method private calculateOffsetOfIfd(Lcom/android/gallery3d/exif/IfdData;I)I
    .locals 6
    .param p1, "ifd"    # Lcom/android/gallery3d/exif/IfdData;
    .param p2, "offset"    # I

    .prologue
    .line 314
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/IfdData;->getTagCount()I

    move-result v2

    mul-int/lit8 v2, v2, 0xc

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x4

    add-int/2addr p2, v2

    .line 315
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/IfdData;->getAllTags()[Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v1

    .line 316
    .local v1, "tags":[Lcom/android/gallery3d/exif/ExifTag;
    const/4 v2, 0x0

    array-length v3, v1

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 317
    .local v0, "tag":Lcom/android/gallery3d/exif/ExifTag;
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifTag;->getDataSize()I

    move-result v4

    const/4 v5, 0x4

    if-le v4, v5, :cond_0

    .line 318
    invoke-virtual {v0, p2}, Lcom/android/gallery3d/exif/ExifTag;->setOffset(I)V

    .line 319
    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifTag;->getDataSize()I

    move-result v4

    add-int/2addr p2, v4

    .line 316
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 322
    .end local v0    # "tag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_1
    return p2
.end method

.method private createRequiredIfdAndTag()V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 327
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v7

    .line 328
    .local v7, "ifd0":Lcom/android/gallery3d/exif/IfdData;
    if-nez v7, :cond_0

    .line 329
    new-instance v7, Lcom/android/gallery3d/exif/IfdData;

    .end local v7    # "ifd0":Lcom/android/gallery3d/exif/IfdData;
    const/4 v15, 0x0

    invoke-direct {v7, v15}, Lcom/android/gallery3d/exif/IfdData;-><init>(I)V

    .line 330
    .restart local v7    # "ifd0":Lcom/android/gallery3d/exif/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15, v7}, Lcom/android/gallery3d/exif/ExifData;->addIfdData(Lcom/android/gallery3d/exif/IfdData;)V

    .line 332
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v3

    .line 333
    .local v3, "exifOffsetTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v3, :cond_1

    .line 334
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 335
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    .line 334
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 337
    :cond_1
    invoke-virtual {v7, v3}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 340
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v2

    .line 341
    .local v2, "exifIfd":Lcom/android/gallery3d/exif/IfdData;
    if-nez v2, :cond_2

    .line 342
    new-instance v2, Lcom/android/gallery3d/exif/IfdData;

    .end local v2    # "exifIfd":Lcom/android/gallery3d/exif/IfdData;
    const/4 v15, 0x2

    invoke-direct {v2, v15}, Lcom/android/gallery3d/exif/IfdData;-><init>(I)V

    .line 343
    .restart local v2    # "exifIfd":Lcom/android/gallery3d/exif/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15, v2}, Lcom/android/gallery3d/exif/ExifData;->addIfdData(Lcom/android/gallery3d/exif/IfdData;)V

    .line 347
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/16 v16, 0x4

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v4

    .line 348
    .local v4, "gpsIfd":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v4, :cond_4

    .line 349
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v5

    .line 350
    .local v5, "gpsOffsetTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v5, :cond_3

    .line 351
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 352
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    .line 351
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 354
    :cond_3
    invoke-virtual {v7, v5}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 358
    .end local v5    # "gpsOffsetTag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/16 v16, 0x3

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v9

    .line 359
    .local v9, "interIfd":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v9, :cond_6

    .line 360
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    .line 361
    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    .line 360
    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v10

    .line 362
    .local v10, "interOffsetTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v10, :cond_5

    .line 363
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 364
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    .line 363
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 366
    :cond_5
    invoke-virtual {v2, v10}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 369
    .end local v10    # "interOffsetTag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v8

    .line 372
    .local v8, "ifd1":Lcom/android/gallery3d/exif/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v15

    if-eqz v15, :cond_b

    .line 374
    if-nez v8, :cond_7

    .line 375
    new-instance v8, Lcom/android/gallery3d/exif/IfdData;

    .end local v8    # "ifd1":Lcom/android/gallery3d/exif/IfdData;
    const/4 v15, 0x1

    invoke-direct {v8, v15}, Lcom/android/gallery3d/exif/IfdData;-><init>(I)V

    .line 376
    .restart local v8    # "ifd1":Lcom/android/gallery3d/exif/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15, v8}, Lcom/android/gallery3d/exif/ExifData;->addIfdData(Lcom/android/gallery3d/exif/IfdData;)V

    .line 379
    :cond_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    .line 380
    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    .line 379
    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v13

    .line 381
    .local v13, "offsetTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v13, :cond_8

    .line 382
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 383
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    .line 382
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 386
    :cond_8
    invoke-virtual {v8, v13}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 387
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    .line 388
    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    .line 387
    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v11

    .line 389
    .local v11, "lengthTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v11, :cond_9

    .line 390
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 391
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    .line 390
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 394
    :cond_9
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v15

    array-length v15, v15

    invoke-virtual {v11, v15}, Lcom/android/gallery3d/exif/ExifTag;->setValue(I)Z

    .line 395
    invoke-virtual {v8, v11}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 398
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 399
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 436
    .end local v11    # "lengthTag":Lcom/android/gallery3d/exif/ExifTag;
    .end local v13    # "offsetTag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_a
    :goto_0
    return-void

    .line 400
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    move-result v15

    if-eqz v15, :cond_10

    .line 401
    if-nez v8, :cond_c

    .line 402
    new-instance v8, Lcom/android/gallery3d/exif/IfdData;

    .end local v8    # "ifd1":Lcom/android/gallery3d/exif/IfdData;
    const/4 v15, 0x1

    invoke-direct {v8, v15}, Lcom/android/gallery3d/exif/IfdData;-><init>(I)V

    .line 403
    .restart local v8    # "ifd1":Lcom/android/gallery3d/exif/IfdData;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15, v8}, Lcom/android/gallery3d/exif/ExifData;->addIfdData(Lcom/android/gallery3d/exif/IfdData;)V

    .line 405
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15}, Lcom/android/gallery3d/exif/ExifData;->getStripCount()I

    move-result v14

    .line 406
    .local v14, "stripCount":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v13

    .line 407
    .restart local v13    # "offsetTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v13, :cond_d

    .line 408
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 409
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    .line 408
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 411
    :cond_d
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mInterface:Lcom/android/gallery3d/exif/ExifInterface;

    .line 412
    sget v16, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    .line 411
    invoke-virtual/range {v15 .. v16}, Lcom/android/gallery3d/exif/ExifInterface;->buildUninitializedTag(I)Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v11

    .line 413
    .restart local v11    # "lengthTag":Lcom/android/gallery3d/exif/ExifTag;
    if-nez v11, :cond_e

    .line 414
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "No definition for crucial exif tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 415
    sget v17, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    .line 414
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 417
    :cond_e
    new-array v12, v14, [J

    .line 418
    .local v12, "lengths":[J
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15}, Lcom/android/gallery3d/exif/ExifData;->getStripCount()I

    move-result v15

    if-ge v6, v15, :cond_f

    .line 419
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v15, v6}, Lcom/android/gallery3d/exif/ExifData;->getStrip(I)[B

    move-result-object v15

    array-length v15, v15

    int-to-long v0, v15

    move-wide/from16 v16, v0

    aput-wide v16, v12, v6

    .line 418
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 421
    :cond_f
    invoke-virtual {v11, v12}, Lcom/android/gallery3d/exif/ExifTag;->setValue([J)Z

    .line 422
    invoke-virtual {v8, v13}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 423
    invoke-virtual {v8, v11}, Lcom/android/gallery3d/exif/IfdData;->setTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    .line 425
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 427
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    .line 426
    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    goto/16 :goto_0

    .line 428
    .end local v6    # "i":I
    .end local v11    # "lengthTag":Lcom/android/gallery3d/exif/ExifTag;
    .end local v12    # "lengths":[J
    .end local v13    # "offsetTag":Lcom/android/gallery3d/exif/ExifTag;
    .end local v14    # "stripCount":I
    :cond_10
    if-eqz v8, :cond_a

    .line 430
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 431
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 432
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    .line 434
    sget v15, Lcom/android/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    .line 433
    invoke-static {v15}, Lcom/android/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v15

    invoke-virtual {v8, v15}, Lcom/android/gallery3d/exif/IfdData;->removeTag(S)V

    goto/16 :goto_0
.end method

.method private requestByteToBuffer(I[BII)I
    .locals 3
    .param p1, "requestByteCount"    # I
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 108
    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    sub-int v0, p1, v2

    .line 109
    .local v0, "byteNeeded":I
    if-le p4, v0, :cond_0

    move v1, v0

    .line 110
    .local v1, "byteToRead":I
    :goto_0
    iget-object v2, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p2, p3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 111
    return v1

    .line 109
    .end local v1    # "byteToRead":I
    :cond_0
    move v1, p4

    .restart local v1    # "byteToRead":I
    goto :goto_0
.end method

.method private stripNullValueTags(Lcom/android/gallery3d/exif/ExifData;)Ljava/util/ArrayList;
    .locals 6
    .param p1, "data"    # Lcom/android/gallery3d/exif/ExifData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/gallery3d/exif/ExifData;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/gallery3d/exif/ExifTag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 245
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 246
    .local v1, "nullTags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/gallery3d/exif/ExifTag;>;"
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifData;->getAllTags()Ljava/util/List;

    move-result-object v0

    .line 247
    .local v0, "allTags":Ljava/util/List;, "Ljava/util/List<Lcom/android/gallery3d/exif/ExifTag;>;"
    if-eqz v0, :cond_1

    .line 248
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/ExifData;->getAllTags()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "t$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/exif/ExifTag;

    .line 249
    .local v2, "t":Lcom/android/gallery3d/exif/ExifTag;
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getTagId()S

    move-result v4

    invoke-static {v4}, Lcom/android/gallery3d/exif/ExifInterface;->isOffsetTag(S)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_0

    .line 250
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getTagId()S

    move-result v4

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getIfd()I

    move-result v5

    invoke-virtual {p1, v4, v5}, Lcom/android/gallery3d/exif/ExifData;->removeTag(SI)V

    .line 251
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 255
    .end local v2    # "t":Lcom/android/gallery3d/exif/ExifTag;
    .end local v3    # "t$iterator":Ljava/util/Iterator;
    :cond_1
    return-object v1
.end method

.method private writeAllTags(Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V
    .locals 6
    .param p1, "dataOutputStream"    # Lcom/android/gallery3d/exif/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 269
    iget-object v3, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeIfd(Lcom/android/gallery3d/exif/IfdData;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 270
    iget-object v3, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeIfd(Lcom/android/gallery3d/exif/IfdData;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 271
    iget-object v3, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v2

    .line 272
    .local v2, "interoperabilityIfd":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v2, :cond_0

    .line 273
    invoke-direct {p0, v2, p1}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeIfd(Lcom/android/gallery3d/exif/IfdData;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 275
    :cond_0
    iget-object v3, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v0

    .line 276
    .local v0, "gpsIfd":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v0, :cond_1

    .line 277
    invoke-direct {p0, v0, p1}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeIfd(Lcom/android/gallery3d/exif/IfdData;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 279
    :cond_1
    iget-object v3, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v3, v5}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v1

    .line 280
    .local v1, "ifd1":Lcom/android/gallery3d/exif/IfdData;
    if-eqz v1, :cond_2

    .line 281
    iget-object v3, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v3, v5}, Lcom/android/gallery3d/exif/ExifData;->getIfdData(I)Lcom/android/gallery3d/exif/IfdData;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeIfd(Lcom/android/gallery3d/exif/IfdData;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 283
    :cond_2
    return-void
.end method

.method private writeExifData()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    if-nez v5, :cond_0

    .line 212
    return-void

    .line 217
    :cond_0
    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-direct {p0, v5}, Lcom/android/gallery3d/exif/ExifOutputStream;->stripNullValueTags(Lcom/android/gallery3d/exif/ExifData;)Ljava/util/ArrayList;

    move-result-object v2

    .line 218
    .local v2, "nullTags":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/gallery3d/exif/ExifTag;>;"
    invoke-direct {p0}, Lcom/android/gallery3d/exif/ExifOutputStream;->createRequiredIfdAndTag()V

    .line 219
    invoke-direct {p0}, Lcom/android/gallery3d/exif/ExifOutputStream;->calculateAllOffset()I

    move-result v1

    .line 220
    .local v1, "exifSize":I
    add-int/lit8 v5, v1, 0x8

    const v6, 0xffff

    if-le v5, v6, :cond_1

    .line 221
    new-instance v5, Ljava/io/IOException;

    const-string/jumbo v6, "Exif header is too large (>64Kb)"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 223
    :cond_1
    new-instance v0, Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    invoke-direct {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 224
    .local v0, "dataOutputStream":Lcom/android/gallery3d/exif/OrderedDataOutputStream;
    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->setByteOrder(Ljava/nio/ByteOrder;)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 225
    const/16 v5, -0x1f

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 226
    add-int/lit8 v5, v1, 0x8

    int-to-short v5, v5

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 227
    const v5, 0x45786966

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeInt(I)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 228
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 229
    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v5}, Lcom/android/gallery3d/exif/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    sget-object v6, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v5, v6, :cond_2

    .line 230
    const/16 v5, 0x4d4d

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 234
    :goto_0
    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v5}, Lcom/android/gallery3d/exif/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->setByteOrder(Ljava/nio/ByteOrder;)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 235
    const/16 v5, 0x2a

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 236
    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeInt(I)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 237
    invoke-direct {p0, v0}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeAllTags(Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 238
    invoke-direct {p0, v0}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeThumbnail(Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 239
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "t$iterator":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/gallery3d/exif/ExifTag;

    .line 240
    .local v3, "t":Lcom/android/gallery3d/exif/ExifTag;
    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v5, v3}, Lcom/android/gallery3d/exif/ExifData;->addTag(Lcom/android/gallery3d/exif/ExifTag;)Lcom/android/gallery3d/exif/ExifTag;

    goto :goto_1

    .line 232
    .end local v3    # "t":Lcom/android/gallery3d/exif/ExifTag;
    .end local v4    # "t$iterator":Ljava/util/Iterator;
    :cond_2
    const/16 v5, 0x4949

    invoke-virtual {v0, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    goto :goto_0

    .line 242
    .restart local v4    # "t$iterator":Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method private writeIfd(Lcom/android/gallery3d/exif/IfdData;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V
    .locals 9
    .param p1, "ifd"    # Lcom/android/gallery3d/exif/IfdData;
    .param p2, "dataOutputStream"    # Lcom/android/gallery3d/exif/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v4, 0x0

    .line 287
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/IfdData;->getAllTags()[Lcom/android/gallery3d/exif/ExifTag;

    move-result-object v3

    .line 288
    .local v3, "tags":[Lcom/android/gallery3d/exif/ExifTag;
    array-length v5, v3

    int-to-short v5, v5

    invoke-virtual {p2, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 289
    array-length v6, v3

    move v5, v4

    :goto_0
    if-ge v5, v6, :cond_2

    aget-object v2, v3, v5

    .line 290
    .local v2, "tag":Lcom/android/gallery3d/exif/ExifTag;
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getTagId()S

    move-result v7

    invoke-virtual {p2, v7}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 291
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v7

    invoke-virtual {p2, v7}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 292
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v7

    invoke-virtual {p2, v7}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeInt(I)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 296
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getDataSize()I

    move-result v7

    if-le v7, v8, :cond_1

    .line 297
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getOffset()I

    move-result v7

    invoke-virtual {p2, v7}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeInt(I)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 289
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 299
    :cond_1
    invoke-static {v2, p2}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeTagValue(Lcom/android/gallery3d/exif/ExifTag;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 300
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getDataSize()I

    move-result v7

    rsub-int/lit8 v1, v7, 0x4

    .local v1, "n":I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 301
    invoke-virtual {p2, v4}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write(I)V

    .line 300
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 305
    .end local v0    # "i":I
    .end local v1    # "n":I
    .end local v2    # "tag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_2
    invoke-virtual {p1}, Lcom/android/gallery3d/exif/IfdData;->getOffsetToNextIfd()I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeInt(I)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 306
    array-length v5, v3

    :goto_2
    if-ge v4, v5, :cond_4

    aget-object v2, v3, v4

    .line 307
    .restart local v2    # "tag":Lcom/android/gallery3d/exif/ExifTag;
    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifTag;->getDataSize()I

    move-result v6

    if-le v6, v8, :cond_3

    .line 308
    invoke-static {v2, p2}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeTagValue(Lcom/android/gallery3d/exif/ExifTag;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V

    .line 306
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 311
    .end local v2    # "tag":Lcom/android/gallery3d/exif/ExifTag;
    :cond_4
    return-void
.end method

.method static writeTagValue(Lcom/android/gallery3d/exif/ExifTag;Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V
    .locals 6
    .param p0, "tag"    # Lcom/android/gallery3d/exif/ExifTag;
    .param p1, "dataOutputStream"    # Lcom/android/gallery3d/exif/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 486
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getDataType()S

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 521
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 488
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getStringByte()[B

    move-result-object v0

    .line 489
    .local v0, "buf":[B
    array-length v3, v0

    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 490
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aput-byte v5, v0, v3

    .line 491
    invoke-virtual {p1, v0}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write([B)V

    goto :goto_0

    .line 493
    :cond_1
    invoke-virtual {p1, v0}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write([B)V

    .line 494
    invoke-virtual {p1, v5}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write(I)V

    goto :goto_0

    .line 499
    .end local v0    # "buf":[B
    :pswitch_2
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v2

    .local v2, "n":I
    :goto_1
    if-ge v1, v2, :cond_0

    .line 500
    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {p1, v3}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeInt(I)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 499
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 505
    .end local v1    # "i":I
    .end local v2    # "n":I
    :pswitch_3
    const/4 v1, 0x0

    .restart local v1    # "i":I
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v2

    .restart local v2    # "n":I
    :goto_2
    if-ge v1, v2, :cond_0

    .line 506
    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifTag;->getRational(I)Lcom/android/gallery3d/exif/Rational;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeRational(Lcom/android/gallery3d/exif/Rational;)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 505
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 511
    .end local v1    # "i":I
    .end local v2    # "n":I
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v3

    new-array v0, v3, [B

    .line 512
    .restart local v0    # "buf":[B
    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifTag;->getBytes([B)V

    .line 513
    invoke-virtual {p1, v0}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write([B)V

    goto :goto_0

    .line 516
    .end local v0    # "buf":[B
    :pswitch_5
    const/4 v1, 0x0

    .restart local v1    # "i":I
    invoke-virtual {p0}, Lcom/android/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v2

    .restart local v2    # "n":I
    :goto_3
    if-ge v1, v2, :cond_0

    .line 517
    invoke-virtual {p0, v1}, Lcom/android/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v4

    long-to-int v3, v4

    int-to-short v3, v3

    invoke-virtual {p1, v3}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->writeShort(S)Lcom/android/gallery3d/exif/OrderedDataOutputStream;

    .line 516
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 486
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private writeThumbnail(Lcom/android/gallery3d/exif/OrderedDataOutputStream;)V
    .locals 2
    .param p1, "dataOutputStream"    # Lcom/android/gallery3d/exif/OrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->hasCompressedThumbnail()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 260
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->getCompressedThumbnail()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write([B)V

    .line 266
    :cond_0
    return-void

    .line 261
    :cond_1
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->hasUncompressedStrip()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 262
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifData;->getStripCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 263
    iget-object v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    invoke-virtual {v1, v0}, Lcom/android/gallery3d/exif/ExifData;->getStrip(I)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/gallery3d/exif/OrderedDataOutputStream;->write([B)V

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected setExifData(Lcom/android/gallery3d/exif/ExifData;)V
    .locals 0
    .param p1, "exifData"    # Lcom/android/gallery3d/exif/ExifData;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mExifData:Lcom/android/gallery3d/exif/ExifData;

    .line 97
    return-void
.end method

.method public write(I)V
    .locals 3
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mSingleByteArray:[B

    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 199
    iget-object v0, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mSingleByteArray:[B

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/exif/ExifOutputStream;->write([B)V

    .line 200
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/android/gallery3d/exif/ExifOutputStream;->write([BII)V

    .line 208
    return-void
.end method

.method public write([BII)V
    .locals 10
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v9, 0xffff

    const/4 v8, 0x4

    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 120
    :goto_0
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    if-gtz v4, :cond_0

    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    if-lez v4, :cond_3

    .line 121
    :cond_0
    if-lez p3, :cond_4

    .line 122
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    if-lez v4, :cond_1

    .line 123
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    if-le p3, v4, :cond_6

    iget v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    .line 124
    .local v1, "byteToProcess":I
    :goto_1
    sub-int/2addr p3, v1

    .line 125
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    sub-int/2addr v4, v1

    iput v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    .line 126
    add-int/2addr p2, v1

    .line 128
    .end local v1    # "byteToProcess":I
    :cond_1
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    if-lez v4, :cond_2

    .line 129
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    if-le p3, v4, :cond_7

    iget v1, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    .line 130
    .restart local v1    # "byteToProcess":I
    :goto_2
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v4, p1, p2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 131
    sub-int/2addr p3, v1

    .line 132
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    sub-int/2addr v4, v1

    iput v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    .line 133
    add-int/2addr p2, v1

    .line 135
    .end local v1    # "byteToProcess":I
    :cond_2
    if-nez p3, :cond_8

    .line 136
    return-void

    .line 120
    :cond_3
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mState:I

    if-ne v4, v7, :cond_0

    .line 187
    :cond_4
    if-lez p3, :cond_5

    .line 188
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v4, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 190
    :cond_5
    return-void

    .line 123
    :cond_6
    move v1, p3

    .restart local v1    # "byteToProcess":I
    goto :goto_1

    .line 129
    .end local v1    # "byteToProcess":I
    :cond_7
    move v1, p3

    .restart local v1    # "byteToProcess":I
    goto :goto_2

    .line 138
    .end local v1    # "byteToProcess":I
    :cond_8
    iget v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mState:I

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 140
    :pswitch_0
    invoke-direct {p0, v7, p1, p2, p3}, Lcom/android/gallery3d/exif/ExifOutputStream;->requestByteToBuffer(I[BII)I

    move-result v0

    .line 141
    .local v0, "byteRead":I
    add-int/2addr p2, v0

    .line 142
    sub-int/2addr p3, v0

    .line 143
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ge v4, v7, :cond_9

    .line 144
    return-void

    .line 146
    :cond_9
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 147
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v4

    const/16 v5, -0x28

    if-eq v4, v5, :cond_a

    .line 148
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "Not a valid jpeg image, cannot write exif"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 150
    :cond_a
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 151
    const/4 v4, 0x1

    iput v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mState:I

    .line 152
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 153
    invoke-direct {p0}, Lcom/android/gallery3d/exif/ExifOutputStream;->writeExifData()V

    goto/16 :goto_0

    .line 158
    .end local v0    # "byteRead":I
    :pswitch_1
    invoke-direct {p0, v8, p1, p2, p3}, Lcom/android/gallery3d/exif/ExifOutputStream;->requestByteToBuffer(I[BII)I

    move-result v0

    .line 159
    .restart local v0    # "byteRead":I
    add-int/2addr p2, v0

    .line 160
    sub-int/2addr p3, v0

    .line 162
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ne v4, v7, :cond_b

    .line 163
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    .line 164
    .local v3, "tag":S
    const/16 v4, -0x27

    if-ne v3, v4, :cond_b

    .line 165
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 166
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 169
    .end local v3    # "tag":S
    :cond_b
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ge v4, v8, :cond_c

    .line 170
    return-void

    .line 172
    :cond_c
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 173
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    .line 174
    .local v2, "marker":S
    const/16 v4, -0x1f

    if-ne v2, v4, :cond_d

    .line 175
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v4

    and-int/2addr v4, v9

    add-int/lit8 v4, v4, -0x2

    iput v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToSkip:I

    .line 176
    iput v7, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mState:I

    .line 184
    :goto_3
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    goto/16 :goto_0

    .line 177
    :cond_d
    invoke-static {v2}, Lcom/android/gallery3d/exif/JpegHeader;->isSofMarker(S)Z

    move-result v4

    if-nez v4, :cond_e

    .line 178
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v4, v5, v6, v8}, Ljava/io/OutputStream;->write([BII)V

    .line 179
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v4

    and-int/2addr v4, v9

    add-int/lit8 v4, v4, -0x2

    iput v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mByteToCopy:I

    goto :goto_3

    .line 181
    :cond_e
    iget-object v4, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v5, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v4, v5, v6, v8}, Ljava/io/OutputStream;->write([BII)V

    .line 182
    iput v7, p0, Lcom/android/gallery3d/exif/ExifOutputStream;->mState:I

    goto :goto_3

    .line 138
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
