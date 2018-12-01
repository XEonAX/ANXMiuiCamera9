.class Lcom/android/camera/Camera$6;
.super Ljava/lang/Object;
.source "Camera.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/Camera;->releaseAll(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method constructor <init>(Lcom/android/camera/Camera;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/Camera;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/Camera$6;->this$0:Lcom/android/camera/Camera;

    .line 778
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 781
    iget-object v1, p0, Lcom/android/camera/Camera$6;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 782
    iget-object v1, p0, Lcom/android/camera/Camera$6;->this$0:Lcom/android/camera/Camera;

    iget-object v0, v1, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    .line 785
    .local v0, "module":Lcom/android/camera/module/Module;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v1

    .line 786
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    .line 787
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/Camera$6;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v4}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v3

    .line 789
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v4

    .line 785
    invoke-interface {v1, v2, v3, v4, v5}, Lcom/android/camera/data/backup/DataBackUp;->backupRunning(Lcom/android/camera/data/data/runing/DataItemRunning;IIZ)V

    .line 791
    iget-object v1, p0, Lcom/android/camera/Camera$6;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->hashCode()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->isAlive(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 792
    invoke-interface {v0}, Lcom/android/camera/module/Module;->unRegisterProtocol()V

    .line 794
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/module/Module;->onPause()V

    .line 795
    invoke-interface {v0}, Lcom/android/camera/module/Module;->onStop()V

    .line 796
    invoke-interface {v0}, Lcom/android/camera/module/Module;->onDestroy()V

    .line 799
    .end local v0    # "module":Lcom/android/camera/module/Module;
    :cond_1
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->release(Z)V

    .line 801
    iget-object v1, p0, Lcom/android/camera/Camera$6;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->releaseCameraScreenNail()V

    .line 802
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetTimeOut()V

    .line 803
    return-void
.end method
