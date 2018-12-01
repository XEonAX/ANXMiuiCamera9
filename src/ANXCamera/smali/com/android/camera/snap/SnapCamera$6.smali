.class Lcom/android/camera/snap/SnapCamera$6;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/snap/SnapCamera;->startCamcorder()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/snap/SnapCamera;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    .line 532
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 555
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "videoSessionCb::onConfigureFailed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v0}, Lcom/android/camera/snap/SnapCamera;->-wrap3(Lcom/android/camera/snap/SnapCamera;)V

    .line 557
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 6
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 537
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v3}, Lcom/android/camera/snap/SnapCamera;->-get1(Lcom/android/camera/snap/SnapCamera;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .line 538
    .local v2, "videoRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v3}, Lcom/android/camera/snap/SnapCamera;->-get2(Lcom/android/camera/snap/SnapCamera;)Landroid/media/MediaRecorder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/MediaRecorder;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 539
    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    .line 540
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 539
    invoke-virtual {p1, v3, v4, v5}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 542
    :try_start_1
    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v3}, Lcom/android/camera/snap/SnapCamera;->-get2(Lcom/android/camera/snap/SnapCamera;)Landroid/media/MediaRecorder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/MediaRecorder;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 547
    :goto_0
    :try_start_2
    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/android/camera/snap/SnapCamera;->-set3(Lcom/android/camera/snap/SnapCamera;Z)Z

    .line 551
    .end local v2    # "videoRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_1
    return-void

    .line 543
    .restart local v2    # "videoRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :catch_0
    move-exception v1

    .line 544
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "failed to start media recorder: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 545
    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera$6;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v3}, Lcom/android/camera/snap/SnapCamera;->-wrap3(Lcom/android/camera/snap/SnapCamera;)V
    :try_end_2
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 548
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "videoRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :catch_1
    move-exception v0

    .line 549
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->-get0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "videoSessionCb::onConfigured: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
