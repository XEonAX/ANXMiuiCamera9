.class public Lcom/android/camera/module/loader/FunctionResumeModule;
.super Lcom/android/camera/module/loader/Func1Base;
.source "FunctionResumeModule.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/module/loader/Func1Base",
        "<",
        "Lcom/android/camera/module/BaseModule;",
        "Lcom/android/camera/module/BaseModule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "currentMode"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/Func1Base;-><init>(I)V

    .line 22
    return-void
.end method


# virtual methods
.method public apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    .locals 6
    .param p1    # Lcom/android/camera/module/loader/NullHolder;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;)",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "baseModuleNullHolder":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;"
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v4

    if-nez v4, :cond_0

    .line 32
    return-object p1

    .line 34
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 35
    .local v2, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    .line 37
    .local v3, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v1

    .line 38
    .local v1, "dataBackUp":Lcom/android/camera/data/backup/DataBackUp;
    iget v4, p0, Lcom/android/camera/module/loader/FunctionResumeModule;->mTargetMode:I

    invoke-virtual {v2, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v4

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v5

    invoke-interface {v1, v3, v4, v5}, Lcom/android/camera/data/backup/DataBackUp;->revertRunning(Lcom/android/camera/data/data/runing/DataItemRunning;II)V

    .line 41
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 43
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCurrentCamera2Device()Lcom/android/camera2/Camera2Proxy;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/android/camera/module/BaseModule;->setCameraDevice(Lcom/android/camera2/Camera2Proxy;)V

    .line 45
    iget v4, p0, Lcom/android/camera/module/loader/FunctionResumeModule;->mTargetMode:I

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 46
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 48
    return-object p1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionResumeModule;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method
