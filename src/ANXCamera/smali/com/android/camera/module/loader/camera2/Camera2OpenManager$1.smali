.class Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "Camera2OpenManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .line 122
    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 3
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 150
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CameraOpenCallback: closed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get2(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 152
    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 3
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 156
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CameraOpenCallback: onDisconnected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 3
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "error"    # I

    .prologue
    .line 161
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CameraOpenCallback: onError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p2}, Lcom/android/camera/constant/ExceptionConstant;->transFromCamera2Error(I)I

    move-result v1

    const-string/jumbo v2, "onError"

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-wrap0(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ILjava/lang/String;)V

    .line 163
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 8
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 126
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 127
    .local v2, "id":I
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v3

    .line 128
    .local v3, "caps":Lcom/android/camera2/CameraCapabilities;
    iget-object v7, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    new-instance v0, Lcom/android/camera2/MiCamera2;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCameraHandler()Landroid/os/Handler;

    move-result-object v4

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCameraMainThreadHandler()Landroid/os/Handler;

    move-result-object v5

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera2/MiCamera2;-><init>(Landroid/hardware/camera2/CameraDevice;ILcom/android/camera2/CameraCapabilities;Landroid/os/Handler;Landroid/os/Handler;)V

    invoke-static {v7, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-set0(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lcom/android/camera2/Camera2Proxy;)Lcom/android/camera2/Camera2Proxy;

    .line 129
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->setCurrentCameraCapabilities(Lcom/android/camera2/CameraCapabilities;)V

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "CameraOpenCallback: camera "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " was opened successfully"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 134
    .local v6, "message":Ljava/lang/String;
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get1(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Lcom/android/camera2/Camera2Proxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    if-nez v0, :cond_0

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", but corresponding CameraCapabilities is null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 136
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    const/16 v1, 0xe7

    invoke-static {v0, v1, v6}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-wrap0(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ILjava/lang/String;)V

    .line 146
    :goto_0
    return-void

    .line 143
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->-get2(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
