.class public Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
.super Ljava/lang/Object;
.source "Camera2OpenManager.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "MissingPermission"
    }
.end annotation

.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;,
        Lcom/android/camera/module/loader/camera2/Camera2OpenManager$ManagerState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# instance fields
.field private mCamera2Device:Lcom/android/camera2/Camera2Proxy;

.field private mCamera2Service:Landroid/hardware/camera2/CameraManager;

.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraMainThreadHandler:Landroid/os/Handler;

.field private final mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field private mCameraResultEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/observables/ConnectableObservable",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mCurrentState:I

.field private final mEmitterLock:Ljava/lang/Object;

.field private mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Lcom/android/camera2/Camera2Proxy;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lcom/android/camera2/Camera2Proxy;)Lcom/android/camera2/Camera2Proxy;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .param p1, "-value"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .param p1, "-value"    # Lio/reactivex/ObservableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ILjava/lang/String;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .param p1, "error"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenFailed(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Message;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onMessage(Landroid/os/Message;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    .line 39
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, 0xa0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 68
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentState:I

    .line 122
    new-instance v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$1;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 72
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->initData()V

    .line 73
    return-void
.end method

.method private abandonOpenObserableIfExists()V
    .locals 4

    .prologue
    .line 173
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v1

    .line 174
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    const/4 v2, 0x3

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    .line 176
    const/16 v3, 0xe1

    .line 175
    invoke-virtual {v2, v3}, Lcom/android/camera/module/loader/camera2/Camera2Result;->setCameraError(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    invoke-interface {v0, v2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 177
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 178
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 181
    return-void

    .line 173
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private attachInObservable(Lio/reactivex/Observer;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v2

    .line 185
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 186
    :cond_0
    new-instance v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;

    invoke-direct {v1, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$3;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V

    invoke-static {v1}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v1

    .line 191
    sget-object v3, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 186
    invoke-virtual {v1, v3}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 193
    .local v0, "obs":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    invoke-virtual {v0}, Lio/reactivex/Observable;->publish()Lio/reactivex/observables/ConnectableObservable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    .line 194
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v1, p1}, Lio/reactivex/observables/ConnectableObservable;->subscribe(Lio/reactivex/Observer;)V

    .line 196
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v1}, Lio/reactivex/observables/ConnectableObservable;->connect()Lio/reactivex/disposables/Disposable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    const/4 v1, 0x0

    monitor-exit v2

    return v1

    .line 203
    .end local v0    # "obs":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v1, p1}, Lio/reactivex/observables/ConnectableObservable;->subscribe(Lio/reactivex/Observer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    const/4 v1, 0x1

    monitor-exit v2

    return v1

    .line 184
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    .locals 2

    .prologue
    .line 94
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    if-nez v0, :cond_1

    .line 95
    const-class v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    monitor-enter v1

    .line 96
    :try_start_0
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-direct {v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;-><init>()V

    sput-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 101
    :cond_1
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->sInstance:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    return-object v0

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getManagerState()I
    .locals 1
    .annotation build Lcom/android/camera/module/loader/camera2/Camera2OpenManager$ManagerState;
    .end annotation

    .prologue
    .line 347
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentState:I

    return v0
.end method

.method private initData()V
    .locals 3

    .prologue
    .line 76
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "Camera Handler Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 77
    .local v0, "ht":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 78
    new-instance v1, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;-><init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    .line 84
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraMainThreadHandler:Landroid/os/Handler;

    .line 87
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "camera"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 86
    check-cast v1, Landroid/hardware/camera2/CameraManager;

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    .line 90
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance(Landroid/hardware/camera2/CameraManager;)Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    .line 91
    return-void
.end method

.method private onCameraOpenFailed(ILjava/lang/String;)V
    .locals 3
    .param p1, "error"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 361
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onCameraOpenFailed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " msg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 363
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v1

    .line 364
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    .line 366
    const/4 v2, 0x3

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/camera/module/loader/camera2/Camera2Result;->setCameraError(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    .line 365
    invoke-interface {v0, v2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 367
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 370
    return-void

    .line 363
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private onCameraOpenSuccess()V
    .locals 3

    .prologue
    .line 351
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 352
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mEmitterLock:Ljava/lang/Object;

    monitor-enter v1

    .line 353
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    const/4 v2, 0x2

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v2

    invoke-interface {v0, v2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 355
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->onComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 358
    return-void

    .line 352
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private onMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 254
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 339
    :cond_0
    :goto_0
    return-void

    .line 257
    :pswitch_0
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-gez v2, :cond_1

    .line 260
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_0

    .line 261
    invoke-direct {p0, v6}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 262
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "close start"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->close()V

    .line 264
    iput-object v4, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    goto :goto_0

    .line 269
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 270
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Camera "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " was opened successfully"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 273
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->getCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v2

    if-nez v2, :cond_2

    .line 274
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", but corresponding CameraCapabilities is null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 275
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    const/16 v2, 0xe7

    invoke-direct {p0, v2, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenFailed(ILjava/lang/String;)V

    goto :goto_0

    .line 278
    :cond_2
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenSuccess()V

    goto/16 :goto_0

    .line 284
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_4

    .line 285
    invoke-direct {p0, v6}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 286
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "close start"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->close()V

    .line 288
    iput-object v4, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    goto/16 :goto_0

    .line 292
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getManagerState()I

    move-result v2

    if-ne v2, v5, :cond_0

    .line 297
    const/4 v2, 0x3

    :try_start_0
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 298
    const-string/jumbo v2, "OpenManager:"

    const-string/jumbo v3, "open start"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 300
    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    .line 299
    invoke-virtual {v2, v3, v4, v5}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 301
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 303
    invoke-virtual {v0}, Ljava/lang/Exception;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe6

    invoke-direct {p0, v3, v2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->onCameraOpenFailed(ILjava/lang/String;)V

    .line 304
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "openCamera: failed to open camera "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 309
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_1
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v2, :cond_5

    .line 310
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 314
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getManagerState()I

    move-result v2

    if-ne v2, v5, :cond_0

    .line 318
    invoke-direct {p0, v6}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 319
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "force close start"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->releasePreview()V

    .line 321
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->resetConfigs()V

    .line 322
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->close()V

    .line 323
    iput-object v4, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    goto/16 :goto_0

    .line 328
    :pswitch_2
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "close finish"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 330
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 334
    :pswitch_3
    sget-object v2, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "open finish"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 336
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 254
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private setManagerState(I)V
    .locals 0
    .param p1, "newState"    # I
        .annotation build Lcom/android/camera/module/loader/camera2/Camera2OpenManager$ManagerState;
        .end annotation
    .end param

    .prologue
    .line 342
    iput p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentState:I

    .line 343
    return-void
.end method


# virtual methods
.method public getCameraHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getCameraMainThreadHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraMainThreadHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getCurrentCamera2Device()Lcom/android/camera2/Camera2Proxy;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object v0
.end method

.method public getPendingCameraId()I
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public openCamera(IILio/reactivex/Observer;Z)V
    .locals 4
    .param p1, "bogusCameraId"    # I
    .param p2, "currentMode"    # I
    .param p4, "forceClose"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lio/reactivex/Observer",
            "<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 216
    .local p3, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getActualOpenCameraId(II)I

    move-result v0

    .line 218
    .local v0, "pendingOpenId":I
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-ne v2, v0, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-eq v2, p2, :cond_1

    .line 219
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 220
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 221
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 222
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->abandonOpenObserableIfExists()V

    .line 226
    :cond_1
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->attachInObservable(Lio/reactivex/Observer;)Z

    move-result v1

    .line 229
    .local v1, "wait":Z
    if-eqz p4, :cond_2

    .line 230
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 238
    :goto_0
    return-void

    .line 232
    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public release(Z)V
    .locals 2
    .param p1, "immediate"    # Z

    .prologue
    .line 242
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->abandonOpenObserableIfExists()V

    .line 243
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mPendingCameraId:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 244
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 245
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCurrentModule:Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 246
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->setManagerState(I)V

    .line 247
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->mCameraHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 248
    return-void
.end method
