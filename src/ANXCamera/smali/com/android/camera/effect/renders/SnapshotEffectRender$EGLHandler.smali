.class Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;
.super Landroid/os/Handler;
.source "SnapshotEffectRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/renders/SnapshotEffectRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EGLHandler"
.end annotation


# instance fields
.field private mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field private mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

.field final synthetic this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;


# direct methods
.method public constructor <init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/effect/renders/SnapshotEffectRender;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 295
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 296
    return-void
.end method

.method private applyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B
    .locals 22
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .param p2, "downScale"    # I
    .param p3, "applyToThumb"    # Z
    .param p4, "targetSize"    # Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;
    .param p5, "originSize"    # Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;

    .prologue
    .line 430
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "applyEffect: applyToThumb = "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    if-eqz p3, :cond_0

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v9

    .line 432
    .local v9, "data":[B
    :goto_0
    if-nez v9, :cond_2

    .line 433
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Null "

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz p3, :cond_1

    const-string/jumbo v2, "thumb!"

    :goto_1
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    const/4 v2, 0x0

    return-object v2

    .line 431
    .end local v9    # "data":[B
    :cond_0
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .restart local v9    # "data":[B
    goto :goto_0

    .line 433
    :cond_1
    const-string/jumbo v2, "jpeg!"

    goto :goto_1

    .line 437
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 438
    .local v10, "lastTime":J
    const/4 v2, 0x1

    new-array v0, v2, [I

    move-object/from16 v17, v0

    .line 439
    .local v17, "texId":[I
    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object/from16 v0, v17

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 440
    const/4 v2, 0x0

    aget v2, v17, v2

    move/from16 v0, p2

    invoke-static {v9, v2, v0}, Lcom/android/camera/effect/ShaderNativeUtil;->initTexture([BII)[I

    move-result-object v18

    .line 441
    .local v18, "textureSize":[I
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "initTime="

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    sub-long v20, v20, v10

    move-wide/from16 v0, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    if-eqz p3, :cond_3

    const/4 v2, 0x0

    aget v6, v18, v2

    .line 444
    .local v6, "width":I
    :goto_2
    if-eqz p3, :cond_4

    const/4 v2, 0x1

    aget v7, v18, v2

    .line 445
    .local v7, "height":I
    :goto_3
    if-eqz p3, :cond_5

    const/4 v2, 0x0

    aget v14, v18, v2

    .line 446
    .local v14, "previewWidth":I
    :goto_4
    if-eqz p3, :cond_6

    const/4 v2, 0x1

    aget v13, v18, v2

    .line 448
    .local v13, "previewHeight":I
    :goto_5
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->getEffectRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v16

    .line 449
    .local v16, "render":Lcom/android/camera/effect/renders/Render;
    if-nez v16, :cond_7

    .line 450
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "init render failed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    return-object v9

    .line 443
    .end local v6    # "width":I
    .end local v7    # "height":I
    .end local v13    # "previewHeight":I
    .end local v14    # "previewWidth":I
    .end local v16    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_3
    move-object/from16 v0, p1

    iget v6, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .restart local v6    # "width":I
    goto :goto_2

    .line 444
    :cond_4
    move-object/from16 v0, p1

    iget v7, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .restart local v7    # "height":I
    goto :goto_3

    .line 445
    :cond_5
    move-object/from16 v0, p1

    iget v14, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    .restart local v14    # "previewWidth":I
    goto :goto_4

    .line 446
    :cond_6
    move-object/from16 v0, p1

    iget v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    .restart local v13    # "previewHeight":I
    goto :goto_5

    .line 453
    .restart local v16    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_7
    move-object/from16 v0, v16

    instance-of v2, v0, Lcom/android/camera/effect/renders/PipeRender;

    if-eqz v2, :cond_8

    move-object/from16 v2, v16

    .line 454
    check-cast v2, Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v2, v6, v7}, Lcom/android/camera/effect/renders/PipeRender;->setFrameBufferSize(II)V

    .line 456
    :cond_8
    move-object/from16 v0, v16

    invoke-virtual {v0, v14, v13}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    .line 457
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    .line 458
    move-object/from16 v0, p1

    iget-boolean v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mMirror:Z

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    .line 459
    if-eqz p3, :cond_e

    .line 460
    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v7}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    .line 464
    :goto_6
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mOrientation:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    .line 465
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mShootRotation:F

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    .line 466
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    .line 468
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->checkFrameBuffer(II)V

    .line 470
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    .line 472
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 473
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v2}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->setParentFrameBufferId(I)V

    .line 474
    new-instance v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    const/4 v3, 0x0

    aget v3, v17, v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 475
    invoke-virtual/range {v16 .. v16}, Lcom/android/camera/effect/renders/Render;->deleteBuffer()V

    .line 476
    const/4 v4, 0x0

    .line 477
    .local v4, "offsetX":I
    const/4 v5, 0x0

    .line 478
    .local v5, "offsetY":I
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 479
    if-le v6, v7, :cond_f

    .line 480
    sub-int v2, v6, v7

    div-int/lit8 v4, v2, 0x2

    .line 481
    move v6, v7

    .line 487
    :cond_9
    :goto_7
    if-eqz p3, :cond_10

    .line 488
    if-eqz p4, :cond_a

    .line 489
    move-object/from16 v0, p4

    iput v6, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    .line 490
    move-object/from16 v0, p4

    iput v7, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    .line 491
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "thumbSize="

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p4

    iget v8, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v8, "*"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p4

    iget v8, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    :cond_a
    :goto_8
    move-object/from16 v0, p1

    iget-boolean v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    if-eqz v2, :cond_b

    .line 500
    move-object/from16 v0, p1

    iget v8, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(IIIII)V

    .line 502
    :cond_b
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "drawTime="

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    sub-long v20, v20, v10

    move-wide/from16 v0, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    const/16 v2, 0xd05

    const/4 v3, 0x1

    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 506
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 507
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get16(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v15

    .line 508
    .local v15, "quality":I
    if-eqz p3, :cond_c

    .line 509
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get16(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v2

    const-string/jumbo v3, "normal"

    invoke-static {v3}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 511
    :cond_c
    invoke-static {v4, v5, v6, v7, v15}, Lcom/android/camera/effect/ShaderNativeUtil;->getPicture(IIIII)[B

    move-result-object v12

    .line 512
    .local v12, "outData":[B
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "readTime="

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    sub-long v20, v20, v10

    move-wide/from16 v0, v20

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    const/4 v2, 0x0

    aget v2, v17, v2

    invoke-static {v2}, Landroid/opengl/GLES20;->glIsTexture(I)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 515
    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object/from16 v0, v17

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 517
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v2}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    .line 519
    return-object v12

    .line 462
    .end local v4    # "offsetX":I
    .end local v5    # "offsetY":I
    .end local v12    # "outData":[B
    .end local v15    # "quality":I
    :cond_e
    move-object/from16 v0, p5

    iget v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    move-object/from16 v0, p5

    iget v3, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    goto/16 :goto_6

    .line 483
    .restart local v4    # "offsetX":I
    .restart local v5    # "offsetY":I
    :cond_f
    sub-int v2, v7, v6

    div-int/lit8 v5, v2, 0x2

    .line 484
    move v7, v6

    goto/16 :goto_7

    .line 494
    :cond_10
    move-object/from16 v0, p1

    iput v6, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 495
    move-object/from16 v0, p1

    iput v7, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    goto/16 :goto_8
.end method

.method private checkFrameBuffer(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v1, 0x0

    .line 698
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v0, :cond_0

    .line 699
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    if-ge v0, p1, :cond_2

    .line 701
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 702
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;III)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 704
    :cond_1
    return-void

    .line 700
    :cond_2
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v0

    if-ge v0, p2, :cond_1

    goto :goto_0
.end method

.method private drawMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z
    .locals 33
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .param p2, "save"    # Z

    .prologue
    .line 572
    const/4 v4, 0x1

    .line 573
    .local v4, "downScale":I
    new-instance v7, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    invoke-direct {v7, v2, v3, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;-><init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;II)V

    .line 574
    .local v7, "originSize":Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;
    :goto_0
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    sget v3, Lcom/android/gallery3d/ui/BaseGLCanvas;->sMaxTextureSize:I

    if-gt v2, v3, :cond_0

    .line 575
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    sget v3, Lcom/android/gallery3d/ui/BaseGLCanvas;->sMaxTextureSize:I

    if-le v2, v3, :cond_1

    .line 576
    :cond_0
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    div-int/lit8 v2, v2, 0x2

    move-object/from16 v0, p1

    iput v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 577
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    div-int/lit8 v2, v2, 0x2

    move-object/from16 v0, p1

    iput v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .line 578
    mul-int/lit8 v4, v4, 0x2

    goto :goto_0

    .line 581
    :cond_1
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "downScale: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget v5, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->applyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B

    move-result-object v28

    .line 584
    .local v28, "data":[B
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "mainLen="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-nez v28, :cond_4

    const-string/jumbo v2, "null"

    :goto_1
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    if-eqz v28, :cond_2

    .line 586
    move-object/from16 v0, v28

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 587
    const/16 v28, 0x0

    .line 590
    .end local v28    # "data":[B
    :cond_2
    if-eqz p2, :cond_d

    .line 593
    const/16 v32, 0x0

    .line 594
    .local v32, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    monitor-enter v3

    .line 595
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get18(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/util/Map;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object/from16 v32, v0

    .line 596
    .local v32, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get18(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/util/Map;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    .line 598
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get13(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 599
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get13(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/storage/ImageSaver;

    move-result-object v9

    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 600
    move-object/from16 v0, p1

    iget-boolean v11, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mNeedThumbnail:Z

    .line 601
    if-nez v32, :cond_5

    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 602
    :goto_2
    if-nez v32, :cond_6

    const/4 v13, 0x0

    .line 603
    :goto_3
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    .line 604
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    move-object/from16 v16, v0

    .line 605
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    move-object/from16 v17, v0

    .line 606
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    move/from16 v18, v0

    .line 607
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    move/from16 v19, v0

    .line 608
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    move-object/from16 v20, v0

    .line 609
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move/from16 v21, v0

    .line 612
    if-nez v32, :cond_7

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mFinalImage:Z

    move/from16 v24, v0

    .line 615
    :goto_4
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    move-object/from16 v27, v0

    .line 610
    const/16 v22, 0x0

    .line 611
    const/16 v23, 0x0

    .line 613
    const/16 v25, 0x0

    .line 614
    const/16 v26, 0x0

    .line 599
    invoke-virtual/range {v9 .. v27}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V

    .line 654
    .end local v32    # "title":Ljava/lang/String;
    :cond_3
    :goto_5
    const/4 v2, 0x1

    return v2

    .line 584
    .restart local v28    # "data":[B
    :cond_4
    move-object/from16 v0, v28

    array-length v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_1

    .line 594
    .end local v28    # "data":[B
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .restart local v32    # "title":Ljava/lang/String;
    :cond_5
    move-object/from16 v12, v32

    .line 601
    goto :goto_2

    .line 602
    :cond_6
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    goto :goto_3

    .line 612
    :cond_7
    const/16 v24, 0x0

    goto :goto_4

    .line 617
    :cond_8
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    if-nez v2, :cond_a

    .line 618
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v8

    .line 619
    if-nez v32, :cond_9

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 620
    :goto_6
    move-object/from16 v0, p1

    iget-wide v10, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    .line 621
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    .line 622
    move-object/from16 v0, p1

    iget v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    .line 623
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 624
    move-object/from16 v0, p1

    iget v15, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 625
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    move/from16 v16, v0

    .line 627
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 626
    const/16 v17, 0x0

    .line 618
    invoke-static/range {v8 .. v18}, Lcom/android/camera/storage/Storage;->addImage(Landroid/app/Activity;Ljava/lang/String;JLandroid/location/Location;I[BIIZLjava/lang/String;)Landroid/net/Uri;

    goto :goto_5

    :cond_9
    move-object/from16 v9, v32

    .line 619
    goto :goto_6

    .line 629
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v8

    .line 630
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 631
    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    .line 632
    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    .line 633
    if-nez v32, :cond_b

    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 634
    :goto_7
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    .line 635
    move-object/from16 v0, p1

    iget v14, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    .line 636
    move-object/from16 v0, p1

    iget v15, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 637
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    move/from16 v16, v0

    .line 638
    if-nez v32, :cond_c

    const/16 v17, 0x0

    .line 629
    :goto_8
    invoke-static/range {v8 .. v17}, Lcom/android/camera/storage/Storage;->updateImage(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;)Z

    goto/16 :goto_5

    :cond_b
    move-object/from16 v12, v32

    .line 633
    goto :goto_7

    .line 638
    :cond_c
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    move-object/from16 v17, v0

    goto :goto_8

    .line 641
    .end local v32    # "title":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    if-eqz v2, :cond_3

    .line 642
    new-instance v31, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v31 .. v31}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 644
    .local v31, "s":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    move-object/from16 v0, v31

    invoke-virtual {v2, v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    .line 645
    invoke-virtual/range {v31 .. v31}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v30

    .line 646
    .local v30, "outData":[B
    if-eqz v30, :cond_e

    .line 647
    move-object/from16 v0, v30

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 649
    :cond_e
    invoke-virtual/range {v31 .. v31}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_5

    .line 650
    .end local v30    # "outData":[B
    :catch_0
    move-exception v29

    .line 651
    .local v29, "e":Ljava/io/IOException;
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {v29 .. v29}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v29

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5
.end method

.method private drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z
    .locals 24
    .param p1, "jpeg"    # Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .param p2, "save"    # Z

    .prologue
    .line 658
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    if-nez v2, :cond_0

    .line 659
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    invoke-static {v2}, Lcom/android/camera/Util;->getExif([B)Lcom/android/gallery3d/exif/ExifInterface;

    move-result-object v2

    move-object/from16 v0, p1

    iput-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    .line 660
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 661
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/android/gallery3d/exif/ExifInterface;->addAlgorithmComment(Ljava/lang/String;)Z

    .line 665
    :cond_0
    new-instance v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-direct {v6, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;-><init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;)V

    .line 666
    .local v6, "size":Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;
    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->applyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B

    move-result-object v23

    .line 667
    .local v23, "data":[B
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "drawThumbJpeg: thumbLen="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v23, :cond_3

    const-string/jumbo v2, "null"

    :goto_0
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 668
    if-eqz v23, :cond_1

    .line 669
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Lcom/android/gallery3d/exif/ExifInterface;->setCompressedThumbnail([B)Z

    .line 670
    const/16 v23, 0x0

    .line 673
    .end local v23    # "data":[B
    :cond_1
    move-object/from16 v0, p1

    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    if-eqz v2, :cond_4

    const/16 v20, 0x1

    .line 675
    .local v20, "appendExif":Z
    :goto_1
    if-eqz p2, :cond_2

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v2

    if-eqz v2, :cond_2

    .line 676
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v8

    .line 677
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    .line 678
    move-object/from16 v0, p1

    iget-wide v10, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    .line 679
    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    .line 680
    move-object/from16 v0, p1

    iget v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    .line 681
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v14

    .line 682
    iget v15, v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    .line 683
    iget v0, v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    move/from16 v16, v0

    .line 689
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    move-object/from16 v22, v0

    .line 684
    const/16 v17, 0x0

    .line 685
    const/16 v18, 0x0

    .line 686
    const/16 v19, 0x0

    .line 688
    const/16 v21, 0x0

    .line 676
    invoke-static/range {v8 .. v22}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    move-object/from16 v0, p1

    iput-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    .line 690
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    if-eqz v2, :cond_2

    .line 691
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->addSecureUri(Landroid/net/Uri;)V

    .line 694
    :cond_2
    const/4 v2, 0x1

    return v2

    .line 667
    .end local v20    # "appendExif":Z
    .restart local v23    # "data":[B
    :cond_3
    move-object/from16 v0, v23

    array-length v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_0

    .line 673
    .end local v23    # "data":[B
    :cond_4
    const/16 v20, 0x0

    .restart local v20    # "appendExif":Z
    goto :goto_1
.end method

.method private drawWaterMark(IIIII)V
    .locals 9
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "orientation"    # I

    .prologue
    .line 403
    invoke-static {}, Lcom/android/camera/Device;->isEffectWatermarkFilted()Z

    move-result v1

    if-nez v1, :cond_0

    .line 404
    return-void

    .line 407
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 408
    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v8

    .line 410
    .local v8, "waterMarkText":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/Device;->isSupportedNewStyleTimeWaterMark()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 411
    new-instance v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;

    invoke-direct {v0, v8, p3, p4, p5}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;-><init>(Ljava/lang/String;III)V

    .line 415
    .local v0, "waterMark":Lcom/android/camera/effect/renders/WaterMark;
    :goto_0
    invoke-direct {p0, v0, p1, p2, p5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    .line 417
    .end local v0    # "waterMark":Lcom/android/camera/effect/renders/WaterMark;
    .end local v8    # "waterMarkText":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get2(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 418
    new-instance v0, Lcom/android/camera/effect/renders/ImageWaterMark;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get2(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 420
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get5(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v5

    .line 421
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get3(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v6

    .line 422
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get4(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v7

    move v2, p3

    move v3, p4

    move v4, p5

    .line 418
    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/ImageWaterMark;-><init>(Landroid/graphics/Bitmap;IIIFFF)V

    .line 423
    .restart local v0    # "waterMark":Lcom/android/camera/effect/renders/WaterMark;
    invoke-direct {p0, v0, p1, p2, p5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    .line 425
    .end local v0    # "waterMark":Lcom/android/camera/effect/renders/WaterMark;
    :cond_2
    return-void

    .line 413
    .restart local v8    # "waterMarkText":Ljava/lang/String;
    :cond_3
    new-instance v0, Lcom/android/camera/effect/renders/TextWaterMark;

    invoke-direct {v0, v8, p3, p4, p5}, Lcom/android/camera/effect/renders/TextWaterMark;-><init>(Ljava/lang/String;III)V

    .restart local v0    # "waterMark":Lcom/android/camera/effect/renders/WaterMark;
    goto :goto_0
.end method

.method private drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V
    .locals 7
    .param p1, "waterMark"    # Lcom/android/camera/effect/renders/WaterMark;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "orientation"    # I

    .prologue
    const/4 v3, 0x0

    .line 388
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 389
    if-eqz p4, :cond_0

    .line 390
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v1

    add-int/2addr v1, p2

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v2

    add-int/2addr v2, p3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    .line 391
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    neg-int v1, p4

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v3, v3, v2}, Lcom/android/camera/effect/GLCanvasState;->rotate(FFFF)V

    .line 392
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    neg-int v1, p2

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    neg-int v2, p3

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    .line 394
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getBasicRender()Lcom/android/camera/effect/renders/BasicRender;

    move-result-object v6

    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTexture()Lcom/android/gallery3d/ui/BasicTexture;

    move-result-object v1

    .line 395
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getLeft()I

    move-result v2

    add-int/2addr v2, p2

    .line 396
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTop()I

    move-result v3

    add-int/2addr v3, p3

    .line 397
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getWidth()I

    move-result v4

    .line 398
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getHeight()I

    move-result v5

    .line 394
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-virtual {v6, v0}, Lcom/android/camera/effect/renders/BasicRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 399
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 400
    return-void
.end method

.method private fetchRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 4
    .param p1, "renderId"    # I

    .prologue
    .line 523
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v2}, Lcom/android/camera/effect/SnapshotCanvas;->getEffectRenderGroup()Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v1

    .line 524
    .local v1, "renderCaches":Lcom/android/camera/effect/renders/RenderGroup;
    invoke-virtual {v1, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 525
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-nez v0, :cond_0

    .line 526
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    .line 527
    invoke-virtual {v1, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 529
    :cond_0
    return-object v0
.end method

.method private getEffectRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 7
    .param p1, "renderId"    # I

    .prologue
    .line 533
    new-instance v3, Lcom/android/camera/effect/renders/PipeRender;

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v3, v6}, Lcom/android/camera/effect/renders/PipeRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 535
    .local v3, "snapshotRender":Lcom/android/camera/effect/renders/PipeRender;
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p1, v6, :cond_0

    .line 536
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 537
    .local v0, "effectRender":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 538
    invoke-virtual {v3, v0}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 542
    .end local v0    # "effectRender":Lcom/android/camera/effect/renders/Render;
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 543
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 544
    .local v1, "gradienterRender":Lcom/android/camera/effect/renders/Render;
    if-eqz v1, :cond_1

    .line 545
    invoke-virtual {v3, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 565
    .end local v1    # "gradienterRender":Lcom/android/camera/effect/renders/Render;
    :cond_1
    :goto_0
    invoke-virtual {v3}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result v6

    if-nez v6, :cond_2

    .line 566
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 568
    :cond_2
    return-object v3

    .line 547
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 548
    const/4 v4, 0x0

    .line 550
    .local v4, "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v5

    .line 551
    .local v5, "tiltValue":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    const/16 v6, 0xa0

    invoke-virtual {v5, v6}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 553
    .local v2, "mode":Ljava/lang/String;
    const v6, 0x7f0f012b

    .line 552
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 554
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 559
    .end local v4    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_4
    :goto_1
    if-eqz v4, :cond_1

    .line 560
    invoke-virtual {v3, v4}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    goto :goto_0

    .line 556
    .restart local v4    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_5
    const v6, 0x7f0f012c

    .line 555
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 557
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .local v4, "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    goto :goto_1
.end method

.method private initEGL()V
    .locals 12

    .prologue
    const/16 v11, 0x3038

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 350
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v3

    check-cast v3, Ljavax/microedition/khronos/egl/EGL10;

    invoke-static {v4, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set1(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;

    .line 351
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set4(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 352
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v3

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-ne v3, v4, :cond_0

    .line 353
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "eglGetDisplay failed"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 355
    :cond_0
    new-array v2, v8, [I

    .line 356
    .local v2, "version":[I
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 357
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "eglInitialize failed"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 359
    :cond_1
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "EGL version: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v2, v9

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2e

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v2, v10

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    const/16 v3, 0x3098

    filled-new-array {v3, v8, v11}, [I

    move-result-object v0

    .line 362
    .local v0, "attrList":[I
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-wrap0(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set2(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 363
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get7(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v6

    sget-object v7, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v4, v5, v6, v7, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set3(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 366
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get8(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get8(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v3

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne v3, v4, :cond_3

    .line 367
    :cond_2
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "failed to createContext"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 370
    :cond_3
    const/4 v3, 0x5

    new-array v1, v3, [I

    .line 371
    const/16 v3, 0x3057

    aput v3, v1, v9

    sget v3, Lcom/android/camera/Util;->sWindowWidth:I

    aput v3, v1, v10

    .line 372
    const/16 v3, 0x3056

    aput v3, v1, v8

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    const/4 v4, 0x3

    aput v3, v1, v4

    .line 373
    const/4 v3, 0x4

    aput v11, v1, v3

    .line 375
    .local v1, "attrListPbuffer":[I
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v4

    .line 376
    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get7(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v6

    .line 375
    invoke-interface {v4, v5, v6, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set5(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 377
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get10(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get10(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v3, v4, :cond_5

    .line 378
    :cond_4
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "failed to createWindowSurface"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 381
    :cond_5
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get10(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get10(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get8(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v7

    invoke-interface {v3, v4, v5, v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 382
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "failed to eglMakeCurrent"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 384
    :cond_6
    return-void
.end method

.method private release()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 707
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set7(Lcom/android/camera/effect/renders/SnapshotEffectRender;Z)Z

    .line 708
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set8(Lcom/android/camera/effect/renders/SnapshotEffectRender;Z)Z

    .line 709
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get10(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 710
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get8(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 711
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 712
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 711
    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 713
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get6(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get9(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 714
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set5(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 715
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set3(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 716
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set4(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 717
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set0(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/ActivityBase;)Lcom/android/camera/ActivityBase;

    .line 718
    iput-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 719
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 720
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 721
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get11(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 722
    iput-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    .line 723
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 300
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v2

    if-nez v2, :cond_0

    .line 301
    return-void

    .line 303
    :cond_0
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 346
    :goto_0
    return-void

    .line 305
    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->initEGL()V

    .line 306
    new-instance v2, Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v2}, Lcom/android/camera/effect/SnapshotCanvas;-><init>()V

    iput-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    .line 307
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v3

    .line 308
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get1(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v4

    .line 307
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/effect/SnapshotCanvas;->setSize(II)V

    .line 309
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get12(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    goto :goto_0

    .line 312
    :pswitch_1
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    invoke-direct {p0, v2, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    .line 313
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v2}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 314
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get17(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 315
    invoke-virtual {p0, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->hasMessages(I)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 314
    if-eqz v2, :cond_1

    .line 316
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->release()V

    .line 318
    :cond_1
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get15(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 319
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get14(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {v2, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-set6(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    goto :goto_0

    .line 318
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 323
    :pswitch_2
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .line 324
    .local v1, "jpeg":Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-lez v2, :cond_3

    const/4 v0, 0x1

    .line 325
    .local v0, "isExifNeeded":Z
    :goto_1
    if-eqz v0, :cond_2

    .line 326
    invoke-direct {p0, v1, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    .line 328
    :cond_2
    invoke-direct {p0, v1, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    .line 329
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v2}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 330
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get12(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_0

    .line 324
    .end local v0    # "isExifNeeded":Z
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "isExifNeeded":Z
    goto :goto_1

    .line 333
    .end local v0    # "isExifNeeded":Z
    .end local v1    # "jpeg":Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    :pswitch_3
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    invoke-direct {p0, v2, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    goto/16 :goto_0

    .line 336
    :pswitch_4
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    invoke-direct {p0, v2, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    .line 337
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get12(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_0

    .line 340
    :pswitch_5
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->release()V

    goto/16 :goto_0

    .line 343
    :pswitch_6
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v4, v3}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    goto/16 :goto_0

    .line 303
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public sendMessageSync(I)V
    .locals 1
    .param p1, "msg"    # I

    .prologue
    .line 727
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get12(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 728
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->sendEmptyMessage(I)Z

    .line 729
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->-get12(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 730
    return-void
.end method
