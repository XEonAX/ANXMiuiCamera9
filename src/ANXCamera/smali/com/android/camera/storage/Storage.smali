.class public Lcom/android/camera/storage/Storage;
.super Ljava/lang/Object;
.source "Storage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/storage/Storage$StorageListener;
    }
.end annotation


# static fields
.field public static BUCKET_ID:I

.field public static DIRECTORY:Ljava/lang/String;

.field public static FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

.field public static HIDEDIRECTORY:Ljava/lang/String;

.field private static final LEFT_SPACE:Ljava/util/concurrent/atomic/AtomicLong;

.field public static PRIMARY_BUCKET_ID:I

.field private static final PRIMARY_STORAGE_PATH:Ljava/lang/String;

.field public static SECONDARY_BUCKET_ID:I

.field private static SECONDARY_STORAGE_PATH:Ljava/lang/String;

.field private static sCurrentStoragePath:Ljava/lang/String;

.field private static sQuotaBytes:J

.field private static sQuotaSupported:Z

.field private static sReserveBytes:J

.field private static sStorageListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/camera/storage/Storage$StorageListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 78
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    .line 79
    const-string/jumbo v1, "SECONDARY_STORAGE"

    invoke-static {v1}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    .line 84
    sget-boolean v1, Lcom/android/camera/Device;->IS_HM:Z

    if-eqz v1, :cond_1

    sget-object v1, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    :goto_0
    sput-object v1, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    .line 85
    sget-object v1, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    sput-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/DCIM/Camera"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/DCIM/Camera/.ubifocus"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    .line 90
    sget-object v1, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sput v1, Lcom/android/camera/storage/Storage;->BUCKET_ID:I

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/DCIM/Camera"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 91
    sput v1, Lcom/android/camera/storage/Storage;->PRIMARY_BUCKET_ID:I

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/DCIM/Camera"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 93
    sput v1, Lcom/android/camera/storage/Storage;->SECONDARY_BUCKET_ID:I

    .line 106
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v1, Lcom/android/camera/storage/Storage;->LEFT_SPACE:Ljava/util/concurrent/atomic/AtomicLong;

    .line 124
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ".nomedia"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "unUsedFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 126
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 76
    :cond_0
    return-void

    .line 84
    .end local v0    # "unUsedFile":Ljava/io/File;
    :cond_1
    sget-object v1, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addImage(Landroid/app/Activity;Ljava/lang/String;JLandroid/location/Location;I[BIIZLjava/lang/String;)Landroid/net/Uri;
    .locals 16
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "date"    # J
    .param p4, "location"    # Landroid/location/Location;
    .param p5, "orientation"    # I
    .param p6, "jpeg"    # [B
    .param p7, "width"    # I
    .param p8, "height"    # I
    .param p9, "mirror"    # Z
    .param p10, "usedAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 174
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, p2

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move-object/from16 v14, p10

    .line 173
    invoke-static/range {v0 .. v14}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static addImage(Landroid/content/Context;Ljava/lang/String;IJLandroid/location/Location;II)Landroid/net/Uri;
    .locals 21
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "rotation"    # I
    .param p3, "date"    # J
    .param p5, "location"    # Landroid/location/Location;
    .param p6, "width"    # I
    .param p7, "height"    # I

    .prologue
    .line 343
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 344
    :cond_0
    const/4 v2, 0x0

    return-object v2

    .line 346
    :cond_1
    const/16 v17, 0x0

    .line 348
    .local v17, "file":Ljava/io/File;
    :try_start_0
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v17    # "file":Ljava/io/File;
    .local v18, "file":Ljava/io/File;
    move-object/from16 v17, v18

    .line 352
    .end local v18    # "file":Ljava/io/File;
    :goto_0
    if-eqz v17, :cond_2

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    .line 353
    :cond_2
    const/4 v2, 0x0

    return-object v2

    .line 349
    .restart local v17    # "file":Ljava/io/File;
    :catch_0
    move-exception v16

    .line 350
    .local v16, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "CameraStorage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to open panorama file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-static {v2, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 355
    .end local v16    # "e":Ljava/lang/Exception;
    .end local v17    # "file":Ljava/io/File;
    :cond_3
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 356
    .local v3, "fileName":Ljava/lang/String;
    const-string/jumbo v7, "image/jpeg"

    .line 357
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->length()J

    move-result-wide v10

    const/4 v15, 0x0

    move-object/from16 v2, p0

    move-object v4, v3

    move-wide/from16 v5, p3

    move/from16 v8, p2

    move-object/from16 v9, p1

    move/from16 v12, p6

    move/from16 v13, p7

    move-object/from16 v14, p5

    .line 356
    invoke-static/range {v2 .. v15}, Lcom/android/camera/storage/Storage;->insertToMediaStore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;ILjava/lang/String;JIILandroid/location/Location;Z)Landroid/net/Uri;

    move-result-object v19

    .line 360
    .local v19, "uri":Landroid/net/Uri;
    invoke-static/range {p0 .. p1}, Lcom/android/camera/storage/Storage;->saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;)V

    .line 361
    return-object v19
.end method

