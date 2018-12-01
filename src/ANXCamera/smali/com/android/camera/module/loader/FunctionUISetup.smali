.class public Lcom/android/camera/module/loader/FunctionUISetup;
.super Lcom/android/camera/module/loader/Func1Base;
.source "FunctionUISetup.java"


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


# instance fields
.field private mNeedNotifyUI:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0
    .param p1, "currentMode"    # I
    .param p2, "needNotifyUI"    # Z

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/Func1Base;-><init>(I)V

    .line 32
    iput-boolean p2, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mNeedNotifyUI:Z

    .line 33
    return-void
.end method


# virtual methods
.method public apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    .locals 10
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
    .line 43
    .local p1, "baseModuleNullHolder":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;"
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v8

    if-nez v8, :cond_0

    .line 44
    return-object p1

    .line 47
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/BaseModule;

    .line 48
    .local v1, "baseModule":Lcom/android/camera/module/BaseModule;
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 49
    const/16 v8, 0xe1

    invoke-static {v1, v8}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v8

    return-object v8

    .line 53
    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v8

    if-nez v8, :cond_2

    .line 54
    return-object p1

    .line 58
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v5

    .line 59
    .local v5, "displayRect":Landroid/graphics/Rect;
    invoke-virtual {v1, v5}, Lcom/android/camera/module/BaseModule;->onPreviewLayoutChanged(Landroid/graphics/Rect;)V

    .line 60
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v8

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v9

    invoke-virtual {v1, v8, v9}, Lcom/android/camera/module/BaseModule;->onPreviewSizeChanged(II)V

    .line 64
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v8

    .line 65
    const/16 v9, 0xa0

    .line 64
    invoke-virtual {v8, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 69
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLastCameraId()I

    move-result v6

    .line 70
    .local v6, "lastCameraId":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    .line 73
    .local v2, "currentCameraId":I
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v3

    .line 76
    .local v3, "currentUiStyle":I
    const/4 v4, 0x1

    .line 78
    .local v4, "dataChangeType":I
    if-eq v6, v2, :cond_5

    .line 79
    const/4 v4, 0x2

    .line 88
    :cond_3
    :goto_0
    invoke-virtual {v1, v5, v3}, Lcom/android/camera/module/BaseModule;->setDisplayRectAndUIStyle(Landroid/graphics/Rect;I)V

    .line 90
    iget-boolean v8, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mNeedNotifyUI:Z

    if-eqz v8, :cond_4

    .line 91
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v8

    iget v9, p0, Lcom/android/camera/module/loader/FunctionUISetup;->mTargetMode:I

    invoke-virtual {v8, v4, v9}, Lcom/android/camera/animation/AnimationComposite;->notifyDataChanged(II)V

    .line 95
    :cond_4
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v8

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v9

    invoke-virtual {v8, v9}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 97
    return-object p1

    .line 82
    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/runing/DataItemRunning;->getLastUiStyle()I

    move-result v7

    .line 84
    .local v7, "lastUiStyle":I
    if-eq v7, v3, :cond_3

    .line 85
    const/4 v4, 0x3

    goto :goto_0
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
    .line 40
    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionUISetup;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method

.method public getWorkThread()Lio/reactivex/Scheduler;
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    return-object v0
.end method
