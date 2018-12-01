.class Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;
.super Ljava/lang/Object;
.source "ImageSaver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/storage/ImageSaver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageSaveRequest"
.end annotation


# instance fields
.field public algorithmName:Ljava/lang/String;

.field public data:[B

.field public date:J

.field public exif:Lcom/android/gallery3d/exif/ExifInterface;

.field public finalImage:Z

.field public height:I

.field public isHide:Z

.field public isMap:Z

.field public isParallelProcess:Z

.field public loc:Landroid/location/Location;

.field public mirror:Z

.field public needThumbnail:Z

.field public oldTitle:Ljava/lang/String;

.field public orientation:I

.field private size:I

.field final synthetic this$0:Lcom/android/camera/storage/ImageSaver;

.field public title:Ljava/lang/String;

.field public uri:Landroid/net/Uri;

.field public width:I


# direct methods
.method public constructor <init>(Lcom/android/camera/storage/ImageSaver;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/storage/ImageSaver;

    .prologue
    .line 480
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 482
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/storage/ImageSaver;[BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V
    .locals 2
    .param p1, "this$0"    # Lcom/android/camera/storage/ImageSaver;
    .param p2, "data"    # [B
    .param p3, "needThumbnail"    # Z
    .param p4, "title"    # Ljava/lang/String;
    .param p5, "oldTitle"    # Ljava/lang/String;
    .param p6, "date"    # J
    .param p8, "uri"    # Landroid/net/Uri;
    .param p9, "loc"    # Landroid/location/Location;
    .param p10, "width"    # I
    .param p11, "height"    # I
    .param p12, "exif"    # Lcom/android/gallery3d/exif/ExifInterface;
    .param p13, "orientation"    # I
    .param p14, "isHide"    # Z
    .param p15, "isMapFile"    # Z
    .param p16, "finalImage"    # Z
    .param p17, "mirror"    # Z
    .param p18, "isParallelProcess"    # Z
    .param p19, "algorithmName"    # Ljava/lang/String;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    .line 572
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 577
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->data:[B

    .line 578
    iput-boolean p3, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->needThumbnail:Z

    .line 579
    iput-wide p6, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->date:J

    .line 580
    iput-object p8, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    .line 581
    iput-object p4, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->title:Ljava/lang/String;

    .line 582
    iput-object p5, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 583
    if-nez p9, :cond_0

    const/4 v1, 0x0

    :goto_0
    iput-object v1, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->loc:Landroid/location/Location;

    .line 584
    iput p10, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->width:I

    .line 585
    iput p11, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->height:I

    .line 586
    iput-object p12, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->exif:Lcom/android/gallery3d/exif/ExifInterface;

    .line 587
    iput p13, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->orientation:I

    .line 588
    move/from16 v0, p14

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isHide:Z

    .line 589
    move/from16 v0, p15

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isMap:Z

    .line 590
    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->finalImage:Z

    .line 591
    move/from16 v0, p17

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->mirror:Z

    .line 592
    move/from16 v0, p18

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isParallelProcess:Z

    .line 593
    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->algorithmName:Ljava/lang/String;

    .line 596
    if-nez p2, :cond_1

    const/4 v1, 0x0

    :goto_1
    iput v1, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->size:I

    .line 597
    return-void

    .line 583
    :cond_0
    new-instance v1, Landroid/location/Location;

    invoke-direct {v1, p9}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    goto :goto_0

    .line 596
    :cond_1
    array-length v1, p2

    goto :goto_1
.end method


# virtual methods
.method public getSize()I
    .locals 1

    .prologue
    .line 533
    iget v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->size:I

    return v0
.end method

.method public isFinal()Z
    .locals 1

    .prologue
    .line 538
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->finalImage:Z

    return v0
.end method

.method public onFinish()V
    .locals 2

    .prologue
    .line 543
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->data:[B

    .line 544
    monitor-enter p0

    .line 545
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v0}, Lcom/android/camera/storage/ImageSaver;->-get1(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/storage/ImageSaver$MemoryManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->getSize()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/storage/ImageSaver$MemoryManager;->-wrap6(Lcom/android/camera/storage/ImageSaver$MemoryManager;I)V

    .line 546
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v0

    if-nez v0, :cond_0

    .line 547
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/storage/ImageSaver;->-set0(Lcom/android/camera/storage/ImageSaver;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 550
    return-void

    .line 544
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 486
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->save()V

    .line 487
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->onFinish()V

    .line 488
    return-void
.end method

.method public save()V
    .locals 21

    .prologue
    .line 492
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    if-eqz v2, :cond_1

    .line 493
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v2}, Lcom/android/camera/storage/ImageSaver;->-get0(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->data:[B

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->exif:Lcom/android/gallery3d/exif/ExifInterface;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->title:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->loc:Landroid/location/Location;

    move-object/from16 v0, p0

    iget v8, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->orientation:I

    .line 494
    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->width:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->height:I

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 493
    invoke-static/range {v2 .. v11}, Lcom/android/camera/storage/Storage;->updateImage(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;)Z

    .line 502
    :cond_0
    :goto_0
    invoke-static {}, Lcom/android/camera/storage/Storage;->getAvailableSpace()J

    .line 503
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->needThumbnail:Z

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isFinal()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/android/camera/storage/ImageSaver;->-wrap0(Lcom/android/camera/storage/ImageSaver;Z)Z

    move-result v17

    .line 504
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    if-eqz v2, :cond_5

    .line 505
    if-eqz v17, :cond_4

    .line 508
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->width:I

    int-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->height:I

    int-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    const-wide/high16 v4, 0x4080000000000000L    # 512.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    move/from16 v19, v0

    .line 509
    .local v19, "ratio":I
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v18

    .line 510
    .local v18, "inSampleSize":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isMap:Z

    if-eqz v2, :cond_3

    .line 511
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v2}, Lcom/android/camera/storage/ImageSaver;->-get0(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->mirror:Z

    invoke-static {v2, v3, v4}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v20

    .line 513
    .local v20, "t":Lcom/android/camera/Thumbnail;
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    const/4 v3, 0x1

    move-object/from16 v0, v20

    invoke-static {v2, v0, v3}, Lcom/android/camera/storage/ImageSaver;->-wrap4(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/Thumbnail;Z)V

    .line 518
    .end local v18    # "inSampleSize":I
    .end local v19    # "ratio":I
    .end local v20    # "t":Lcom/android/camera/Thumbnail;
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isFinal()Z

    move-result v4

    invoke-static {v2, v3, v4}, Lcom/android/camera/storage/ImageSaver;->-wrap1(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;Z)V

    .line 529
    :goto_4
    return-void

    .line 495
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->data:[B

    if-eqz v2, :cond_0

    .line 496
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v2}, Lcom/android/camera/storage/ImageSaver;->-get0(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->title:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->date:J

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->loc:Landroid/location/Location;

    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->orientation:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->data:[B

    .line 497
    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->width:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->height:I

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isHide:Z

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isMap:Z

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->isParallelProcess:Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->algorithmName:Ljava/lang/String;

    move-object/from16 v16, v0

    const/4 v11, 0x0

    const/4 v14, 0x0

    .line 496
    invoke-static/range {v2 .. v16}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    goto/16 :goto_0

    .line 503
    :cond_2
    const/16 v17, 0x0

    .local v17, "createThumbnail":Z
    goto/16 :goto_1

    .line 512
    .end local v17    # "createThumbnail":Z
    .restart local v18    # "inSampleSize":I
    .restart local v19    # "ratio":I
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->data:[B

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->orientation:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->mirror:Z

    move/from16 v0, v18

    invoke-static {v2, v3, v0, v4, v5}, Lcom/android/camera/Thumbnail;->createThumbnail([BIILandroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v20

    .restart local v20    # "t":Lcom/android/camera/Thumbnail;
    goto :goto_2

    .line 515
    .end local v18    # "inSampleSize":I
    .end local v19    # "ratio":I
    .end local v20    # "t":Lcom/android/camera/Thumbnail;
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->uri:Landroid/net/Uri;

    invoke-static {v2, v3}, Lcom/android/camera/storage/ImageSaver;->-wrap6(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;)V

    goto :goto_3

    .line 521
    :cond_5
    const-string/jumbo v2, "ImageSaver"

    const-string/jumbo v3, "image save failed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    if-eqz v17, :cond_6

    .line 523
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    invoke-static {v2}, Lcom/android/camera/storage/ImageSaver;->-wrap3(Lcom/android/camera/storage/ImageSaver;)V

    goto/16 :goto_4

    .line 525
    :cond_6
    const-string/jumbo v2, "ImageSaver"

    const-string/jumbo v3, "set mWaitingForUri is false"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->this$0:Lcom/android/camera/storage/ImageSaver;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/camera/storage/ImageSaver;->-wrap6(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;)V

    goto/16 :goto_4
.end method
