.class public Lcom/android/camera/module/loader/camera2/FocusManager2;
.super Lcom/android/camera/FocusManagerAbstract;
.source "FocusManager2.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/FocusManager2$1;,
        Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;,
        Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;
    }
.end annotation


# instance fields
.field private mAeAwbLock:Z

.field private mCafStartTime:J

.field private mCamera1FocusArea:Landroid/graphics/Rect;

.field private mCamera1MeteringArea:Landroid/graphics/Rect;

.field private mFocusAreaSupported:Z

.field private mFocusMode:Ljava/lang/String;

.field private mFocusResultConsumer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field

.field private mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

.field private mFocusResultEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter",
            "<",
            "Lcom/android/camera/module/loader/camera2/FocusTask;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mKeepFocusUIState:Z

.field private mLastFocusFrom:I

.field private mLastState:I

.field private mLatestFocusFace:Landroid/graphics/RectF;

.field private mLatestFocusTime:J

.field private mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

.field private mLockAeAwbNeeded:Z

.field private mMeteringAreaSupported:Z

.field private mOverrideFocusMode:Ljava/lang/String;

.field private mPendingMultiCapture:Z

.field private mSupportedFocusModes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/android/camera/module/loader/camera2/FocusManager2;)Ljava/lang/String;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/module/loader/camera2/FocusManager2;)Landroid/os/Handler;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/module/loader/camera2/FocusManager2;)Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMirror:Z

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    return v0
.end method

