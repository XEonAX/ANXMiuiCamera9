.class Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/MiCamera2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CaptureSessionStateCallback"
.end annotation


# instance fields
.field private mClientCb:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mId:I

.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera2/MiCamera2;
    .param p2, "id"    # I
    .param p3, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .prologue
    .line 2836
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 2837
    iput p2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mId:I

    .line 2838
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    .line 2839
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
    .line 2891
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onClosed: id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " sessionId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get11(Lcom/android/camera2/MiCamera2;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2892
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 2893
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .line 2894
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    if-eqz v0, :cond_0

    .line 2895
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;->onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2898
    .end local v0    # "callback":Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    :cond_0
    return-void
.end method

.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 2880
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onConfigureFailed: id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " sessionId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get11(Lcom/android/camera2/MiCamera2;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2881
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 2882
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .line 2883
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    if-eqz v0, :cond_0

    .line 2884
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2887
    .end local v0    # "callback":Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    :cond_0
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 5
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 2847
    iget v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mId:I

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get11(Lcom/android/camera2/MiCamera2;)I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 2848
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onConfigured: id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " session="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2849
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v2, p1}, Lcom/android/camera2/MiCamera2;->-set0(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 2850
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v2}, Lcom/android/camera2/MiCamera2;->-get8(Lcom/android/camera2/MiCamera2;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mId:I

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get13(Lcom/android/camera2/MiCamera2;)I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 2851
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->notifyVideoStreamEnd()V

    .line 2852
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/camera2/MiCamera2;->-set2(Lcom/android/camera2/MiCamera2;Z)Z

    .line 2857
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v2

    if-nez v2, :cond_1

    .line 2858
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFastMotionModule()Z

    move-result v2

    .line 2857
    if-nez v2, :cond_1

    .line 2859
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSlowMotionModule()Z

    move-result v2

    .line 2857
    if-nez v2, :cond_1

    .line 2860
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v2

    .line 2857
    if-eqz v2, :cond_3

    .line 2861
    :cond_1
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get10(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera2/MiCamera2;->-wrap3(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2869
    :goto_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_2

    .line 2870
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .line 2871
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    if-eqz v0, :cond_2

    .line 2872
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 2876
    .end local v0    # "callback":Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    :cond_2
    return-void

    .line 2863
    :cond_3
    :try_start_1
    iget-object v2, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v3}, Lcom/android/camera2/MiCamera2;->-get10(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera2/MiCamera2;->-wrap2(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2865
    :catch_0
    move-exception v1

    .line 2866
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public setClientCb(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 1
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .prologue
    .line 2842
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->mClientCb:Ljava/lang/ref/WeakReference;

    .line 2843
    return-void
.end method
