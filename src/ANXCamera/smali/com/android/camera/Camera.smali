.class public Lcom/android/camera/Camera;
.super Lcom/android/camera/ActivityBase;
.source "Camera.java"

# interfaces
.implements Landroid/support/v4/app/ActivityCompat$OnRequestPermissionsResultCallback;
.implements Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/Camera$1;,
        Lcom/android/camera/Camera$2;,
        Lcom/android/camera/Camera$3;,
        Lcom/android/camera/Camera$4;,
        Lcom/android/camera/Camera$5;,
        Lcom/android/camera/Camera$LogThread;,
        Lcom/android/camera/Camera$MyOrientationEventListener;,
        Lcom/android/camera/Camera$WatchDogThread;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

.field private mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

.field private mCameraOpenResult:Lio/reactivex/functions/BiFunction;

.field private mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

.field private mCameraSetupConsumer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

.field private mDebugThread:Lcom/android/camera/Camera$LogThread;

.field private mDelayReleaseCamera:Z

.field private mDidRegister:Z

.field private mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

.field private mImageSaver:Lcom/android/camera/storage/ImageSaver;

.field private mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

.field private mLastIgnoreKey:I

.field private mLastKeyEventTime:J

.field private mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

.field private mPowerManager:Landroid/os/IPowerManager;

.field private mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSensorStateManager:Lcom/android/camera/SensorStateManager;

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mStartControl:Lcom/android/camera/module/loader/StartControl;

.field private mTick:I

.field private mWatchDog:Ljava/lang/Thread;

.field private final tickerRunnable:Ljava/lang/Runnable;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/Camera;)Lcom/android/camera/fragment/BaseFragmentDelegate;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/Camera;

    .prologue
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/Camera;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/Camera;

    .prologue
    iget v0, p0, Lcom/android/camera/Camera;->mTick:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/Camera;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/Camera;

    .prologue
    iget-object v0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/Camera;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;
    .param p1, "-value"    # Lio/reactivex/disposables/Disposable;

    .prologue
    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/Camera;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/Camera;->mTick:I

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/Camera;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/Camera;->onDisplayRotationChanged()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/Camera;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;
    .param p1, "rate"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/Camera;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;
    .param p1, "enable"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/Camera;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;
    .param p1, "error"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->showCameraError(I)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/Camera;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/Camera;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/Camera;->showFirstUseHintIfNeeded()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 105
    const-class v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 101
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;-><init>()V

    .line 108
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 109
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 124
    new-instance v0, Lcom/android/camera/Camera$1;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$1;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    .line 144
    new-instance v0, Lcom/android/camera/Camera$2;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$2;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 165
    new-instance v0, Lcom/android/camera/Camera$3;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$3;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    .line 1315
    new-instance v0, Lcom/android/camera/Camera$4;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$4;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 1397
    new-instance v0, Lcom/android/camera/Camera$5;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$5;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 101
    return-void
.end method

.method private bindGalleryService()V
    .locals 4

    .prologue
    .line 1327
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.miui.gallery.action.BIND_SERVICE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1328
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.miui.gallery"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1329
    iget-object v2, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x5

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/camera/Camera;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1333
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1330
    :catch_0
    move-exception v0

    .line 1331
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "bindGalleryService error."

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private closeCameraSetup()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1199
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 1200
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1201
    iput-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1204
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 1205
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1206
    iput-object v1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 1207
    const/4 v0, 0x1

    return v0

    .line 1209
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private createNewModule(I)Lcom/android/camera/module/Module;
    .locals 4
    .param p1, "newMode"    # I

    .prologue
    .line 755
    invoke-static {p1}, Lcom/android/camera/module/ModuleManager;->getModuleByIndex(I)Lcom/android/camera/module/Module;

    move-result-object v0

    .line 756
    .local v0, "module":Lcom/android/camera/module/Module;
    if-nez v0, :cond_0

    .line 757
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "invalid module index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 759
    :cond_0
    invoke-interface {v0, p0}, Lcom/android/camera/module/Module;->setActivity(Lcom/android/camera/Camera;)V

    .line 760
    iget v1, p0, Lcom/android/camera/Camera;->mOrientation:I

    iget v2, p0, Lcom/android/camera/Camera;->mOrientationCompensation:I

    invoke-interface {v0, v1, v2}, Lcom/android/camera/module/Module;->preTransferOrientation(II)V

    .line 761
    return-object v0
.end method

.method private hideHibernationFragment()V
    .locals 3

    .prologue
    .line 1440
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "Hibernation"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1441
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_0

    .line 1442
    check-cast v0, Landroid/support/v4/app/DialogFragment;

    .end local v0    # "fragment":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 1444
    :cond_0
    return-void
.end method

.method private isFromKeyguard()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 506
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 507
    .local v1, "intent":Landroid/content/Intent;
    if-nez v1, :cond_0

    .line 508
    return v2

    .line 510
    :cond_0
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 511
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v3, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v2

    :cond_1
    return v2
.end method

.method private onDisplayRotationChanged()V
    .locals 3

    .prologue
    .line 1055
    invoke-static {}, Lcom/android/camera/Device;->isFrontCameraAtBottom()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1056
    return-void

    .line 1059
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "RotateHint"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    .line 1060
    .local v0, "dialogFragment":Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;
    if-eqz v0, :cond_1

    .line 1061
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->animateOut(I)V

    .line 1063
    :cond_1
    return-void
.end method

.method private registerReceiver()V
    .locals 2

    .prologue
    .line 1408
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1409
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "android.media.action.VOICE_COMMAND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1411
    iget-object v1, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1412
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    .line 1413
    return-void
.end method

