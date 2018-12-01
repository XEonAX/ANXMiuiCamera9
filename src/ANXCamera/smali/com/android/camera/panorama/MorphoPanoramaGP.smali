.class public Lcom/android/camera/panorama/MorphoPanoramaGP;
.super Ljava/lang/Object;
.source "MorphoPanoramaGP.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mNative:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 13
    const-class v1, Lcom/android/camera/panorama/MorphoPanoramaGP;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/android/camera/panorama/MorphoPanoramaGP;->TAG:Ljava/lang/String;

    .line 18
    :try_start_0
    const-string/jumbo v1, "morpho_panorama"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 19
    sget-object v1, Lcom/android/camera/panorama/MorphoPanoramaGP;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "loadLibrary done"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    :goto_0
    return-void

    .line 20
    .end local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    :catch_0
    move-exception v0

    .line 21
    .restart local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    sget-object v1, Lcom/android/camera/panorama/MorphoPanoramaGP;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "can\'t loadLibrary "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-wide v4, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    .line 160
    invoke-direct {p0}, Lcom/android/camera/panorama/MorphoPanoramaGP;->createNativeObject()J

    move-result-wide v0

    .line 161
    .local v0, "ret":J
    cmp-long v2, v0, v4

    if-eqz v2, :cond_0

    .line 162
    iput-wide v0, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    .line 167
    :goto_0
    return-void

    .line 164
    :cond_0
    iput-wide v4, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    .line 165
    const-wide/32 v0, -0x7ffffffc

    goto :goto_0
.end method

