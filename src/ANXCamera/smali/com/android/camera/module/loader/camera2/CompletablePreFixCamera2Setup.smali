.class public Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;
.super Ljava/lang/Object;
.source "CompletablePreFixCamera2Setup.java"

# interfaces
.implements Lio/reactivex/CompletableOnSubscribe;
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/CompletableOnSubscribe;",
        "Lio/reactivex/Observer",
        "<",
        "Lcom/android/camera/module/loader/camera2/Camera2Result;",
        ">;"
    }
.end annotation


# instance fields
.field private isFromVoiceControl:Z

.field private mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

.field private mEmitter:Lio/reactivex/CompletableEmitter;

.field private mIntent:Landroid/content/Intent;

.field private mLastMode:Lcom/android/camera/module/Module;

.field private mNeedBlur:Z

.field private mStartFromKeyguard:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Module;ZLcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V
    .locals 0
    .param p1, "lastMode"    # Lcom/android/camera/module/Module;
    .param p2, "needBlur"    # Z
    .param p3, "cameraScreenNail"    # Lcom/android/camera/CameraScreenNail;
    .param p4, "intent"    # Landroid/content/Intent;
    .param p5, "isFromVoiceControl"    # Z
    .param p6, "startFromKeyguard"    # Z

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    .line 42
    iput-boolean p2, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mNeedBlur:Z

    .line 43
    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    .line 44
    iput-object p4, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mIntent:Landroid/content/Intent;

    .line 45
    iput-boolean p5, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->isFromVoiceControl:Z

    .line 46
    iput-boolean p6, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mStartFromKeyguard:Z

    .line 47
    return-void
.end method

.method private closeLastModule()V
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->unRegisterProtocol()V

    .line 114
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onPause()V

    .line 115
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onStop()V

    .line 116
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onDestroy()V

    .line 117
    return-void
.end method

.method private isLastModuleAlive()Z
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onComplete()V
    .locals 0

    .prologue
    .line 106
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    return-void
.end method

.method public onNext(Lcom/android/camera/module/loader/camera2/Camera2Result;)V
    .locals 1
    .param p1, "camera2Result"    # Lcom/android/camera/module/loader/camera2/Camera2Result;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mEmitter:Lio/reactivex/CompletableEmitter;

    invoke-interface {v0}, Lio/reactivex/CompletableEmitter;->onComplete()V

    .line 96
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 93
    check-cast p1, Lcom/android/camera/module/loader/camera2/Camera2Result;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->onNext(Lcom/android/camera/module/loader/camera2/Camera2Result;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 91
    return-void
.end method

.method public subscribe(Lio/reactivex/CompletableEmitter;)V
    .locals 9
    .param p1, "emitter"    # Lio/reactivex/CompletableEmitter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 51
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mEmitter:Lio/reactivex/CompletableEmitter;

    .line 53
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 56
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->isLastModuleAlive()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 57
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v4

    .line 58
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v5

    .line 59
    iget-object v6, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mLastMode:Lcom/android/camera/module/Module;

    invoke-interface {v6}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v6

    .line 60
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLastCameraId()I

    move-result v7

    .line 57
    invoke-interface {v4, v5, v6, v7, v8}, Lcom/android/camera/data/backup/DataBackUp;->backupRunning(Lcom/android/camera/data/data/runing/DataItemRunning;IIZ)V

    .line 62
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->closeLastModule()V

    .line 65
    :cond_0
    iget-boolean v4, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mNeedBlur:Z

    if-eqz v4, :cond_1

    .line 66
    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v4}, Lcom/android/camera/CameraScreenNail;->animateModuleCopyTexture()V

    .line 72
    :cond_1
    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mIntent:Landroid/content/Intent;

    if-eqz v4, :cond_2

    .line 74
    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mIntent:Landroid/content/Intent;

    iget-boolean v5, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->isFromVoiceControl:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 75
    iget-boolean v6, p0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;->mStartFromKeyguard:Z

    .line 74
    invoke-virtual {v0, v4, v5, v6, v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZ)Landroid/support/v4/util/Pair;

    move-result-object v1

    .line 76
    .local v1, "pending":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v4, v1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 77
    .local v2, "pendingOpenId":I
    iget-object v4, v1, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 83
    .end local v1    # "pending":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v3, "pendingOpenModule":I
    :goto_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v4

    invoke-virtual {v4, v2, v3, p0, v8}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->openCamera(IILio/reactivex/Observer;Z)V

    .line 85
    return-void

    .line 79
    .end local v2    # "pendingOpenId":I
    .end local v3    # "pendingOpenModule":I
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    .line 80
    .restart local v2    # "pendingOpenId":I
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v3

    .restart local v3    # "pendingOpenModule":I
    goto :goto_0
.end method
