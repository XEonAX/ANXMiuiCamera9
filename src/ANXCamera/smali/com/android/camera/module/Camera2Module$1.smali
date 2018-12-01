.class Lcom/android/camera/module/Camera2Module$1;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/SensorStateManager$SensorStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 3783
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public isWorking()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 3800
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public notifyDevicePostureChanged()V
    .locals 0

    .prologue
    .line 3847
    return-void
.end method

.method public onDeviceBecomeStable()V
    .locals 0

    .prologue
    .line 3796
    return-void
.end method

.method public onDeviceBeginMoving()V
    .locals 1

    .prologue
    .line 3814
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isEdgePhotoEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3815
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getEdgeShutterView()Lcom/android/camera/ui/V9EdgeShutterView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->onDeviceMoving()V

    .line 3817
    :cond_0
    return-void
.end method

.method public onDeviceKeepMoving(D)V
    .locals 3
    .param p1, "a"    # D

    .prologue
    .line 3805
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get3(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get10(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 3806
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-wrap0(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 3805
    if-eqz v0, :cond_0

    .line 3807
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEvAdjusted(Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 3805
    if-eqz v0, :cond_0

    .line 3808
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get3(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onDeviceKeepMoving(D)V

    .line 3810
    :cond_0
    return-void
.end method

.method public onDeviceOrientationChanged(FZ)V
    .locals 8
    .param p1, "orientation"    # F
    .param p2, "isLying"    # Z

    .prologue
    const/16 v7, 0x21

    .line 3825
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iput p1, v3, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    .line 3827
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v3}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_0

    .line 3828
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v3

    .line 3829
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v4, v4, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v4}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/SensorStateManager;->isDeviceLying()Z

    move-result v4

    .line 3830
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v5, v5, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget-object v6, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v6, v6, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    invoke-static {v5, v6}, Lcom/android/camera/Util;->getShootRotation(Landroid/app/Activity;F)F

    move-result v5

    .line 3828
    invoke-virtual {v3, v4, v5}, Lcom/android/camera/effect/EffectController;->setDeviceRotation(ZF)V

    .line 3832
    :cond_0
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 3833
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v3, v3, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v3, :cond_1

    .line 3835
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v4, v4, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-static {v3, v4}, Lcom/android/camera/Util;->roundOrientation(II)I

    move-result v1

    .line 3836
    .local v1, "newOrientation":I
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v3, v3, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v3}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 3837
    .local v0, "newDisplayRotation":I
    add-int v3, v1, v0

    rem-int/lit16 v2, v3, 0x168

    .line 3839
    .local v2, "newOrientationCompensation":I
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$1;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->-get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v3

    invoke-virtual {v3, v7, v1, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 3841
    .end local v0    # "newDisplayRotation":I
    .end local v1    # "newOrientation":I
    .end local v2    # "newOrientationCompensation":I
    :cond_1
    return-void
.end method
