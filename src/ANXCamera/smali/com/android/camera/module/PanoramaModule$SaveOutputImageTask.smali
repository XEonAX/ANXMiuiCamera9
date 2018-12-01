.class Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;
.super Landroid/os/AsyncTask;
.source "PanoramaModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/PanoramaModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveOutputImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field mSaveImage:Z

.field saveType:I

.field start_time:J

.field final synthetic this$0:Lcom/android/camera/module/PanoramaModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/PanoramaModule;Landroid/content/Context;Z)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/module/PanoramaModule;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "SaveImage"    # Z

    .prologue
    .line 1406
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1407
    iput-boolean p3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->mSaveImage:Z

    .line 1408
    const/16 v0, 0x9

    iput v0, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->saveType:I

    .line 1409
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 10
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1413
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "doInBackground>>"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1415
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-wrap3(Lcom/android/camera/module/PanoramaModule;)V

    .line 1417
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/panorama/MorphoPanoramaGP;->end()I

    move-result v2

    .line 1418
    .local v2, "ret":I
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "end() -> 0x%x saveImage=%b"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    iget-boolean v6, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->mSaveImage:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1419
    iget-boolean v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->mSaveImage:Z

    if-eqz v3, :cond_4

    .line 1420
    if-eqz v2, :cond_0

    .line 1421
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "end() -> 0x%x"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1424
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 1427
    .local v1, "finalImageRect":Landroid/graphics/Rect;
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get9()I

    move-result v3

    and-int/lit8 v3, v3, 0x2

    if-lez v3, :cond_2

    .line 1428
    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    .line 1429
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->getBoundingRect(Landroid/graphics/Rect;)I

    move-result v2

    .line 1430
    if-eqz v2, :cond_1

    .line 1431
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "getBoundingRect() -> 0x%x"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1433
    :cond_1
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v4, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v4}, Lcom/android/camera/module/PanoramaModule;->-get8(Lcom/android/camera/module/PanoramaModule;)J

    move-result-wide v4

    invoke-static {v3, v4, v5, v9}, Lcom/android/camera/module/PanoramaModule;->-wrap0(Lcom/android/camera/module/PanoramaModule;JI)Ljava/lang/String;

    move-result-object v0

    .line 1434
    .local v0, "fileName":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3, v0, v1}, Lcom/android/camera/module/PanoramaModule;->-wrap7(Lcom/android/camera/module/PanoramaModule;Ljava/lang/String;Landroid/graphics/Rect;)V

    .line 1438
    .end local v0    # "fileName":Ljava/lang/String;
    :cond_2
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get9()I

    move-result v3

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_4

    .line 1439
    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    .line 1440
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->getClippingRect(Landroid/graphics/Rect;)I

    move-result v2

    .line 1441
    if-eqz v2, :cond_3

    .line 1442
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "getClippingRect() -> 0x%x"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1444
    :cond_3
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v4, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v4}, Lcom/android/camera/module/PanoramaModule;->-get8(Lcom/android/camera/module/PanoramaModule;)J

    move-result-wide v4

    invoke-static {v3, v4, v5, v8}, Lcom/android/camera/module/PanoramaModule;->-wrap0(Lcom/android/camera/module/PanoramaModule;JI)Ljava/lang/String;

    move-result-object v0

    .line 1445
    .restart local v0    # "fileName":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v3, v0, v1}, Lcom/android/camera/module/PanoramaModule;->-wrap7(Lcom/android/camera/module/PanoramaModule;Ljava/lang/String;Landroid/graphics/Rect;)V

    .line 1448
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v1    # "finalImageRect":Landroid/graphics/Rect;
    :cond_4
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "doInBackground<<"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1449
    const/4 v3, 0x0

    return-object v3
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1411
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 11
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v10, 0x0

    .line 1464
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "onPostExecute"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1465
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/panorama/MorphoPanoramaGP;->finish()I

    .line 1466
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1, v4}, Lcom/android/camera/module/PanoramaModule;->-set1(Lcom/android/camera/module/PanoramaModule;Lcom/android/camera/panorama/MorphoPanoramaGP;)Lcom/android/camera/panorama/MorphoPanoramaGP;

    .line 1467
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-get2(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 1468
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    const/4 v3, 0x0

    invoke-static {v1, v3}, Lcom/android/camera/module/PanoramaModule;->-set0(Lcom/android/camera/module/PanoramaModule;Z)Z

    .line 1469
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-get2(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 1471
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "PanoramaFinish done"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1472
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->isCreated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1473
    return-void

    .line 1467
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 1476
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1477
    const/16 v2, 0xb0

    .line 1476
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1479
    .local v0, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    if-eqz v0, :cond_1

    .line 1480
    invoke-interface {v0, v4}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V

    .line 1482
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-get1(Lcom/android/camera/module/PanoramaModule;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1483
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-get1(Lcom/android/camera/module/PanoramaModule;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 1485
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-boolean v1, v1, Lcom/android/camera/module/PanoramaModule;->mPaused:Z

    if-nez v1, :cond_3

    .line 1486
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/android/camera/ThumbnailUpdater;->updateThumbnailView(Z)V

    .line 1488
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_6

    .line 1489
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-boolean v1, v1, Lcom/android/camera/module/PanoramaModule;->mAeLockSupported:Z

    if-eqz v1, :cond_4

    .line 1490
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v10}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1492
    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-boolean v1, v1, Lcom/android/camera/module/PanoramaModule;->mAwbLockSupported:Z

    if-eqz v1, :cond_5

    .line 1493
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v10}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 1495
    :cond_5
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v2}, Lcom/android/camera/module/PanoramaModule;->-get7(Lcom/android/camera/module/PanoramaModule;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1496
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-wrap5(Lcom/android/camera/module/PanoramaModule;)V

    .line 1497
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1, v5}, Lcom/android/camera/module/PanoramaModule;->enableCameraControls(Z)V

    .line 1499
    :cond_6
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v3, "[MORTIME] PanoramaFinish time = %d"

    new-array v4, v5, [Ljava/lang/Object;

    .line 1500
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->start_time:J

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v10

    .line 1499
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1501
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1462
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    .prologue
    .line 1454
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->start_time:J

    .line 1457
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1458
    const/16 v2, 0xa2

    .line 1457
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1459
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateLoading(Z)V

    .line 1460
    return-void
.end method
