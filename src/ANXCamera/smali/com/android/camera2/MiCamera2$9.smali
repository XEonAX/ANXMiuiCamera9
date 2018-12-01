.class Lcom/android/camera2/MiCamera2$9;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->captureStillPicture()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera2/MiCamera2;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$9;->this$0:Lcom/android/camera2/MiCamera2;

    .line 1869
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "result"    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1888
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$9;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera2/MiCamera2;->-wrap5(Lcom/android/camera2/MiCamera2;Z)V

    .line 1889
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "failure"    # Landroid/hardware/camera2/CaptureFailure;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1894
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 1895
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Capture a still picture failed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1896
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$9;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera2/MiCamera2;->-wrap5(Lcom/android/camera2/MiCamera2;Z)V

    .line 1897
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "timestamp"    # J
    .param p5, "frameNumber"    # J

    .prologue
    const/4 v2, 0x0

    .line 1876
    invoke-super/range {p0 .. p6}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    .line 1877
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$9;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getShutterCallback()Lcom/android/camera2/Camera2Proxy$ShutterCallback;

    move-result-object v0

    .line 1878
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$ShutterCallback;
    if-eqz v0, :cond_0

    .line 1879
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$ShutterCallback;->onShutter()V

    .line 1880
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$9;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1, v2}, Lcom/android/camera2/MiCamera2;->setShutterCallback(Lcom/android/camera2/Camera2Proxy$ShutterCallback;)V

    .line 1882
    :cond_0
    return-void
.end method