.method public static calcImageSize(Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;D)I
    .locals 1
    .param p0, "param"    # Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;
    .param p1, "goal_angle"    # D

    .prologue
    .line 146
    invoke-static {p0, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeCalcImageSize(Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;D)I

    move-result v0

    return v0
.end method

.method private final native createNativeObject()J
.end method

.method private final native deleteNativeObject(J)V
.end method

.method private final native nativeAttachPreview(J[BI[I[B[ILandroid/graphics/Bitmap;III)I
.end method

.method private final native nativeAttachStillImageExt(JLjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)I
.end method

.method private static final native nativeCalcImageSize(Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;D)I
.end method

.method private final native nativeEnd(J)I
.end method

.method private final native nativeFinish(J)I
.end method

.method private final native nativeGetBoundingRect(J[I)I
.end method

.method private final native nativeGetClippingRect(J[I)I
.end method

.method private final native nativeGetCurrentDirection(J[I)I
.end method

.method private final native nativeGetGuidancePos(J[I)I
.end method

.method private final native nativeGetMoveSpeed(J[I)I
.end method

.method private final native nativeInitialize(JLcom/android/camera/panorama/MorphoPanoramaGP$InitParam;[I)I
.end method

.method private final native nativeSaveOutputJpeg(JLjava/lang/String;IIIII[I)I
.end method

.method private final native nativeSetJpegForCopyingExif(JLjava/nio/ByteBuffer;)I
.end method

.method private final native nativeSetMotionlessThreshold(JI)I
.end method

.method private final native nativeSetUseSensorAssist(JII)I
.end method

.method private final native nativeSetUseSensorThreshold(JI)I
.end method

.method private final native nativeStart(J)I
.end method


# virtual methods
.method public attachPreview([BI[I[B[ILandroid/graphics/Bitmap;III)I
    .locals 13
    .param p1, "input_image"    # [B
    .param p2, "use_image"    # I
    .param p3, "image_id"    # [I
    .param p4, "motion_data"    # [B
    .param p5, "status"    # [I
    .param p6, "preview_image"    # Landroid/graphics/Bitmap;
    .param p7, "yLen"    # I
    .param p8, "yStride"    # I
    .param p9, "uvStride"    # I

    .prologue
    .line 209
    const/4 v0, 0x0

    .line 211
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 212
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    invoke-direct/range {v1 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeAttachPreview(J[BI[I[B[ILandroid/graphics/Bitmap;III)I

    move-result v0

    .line 218
    :goto_0
    return v0

    .line 215
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public attachSetJpegForCopyingExif(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1, "input_image"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 258
    const/4 v0, 0x0

    .line 260
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 261
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeSetJpegForCopyingExif(JLjava/nio/ByteBuffer;)I

    move-result v0

    .line 266
    :goto_0
    return v0

    .line 263
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public attachStillImageExt(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)I
    .locals 7
    .param p1, "input_image"    # Ljava/nio/ByteBuffer;
    .param p2, "image_id"    # I
    .param p3, "motion_data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 234
    const/4 v0, 0x0

    .line 236
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 237
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeAttachStillImageExt(JLjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)I

    move-result v0

    .line 242
    :goto_0
    return v0

    .line 239
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public end()I
    .locals 6

    .prologue
    .line 270
    const/4 v0, 0x0

    .line 272
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 273
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeEnd(J)I

    move-result v0

    .line 278
    :goto_0
    return v0

    .line 275
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public finish()I
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 181
    const/4 v0, 0x0

    .line 183
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 184
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeFinish(J)I

    move-result v0

    .line 185
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP;->deleteNativeObject(J)V

    .line 186
    iput-wide v4, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    .line 191
    :goto_0
    return v0

    .line 188
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public getBoundingRect(Landroid/graphics/Rect;)I
    .locals 7
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v6, 0x0

    .line 282
    const/4 v1, 0x0

    .line 283
    .local v1, "ret":I
    const/4 v2, 0x4

    new-array v0, v2, [I

    .line 285
    .local v0, "rect_info":[I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    .line 286
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeGetBoundingRect(J[I)I

    move-result v1

    .line 287
    if-nez v1, :cond_0

    .line 288
    aget v2, v0, v6

    .line 289
    const/4 v3, 0x1

    aget v3, v0, v3

    .line 290
    const/4 v4, 0x2

    aget v4, v0, v4

    .line 291
    const/4 v5, 0x3

    aget v5, v0, v5

    .line 288
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 297
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 298
    invoke-virtual {p1, v6, v6, v6, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 301
    :cond_1
    return v1

    .line 294
    :cond_2
    const v1, -0x7ffffffe

    goto :goto_0
.end method

.method public getClippingRect(Landroid/graphics/Rect;)I
    .locals 7
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v6, 0x0

    .line 305
    const/4 v1, 0x0

    .line 306
    .local v1, "ret":I
    const/4 v2, 0x4

    new-array v0, v2, [I

    .line 308
    .local v0, "rect_info":[I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    .line 309
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeGetClippingRect(J[I)I

    move-result v1

    .line 310
    if-nez v1, :cond_0

    .line 311
    aget v2, v0, v6

    .line 312
    const/4 v3, 0x1

    aget v3, v0, v3

    .line 313
    const/4 v4, 0x2

    aget v4, v0, v4

    .line 314
    const/4 v5, 0x3

    aget v5, v0, v5

    .line 311
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 320
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 321
    invoke-virtual {p1, v6, v6, v6, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 324
    :cond_1
    return v1

    .line 317
    :cond_2
    const v1, -0x7ffffffe

    goto :goto_0
.end method

.method public getCurrentDirection([I)I
    .locals 6
    .param p1, "direction"    # [I

    .prologue
    .line 389
    const/4 v0, 0x0

    .line 391
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 392
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeGetCurrentDirection(J[I)I

    move-result v0

    .line 397
    :goto_0
    return v0

    .line 394
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public getGuidancePos(Landroid/graphics/Point;Landroid/graphics/Point;)I
    .locals 6
    .param p1, "attached"    # Landroid/graphics/Point;
    .param p2, "guide"    # Landroid/graphics/Point;

    .prologue
    .line 437
    const/4 v1, 0x0

    .line 438
    .local v1, "ret":I
    const/4 v2, 0x4

    new-array v0, v2, [I

    .line 440
    .local v0, "pos":[I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 441
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeGetGuidancePos(J[I)I

    move-result v1

    .line 442
    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v3, v0, v3

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Point;->set(II)V

    .line 443
    const/4 v2, 0x2

    aget v2, v0, v2

    const/4 v3, 0x3

    aget v3, v0, v3

    invoke-virtual {p2, v2, v3}, Landroid/graphics/Point;->set(II)V

    .line 448
    :goto_0
    return v1

    .line 445
    :cond_0
    const v1, -0x7ffffffe

    goto :goto_0
.end method

.method public getMoveSpeed([I)I
    .locals 6
    .param p1, "movespeed"    # [I

    .prologue
    .line 364
    const/4 v0, 0x0

    .line 366
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 367
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeGetMoveSpeed(J[I)I

    move-result v0

    .line 373
    :goto_0
    return v0

    .line 370
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public initialize(Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;[I)I
    .locals 6
    .param p1, "param"    # Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;
    .param p2, "buffer_size"    # [I

    .prologue
    .line 170
    const/4 v0, 0x0

    .line 171
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 172
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeInitialize(JLcom/android/camera/panorama/MorphoPanoramaGP$InitParam;[I)I

    move-result v0

    .line 177
    :goto_0
    return v0

    .line 174
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public saveOutputJpeg(Ljava/lang/String;Landroid/graphics/Rect;I[I)I
    .locals 11
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "rect"    # Landroid/graphics/Rect;
    .param p3, "orientation"    # I
    .param p4, "progress"    # [I

    .prologue
    .line 468
    const/4 v0, 0x0

    .line 470
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 471
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    iget v5, p2, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->top:I

    iget v7, p2, Landroid/graphics/Rect;->right:I

    iget v8, p2, Landroid/graphics/Rect;->bottom:I

    move-object v1, p0

    move-object v4, p1

    move v9, p3

    move-object v10, p4

    invoke-direct/range {v1 .. v10}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeSaveOutputJpeg(JLjava/lang/String;IIIII[I)I

    move-result v0

    .line 477
    :goto_0
    return v0

    .line 474
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public setMotionlessThreshold(I)I
    .locals 6
    .param p1, "motionless_threshold"    # I

    .prologue
    .line 352
    const/4 v0, 0x0

    .line 354
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 355
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeSetMotionlessThreshold(JI)I

    move-result v0

    .line 360
    :goto_0
    return v0

    .line 357
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public setUseSensorAssist(II)I
    .locals 6
    .param p1, "use_case"    # I
    .param p2, "enable"    # I

    .prologue
    .line 401
    const/4 v0, 0x0

    .line 403
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 404
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeSetUseSensorAssist(JII)I

    move-result v0

    .line 409
    :goto_0
    return v0

    .line 406
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public setUseSensorThreshold(I)I
    .locals 6
    .param p1, "threshold"    # I

    .prologue
    .line 425
    const/4 v0, 0x0

    .line 427
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 428
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeSetUseSensorThreshold(JI)I

    move-result v0

    .line 433
    :goto_0
    return v0

    .line 430
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method

.method public start()I
    .locals 6

    .prologue
    .line 195
    const/4 v0, 0x0

    .line 197
    .local v0, "ret":I
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 198
    iget-wide v2, p0, Lcom/android/camera/panorama/MorphoPanoramaGP;->mNative:J

    invoke-direct {p0, v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP;->nativeStart(J)I

    move-result v0

    .line 203
    :goto_0
    return v0

    .line 200
    :cond_0
    const v0, -0x7ffffffe

    goto :goto_0
.end method
