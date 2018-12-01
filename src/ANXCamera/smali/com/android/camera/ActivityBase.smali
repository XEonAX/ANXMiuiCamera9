.class public abstract Lcom/android/camera/ActivityBase;
.super Landroid/support/v4/app/FragmentActivity;
.source "ActivityBase.java"

# interfaces
.implements Lcom/android/camera/AppController;
.implements Lcom/android/camera/module/loader/SurfaceStateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ActivityBase$ActivityHandler;
    }
.end annotation


# instance fields
.field protected mActivityPaused:Z

.field protected mAppStartTime:J

.field protected mApplication:Lcom/android/camera/CameraAppImpl;

.field protected mCameraBrightness:Lcom/android/camera/CameraBrightness;

.field private mCameraErrorShown:Z

.field public mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

.field protected mCameraRootView:Lcom/android/camera/ui/CameraRootView;

.field protected mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

.field private mCameraSound:Lcom/android/camera/MiuiCameraSound;

.field private mCloseActivityThread:Ljava/lang/Thread;

.field protected mCurrentModule:Lcom/android/camera/module/Module;

.field private mCurrentSurfaceState:I

.field protected mDebugInfoView:Landroid/widget/TextView;

.field protected mDisplayRotation:I

.field protected mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

.field private mErrorDialog:Landroid/app/AlertDialog;

.field protected mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

.field private mGalleryBack:Z

.field private mGalleryLocked:Z

.field protected final mHandler:Landroid/os/Handler;

.field private mIsFinishInKeyguard:Z

.field private mIsSwitchingModule:Z

.field private mJumpFlag:I

.field protected mJumpedToGallery:Z

.field private mKeyguardManager:Landroid/app/KeyguardManager;

.field private mKeyguardSecureLocked:Z

.field private mLocationManager:Lcom/android/camera/LocationManager;

.field protected mOrientation:I

.field protected mOrientationCompensation:I

.field protected mScreenHint:Lcom/android/camera/ui/ScreenHint;

.field private mSecureUriList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mStartFromKeyguard:Z

.field private mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;


