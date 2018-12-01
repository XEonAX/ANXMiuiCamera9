.class public Lcom/android/camera/CameraErrorCallbackImpl;
.super Ljava/lang/Object;
.source "CameraErrorCallbackImpl.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;


# direct methods
.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 0
    .param p1, "activity"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/android/camera/CameraErrorCallbackImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 32
    return-void
.end method


# virtual methods
.method public onCameraError(Lcom/android/camera2/Camera2Proxy;I)V
    .locals 5
    .param p1, "camera"    # Lcom/android/camera2/Camera2Proxy;
    .param p2, "error"    # I

    .prologue
    const/4 v4, 0x0

    .line 36
    const/4 v1, 0x5

    if-ne p2, v1, :cond_2

    .line 37
    const-string/jumbo v1, "CameraErrorCallback"

    const-string/jumbo v2, "onCameraError: camera service error"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackCameraError(Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Lcom/android/camera/CameraErrorCallbackImpl;->mActivity:Lcom/android/camera/ActivityBase;

    if-eqz v1, :cond_1

    .line 51
    iget-object v1, p0, Lcom/android/camera/CameraErrorCallbackImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    .line 52
    .local v0, "module":Lcom/android/camera/module/Module;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    invoke-interface {v0}, Lcom/android/camera/module/Module;->notifyError()V

    .line 55
    :cond_0
    iput-object v4, p0, Lcom/android/camera/CameraErrorCallbackImpl;->mActivity:Lcom/android/camera/ActivityBase;

    .line 57
    .end local v0    # "module":Lcom/android/camera/module/Module;
    :cond_1
    return-void

    .line 38
    :cond_2
    const/4 v1, 0x4

    if-ne p2, v1, :cond_3

    .line 39
    const-string/jumbo v1, "CameraErrorCallback"

    const-string/jumbo v2, "onCameraError: camera device error"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 40
    :cond_3
    const/4 v1, 0x3

    if-ne p2, v1, :cond_4

    .line 41
    const-string/jumbo v1, "CameraErrorCallback"

    const-string/jumbo v2, "onCameraError: camera disabled"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 42
    :cond_4
    const/4 v1, 0x2

    if-ne p2, v1, :cond_5

    .line 43
    const-string/jumbo v1, "CameraErrorCallback"

    const-string/jumbo v2, "onCameraError: max camera in use"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 44
    :cond_5
    const/4 v1, 0x1

    if-ne p2, v1, :cond_6

    .line 45
    const-string/jumbo v1, "CameraErrorCallback"

    const-string/jumbo v2, "onCameraError: camera in use"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 47
    :cond_6
    const-string/jumbo v1, "CameraErrorCallback"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onCameraError: other error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
