.class public Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;
.super Ljava/lang/Object;
.source "Camera2OpenOnSubScribe.java"

# interfaces
.implements Lio/reactivex/SingleOnSubscribe;
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleOnSubscribe",
        "<",
        "Lcom/android/camera/module/loader/camera2/Camera2Result;",
        ">;",
        "Lcom/android/camera/module/loader/SurfaceCreatedCallback;",
        "Lio/reactivex/Observer",
        "<",
        "Lcom/android/camera/module/loader/camera2/Camera2Result;",
        ">;"
    }
.end annotation


# instance fields
.field private mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

.field private mSingleEmitter:Lio/reactivex/SingleEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleEmitter",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private mSurfaceStateListener:Lcom/android/camera/module/loader/SurfaceStateListener;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/loader/SurfaceStateListener;)V
    .locals 0
    .param p1, "surfaceStateListener"    # Lcom/android/camera/module/loader/SurfaceStateListener;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSurfaceStateListener:Lcom/android/camera/module/loader/SurfaceStateListener;

    .line 28
    return-void
.end method

.method private openCamera()V
    .locals 5

    .prologue
    .line 49
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 50
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 51
    .local v1, "pendingOpenId":I
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    .line 52
    .local v2, "pendingOpenModule":I
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v2, p0, v4}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->openCamera(IILio/reactivex/Observer;Z)V

    .line 53
    return-void
.end method

.method private submitResult(Lcom/android/camera/module/loader/camera2/Camera2Result;)V
    .locals 2
    .param p1, "camera2Result"    # Lcom/android/camera/module/loader/camera2/Camera2Result;

    .prologue
    const/4 v1, 0x0

    .line 56
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    .line 58
    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    .line 60
    :cond_0
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 0

    .prologue
    .line 87
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 80
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

    .line 81
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->submitResult(Lcom/android/camera/module/loader/camera2/Camera2Result;)V

    .line 82
    return-void
.end method

.method public onGlSurfaceCreated()V
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    invoke-interface {v0}, Lio/reactivex/SingleEmitter;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 40
    :cond_0
    return-void

    .line 43
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

    if-eqz v0, :cond_2

    .line 44
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->submitResult(Lcom/android/camera/module/loader/camera2/Camera2Result;)V

    .line 46
    :cond_2
    return-void
.end method

.method public onNext(Lcom/android/camera/module/loader/camera2/Camera2Result;)V
    .locals 1
    .param p1, "camera2Result"    # Lcom/android/camera/module/loader/camera2/Camera2Result;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

    .line 73
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSurfaceStateListener:Lcom/android/camera/module/loader/SurfaceStateListener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/SurfaceStateListener;->hasSurface()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->submitResult(Lcom/android/camera/module/loader/camera2/Camera2Result;)V

    .line 76
    :cond_0
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 70
    check-cast p1, Lcom/android/camera/module/loader/camera2/Camera2Result;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->onNext(Lcom/android/camera/module/loader/camera2/Camera2Result;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 68
    return-void
.end method

.method public subscribe(Lio/reactivex/SingleEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "e":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mCamera2Result:Lcom/android/camera/module/loader/camera2/Camera2Result;

    .line 33
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    .line 34
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->openCamera()V

    .line 35
    return-void
.end method
