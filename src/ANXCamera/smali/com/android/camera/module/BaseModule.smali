.class public abstract Lcom/android/camera/module/BaseModule;
.super Ljava/lang/Object;
.source "BaseModule.java"

# interfaces
.implements Lcom/android/camera/module/Module;
.implements Lcom/android/camera/ui/FocusView$ExposureViewListener;
.implements Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;
.implements Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;
.implements Lcom/android/camera/MutexModeManager$MutexCallBack;
.implements Lio/reactivex/functions/Consumer;
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/camera/module/Module;",
        "Lcom/android/camera/ui/FocusView$ExposureViewListener;",
        "Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;",
        "Lcom/android/camera/protocol/ModeProtocol$EvChangedProtocol;",
        "Lcom/android/camera/protocol/ModeProtocol$ZoomProtocol;",
        "Lcom/android/camera/MutexModeManager$MutexCallBack;",
        "Lio/reactivex/functions/Consumer",
        "<[I>;"
    }
.end annotation


# static fields
.field public static final CAMERA_MODES:[I

.field protected static final DEBUG:Z


# instance fields
.field protected isZooming:Z

.field protected mActivity:Lcom/android/camera/Camera;

.field protected mActualCameraId:I

.field protected mAeLockSupported:Z

.field protected mAwbLockSupported:Z

.field protected mBogusCameraId:I

.field protected mCamera2Device:Lcom/android/camera2/Camera2Proxy;

.field protected mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

.field protected mCameraDisabled:Z

.field protected mCameraDisplayOrientation:I

.field protected mCameraHardwareError:Z

.field private mCameraState:I

.field protected mContentResolver:Landroid/content/ContentResolver;

.field protected mContinuousFocusSupported:Z

.field protected mDeviceRotation:F

.field protected mDisplayRect:Landroid/graphics/Rect;

.field protected mDisplayRotation:I

.field protected mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

.field private mEvState:I

.field private mEvValue:I

.field protected mFlashAutoModeState:Ljava/lang/String;

.field protected mFocusAreaSupported:Z

.field protected mHandlerFinishEmitter:Lio/reactivex/CompletableEmitter;

.field protected mIgnoreFocusChanged:Z

.field private mIgnoreTouchEvent:Z

.field private mIsCreated:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mIsDeparted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mIsFrameAvailable:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

.field private mLensDirtyDetectHintDisposable:Lio/reactivex/disposables/Disposable;

.field protected mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

.field protected mMainThreadId:J

.field protected mMaxFaceCount:I

.field protected mMeteringAreaSupported:Z

.field protected mModuleIndex:I

.field protected mMutexModePicker:Lcom/android/camera/MutexModeManager;

.field protected mObjectTrackingStarted:Z

.field protected mOpenCameraFail:Z

.field protected mOrientation:I

.field protected mOrientationCompensation:I

.field protected mPaused:Z

.field protected mPictureSize:Lcom/android/camera/CameraSize;

.field protected mPreviewSize:Lcom/android/camera/CameraSize;

.field protected mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

.field protected mTriggerMode:I

.field protected mUIStyle:I

.field private mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

.field private mUpdateWorkThreadEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter",
            "<[I>;"
        }
    .end annotation
.end field

.field protected mZoomMaxRatio:F

.field private mZoomScaled:F

.field protected mZoomSupported:Z

.field protected mZoomValue:F


