.class Lcom/android/camera2/MiCamera2$8;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;)V
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
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    .line 897
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 6
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
    .line 903
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 904
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 905
    const-string/jumbo v2, "captureBurst onCaptureFailed %d"

    .line 904
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    .line 905
    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 904
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 907
    return-void
.end method

.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "sequenceId"    # I

    .prologue
    const/4 v3, 0x0

    .line 927
    invoke-super {p0, p1, p2}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V

    .line 928
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "captureBurst onCaptureSequenceAborted"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 930
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1, v3}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 931
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 932
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 933
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$PictureCallback;
    if-eqz v0, :cond_0

    .line 934
    invoke-interface {v0, v3}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureBurstFinished(Z)V

    .line 936
    :cond_0
    return-void
.end method

.method public onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "sequenceId"    # I
    .param p3, "frameNumber"    # J

    .prologue
    .line 913
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "captureBurst onCaptureSequenceCompleted"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 915
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 916
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 918
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$8;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 919
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$PictureCallback;
    if-eqz v0, :cond_0

    .line 920
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureBurstFinished(Z)V

    .line 922
    :cond_0
    return-void
.end method