.method private resumeCamera()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 515
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 516
    return-void

    .line 518
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->hashCode()I

    move-result v6

    invoke-static {v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->isAlive(I)Z

    move-result v6

    if-nez v6, :cond_1

    .line 519
    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    .line 520
    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    .line 560
    :goto_0
    return-void

    .line 522
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 523
    .local v2, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    const/4 v5, 0x1

    .line 524
    .local v5, "resetType":I
    iget-boolean v6, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    if-eqz v6, :cond_4

    .line 525
    iput-boolean v9, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    .line 553
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 554
    iget-object v6, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v6}, Lcom/android/camera/module/Module;->onStop()V

    .line 555
    iget-object v6, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v6}, Lcom/android/camera/module/Module;->onDestroy()V

    .line 557
    :cond_3
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v6

    invoke-static {v6}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_0

    .line 527
    :cond_4
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v4

    .line 528
    .local v4, "lastType":I
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v3

    .line 529
    .local v3, "isFromVoiceControl":Z
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v8

    invoke-virtual {v2, v6, v7, v8, v9}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZ)Landroid/support/v4/util/Pair;

    .line 530
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v1

    .line 531
    .local v1, "currentType":I
    if-eqz v4, :cond_8

    .line 532
    iget-object v6, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    const v7, 0x7f0a009c

    invoke-virtual {v6, v7}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getActiveFragment(I)I

    move-result v6

    .line 533
    const/16 v7, 0xff3

    .line 532
    if-ne v6, v7, :cond_5

    const/4 v0, 0x1

    .line 534
    .local v0, "captureFinish":Z
    :goto_2
    if-ne v4, v1, :cond_6

    if-eqz v0, :cond_6

    .line 535
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/android/camera/Camera;->resumeCurrentMode(I)V

    .line 536
    return-void

    .line 532
    .end local v0    # "captureFinish":Z
    :cond_5
    const/4 v0, 0x0

    .restart local v0    # "captureFinish":Z
    goto :goto_2

    .line 538
    :cond_6
    if-eqz v0, :cond_7

    .line 539
    iget-object v6, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    const/4 v7, 0x6

    invoke-virtual {v6, v7}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateEvent(I)V

    .line 549
    .end local v0    # "captureFinish":Z
    :cond_7
    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 550
    const/4 v5, 0x2

    goto :goto_1

    .line 544
    :cond_8
    iget-boolean v6, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v6, :cond_7

    .line 545
    iput-boolean v9, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 546
    return-void
.end method