# direct methods
.method static synthetic -set0(Lcom/android/camera/ActivityBase;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ActivityBase;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    return p1
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 72
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/ActivityBase;->mOrientation:I

    .line 73
    iput v1, p0, Lcom/android/camera/ActivityBase;->mOrientationCompensation:I

    .line 77
    iput-boolean v1, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 78
    iput-boolean v1, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    .line 79
    iput-boolean v1, p0, Lcom/android/camera/ActivityBase;->mGalleryLocked:Z

    .line 81
    iput v1, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 106
    iput-boolean v1, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    .line 108
    new-instance v0, Lcom/android/camera/ActivityBase$ActivityHandler;

    invoke-direct {v0, p0}, Lcom/android/camera/ActivityBase$ActivityHandler;-><init>(Lcom/android/camera/ActivityBase;)V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    .line 685
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/ActivityBase;->mCurrentSurfaceState:I

    .line 61
    return-void
.end method

.method private checkGalleryLock()V
    .locals 1

    .prologue
    .line 271
    const-string/jumbo v0, "com.miui.gallery"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->isAppLocked(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryLocked:Z

    .line 272
    return-void
.end method

.method private checkKeyguardFlag()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 275
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getKeyguardFlag()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    .line 276
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 278
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 279
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setStartFromKeyguard(Z)V

    .line 280
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    .line 281
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 284
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 285
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    .line 286
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    .line 291
    :cond_2
    :goto_0
    const-string/jumbo v1, "ActivityBase"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "checkKeyguard: fromKeyguard="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v2, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " keyguardSecureLocked="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 292
    iget-boolean v2, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 291
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 292
    const-string/jumbo v2, " secureUriList is "

    .line 291
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 292
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-nez v0, :cond_4

    const-string/jumbo v0, "null"

    .line 291
    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    return-void

    .line 289
    :cond_3
    iput-object v4, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    goto :goto_0

    .line 292
    :cond_4
    const-string/jumbo v0, "not null"

    goto :goto_1
.end method

.method private clearNotification()V
    .locals 2

    .prologue
    .line 679
    const-string/jumbo v1, "notification"

    invoke-virtual {p0, v1}, Lcom/android/camera/ActivityBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 680
    .local v0, "manager":Landroid/app/NotificationManager;
    if-eqz v0, :cond_0

    .line 681
    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 683
    :cond_0
    return-void
.end method


# virtual methods
.method public addSecureUri(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 506
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 507
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    .line 508
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 510
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 512
    :cond_1
    return-void
.end method

.method public couldShowErrorDialog()Z
    .locals 1

    .prologue
    .line 168
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mCameraErrorShown:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public createCameraScreenNail(ZZ)V
    .locals 3
    .param p1, "getPictures"    # Z
    .param p2, "recreate"    # Z

    .prologue
    .line 409
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-nez v2, :cond_0

    .line 411
    new-instance v0, Lcom/android/camera/ActivityBase$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ActivityBase$2;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 451
    .local v0, "nailListener":Lcom/android/camera/CameraScreenNail$NailListener;
    new-instance v1, Lcom/android/camera/ActivityBase$3;

    invoke-direct {v1, p0}, Lcom/android/camera/ActivityBase$3;-><init>(Lcom/android/camera/ActivityBase;)V

    .line 462
    .local v1, "requestRenderListener":Lcom/android/camera/CameraScreenNail$RequestRenderListener;
    new-instance v2, Lcom/android/camera/CameraScreenNail;

    invoke-direct {v2, v0, v1}, Lcom/android/camera/CameraScreenNail;-><init>(Lcom/android/camera/CameraScreenNail$NailListener;Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    .line 464
    .end local v0    # "nailListener":Lcom/android/camera/CameraScreenNail$NailListener;
    .end local v1    # "requestRenderListener":Lcom/android/camera/CameraScreenNail$RequestRenderListener;
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->initCameraScreenNail()V

    .line 465
    return-void
.end method

.method public dismissKeyguard()V
    .locals 2

    .prologue
    .line 656
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v0, :cond_0

    .line 657
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "xiaomi.intent.action.SHOW_SECURE_KEYGUARD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/android/camera/ActivityBase;->sendBroadcast(Landroid/content/Intent;)V

    .line 659
    :cond_0
    return-void
.end method

.method public getCameraIntentManager()Lcom/android/camera/CameraIntentManager;
    .locals 1

    .prologue
    .line 718
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    if-nez v0, :cond_0

    .line 719
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    .line 721
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    return-object v0
.end method

.method public getCameraScreenNail()Lcom/android/camera/CameraScreenNail;
    .locals 1

    .prologue
    .line 527
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    return-object v0
.end method

.method public getCurrentModule()Lcom/android/camera/module/Module;
    .locals 1

    .prologue
    .line 622
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    return-object v0
.end method

.method public getEdgeShutterView()Lcom/android/camera/ui/V9EdgeShutterView;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

    return-object v0
.end method

.method public getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;
    .locals 1

    .prologue
    .line 367
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    return-object v0
.end method

.method protected getKeyguardFlag()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 265
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-eqz v1, :cond_0

    .line 266
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "StartActivityWhenLocked"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 267
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v0

    .line 265
    :cond_0
    return v0
.end method

.method public getScreenHint()Lcom/android/camera/ui/ScreenHint;
    .locals 1

    .prologue
    .line 371
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mScreenHint:Lcom/android/camera/ui/ScreenHint;

    return-object v0
.end method

.method public getSecureUriList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 627
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;
    .locals 1

    .prologue
    .line 502
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    return-object v0
.end method

.method public gotoGallery()V
    .locals 8

    .prologue
    .line 548
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result v5

    if-nez v5, :cond_7

    .line 549
    iget-object v5, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v5}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v3

    .line 550
    .local v3, "t":Lcom/android/camera/Thumbnail;
    if-eqz v3, :cond_7

    .line 551
    invoke-virtual {v3}, Lcom/android/camera/Thumbnail;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 552
    .local v4, "uri":Landroid/net/Uri;
    if-nez v4, :cond_1

    .line 553
    const-string/jumbo v5, "ActivityBase"

    const-string/jumbo v6, "Uri null!"

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    invoke-virtual {v3}, Lcom/android/camera/Thumbnail;->isWaitingForUri()Z

    move-result v5

    if-nez v5, :cond_0

    .line 555
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnailUncached()V

    .line 557
    :cond_0
    return-void

    .line 559
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/Util;->isUriValid(Landroid/net/Uri;Landroid/content/ContentResolver;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 560
    const-string/jumbo v5, "ActivityBase"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Uri invalid. uri="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    return-void

    .line 566
    :cond_2
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v5, "com.android.camera.action.REVIEW"

    invoke-direct {v2, v5, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 567
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "com.miui.gallery"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 568
    const-string/jumbo v5, "from_MiuiCamera"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 569
    invoke-static {}, Lcom/android/camera/Device;->adjustScreenLight()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 570
    invoke-static {}, Lcom/android/camera/Device;->supportNewBrightness()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 571
    iget-object v5, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v5}, Lcom/android/camera/CameraBrightness;->getCurrentBrightnessManual()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_8

    .line 572
    const-string/jumbo v5, "camera-brightness-manual"

    iget-object v6, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v6}, Lcom/android/camera/CameraBrightness;->getCurrentBrightnessManual()I

    move-result v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 580
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 581
    const-string/jumbo v5, "StartActivityWhenLocked"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 583
    :cond_4
    const-string/jumbo v5, "com.miui.gallery"

    invoke-static {p0, v5}, Lcom/android/camera/Util;->isAppLocked(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 584
    const-string/jumbo v5, "skip_interception"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 586
    :cond_5
    iget-object v5, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    if-eqz v5, :cond_6

    .line 587
    const-string/jumbo v5, "SecureUri"

    iget-object v6, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 589
    :cond_6
    invoke-virtual {p0, v2}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V

    .line 590
    const/4 v5, 0x1

    iput v5, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 591
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/camera/ActivityBase;->mJumpedToGallery:Z

    .line 599
    iget-object v5, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v5, :cond_7

    .line 602
    iget-object v5, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    .line 603
    iget-object v5, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v5}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v5

    invoke-static {v5}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoGallery(I)V

    .line 614
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "t":Lcom/android/camera/Thumbnail;
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_7
    :goto_1
    return-void

    .line 574
    .restart local v2    # "intent":Landroid/content/Intent;
    .restart local v3    # "t":Lcom/android/camera/Thumbnail;
    .restart local v4    # "uri":Landroid/net/Uri;
    :cond_8
    const-string/jumbo v5, "camera-brightness-auto"

    iget-object v6, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v6}, Lcom/android/camera/CameraBrightness;->getCurrentBrightnessAuto()F

    move-result v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 605
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v1

    .line 607
    .local v1, "ex":Landroid/content/ActivityNotFoundException;
    :try_start_1
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    invoke-direct {v5, v6, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v5}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 608
    :catch_1
    move-exception v0

    .line 609
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string/jumbo v5, "ActivityBase"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "review image fail. uri="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 577
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    .end local v1    # "ex":Landroid/content/ActivityNotFoundException;
    .restart local v2    # "intent":Landroid/content/Intent;
    :cond_9
    :try_start_2
    const-string/jumbo v5, "camera-brightness"

    iget-object v6, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v6}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0
.end method

.method public declared-synchronized hasSurface()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    monitor-enter p0

    .line 689
    :try_start_0
    iget v0, p0, Lcom/android/camera/ActivityBase;->mCurrentSurfaceState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v0, :pswitch_data_0

    :goto_0
    :pswitch_0
    monitor-exit p0

    .line 701
    return v1

    .line 691
    :pswitch_1
    :try_start_1
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-nez v0, :cond_0

    .line 692
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onResume()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 693
    return v1

    .line 695
    :cond_0
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    .line 698
    :pswitch_2
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onResume()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 689
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public initCameraScreenNail()V
    .locals 5

    .prologue
    .line 468
    const-string/jumbo v2, "ActivityBase"

    const-string/jumbo v3, "initCameraScreenNail"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 469
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    if-nez v2, :cond_0

    .line 470
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 471
    .local v0, "display":Landroid/view/Display;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 472
    .local v1, "point":Landroid/graphics/Point;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 473
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v4, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    .line 475
    .end local v0    # "display":Landroid/view/Display;
    .end local v1    # "point":Landroid/graphics/Point;
    :cond_0
    return-void
.end method

.method public isActivityPaused()Z
    .locals 1

    .prologue
    .line 670
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mActivityPaused:Z

    return v0
.end method

.method public isGalleryBack()Z
    .locals 1

    .prologue
    .line 635
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryBack:Z

    return v0
.end method

.method public isGalleryLocked()Z
    .locals 1

    .prologue
    .line 519
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryLocked:Z

    return v0
.end method

.method public isGotoGallery()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 631
    iget v1, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSwitchingModule()Z
    .locals 1

    .prologue
    .line 662
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mIsSwitchingModule:Z

    return v0
.end method

.method public loadCameraSound(I)V
    .locals 1
    .param p1, "soundId"    # I

    .prologue
    .line 535
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-eqz v0, :cond_0

    .line 536
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0, p1}, Lcom/android/camera/MiuiCameraSound;->load(I)V

    .line 538
    :cond_0
    return-void
