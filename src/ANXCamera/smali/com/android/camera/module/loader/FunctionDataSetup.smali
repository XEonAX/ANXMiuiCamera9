.class public Lcom/android/camera/module/loader/FunctionDataSetup;
.super Lcom/android/camera/module/loader/Func1Base;
.source "FunctionDataSetup.java"


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
    .line 26
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/Func1Base;-><init>(I)V

    .line 27
    return-void
.end method


# virtual methods
.method public apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    .locals 7
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
    .line 37
    .local p1, "baseModuleNullHolder":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;"
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v4

    if-nez v4, :cond_0

    .line 38
    return-object p1

    .line 41
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    .line 43
    .local v0, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 44
    const/16 v4, 0xe1

    invoke-static {v0, v4}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v4

    return-object v4

    .line 48
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v4

    if-nez v4, :cond_2

    .line 49
    return-object p1

    .line 52
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 53
    .local v2, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 56
    .local v1, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    iget v4, p0, Lcom/android/camera/module/loader/FunctionDataSetup;->mTargetMode:I

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/android/camera/data/data/config/DataItemConfig;->reInitComponent(ILcom/android/camera2/CameraCapabilities;)V

    .line 59
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->reInit()V

    .line 62
    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 63
    .local v3, "pictureSize":Lcom/android/camera/CameraSize;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v4

    .line 64
    iget v5, v3, Lcom/android/camera/CameraSize;->width:I

    iget v6, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v5, v6}, Lcom/android/camera/CameraSettings;->getUIStyleByPreview(II)I

    move-result v5

    .line 63
    invoke-virtual {v4, v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->setUiStyle(I)V

    .line 66
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
    .line 34
    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionDataSetup;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method