.method private setBrightnessRampRate(I)V
    .locals 1
    .param p1, "rate"    # I

    .prologue
    .line 1362
    iget-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    invoke-static {v0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    .line 1363
    return-void
.end method

.method private setScreenEffect(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1366
    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    if-eqz v0, :cond_0

    .line 1367
    iget-object v1, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    const/16 v2, 0xe

    invoke-virtual {v1, v2, v0}, Lmiui/hardware/display/DisplayFeatureManager;->setScreenEffect(II)V

    .line 1369
    :cond_0
    return-void

    .line 1367
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setTranslucentNavigation(Z)V
    .locals 3
    .param p1, "on"    # Z

    .prologue
    .line 497
    invoke-static {p0}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 498
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 499
    .local v0, "win":Landroid/view/Window;
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 500
    const/16 v2, 0x300

    .line 499
    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 501
    const/high16 v1, -0x80000000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 503
    .end local v0    # "win":Landroid/view/Window;
    :cond_0
    return-void
.end method

.method private setupCamera(Lcom/android/camera/module/loader/StartControl;)V
    .locals 9
    .param p1, "startControl"    # Lcom/android/camera/module/loader/StartControl;

    .prologue
    .line 379
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 382
    new-instance v2, Lcom/android/camera/module/loader/FunctionCameraPrepare;

    iget v7, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 383
    iget v8, p1, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    .line 384
    iget-object v6, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v6, Lcom/android/camera/module/BaseModule;

    .line 382
    invoke-direct {v2, v7, v8, v6}, Lcom/android/camera/module/loader/FunctionCameraPrepare;-><init>(IILcom/android/camera/module/BaseModule;)V

    .line 387
    .local v2, "functionCameraPrepare":Lcom/android/camera/module/loader/FunctionCameraPrepare;
    new-instance v3, Lcom/android/camera/module/loader/FunctionModuleSetup;

    iget v6, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v3, v6}, Lcom/android/camera/module/loader/FunctionModuleSetup;-><init>(I)V

    .line 388
    .local v3, "functionModuleSetup":Lcom/android/camera/module/loader/FunctionModuleSetup;
    new-instance v1, Lcom/android/camera/module/loader/FunctionDataSetup;

    iget v6, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v1, v6}, Lcom/android/camera/module/loader/FunctionDataSetup;-><init>(I)V

    .line 389
    .local v1, "dataSetup":Lcom/android/camera/module/loader/FunctionDataSetup;
    new-instance v5, Lcom/android/camera/module/loader/FunctionUISetup;

    iget v6, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    iget-boolean v7, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureView:Z

    invoke-direct {v5, v6, v7}, Lcom/android/camera/module/loader/FunctionUISetup;-><init>(IZ)V

    .line 392
    .local v5, "uiSetup":Lcom/android/camera/module/loader/FunctionUISetup;
    invoke-static {p0}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v6

    .line 391
    invoke-static {v6}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object v6

    .line 398
    sget-object v7, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 391
    invoke-virtual {v6, v7}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v6

    invoke-virtual {v6, v2}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v0

    .line 401
    .local v0, "cameraSingle":Lio/reactivex/Single;, "Lio/reactivex/Single<Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;>;"
    iget-object v6, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-static {v6}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v6

    .line 402
    sget-object v7, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 401
    invoke-virtual {v6, v7}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v6

    .line 403
    sget-object v7, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 401
    invoke-virtual {v6, v7}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v4

    .line 406
    .local v4, "surfaceSingle":Lio/reactivex/Single;, "Lio/reactivex/Single<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    iget-object v6, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    .line 405
    invoke-virtual {v0, v4, v6}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object v6

    invoke-virtual {v6, v3}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v6

    invoke-virtual {v6, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v6

    .line 411
    invoke-virtual {v5}, Lcom/android/camera/module/loader/FunctionUISetup;->getWorkThread()Lio/reactivex/Scheduler;

    move-result-object v7

    .line 405
    invoke-virtual {v6, v7}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v6

    invoke-virtual {v6, v5}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v6

    .line 413
    iget-object v7, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 405
    invoke-virtual {v6, v7}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v6

    iput-object v6, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 414
    return-void
.end method

.method private shouldReleaseLater()Z
    .locals 1

    .prologue
    .line 489
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->shouldReleaseLater()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private showCameraError(I)V
    .locals 6
    .param p1, "error"    # I

    .prologue
    .line 287
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->isRetriedIfCameraError()Z

    move-result v3

    .line 288
    .local v3, "retried":Z
    if-nez v3, :cond_0

    .line 289
    sget-object v4, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "onCameraException: retry0"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setRetriedIfCameraError(Z)V

    .line 291
    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, v4}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    .line 292
    return-void

    .line 296
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getPendingCameraId()I

    move-result v0

    .line 297
    .local v0, "cameraId":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to open camera (id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", error = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "message":Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackOpenCameraFail(ILjava/lang/String;)V

    .line 300
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 301
    .local v2, "msg":Landroid/os/Message;
    const/16 v4, 0xa

    iput v4, v2, Landroid/os/Message;->what:I

    .line 302
    iput p1, v2, Landroid/os/Message;->arg1:I

    .line 303
    iget-object v4, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-virtual {v4, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 304
    return-void
.end method

.method private showDebug()V
    .locals 2

    .prologue
    .line 1141
    invoke-static {}, Lcom/android/camera/Util;->isShowDebugInfo()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1142
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 1143
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1145
    :cond_0
    new-instance v0, Lcom/android/camera/Camera$LogThread;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$LogThread;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    .line 1146
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v0}, Lcom/android/camera/Camera$LogThread;->start()V

    .line 1148
    :cond_1
    return-void
.end method

.method private showFirstUseHintIfNeeded()V
    .locals 4

    .prologue
    .line 1341
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_first_use_hint_shown_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1343
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v0, :cond_0

    .line 1344
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraRootView;->disableTouchEvent()V

    .line 1346
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$8;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$8;-><init>(Lcom/android/camera/Camera;)V

    .line 1357
    const-wide/16 v2, 0x3e8

    .line 1346
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1359
    :cond_1
    return-void
.end method

.method private showHibernationFragment()V
    .locals 3

    .prologue
    .line 1432
    new-instance v0, Lcom/android/camera/fragment/dialog/HibernationFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/HibernationFragment;-><init>()V

    .line 1433
    .local v0, "dialogFragment":Landroid/support/v4/app/DialogFragment;
    const/4 v1, 0x2

    const v2, 0x7f11001c

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1434
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 1435
    const-string/jumbo v2, "Hibernation"

    .line 1434
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1437
    return-void
.end method

.method private switchEdgeFingerMode(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    const/4 v1, 0x0

    .line 1094
    invoke-static {}, Lcom/android/camera/Device;->isSupportedEdgeTouch()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1095
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->setEdgeMode(Landroid/content/Context;Z)V

    .line 1098
    if-eqz p1, :cond_2

    .line 1099
    new-instance v0, Lcom/android/camera/Camera$WatchDogThread;

    invoke-direct {v0, p0, v1}, Lcom/android/camera/Camera$WatchDogThread;-><init>(Lcom/android/camera/Camera;Lcom/android/camera/Camera$WatchDogThread;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    .line 1100
    iget-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1107
    :cond_1
    :goto_0
    return-void

    .line 1102
    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 1103
    iget-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 1104
    iput-object v1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    goto :goto_0
.end method

.method private unbindGalleryService()V
    .locals 1

    .prologue
    .line 1336
    iget-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1337
    return-void
.end method


# virtual methods
.method public changeRequestOrientation()V
    .locals 1

    .prologue
    .line 1188
    invoke-static {}, Lcom/android/camera/Device;->isFrontCameraAtBottom()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1189
    return-void

    .line 1191
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1192
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    .line 1196
    :goto_0
    return-void

    .line 1194
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 817
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0, p1}, Lcom/android/camera/ProximitySensorLock;->intercept(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 818
    const/4 v0, 0x1

    return v0

    .line 820
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 910
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1}, Lcom/android/camera/ProximitySensorLock;->active()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 911
    return v0

    .line 914
    :cond_0
    iget-object v1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v1, :cond_2

    .line 915
    :cond_1
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 918
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    :cond_3
    return v0
.end method

.method public getCapturePosture()I
    .locals 1

    .prologue
    .line 1090
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->getCapturePosture()I

    move-result v0

    return v0
.end method

.method public getCurrentModuleIndex()I
    .locals 1

    .prologue
    .line 936
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0xa0

    goto :goto_0
.end method

.method public getImageSaver()Lcom/android/camera/storage/ImageSaver;
    .locals 1

    .prologue
    .line 1067
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-object v0
.end method

.method public getImplFactory()Lcom/android/camera/module/impl/ImplFactory;
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    return-object v0
.end method

.method public getSensorStateManager()Lcom/android/camera/SensorStateManager;
    .locals 1

    .prologue
    .line 1071
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    return-object v0
.end method

.method public hideLensDirtyDetectedHint()V
    .locals 3

    .prologue
    .line 1458
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "LensDirtyDetectDialog"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 1459
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_0

    .line 1460
    check-cast v0, Landroid/support/v4/app/DialogFragment;

    .end local v0    # "fragment":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 1462
    :cond_0
    return-void
.end method

.method public isCurrentModuleAlive()Z
    .locals 1

    .prologue
    .line 493
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNewBieAlive(I)Z
    .locals 3
    .param p1, "newBieType"    # I

    .prologue
    const/4 v1, 0x0

    .line 1256
    const/4 v0, 0x0

    .line 1257
    .local v0, "tag":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 1268
    .end local v0    # "tag":Ljava/lang/String;
    :goto_0
    if-nez v0, :cond_0

    .line 1269
    return v1

    .line 1259
    .restart local v0    # "tag":Ljava/lang/String;
    :pswitch_0
    const-string/jumbo v0, "PortraitHint"

    .local v0, "tag":Ljava/lang/String;
    goto :goto_0

    .line 1262
    .local v0, "tag":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "RotateHint"

    .local v0, "tag":Ljava/lang/String;
    goto :goto_0

    .line 1265
    .local v0, "tag":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v0, "AiSceneHint"

    .local v0, "tag":Ljava/lang/String;
    goto :goto_0

    .line 1271
    .end local v0    # "tag":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 1257
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public isStable()Z
    .locals 1

    .prologue
    .line 1086
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isStable()Z

    move-result v0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .prologue
    .line 485
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isVideoRecording()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected notifyOnFirstFrameArrived(I)V
    .locals 4
    .param p1, "arrivedType"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1285
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-nez v0, :cond_0

    .line 1286
    return-void

    .line 1289
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->clearAnimation()V

    .line 1290
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/animation/AnimationComposite;->notifyAfterFirstFrameArrived(I)V

    .line 1291
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, v2}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    .line 1292
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, v2}, Lcom/android/camera/module/Module;->setFrameAvailable(Z)V

    .line 1295
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v0

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v0

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_1

    .line 1296
    return-void

    .line 1298
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isFrontCameraAtBottom()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1299
    return-void

    .line 1301
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1302
    return-void

    .line 1304
    :cond_3
    iget v0, p0, Lcom/android/camera/Camera;->mDisplayRotation:I

    if-eqz v0, :cond_4

    .line 1305
    return-void

    .line 1307
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_front_camera_first_use_hint_shown_key"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1308
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1309
    const-string/jumbo v1, "pref_front_camera_first_use_hint_shown_key"

    .line 1308
    invoke-interface {v0, v1, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1311
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->showNewBie(I)Z

    .line 1313
    :cond_5
    return-void
.end method

.method public onAwaken()V
    .locals 2

    .prologue
    .line 1426
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onAwaken"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1427
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestAwaken()V

    .line 1428
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1429
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 809
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onBackPressed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 810
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onBackPressed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 811
    :cond_0
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onBackPressed()V

    .line 813
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 188
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "onCreate start"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraAppImpl;

    iput-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    .line 191
    iget-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v0}, Lcom/android/camera/CameraAppImpl;->isApplicationFirstLaunched()Z

    move-result v0

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackAppLunchTimeStart(Z)V

    .line 192
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 193
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 195
    invoke-static {p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    .line 200
    const v0, 0x7f0f01c5

    invoke-static {p0, v0}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 201
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "isInMultiWindowMode call finish"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 203
    return-void

    .line 207
    :cond_0
    const-string/jumbo v0, "android.media.action.VOICE_COMMAND"

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 208
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 209
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "An illegal caller:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->getCaller(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 210
    const-string/jumbo v3, " use VOICE_CONTROL_INTENT!"

    .line 209
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    .line 212
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 213
    return-void

    .line 217
    :cond_1
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 218
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVoiceControl(Landroid/content/Intent;)V

    .line 221
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    .line 222
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v6

    .line 223
    .local v6, "isFromVoiceControl":Z
    new-instance v0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    .line 224
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 225
    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v5

    move-object v3, v1

    .line 223
    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;ZLcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 226
    sget-object v3, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 223
    invoke-virtual {v0, v3}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 229
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->enabled()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 230
    invoke-static {}, Lcom/android/camera/Util;->isNonUIEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isFromVolumeKey()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 231
    invoke-static {}, Lcom/android/camera/Util;->isNonUI()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 233
    const-string/jumbo v0, "counter"

    .line 234
    const-string/jumbo v1, "pocket_mode_enter"

    .line 232
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    .line 235
    const-string/jumbo v4, "\u65b9\u5f0f"

    aput-object v4, v3, v2

    .line 236
    const-string/jumbo v2, "NonUI\u97f3\u91cf\u952e"

    aput-object v2, v3, v8

    .line 232
    invoke-static {v0, v1, v3}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 237
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "Finish from NonUI mode."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 239
    return-void

    .line 242
    :cond_3
    new-instance v0, Lcom/android/camera/ProximitySensorLock;

    invoke-direct {v0, p0}, Lcom/android/camera/ProximitySensorLock;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    .line 244
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->startWatching()V

    .line 248
    :cond_4
    invoke-static {}, Lcom/android/camera/effect/EffectController;->releaseInstance()V

    .line 249
    const v0, 0x7f04002b

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setContentView(I)V

    .line 251
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 252
    const v0, 0x7f0a0086

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6CameraGLSurfaceView;

    iput-object v0, p0, Lcom/android/camera/Camera;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    .line 253
    const v0, 0x7f0a0094

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    .line 254
    const v0, 0x7f0a009e

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V9EdgeShutterView;

    iput-object v0, p0, Lcom/android/camera/Camera;->mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

    .line 255
    const v0, 0x7f0a0093

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/CameraRootView;

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    .line 259
    invoke-virtual {p0, v2, v2}, Lcom/android/camera/Camera;->createCameraScreenNail(ZZ)V

    .line 260
    new-instance v0, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;-><init>(Lcom/android/camera/module/loader/SurfaceStateListener;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    .line 261
    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    .line 264
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v0

    if-nez v0, :cond_5

    .line 265
    invoke-static {p0}, Lcom/android/camera/permission/PermissionManager;->requestCameraRuntimePermissions(Landroid/app/Activity;)Z

    .line 268
    :cond_5
    invoke-static {p0}, Lcom/android/camera/Util;->updateCountryIso(Landroid/content/Context;)V

    .line 269
    const-string/jumbo v0, "power"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    .line 270
    invoke-static {}, Lcom/android/camera/Device;->isSupportScreenLight()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 271
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->getInstance()Lmiui/hardware/display/DisplayFeatureManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    .line 273
    :cond_6
    new-instance v0, Lcom/android/camera/SensorStateManager;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/SensorStateManager;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    .line 274
    new-instance v0, Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-direct {v0, p0, p0}, Lcom/android/camera/Camera$MyOrientationEventListener;-><init>(Lcom/android/camera/Camera;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    .line 275
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_7

    .line 276
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v7

    .line 277
    :goto_0
    new-instance v0, Lcom/android/camera/storage/ImageSaver;

    iget-object v1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1, v7}, Lcom/android/camera/storage/ImageSaver;-><init>(Lcom/android/camera/ActivityBase;Landroid/os/Handler;Z)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    .line 278
    invoke-direct {p0, v8}, Lcom/android/camera/Camera;->setTranslucentNavigation(Z)V

    .line 279
    invoke-virtual {p0}, Lcom/android/camera/Camera;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    .line 281
    invoke-direct {p0}, Lcom/android/camera/Camera;->showDebug()V

    .line 282
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onCreate end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    return-void

    .line 275
    :cond_7
    const/4 v7, 0x1

    .local v7, "isCaptureIntent":Z
    goto :goto_0
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 705
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onDestroy start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onDestroy()V

    .line 708
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->removeInstance(Landroid/content/Context;)V

    .line 709
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 711
    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    .line 713
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v0, :cond_0

    .line 714
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 715
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->releaseAll(Z)V

    .line 718
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v0, :cond_1

    .line 719
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->onHostDestroy()V

    .line 721
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz v0, :cond_2

    .line 722
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->onDestroy()V

    .line 724
    :cond_2
    iput-object v2, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    .line 725
    iput-object v2, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    .line 726
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->onDestroy(Lcom/android/camera/ActivityBase;)V

    .line 727
    invoke-virtual {p0}, Lcom/android/camera/Camera;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/EffectChangedListenerController;->removeEffectChangedListenerMap(I)V

    .line 728
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    if-eqz v0, :cond_3

    .line 729
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v0, v3}, Lcom/android/camera/Camera$LogThread;->setRunFlag(Z)V

    .line 731
    :cond_3
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_4

    .line 732
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->destroy()V

    .line 735
    :cond_4
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    if-eqz v0, :cond_5

    .line 736
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->destroy()V

    .line 737
    iput-object v2, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 740
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 741
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->dismissSystemChoiceDialog()V

    .line 743
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraIntentManager;->removeAllInstance()V

    .line 744
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onDestroy end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 745
    return-void
.end method

.method public onEdgeTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 922
    invoke-static {}, Lcom/android/camera/Device;->isSupportedEdgeTouch()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 923
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onEdgeTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 925
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onHibernate()V
    .locals 2

    .prologue
    .line 1416
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onHibernate"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1417
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1418
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->setDeparted()V

    .line 1420
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->showHibernationFragment()V

    .line 1421
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestHibernate()V

    .line 1422
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->release(Z)V

    .line 1423
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v7, -0x1

    const/4 v6, 0x1

    .line 827
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_3

    .line 828
    const/16 v0, 0x42

    if-eq p1, v0, :cond_0

    .line 829
    const/16 v0, 0x1b

    if-ne p1, v0, :cond_2

    .line 835
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    const-wide/16 v4, 0x96

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 836
    iput v7, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 845
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_5

    .line 846
    sparse-switch p1, :sswitch_data_0

    .line 857
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 830
    :cond_2
    const/16 v0, 0x58

    if-eq p1, v0, :cond_0

    .line 831
    const/16 v0, 0x57

    if-eq p1, v0, :cond_0

    .line 832
    const/16 v0, 0x18

    if-eq p1, v0, :cond_0

    .line 833
    const/16 v0, 0x19

    if-eq p1, v0, :cond_0

    .line 841
    :cond_3
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_1

    iget v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    if-ne p1, v0, :cond_1

    .line 842
    iput v7, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    goto :goto_0

    .line 838
    :cond_4
    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 839
    return v6

    .line 854
    :sswitch_0
    return v6

    .line 860
    :cond_5
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 861
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 860
    :goto_1
    return v0

    :cond_6
    move v0, v6

    goto :goto_1

    .line 846
    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x1b -> :sswitch_0
        0x42 -> :sswitch_0
        0x50 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 866
    iget v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    if-ne p1, v1, :cond_0

    .line 867
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 868
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    .line 869
    return v0

    .line 872
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/Camera;->mLastKeyEventTime:J

    .line 874
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    if-nez v1, :cond_1

    .line 875
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 878
    :cond_1
    iget-object v1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v1, p1, p2}, Lcom/android/camera/module/Module;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 879
    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 878
    :cond_2
    return v0