.end method

.method protected abstract notifyOnFirstFrameArrived(I)V
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 617
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/module/Module;->onActivityResult(IILandroid/content/Intent;)V

    .line 618
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 206
    invoke-static {v2}, Lcom/android/camera/CameraPerformanceTracker;->onEvent(I)V

    .line 207
    sget-boolean v2, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v2, :cond_0

    .line 209
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x700

    invoke-virtual {v2, v3}, Landroid/view/Window;->addExtraFlags(I)V

    .line 211
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x400

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 212
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getFlags()I

    move-result v2

    const/high16 v3, 0x800000

    and-int/2addr v2, v3

    if-nez v2, :cond_3

    const/4 v1, 0x1

    .line 213
    .local v1, "isFromVolumeKey":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 214
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/high16 v3, 0x200000

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 218
    :cond_1
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 219
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/android/camera/ActivityBase;->setVolumeControlStream(I)V

    .line 220
    new-instance v2, Lcom/android/camera/ui/ScreenHint;

    invoke-direct {v2, p0}, Lcom/android/camera/ui/ScreenHint;-><init>(Landroid/app/Activity;)V

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mScreenHint:Lcom/android/camera/ui/ScreenHint;

    .line 221
    new-instance v2, Lcom/android/camera/ThumbnailUpdater;

    invoke-direct {v2, p0}, Lcom/android/camera/ThumbnailUpdater;-><init>(Lcom/android/camera/ActivityBase;)V

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    .line 222
    const-string/jumbo v2, "keyguard"

    invoke-virtual {p0, v2}, Lcom/android/camera/ActivityBase;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/KeyguardManager;

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 223
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getKeyguardFlag()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    .line 224
    iget-boolean v2, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    if-eqz v2, :cond_2

    .line 225
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mKeyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {v2}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    .line 228
    :cond_2
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v2, p0}, Lcom/android/camera/CameraAppImpl;->addActivity(Landroid/app/Activity;)V

    .line 229
    new-instance v2, Lcom/android/camera/CameraBrightness;

    invoke-direct {v2, p0}, Lcom/android/camera/CameraBrightness;-><init>(Landroid/app/Activity;)V

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    .line 230
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    .line 232
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/android/camera/ActivityBase$1;

    invoke-direct {v3, p0}, Lcom/android/camera/ActivityBase$1;-><init>(Lcom/android/camera/ActivityBase;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    .line 240
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalThreadStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :goto_1
    return-void

    .line 212
    .end local v1    # "isFromVolumeKey":Z
    :cond_3
    const/4 v1, 0x0

    .restart local v1    # "isFromVolumeKey":Z
    goto :goto_0

    .line 241
    :catch_0
    move-exception v0

    .line 242
    .local v0, "e":Ljava/lang/IllegalThreadStateException;
    const-string/jumbo v2, "ActivityBase"

    invoke-virtual {v0}, Ljava/lang/IllegalThreadStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 398
    invoke-static {p0}, Lcom/android/camera/ui/PopupManager;->removeInstance(Landroid/content/Context;)V

    .line 399
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera/CameraAppImpl;->removeActivity(Landroid/app/Activity;)V

    .line 400
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-eqz v0, :cond_0

    .line 401
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0}, Lcom/android/camera/MiuiCameraSound;->release()V

    .line 402
    iput-object v1, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    .line 404
    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 405
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 382
    const/16 v0, 0x54

    if-ne p1, v0, :cond_0

    .line 383
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 385
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onLayoutChange(Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 485
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraScreenNail;->setRenderArea(Landroid/graphics/Rect;)V

    .line 487
    invoke-static {p0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    .line 488
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/CameraScreenNail;->setPreviewFrameLayoutSize(II)V

    .line 494
    :goto_0
    return-void

    .line 492
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/CameraScreenNail;->setPreviewFrameLayoutSize(II)V

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 248
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 249
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkGalleryLock()V

    .line 250
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkKeyguardFlag()V

    .line 251
    return-void
.end method

.method protected onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 297
    invoke-static {v1}, Lcom/android/camera/CameraPerformanceTracker;->onEvent(I)V

    .line 298
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 299
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mErrorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 300
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mErrorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 302
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->pause()V

    .line 310
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 312
    :cond_1
    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mSecureUriList:Ljava/util/ArrayList;

    .line 313
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v0, v2, v1, v3}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 318
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 319
    return-void

    .line 314
    :cond_3
    iget v0, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-ne v0, v1, :cond_2

    .line 316
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->clearNotification()V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 255
    const/4 v2, 0x2

    invoke-static {v2}, Lcom/android/camera/CameraPerformanceTracker;->onEvent(I)V

    .line 256
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 257
    iget v2, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-ne v2, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mGalleryBack:Z

    .line 258
    iput v1, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 259
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkGalleryLock()V

    .line 260
    invoke-direct {p0}, Lcom/android/camera/ActivityBase;->checkKeyguardFlag()V

    .line 261
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->resume()V

    .line 262
    return-void

    :cond_0
    move v0, v1

    .line 257
    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 390
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 391
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 394
    :cond_0
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 376
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 336
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->onPause()V

    .line 337
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 338
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v1}, Lcom/android/camera/CameraBrightness;->onPause()V

    .line 339
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 341
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 345
    :goto_0
    iput-object v2, p0, Lcom/android/camera/ActivityBase;->mCloseActivityThread:Ljava/lang/Thread;

    .line 348
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    if-eqz v1, :cond_1

    .line 349
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    invoke-virtual {v1, v3}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 352
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/android/camera/ActivityBase;->mIsFinishInKeyguard:Z

    if-eqz v1, :cond_2

    .line 353
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/high16 v2, 0x200000

    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 354
    iget v1, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    if-nez v1, :cond_2

    .line 356
    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->finish()V

    .line 360
    :cond_2
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    if-eqz v1, :cond_3

    .line 361
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v1}, Lcom/android/camera/ThumbnailUpdater;->saveThumbnailToFile()V

    .line 362
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mThumbnailUpdater:Lcom/android/camera/ThumbnailUpdater;

    invoke-virtual {v1}, Lcom/android/camera/ThumbnailUpdater;->cancelTask()V

    .line 364
    :cond_3
    return-void

    .line 342
    :catch_0
    move-exception v0

    .line 343
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method public playCameraSound(I)V
    .locals 1
    .param p1, "soundId"    # I

    .prologue
    .line 531
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    invoke-virtual {v0, p1}, Lcom/android/camera/MiuiCameraSound;->playSound(I)V

    .line 532
    return-void
