.class Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/MiCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HighSpeedCaptureSessionStateCallback"
.end annotation


# instance fields
.field private mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

.field private mId:I

.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera2/MiCamera2;
    .param p2, "id"    # I
    .param p3, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .prologue
    .line 2905
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 2906
    iput p2, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mId:I

    .line 2907
    iput-object p3, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .line 2908
    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 2943
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onHighSpeedClosed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2944
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-get2(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-get2(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CameraCaptureSession;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2945
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0, v3}, Lcom/android/camera2/MiCamera2;->-set0(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 2948
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    if-eqz v0, :cond_1

    .line 2949
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;->onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2951
    :cond_1
    return-void
.end method

.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 2931
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onHighSpeedConfigureFailed: id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " sessionId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v2}, Lcom/android/camera2/MiCamera2;->-get11(Lcom/android/camera2/MiCamera2;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2932
    iget v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mId:I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->-get11(Lcom/android/camera2/MiCamera2;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 2933
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->close()V

    .line 2936
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    if-eqz v0, :cond_1

    .line 2937
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2939
    :cond_1
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 2916
    iget v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mId:I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->-get11(Lcom/android/camera2/MiCamera2;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 2917
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onHighSpeedConfigured: id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " highSpeedSession="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2918
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0, p1}, Lcom/android/camera2/MiCamera2;->-set0(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 2920
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2;->-get10(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera2/MiCamera2;->-wrap3(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2921
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-get10(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2923
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    if-eqz v0, :cond_0

    .line 2924
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;->mClientCb:Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2927
    :cond_0
    return-void
.end method