.method public static addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZLjava/lang/String;)Landroid/net/Uri;
    .locals 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "date"    # J
    .param p4, "location"    # Landroid/location/Location;
    .param p5, "orientation"    # I
    .param p6, "jpeg"    # [B
    .param p7, "width"    # I
    .param p8, "height"    # I
    .param p9, "mirror"    # Z
    .param p10, "isHide"    # Z
    .param p11, "isMap"    # Z
    .param p12, "usedAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 183
    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, p2

    move-object/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move-object/from16 v14, p12

    .line 182
    invoke-static/range {v0 .. v14}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;)Landroid/net/Uri;
    .locals 36
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "date"    # J
    .param p4, "location"    # Landroid/location/Location;
    .param p5, "orientation"    # I
    .param p6, "jpeg"    # [B
    .param p7, "width"    # I
    .param p8, "height"    # I
    .param p9, "mirror"    # Z
    .param p10, "isHide"    # Z
    .param p11, "isMap"    # Z
    .param p12, "appendExif"    # Z
    .param p13, "isParallelProcess"    # Z
    .param p14, "usedAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 193
    move-object/from16 v0, p6

    move/from16 v1, p13

    move-object/from16 v2, p14

    invoke-static {v0, v1, v2}, Lcom/android/camera/storage/Storage;->updateExif([BZLjava/lang/String;)[B

    move-result-object p6

    .line 194
    move-object/from16 v0, p1

    move/from16 v1, p10

    move/from16 v2, p11

    invoke-static {v0, v1, v2}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v11

    .line 195
    .local v11, "path":Ljava/lang/String;
    const/16 v25, 0x0

    .line 196
    .local v25, "in":Ljava/io/BufferedInputStream;
    const/16 v30, 0x0

    .line 198
    .local v30, "out":Ljava/io/BufferedOutputStream;
    const/16 v27, 0x0

    .line 200
    .local v27, "isException":Z
    :try_start_0
    new-instance v26, Ljava/io/BufferedInputStream;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, p6

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object/from16 v0, v26

    invoke-direct {v0, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 201
    .end local v25    # "in":Ljava/io/BufferedInputStream;
    .local v26, "in":Ljava/io/BufferedInputStream;
    :try_start_1
    new-instance v31, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v31

    invoke-direct {v0, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 203
    .local v31, "out":Ljava/io/BufferedOutputStream;
    if-eqz p9, :cond_b

    .line 204
    .end local v30    # "out":Ljava/io/BufferedOutputStream;
    :try_start_2
    move/from16 v0, p5

    rem-int/lit16 v4, v0, 0xb4

    if-nez v4, :cond_7

    const/16 v23, 0x1

    .line 205
    .local v23, "flipH":Z
    :goto_0
    xor-int/lit8 v4, v23, 0x1

    move-object/from16 v0, p6

    move/from16 v1, v23

    invoke-static {v0, v1, v4}, Lcom/android/camera/storage/Storage;->flipJpeg([BZZ)Landroid/graphics/Bitmap;

    move-result-object v18

    .line 206
    .local v18, "b":Landroid/graphics/Bitmap;
    if-eqz v18, :cond_8

    .line 207
    invoke-static/range {p6 .. p6}, Lcom/android/camera/Util;->getExif([B)Lcom/android/gallery3d/exif/ExifInterface;

    move-result-object v22

    .line 208
    .local v22, "exif":Lcom/android/gallery3d/exif/ExifInterface;
    invoke-virtual/range {v22 .. v22}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v33

    .line 209
    .local v33, "thumbnailBytes":[B
    if-eqz v33, :cond_1

    .line 210
    xor-int/lit8 v4, v23, 0x1

    move-object/from16 v0, v33

    move/from16 v1, v23

    invoke-static {v0, v1, v4}, Lcom/android/camera/storage/Storage;->flipJpeg([BZZ)Landroid/graphics/Bitmap;

    move-result-object v32

    .line 211
    .local v32, "thumb":Landroid/graphics/Bitmap;
    if-eqz v32, :cond_0

    .line 212
    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->setCompressedThumbnail(Landroid/graphics/Bitmap;)Z

    .line 213
    invoke-virtual/range {v32 .. v32}, Landroid/graphics/Bitmap;->recycle()V

    .line 215
    :cond_0
    const/16 p12, 0x0

    .line 217
    .end local v32    # "thumb":Landroid/graphics/Bitmap;
    .end local p12    # "appendExif":Z
    :cond_1
    move-object/from16 v0, v22

    move-object/from16 v1, v18

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif(Landroid/graphics/Bitmap;Ljava/io/OutputStream;)V

    .line 218
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->recycle()V

    .line 237
    .end local v18    # "b":Landroid/graphics/Bitmap;
    .end local v22    # "exif":Lcom/android/gallery3d/exif/ExifInterface;
    .end local v23    # "flipH":Z
    .end local v33    # "thumbnailBytes":[B
    :cond_2
    if-eqz p12, :cond_3

    .line 238
    invoke-virtual/range {v31 .. v31}, Ljava/io/BufferedOutputStream;->flush()V

    .line 239
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move/from16 v0, p5

    move-object/from16 v1, p4

    invoke-static {v11, v0, v1, v4, v5}, Lcom/android/camera/ExifHelper;->writeExif(Ljava/lang/String;ILandroid/location/Location;J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 256
    :cond_3
    if-eqz v26, :cond_4

    .line 257
    :try_start_3
    invoke-virtual/range {v26 .. v26}, Ljava/io/BufferedInputStream;->close()V

    .line 259
    :cond_4
    if-eqz v31, :cond_5

    .line 260
    invoke-virtual/range {v31 .. v31}, Ljava/io/BufferedOutputStream;->flush()V

    .line 261
    invoke-virtual/range {v31 .. v31}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :cond_5
    :goto_1
    move-object/from16 v30, v31

    .end local v31    # "out":Ljava/io/BufferedOutputStream;
    .local v30, "out":Ljava/io/BufferedOutputStream;
    move-object/from16 v25, v26

    .line 269
    .end local v26    # "in":Ljava/io/BufferedInputStream;
    .end local v30    # "out":Ljava/io/BufferedOutputStream;
    :cond_6
    :goto_2
    if-eqz v27, :cond_e

    .line 270
    const/4 v4, 0x0

    return-object v4

    .line 204
    .restart local v26    # "in":Ljava/io/BufferedInputStream;
    .restart local v31    # "out":Ljava/io/BufferedOutputStream;
    .restart local p12    # "appendExif":Z
    :cond_7
    const/16 v23, 0x0

    .restart local v23    # "flipH":Z
    goto :goto_0

    .line 224
    .restart local v18    # "b":Landroid/graphics/Bitmap;
    :cond_8
    const/16 v4, 0x1000

    :try_start_4
    new-array v0, v4, [B

    move-object/from16 v19, v0

    .line 226
    .local v19, "bb":[B
    :goto_3
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v28

    .local v28, "n":I
    const/4 v4, -0x1

    move/from16 v0, v28

    if-eq v0, v4, :cond_2

    .line 227
    const/4 v4, 0x0

    move-object/from16 v0, v31

    move-object/from16 v1, v19

    move/from16 v2, v28

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    .line 241
    .end local v18    # "b":Landroid/graphics/Bitmap;
    .end local v19    # "bb":[B
    .end local v23    # "flipH":Z
    .end local v28    # "n":I
    .end local p12    # "appendExif":Z
    :catch_0
    move-exception v21

    .local v21, "e":Ljava/lang/Exception;
    move-object/from16 v30, v31

    .end local v31    # "out":Ljava/io/BufferedOutputStream;
    .restart local v30    # "out":Ljava/io/BufferedOutputStream;
    move-object/from16 v25, v26

    .line 242
    .end local v26    # "in":Ljava/io/BufferedInputStream;
    .end local v30    # "out":Ljava/io/BufferedOutputStream;
    :goto_4
    :try_start_5
    const-string/jumbo v4, "CameraStorage"

    const-string/jumbo v5, "Failed to write image"

    move-object/from16 v0, v21

    invoke-static {v4, v5, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 243
    const/16 v27, 0x1

    .line 244
    invoke-static/range {v21 .. v21}, Lcom/android/camera/Util;->isQuotaExceeded(Ljava/lang/Exception;)Z

    move-result v4

    if-eqz v4, :cond_9

    move-object/from16 v0, p0

    instance-of v4, v0, Lcom/android/camera/ActivityBase;

    if-eqz v4, :cond_9

    .line 245
    move-object/from16 v0, p0

    check-cast v0, Lcom/android/camera/ActivityBase;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result v4

    if-nez v4, :cond_9

    .line 246
    move-object/from16 v0, p0

    check-cast v0, Lcom/android/camera/ActivityBase;

    move-object v4, v0

    new-instance v5, Lcom/android/camera/storage/Storage$1;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/android/camera/storage/Storage$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 256
    :cond_9
    if-eqz v25, :cond_a

    .line 257
    :try_start_6
    invoke-virtual/range {v25 .. v25}, Ljava/io/BufferedInputStream;->close()V

    .line 259
    :cond_a
    if-eqz v30, :cond_6

    .line 260
    invoke-virtual/range {v30 .. v30}, Ljava/io/BufferedOutputStream;->flush()V

    .line 261
    invoke-virtual/range {v30 .. v30}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    .line 264
    :catch_1
    move-exception v21

    .line 265
    const-string/jumbo v4, "CameraStorage"

    const-string/jumbo v5, "Failed to flush/close stream"

    move-object/from16 v0, v21

    invoke-static {v4, v5, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    const/16 v27, 0x1

    goto :goto_2

    .line 231
    .end local v21    # "e":Ljava/lang/Exception;
    .restart local v26    # "in":Ljava/io/BufferedInputStream;
    .restart local v31    # "out":Ljava/io/BufferedOutputStream;
    .restart local p12    # "appendExif":Z
    :cond_b
    const/16 v4, 0x1000

    :try_start_7
    new-array v0, v4, [B

    move-object/from16 v19, v0

    .line 233
    .restart local v19    # "bb":[B
    :goto_5
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v28

    .restart local v28    # "n":I
    const/4 v4, -0x1

    move/from16 v0, v28

    if-eq v0, v4, :cond_2

    .line 234
    const/4 v4, 0x0

    move-object/from16 v0, v31

    move-object/from16 v1, v19

    move/from16 v2, v28

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_5

    .line 254
    .end local v19    # "bb":[B
    .end local v28    # "n":I
    .end local p12    # "appendExif":Z
    :catchall_0
    move-exception v4

    move-object/from16 v30, v31

    .end local v31    # "out":Ljava/io/BufferedOutputStream;
    .restart local v30    # "out":Ljava/io/BufferedOutputStream;
    move-object/from16 v25, v26

    .line 256
    .end local v26    # "in":Ljava/io/BufferedInputStream;
    .end local v30    # "out":Ljava/io/BufferedOutputStream;
    :goto_6
    if-eqz v25, :cond_c

    .line 257
    :try_start_8
    invoke-virtual/range {v25 .. v25}, Ljava/io/BufferedInputStream;->close()V

    .line 259
    :cond_c
    if-eqz v30, :cond_d

    .line 260
    invoke-virtual/range {v30 .. v30}, Ljava/io/BufferedOutputStream;->flush()V

    .line 261
    invoke-virtual/range {v30 .. v30}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 254
    :cond_d
    :goto_7
    throw v4

    .line 264
    .restart local v26    # "in":Ljava/io/BufferedInputStream;
    .restart local v31    # "out":Ljava/io/BufferedOutputStream;
    :catch_2
    move-exception v21

    .line 265
    .restart local v21    # "e":Ljava/lang/Exception;
    const-string/jumbo v4, "CameraStorage"

    const-string/jumbo v5, "Failed to flush/close stream"

    move-object/from16 v0, v21

    invoke-static {v4, v5, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    const/16 v27, 0x1

    goto/16 :goto_1

    .line 264
    .end local v21    # "e":Ljava/lang/Exception;
    .end local v26    # "in":Ljava/io/BufferedInputStream;
    .end local v31    # "out":Ljava/io/BufferedOutputStream;
    :catch_3
    move-exception v21

    .line 265
    .restart local v21    # "e":Ljava/lang/Exception;
    const-string/jumbo v5, "CameraStorage"

    const-string/jumbo v6, "Failed to flush/close stream"

    move-object/from16 v0, v21

    invoke-static {v5, v6, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    const/16 v27, 0x1

    goto :goto_7

    .line 275
    .end local v21    # "e":Ljava/lang/Exception;
    :cond_e
    if-eqz p11, :cond_f

    .line 276
    invoke-static/range {p6 .. p6}, Lcom/android/camera/Util;->isProduceFocusInfoSuccess([B)Z

    move-result v24

    .line 277
    .local v24, "focusSuccess":Z
    invoke-static/range {p6 .. p8}, Lcom/android/camera/Util;->getCenterFocusDepthIndex([BII)I

    move-result v20

    .line 278
    .local v20, "centerFocused":I
    if-eqz v24, :cond_10

    const-string/jumbo v4, "_"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    :goto_8
    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 279
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v4, v5}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v11

    .line 280
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v24, :cond_11

    const-string/jumbo v4, "_"

    :goto_9
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move/from16 v0, p10

    invoke-static {v4, v0, v5}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v29

    .line 281
    .local v29, "oldPath":Ljava/lang/String;
    if-eqz v11, :cond_12

    if-eqz v29, :cond_12

    .line 282
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, v29

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 286
    .end local v29    # "oldPath":Ljava/lang/String;
    :goto_a
    if-nez v24, :cond_f

    .line 287
    invoke-static/range {p1 .. p1}, Lcom/android/camera/storage/Storage;->deleteImage(Ljava/lang/String;)V

    .line 290
    .end local v20    # "centerFocused":I
    .end local v24    # "focusSuccess":Z
    :cond_f
    if-eqz p10, :cond_15

    xor-int/lit8 v4, p11, 0x1

    if-eqz v4, :cond_15

    .line 291
    const/4 v4, 0x0

    return-object v4

    .line 278
    .restart local v20    # "centerFocused":I
    .restart local v24    # "focusSuccess":Z
    :cond_10
    const-string/jumbo v4, "_UBIFOCUS_"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    goto :goto_8

    .line 280
    :cond_11
    const-string/jumbo v4, "_UBIFOCUS_"

    goto :goto_9

    .line 284
    .restart local v29    # "oldPath":Ljava/lang/String;
    :cond_12
    const-string/jumbo v5, "CameraStorage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "oldPath: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v29, :cond_13

    const-string/jumbo v29, "null"

    .end local v29    # "oldPath":Ljava/lang/String;
    :cond_13
    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, " newPath: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-nez v11, :cond_14

    const-string/jumbo v4, "null"

    :goto_b
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    :cond_14
    move-object v4, v11

    goto :goto_b

    .line 295
    .end local v20    # "centerFocused":I
    .end local v24    # "focusSuccess":Z
    :cond_15
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ".jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v9, "image/jpeg"

    .line 296
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v12

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-wide/from16 v7, p2

    move/from16 v10, p5

    move/from16 v14, p7

    move/from16 v15, p8

    move-object/from16 v16, p4

    move/from16 v17, p13

    .line 295
    invoke-static/range {v4 .. v17}, Lcom/android/camera/storage/Storage;->insertToMediaStore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;ILjava/lang/String;JIILandroid/location/Location;Z)Landroid/net/Uri;

    move-result-object v34

    .line 297
    .local v34, "uri":Landroid/net/Uri;
    if-nez v34, :cond_16

    .line 298
    const-string/jumbo v4, "CameraStorage"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "failed to insert to DB: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    const/4 v4, 0x0

    return-object v4

    .line 303
    :cond_16
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v4

    if-nez v4, :cond_17

    .line 304
    invoke-static/range {v34 .. v34}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v4

    move-object/from16 v0, p0

    move/from16 v1, p13

    invoke-static {v0, v11, v1, v4, v5}, Lcom/android/camera/storage/Storage;->saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;ZJ)V

    .line 307
    :cond_17
    return-object v34

    .line 254
    .end local v34    # "uri":Landroid/net/Uri;
    :catchall_1
    move-exception v4

    goto/16 :goto_6

    .restart local v26    # "in":Ljava/io/BufferedInputStream;
    .local v30, "out":Ljava/io/BufferedOutputStream;
    .restart local p12    # "appendExif":Z
    :catchall_2
    move-exception v4

    move-object/from16 v25, v26

    .end local v26    # "in":Ljava/io/BufferedInputStream;
    .local v25, "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_6

    .line 241
    .local v25, "in":Ljava/io/BufferedInputStream;
    :catch_4
    move-exception v21

    .restart local v21    # "e":Ljava/lang/Exception;
    goto/16 :goto_4

    .end local v21    # "e":Ljava/lang/Exception;
    .end local v25    # "in":Ljava/io/BufferedInputStream;
    .restart local v26    # "in":Ljava/io/BufferedInputStream;
    :catch_5
    move-exception v21

    .restart local v21    # "e":Ljava/lang/Exception;
    move-object/from16 v25, v26

    .end local v26    # "in":Ljava/io/BufferedInputStream;
    .local v25, "in":Ljava/io/BufferedInputStream;
    goto/16 :goto_4
.end method

.method public static deleteImage(Ljava/lang/String;)V
    .locals 7
    .param p0, "title"    # Ljava/lang/String;

    .prologue
    .line 432
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 433
    .local v1, "hideFolder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 434
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    const/4 v2, 0x0

    array-length v4, v3

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 435
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_0

    .line 436
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 434
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 440
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    return-void
.end method

.method public static flipJpeg([BZZ)Landroid/graphics/Bitmap;
    .locals 12
    .param p0, "jpeg"    # [B
    .param p1, "flipH"    # Z
    .param p2, "flipV"    # Z

    .prologue
    const/high16 v6, 0x3f000000    # 0.5f

    const/4 v3, 0x0

    const/4 v11, 0x0

    const/4 v1, 0x1

    const/4 v10, -0x1

    .line 602
    if-nez p0, :cond_0

    .line 603
    return-object v11

    .line 605
    :cond_0
    new-instance v8, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v8}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 606
    .local v8, "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v1, v8, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 607
    array-length v2, p0

    invoke-static {p0, v3, v2, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 608
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 609
    .local v5, "m":Landroid/graphics/Matrix;
    if-eqz p1, :cond_4

    move v2, v10

    :goto_0
    int-to-float v2, v2

    if-eqz p2, :cond_1

    move v1, v10

    :cond_1
    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v6

    .line 610
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    .line 609
    invoke-virtual {v5, v2, v1, v3, v4}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 613
    :try_start_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 612
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 613
    const/4 v6, 0x1

    .line 612
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 615
    .local v7, "flip":Landroid/graphics/Bitmap;
    if-eq v7, v0, :cond_2

    .line 616
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 619
    :cond_2
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-eq v1, v10, :cond_3

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-ne v1, v10, :cond_5

    .line 620
    :cond_3
    return-object v11

    .end local v7    # "flip":Landroid/graphics/Bitmap;
    :cond_4
    move v2, v1

    .line 609
    goto :goto_0

    .line 622
    .restart local v7    # "flip":Landroid/graphics/Bitmap;
    :cond_5
    return-object v7

    .line 623
    .end local v7    # "flip":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v9

    .line 624
    .local v9, "t":Ljava/lang/Exception;
    const-string/jumbo v1, "CameraStorage"

    const-string/jumbo v2, "Failed to rotate thumbnail"

    invoke-static {v1, v2, v9}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 626
    return-object v11
.end method

.method public static generateFilepath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "title"    # Ljava/lang/String;

    .prologue
    .line 634
    const-string/jumbo v0, ".jpg"

    invoke-static {p0, v0}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static generateFilepath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "ext"    # Ljava/lang/String;

    .prologue
    .line 646
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static generateFilepath(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "isHide"    # Z
    .param p2, "isMap"    # Z

    .prologue
    .line 638
    if-eqz p1, :cond_0

    sget-object v0, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/storage/Storage;->isLowStorageSpace(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 639
    const/4 v0, 0x0

    return-object v0

    .line 641
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_1

    sget-object v0, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p2, :cond_2

    const-string/jumbo v0, ".y"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    sget-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const-string/jumbo v0, ".jpg"

    goto :goto_1
.end method

.method public static generatePrimaryFilepath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "title"    # Ljava/lang/String;

    .prologue
    .line 630
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/DCIM/Camera"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAvailableSpace()J
    .locals 2

    .prologue
    .line 704
    sget-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/storage/Storage;->getAvailableSpace(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getAvailableSpace(Ljava/lang/String;)J
    .locals 18
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 651
    if-nez p0, :cond_0

    .line 652
    const-wide/16 v14, -0x1

    return-wide v14

    .line 654
    :cond_0
    new-instance v5, Ljava/io/File;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 655
    .local v5, "dir":Ljava/io/File;
    const/16 v14, 0x1ff

    const/4 v15, -0x1

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-static {v5, v14, v15, v0}, Lcom/android/camera/Util;->mkdirs(Ljava/io/File;III)Z

    move-result v10

    .line 656
    .local v10, "needScan":Z
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v14

    xor-int/lit8 v14, v14, 0x1

    if-nez v14, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->canWrite()Z

    move-result v14

    xor-int/lit8 v14, v14, 0x1

    if-eqz v14, :cond_2

    .line 657
    :cond_1
    const-wide/16 v14, -0x1

    return-wide v14

    .line 660
    :cond_2
    if-eqz v10, :cond_3

    const-string/jumbo v14, "/DCIM/Camera"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 663
    new-instance v11, Landroid/content/Intent;

    const-string/jumbo v14, "miui.intent.action.MEDIA_SCANNER_SCAN_FOLDER"

    invoke-direct {v11, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 664
    .local v11, "scanIntent":Landroid/content/Intent;
    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v14

    invoke-virtual {v11, v14}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 665
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14, v11}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 670
    .end local v11    # "scanIntent":Landroid/content/Intent;
    :cond_3
    :try_start_0
    sget-object v14, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 671
    new-instance v14, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v16, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget-object v16, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ".nomedia"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v14}, Lcom/android/camera/Util;->createFile(Ljava/io/File;)Z

    .line 673
    :cond_4
    new-instance v12, Landroid/os/StatFs;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 674
    .local v12, "stat":Landroid/os/StatFs;
    invoke-virtual {v12}, Landroid/os/StatFs;->getAvailableBytes()J

    move-result-wide v2

    .line 675
    .local v2, "available":J
    sget-object v14, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 677
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUsePhoneStorage()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-static {}, Lcom/android/camera/storage/Storage;->isQuotaSupported()Z

    move-result v14

    if-eqz v14, :cond_5

    sget-wide v14, Lcom/android/camera/storage/Storage;->sReserveBytes:J

    cmp-long v14, v2, v14

    if-gez v14, :cond_5

    .line 679
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    .line 680
    .local v4, "context":Landroid/content/Context;
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    .line 681
    .local v9, "info":Landroid/content/pm/ApplicationInfo;
    const-class v14, Landroid/app/usage/StorageStatsManager;

    invoke-virtual {v4, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/usage/StorageStatsManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 684
    .local v13, "statsManager":Landroid/app/usage/StorageStatsManager;
    :try_start_1
    iget-object v14, v9, Landroid/content/pm/ApplicationInfo;->storageUuid:Ljava/util/UUID;

    iget v15, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v15}, Landroid/os/UserHandle;->getUserHandleForUid(I)Landroid/os/UserHandle;

    move-result-object v15

    .line 683
    invoke-virtual {v13, v14, v15}, Landroid/app/usage/StorageStatsManager;->queryExternalStatsForUser(Ljava/util/UUID;Landroid/os/UserHandle;)Landroid/app/usage/ExternalStorageStats;

    move-result-object v8

    .line 685
    .local v8, "externalStats":Landroid/app/usage/ExternalStorageStats;
    sget-wide v14, Lcom/android/camera/storage/Storage;->sQuotaBytes:J

    invoke-virtual {v8}, Landroid/app/usage/ExternalStorageStats;->getTotalBytes()J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v16

    sub-long v2, v14, v16

    .line 686
    const-wide/16 v14, 0x0

    cmp-long v14, v2, v14

    if-gez v14, :cond_5

    .line 687
    const-wide/16 v2, 0x0

    .line 694
    .end local v4    # "context":Landroid/content/Context;
    .end local v8    # "externalStats":Landroid/app/usage/ExternalStorageStats;
    .end local v9    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v13    # "statsManager":Landroid/app/usage/StorageStatsManager;
    :cond_5
    :goto_0
    :try_start_2
    invoke-static {v2, v3}, Lcom/android/camera/storage/Storage;->setLeftSpace(J)V

    .line 696
    :cond_6
    return-wide v2

    .line 690
    .restart local v4    # "context":Landroid/content/Context;
    .restart local v9    # "info":Landroid/content/pm/ApplicationInfo;
    .restart local v13    # "statsManager":Landroid/app/usage/StorageStatsManager;
    :catch_0
    move-exception v6

    .line 691
    .local v6, "e":Ljava/io/IOException;
    const-string/jumbo v14, "CameraStorage"

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 697
    .end local v2    # "available":J
    .end local v4    # "context":Landroid/content/Context;
    .end local v6    # "e":Ljava/io/IOException;
    .end local v9    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v12    # "stat":Landroid/os/StatFs;
    .end local v13    # "statsManager":Landroid/app/usage/StorageStatsManager;
    :catch_1
    move-exception v7

    .line 698
    .local v7, "e":Ljava/lang/Exception;
    const-string/jumbo v14, "CameraStorage"

    const-string/jumbo v15, "Fail to access external storage"

    invoke-static {v14, v15, v7}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 700
    const-wide/16 v14, -0x3

    return-wide v14
.end method

.method public static getLeftSpace()J
    .locals 5

    .prologue
    .line 830
    sget-object v2, Lcom/android/camera/storage/Storage;->LEFT_SPACE:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 831
    .local v0, "left":J
    const-string/jumbo v2, "CameraStorage"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "getLeftSpace() return "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 832
    return-wide v0
.end method

.method private static getSaveToCloudIntent(Landroid/content/Context;Ljava/lang/String;ZJ)Landroid/content/Intent;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "parallelProcess"    # Z
    .param p3, "mediaStoreId"    # J

    .prologue
    const/4 v6, 0x0

    .line 586
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v3, "com.miui.gallery.SAVE_TO_CLOUD"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 587
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "com.miui.gallery"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 588
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 589
    .local v1, "manager":Landroid/content/pm/PackageManager;
    invoke-virtual {v1, v0, v6}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 590
    .local v2, "resolveInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 591
    new-instance v4, Landroid/content/ComponentName;

    const-string/jumbo v5, "com.miui.gallery"

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v4, v5, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 593
    :cond_0
    const-string/jumbo v3, "extra_file_path"

    invoke-virtual {v0, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 594
    if-eqz p2, :cond_1

    .line 595
    const-string/jumbo v3, "extra_is_temp_file"

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 596
    const-string/jumbo v3, "extra_media_store_id"

    invoke-virtual {v0, v3, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 598
    :cond_1
    return-object v0
.end method

.method public static hasSecondaryStorage()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 729
    invoke-static {}, Lcom/android/camera/Device;->isSupportedSecondaryStorage()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static initQuota(Landroid/content/Context;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 149
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1a

    if-lt v6, v7, :cond_0

    .line 150
    const-class v6, Landroid/app/usage/StorageStatsManager;

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/usage/StorageStatsManager;

    .line 151
    .local v3, "statsManager":Landroid/app/usage/StorageStatsManager;
    new-array v1, v8, [Ljava/lang/Class;

    const-class v6, Landroid/app/usage/StorageStatsManager;

    aput-object v6, v1, v9

    .line 152
    .local v1, "ownerClazz":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string/jumbo v6, "isQuotaSupported"

    const-string/jumbo v7, "(Ljava/util/UUID;)Z"

    invoke-static {v1, v6, v7}, Lcom/android/camera/Util;->getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v0

    .line 153
    .local v0, "method":Lmiui/reflect/Method;
    if-eqz v0, :cond_0

    .line 154
    aget-object v6, v1, v9

    new-array v7, v8, [Ljava/lang/Object;

    sget-object v8, Landroid/os/storage/StorageManager;->UUID_DEFAULT:Ljava/util/UUID;

    aput-object v8, v7, v9

    invoke-virtual {v0, v6, v3, v7}, Lmiui/reflect/Method;->invokeBoolean(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v6

    sput-boolean v6, Lcom/android/camera/storage/Storage;->sQuotaSupported:Z

    .line 155
    sget-boolean v6, Lcom/android/camera/storage/Storage;->sQuotaSupported:Z

    if-eqz v6, :cond_0

    .line 156
    new-instance v2, Landroid/os/StatFs;

    sget-object v6, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    invoke-direct {v2, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 157
    .local v2, "stat":Landroid/os/StatFs;
    invoke-virtual {v2}, Landroid/os/StatFs;->getTotalBytes()J

    move-result-wide v4

    .line 158
    .local v4, "totalBytes":J
    long-to-float v6, v4

    const v7, 0x3f666666    # 0.9f

    mul-float/2addr v6, v7

    float-to-long v6, v6

    sput-wide v6, Lcom/android/camera/storage/Storage;->sQuotaBytes:J

    .line 159
    sget-wide v6, Lcom/android/camera/storage/Storage;->sQuotaBytes:J

    sub-long v6, v4, v6

    sput-wide v6, Lcom/android/camera/storage/Storage;->sReserveBytes:J

    .line 160
    const-string/jumbo v6, "CameraStorage"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "quota: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-wide v8, Lcom/android/camera/storage/Storage;->sQuotaBytes:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "|"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-wide v8, Lcom/android/camera/storage/Storage;->sReserveBytes:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .end local v0    # "method":Lmiui/reflect/Method;
    .end local v1    # "ownerClazz":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v2    # "stat":Landroid/os/StatFs;
    .end local v3    # "statsManager":Landroid/app/usage/StorageStatsManager;
    .end local v4    # "totalBytes":J
    :cond_0
    return-void
.end method

.method public static initStorage(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 131
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initQuota(Landroid/content/Context;)V

    .line 133
    invoke-static {}, Lcom/android/camera/Device;->isSupportedSecondaryStorage()Z

    move-result v1

    if-nez v1, :cond_0

    .line 134
    return-void

    .line 137
    :cond_0
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->getSdcardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "sdcardPath":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 139
    const-string/jumbo v1, "CameraStorage"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "initStorage sd="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    sput-object v0, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/DCIM/Camera"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 142
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 141
    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sput v1, Lcom/android/camera/storage/Storage;->SECONDARY_BUCKET_ID:I

    .line 145
    :cond_1
    invoke-static {}, Lcom/android/camera/storage/Storage;->readSystemPriorityStorage()V

    .line 146
    return-void
.end method

.method private static insertToMediaStore(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;ILjava/lang/String;JIILandroid/location/Location;Z)Landroid/net/Uri;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "date"    # J
    .param p5, "mime"    # Ljava/lang/String;
    .param p6, "rotation"    # I
    .param p7, "filePath"    # Ljava/lang/String;
    .param p8, "size"    # J
    .param p10, "width"    # I
    .param p11, "height"    # I
    .param p12, "location"    # Landroid/location/Location;
    .param p13, "isParallelProcess"    # Z

    .prologue
    .line 400
    new-instance v0, Landroid/content/ContentValues;

    const/16 v3, 0xb

    invoke-direct {v0, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 401
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string/jumbo v3, "title"

    invoke-virtual {v0, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    const-string/jumbo v3, "_display_name"

    invoke-virtual {v0, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    const-string/jumbo v3, "datetaken"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 404
    const-string/jumbo v3, "mime_type"

    invoke-virtual {v0, v3, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    const-string/jumbo v3, "orientation"

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 406
    const-string/jumbo v3, "_data"

    invoke-virtual {v0, v3, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    const-string/jumbo v3, "_size"

    invoke-static {p8, p9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 408
    const-string/jumbo v3, "width"

    invoke-static/range {p10 .. p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 409
    const-string/jumbo v3, "height"

    invoke-static/range {p11 .. p11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 411
    if-eqz p12, :cond_0

    .line 412
    const-string/jumbo v3, "latitude"

    invoke-virtual/range {p12 .. p12}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 413
    const-string/jumbo v3, "longitude"

    invoke-virtual/range {p12 .. p12}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 416
    :cond_0
    const/4 v2, 0x0

    .line 418
    .local v2, "uri":Landroid/net/Uri;
    if-nez p13, :cond_1

    .line 419
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 428
    .end local v2    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v2

    .line 421
    .restart local v2    # "uri":Landroid/net/Uri;
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "external"

    invoke-static {v4}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 422
    .local v2, "uri":Landroid/net/Uri;
    invoke-static {v2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v4

    invoke-static {p0, v4, v5, p7}, Lcom/android/camera/Util;->insertImageToParallelService(Landroid/content/Context;JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 424
    .end local v2    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 425
    .local v1, "th":Ljava/lang/Exception;
    const-string/jumbo v3, "CameraStorage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to write MediaStore:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static isCurrentStorageIsSecondary()Z
    .locals 2

    .prologue
    .line 737
    sget-object v0, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    sget-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isLowStorageAtLastPoint()Z
    .locals 4

    .prologue
    .line 821
    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v0

    const-wide/32 v2, 0x3200000

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isLowStorageSpace(Ljava/lang/String;)Z
    .locals 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 725
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->getAvailableSpace(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/32 v2, 0x3200000

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPhoneStoragePriority()Z
    .locals 2

    .prologue
    .line 811
    sget-object v0, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    sget-object v1, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isQuotaSupported()Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 167
    sget-boolean v1, Lcom/android/camera/storage/Storage;->sQuotaSupported:Z

    if-eqz v1, :cond_0

    sget-wide v2, Lcom/android/camera/storage/Storage;->sQuotaBytes:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isRelatedStorage(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v1, 0x0

    .line 797
    if-eqz p0, :cond_2

    .line 798
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 799
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 800
    sget-object v1, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 801
    sget-object v1, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 799
    :cond_0
    :goto_0
    return v1

    .line 800
    :cond_1
    const/4 v1, 0x1

    goto :goto_0

    .line 803
    .end local v0    # "path":Ljava/lang/String;
    :cond_2
    return v1
.end method

.method public static isUsePhoneStorage()Z
    .locals 2

    .prologue
    .line 807
    sget-object v0, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    sget-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static newImage(Landroid/content/Context;Ljava/lang/String;JIII)Landroid/net/Uri;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "date"    # J
    .param p4, "orientation"    # I
    .param p5, "width"    # I
    .param p6, "height"    # I

    .prologue
    .line 444
    invoke-static {p1}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 446
    .local v0, "path":Ljava/lang/String;
    new-instance v3, Landroid/content/ContentValues;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 447
    .local v3, "values":Landroid/content/ContentValues;
    const-string/jumbo v4, "datetaken"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 448
    const-string/jumbo v4, "orientation"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 449
    const-string/jumbo v4, "_data"

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    const-string/jumbo v4, "width"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 451
    const-string/jumbo v4, "height"

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 452
    const-string/jumbo v4, "mime_type"

    const-string/jumbo v5, "image/jpeg"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    const/4 v2, 0x0

    .line 456
    .local v2, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 465
    .end local v2    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v2

    .line 457
    .restart local v2    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 463
    .local v1, "th":Ljava/lang/Exception;
    const-string/jumbo v4, "CameraStorage"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Failed to new image"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static readSystemPriorityStorage()V
    .locals 2

    .prologue
    .line 784
    const/4 v0, 0x0

    .line 785
    .local v0, "isPriorityStorage":Z
    invoke-static {}, Lcom/android/camera/storage/Storage;->hasSecondaryStorage()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 787
    invoke-static {}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->isPriorityStorage()Z

    move-result v0

    .line 788
    .local v0, "isPriorityStorage":Z
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setPriorityStoragePreference(Z)V

    .line 790
    .end local v0    # "isPriorityStorage":Z
    :cond_0
    if-eqz v0, :cond_1

    .line 791
    sget-object v1, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    .line 790
    :goto_0
    sput-object v1, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    .line 792
    sget-object v1, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    sput-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    .line 793
    invoke-static {}, Lcom/android/camera/storage/Storage;->updateDirectory()V

    .line 794
    return-void

    .line 791
    :cond_1
    sget-object v1, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    goto :goto_0
.end method

.method public static saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 578
    const-wide/16 v0, -0x1

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lcom/android/camera/storage/Storage;->saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;ZJ)V

    .line 579
    return-void
.end method

.method public static saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;ZJ)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "parallelProcess"    # Z
    .param p3, "mediaStoreId"    # J

    .prologue
    .line 582
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/camera/storage/Storage;->getSaveToCloudIntent(Landroid/content/Context;Ljava/lang/String;ZJ)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 583
    return-void
.end method

.method public static secondaryStorageMounted()Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 733
    invoke-static {}, Lcom/android/camera/storage/Storage;->hasSecondaryStorage()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/storage/Storage;->getAvailableSpace(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static setLeftSpace(J)V
    .locals 4
    .param p0, "left"    # J

    .prologue
    .line 841
    sget-object v0, Lcom/android/camera/storage/Storage;->LEFT_SPACE:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 842
    const-string/jumbo v0, "CameraStorage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setLeftSpace("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 843
    return-void
.end method

.method public static setStorageListener(Lcom/android/camera/storage/Storage$StorageListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/android/camera/storage/Storage$StorageListener;

    .prologue
    .line 815
    if-eqz p0, :cond_0

    .line 816
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    .line 818
    :cond_0
    return-void
.end method

.method public static switchStoragePathIfNeeded()V
    .locals 6

    .prologue
    .line 741
    invoke-static {}, Lcom/android/camera/storage/Storage;->hasSecondaryStorage()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 742
    sget-object v0, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    .line 743
    .local v0, "firstConsiderPath":Ljava/lang/String;
    sget-object v2, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    .line 744
    .local v2, "secondConsiderPath":Ljava/lang/String;
    sget-object v3, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    sget-object v4, Lcom/android/camera/storage/Storage;->SECONDARY_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 745
    sget-object v2, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    .line 748
    :cond_0
    sget-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    .line 750
    .local v1, "oldPath":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/camera/storage/Storage;->isLowStorageSpace(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 751
    sput-object v0, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    .line 758
    :goto_0
    sget-object v3, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 759
    invoke-static {}, Lcom/android/camera/storage/Storage;->updateDirectory()V

    .line 760
    sget-object v3, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_1

    sget-object v3, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 761
    sget-object v3, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/storage/Storage$StorageListener;

    invoke-interface {v3}, Lcom/android/camera/storage/Storage$StorageListener;->onStoragePathChanged()V

    .line 764
    :cond_1
    const-string/jumbo v3, "CameraStorage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Storage path is switched path = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 766
    :cond_2
    return-void

    .line 752
    :cond_3
    invoke-static {v2}, Lcom/android/camera/storage/Storage;->isLowStorageSpace(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 753
    sput-object v2, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    goto :goto_0

    .line 755
    :cond_4
    return-void
.end method

.method public static switchToPhoneStorage()V
    .locals 2

    .prologue
    .line 772
    sget-object v0, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/storage/Storage;->FIRST_CONSIDER_STORAGE_PATH:Ljava/lang/String;

    .line 773
    sget-object v0, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    sget-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 774
    const-string/jumbo v0, "CameraStorage"

    const-string/jumbo v1, "switchToPhoneStorage"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 775
    sget-object v0, Lcom/android/camera/storage/Storage;->PRIMARY_STORAGE_PATH:Ljava/lang/String;

    sput-object v0, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    .line 776
    invoke-static {}, Lcom/android/camera/storage/Storage;->updateDirectory()V

    .line 777
    sget-object v0, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 778
    sget-object v0, Lcom/android/camera/storage/Storage;->sStorageListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/storage/Storage$StorageListener;

    invoke-interface {v0}, Lcom/android/camera/storage/Storage$StorageListener;->onStoragePathChanged()V

    .line 781
    :cond_0
    return-void
.end method

.method private static updateDirectory()V
    .locals 2

    .prologue
    .line 846
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/DCIM/Camera"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    .line 847
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/android/camera/storage/Storage;->sCurrentStoragePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/DCIM/Camera/.ubifocus"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/storage/Storage;->HIDEDIRECTORY:Ljava/lang/String;

    .line 848
    sget-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sput v0, Lcom/android/camera/storage/Storage;->BUCKET_ID:I

    .line 849
    return-void
.end method

.method private static updateExif([BZLjava/lang/String;)[B
    .locals 10
    .param p0, "jpeg"    # [B
    .param p1, "isParallelProcess"    # Z
    .param p2, "usedAlgorithm"    # Ljava/lang/String;

    .prologue
    .line 312
    if-nez p1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_3

    .line 313
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 314
    .local v4, "time":J
    const/4 v2, 0x0

    .line 315
    .local v2, "outJpeg":[B
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 317
    .local v3, "s":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v1, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-direct {v1}, Lcom/android/gallery3d/exif/ExifInterface;-><init>()V

    .line 318
    .local v1, "exif":Lcom/android/gallery3d/exif/ExifInterface;
    invoke-virtual {v1, p0}, Lcom/android/gallery3d/exif/ExifInterface;->readExif([B)V

    .line 319
    if-eqz p1, :cond_1

    .line 320
    const-string/jumbo v6, "processing"

    invoke-virtual {v1, v6}, Lcom/android/gallery3d/exif/ExifInterface;->addParallelProcessComment(Ljava/lang/String;)Z

    .line 322
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 323
    const-string/jumbo v6, "CameraStorage"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "save algorithm: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    invoke-virtual {v1, p2}, Lcom/android/gallery3d/exif/ExifInterface;->addAlgorithmComment(Ljava/lang/String;)Z

    .line 326
    :cond_2
    invoke-virtual {v1, p0, v3}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    .line 327
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 328
    .local v2, "outJpeg":[B
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    .end local v1    # "exif":Lcom/android/gallery3d/exif/ExifInterface;
    :goto_0
    const-string/jumbo v6, "CameraStorage"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "update exif cost="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    return-object v2

    .line 329
    .end local v2    # "outJpeg":[B
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Ljava/io/IOException;
    const-class v6, Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 331
    move-object v2, p0

    .restart local v2    # "outJpeg":[B
    goto :goto_0

    .line 337
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "outJpeg":[B
    .end local v3    # "s":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "time":J
    :cond_3
    return-object p0
.end method

.method public static updateImage(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;)Z
    .locals 17
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "jpeg"    # [B
    .param p2, "exif"    # Lcom/android/gallery3d/exif/ExifInterface;
    .param p3, "uri"    # Landroid/net/Uri;
    .param p4, "title"    # Ljava/lang/String;
    .param p5, "location"    # Landroid/location/Location;
    .param p6, "orientation"    # I
    .param p7, "width"    # I
    .param p8, "height"    # I
    .param p9, "oldTitle"    # Ljava/lang/String;

    .prologue
    .line 472
    invoke-static/range {p4 .. p4}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 473
    .local v8, "path":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p9, :cond_5

    invoke-static/range {p9 .. p9}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    :goto_0
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ".tmp"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 474
    .local v11, "tmpPath":Ljava/lang/String;
    const/4 v6, 0x0

    .line 475
    .local v6, "out":Ljava/io/FileOutputStream;
    const-wide/16 v4, 0x0

    .line 477
    .local v4, "fileLength":J
    if-eqz p1, :cond_7

    .line 480
    :try_start_0
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 481
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .local v7, "out":Ljava/io/FileOutputStream;
    if-eqz p2, :cond_6

    .line 483
    :try_start_1
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v7}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_9
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v6, v7

    .line 499
    .end local v7    # "out":Ljava/io/FileOutputStream;
    :cond_0
    :goto_1
    if-eqz v6, :cond_1

    .line 500
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 501
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 507
    :cond_1
    :goto_2
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 508
    .local v10, "tmpFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 509
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v13}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 512
    if-eqz p2, :cond_2

    if-eqz p9, :cond_2

    .line 514
    :try_start_3
    new-instance v13, Ljava/io/File;

    invoke-static/range {p9 .. p9}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 522
    :cond_2
    :goto_3
    new-instance v12, Landroid/content/ContentValues;

    const/16 v13, 0x9

    invoke-direct {v12, v13}, Landroid/content/ContentValues;-><init>(I)V

    .line 523
    .local v12, "values":Landroid/content/ContentValues;
    const-string/jumbo v13, "title"

    move-object/from16 v0, p4

    invoke-virtual {v12, v13, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    const-string/jumbo v13, "_display_name"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ".jpg"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    if-eqz p1, :cond_c

    .line 526
    const-string/jumbo v13, "mime_type"

    const-string/jumbo v14, "image/jpeg"

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    const-string/jumbo v13, "orientation"

    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 529
    const-string/jumbo v13, "_size"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 530
    const-string/jumbo v13, "width"

    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 531
    const-string/jumbo v13, "height"

    invoke-static/range {p8 .. p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 533
    if-eqz p5, :cond_3

    .line 534
    const-string/jumbo v13, "latitude"

    invoke-virtual/range {p5 .. p5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 535
    const-string/jumbo v13, "longitude"

    invoke-virtual/range {p5 .. p5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 537
    :cond_3
    const-string/jumbo v13, "_data"

    invoke-virtual {v12, v13, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    :cond_4
    :goto_4
    :try_start_4
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v13, v0, v12, v14, v15}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_8

    .line 550
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/android/camera/storage/Storage;->saveToCloudAlbum(Landroid/content/Context;Ljava/lang/String;)V

    .line 552
    const/4 v13, 0x1

    return v13

    .end local v4    # "fileLength":J
    .end local v10    # "tmpFile":Ljava/io/File;
    .end local v11    # "tmpPath":Ljava/lang/String;
    .end local v12    # "values":Landroid/content/ContentValues;
    :cond_5
    move-object v13, v8

    .line 473
    goto/16 :goto_0

    .line 484
    .restart local v4    # "fileLength":J
    .restart local v7    # "out":Ljava/io/FileOutputStream;
    .restart local v11    # "tmpPath":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 485
    .local v2, "e":Ljava/io/IOException;
    :try_start_5
    const-string/jumbo v13, "CameraStorage"

    const-string/jumbo v14, "Failed to rewrite Exif"

    invoke-static {v13, v14}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/io/FileOutputStream;->write([B)V

    move-object v6, v7

    .end local v7    # "out":Ljava/io/FileOutputStream;
    .local v6, "out":Ljava/io/FileOutputStream;
    goto/16 :goto_1

    .line 489
    .end local v2    # "e":Ljava/io/IOException;
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v7    # "out":Ljava/io/FileOutputStream;
    :cond_6
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_9
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-object v6, v7

    .end local v7    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    goto/16 :goto_1

    .line 491
    .local v6, "out":Ljava/io/FileOutputStream;
    :cond_7
    if-eqz p9, :cond_0

    .line 492
    :try_start_6
    invoke-static/range {p9 .. p9}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v11

    goto/16 :goto_1

    .line 503
    .end local v6    # "out":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v3

    .line 504
    .local v3, "e":Ljava/lang/Exception;
    const-string/jumbo v13, "CameraStorage"

    const-string/jumbo v14, "Failed to flush/close stream"

    invoke-static {v13, v14, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 515
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v10    # "tmpFile":Ljava/io/File;
    :catch_2
    move-exception v3

    .line 516
    .restart local v3    # "e":Ljava/lang/Exception;
    const-string/jumbo v13, "CameraStorage"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Exception when delete oldfile "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p9

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3

    .line 494
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v10    # "tmpFile":Ljava/io/File;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v3

    .line 495
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v3    # "e":Ljava/lang/Exception;
    :goto_5
    :try_start_7
    const-string/jumbo v13, "CameraStorage"

    const-string/jumbo v14, "Failed to write image"

    invoke-static {v13, v14, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 496
    const/4 v13, 0x0

    .line 499
    if-eqz v6, :cond_8

    .line 500
    :try_start_8
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 501
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 507
    :cond_8
    :goto_6
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 508
    .restart local v10    # "tmpFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 509
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v14}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 512
    if-eqz p2, :cond_9

    if-eqz p9, :cond_9

    .line 514
    :try_start_9
    new-instance v14, Ljava/io/File;

    invoke-static/range {p9 .. p9}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->delete()Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 496
    :cond_9
    :goto_7
    return v13

    .line 503
    .end local v10    # "tmpFile":Ljava/io/File;
    :catch_4
    move-exception v3

    .line 504
    const-string/jumbo v14, "CameraStorage"

    const-string/jumbo v15, "Failed to flush/close stream"

    invoke-static {v14, v15, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .line 515
    .restart local v10    # "tmpFile":Ljava/io/File;
    :catch_5
    move-exception v3

    .line 516
    const-string/jumbo v14, "CameraStorage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Exception when delete oldfile "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p9

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .line 497
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v10    # "tmpFile":Ljava/io/File;
    :catchall_0
    move-exception v13

    .line 499
    :goto_8
    if-eqz v6, :cond_a

    .line 500
    :try_start_a
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 501
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    .line 507
    :cond_a
    :goto_9
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 508
    .restart local v10    # "tmpFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 509
    new-instance v14, Ljava/io/File;

    invoke-direct {v14, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v14}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 512
    if-eqz p2, :cond_b

    if-eqz p9, :cond_b

    .line 514
    :try_start_b
    new-instance v14, Ljava/io/File;

    invoke-static/range {p9 .. p9}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->delete()Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_7

    .line 497
    :cond_b
    :goto_a
    throw v13

    .line 503
    .end local v10    # "tmpFile":Ljava/io/File;
    :catch_6
    move-exception v3

    .line 504
    .restart local v3    # "e":Ljava/lang/Exception;
    const-string/jumbo v14, "CameraStorage"

    const-string/jumbo v15, "Failed to flush/close stream"

    invoke-static {v14, v15, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    .line 515
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v10    # "tmpFile":Ljava/io/File;
    :catch_7
    move-exception v3

    .line 516
    .restart local v3    # "e":Ljava/lang/Exception;
    const-string/jumbo v14, "CameraStorage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Exception when delete oldfile "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p9

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a

    .line 538
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v12    # "values":Landroid/content/ContentValues;
    :cond_c
    if-eqz p9, :cond_4

    .line 539
    const-string/jumbo v13, "_data"

    invoke-virtual {v12, v13, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 544
    :catch_8
    move-exception v9

    .line 545
    .local v9, "th":Ljava/lang/Exception;
    const-string/jumbo v13, "CameraStorage"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Failed to update image"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 546
    const/4 v13, 0x0

    return v13

    .line 497
    .end local v9    # "th":Ljava/lang/Exception;
    .end local v10    # "tmpFile":Ljava/io/File;
    .end local v12    # "values":Landroid/content/ContentValues;
    .restart local v7    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v13

    move-object v6, v7

    .end local v7    # "out":Ljava/io/FileOutputStream;
    .local v6, "out":Ljava/io/FileOutputStream;
    goto :goto_8

    .line 494
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v7    # "out":Ljava/io/FileOutputStream;
    :catch_9
    move-exception v3

    .restart local v3    # "e":Ljava/lang/Exception;
    move-object v6, v7

    .end local v7    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    goto/16 :goto_5
.end method