.end method

.method protected releaseCameraScreenNail()V
    .locals 1

    .prologue
    .line 478
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->releaseSurfaceTexture()V

    .line 481
    :cond_0
    return-void
.end method

.method public resetStartTime()V
    .locals 2

    .prologue
    .line 711
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    .line 712
    return-void
.end method

.method public resume()V
    .locals 2

    .prologue
    .line 322
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    if-nez v1, :cond_0

    .line 323
    new-instance v1, Lcom/android/camera/MiuiCameraSound;

    invoke-direct {v1, p0}, Lcom/android/camera/MiuiCameraSound;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/ActivityBase;->mCameraSound:Lcom/android/camera/MiuiCameraSound;

    .line 330
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v0

    .line 331
    .local v0, "recordLocation":Z
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mLocationManager:Lcom/android/camera/LocationManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 332
    iget-object v1, p0, Lcom/android/camera/ActivityBase;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v1}, Lcom/android/camera/CameraBrightness;->onResume()V

    .line 333
    return-void
.end method

.method public setErrorDialog(Landroid/app/AlertDialog;)V
    .locals 0
    .param p1, "errorDialog"    # Landroid/app/AlertDialog;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/android/camera/ActivityBase;->mErrorDialog:Landroid/app/AlertDialog;

    .line 177
    return-void