.end method

.method public onLifeAlive()V
    .locals 6

    .prologue
    .line 356
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 357
    const-string/jumbo v2, "onLifeAlive module 0x%x, need anim %b, need blur %b need reconfig %b reset type %d"

    .line 356
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    .line 358
    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedViewAnimation:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    .line 359
    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    .line 356
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    .line 361
    return-void
.end method

.method public onLifeDestroy(Ljava/lang/String;)V
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 370
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onLifeDestroy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    return-void
.end method

.method public onLifeStart(Ljava/lang/String;)V
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 351
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onLifeStart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    return-void
.end method

.method public onLifeStop(Ljava/lang/String;)V
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 365
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onLifeStop "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    return-void
.end method

.method public onModeSelected(Lcom/android/camera/module/loader/StartControl;)V
    .locals 12
    .param p1, "startControl"    # Lcom/android/camera/module/loader/StartControl;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v4, 0x0

    .line 941
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/android/camera/CameraPerformanceTracker;->onEvent(I)V

    .line 942
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v7

    .line 943
    .local v7, "currentModuleId":I
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v3, "onModeSelected from 0x%x to 0x%x"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 944
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v10

    iget v9, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v11

    .line 943
    invoke-static {v2, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 945
    const/16 v0, 0xa0

    if-eq v7, v0, :cond_0

    invoke-static {v7}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v0

    .line 946
    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 945
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 947
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    .line 948
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    .line 947
    invoke-static {v7, v0, v2}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchModeStart(IIZ)V

    .line 950
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 952
    iput-object p1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    .line 955
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v0}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    .line 956
    iget-boolean v0, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    if-nez v0, :cond_1

    .line 957
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0, v4, p1, v4}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    .line 958
    return-void

    .line 964
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_2

    .line 965
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/android/camera/animation/AnimationComposite;->setClickEnable(Z)V

    .line 968
    :cond_2
    invoke-virtual {p0, v11}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 970
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_3

    .line 975
    iput-boolean v10, p1, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    .line 976
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 980
    :cond_3
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/android/camera/ui/V6GestureRecognizer;->setCurrentModule(Lcom/android/camera/module/Module;)V

    .line 981
    iget-object v1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v1, Lcom/android/camera/module/BaseModule;

    .line 982
    .local v1, "lastModule":Lcom/android/camera/module/BaseModule;
    if-eqz v1, :cond_4

    .line 983
    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->setDeparted()V

    .line 985
    :cond_4
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->createNewModule(I)Lcom/android/camera/module/Module;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    .line 987
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-nez v0, :cond_5

    .line 988
    new-instance v0, Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    .line 989
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    iget v3, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {v0, v2, v3, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->init(Landroid/support/v4/app/FragmentManager;ILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    .line 1018
    :goto_0
    return-void

    .line 1002
    :cond_5
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v6

    .line 1004
    .local v6, "isFromVoiceControl":Z
    new-instance v0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    .line 1006
    iget-boolean v2, p1, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    .line 1007
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    .line 1009
    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v5

    .line 1004
    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;ZLcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    .line 1003
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 1012
    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 1003
    invoke-virtual {v0, v2}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v8

    .line 1016
    .local v8, "setupCamera":Lio/reactivex/Completable;
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0, v8, p1, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 564
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onNewIntent start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 565
    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setIntent(Landroid/content/Intent;)V

    .line 566
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onNewIntent(Landroid/content/Intent;)V

    .line 567
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->destroy()V

    .line 568
    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 569
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    .line 570
    invoke-direct {p0}, Lcom/android/camera/Camera;->resumeCamera()V

    .line 571
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onNewIntent end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    return-void
.end method

.method public onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 641
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onPause start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 643
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 644
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    .line 645
    invoke-direct {p0, v2}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    .line 646
    iget-object v0, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v0}, Lcom/android/camera/Camera$MyOrientationEventListener;->disable()V

    .line 647
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onPause()V

    .line 648
    invoke-direct {p0}, Lcom/android/camera/Camera;->hideHibernationFragment()V

    .line 650
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 651
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 652
    invoke-direct {p0, v2}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 654
    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 656
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 657
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    if-eqz v0, :cond_0

    .line 658
    iget-object v0, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 659
    iput-boolean v2, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    .line 662
    :cond_0
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onPause()V

    .line 664
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 665
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->cancelHint()V

    .line 668
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v0, :cond_2

    .line 669
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraRootView;->enableTouchEvent()V

    .line 674
    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->onHostPause()V

    .line 675
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->recordPageEnd()V

    .line 676
    iput-boolean v2, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 677
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isGotoGallery()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/android/camera/Camera;->shouldReleaseLater()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 678
    :cond_3
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 682
    :goto_0
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onPause end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 683
    invoke-direct {p0}, Lcom/android/camera/Camera;->unbindGalleryService()V

    .line 684
    return-void

    .line 680
    :cond_4
    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->releaseAll(Z)V

    goto :goto_0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 1175
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->getCameraRuntimePermissionRequestCode()I

    move-result v1

    if-ne p1, v1, :cond_1

    .line 1177
    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLaunchPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1178
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 1180
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLocationPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1181
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v0

    .line 1182
    .local v0, "recordLocation":Z
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 1185
    .end local v0    # "recordLocation":Z
    :cond_1
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 619
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onRestart()V

    .line 620
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackAppLunchTimeStart(Z)V

    .line 621
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    .line 622
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 576
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "onResume start"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 580
    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    .line 582
    :cond_0
    sget-boolean v1, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    invoke-static {p0}, Lcom/android/camera/Util;->isFullScreenNavBarHidden(Landroid/content/Context;)Z

    move-result v2

    if-eq v1, v2, :cond_1

    .line 583
    invoke-static {p0}, Lcom/android/camera/Util;->initialize(Landroid/content/Context;)V

    .line 585
    :cond_1
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/AutoLockManager;->onResume()V

    .line 586
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v1, :cond_2

    .line 587
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1}, Lcom/android/camera/ProximitySensorLock;->onResume()V

    .line 589
    :cond_2
    const-string/jumbo v1, "CameraActivity"

    invoke-static {p0, v1}, Lcom/android/camera/statistic/CameraStat;->recordPageStart(Landroid/content/Context;Ljava/lang/String;)V

    .line 590
    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    .line 591
    iput-boolean v3, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    .line 592
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    .line 593
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    .line 594
    iget-object v1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v1}, Lcom/android/camera/Camera$MyOrientationEventListener;->enable()V

    .line 596
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onResume()V

    .line 598
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 599
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 602
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/Camera;->registerReceiver()V

    .line 603
    invoke-direct {p0}, Lcom/android/camera/Camera;->resumeCamera()V

    .line 609
    invoke-virtual {p0, v3}, Lcom/android/camera/Camera;->setBlurFlag(Z)V

    .line 610
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v1

    if-nez v1, :cond_4

    .line 611
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v0

    .line 612
    :goto_0
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v1, v0}, Lcom/android/camera/storage/ImageSaver;->onHostResume(Z)V

    .line 613
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "onResume end"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    invoke-direct {p0}, Lcom/android/camera/Camera;->bindGalleryService()V

    .line 615
    return-void

    .line 610
    :cond_4
    const/4 v0, 0x1

    .local v0, "isCaptureIntent":Z
    goto :goto_0