.method static synthetic -get6(Lcom/android/camera/module/loader/camera2/FocusManager2;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/module/loader/camera2/FocusManager2;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/module/loader/camera2/FocusManager2;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;
    .param p1, "-value"    # Lio/reactivex/ObservableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/module/loader/camera2/FocusManager2;ZZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;
    .param p1, "moving"    # Z
    .param p2, "isSuccessful"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onAutoFocusMoving(ZZ)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;
    .param p1, "state"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/loader/camera2/FocusManager2;
    .param p1, "state"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    return-void
.end method

.method public constructor <init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V
    .locals 2
    .param p1, "cc"    # Lcom/android/camera2/CameraCapabilities;
    .param p2, "listener"    # Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
    .param p3, "mirror"    # Z
    .param p4, "looper"    # Landroid/os/Looper;

    .prologue
    .line 176
    invoke-direct {p0}, Lcom/android/camera/FocusManagerAbstract;-><init>()V

    .line 86
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    .line 102
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 361
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/FocusManager2$1;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultConsumer:Lio/reactivex/functions/Consumer;

    .line 177
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;

    invoke-direct {v0, p0, p4}, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    .line 178
    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setCharacteristics(Lcom/android/camera2/CameraCapabilities;)V

    .line 179
    iput-object p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    .line 180
    invoke-virtual {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setMirror(Z)V

    .line 182
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/FocusManager2$2;-><init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    .line 188
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    .line 182
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 188
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultConsumer:Lio/reactivex/functions/Consumer;

    .line 182
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    .line 189
    return-void
.end method

.method private afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 4
    .param p1, "camera1Region"    # Landroid/graphics/Rect;
    .param p2, "cropRegion"    # Landroid/graphics/Rect;

    .prologue
    const/4 v3, 0x1

    .line 990
    new-array v0, v3, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 992
    .local v0, "meteringRectangle":[Landroid/hardware/camera2/params/MeteringRectangle;
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->convertToCamera2Coordinates(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v1

    .line 993
    .local v1, "rect":Landroid/graphics/Rect;
    new-instance v2, Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-direct {v2, v1, v3}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 994
    return-object v0
.end method

.method private capture()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 764
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->onWaitingFocusFinished()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 765
    invoke-static {}, Lcom/android/camera/Device;->isResetToCCAFAfterCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 766
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 767
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 769
    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    .line 770
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 772
    :cond_1
    return-void
.end method

.method private focusPoint(IIIZ)V
    .locals 4
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "from"    # I
    .param p4, "onlyAe"    # Z

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x1

    .line 573
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 575
    :cond_0
    return-void

    .line 574
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isAutoFocusMode(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 573
    if-nez v0, :cond_0

    .line 579
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isNeedCancelAutoFocus()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 580
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    .line 583
    :cond_3
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeParameters(IIIZ)V

    .line 584
    invoke-direct {p0, v2, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusIndicator(III)V

    .line 587
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 588
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v0, :cond_5

    xor-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_5

    .line 589
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusValid(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 590
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 608
    :cond_4
    :goto_0
    return-void

    .line 592
    :cond_5
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz v0, :cond_4

    .line 595
    if-ne v3, p3, :cond_6

    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusValid(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 597
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->playSound(I)V

    .line 598
    iput-boolean v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 600
    :cond_6
    iput p3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 601
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 602
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 603
    invoke-direct {p0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 604
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 606
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0
.end method

.method private getTapAction()I
    .locals 2

    .prologue
    .line 950
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 951
    .local v0, "focusMode":Ljava/lang/String;
    const-string/jumbo v1, "edof"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 952
    const-string/jumbo v1, "manual"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 951
    if-eqz v1, :cond_1

    .line 953
    :cond_0
    const/4 v1, 0x1

    return v1

    .line 955
    :cond_1
    const/4 v1, 0x2

    return v1
.end method

.method private initializeFocusAreas(IIIIII)V
    .locals 9
    .param p1, "focusWidth"    # I
    .param p2, "focusHeight"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "previewWidth"    # I
    .param p6, "previewHeight"    # I

    .prologue
    .line 503
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 504
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    .line 509
    :cond_0
    iget-object v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    .line 508
    const/high16 v3, 0x3f800000    # 1.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 510
    return-void
.end method

.method private initializeFocusIndicator(III)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 535
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 536
    const/16 v2, 0xa6

    .line 535
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 537
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-eqz v0, :cond_0

    .line 538
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewPosition(III)V

    .line 540
    :cond_0
    return-void
.end method

.method private initializeMeteringAreas(IIIIIII)V
    .locals 11
    .param p1, "focusWidth"    # I
    .param p2, "focusHeight"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "previewWidth"    # I
    .param p6, "previewHeight"    # I
    .param p7, "from"    # I

    .prologue
    .line 516
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 517
    const/16 v2, 0xa6

    .line 516
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v10

    check-cast v10, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 518
    .local v10, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    const/4 v1, 0x1

    move/from16 v0, p7

    if-ne v0, v1, :cond_0

    if-eqz v10, :cond_0

    .line 519
    const/4 v1, 0x1

    invoke-interface {v10, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isNeedExposure(I)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 518
    if-eqz v1, :cond_0

    .line 520
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    .line 521
    return-void

    .line 524
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    if-nez v1, :cond_1

    .line 525
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    .line 530
    :cond_1
    iget-object v9, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    .line 529
    const v4, 0x3fe66666    # 1.8f

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    invoke-virtual/range {v1 .. v9}, Lcom/android/camera/module/loader/camera2/FocusManager2;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 531
    return-void
.end method

.method private initializeParameters(IIIZ)V
    .locals 8
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "from"    # I
    .param p4, "onlyAe"    # Z

    .prologue
    .line 553
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    if-eqz v0, :cond_0

    xor-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_0

    .line 554
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    .line 555
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    move v3, p1

    move v4, p2

    .line 554
    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    .line 558
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    if-eqz v0, :cond_1

    .line 559
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    .line 560
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v7, p3

    .line 559
    invoke-direct/range {v0 .. v7}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeMeteringAreas(IIIIIII)V

    .line 562
    :cond_1
    return-void
.end method

.method private isAutoFocusMode(Ljava/lang/String;)Z
    .locals 1
    .param p1, "focusMode"    # Ljava/lang/String;

    .prologue
    .line 960
    const-string/jumbo v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 961
    const-string/jumbo v0, "macro"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 960
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private isFocusEnabled()Z
    .locals 2

    .prologue
    .line 985
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 986
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    .line 985
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isFocusValid(I)Z
    .locals 8
    .param p1, "from"    # I

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    .line 692
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 693
    .local v0, "now":J
    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-eq v2, v7, :cond_0

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_2

    .line 694
    :cond_0
    const/16 v2, 0x1388

    .line 693
    :goto_0
    int-to-long v4, v2

    .line 695
    .local v4, "timeout":J
    if-ge p1, v7, :cond_1

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-lt p1, v2, :cond_3

    .line 697
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    .line 698
    return v6

    .line 694
    .end local v4    # "timeout":J
    :cond_2
    const/16 v2, 0xfa0

    goto :goto_0

    .line 696
    .restart local v4    # "timeout":J
    :cond_3
    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v2

    .line 695
    if-nez v2, :cond_1

    .line 700
    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne v2, v6, :cond_4

    .line 701
    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    .line 703
    :cond_4
    const/4 v2, 0x0

    return v2
.end method

.method private multiCapture()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 775
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->multiCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 779
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 780
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    .line 781
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 783
    :cond_0
    return-void
.end method

.method private needAutoFocusCall()Z
    .locals 2

    .prologue
    .line 946
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getTapAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onAutoFocusMoving(ZZ)V
    .locals 13
    .param p1, "moving"    # Z
    .param p2, "isSuccessful"    # Z

    .prologue
    const/4 v12, 0x4

    const/4 v8, 0x1

    const/4 v5, 0x3

    const/4 v4, 0x2

    .line 419
    iget-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v3, :cond_0

    .line 420
    const-string/jumbo v3, "FocusManager"

    const-string/jumbo v4, "onAutoFocusMoving"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    return-void

    .line 425
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 426
    const/16 v6, 0xa6

    .line 425
    invoke-virtual {v3, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 427
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    const/4 v1, 0x1

    .line 429
    .local v1, "showFocusIndicator":Z
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v3

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 430
    invoke-interface {v0, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 431
    const/4 v1, 0x0

    .line 434
    :cond_1
    const-string/jumbo v3, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onAutoFocusMoving: mode="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " show="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    if-nez v3, :cond_2

    const-string/jumbo v3, "auto"

    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 437
    :cond_2
    return-void

    .line 440
    :cond_3
    if-eqz p1, :cond_6

    .line 441
    iget v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v3, v4, :cond_4

    .line 442
    invoke-direct {p0, v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 444
    :cond_4
    const-string/jumbo v3, "FocusManager"

    const-string/jumbo v5, "Camera KPI: CAF start"

    invoke-static {v3, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCafStartTime:J

    .line 446
    if-eqz v1, :cond_5

    .line 447
    invoke-interface {v0, v4, v8}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    .line 473
    :cond_5
    :goto_0
    return-void

    .line 450
    :cond_6
    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    .line 451
    .local v2, "state":I
    const-string/jumbo v3, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Camera KPI: CAF stop: Focus time: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCafStartTime:J

    sub-long/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    if-eqz p2, :cond_8

    .line 453
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 454
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 459
    :goto_1
    if-eqz v1, :cond_7

    .line 461
    if-eqz p2, :cond_9

    move v3, v4

    .line 460
    :goto_2
    invoke-interface {v0, v4, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    .line 464
    :cond_7
    if-ne v2, v4, :cond_5

    .line 465
    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 466
    iget-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    if-eqz v3, :cond_a

    .line 467
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    goto :goto_0

    .line 456
    :cond_8
    invoke-direct {p0, v12}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 457
    invoke-direct {p0, v12}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    goto :goto_1

    :cond_9
    move v3, v5

    .line 461
    goto :goto_2

    .line 469
    :cond_a
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    goto :goto_0
.end method

.method private onlyAe()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 569
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getTapAction()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private resetFocusAreaToCenter()V
    .locals 7

    .prologue
    .line 495
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    .line 496
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    div-int/lit8 v4, v0, 0x2

    .line 497
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    .line 495
    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    .line 498
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    div-int/lit8 v1, v1, 0x2

    const/4 v2, 0x5

    invoke-direct {p0, v2, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusIndicator(III)V

    .line 499
    return-void
.end method

.method private resetFocusAreaToFaceArea()Z
    .locals 9

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 477
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 478
    const/16 v1, 0xa6

    .line 477
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v7

    check-cast v7, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 479
    .local v7, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-eqz v7, :cond_0

    invoke-interface {v7}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v0

    invoke-interface {v7, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 481
    invoke-interface {v7}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v0

    invoke-interface {v7, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFocusRect(I)Landroid/graphics/RectF;

    move-result-object v8

    .line 482
    .local v8, "rect":Landroid/graphics/RectF;
    if-eqz v8, :cond_0

    .line 483
    iput-object v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    .line 484
    iget v0, v8, Landroid/graphics/RectF;->left:F

    iget v1, v8, Landroid/graphics/RectF;->right:F

    add-float/2addr v0, v1

    div-float/2addr v0, v2

    float-to-int v3, v0

    .line 485
    .local v3, "x":I
    iget v0, v8, Landroid/graphics/RectF;->top:F

    iget v1, v8, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v0, v1

    div-float/2addr v0, v2

    float-to-int v4, v0

    .line 486
    .local v4, "y":I
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_WIDTH:I

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->FOCUS_AREA_HEIGHT:I

    .line 487
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    move-object v0, p0

    .line 486
    invoke-direct/range {v0 .. v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->initializeFocusAreas(IIIIII)V

    .line 488
    const/4 v0, 0x1

    return v0

    .line 491
    .end local v3    # "x":I
    .end local v4    # "y":I
    .end local v8    # "rect":Landroid/graphics/RectF;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private setFocusState(I)V
    .locals 3
    .param p1, "state"    # I

    .prologue
    .line 210
    const-string/jumbo v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setFocusState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    .line 212
    return-void
.end method

.method private setLastFocusState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 215
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    .line 216
    return-void
.end method

.method private startFocus(I)V
    .locals 6
    .param p1, "from"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 707
    const-string/jumbo v1, "FocusManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startFocus: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 708
    const-string/jumbo v1, "auto"

    invoke-virtual {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    .line 709
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 713
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 714
    const/16 v2, 0xa6

    .line 713
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 715
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-ne p1, v4, :cond_0

    .line 716
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v1

    if-ne v4, v1, :cond_1

    .line 717
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v1, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->stopObjectTracking(Z)V

    .line 719
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->startFocus()V

    .line 726
    invoke-direct {p0, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 727
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 728
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 729
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 732
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    .line 733
    const-wide/16 v2, 0x1388

    .line 732
    invoke-virtual {v1, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 734
    return-void
.end method


# virtual methods
.method public canRecord()Z
    .locals 1

    .prologue
    .line 998
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 999
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 1000
    const/4 v0, 0x0

    return v0

    .line 1002
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public cancelFocus()V
    .locals 4

    .prologue
    const/4 v1, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 737
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    .line 738
    invoke-virtual {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetTouchFocus(I)V

    .line 739
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 740
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    .line 751
    :goto_0
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v1, v0, :cond_1

    .line 752
    invoke-direct {p0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 756
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 757
    iput-boolean v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 758
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 759
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 760
    const-string/jumbo v0, "FocusManager"

    const-string/jumbo v1, "cancelFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 761
    return-void

    .line 743
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    goto :goto_0

    .line 754
    :cond_1
    const-string/jumbo v0, "FocusManager"

    const-string/jumbo v1, "waiting focus timeout!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 1015
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 1016
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1017
    return-void
.end method

.method public doMultiSnap(Z)V
    .locals 3
    .param p1, "checkFocusState"    # Z

    .prologue
    const/4 v2, 0x1

    .line 329
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    .line 330
    return-void

    .line 334
    :cond_0
    if-nez p1, :cond_1

    .line 335
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    .line 340
    :cond_1
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    .line 341
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    .line 355
    :cond_3
    :goto_0
    return-void

    .line 340
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_2

    .line 342
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-ne v0, v2, :cond_5

    .line 346
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 347
    iput-boolean v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPendingMultiCapture:Z

    goto :goto_0

    .line 348
    :cond_5
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-nez v0, :cond_3

    .line 353
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->multiCapture()V

    goto :goto_0
.end method

.method public doSnap()V
    .locals 2

    .prologue
    .line 305
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v0, :cond_0

    .line 306
    return-void

    .line 312
    :cond_0
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3

    .line 313
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    .line 326
    :cond_2
    :goto_0
    return-void

    .line 312
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 314
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 318
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    goto :goto_0

    .line 319
    :cond_4
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-nez v0, :cond_2

    .line 324
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->capture()V

    goto :goto_0
.end method

.method public focusFaceArea()Z
    .locals 11

    .prologue
    const/high16 v10, 0x42a00000    # 80.0f

    const/high16 v9, 0x40000000    # 2.0f

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 648
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 649
    const/16 v5, 0xa6

    .line 648
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 650
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isAutoFocusMode(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 651
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v4

    const/4 v5, 0x2

    if-ne v5, v4, :cond_1

    .line 652
    :cond_0
    return v7

    .line 654
    :cond_1
    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v4

    invoke-interface {v0, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFocusRect(I)Landroid/graphics/RectF;

    move-result-object v1

    .line 655
    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 656
    :cond_2
    return v7

    .line 654
    :cond_3
    const/4 v1, 0x0

    .local v1, "rect":Landroid/graphics/RectF;
    goto :goto_0

    .line 658
    .end local v1    # "rect":Landroid/graphics/RectF;
    :cond_4
    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    if-eqz v4, :cond_5

    iget v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne v4, v8, :cond_5

    .line 659
    iget v4, v1, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v10

    if-gez v4, :cond_5

    .line 660
    iget v4, v1, Landroid/graphics/RectF;->right:F

    iget v5, v1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    .line 661
    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    .line 660
    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v4, v4, v10

    if-gez v4, :cond_5

    .line 662
    return v7

    .line 665
    :cond_5
    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusFace:Landroid/graphics/RectF;

    .line 666
    iget v4, v1, Landroid/graphics/RectF;->left:F

    iget v5, v1, Landroid/graphics/RectF;->right:F

    add-float/2addr v4, v5

    div-float/2addr v4, v9

    float-to-int v2, v4

    .line 667
    .local v2, "x":I
    iget v4, v1, Landroid/graphics/RectF;->top:F

    iget v5, v1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v4, v5

    div-float/2addr v4, v9

    float-to-int v3, v4

    .line 668
    .local v3, "y":I
    invoke-direct {p0, v2, v3, v8, v7}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusPoint(IIIZ)V

    .line 669
    return v8
.end method

.method public getFocusAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 2
    .param p1, "cropRegion"    # Landroid/graphics/Rect;

    .prologue
    const/4 v1, 0x0

    .line 831
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 832
    return-object v1

    .line 835
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    return-object v0
.end method

.method public getFocusMode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 819
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 820
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mOverrideFocusMode:Ljava/lang/String;

    return-object v0

    .line 823
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 824
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    .line 826
    :cond_1
    const-string/jumbo v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "getFocusMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object v0
.end method

.method public getMeteringAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 2
    .param p1, "cropRegion"    # Landroid/graphics/Rect;

    .prologue
    const/4 v1, 0x0

    .line 839
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 840
    return-object v1

    .line 843
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->afaeRectangle(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    return-object v0
.end method

.method public isFocusing()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 1007
    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v1, v0, :cond_0

    iget v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFocusingSnapOnFinish()Z
    .locals 2

    .prologue
    .line 917
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNeedCancelAutoFocus()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 969
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 970
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    .line 969
    if-nez v1, :cond_0

    .line 971
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 969
    :cond_0
    return v0
.end method

.method public onDeviceKeepMoving(D)V
    .locals 7
    .param p1, "a"    # D

    .prologue
    const/4 v6, 0x0

    .line 975
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLatestFocusTime:J

    .line 976
    const-wide/16 v4, 0xbb8

    .line 975
    invoke-static/range {v0 .. v5}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 977
    invoke-direct {p0, v6}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 978
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    if-eqz v0, :cond_0

    .line 979
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 982
    :cond_0
    return-void
.end method

.method public onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 1
    .param p1, "focusTask"    # Lcom/android/camera/module/loader/camera2/FocusTask;

    .prologue
    .line 358
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusResultEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 359
    return-void
.end method

.method public onShutter()V
    .locals 1

    .prologue
    .line 673
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 674
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 675
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 565
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onlyAe()Z

    move-result v0

    const/4 v1, 0x3

    invoke-direct {p0, p1, p2, v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusPoint(IIIZ)V

    .line 566
    return-void
.end method

.method public prepareCapture(ZI)V
    .locals 11
    .param p1, "autoFocus"    # Z
    .param p2, "fromWhat"    # I

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 223
    iget-boolean v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-nez v5, :cond_0

    .line 224
    return-void

    .line 226
    :cond_0
    const/4 v4, 0x1

    .line 227
    .local v4, "tryAutoFocus":Z
    const/4 v0, 0x0

    .line 228
    .local v0, "autoFocusCalled":Z
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    .line 230
    .local v1, "focusMode":Ljava/lang/String;
    const/4 v5, 0x2

    if-ne p2, v5, :cond_3

    .line 231
    const-string/jumbo v5, "auto"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 232
    const-string/jumbo v5, "macro"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 230
    if-eqz v5, :cond_3

    .line 234
    :cond_1
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastState:I

    if-eq v5, v10, :cond_2

    xor-int/lit8 v5, p1, 0x1

    if-eqz v5, :cond_3

    .line 235
    :cond_2
    const/4 v4, 0x0

    .line 239
    :cond_3
    const-string/jumbo v5, "FocusManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "prepareCapture: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "|"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "|"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const-string/jumbo v5, "continuous-picture"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 242
    .local v2, "isCaf":Z
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusEnabled()Z

    move-result v5

    if-eqz v5, :cond_4

    xor-int/lit8 v5, v2, 0x1

    if-eqz v5, :cond_4

    if-eqz v4, :cond_4

    .line 244
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-eq v5, v10, :cond_7

    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    const/4 v6, 0x4

    if-eq v5, v6, :cond_7

    .line 247
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    .line 248
    const/16 v6, 0xa6

    .line 247
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 249
    .local v3, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-eqz v3, :cond_6

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v5

    invoke-interface {v3, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 250
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->focusFaceArea()Z

    .line 251
    const/4 v0, 0x1

    .line 267
    .end local v3    # "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    :cond_4
    :goto_0
    if-nez v0, :cond_5

    if-eqz p1, :cond_5

    if-eqz v2, :cond_5

    .line 269
    invoke-static {}, Lcom/android/camera/Device;->isHalDoesCafWhenFlashOn()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 270
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-ne v5, v9, :cond_5

    .line 271
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    .line 277
    :cond_5
    :goto_1
    return-void

    .line 253
    .restart local v3    # "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    :cond_6
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToCenter()V

    .line 254
    invoke-direct {p0, v8}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 255
    const/4 v0, 0x1

    goto :goto_0

    .line 257
    .end local v3    # "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    :cond_7
    if-eqz p1, :cond_4

    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    if-eqz v5, :cond_4

    invoke-static {}, Lcom/android/camera/Device;->isResetToCCAFAfterCapture()Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_4

    .line 259
    iput-boolean v9, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    .line 260
    iget v5, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    invoke-direct {p0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 261
    iput-boolean v8, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    .line 262
    const/4 v0, 0x1

    goto :goto_0

    .line 274
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->requestAutoFocus()V

    goto :goto_1
.end method

.method public removeMessages()V
    .locals 2

    .prologue
    .line 929
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 930
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 931
    return-void
.end method

.method public requestAutoFocus()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x0

    .line 611
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->needAutoFocusCall()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    xor-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_0

    .line 612
    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    if-ne v2, v5, :cond_1

    .line 613
    :cond_0
    return-void

    .line 617
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 618
    const/16 v3, 0xa6

    .line 617
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 619
    .local v1, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    const/4 v0, 0x4

    .line 621
    .local v0, "from":I
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isNeedCancelAutoFocus()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 623
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v2, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->cancelFocus(Z)V

    .line 624
    if-eqz v1, :cond_2

    .line 625
    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 627
    :cond_2
    invoke-direct {p0, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 628
    iput-boolean v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 629
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 630
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 632
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToFaceArea()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 633
    if-eqz v1, :cond_4

    .line 634
    const/16 v2, 0x9

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 636
    :cond_4
    const/4 v0, 0x1

    .line 641
    :goto_0
    iput-boolean v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 642
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mListener:Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    invoke-interface {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->notifyFocusAreaUpdate()V

    .line 643
    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->startFocus(I)V

    .line 644
    return-void

    .line 638
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusAreaToCenter()V

    goto :goto_0
.end method

.method public resetFocusIndicator(I)V
    .locals 3
    .param p1, "type"    # I

    .prologue
    .line 544
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 545
    const/16 v2, 0xa6

    .line 544
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 546
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-eqz v0, :cond_0

    .line 547
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 549
    :cond_0
    return-void
.end method

.method public resetFocusStateIfNeeded()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 786
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    .line 787
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    .line 789
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 790
    invoke-direct {p0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setLastFocusState(I)V

    .line 791
    iput-boolean v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 795
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 798
    :cond_0
    return-void
.end method

.method public resetFocused()V
    .locals 1

    .prologue
    .line 1011
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusState(I)V

    .line 1012
    return-void
.end method

.method public resetTouchFocus(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    const/4 v1, 0x0

    .line 884
    iget-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v0, :cond_0

    .line 885
    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1FocusArea:Landroid/graphics/Rect;

    .line 886
    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCamera1MeteringArea:Landroid/graphics/Rect;

    .line 887
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mCancelAutoFocusIfMove:Z

    .line 888
    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusIndicator(I)V

    .line 890
    :cond_0
    return-void
.end method

.method public setAeAwbLock(Z)V
    .locals 0
    .param p1, "lock"    # Z

    .prologue
    .line 938
    iput-boolean p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mAeAwbLock:Z

    .line 939
    return-void
.end method

.method public setCharacteristics(Lcom/android/camera2/CameraCapabilities;)V
    .locals 1
    .param p1, "cc"    # Lcom/android/camera2/CameraCapabilities;

    .prologue
    .line 192
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAFRegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusAreaSupported:Z

    .line 193
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAERegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mMeteringAreaSupported:Z

    .line 194
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAELockSupported()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->isAWBLockSupported()Z

    move-result v0

    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLockAeAwbNeeded:Z

    .line 195
    invoke-virtual {p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/constant/AutoFocus;->convertToLegacyFocusModes([I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mSupportedFocusModes:Ljava/util/List;

    .line 196
    return-void

    .line 194
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setFocusMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "focusMode"    # Ljava/lang/String;

    .prologue
    .line 801
    if-nez p1, :cond_0

    .line 802
    const-string/jumbo v0, "FocusManager"

    const-string/jumbo v1, "setFocusMode: null focus mode"

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v0, v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 803
    return-object p1

    .line 805
    :cond_0
    const-string/jumbo v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 806
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mSupportedFocusModes:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/android/camera/Util;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v0

    .line 805
    if-eqz v0, :cond_3

    .line 807
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    .line 811
    :goto_0
    const-string/jumbo v0, "continuous-picture"

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 812
    const-string/jumbo v0, "continuous-video"

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 811
    if-eqz v0, :cond_2

    .line 813
    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    .line 815
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    return-object v0

    .line 809
    :cond_3
    const-string/jumbo v0, "auto"

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    goto :goto_0
.end method

.method public setPreviewSize(II)V
    .locals 3
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    .line 200
    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    .line 201
    :cond_0
    iput p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    .line 202
    iput p2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    .line 204
    const-string/jumbo v0, "FocusManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setPreviewSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mPreviewHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setMatrix()V

    .line 207
    :cond_1
    return-void
.end method

.method public updateFocusUI()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v2, 0x2

    .line 848
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 849
    const/16 v4, 0xa6

    .line 848
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 850
    .local v1, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    iget-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mInitialized:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mKeepFocusUIState:Z

    if-nez v3, :cond_0

    if-nez v1, :cond_1

    .line 851
    :cond_0
    return-void

    .line 854
    :cond_1
    const/4 v0, 0x2

    .line 855
    .local v0, "focusIndicator":I
    iget v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mLastFocusFrom:I

    if-ne v5, v3, :cond_2

    .line 856
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v0

    .line 858
    :cond_2
    iget v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mState:I

    packed-switch v3, :pswitch_data_0

    .line 881
    :goto_0
    return-void

    .line 860
    :pswitch_0
    if-ne v0, v2, :cond_3

    .line 861
    const/4 v2, 0x7

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    goto :goto_0

    .line 863
    :cond_3
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearIndicator(I)V

    goto :goto_0

    .line 869
    :pswitch_1
    invoke-interface {v1, v0, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_0

    .line 872
    :pswitch_2
    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_0

    .line 876
    :pswitch_3
    const-string/jumbo v3, "continuous-picture"

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 877
    const-string/jumbo v3, "continuous-video"

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 876
    if-eqz v3, :cond_5

    .line 875
    :cond_4
    :goto_1
    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showIndicator(II)V

    goto :goto_0

    .line 878
    :cond_5
    const/4 v2, 0x3

    goto :goto_1

    .line 858
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
