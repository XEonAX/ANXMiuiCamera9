.class public Lcom/android/camera/Thumbnail;
.super Ljava/lang/Object;
.source "Thumbnail.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/Thumbnail$Media;
    }
.end annotation


# static fields
.field private static sLock:Ljava/lang/Object;


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mFromFile:Z

.field private mUri:Landroid/net/Uri;

.field private mWaitingForUri:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/Thumbnail;->sLock:Ljava/lang/Object;

    .line 52
    return-void
.end method

.method private constructor <init>(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "orientation"    # I
    .param p4, "mirror"    # Z

    .prologue
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-boolean v0, p0, Lcom/android/camera/Thumbnail;->mFromFile:Z

    .line 62
    iput-boolean v0, p0, Lcom/android/camera/Thumbnail;->mWaitingForUri:Z

    .line 69
    iput-object p1, p0, Lcom/android/camera/Thumbnail;->mUri:Landroid/net/Uri;

    .line 70
    invoke-static {p2, p3, p4}, Lcom/android/camera/Thumbnail;->adjustImage(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Thumbnail;->mBitmap:Landroid/graphics/Bitmap;

    .line 71
    return-void
.end method

.method private static adjustImage(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 14
    .param p0, "baseBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "orientation"    # I
    .param p2, "mirrorH"    # Z

    .prologue
    .line 109
    if-nez p1, :cond_0

    xor-int/lit8 v9, p2, 0x1

    if-eqz v9, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    if-ne v9, v10, :cond_0

    .line 110
    return-object p0

    .line 113
    :cond_0
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 117
    .local v5, "matrix":Landroid/graphics/Matrix;
    rem-int/lit16 v9, p1, 0xb4

    if-eqz v9, :cond_1

    .line 118
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    .line 119
    .local v3, "desWidth":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 126
    .local v2, "desHeight":I
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    neg-int v9, v9

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    neg-int v10, v10

    int-to-float v10, v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    invoke-virtual {v5, v9, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 127
    int-to-float v9, p1

    invoke-virtual {v5, v9}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 128
    int-to-float v9, v3

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    int-to-float v10, v2

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    invoke-virtual {v5, v9, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 131
    if-eqz p2, :cond_2

    const/4 v9, -0x1

    :goto_1
    int-to-float v9, v9

    const/high16 v10, 0x3f800000    # 1.0f

    int-to-float v11, v3

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    int-to-float v12, v2

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    invoke-virtual {v5, v9, v10, v11, v12}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 134
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 135
    .local v0, "bitmapSquareWidth":I
    sub-int v9, v0, v3

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    sub-int v10, v0, v2

    int-to-float v10, v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    invoke-virtual {v5, v9, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 137
    const/4 v7, 0x0

    .line 139
    .local v7, "resultBitmap":Landroid/graphics/Bitmap;
    :try_start_0
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 140
    .local v7, "resultBitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 142
    .local v1, "canvas":Landroid/graphics/Canvas;
    new-instance v9, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v10, 0x0

    const/4 v11, 0x3

    invoke-direct {v9, v10, v11}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {v1, v9}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 143
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 144
    .local v6, "paint":Landroid/graphics/Paint;
    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 145
    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 146
    invoke-virtual {v1, p0, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 148
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v6    # "paint":Landroid/graphics/Paint;
    .end local v7    # "resultBitmap":Landroid/graphics/Bitmap;
    :goto_2
    return-object v7

    .line 121
    .end local v0    # "bitmapSquareWidth":I
    .end local v2    # "desHeight":I
    .end local v3    # "desWidth":I
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 122
    .restart local v3    # "desWidth":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .restart local v2    # "desHeight":I
    goto :goto_0

    .line 131
    :cond_2
    const/4 v9, 0x1

    goto :goto_1

    .line 151
    .restart local v0    # "bitmapSquareWidth":I
    :catch_0
    move-exception v4

    .line 152
    .local v4, "error":Ljava/lang/OutOfMemoryError;
    const-string/jumbo v9, "Thumbnail"

    const-string/jumbo v10, "Failed to rotate thumbnail"

    invoke-static {v9, v10, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 149
    .end local v4    # "error":Ljava/lang/OutOfMemoryError;
    :catch_1
    move-exception v8

    .line 150
    .local v8, "t":Ljava/lang/Exception;
    const-string/jumbo v9, "Thumbnail"

    const-string/jumbo v10, "Failed to rotate thumbnail"

    invoke-static {v9, v10, v8}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public static createBitmap([BIZI)Landroid/graphics/Bitmap;
    .locals 11
    .param p0, "jpeg"    # [B
    .param p1, "orientation"    # I
    .param p2, "mirror"    # Z
    .param p3, "inSampleSize"    # I

    .prologue
    const/4 v1, 0x1

    const/high16 v6, 0x3f000000    # 0.5f

    const/4 v2, 0x0

    .line 481
    new-instance v8, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v8}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 482
    .local v8, "options":Landroid/graphics/BitmapFactory$Options;
    iput p3, v8, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 483
    iput-boolean v1, v8, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 484
    array-length v1, p0

    invoke-static {p0, v2, v1, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 486
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    rem-int/lit16 p1, p1, 0x168

    .line 487
    if-eqz v0, :cond_4

    if-nez p1, :cond_0

    if-eqz p2, :cond_4

    .line 488
    :cond_0
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 489
    .local v5, "m1":Landroid/graphics/Matrix;
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 490
    .local v7, "m2":Landroid/graphics/Matrix;
    if-eqz p1, :cond_1

    .line 491
    int-to-float v1, p1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v6

    .line 492
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v6

    .line 491
    invoke-virtual {v5, v1, v2, v3}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 494
    :cond_1
    if-eqz p2, :cond_2

    .line 495
    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v6

    .line 496
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    .line 495
    invoke-virtual {v7, v1, v2, v3, v4}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 497
    invoke-virtual {v5, v7}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 502
    :cond_2
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 501
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 502
    const/4 v6, 0x1

    .line 501
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 505
    .local v9, "rotated":Landroid/graphics/Bitmap;
    if-eq v9, v0, :cond_3

    .line 506
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 508
    :cond_3
    return-object v9

    .line 509
    .end local v9    # "rotated":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v10

    .line 510
    .local v10, "t":Ljava/lang/Exception;
    const-string/jumbo v1, "Thumbnail"

    const-string/jumbo v2, "Failed to rotate thumbnail"

    invoke-static {v1, v2, v10}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 513
    .end local v5    # "m1":Landroid/graphics/Matrix;
    .end local v7    # "m2":Landroid/graphics/Matrix;
    .end local v10    # "t":Ljava/lang/Exception;
    :cond_4
    return-object v0
.end method

.method public static createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;
    .locals 3
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "orientation"    # I
    .param p3, "mirror"    # Z

    .prologue
    const/4 v2, 0x0

    .line 564
    if-nez p1, :cond_0

    .line 565
    const-string/jumbo v0, "Thumbnail"

    const-string/jumbo v1, "Failed to create thumbnail from null bitmap"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 566
    return-object v2

    .line 568
    :cond_0
    new-instance v0, Lcom/android/camera/Thumbnail;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/camera/Thumbnail;-><init>(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)V

    return-object v0
.end method

.method public static createThumbnail([BIILandroid/net/Uri;Z)Lcom/android/camera/Thumbnail;
    .locals 4
    .param p0, "jpeg"    # [B
    .param p1, "orientation"    # I
    .param p2, "inSampleSize"    # I
    .param p3, "uri"    # Landroid/net/Uri;
    .param p4, "mirror"    # Z

    .prologue
    .line 428
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 429
    .local v1, "options":Landroid/graphics/BitmapFactory$Options;
    iput p2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 430
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 431
    array-length v2, p0

    const/4 v3, 0x0

    invoke-static {p0, v3, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 432
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {p3, v0, p1, p4}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v2

    return-object v2
.end method

.method public static createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;
    .locals 16
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "mirror"    # Z

    .prologue
    .line 436
    if-eqz p1, :cond_7

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 437
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    .line 439
    .local v11, "isImage":Z
    if-eqz v11, :cond_3

    .line 440
    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const-string/jumbo v2, "_id"

    const/4 v3, 0x0

    aput-object v2, v4, v3

    const-string/jumbo v2, "_data"

    const/4 v3, 0x1

    aput-object v2, v4, v3

    const-string/jumbo v2, "orientation"

    const/4 v3, 0x2

    aput-object v2, v4, v3

    .line 442
    :goto_0
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    .line 438
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 443
    .local v9, "cursor":Landroid/database/Cursor;
    const-wide/16 v12, -0x1

    .line 444
    .local v12, "id":J
    const/4 v15, 0x0

    .line 445
    .local v15, "path":Ljava/lang/String;
    const/4 v14, 0x0

    .line 446
    .local v14, "orientation":I
    const/4 v10, 0x0

    .line 448
    .local v10, "find":Z
    if-eqz v9, :cond_0

    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 449
    const/4 v2, 0x0

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 450
    const/4 v2, 0x1

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 451
    .local v15, "path":Ljava/lang/String;
    if-eqz v11, :cond_4

    const/4 v2, 0x2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v14

    .line 452
    :goto_1
    const/4 v10, 0x1

    .line 455
    .end local v15    # "path":Ljava/lang/String;
    :cond_0
    if-eqz v9, :cond_1

    .line 456
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 457
    const/4 v9, 0x0

    .line 460
    .end local v9    # "cursor":Landroid/database/Cursor;
    :cond_1
    const/4 v8, 0x0

    .line 461
    .local v8, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v10, :cond_7

    .line 462
    if-eqz v11, :cond_6

    .line 463
    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v12, v13, v2, v3}, Landroid/provider/MediaStore$Images$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 464
    .local v8, "bitmap":Landroid/graphics/Bitmap;
    if-nez v8, :cond_2

    .line 465
    const/4 v2, 0x1

    invoke-static {v15, v2}, Landroid/media/ThumbnailUtils;->createImageThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 473
    :cond_2
    :goto_2
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v8, v14, v1}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v2

    return-object v2

    .line 441
    .end local v8    # "bitmap":Landroid/graphics/Bitmap;
    .end local v10    # "find":Z
    .end local v12    # "id":J
    .end local v14    # "orientation":I
    :cond_3
    const/4 v2, 0x2

    new-array v4, v2, [Ljava/lang/String;

    const-string/jumbo v2, "_id"

    const/4 v3, 0x0

    aput-object v2, v4, v3

    const-string/jumbo v2, "_data"

    const/4 v3, 0x1

    aput-object v2, v4, v3

    goto :goto_0

    .line 451
    .restart local v9    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "find":Z
    .restart local v12    # "id":J
    .restart local v14    # "orientation":I
    .restart local v15    # "path":Ljava/lang/String;
    :cond_4
    const/4 v14, 0x0

    goto :goto_1

    .line 454
    .end local v15    # "path":Ljava/lang/String;
    :catchall_0
    move-exception v2

    .line 455
    if-eqz v9, :cond_5

    .line 456
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 457
    const/4 v9, 0x0

    .line 454
    .end local v9    # "cursor":Landroid/database/Cursor;
    :cond_5
    throw v2

    .line 468
    .local v8, "bitmap":Landroid/graphics/Bitmap;
    :cond_6
    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v12, v13, v2, v3}, Landroid/provider/MediaStore$Video$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 469
    .local v8, "bitmap":Landroid/graphics/Bitmap;
    if-nez v8, :cond_2

    .line 470
    const/4 v2, 0x1

    invoke-static {v15, v2}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v8

    goto :goto_2

    .line 476
    .end local v8    # "bitmap":Landroid/graphics/Bitmap;
    .end local v10    # "find":Z
    .end local v11    # "isImage":Z
    .end local v12    # "id":J
    .end local v14    # "orientation":I
    :cond_7
    const/4 v2, 0x0

    return-object v2
.end method

.method public static createVideoThumbnailBitmap(Ljava/io/FileDescriptor;I)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "fd"    # Ljava/io/FileDescriptor;
    .param p1, "targetWidth"    # I

    .prologue
    .line 517
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/lang/String;Ljava/io/FileDescriptor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static createVideoThumbnailBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "targetWidth"    # I

    .prologue
    .line 521
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/lang/String;Ljava/io/FileDescriptor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method private static createVideoThumbnailBitmap(Ljava/lang/String;Ljava/io/FileDescriptor;I)Landroid/graphics/Bitmap;
    .locals 13
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "targetWidth"    # I

    .prologue
    const/4 v12, 0x0

    .line 526
    const/4 v0, 0x0

    .line 527
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v5}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 529
    .local v5, "retriever":Landroid/media/MediaMetadataRetriever;
    if-eqz p0, :cond_0

    .line 530
    :try_start_0
    invoke-virtual {v5, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 534
    :goto_0
    const-wide/16 v10, -0x1

    invoke-virtual {v5, v10, v11}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime(J)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 541
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :try_start_1
    invoke-virtual {v5}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 546
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_1
    if-nez v0, :cond_1

    .line 547
    const-string/jumbo v9, "Thumbnail"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "fail to get thumbnail for "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    return-object v12

    .line 532
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    :try_start_2
    invoke-virtual {v5, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/io/FileDescriptor;)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 535
    :catch_0
    move-exception v1

    .line 536
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    :try_start_3
    const-string/jumbo v9, "Thumbnail"

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 541
    :try_start_4
    invoke-virtual {v5}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 542
    :catch_1
    move-exception v2

    .line 543
    .local v2, "ex":Ljava/lang/RuntimeException;
    const-string/jumbo v9, "Thumbnail"

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 542
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :catch_2
    move-exception v2

    .line 543
    .restart local v2    # "ex":Ljava/lang/RuntimeException;
    const-string/jumbo v9, "Thumbnail"

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 537
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :catch_3
    move-exception v2

    .line 538
    .restart local v2    # "ex":Ljava/lang/RuntimeException;
    :try_start_5
    const-string/jumbo v9, "Thumbnail"

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 541
    :try_start_6
    invoke-virtual {v5}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_1

    .line 542
    :catch_4
    move-exception v2

    .line 543
    const-string/jumbo v9, "Thumbnail"

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 539
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v9

    .line 541
    :try_start_7
    invoke-virtual {v5}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_5

    .line 539
    :goto_2
    throw v9

    .line 542
    :catch_5
    move-exception v2

    .line 543
    .restart local v2    # "ex":Ljava/lang/RuntimeException;
    const-string/jumbo v10, "Thumbnail"

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 552
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    .line 553
    .local v8, "width":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 554
    .local v4, "height":I
    if-le v8, p2, :cond_2

    .line 555
    int-to-float v9, p2

    int-to-float v10, v8

    div-float v6, v9, v10

    .line 556
    .local v6, "scale":F
    int-to-float v9, v8

    mul-float/2addr v9, v6

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 557
    .local v7, "w":I
    int-to-float v9, v4

    mul-float/2addr v9, v6

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 558
    .local v3, "h":I
    const/4 v9, 0x1

    invoke-static {v0, v7, v3, v9}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 560
    .end local v3    # "h":I
    .end local v6    # "scale":F
    .end local v7    # "w":I
    :cond_2
    return-object v0
.end method

.method private static getImageBucketIds()Ljava/lang/String;
    .locals 2

    .prologue
    .line 295
    invoke-static {}, Lcom/android/camera/storage/Storage;->secondaryStorageMounted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 296
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "bucket_id IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 297
    sget v1, Lcom/android/camera/storage/Storage;->PRIMARY_BUCKET_ID:I

    .line 296
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 297
    const-string/jumbo v1, ","

    .line 296
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 297
    sget v1, Lcom/android/camera/storage/Storage;->SECONDARY_BUCKET_ID:I

    .line 296
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 297
    const-string/jumbo v1, ")"

    .line 296
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 299
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "bucket_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/android/camera/storage/Storage;->BUCKET_ID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getLastImageThumbnail(Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail$Media;
    .locals 20
    .param p0, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 326
    sget-object v16, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 328
    .local v16, "baseUri":Landroid/net/Uri;
    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v5, "limit"

    const-string/jumbo v7, "1"

    invoke-virtual {v1, v5, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 329
    .local v2, "query":Landroid/net/Uri;
    const/4 v1, 0x4

    new-array v3, v1, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    const/4 v5, 0x0

    aput-object v1, v3, v5

    const-string/jumbo v1, "orientation"

    const/4 v5, 0x1

    aput-object v1, v3, v5

    .line 330
    const-string/jumbo v1, "datetaken"

    const/4 v5, 0x2

    aput-object v1, v3, v5

    const-string/jumbo v1, "_data"

    const/4 v5, 0x3

    aput-object v1, v3, v5

    .line 331
    .local v3, "projection":[Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "mime_type=\'image/jpeg\' AND "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 332
    invoke-static {}, Lcom/android/camera/Thumbnail;->getImageBucketIds()Ljava/lang/String;

    move-result-object v5

    .line 331
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 332
    const-string/jumbo v5, " AND "

    .line 331
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 332
    const-string/jumbo v5, "_size"

    .line 331
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 332
    const-string/jumbo v5, " > 0"

    .line 331
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 333
    .local v4, "selection":Ljava/lang/String;
    const-string/jumbo v6, "datetaken DESC,_id DESC"

    .line 334
    .local v6, "order":Ljava/lang/String;
    const/16 v17, 0x0

    .line 335
    .local v17, "cursor":Landroid/database/Cursor;
    const/16 v18, 0x0

    .line 336
    .local v18, "cursorAll":Landroid/database/Cursor;
    const/16 v19, 0x0

    .line 338
    .local v19, "firstMiss":Z
    const/4 v5, 0x0

    move-object/from16 v1, p0

    :try_start_0
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 339
    .local v17, "cursor":Landroid/database/Cursor;
    if-eqz v17, :cond_2

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 340
    const/4 v1, 0x3

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 341
    new-instance v1, Ljava/io/File;

    const/4 v5, 0x3

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    .line 340
    if-eqz v1, :cond_1

    .line 342
    const/4 v1, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 343
    .local v8, "id":J
    new-instance v7, Lcom/android/camera/Thumbnail$Media;

    const/4 v1, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    const/4 v1, 0x2

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 344
    move-object/from16 v0, v16

    invoke-static {v0, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v13

    const/4 v1, 0x3

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 343
    invoke-direct/range {v7 .. v14}, Lcom/android/camera/Thumbnail$Media;-><init>(JIJLandroid/net/Uri;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 365
    if-eqz v17, :cond_0

    .line 366
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 343
    :cond_0
    return-object v7

    .line 347
    .end local v8    # "id":J
    :cond_1
    const/16 v19, 0x1

    .line 351
    :cond_2
    if-eqz v19, :cond_6

    .line 352
    const/4 v14, 0x0

    move-object/from16 v10, p0

    move-object/from16 v11, v16

    move-object v12, v3

    move-object v13, v4

    move-object v15, v6

    :try_start_1
    invoke-virtual/range {v10 .. v15}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 353
    .local v18, "cursorAll":Landroid/database/Cursor;
    if-eqz v18, :cond_6

    .line 354
    :cond_3
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 355
    const/4 v1, 0x3

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 356
    new-instance v1, Ljava/io/File;

    const/4 v5, 0x3

    move-object/from16 v0, v18

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    .line 355
    if-eqz v1, :cond_3

    .line 357
    const/4 v1, 0x0

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 358
    .restart local v8    # "id":J
    new-instance v7, Lcom/android/camera/Thumbnail$Media;

    const/4 v1, 0x1

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    const/4 v1, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 359
    move-object/from16 v0, v16

    invoke-static {v0, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v13

    const/4 v1, 0x3

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 358
    invoke-direct/range {v7 .. v14}, Lcom/android/camera/Thumbnail$Media;-><init>(JIJLandroid/net/Uri;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    if-eqz v17, :cond_4

    .line 366
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 368
    :cond_4
    if-eqz v18, :cond_5

    .line 369
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 358
    :cond_5
    return-object v7

    .line 365
    .end local v8    # "id":J
    .end local v18    # "cursorAll":Landroid/database/Cursor;
    :cond_6
    if-eqz v17, :cond_7

    .line 366
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 368
    :cond_7
    if-eqz v18, :cond_8

    .line 369
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 372
    :cond_8
    const/4 v1, 0x0

    return-object v1

    .line 364
    .end local v17    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v1

    .line 365
    if-eqz v17, :cond_9

    .line 366
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 368
    :cond_9
    if-eqz v18, :cond_a

    .line 369
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 364
    :cond_a
    throw v1
.end method

.method public static getLastThumbnailFromContentResolver(Landroid/content/ContentResolver;[Lcom/android/camera/Thumbnail;Landroid/net/Uri;)I
    .locals 10
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "result"    # [Lcom/android/camera/Thumbnail;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 229
    invoke-static {p0}, Lcom/android/camera/Thumbnail;->getLastImageThumbnail(Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail$Media;

    move-result-object v2

    .line 230
    .local v2, "image":Lcom/android/camera/Thumbnail$Media;
    invoke-static {p0}, Lcom/android/camera/Thumbnail;->getLastVideoThumbnail(Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail$Media;

    move-result-object v4

    .line 231
    .local v4, "video":Lcom/android/camera/Thumbnail$Media;
    if-nez v2, :cond_0

    if-nez v4, :cond_0

    const/4 v5, 0x0

    return v5

    .line 233
    :cond_0
    const/4 v0, 0x0

    .line 237
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_4

    if-eqz v4, :cond_1

    iget-wide v6, v2, Lcom/android/camera/Thumbnail$Media;->dateTaken:J

    iget-wide v8, v4, Lcom/android/camera/Thumbnail$Media;->dateTaken:J

    cmp-long v5, v6, v8

    if-ltz v5, :cond_4

    .line 238
    :cond_1
    if-eqz p2, :cond_2

    iget-object v5, v2, Lcom/android/camera/Thumbnail$Media;->uri:Landroid/net/Uri;

    invoke-virtual {p2, v5}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 239
    const/4 v5, -0x1

    return v5

    .line 241
    :cond_2
    iget-wide v6, v2, Lcom/android/camera/Thumbnail$Media;->id:J

    const/4 v5, 0x1

    const/4 v8, 0x0

    invoke-static {p0, v6, v7, v5, v8}, Landroid/provider/MediaStore$Images$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 243
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_3

    .line 246
    :try_start_0
    iget-object v5, v2, Lcom/android/camera/Thumbnail$Media;->path:Ljava/lang/String;

    const/4 v6, 0x1

    invoke-static {v5, v6}, Landroid/media/ThumbnailUtils;->createImageThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 251
    :cond_3
    :goto_0
    move-object v3, v2

    .line 271
    .local v3, "lastMedia":Lcom/android/camera/Thumbnail$Media;
    :goto_1
    if-eqz v0, :cond_7

    iget-object v5, v3, Lcom/android/camera/Thumbnail$Media;->uri:Landroid/net/Uri;

    invoke-static {v5, p0}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 272
    iget-object v5, v3, Lcom/android/camera/Thumbnail$Media;->uri:Landroid/net/Uri;

    iget v6, v3, Lcom/android/camera/Thumbnail$Media;->orientation:I

    const/4 v7, 0x0

    invoke-static {v5, v0, v6, v7}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, p1, v6

    .line 273
    const/4 v5, 0x1

    return v5

    .line 247
    .end local v3    # "lastMedia":Lcom/android/camera/Thumbnail$Media;
    :catch_0
    move-exception v1

    .line 248
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v5, "Thumbnail"

    const-string/jumbo v6, "exception in createImageThumbnail"

    invoke-static {v5, v6, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 253
    .end local v1    # "e":Ljava/lang/Exception;
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :cond_4
    if-eqz p2, :cond_5

    iget-object v5, v4, Lcom/android/camera/Thumbnail$Media;->uri:Landroid/net/Uri;

    invoke-virtual {p2, v5}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 254
    const/4 v5, -0x1

    return v5

    .line 256
    :cond_5
    iget-wide v6, v4, Lcom/android/camera/Thumbnail$Media;->id:J

    const/4 v5, 0x1

    const/4 v8, 0x0

    invoke-static {p0, v6, v7, v5, v8}, Landroid/provider/MediaStore$Video$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 258
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_6

    .line 261
    :try_start_1
    iget-object v5, v4, Lcom/android/camera/Thumbnail$Media;->path:Ljava/lang/String;

    const/4 v6, 0x1

    invoke-static {v5, v6}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 267
    :cond_6
    :goto_2
    move-object v3, v4

    .restart local v3    # "lastMedia":Lcom/android/camera/Thumbnail$Media;
    goto :goto_1

    .line 262
    .end local v3    # "lastMedia":Lcom/android/camera/Thumbnail$Media;
    :catch_1
    move-exception v1

    .line 263
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string/jumbo v5, "Thumbnail"

    const-string/jumbo v6, "exception in createVideoThumbnail"

    invoke-static {v5, v6, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 275
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "lastMedia":Lcom/android/camera/Thumbnail$Media;
    :cond_7
    const/4 v5, 0x2

    return v5
.end method

.method public static getLastThumbnailFromFile(Ljava/io/File;Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail;
    .locals 16
    .param p0, "filesDir"    # Ljava/io/File;
    .param p1, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 190
    new-instance v9, Ljava/io/File;

    const-string/jumbo v12, "last_thumb"

    move-object/from16 v0, p0

    invoke-direct {v9, v0, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 191
    .local v9, "file":Ljava/io/File;
    const/4 v11, 0x0

    .line 192
    .local v11, "uri":Landroid/net/Uri;
    const/4 v3, 0x0

    .line 193
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    const/4 v7, 0x0

    .line 194
    .local v7, "f":Ljava/io/FileInputStream;
    const/4 v1, 0x0

    .line 195
    .local v1, "b":Ljava/io/BufferedInputStream;
    const/4 v4, 0x0

    .line 196
    .local v4, "d":Ljava/io/DataInputStream;
    sget-object v13, Lcom/android/camera/Thumbnail;->sLock:Ljava/lang/Object;

    monitor-enter v13

    .line 198
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    .end local v7    # "f":Ljava/io/FileInputStream;
    .local v8, "f":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v2, Ljava/io/BufferedInputStream;

    const/16 v12, 0x1000

    invoke-direct {v2, v8, v12}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 200
    .local v2, "b":Ljava/io/BufferedInputStream;
    :try_start_2
    new-instance v5, Ljava/io/DataInputStream;

    .end local v1    # "b":Ljava/io/BufferedInputStream;
    invoke-direct {v5, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 201
    .local v5, "d":Ljava/io/DataInputStream;
    :try_start_3
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    .end local v4    # "d":Ljava/io/DataInputStream;
    move-result-object v12

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .line 202
    .local v11, "uri":Landroid/net/Uri;
    move-object/from16 v0, p1

    invoke-static {v11, v0}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 203
    invoke-virtual {v5}, Ljava/io/DataInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 212
    :try_start_4
    invoke-static {v8}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 213
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 214
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 204
    const/4 v12, 0x0

    monitor-exit v13

    return-object v12

    .line 206
    :cond_0
    :try_start_5
    invoke-static {v5}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 207
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v5}, Ljava/io/DataInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 212
    :try_start_6
    invoke-static {v8}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 213
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 214
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    monitor-exit v13

    .line 217
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v11, v3, v12, v13}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v10

    .line 218
    .local v10, "thumbnail":Lcom/android/camera/Thumbnail;
    if-eqz v10, :cond_1

    const/4 v12, 0x1

    invoke-virtual {v10, v12}, Lcom/android/camera/Thumbnail;->setFromFile(Z)V

    .line 219
    :cond_1
    return-object v10

    .line 208
    .end local v2    # "b":Ljava/io/BufferedInputStream;
    .end local v5    # "d":Ljava/io/DataInputStream;
    .end local v8    # "f":Ljava/io/FileInputStream;
    .end local v10    # "thumbnail":Lcom/android/camera/Thumbnail;
    .restart local v1    # "b":Ljava/io/BufferedInputStream;
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    .restart local v4    # "d":Ljava/io/DataInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    .local v11, "uri":Landroid/net/Uri;
    :catch_0
    move-exception v6

    .line 209
    .end local v1    # "b":Ljava/io/BufferedInputStream;
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "d":Ljava/io/DataInputStream;
    .end local v7    # "f":Ljava/io/FileInputStream;
    .end local v11    # "uri":Landroid/net/Uri;
    .local v6, "e":Ljava/io/IOException;
    :goto_0
    :try_start_7
    const-string/jumbo v12, "Thumbnail"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Fail to load bitmap. "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v14}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 212
    :try_start_8
    invoke-static {v7}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 213
    invoke-static {v1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 214
    invoke-static {v4}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 210
    const/4 v12, 0x0

    monitor-exit v13

    return-object v12

    .line 211
    .end local v6    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v12

    .line 212
    :goto_1
    :try_start_9
    invoke-static {v7}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 213
    invoke-static {v1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 214
    invoke-static {v4}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 211
    throw v12
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 196
    :catchall_1
    move-exception v12

    :goto_2
    monitor-exit v13

    throw v12

    .restart local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v5    # "d":Ljava/io/DataInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    .local v11, "uri":Landroid/net/Uri;
    :catchall_2
    move-exception v12

    move-object v4, v5

    .end local v5    # "d":Ljava/io/DataInputStream;
    .local v4, "d":Ljava/io/DataInputStream;
    move-object v1, v2

    .end local v2    # "b":Ljava/io/BufferedInputStream;
    .local v1, "b":Ljava/io/BufferedInputStream;
    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .local v7, "f":Ljava/io/FileInputStream;
    goto :goto_2

    .line 211
    .end local v7    # "f":Ljava/io/FileInputStream;
    .local v1, "b":Ljava/io/BufferedInputStream;
    .restart local v3    # "bitmap":Landroid/graphics/Bitmap;
    .local v4, "d":Ljava/io/DataInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    .local v11, "uri":Landroid/net/Uri;
    :catchall_3
    move-exception v12

    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v1    # "b":Ljava/io/BufferedInputStream;
    .end local v7    # "f":Ljava/io/FileInputStream;
    .restart local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    :catchall_4
    move-exception v12

    move-object v1, v2

    .end local v2    # "b":Ljava/io/BufferedInputStream;
    .local v1, "b":Ljava/io/BufferedInputStream;
    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v1    # "b":Ljava/io/BufferedInputStream;
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "d":Ljava/io/DataInputStream;
    .end local v7    # "f":Ljava/io/FileInputStream;
    .end local v11    # "uri":Landroid/net/Uri;
    .restart local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v5    # "d":Ljava/io/DataInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    :catchall_5
    move-exception v12

    move-object v4, v5

    .end local v5    # "d":Ljava/io/DataInputStream;
    .local v4, "d":Ljava/io/DataInputStream;
    move-object v1, v2

    .end local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v1    # "b":Ljava/io/BufferedInputStream;
    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    goto :goto_1

    .line 208
    .end local v7    # "f":Ljava/io/FileInputStream;
    .local v1, "b":Ljava/io/BufferedInputStream;
    .restart local v3    # "bitmap":Landroid/graphics/Bitmap;
    .local v4, "d":Ljava/io/DataInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    .restart local v11    # "uri":Landroid/net/Uri;
    :catch_1
    move-exception v6

    .restart local v6    # "e":Ljava/io/IOException;
    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    goto :goto_0

    .end local v1    # "b":Ljava/io/BufferedInputStream;
    .end local v6    # "e":Ljava/io/IOException;
    .end local v7    # "f":Ljava/io/FileInputStream;
    .restart local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    :catch_2
    move-exception v6

    .restart local v6    # "e":Ljava/io/IOException;
    move-object v1, v2

    .end local v2    # "b":Ljava/io/BufferedInputStream;
    .local v1, "b":Ljava/io/BufferedInputStream;
    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    goto :goto_0

    .end local v1    # "b":Ljava/io/BufferedInputStream;
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "d":Ljava/io/DataInputStream;
    .end local v6    # "e":Ljava/io/IOException;
    .end local v7    # "f":Ljava/io/FileInputStream;
    .end local v11    # "uri":Landroid/net/Uri;
    .restart local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v5    # "d":Ljava/io/DataInputStream;
    .restart local v8    # "f":Ljava/io/FileInputStream;
    :catch_3
    move-exception v6

    .restart local v6    # "e":Ljava/io/IOException;
    move-object v4, v5

    .end local v5    # "d":Ljava/io/DataInputStream;
    .local v4, "d":Ljava/io/DataInputStream;
    move-object v1, v2

    .end local v2    # "b":Ljava/io/BufferedInputStream;
    .restart local v1    # "b":Ljava/io/BufferedInputStream;
    move-object v7, v8

    .end local v8    # "f":Ljava/io/FileInputStream;
    .restart local v7    # "f":Ljava/io/FileInputStream;
    goto :goto_0
.end method

.method public static getLastThumbnailFromUriList(Landroid/content/ContentResolver;[Lcom/android/camera/Thumbnail;Ljava/util/ArrayList;Landroid/net/Uri;)I
    .locals 4
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "result"    # [Lcom/android/camera/Thumbnail;
    .param p3, "uriFromFile"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "[",
            "Lcom/android/camera/Thumbnail;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            ")I"
        }
    .end annotation

    .prologue
    .local p2, "uriList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const/4 v3, 0x0

    .line 573
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    return v3

    .line 575
    :cond_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_4

    .line 576
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    .line 577
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {v1, p0}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 578
    if-eqz p3, :cond_2

    invoke-virtual {p3, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 579
    const/4 v2, -0x1

    return v2

    .line 581
    :cond_2
    invoke-static {p0, v1, v3}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v2

    aput-object v2, p1, v3

    .line 582
    const/4 v2, 0x1

    return v2

    .line 575
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 585
    .end local v1    # "uri":Landroid/net/Uri;
    :cond_4
    return v3
.end method

.method public static getLastThumbnailUri(Landroid/content/ContentResolver;)Landroid/net/Uri;
    .locals 7
    .param p0, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    const/4 v6, 0x0

    .line 313
    invoke-static {p0}, Lcom/android/camera/Thumbnail;->getLastImageThumbnail(Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail$Media;

    move-result-object v0

    .line 314
    .local v0, "image":Lcom/android/camera/Thumbnail$Media;
    invoke-static {p0}, Lcom/android/camera/Thumbnail;->getLastVideoThumbnail(Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail$Media;

    move-result-object v1

    .line 316
    .local v1, "video":Lcom/android/camera/Thumbnail$Media;
    if-eqz v0, :cond_1

    if-eqz v1, :cond_0

    iget-wide v2, v0, Lcom/android/camera/Thumbnail$Media;->dateTaken:J

    iget-wide v4, v1, Lcom/android/camera/Thumbnail$Media;->dateTaken:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1

    .line 317
    :cond_0
    iget-object v2, v0, Lcom/android/camera/Thumbnail$Media;->uri:Landroid/net/Uri;

    return-object v2

    .line 318
    :cond_1
    if-eqz v1, :cond_3

    if-eqz v0, :cond_2

    iget-wide v2, v1, Lcom/android/camera/Thumbnail$Media;->dateTaken:J

    iget-wide v4, v0, Lcom/android/camera/Thumbnail$Media;->dateTaken:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3

    .line 319
    :cond_2
    iget-object v2, v1, Lcom/android/camera/Thumbnail$Media;->uri:Landroid/net/Uri;

    return-object v2

    .line 321
    :cond_3
    return-object v6
.end method

.method private static getLastVideoThumbnail(Landroid/content/ContentResolver;)Lcom/android/camera/Thumbnail$Media;
    .locals 20
    .param p0, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 376
    sget-object v16, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 378
    .local v16, "baseUri":Landroid/net/Uri;
    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v5, "limit"

    const-string/jumbo v7, "1"

    invoke-virtual {v1, v5, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 379
    .local v2, "query":Landroid/net/Uri;
    const/4 v1, 0x3

    new-array v3, v1, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    const/4 v5, 0x0

    aput-object v1, v3, v5

    const-string/jumbo v1, "_data"

    const/4 v5, 0x1

    aput-object v1, v3, v5

    .line 380
    const-string/jumbo v1, "datetaken"

    const/4 v5, 0x2

    aput-object v1, v3, v5

    .line 381
    .local v3, "projection":[Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/android/camera/Thumbnail;->getVideoBucketIds()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v5, " AND "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v5, "_size"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v5, " > 0"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 382
    .local v4, "selection":Ljava/lang/String;
    const-string/jumbo v6, "datetaken DESC,_id DESC"

    .line 384
    .local v6, "order":Ljava/lang/String;
    const/16 v17, 0x0

    .line 385
    .local v17, "cursor":Landroid/database/Cursor;
    const/16 v18, 0x0

    .line 386
    .local v18, "cursorAll":Landroid/database/Cursor;
    const/16 v19, 0x0

    .line 388
    .local v19, "firstMiss":Z
    const/4 v5, 0x0

    move-object/from16 v1, p0

    :try_start_0
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 389
    .local v17, "cursor":Landroid/database/Cursor;
    if-eqz v17, :cond_2

    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 390
    const/4 v1, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 391
    .local v8, "id":J
    const/4 v1, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 392
    new-instance v1, Ljava/io/File;

    const/4 v5, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    .line 391
    if-eqz v1, :cond_1

    .line 393
    new-instance v7, Lcom/android/camera/Thumbnail$Media;

    const/4 v1, 0x2

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 394
    move-object/from16 v0, v16

    invoke-static {v0, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v13

    const/4 v1, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 393
    const/4 v10, 0x0

    invoke-direct/range {v7 .. v14}, Lcom/android/camera/Thumbnail$Media;-><init>(JIJLandroid/net/Uri;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 415
    if-eqz v17, :cond_0

    .line 416
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 393
    :cond_0
    return-object v7

    .line 397
    :cond_1
    const/16 v19, 0x1

    .line 401
    .end local v8    # "id":J
    :cond_2
    if-eqz v19, :cond_6

    .line 402
    const/4 v14, 0x0

    move-object/from16 v10, p0

    move-object/from16 v11, v16

    move-object v12, v3

    move-object v13, v4

    move-object v15, v6

    :try_start_1
    invoke-virtual/range {v10 .. v15}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 403
    .local v18, "cursorAll":Landroid/database/Cursor;
    if-eqz v18, :cond_6

    .line 404
    :cond_3
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 405
    const/4 v1, 0x1

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 406
    new-instance v1, Ljava/io/File;

    const/4 v5, 0x1

    move-object/from16 v0, v18

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    .line 405
    if-eqz v1, :cond_3

    .line 407
    const/4 v1, 0x0

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 408
    .restart local v8    # "id":J
    new-instance v7, Lcom/android/camera/Thumbnail$Media;

    const/4 v1, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 409
    move-object/from16 v0, v16

    invoke-static {v0, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v13

    const/4 v1, 0x1

    move-object/from16 v0, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 408
    const/4 v10, 0x0

    invoke-direct/range {v7 .. v14}, Lcom/android/camera/Thumbnail$Media;-><init>(JIJLandroid/net/Uri;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 415
    if-eqz v17, :cond_4

    .line 416
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 418
    :cond_4
    if-eqz v18, :cond_5

    .line 419
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 408
    :cond_5
    return-object v7

    .line 415
    .end local v8    # "id":J
    .end local v18    # "cursorAll":Landroid/database/Cursor;
    :cond_6
    if-eqz v17, :cond_7

    .line 416
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 418
    :cond_7
    if-eqz v18, :cond_8

    .line 419
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 422
    :cond_8
    const/4 v1, 0x0

    return-object v1

    .line 414
    .end local v17    # "cursor":Landroid/database/Cursor;
    :catchall_0
    move-exception v1

    .line 415
    if-eqz v17, :cond_9

    .line 416
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 418
    :cond_9
    if-eqz v18, :cond_a

    .line 419
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 414
    :cond_a
    throw v1
.end method

.method private static getVideoBucketIds()Ljava/lang/String;
    .locals 2

    .prologue
    .line 304
    invoke-static {}, Lcom/android/camera/storage/Storage;->secondaryStorageMounted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "bucket_id IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 306
    sget v1, Lcom/android/camera/storage/Storage;->PRIMARY_BUCKET_ID:I

    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 306
    const-string/jumbo v1, ","

    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 306
    sget v1, Lcom/android/camera/storage/Storage;->SECONDARY_BUCKET_ID:I

    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 306
    const-string/jumbo v1, ")"

    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 308
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "bucket_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/android/camera/storage/Storage;->BUCKET_ID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public fromFile()Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/android/camera/Thumbnail;->mFromFile:Z

    return v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/android/camera/Thumbnail;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/camera/Thumbnail;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public isWaitingForUri()Z
    .locals 1

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/android/camera/Thumbnail;->mWaitingForUri:Z

    return v0
.end method

.method public saveLastThumbnailToFile(Ljava/io/File;)V
    .locals 12
    .param p1, "filesDir"    # Ljava/io/File;

    .prologue
    .line 161
    iget-object v8, p0, Lcom/android/camera/Thumbnail;->mUri:Landroid/net/Uri;

    if-nez v8, :cond_0

    .line 162
    const-string/jumbo v8, "Thumbnail"

    const-string/jumbo v9, "Fail to store bitmap. uri is null"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    return-void

    .line 165
    :cond_0
    new-instance v7, Ljava/io/File;

    const-string/jumbo v8, "last_thumb"

    invoke-direct {v7, p1, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 166
    .local v7, "file":Ljava/io/File;
    const/4 v5, 0x0

    .line 167
    .local v5, "f":Ljava/io/FileOutputStream;
    const/4 v0, 0x0

    .line 168
    .local v0, "b":Ljava/io/BufferedOutputStream;
    const/4 v2, 0x0

    .line 169
    .local v2, "d":Ljava/io/DataOutputStream;
    sget-object v9, Lcom/android/camera/Thumbnail;->sLock:Ljava/lang/Object;

    monitor-enter v9

    .line 171
    :try_start_0
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 172
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .local v6, "f":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v1, Ljava/io/BufferedOutputStream;

    const/16 v8, 0x1000

    invoke-direct {v1, v6, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 173
    .local v1, "b":Ljava/io/BufferedOutputStream;
    :try_start_2
    new-instance v3, Ljava/io/DataOutputStream;

    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    invoke-direct {v3, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 174
    .local v3, "d":Ljava/io/DataOutputStream;
    :try_start_3
    iget-object v8, p0, Lcom/android/camera/Thumbnail;->mUri:Landroid/net/Uri;

    .end local v2    # "d":Ljava/io/DataOutputStream;
    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 175
    iget-object v8, p0, Lcom/android/camera/Thumbnail;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v10, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v11, 0x5a

    invoke-virtual {v8, v10, v11, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 176
    invoke-virtual {v3}, Ljava/io/DataOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 180
    :try_start_4
    invoke-static {v6}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 181
    invoke-static {v1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 182
    invoke-static {v3}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object v2, v3

    .end local v3    # "d":Ljava/io/DataOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    move-object v0, v1

    .end local v1    # "b":Ljava/io/BufferedOutputStream;
    .local v0, "b":Ljava/io/BufferedOutputStream;
    move-object v5, v6

    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    .end local v2    # "d":Ljava/io/DataOutputStream;
    .end local v6    # "f":Ljava/io/FileOutputStream;
    :goto_0
    monitor-exit v9

    .line 185
    return-void

    .line 177
    .local v0, "b":Ljava/io/BufferedOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v4

    .line 178
    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    .end local v2    # "d":Ljava/io/DataOutputStream;
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .local v4, "e":Ljava/io/IOException;
    :goto_1
    :try_start_5
    const-string/jumbo v8, "Thumbnail"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Fail to store bitmap. path="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 180
    :try_start_6
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 181
    invoke-static {v0}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 182
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 169
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :goto_2
    monitor-exit v9

    throw v8

    .line 179
    :catchall_1
    move-exception v8

    .line 180
    :goto_3
    :try_start_7
    invoke-static {v5}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 181
    invoke-static {v0}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 182
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 179
    throw v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 169
    .restart local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v3    # "d":Ljava/io/DataOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v8

    move-object v2, v3

    .end local v3    # "d":Ljava/io/DataOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    move-object v0, v1

    .end local v1    # "b":Ljava/io/BufferedOutputStream;
    .local v0, "b":Ljava/io/BufferedOutputStream;
    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .local v5, "f":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 179
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .local v0, "b":Ljava/io/BufferedOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catchall_3
    move-exception v8

    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    goto :goto_3

    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catchall_4
    move-exception v8

    move-object v0, v1

    .end local v1    # "b":Ljava/io/BufferedOutputStream;
    .local v0, "b":Ljava/io/BufferedOutputStream;
    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    goto :goto_3

    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    .end local v2    # "d":Ljava/io/DataOutputStream;
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v3    # "d":Ljava/io/DataOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catchall_5
    move-exception v8

    move-object v2, v3

    .end local v3    # "d":Ljava/io/DataOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    move-object v0, v1

    .end local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v0    # "b":Ljava/io/BufferedOutputStream;
    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 177
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .local v0, "b":Ljava/io/BufferedOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v4

    .restart local v4    # "e":Ljava/io/IOException;
    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v4

    .restart local v4    # "e":Ljava/io/IOException;
    move-object v0, v1

    .end local v1    # "b":Ljava/io/BufferedOutputStream;
    .local v0, "b":Ljava/io/BufferedOutputStream;
    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v0    # "b":Ljava/io/BufferedOutputStream;
    .end local v2    # "d":Ljava/io/DataOutputStream;
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "f":Ljava/io/FileOutputStream;
    .restart local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v3    # "d":Ljava/io/DataOutputStream;
    .restart local v6    # "f":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v4

    .restart local v4    # "e":Ljava/io/IOException;
    move-object v2, v3

    .end local v3    # "d":Ljava/io/DataOutputStream;
    .local v2, "d":Ljava/io/DataOutputStream;
    move-object v0, v1

    .end local v1    # "b":Ljava/io/BufferedOutputStream;
    .restart local v0    # "b":Ljava/io/BufferedOutputStream;
    move-object v5, v6

    .end local v6    # "f":Ljava/io/FileOutputStream;
    .restart local v5    # "f":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public setFromFile(Z)V
    .locals 0
    .param p1, "fromFile"    # Z

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/android/camera/Thumbnail;->mFromFile:Z

    .line 101
    return-void
.end method

.method public setUri(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/android/camera/Thumbnail;->mUri:Landroid/net/Uri;

    .line 92
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Thumbnail;->mWaitingForUri:Z

    .line 93
    return-void
.end method

.method public startWaitingForUri()V
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Thumbnail;->mWaitingForUri:Z

    .line 79
    return-void
.end method