.end method

.method public onStop()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 688
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onStop start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onStop()V

    .line 691
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    if-eqz v0, :cond_0

    .line 692
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isGotoGallery()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 693
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 694
    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->releaseAll(Z)V

    .line 700
    :cond_0
    :goto_0
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onStop end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 701
    return-void

    .line 695
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 696
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v0, Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0, v2, v2}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    goto :goto_0
.end method

.method public onUserInteraction()V
    .locals 1

    .prologue
    .line 930
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onUserInteraction()V

    .line 931
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onUserInteraction()V

    .line 932
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 884
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onWindowFocusChanged hasFocus->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 885
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onWindowFocusChanged(Z)V

    .line 886
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-nez v0, :cond_0

    .line 887
    return-void

    .line 889
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onWindowFocusChanged(Z)V

    .line 890
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_1

    .line 891
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraBrightness;->onWindowFocusChanged(Z)V

    .line 894
    :cond_1
    if-eqz p1, :cond_3

    .line 895
    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    .line 896
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->checkActivityOrientation()V

    .line 897
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz v0, :cond_2

    .line 898
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->register()V

    .line 906
    :cond_2
    :goto_0
    return-void

    .line 902
    :cond_3
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz v0, :cond_2

    .line 903
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->unregister(I)V

    goto :goto_0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 633
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    .line 634
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->pause()V

    .line 636
    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 312
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->forceDestroy()V

    .line 313
    invoke-virtual {p0}, Lcom/android/camera/Camera;->hashCode()I

    move-result v3

    invoke-static {v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->create(I)V

    .line 314
    invoke-virtual {p0}, Lcom/android/camera/Camera;->hashCode()I

    move-result v3

    invoke-static {v3}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    .line 316
    new-instance v3, Lcom/android/camera/module/impl/ImplFactory;

    invoke-direct {v3}, Lcom/android/camera/module/impl/ImplFactory;-><init>()V

    iput-object v3, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    .line 317
    iget-object v3, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    const/4 v4, 0x1

    new-array v4, v4, [I

    const/16 v5, 0xab

    aput v5, v4, v6

    invoke-virtual {v3, p0, v4}, Lcom/android/camera/module/impl/ImplFactory;->initBase(Lcom/android/camera/ActivityBase;[I)V

    .line 319
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 320
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    .line 321
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v1

    .line 322
    .local v1, "isFromVoiceControl":Z
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZ)Landroid/support/v4/util/Pair;

    .line 323
    const/4 v2, 0x1

    .line 324
    .local v2, "resetType":I
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 325
    const/4 v2, 0x2

    .line 327
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v3

    invoke-static {v3}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 328
    return-void
.end method

.method public releaseAll(Z)V
    .locals 2
    .param p1, "isLaterRelease"    # Z

    .prologue
    .line 765
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDelayReleaseCamera:Z

    .line 774
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 775
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->setDeparted()V

    .line 778
    :cond_0
    sget-object v0, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    new-instance v1, Lcom/android/camera/Camera$6;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$6;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    .line 805
    return-void
.end method

.method protected releaseCameraScreenNail()V
    .locals 0

    .prologue
    .line 481
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->releaseCameraScreenNail()V

    .line 482
    return-void
.end method

.method public restoreWindowBrightness()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 1380
    const/high16 v0, -0x40800000    # -1.0f

    .line 1381
    .local v0, "brightness":F
    iget-object v3, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v3, :cond_0

    .line 1382
    iget-object v3, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v3}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v2

    .line 1383
    .local v2, "origin":I
    if-lez v2, :cond_0

    .line 1384
    int-to-float v3, v2

    const/high16 v4, 0x437f0000    # 255.0f

    div-float v0, v3, v4

    .line 1387
    .end local v2    # "origin":I
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 1388
    .local v1, "localLayoutParams":Landroid/view/WindowManager$LayoutParams;
    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1389
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1390
    const/4 v3, -0x1

    invoke-direct {p0, v3}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 1391
    invoke-direct {p0, v5}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 1392
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 626
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    .line 627
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->resume()V

    .line 629
    :cond_0
    return-void
.end method

.method public resumeCurrentMode(I)V
    .locals 6
    .param p1, "currentModuleIndex"    # I

    .prologue
    .line 456
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    .line 457
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    .line 459
    new-instance v1, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;

    invoke-direct {v1, p1}, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;-><init>(I)V

    .line 460
    .local v1, "functionCameraLegacySetup":Lcom/android/camera/module/loader/FunctionCameraLegacySetup;
    new-instance v2, Lcom/android/camera/module/loader/FunctionResumeModule;

    invoke-direct {v2, p1}, Lcom/android/camera/module/loader/FunctionResumeModule;-><init>(I)V

    .line 463
    .local v2, "functionResumeModule":Lcom/android/camera/module/loader/FunctionResumeModule;
    iget-object v4, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v4, Lcom/android/camera/module/BaseModule;

    invoke-static {v4}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v4

    invoke-static {v4}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object v4

    .line 464
    sget-object v5, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 463
    invoke-virtual {v4, v5}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v4

    invoke-virtual {v4, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v0

    .line 468
    .local v0, "cameraSingle":Lio/reactivex/Single;, "Lio/reactivex/Single<Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/module/BaseModule;>;>;"
    iget-object v4, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-static {v4}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v4

    .line 469
    sget-object v5, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 468
    invoke-virtual {v4, v5}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v3

    .line 472
    .local v3, "surfaceSingle":Lio/reactivex/Single;, "Lio/reactivex/Single<Lcom/android/camera/module/loader/camera2/Camera2Result;>;"
    iget-object v4, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    .line 471
    invoke-virtual {v0, v3, v4}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object v4

    invoke-virtual {v4, v2}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v4

    .line 474
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v5

    .line 471
    invoke-virtual {v4, v5}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v4

    .line 475
    iget-object v5, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    .line 471
    invoke-virtual {v4, v5}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v4

    iput-object v4, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    .line 476
    return-void
.end method

.method public setBlurFlag(Z)V
    .locals 0
    .param p1, "blurred"    # Z

    .prologue
    .line 1083
    return-void
.end method

.method public setWindowBrightness(I)V
    .locals 3
    .param p1, "brightness"    # I

    .prologue
    .line 1372
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    .line 1373
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    .line 1374
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 1375
    .local v0, "localLayoutParams":Landroid/view/WindowManager$LayoutParams;
    int-to-float v1, p1

    const/high16 v2, 0x437f0000    # 255.0f

    div-float/2addr v1, v2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1376
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1377
    return-void
.end method

.method public showLensDirtyDetectedHint()V
    .locals 4

    .prologue
    .line 1447
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "LensDirtyDetectDialog"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 1448
    .local v1, "fragment":Landroid/support/v4/app/Fragment;
    if-nez v1, :cond_0

    .line 1449
    new-instance v0, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;-><init>()V

    .line 1450
    .local v0, "dialogFragment":Landroid/support/v4/app/DialogFragment;
    const/4 v2, 0x2

    const v3, 0x7f11001d

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1451
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    .line 1452
    const-string/jumbo v3, "LensDirtyDetectDialog"

    .line 1451
    invoke-virtual {v2, v0, v3}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1455
    .end local v0    # "dialogFragment":Landroid/support/v4/app/DialogFragment;
    :cond_0
    return-void
.end method

.method public showNewBie(I)Z
    .locals 6
    .param p1, "newBieType"    # I

    .prologue
    const v2, 0x7f11001c

    const/4 v1, 0x2

    const/4 v3, 0x1

    .line 1213
    packed-switch p1, :pswitch_data_0

    .line 1252
    const/4 v1, 0x0

    return v1

    .line 1215
    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;-><init>()V

    .line 1216
    .local v0, "dialogFragment":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1217
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 1218
    const-string/jumbo v2, "PortraitHint"

    .line 1217
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1220
    return v3

    .line 1223
    .end local v0    # "dialogFragment":Landroid/support/v4/app/DialogFragment;
    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;-><init>()V

    .line 1224
    .restart local v0    # "dialogFragment":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 1225
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 1226
    const-string/jumbo v2, "RotateHint"

    .line 1225
    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 1228
    return v3

    .line 1231
    .end local v0    # "dialogFragment":Landroid/support/v4/app/DialogFragment;
    :pswitch_2
    iget-object v1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/Camera$7;

    invoke-direct {v2, p0}, Lcom/android/camera/Camera$7;-><init>(Lcom/android/camera/Camera;)V

    .line 1247
    const-wide/16 v4, 0x1f4

    .line 1231
    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1248
    return v3

    .line 1213
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 332
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    if-eqz v0, :cond_0

    .line 333
    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->release()V

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_1

    .line 337
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->unRegisterProtocol()V

    .line 338
    iput-object v1, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    .line 340
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->destroyAll(I)V

    .line 341
    return-void
.end method

.method public declared-synchronized updateSurfaceState(I)V
    .locals 1
    .param p1, "newState"    # I

    .prologue
    monitor-enter p0

    .line 1276
    :try_start_0
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->updateSurfaceState(I)V

    .line 1278
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1279
    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->onGlSurfaceCreated()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 1281
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