.end method

.method public setJumpFlag(I)V
    .locals 0
    .param p1, "flag"    # I

    .prologue
    .line 652
    iput p1, p0, Lcom/android/camera/ActivityBase;->mJumpFlag:I

    .line 653
    return-void
.end method

.method public setSwitchingModule(Z)V
    .locals 0
    .param p1, "switching"    # Z

    .prologue
    .line 666
    iput-boolean p1, p0, Lcom/android/camera/ActivityBase;->mIsSwitchingModule:Z

    .line 667
    return-void
.end method

.method public showDebugInfo(Ljava/lang/String;)V
    .locals 1
    .param p1, "info"    # Ljava/lang/String;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/android/camera/ActivityBase;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    :cond_0
    return-void
.end method

.method public showErrorDialog()V
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ActivityBase;->mCameraErrorShown:Z

    .line 173
    return-void
.end method

.method public startFromKeyguard()Z
    .locals 1

    .prologue
    .line 523
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mStartFromKeyguard:Z

    return v0
.end method

.method public startFromSecureKeyguard()Z
    .locals 1

    .prologue
    .line 515
    iget-boolean v0, p0, Lcom/android/camera/ActivityBase;->mKeyguardSecureLocked:Z

    return v0
.end method

.method public declared-synchronized updateSurfaceState(I)V
    .locals 3
    .param p1, "newState"    # I

    .prologue
    monitor-enter p0

    .line 706
    :try_start_0
    const-string/jumbo v0, "ActivityBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "updateSurfaceState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    iput p1, p0, Lcom/android/camera/ActivityBase;->mCurrentSurfaceState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 708
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
