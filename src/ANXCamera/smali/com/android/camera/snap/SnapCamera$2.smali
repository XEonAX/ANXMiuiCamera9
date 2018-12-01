.class Lcom/android/camera/snap/SnapCamera$2;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/snap/SnapCamera;
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
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    .line 130
    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 144
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "onDisconnected"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {v0}, Lcom/android/camera/snap/SnapCamera;->release()V

    .line 147
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
    .line 151
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onError: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {v0}, Lcom/android/camera/snap/SnapCamera;->release()V

    .line 154
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1, "camera"    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 134
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    monitor-enter v1

    .line 135
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v0, p1}, Lcom/android/camera/snap/SnapCamera;->-set0(Lcom/android/camera/snap/SnapCamera;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 137
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v0}, Lcom/android/camera/snap/SnapCamera;->-get4(Lcom/android/camera/snap/SnapCamera;)Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v0}, Lcom/android/camera/snap/SnapCamera;->-get4(Lcom/android/camera/snap/SnapCamera;)Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/snap/SnapCamera$SnapStatusListener;->onCameraOpened()V

    .line 140
    :cond_0
    return-void

    .line 134
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