# direct methods
.method static synthetic -set0(Lcom/android/camera/module/BaseModule;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/BaseModule;
    .param p1, "-value"    # Lio/reactivex/ObservableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 90
    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/module/BaseModule;->DEBUG:Z

    .line 1022
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x4

    const/4 v3, 0x6

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v0

    .line 1021
    sput-object v0, Lcom/android/camera/module/BaseModule;->CAMERA_MODES:[I

    .line 79
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput v1, p0, Lcom/android/camera/module/BaseModule;->mOrientationCompensation:I

    .line 108
    iput v2, p0, Lcom/android/camera/module/BaseModule;->mOrientation:I

    .line 109
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mDeviceRotation:F

    .line 112
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsCreated:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 113
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsDeparted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 114
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsFrameAvailable:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 117
    iput v1, p0, Lcom/android/camera/module/BaseModule;->mCameraState:I

    .line 190
    iput v3, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    .line 191
    iput v3, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    .line 214
    iput v2, p0, Lcom/android/camera/module/BaseModule;->mUIStyle:I

    .line 222
    iput v2, p0, Lcom/android/camera/module/BaseModule;->mDisplayRotation:I

    .line 233
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mTriggerMode:I

    .line 250
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/BaseModule;->mMainThreadId:J

    .line 251
    new-instance v0, Lcom/android/camera/preferences/SettingsOverrider;

    invoke-direct {v0}, Lcom/android/camera/preferences/SettingsOverrider;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    .line 252
    return-void
.end method

.method public static getJpegQuality(Z)I
    .locals 2
    .param p0, "burst"    # Z

    .prologue
    .line 1250
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getJpegQuality(Z)Ljava/lang/String;

    move-result-object v0

    .line 1251
    .local v0, "jpegQuality":Ljava/lang/String;
    invoke-static {v0}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public static getPreferencesLocalId(II)I
    .locals 1
    .param p0, "cameraId"    # I
    .param p1, "mode"    # I

    .prologue
    .line 771
    add-int v0, p0, p1

    return v0
.end method

.method private getTapableRectWithEdgeSlop()Landroid/graphics/Rect;
    .locals 11

    .prologue
    const/4 v10, -0x1

    .line 817
    new-instance v5, Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    invoke-direct {v5, v7}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 818
    .local v5, "rect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isVideoRecording()Z

    move-result v7

    if-nez v7, :cond_0

    .line 819
    iget v7, p0, Lcom/android/camera/module/BaseModule;->mUIStyle:I

    packed-switch v7, :pswitch_data_0

    .line 823
    :pswitch_0
    iget v7, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    const/16 v8, 0xa5

    if-ne v7, v8, :cond_0

    .line 824
    sget v7, Lcom/android/camera/Util;->sWindowHeight:I

    sget v8, Lcom/android/camera/CameraSettings;->BOTTOM_CONTROL_HEIGHT:I

    sub-int v1, v7, v8

    .line 825
    .local v1, "coverHeight":I
    sget v7, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v7, v7

    const/high16 v8, 0x3f400000    # 0.75f

    div-float/2addr v7, v8

    float-to-int v7, v7

    sget v8, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr v7, v8

    div-int/lit8 v0, v7, 0x2

    .line 827
    .local v0, "bottomCoverHeight":I
    sget v7, Lcom/android/camera/Util;->sWindowWidth:I

    .line 826
    sub-int v7, v1, v7

    sub-int v6, v7, v0

    .line 829
    .local v6, "topCoverHeight":I
    iput v6, v5, Landroid/graphics/Rect;->top:I

    .line 831
    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v7, v0

    iput v7, v5, Landroid/graphics/Rect;->bottom:I

    .line 844
    .end local v0    # "bottomCoverHeight":I
    .end local v1    # "coverHeight":I
    .end local v6    # "topCoverHeight":I
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v7}, Lcom/android/camera/Util;->calculateDefaultPreviewEdgeSlop(Landroid/content/Context;)I

    move-result v2

    .line 845
    .local v2, "defaultSlop":I
    const-string/jumbo v7, "camera_touch_edge_slop"

    invoke-static {v7, v10}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 847
    .local v4, "fromProp":I
    if-ne v4, v10, :cond_1

    .line 848
    move v3, v2

    .line 852
    .local v3, "edgeSlop":I
    :goto_1
    invoke-virtual {v5, v3, v3}, Landroid/graphics/Rect;->inset(II)V

    .line 853
    return-object v5

    .line 836
    .end local v2    # "defaultSlop":I
    .end local v3    # "edgeSlop":I
    .end local v4    # "fromProp":I
    :pswitch_1
    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    sget v8, Lcom/android/camera/CameraSettings;->BOTTOM_CONTROL_HEIGHT:I

    sget v9, Lcom/android/camera/Util;->sNavigationBarHeight:I

    sub-int/2addr v8, v9

    sub-int/2addr v7, v8

    iput v7, v5, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 840
    :pswitch_2
    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    sget v8, Lcom/android/camera/CameraSettings;->BOTTOM_CONTROL_HEIGHT:I

    sub-int/2addr v7, v8

    iput v7, v5, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 850
    .restart local v2    # "defaultSlop":I
    .restart local v4    # "fromProp":I
    :cond_1
    int-to-float v7, v4

    invoke-static {v7}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v3

    .restart local v3    # "edgeSlop":I
    goto :goto_1

    .line 819
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private initializeZoom()V
    .locals 3

    .prologue
    .line 717
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isZoomSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mZoomSupported:Z

    .line 718
    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mZoomSupported:Z

    if-eqz v0, :cond_0

    .line 719
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v0

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    .line 720
    const-string/jumbo v0, "BaseModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "zoomMaxRatio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 722
    :cond_0
    return-void
.end method

.method private onZoomValueChanged(F)Z
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 857
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/BaseModule;->onZoomValueChanged(FZ)Z

    move-result v0

    return v0
.end method

.method private onZoomValueChanged(FZ)Z
    .locals 8
    .param p1, "newValue"    # F
    .param p2, "sync"    # Z

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    .line 861
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 862
    const-string/jumbo v2, "BaseModule"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onZoomValueChanged isDeviceAlive() = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 863
    return v6

    .line 865
    :cond_0
    cmpg-float v2, p1, v3

    if-gez v2, :cond_2

    .line 866
    const/high16 p1, 0x3f800000    # 1.0f

    .line 871
    :cond_1
    :goto_0
    iget v2, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    cmpl-float v2, v2, p1

    if-nez v2, :cond_3

    .line 872
    return v6

    .line 867
    :cond_2
    iget v2, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    cmpl-float v2, p1, v2

    if-lez v2, :cond_1

    .line 868
    iget p1, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    goto :goto_0

    .line 876
    :cond_3
    iget v2, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_5

    .line 877
    cmpl-float v2, p1, v3

    if-nez v2, :cond_6

    const/4 v1, 0x1

    .line 880
    .local v1, "zoomStateChanged":Z
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->setZoomValue(F)V

    .line 882
    if-eqz v1, :cond_4

    .line 885
    const/16 v2, 0xb

    .line 886
    const/16 v3, 0x22

    .line 887
    const/16 v4, 0x1e

    .line 888
    const/16 v5, 0x14

    .line 884
    filled-new-array {v2, v3, v4, v5}, [I

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceTrampoline([I)V

    .line 896
    :cond_4
    new-array v2, v7, [I

    const/16 v3, 0x18

    aput v3, v2, v6

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 900
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 901
    const/16 v3, 0xb6

    .line 900
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 902
    .local v0, "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    if-eqz v0, :cond_7

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isZoomVisible()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 903
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->updateZoomValue()V

    .line 908
    :goto_2
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "zoom="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    return v7

    .line 876
    .end local v0    # "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    .end local v1    # "zoomStateChanged":Z
    :cond_5
    const/4 v1, 0x1

    .restart local v1    # "zoomStateChanged":Z
    goto :goto_1

    .line 877
    .end local v1    # "zoomStateChanged":Z
    :cond_6
    const/4 v1, 0x0

    .restart local v1    # "zoomStateChanged":Z
    goto :goto_1

    .line 905
    .restart local v0    # "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    :cond_7
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->updateStatusBar(I)V

    goto :goto_2
.end method

.method private setCreated(Z)V
    .locals 1
    .param p1, "created"    # Z

    .prologue
    .line 290
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsCreated:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 291
    return-void
.end method

.method private setIgnoreTouchEvent(Z)V
    .locals 0
    .param p1, "ignore"    # Z

    .prologue
    .line 466
    iput-boolean p1, p0, Lcom/android/camera/module/BaseModule;->mIgnoreTouchEvent:Z

    .line 467
    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1386
    check-cast p1, [I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->accept([I)V

    return-void
.end method

.method public accept([I)V
    .locals 1
    .param p1, "ints"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1388
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1389
    return-void

    .line 1392
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1393
    return-void

    .line 1396
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->consumePreference([I)V

    .line 1397
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1398
    return-void
.end method

.method protected addZoom(F)Z
    .locals 1
    .param p1, "add"    # F

    .prologue
    .line 735
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    add-float/2addr v0, p1

    invoke-direct {p0, v0}, Lcom/android/camera/module/BaseModule;->onZoomValueChanged(F)Z

    move-result v0

    return v0
.end method

.method protected changeConflictPreference()V
    .locals 5

    .prologue
    .line 1106
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1107
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->getSupportedSettingKeys()Ljava/util/List;

    move-result-object v3

    .line 1108
    .local v3, "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_2

    .line 1109
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1110
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "key$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1111
    .local v1, "key":Ljava/lang/String;
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isSwitchOn(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1112
    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 1115
    .end local v1    # "key":Ljava/lang/String;
    :cond_1
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1118
    .end local v0    # "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .end local v2    # "key$iterator":Ljava/util/Iterator;
    .end local v3    # "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    return-void
.end method

.method public checkActivityOrientation()V
    .locals 2

    .prologue
    .line 619
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/BaseModule;->mDisplayRotation:I

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 620
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 622
    :cond_0
    return-void
.end method

.method public checkDisplayOrientation()V
    .locals 3

    .prologue
    .line 625
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mDisplayRotation:I

    .line 626
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mDisplayRotation:I

    iget v1, p0, Lcom/android/camera/module/BaseModule;->mBogusCameraId:I

    invoke-static {v0, v1}, Lcom/android/camera/Util;->getDisplayOrientation(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mCameraDisplayOrientation:I

    .line 627
    const-string/jumbo v0, "BaseModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "checkDisplayOrientation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/BaseModule;->mDisplayRotation:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/BaseModule;->mCameraDisplayOrientation:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 632
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/BaseModule;->mDisplayRotation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->setDisplayOrientation(I)V

    .line 634
    :cond_0
    return-void
.end method

.method protected varargs consumePreference([I)V
    .locals 0
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .prologue
    .line 1281
    return-void
.end method

.method protected currentIsMainThread()Z
    .locals 4

    .prologue
    .line 454
    iget-wide v0, p0, Lcom/android/camera/module/BaseModule;->mMainThreadId:J

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public enableCameraControls(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 740
    xor-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/BaseModule;->setIgnoreTouchEvent(Z)V

    .line 741
    return-void
.end method

.method public enterMutexMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 753
    return-void
.end method

.method public exitMutexMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 748
    return-void
.end method

.method protected focusCenter()V
    .locals 0

    .prologue
    .line 1371
    return-void
.end method

.method public getActivity()Lcom/android/camera/Camera;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    return-object v0
.end method

.method public getActualCameraId()I
    .locals 1

    .prologue
    .line 1232
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mActualCameraId:I

    return v0
.end method

.method public getCameraCapabilities()Lcom/android/camera2/CameraCapabilities;
    .locals 1

    .prologue
    .line 1236
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    return-object v0
.end method

.method public getCameraDevice()Lcom/android/camera2/Camera2Proxy;
    .locals 1

    .prologue
    .line 1228
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    return-object v0
.end method

.method protected getCameraRotation()I
    .locals 1

    .prologue
    .line 983
    const/4 v0, 0x0

    return v0
.end method

.method protected getCameraState()I
    .locals 1

    .prologue
    .line 1298
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mCameraState:I

    return v0
.end method

.method protected getCropRegion()Landroid/graphics/Rect;
    .locals 11

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 1374
    iget-object v7, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v7}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v0

    .line 1375
    .local v0, "activeArraySize":Landroid/graphics/Rect;
    move-object v1, v0

    .line 1376
    .local v1, "activeRegion":Landroid/graphics/Rect;
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 1378
    .local v2, "cropRegion":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v7

    div-int/lit8 v3, v7, 0x2

    .line 1379
    .local v3, "xCenter":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    div-int/lit8 v5, v7, 0x2

    .line 1380
    .local v5, "yCenter":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    iget v8, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    mul-float/2addr v8, v9

    div-float/2addr v7, v8

    float-to-int v4, v7

    .line 1381
    .local v4, "xDelta":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    iget v8, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    mul-float/2addr v8, v9

    div-float/2addr v7, v8

    float-to-int v6, v7

    .line 1382
    .local v6, "yDelta":I
    sub-int v7, v3, v4

    sub-int v8, v5, v6

    add-int v9, v3, v4

    add-int v10, v5, v6

    invoke-virtual {v2, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 1383
    return-object v0
.end method

.method protected getJpegThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 6

    .prologue
    .line 1244
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedThumbnailSizes()Ljava/util/List;

    move-result-object v0

    .line 1246
    .local v0, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    int-to-double v2, v1

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    int-to-double v4, v1

    div-double/2addr v2, v4

    .line 1245
    invoke-static {v0, v2, v3}, Lcom/android/camera/Util;->getOptimalJpegThumbnailSize(Ljava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v1

    return-object v1
.end method

.method public getModuleIndex()I
    .locals 1

    .prologue
    .line 173
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    return v0
.end method

.method public getMutexModePicker()Lcom/android/camera/MutexModeManager;
    .locals 1

    .prologue
    .line 758
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    return-object v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 1240
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 1

    .prologue
    .line 665
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method protected getScreenDelay()I
    .locals 1

    .prologue
    .line 1025
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1026
    :cond_0
    const/16 v0, 0x7530

    .line 1025
    :goto_0
    return v0

    .line 1026
    :cond_1
    const v0, 0xea60

    goto :goto_0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 661
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedSettingKeys()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 476
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method protected getTriggerMode()I
    .locals 1

    .prologue
    .line 1206
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mTriggerMode:I

    return v0
.end method

.method public getWindow()Landroid/view/Window;
    .locals 1

    .prologue
    .line 669
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method public getZoomMaxRatio()F
    .locals 1

    .prologue
    .line 929
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    return v0
.end method

.method protected getZoomValue()F
    .locals 1

    .prologue
    .line 925
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    return v0
.end method

.method protected handleVolumeKeyEvent(ZZI)Z
    .locals 7
    .param p1, "up"    # Z
    .param p2, "pressed"    # Z
    .param p3, "repeatCount"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 673
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 674
    return v5

    .line 676
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 677
    const-string/jumbo v3, "pref_camera_volumekey_function_key"

    .line 678
    const v4, 0x7f0f00fd

    invoke-virtual {p0, v4}, Lcom/android/camera/module/BaseModule;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 676
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 679
    .local v0, "function":Ljava/lang/String;
    const v2, 0x7f0f00fb

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 680
    invoke-virtual {p0, p3, p2}, Lcom/android/camera/module/BaseModule;->performVolumeKeyClicked(IZ)V

    .line 681
    return v5

    .line 682
    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPanoramaModule()Z

    move-result v2

    if-nez v2, :cond_5

    .line 683
    const v2, 0x7f0f00fc

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 682
    if-eqz v2, :cond_5

    .line 686
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isZoomSupported()Z

    move-result v2

    if-eqz v2, :cond_5

    if-eqz p2, :cond_5

    .line 688
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isZoomEnabled()Z

    move-result v2

    if-nez v2, :cond_2

    .line 689
    return v5

    .line 692
    :cond_2
    if-eqz p1, :cond_4

    .line 693
    const v2, 0x3dcccccd    # 0.1f

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->addZoom(F)Z

    move-result v1

    .line 697
    .local v1, "zoomChanged":Z
    :goto_0
    if-nez p3, :cond_3

    if-eqz v1, :cond_3

    .line 698
    const-string/jumbo v2, "\u97f3\u91cf\u952e"

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackZoomAdjusted(Ljava/lang/String;)V

    .line 700
    :cond_3
    return v5

    .line 695
    .end local v1    # "zoomChanged":Z
    :cond_4
    const v2, -0x42333333    # -0.1f

    invoke-virtual {p0, v2}, Lcom/android/camera/module/BaseModule;->addZoom(F)Z

    move-result v1

    .restart local v1    # "zoomChanged":Z
    goto :goto_0

    .line 703
    .end local v1    # "zoomChanged":Z
    :cond_5
    return v6
.end method

.method protected hasCameraException()Z
    .locals 1

    .prologue
    .line 574
    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mCameraDisabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mOpenCameraFail:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mCameraHardwareError:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected hideTipMessage(I)V
    .locals 3
    .param p1, "tokenResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 1136
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1137
    const/16 v2, 0xaf

    .line 1136
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1138
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    if-eqz v0, :cond_1

    if-lez p1, :cond_0

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->containTips(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1139
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 1141
    :cond_1
    return-void
.end method

.method protected initializeCapabilities()V
    .locals 1

    .prologue
    .line 707
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isAELockSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mAeLockSupported:Z

    .line 708
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isAWBLockSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mAwbLockSupported:Z

    .line 709
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isAFRegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mFocusAreaSupported:Z

    .line 710
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isAERegionSupported()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mMeteringAreaSupported:Z

    .line 711
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxFaceCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mMaxFaceCount:I

    .line 712
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;->initializeZoom()V

    .line 714
    return-void
.end method

.method public isAlive()Z
    .locals 1

    .prologue
    .line 1401
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final isBackCamera()Z
    .locals 2

    .prologue
    .line 779
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mBogusCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCreated()Z
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsCreated:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isDeparted()Z
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsDeparted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isDeviceAlive()Z
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 1410
    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    .line 1411
    :goto_0
    if-nez v0, :cond_0

    .line 1412
    const-string/jumbo v3, "device: %s module: %s|%s"

    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/Object;

    .line 1413
    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_2

    const-string/jumbo v2, "valid"

    :goto_1
    const/4 v5, 0x0

    aput-object v2, v4, v5

    .line 1414
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isCreated()Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "created"

    :goto_2
    aput-object v2, v4, v6

    .line 1415
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "departed"

    :goto_3
    const/4 v5, 0x2

    aput-object v2, v4, v5

    .line 1412
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1416
    .local v1, "msg":Ljava/lang/String;
    sget-boolean v2, Lcom/android/camera/module/BaseModule;->DEBUG:Z

    if-eqz v2, :cond_5

    .line 1417
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/RuntimeException;->printStackTrace()V

    .line 1422
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    :goto_4
    return v0

    .line 1410
    :cond_1
    const/4 v0, 0x0

    .local v0, "alive":Z
    goto :goto_0

    .line 1413
    .end local v0    # "alive":Z
    :cond_2
    const-string/jumbo v2, "invalid"

    goto :goto_1

    .line 1414
    :cond_3
    const-string/jumbo v2, "destroyed"

    goto :goto_2

    .line 1415
    :cond_4
    const-string/jumbo v2, "alive"

    goto :goto_3

    .line 1419
    .restart local v1    # "msg":Ljava/lang/String;
    :cond_5
    const-string/jumbo v2, "BaseModule"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6}, Lcom/android/camera/Util;->getCallers(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method protected final isDualCamera()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 783
    iget v1, p0, Lcom/android/camera/module/BaseModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMuxCameraId()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 784
    iget v1, p0, Lcom/android/camera/module/BaseModule;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehCameraId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 783
    :cond_0
    :goto_0
    return v0

    .line 784
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFrameAvailable()Z
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsFrameAvailable:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method protected final isFrontCamera()Z
    .locals 2

    .prologue
    .line 775
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mBogusCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isIgnoreTouchEvent()Z
    .locals 1

    .prologue
    .line 471
    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mIgnoreTouchEvent:Z

    return v0
.end method

.method public isInTapableRect(II)Z
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 795
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 796
    const/4 v0, 0x0

    return v0

    .line 799
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;->getTapableRectWithEdgeSlop()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    return v0
.end method

.method public isKeptBitmapTexture()Z
    .locals 1

    .prologue
    .line 1007
    const/4 v0, 0x0

    return v0
.end method

.method public isMeteringAreaOnly()Z
    .locals 1

    .prologue
    .line 970
    const/4 v0, 0x0

    return v0
.end method

.method public isNeedMute()Z
    .locals 1

    .prologue
    .line 950
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isShowAeAfLockIndicator()Z
    .locals 1

    .prologue
    .line 960
    const/4 v0, 0x0

    return v0
.end method

.method public isShowCaptureButton()Z
    .locals 1

    .prologue
    .line 955
    const/4 v0, 0x0

    return v0
.end method

.method protected isSquareModeChange()Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1121
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v3

    .line 1122
    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderTargetRatio()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_0

    move v2, v0

    .line 1121
    :goto_0
    if-eq v3, v2, :cond_1

    :goto_1
    return v0

    :cond_0
    move v2, v1

    .line 1122
    goto :goto_0

    :cond_1
    move v0, v1

    .line 1121
    goto :goto_1
.end method

.method public isSupportFocusShoot()Z
    .locals 1

    .prologue
    .line 965
    const/4 v0, 0x0

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .prologue
    .line 445
    const/4 v0, 0x0

    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    .prologue
    .line 505
    const/4 v0, 0x1

    return v0
.end method

.method protected isZoomSupported()Z
    .locals 1

    .prologue
    .line 509
    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mZoomSupported:Z

    return v0
.end method

.method protected mapTapCoordinate(Ljava/lang/Object;)V
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 805
    instance-of v0, p1, Landroid/graphics/Point;

    if-eqz v0, :cond_1

    move-object v0, p1

    .line 806
    check-cast v0, Landroid/graphics/Point;

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 807
    check-cast p1, Landroid/graphics/Point;

    .end local p1    # "object":Ljava/lang/Object;
    iget v0, p1, Landroid/graphics/Point;->y:I

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 814
    :cond_0
    :goto_0
    return-void

    .line 808
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 809
    check-cast v0, Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    move-object v0, p1

    .line 810
    check-cast v0, Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    move-object v0, p1

    .line 811
    check-cast v0, Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 812
    check-cast p1, Landroid/graphics/RectF;

    .end local p1    # "object":Ljava/lang/Object;
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_0
.end method

.method public notifyDualZoom(Z)V
    .locals 1
    .param p1, "isTo2X"    # Z

    .prologue
    .line 385
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 386
    return-void

    .line 389
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p1}, Lcom/android/camera2/Camera2Proxy;->setOpticalZoomToTele(Z)V

    .line 390
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 391
    return-void
.end method

.method public notifyError()V
    .locals 1

    .prologue
    .line 934
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mCameraHardwareError:Z

    .line 935
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/BaseModule;->setCameraState(I)V

    .line 940
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_0

    .line 941
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->onCameraException()V

    .line 945
    :goto_0
    return-void

    .line 943
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V

    goto :goto_0
.end method

.method public notifyZooming(Z)V
    .locals 0
    .param p1, "started"    # Z

    .prologue
    .line 380
    iput-boolean p1, p0, Lcom/android/camera/module/BaseModule;->isZooming:Z

    .line 381
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 595
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 440
    const/4 v0, 0x0

    return v0
.end method

.method public onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1407
    return-void
.end method

.method protected onCameraException()V
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 527
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->currentIsMainThread()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 528
    const-string/jumbo v1, "BaseModule"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onCameraException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/BaseModule;->mBogusCameraId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isRetriedIfCameraError()Z

    move-result v0

    .line 530
    .local v0, "retried":Z
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 531
    const-string/jumbo v1, "BaseModule"

    const-string/jumbo v2, "onCameraException: retry1"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setRetriedIfCameraError(Z)V

    .line 533
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    iget v2, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    invoke-static {v2}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 537
    return-void

    .line 541
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/module/BaseModule;->mOpenCameraFail:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/android/camera/module/BaseModule;->mCameraHardwareError:Z

    if-eqz v1, :cond_3

    .line 542
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/android/camera/module/BaseModule;->mOpenCameraFail:Z

    if-eqz v1, :cond_3

    .line 543
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->couldShowErrorDialog()Z

    move-result v1

    .line 542
    if-eqz v1, :cond_3

    .line 545
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1, v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->setRetriedIfCameraError(Z)V

    .line 547
    iget-object v2, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    .line 548
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/Util;->isInVideoCall(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 549
    const v1, 0x7f0f018c

    .line 547
    :goto_0
    invoke-static {v2, v1}, Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V

    .line 553
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->showErrorDialog()V

    .line 557
    :cond_3
    iget-boolean v1, p0, Lcom/android/camera/module/BaseModule;->mCameraDisabled:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->couldShowErrorDialog()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 558
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1, v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->setRetriedIfCameraError(Z)V

    .line 560
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    .line 561
    const v2, 0x7f0f0007

    .line 560
    invoke-static {v1, v2}, Lcom/android/camera/Util;->showErrorAndFinish(Landroid/app/Activity;I)V

    .line 562
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->showErrorDialog()V

    .line 567
    .end local v0    # "retried":Z
    :cond_4
    :goto_1
    return-void

    .line 550
    .restart local v0    # "retried":Z
    :cond_5
    invoke-static {}, Lcom/android/camera/CameraSettings;->updateOpenCameraFailTimes()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    cmp-long v1, v4, v6

    if-lez v1, :cond_6

    .line 551
    const v1, 0x7f0f0006

    goto :goto_0

    .line 552
    :cond_6
    const v1, 0x7f0f0005

    goto :goto_0

    .line 565
    .end local v0    # "retried":Z
    :cond_7
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->sendOpenFailMessage()V

    goto :goto_1
.end method

.method public onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V
    .locals 6
    .param p1, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 1071
    invoke-static {}, Lcom/android/camera/Device;->isSupportLensDirtyDetect()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1072
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->isLensDirtyDetected(Landroid/hardware/camera2/CaptureResult;)Z

    move-result v0

    .line 1073
    .local v0, "dirty":Z
    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLensDirtyDetectEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1074
    invoke-static {}, Lcom/android/camera/CameraSettings;->shouldShowLensDirtyDetectHint()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1075
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->showLensDirtyDetectedHint()V

    .line 1077
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v1, :cond_1

    .line 1078
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1080
    :cond_1
    invoke-static {}, Lio/reactivex/Completable;->complete()Lio/reactivex/Completable;

    move-result-object v1

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    new-instance v2, Lcom/android/camera/module/BaseModule$3;

    invoke-direct {v2, p0}, Lcom/android/camera/module/BaseModule$3;-><init>(Lcom/android/camera/module/BaseModule;)V

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->doOnComplete(Lio/reactivex/functions/Action;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 1087
    invoke-static {}, Lio/reactivex/Completable;->complete()Lio/reactivex/Completable;

    move-result-object v1

    .line 1088
    const-wide/16 v2, 0x1f40

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v5, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 1087
    invoke-virtual {v1, v2, v3, v4, v5}, Lio/reactivex/Completable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    .line 1089
    new-instance v2, Lcom/android/camera/module/BaseModule$4;

    invoke-direct {v2, p0}, Lcom/android/camera/module/BaseModule$4;-><init>(Lcom/android/camera/module/BaseModule;)V

    .line 1087
    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->doOnComplete(Lio/reactivex/functions/Action;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectHintDisposable:Lio/reactivex/disposables/Disposable;

    .line 1099
    .end local v0    # "dirty":Z
    :cond_2
    return-void
.end method

.method protected onCameraOpened()V
    .locals 1

    .prologue
    .line 1060
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 1065
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 1066
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/BaseModule;->updateLensDirtyDetect(Z)V

    .line 1067
    return-void
.end method

.method public onCreate(II)V
    .locals 5
    .param p1, "moduleIndex"    # I
    .param p2, "cameraId"    # I

    .prologue
    .line 256
    const-string/jumbo v0, "BaseModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onCreate moduleIndex->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", cameraId->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    .line 258
    iput p2, p0, Lcom/android/camera/module/BaseModule;->mBogusCameraId:I

    .line 259
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mContentResolver:Landroid/content/ContentResolver;

    .line 260
    new-instance v0, Lcom/android/camera/CameraErrorCallbackImpl;

    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-direct {v0, v1}, Lcom/android/camera/CameraErrorCallbackImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    .line 262
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 263
    const/16 v1, 0xa6

    .line 262
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 265
    new-instance v0, Lcom/android/camera/MutexModeManager;

    invoke-direct {v0, p0}, Lcom/android/camera/MutexModeManager;-><init>(Lcom/android/camera/MutexModeManager$MutexCallBack;)V

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    .line 267
    new-instance v0, Lcom/android/camera/module/BaseModule$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/BaseModule$1;-><init>(Lcom/android/camera/module/BaseModule;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    .line 272
    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 267
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

    .line 274
    invoke-static {}, Lcom/android/camera/Device;->isSupportLensDirtyDetect()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLensDirtyDetectEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    invoke-static {}, Lio/reactivex/Completable;->complete()Lio/reactivex/Completable;

    move-result-object v0

    .line 276
    const-wide/16 v2, 0x3a98

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 275
    invoke-virtual {v0, v2, v3, v1, v4}, Lio/reactivex/Completable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    .line 277
    new-instance v1, Lcom/android/camera/module/BaseModule$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/BaseModule$2;-><init>(Lcom/android/camera/module/BaseModule;)V

    .line 275
    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->doOnComplete(Lio/reactivex/functions/Action;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    .line 286
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/BaseModule;->setCreated(Z)V

    .line 287
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 308
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/BaseModule;->setCreated(Z)V

    .line 309
    const-string/jumbo v0, "BaseModule"

    const-string/jumbo v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    return-void
.end method

.method public onEvChanged(II)V
    .locals 3
    .param p1, "value"    # I
    .param p2, "state"    # I

    .prologue
    const/4 v1, 0x1

    .line 334
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 335
    return-void

    .line 337
    :cond_0
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mEvValue:I

    .line 338
    iput p2, p0, Lcom/android/camera/module/BaseModule;->mEvState:I

    .line 340
    if-ne p2, v1, :cond_1

    .line 341
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->writeExposure(I)V

    .line 342
    invoke-virtual {p0, v1}, Lcom/android/camera/module/BaseModule;->updateStatusBar(I)V

    .line 345
    :cond_1
    new-array v0, v1, [I

    const/16 v1, 0xc

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    .line 347
    return-void
.end method

.method public onGestureTrack(Landroid/graphics/RectF;Z)Z
    .locals 1
    .param p1, "rectF"    # Landroid/graphics/RectF;
    .param p2, "up"    # Z

    .prologue
    .line 999
    const/4 v0, 0x1

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 314
    const/4 v0, 0x0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 459
    const/16 v0, 0x52

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 460
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->openSettingActivity()V

    .line 462
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 585
    return-void
.end method

.method public onOrientationChanged(II)V
    .locals 3
    .param p1, "orientation"    # I
    .param p2, "orientationCompensation"    # I

    .prologue
    .line 602
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 603
    return-void

    .line 606
    :cond_0
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mOrientation:I

    .line 607
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    .line 608
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    iget v2, p0, Lcom/android/camera/module/BaseModule;->mOrientation:I

    invoke-static {v1, v2}, Lcom/android/camera/Util;->getShootOrientation(Landroid/app/Activity;I)I

    move-result v1

    .line 607
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->setOrientation(I)V

    .line 609
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->checkActivityOrientation()V

    .line 613
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mOrientationCompensation:I

    if-eq v0, p2, :cond_1

    .line 614
    iput p2, p0, Lcom/android/camera/module/BaseModule;->mOrientationCompensation:I

    .line 616
    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 414
    const-string/jumbo v0, "BaseModule"

    const-string/jumbo v1, "onPause"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mPaused:Z

    .line 416
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 417
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    .line 418
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 420
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectHintDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 421
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectHintDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 423
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getMetaDataCallback()Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    move-result-object v0

    if-ne v0, p0, :cond_2

    .line 424
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 426
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_3

    .line 427
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->hideLensDirtyDetectedHint()V

    .line 429
    :cond_3
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 1290
    return-void
.end method

.method public onPreviewPixelsRead([BII)V
    .locals 0
    .param p1, "pixels"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 590
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 1294
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 408
    const-string/jumbo v0, "BaseModule"

    const-string/jumbo v1, "onResume"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mPaused:Z

    .line 410
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 1030
    const-string/jumbo v0, "killed-moduleIndex"

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1031
    return-void
.end method

.method public onScale(FFF)Z
    .locals 3
    .param p1, "focusX"    # F
    .param p2, "focusY"    # F
    .param p3, "scale"    # F

    .prologue
    .line 487
    const-string/jumbo v0, "BaseModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "isZoomEnabled() = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isZoomEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 489
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mZoomScaled:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v1, p3, v1

    const/high16 v2, 0x40800000    # 4.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mZoomScaled:F

    .line 490
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mZoomScaled:F

    invoke-virtual {p0, v0}, Lcom/android/camera/module/BaseModule;->scaleZoomValue(F)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mZoomScaled:F

    .line 492
    const/4 v0, 0x1

    return v0

    .line 496
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onScaleBegin(FF)Z
    .locals 1
    .param p1, "focusX"    # F
    .param p2, "focusY"    # F

    .prologue
    .line 481
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mZoomScaled:F

    .line 482
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleEnd()V
    .locals 0

    .prologue
    .line 502
    return-void
.end method

.method public onSharedPreferenceChanged()V
    .locals 0

    .prologue
    .line 648
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 996
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 644
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 433
    if-eqz p1, :cond_0

    .line 434
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/BaseModule;->mIgnoreFocusChanged:Z

    .line 436
    :cond_0
    return-void
.end method

.method public onZoomRatioChanged(FZ)V
    .locals 0
    .param p1, "newRatio"    # F
    .param p2, "sync"    # Z

    .prologue
    .line 395
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onZoomValueChanged(FZ)Z

    .line 396
    return-void
.end method

.method protected openCamera()V
    .locals 0

    .prologue
    .line 178
    return-void
.end method

.method protected abstract openSettingActivity()V
.end method

.method protected performVolumeKeyClicked(IZ)V
    .locals 0
    .param p1, "repeatCount"    # I
    .param p2, "pressed"    # Z

    .prologue
    .line 988
    return-void
.end method

.method protected playCameraSound(I)V
    .locals 1
    .param p1, "soundId"    # I

    .prologue
    .line 762
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 763
    :cond_0
    return-void

    .line 765
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 766
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->playCameraSound(I)V

    .line 768
    :cond_2
    return-void
.end method

.method public preTransferOrientation(II)V
    .locals 0
    .param p1, "orientation"    # I
    .param p2, "orientationCompensation"    # I

    .prologue
    .line 652
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mOrientation:I

    .line 653
    iput p2, p0, Lcom/android/camera/module/BaseModule;->mOrientationCompensation:I

    .line 654
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    .prologue
    .line 321
    const-string/jumbo v0, "BaseModule"

    const-string/jumbo v1, "registerProtocol"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaa

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 323
    return-void
.end method

.method public requestRender()V
    .locals 0

    .prologue
    .line 580
    return-void
.end method

.method public resetEvValue()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 367
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 368
    return-void

    .line 370
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setExposureCompensation(I)V

    .line 371
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 372
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetExposure()V

    .line 375
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 376
    return-void
.end method

.method public resetMutexModeManually()V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 1187
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->resetMutexMode()V

    .line 1188
    return-void
.end method

.method protected final restartModule()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1430
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    iget v1, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    invoke-static {v1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureView(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/android/camera/module/loader/StartControl;->setNeedReConfigureCamera(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 1435
    return-void
.end method

.method protected restoreBottom()V
    .locals 4
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 1174
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1175
    const/16 v3, 0xa0

    .line 1174
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 1176
    .local v1, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1177
    const/16 v3, 0xab

    .line 1176
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1178
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    .line 1179
    const v2, 0x7f0a009c

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v2

    .line 1180
    const/16 v3, 0xf1

    .line 1179
    if-eq v2, v3, :cond_0

    .line 1181
    const/4 v2, 0x7

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 1183
    :cond_0
    return-void
.end method

.method public scaleZoomValue(F)Z
    .locals 3
    .param p1, "contrast"    # F

    .prologue
    .line 519
    iget v1, p0, Lcom/android/camera/module/BaseModule;->mZoomMaxRatio:F

    mul-float v0, v1, p1

    .line 520
    .local v0, "delta":F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x3c23d70a    # 0.01f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 521
    const/4 v1, 0x0

    return v1

    .line 523
    :cond_0
    iget v1, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    add-float/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/android/camera/module/BaseModule;->onZoomValueChanged(F)Z

    move-result v1

    return v1
.end method

.method protected sendOpenFailMessage()V
    .locals 0

    .prologue
    .line 571
    return-void
.end method

.method protected setAWBMode(Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 1349
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1350
    return-void

    .line 1352
    :cond_0
    const-string/jumbo v1, "manual"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1353
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBMode(I)V

    .line 1354
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getKValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setCustomAWB(I)V

    .line 1363
    :goto_0
    return-void

    .line 1356
    :cond_1
    invoke-static {p1, v2}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 1357
    .local v0, "awbMode":I
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedAWBModes()[I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1358
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAWBMode(I)V

    goto :goto_0

    .line 1360
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBMode(I)V

    goto :goto_0
.end method

.method public setActivity(Lcom/android/camera/Camera;)V
    .locals 0
    .param p1, "activity"    # Lcom/android/camera/Camera;

    .prologue
    .line 246
    iput-object p1, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    .line 247
    return-void
.end method

.method public setCameraDevice(Lcom/android/camera2/Camera2Proxy;)V
    .locals 1
    .param p1, "cameraDevice"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 1222
    iput-object p1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1223
    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->getCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 1224
    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/BaseModule;->mActualCameraId:I

    .line 1225
    return-void
.end method

.method protected setCameraState(I)V
    .locals 3
    .param p1, "newState"    # I

    .prologue
    .line 1302
    const-string/jumbo v0, "BaseModule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setCameraState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1303
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mCameraState:I

    .line 1304
    return-void
.end method

.method public setDeparted()V
    .locals 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 142
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectHintDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_2

    .line 143
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mLensDirtyDetectHintDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 145
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_3

    .line 146
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->hideLensDirtyDetectedHint()V

    .line 148
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsDeparted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 149
    return-void
.end method

.method public setDisplayRectAndUIStyle(Landroid/graphics/Rect;I)V
    .locals 0
    .param p1, "displayRect"    # Landroid/graphics/Rect;
    .param p2, "uiStyle"    # I

    .prologue
    .line 1284
    iput-object p1, p0, Lcom/android/camera/module/BaseModule;->mDisplayRect:Landroid/graphics/Rect;

    .line 1285
    iput p2, p0, Lcom/android/camera/module/BaseModule;->mUIStyle:I

    .line 1286
    return-void
.end method

.method protected final setEvValue()V
    .locals 3
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 351
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 352
    return-void

    .line 355
    :cond_0
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mEvState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 356
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 362
    :cond_1
    :goto_0
    return-void

    .line 357
    :cond_2
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mEvState:I

    if-ne v0, v2, :cond_1

    .line 358
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/BaseModule;->mEvValue:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setExposureCompensation(I)V

    .line 359
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    goto :goto_0
.end method

.method protected setFlashMode(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1329
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1330
    return-void

    .line 1332
    :cond_0
    const-string/jumbo v1, "BaseModule"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "flashMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1333
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 1334
    .local v0, "flashMode":I
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isOptimizedFlashEnable()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setOptimizedFlash(Z)V

    .line 1335
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFlashMode(I)V

    .line 1336
    return-void
.end method

.method protected setFocusMode(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1339
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1340
    return-void

    .line 1342
    :cond_0
    invoke-static {p1}, Lcom/android/camera/constant/AutoFocus;->convertToFocusMode(Ljava/lang/String;)I

    move-result v0

    .line 1343
    .local v0, "focusMode":I
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1344
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1346
    :cond_1
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 1
    .param p1, "available"    # Z

    .prologue
    .line 127
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mIsFrameAvailable:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 128
    return-void
.end method

.method protected setTriggerMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 1210
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mTriggerMode:I

    .line 1211
    return-void
.end method

.method protected setZoomRatio(F)V
    .locals 1
    .param p1, "zoomRatio"    # F

    .prologue
    .line 1366
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p1}, Lcom/android/camera2/Camera2Proxy;->setZoomRatio(F)V

    .line 1367
    return-void
.end method

.method protected setZoomValue(F)V
    .locals 0
    .param p1, "value"    # F
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .prologue
    .line 920
    iput p1, p0, Lcom/android/camera/module/BaseModule;->mZoomValue:F

    .line 921
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->writeZoom(F)V

    .line 922
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    .prologue
    .line 450
    const/4 v0, 0x0

    return v0
.end method

.method trackGeneralInfo(IZ)V
    .locals 7
    .param p1, "takenNum"    # I
    .param p2, "isBurst"    # Z

    .prologue
    .line 1191
    iget v2, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->getTriggerMode()I

    move-result v3

    .line 1192
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isFrontCamera()Z

    move-result v4

    iget-object v5, p0, Lcom/android/camera/module/BaseModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    iget-object v6, p0, Lcom/android/camera/module/BaseModule;->mFlashAutoModeState:Ljava/lang/String;

    move v0, p1

    move v1, p2

    .line 1191
    invoke-static/range {v0 .. v6}, Lcom/android/camera/statistic/CameraStatUtil;->trackGeneralInfo(IZIIZLcom/android/camera/MutexModeManager;Ljava/lang/String;)V

    .line 1193
    return-void
.end method

.method protected trackModeCustomInfo(I)V
    .locals 0
    .param p1, "takenNum"    # I

    .prologue
    .line 1202
    return-void
.end method

.method trackPictureTaken(IZZ)V
    .locals 2
    .param p1, "takenNum"    # I
    .param p2, "burst"    # Z
    .param p3, "location"    # Z

    .prologue
    .line 1196
    iget v0, p0, Lcom/android/camera/module/BaseModule;->mModuleIndex:I

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isFrontCamera()Z

    move-result v1

    invoke-static {p1, p2, v0, v1, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTaken(IZIZZ)V

    .line 1197
    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->trackModeCustomInfo(I)V

    .line 1198
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 327
    const-string/jumbo v0, "BaseModule"

    const-string/jumbo v1, "unRegisterProtocol"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaa

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 329
    return-void
.end method

.method protected updateAntiBanding(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1144
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1145
    return-void

    .line 1147
    :cond_0
    const/4 v1, 0x3

    invoke-static {p1, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 1149
    .local v0, "antiBandingMode":I
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedAntiBandingModes()[I

    move-result-object v1

    .line 1148
    invoke-static {v0, v1}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1150
    const-string/jumbo v1, "BaseModule"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "antiBanding: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1151
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setAntiBanding(I)V

    .line 1153
    :cond_1
    return-void
.end method

.method protected updateCameraScreenNailSize(II)V
    .locals 3
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    .line 1042
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 1043
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "updateCameraScreenNailSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1042
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1045
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 1046
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_3

    .line 1049
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    .line 1054
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getActiveIndicator()I

    move-result v0

    const/4 v1, 0x3

    if-ne v1, v0, :cond_2

    .line 1055
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewSize(II)V

    .line 1057
    :cond_2
    return-void

    .line 1047
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isSquareModeChange()Z

    move-result v0

    .line 1045
    if-eqz v0, :cond_1

    goto :goto_0
.end method

.method protected final updateExposureMeteringMode()V
    .locals 2

    .prologue
    .line 1156
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1157
    return-void

    .line 1159
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getExposureMeteringMode()I

    move-result v0

    .line 1160
    .local v0, "mode":I
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setExposureMeteringMode(I)V

    .line 1161
    return-void
.end method

.method protected updateLensDirtyDetect(Z)V
    .locals 2
    .param p1, "resumePreview"    # Z

    .prologue
    .line 1307
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1308
    return-void

    .line 1310
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLensDirtyDetectEnabled()Z

    move-result v0

    .line 1311
    .local v0, "enable":Z
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setLensDirtyDetect(Z)V

    .line 1312
    if-eqz p1, :cond_1

    .line 1313
    iget-object v1, p0, Lcom/android/camera/module/BaseModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1315
    :cond_1
    return-void
.end method

.method public final varargs updatePreferenceInWorkThread([I)V
    .locals 1
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    .prologue
    .line 1262
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1263
    return-void

    .line 1266
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule;->mUpdateWorkThreadEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1267
    return-void
.end method

.method public final varargs updatePreferenceTrampoline([I)V
    .locals 0
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .prologue
    .line 1276
    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->consumePreference([I)V

    .line 1277
    return-void
.end method

.method protected updateStatusBar(I)V
    .locals 3
    .param p1, "type"    # I

    .prologue
    .line 914
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 915
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertUpdateValue(I)V

    .line 916
    return-void
.end method

.method protected updateTipMessage(III)V
    .locals 3
    .param p1, "tipType"    # I
    .param p2, "stringResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "duration"    # I

    .prologue
    .line 1129
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1130
    const/16 v2, 0xaf

    .line 1129
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1131
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 1132
    return-void
.end method
