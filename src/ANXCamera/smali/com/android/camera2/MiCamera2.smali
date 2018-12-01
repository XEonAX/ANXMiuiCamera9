.class public Lcom/android/camera2/MiCamera2;
.super Lcom/android/camera2/Camera2Proxy;
.source "MiCamera2.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;,
        Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;,
        Lcom/android/camera2/MiCamera2$PictureCaptureCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static final ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;


# instance fields
.field private mCameraDevice:Landroid/hardware/camera2/CameraDevice;

.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraMainThreadHandler:Landroid/os/Handler;

.field private mCapabilities:Lcom/android/camera2/CameraCapabilities;

.field private mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

.field private mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field private mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

.field private mConfigs:Lcom/android/camera2/CameraConfigs;

.field private mDepthReader:Landroid/media/ImageReader;

.field private mDisplayOrientation:I

.field private mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

.field private mHelperHandler:Landroid/os/Handler;

.field private mHighSpeedFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsPreviewCallbackEnabled:Z

.field private mIsPreviewCallbackStarted:Z

.field private mLockRequestHashCode:I

.field private final mObjLock:Ljava/lang/Object;

.field private mOpenState:I

.field private volatile mPendingNotifyVideoEnd:Z

.field private mPhotoImageReader:Landroid/media/ImageReader;

.field private mPortraitRawImageReader:Landroid/media/ImageReader;

.field private mPrecaptureRequestHashCode:I

.field private mPreviewImageReader:Landroid/media/ImageReader;

.field private mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

.field private mPreviewSurface:Landroid/view/Surface;

.field private mRawImageReader:Landroid/media/ImageReader;

.field private mRecordSurface:Landroid/view/Surface;

.field private mScreenLightColorTemperature:I

.field private mSessionId:I

.field private mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

.field private mVideoSessionId:I

.field private mVideoSnapshotImageReader:Landroid/media/ImageReader;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2$PictureCaptureCallback;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    return-object v0
.end method

.method static synthetic -get10(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    return-object v0
.end method

.method static synthetic -get11(Lcom/android/camera2/MiCamera2;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    return v0
.end method

.method static synthetic -get12(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    return-object v0
.end method

.method static synthetic -get13(Lcom/android/camera2/MiCamera2;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSessionId:I

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/CameraConfigs;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera2/MiCamera2;)Lcom/android/camera/effect/FaceAnalyzeInfo;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera2/MiCamera2;)Landroid/os/Handler;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera2/MiCamera2;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mLockRequestHashCode:I

    return v0
.end method

.method static synthetic -get7(Lcom/android/camera2/MiCamera2;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get8(Lcom/android/camera2/MiCamera2;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mPendingNotifyVideoEnd:Z

    return v0
.end method

.method static synthetic -get9(Lcom/android/camera2/MiCamera2;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mPrecaptureRequestHashCode:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "-value"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera2/MiCamera2;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera2/MiCamera2;->mLockRequestHashCode:I

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera2/MiCamera2;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mPendingNotifyVideoEnd:Z

    return p1
.end method

.method static synthetic -set3(Lcom/android/camera2/MiCamera2;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera2/MiCamera2;->mPrecaptureRequestHashCode:I

    return p1
.end method

.method static synthetic -set4(Lcom/android/camera2/MiCamera2;Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "-value"    # Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    .prologue
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/camera2/MiCamera2;Landroid/media/Image;)[B
    .locals 1
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "image"    # Landroid/media/Image;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/camera2/MiCamera2;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->getExposureTime()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic -wrap2(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera2/MiCamera2;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->captureStillPicture()V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/camera2/MiCamera2;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "succeed"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/camera2/MiCamera2;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->runPrecaptureSequence()V

    return-void
.end method

.method static synthetic -wrap7(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;
    .param p1, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->updateFaceInfo(Landroid/hardware/camera2/CaptureResult;)V

    return-void
.end method

.method static synthetic -wrap8(Lcom/android/camera2/MiCamera2;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera2/MiCamera2;

    .prologue
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->waitFlashClosed()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 73
    const-class v0, Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    .line 76
    const/4 v0, 0x1

    new-array v6, v0, [Landroid/hardware/camera2/params/MeteringRectangle;

    new-instance v0, Landroid/hardware/camera2/params/MeteringRectangle;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(IIIII)V

    aput-object v0, v6, v1

    .line 75
    sput-object v6, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/hardware/camera2/CameraDevice;ILcom/android/camera2/CameraCapabilities;Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 1
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "id"    # I
    .param p3, "cc"    # Lcom/android/camera2/CameraCapabilities;
    .param p4, "handler"    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "mainThreadHandler"    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 127
    invoke-direct {p0, p2}, Lcom/android/camera2/Camera2Proxy;-><init>(I)V

    .line 116
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    .line 128
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 129
    iput-object p3, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 130
    new-instance v0, Lcom/android/camera2/CameraConfigs;

    invoke-direct {v0}, Lcom/android/camera2/CameraConfigs;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 131
    iput-object p4, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 132
    iput-object p5, p0, Lcom/android/camera2/MiCamera2;->mCameraMainThreadHandler:Landroid/os/Handler;

    .line 134
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->initHelperHandler(Landroid/os/Looper;)V

    .line 136
    new-instance v0, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;-><init>(Lcom/android/camera2/MiCamera2;)V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    .line 137
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mOpenState:I

    .line 138
    return-void
.end method

.method private addFocusCaptureKeysToRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v2, 0x1

    .line 1119
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1120
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1121
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1122
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1123
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1124
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1125
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1126
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1127
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1128
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1129
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1131
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1132
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1134
    invoke-direct {p0, p1, v2}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1136
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1137
    return-void
.end method

.method private applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "lock"    # Z

    .prologue
    .line 2072
    if-nez p1, :cond_0

    .line 2073
    return-void

    .line 2075
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "applyAELock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2076
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2077
    return-void
.end method

.method private applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2098
    if-nez p1, :cond_0

    .line 2099
    return-void

    .line 2101
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    .line 2102
    .local v0, "regions":[Landroid/hardware/camera2/params/MeteringRectangle;
    if-eqz v0, :cond_1

    .line 2103
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2107
    :goto_0
    return-void

    .line 2105
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v2, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2110
    if-nez p1, :cond_0

    .line 2111
    return-void

    .line 2113
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    .line 2114
    .local v0, "regions":[Landroid/hardware/camera2/params/MeteringRectangle;
    if-eqz v0, :cond_1

    .line 2115
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2119
    :goto_0
    return-void

    .line 2117
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v2, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "lock"    # Z

    .prologue
    .line 2080
    if-nez p1, :cond_0

    .line 2081
    return-void

    .line 2083
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2084
    return-void
.end method

.method private applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2087
    if-nez p1, :cond_0

    .line 2088
    return-void

    .line 2090
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAWBMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2091
    return-void
.end method

.method private applyAiSceneDetectEnable(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2358
    if-nez p1, :cond_0

    .line 2359
    return-void

    .line 2361
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isAiSceneDetectEnabled()Z

    move-result v0

    .line 2362
    .local v0, "mode":Z
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2363
    return-void
.end method

.method private applyAiSceneDetectPeriod(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2366
    if-nez p1, :cond_0

    .line 2367
    return-void

    .line 2370
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAiSceneDetectPeriod()I

    move-result v0

    .line 2371
    .local v0, "period":I
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2372
    return-void
.end method

.method private applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2122
    if-nez p1, :cond_0

    .line 2123
    return-void

    .line 2126
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_ANTIBANDING_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAntiBanding()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2127
    return-void
.end method

.method private applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 7
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 2417
    if-nez p1, :cond_0

    .line 2418
    return-void

    .line 2421
    :cond_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    .line 2422
    .local v0, "enableEIS":Z
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isOISEnabled()Z

    move-result v1

    .line 2423
    .local v1, "enableOIS":Z
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2424
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "EIS&OIS are both on"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2426
    :cond_1
    sget-object v5, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "EIS: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz v0, :cond_3

    const-string/jumbo v2, "on"

    :goto_0
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2427
    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2428
    if-eqz v0, :cond_4

    move v2, v3

    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 2427
    invoke-virtual {p1, v5, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2431
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->isSupportOIS()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2432
    sget-object v5, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "OIS: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-nez v0, :cond_5

    if-eqz v1, :cond_5

    const-string/jumbo v2, "on"

    :goto_2
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2433
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->LENS_OPTICAL_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2434
    if-nez v0, :cond_6

    if-eqz v1, :cond_6

    :goto_3
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2433
    invoke-virtual {p1, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2438
    :cond_2
    return-void

    .line 2426
    :cond_3
    const-string/jumbo v2, "off"

    goto :goto_0

    :cond_4
    move v2, v4

    .line 2430
    goto :goto_1

    .line 2432
    :cond_5
    const-string/jumbo v2, "off"

    goto :goto_2

    :cond_6
    move v3, v4

    .line 2436
    goto :goto_3
.end method

.method private applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2794
    if-nez p1, :cond_0

    .line 2795
    return-void

    .line 2797
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportBeauty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2798
    return-void

    .line 2800
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/effect/BeautyValues;

    move-result-object v0

    if-nez v0, :cond_2

    .line 2801
    return-void

    .line 2803
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/effect/BeautyValues;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/effect/BeautyValues;)V

    .line 2804
    return-void
.end method

.method private applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2505
    if-nez p1, :cond_0

    .line 2506
    return-void

    .line 2509
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportBokeh()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2510
    return-void

    .line 2513
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isBokehEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2514
    return-void
.end method

.method private applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2642
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2643
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2644
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2645
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2646
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2647
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2650
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2651
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2652
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2653
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2654
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2655
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2657
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2658
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2659
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2660
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2661
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2662
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2663
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2665
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2667
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2668
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2669
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2670
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2671
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2672
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2673
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2674
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2675
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2676
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2679
    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2680
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2681
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2682
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2684
    :cond_3
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPanoramaModule()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2685
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAELocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2689
    :cond_4
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2690
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2691
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2692
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2693
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2694
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2696
    :cond_5
    return-void
.end method

.method private applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2321
    if-nez p1, :cond_0

    .line 2322
    return-void

    .line 2325
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->isSupportContrast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2326
    return-void

    .line 2329
    :cond_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getContrastLevel()I

    move-result v0

    .line 2330
    .local v0, "level":I
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2331
    return-void
.end method

.method private applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2094
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getAwbCustomValue()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2095
    return-void
.end method

.method private applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2619
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportDeviceOrientation()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 2620
    :cond_0
    return-void

    .line 2623
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2624
    return-void
.end method

.method private applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2138
    if-nez p1, :cond_0

    .line 2139
    return-void

    .line 2141
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getExposureCompensationIndex()I

    move-result v0

    .line 2142
    .local v0, "value":I
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "applyExposureCompensation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2143
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2144
    return-void
.end method

.method private applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2350
    if-nez p1, :cond_0

    .line 2351
    return-void

    .line 2353
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getExposureMeteringMode()I

    move-result v0

    .line 2354
    .local v0, "mode":I
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2355
    return-void
.end method

.method private applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2305
    if-nez p1, :cond_0

    .line 2306
    return-void

    .line 2309
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2310
    return-void

    .line 2316
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    .line 2318
    return-void
.end method

.method private applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2532
    if-nez p1, :cond_0

    .line 2533
    return-void

    .line 2536
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceAgeAnalyze()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2537
    return-void

    .line 2540
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isFaceAgeAnalyzeEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2541
    return-void
.end method

.method private applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2147
    if-nez p1, :cond_0

    .line 2148
    return-void

    .line 2150
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isFaceDetectionEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2151
    const/4 v0, 0x2

    .line 2153
    .local v0, "mode":I
    :goto_0
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2154
    return-void

    .line 2152
    .end local v0    # "mode":I
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "mode":I
    goto :goto_0
.end method

.method private applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2546
    if-nez p1, :cond_0

    .line 2547
    return-void

    .line 2550
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceScore()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2551
    return-void

    .line 2554
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isFaceScoreEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2555
    return-void
.end method

.method private applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 10
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2158
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "applyFlashMode: request = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ", applyType = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2159
    if-nez p1, :cond_0

    .line 2160
    return-void

    .line 2163
    :cond_0
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v6}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v3

    .line 2164
    .local v3, "flashMode":I
    const/4 v4, 0x0

    .line 2166
    .local v4, "needSnapShootVendorTag":Z
    packed-switch p2, :pswitch_data_0

    .line 2193
    :cond_1
    :goto_0
    :pswitch_0
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "applyFlashMode: flashMode = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ", mScreenLightCallback = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2194
    sparse-switch v3, :sswitch_data_0

    .line 2264
    :cond_2
    :goto_1
    return-void

    .line 2169
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2170
    const/4 v3, 0x2

    .line 2171
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2172
    const/4 v4, 0x1

    goto :goto_0

    .line 2178
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2179
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->getExposureTime()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_3

    .line 2180
    const/4 v3, 0x0

    goto :goto_0

    .line 2182
    :cond_3
    const/4 v3, 0x2

    .line 2183
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2184
    const/4 v4, 0x1

    goto :goto_0

    .line 2196
    :sswitch_0
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2197
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2196
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2198
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2199
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2198
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 2202
    :sswitch_1
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2203
    const/4 v7, 0x3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2202
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2204
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2205
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2204
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 2208
    :sswitch_2
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v6}, Lcom/android/camera2/CameraCapabilities;->isSupportSnapShotTorch()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 2209
    invoke-static {p1, v4}, Lcom/android/camera2/compat/MiCameraCompat;->applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2212
    :cond_4
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2213
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2212
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2214
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2215
    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2214
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 2218
    :sswitch_3
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2219
    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2218
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2220
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2221
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2220
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 2224
    :sswitch_4
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2225
    const/4 v7, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2224
    invoke-virtual {p1, v6, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 2228
    :sswitch_5
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    if-eqz v6, :cond_2

    .line 2229
    const/4 v6, 0x6

    if-ne p2, v6, :cond_5

    .line 2230
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v6}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getCurrentColorTemperature()I

    move-result v6

    iput v6, p0, Lcom/android/camera2/MiCamera2;->mScreenLightColorTemperature:I

    .line 2232
    :cond_5
    const-string/jumbo v6, "camera_screen_light_wb"

    iget v7, p0, Lcom/android/camera2/MiCamera2;->mScreenLightColorTemperature:I

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 2233
    .local v5, "wb":I
    invoke-static {v5}, Lcom/android/camera/Util;->getScreenLightColor(I)I

    move-result v1

    .line 2235
    .local v1, "color":I
    const-string/jumbo v6, "camera_screen_light_brightness"

    const/16 v7, 0xb4

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 2236
    .local v0, "brightness":I
    const-string/jumbo v6, "camera_screen_light_delay"

    const/4 v7, 0x0

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 2237
    .local v2, "delay":I
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_ON color = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 2238
    const-string/jumbo v8, ", brightness = "

    .line 2237
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 2239
    const-string/jumbo v8, ", delay = "

    .line 2237
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 2239
    const-string/jumbo v8, ", mCameraHandler = "

    .line 2237
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 2239
    iget-object v8, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 2237
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2240
    const/4 v6, 0x6

    if-eq p2, v6, :cond_6

    .line 2241
    const/4 v6, 0x3

    if-ne p2, v6, :cond_7

    .line 2242
    :cond_6
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {v6, v1, v0}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->startScreenLight(II)V

    goto/16 :goto_1

    .line 2244
    :cond_7
    if-nez v2, :cond_8

    .line 2245
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {v6}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->stopScreenLight()V

    goto/16 :goto_1

    .line 2247
    :cond_8
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    new-instance v7, Lcom/android/camera2/MiCamera2$11;

    invoke-direct {v7, p0}, Lcom/android/camera2/MiCamera2$11;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 2252
    int-to-long v8, v2

    .line 2247
    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_1

    .line 2258
    .end local v0    # "brightness":I
    .end local v1    # "color":I
    .end local v2    # "delay":I
    .end local v5    # "wb":I
    :sswitch_6
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_AUTO applyType = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2259
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    if-eqz v6, :cond_2

    .line 2260
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {v6}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->stopScreenLight()V

    goto/16 :goto_1

    .line 2166
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 2194
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x65 -> :sswitch_5
        0x67 -> :sswitch_6
    .end sparse-switch
.end method

.method private applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2276
    if-nez p1, :cond_0

    .line 2277
    return-void

    .line 2279
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getFocusMode()I

    move-result v0

    if-eqz v0, :cond_1

    .line 2280
    return-void

    .line 2282
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFocusDistance()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2283
    return-void
.end method

.method private applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2267
    if-nez p1, :cond_0

    .line 2268
    return-void

    .line 2270
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2271
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2272
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2273
    return-void
.end method

.method private applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2286
    if-nez p1, :cond_0

    .line 2287
    return-void

    .line 2289
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewFpsRange()Landroid/util/Range;

    move-result-object v0

    if-nez v0, :cond_1

    .line 2290
    return-void

    .line 2293
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPreviewFpsRange()Landroid/util/Range;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2294
    return-void
.end method

.method private applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2627
    if-nez p1, :cond_0

    .line 2628
    return-void

    .line 2630
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportFrontMirror()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2631
    return-void

    .line 2633
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2634
    return-void

    .line 2637
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isFrontMirror()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2638
    return-void
.end method

.method private applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2457
    if-nez p1, :cond_0

    .line 2458
    return-void

    .line 2461
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportHdr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2462
    return-void

    .line 2465
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2467
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2468
    return-void

    .line 2471
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2472
    return-void
.end method

.method private applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;ZI)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "enable"    # Z
    .param p3, "applyType"    # I

    .prologue
    .line 2476
    if-eqz p1, :cond_0

    .line 2477
    const/4 v0, 0x1

    if-eq p3, v0, :cond_1

    .line 2479
    :cond_0
    return-void

    .line 2478
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportAutoHdr()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 2476
    if-nez v0, :cond_0

    .line 2481
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isHDRCheckerEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2482
    return-void
.end method

.method private applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2441
    if-nez p1, :cond_0

    .line 2442
    return-void

    .line 2445
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2446
    return-void

    .line 2449
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportHHT()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2450
    return-void

    .line 2453
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isHHTEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2454
    return-void
.end method

.method private applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2297
    if-nez p1, :cond_0

    .line 2298
    return-void

    .line 2300
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2301
    return-void
.end method

.method private applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2518
    if-nez p1, :cond_0

    .line 2519
    return-void

    .line 2522
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportLensDirtyDetect()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2523
    return-void

    .line 2526
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isLensDirtyDetectEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2527
    return-void
.end method

.method private applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2485
    if-nez p1, :cond_0

    .line 2486
    return-void

    .line 2489
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportMfnr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2490
    return-void

    .line 2493
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2496
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2497
    return-void

    .line 2500
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2501
    return-void
.end method

.method private applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2559
    if-nez p1, :cond_0

    .line 2560
    return-void

    .line 2562
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2563
    return-void

    .line 2566
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportParallel()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2567
    return-void

    .line 2570
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isParallelEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2571
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isParallelEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2572
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getParallelProcessingPath()Ljava/lang/String;

    move-result-object v0

    .line 2571
    :goto_0
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2573
    return-void

    .line 2572
    :cond_3
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2334
    if-nez p1, :cond_0

    .line 2335
    return-void

    .line 2337
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getSaturationLevel()I

    move-result v0

    .line 2338
    .local v0, "level":I
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2339
    return-void
.end method

.method private applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2376
    if-nez p1, :cond_0

    .line 2377
    return-void

    .line 2379
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getSceneMode()I

    move-result v0

    .line 2380
    .local v0, "sceneMode":I
    if-eqz v0, :cond_1

    .line 2381
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_SCENE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2382
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2386
    :goto_0
    return-void

    .line 2384
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2739
    if-nez p1, :cond_0

    .line 2740
    return-void

    .line 2743
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2744
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2745
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2746
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForJpeg(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2747
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2748
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2750
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2751
    return-void
.end method

.method private applySettingsForJpeg(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 8
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2714
    if-nez p1, :cond_0

    .line 2715
    return-void

    .line 2717
    :cond_0
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v4}, Lcom/android/camera2/CameraConfigs;->getGpsLocation()Landroid/location/Location;

    move-result-object v1

    .line 2718
    .local v1, "location":Landroid/location/Location;
    if-eqz v1, :cond_1

    .line 2720
    new-instance v2, Landroid/location/Location;

    invoke-direct {v2, v1}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    .line 2723
    .end local v1    # "location":Landroid/location/Location;
    .local v2, "location":Landroid/location/Location;
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_GPS_LOCATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v4, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    move-object v1, v2

    .line 2725
    .end local v2    # "location":Landroid/location/Location;
    .restart local v1    # "location":Landroid/location/Location;
    :cond_1
    sget-object v4, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "jpegRotation="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v6}, Lcom/android/camera2/CameraConfigs;->getJpegRotation()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2726
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v5}, Lcom/android/camera2/CameraConfigs;->getJpegRotation()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2727
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v4}, Lcom/android/camera2/CameraConfigs;->getThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 2728
    .local v3, "size":Lcom/android/camera/CameraSize;
    if-eqz v3, :cond_2

    .line 2729
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_THUMBNAIL_SIZE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2730
    new-instance v5, Landroid/util/Size;

    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Size;-><init>(II)V

    .line 2729
    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2732
    :cond_2
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v4}, Lcom/android/camera2/CameraConfigs;->getJpegQuality()I

    move-result v4

    int-to-byte v0, v4

    .line 2733
    .local v0, "jpegQuality":B
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_THUMBNAIL_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2734
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2735
    return-void
.end method

.method private applySettingsForLockFocus(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v2, 0x1

    .line 1998
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1999
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2000
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2001
    invoke-direct {p0, p1, v2}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2002
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needScreenLight()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2003
    :cond_0
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2005
    :cond_1
    return-void
.end method

.method private applySettingsForPrecapture(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v1, 0x1

    .line 1808
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1809
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1810
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1811
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1810
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1812
    return-void
.end method

.method private applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v3, 0x1

    .line 2699
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "applySettingsForPreview: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2700
    if-nez p1, :cond_0

    .line 2701
    return-void

    .line 2703
    :cond_0
    invoke-direct {p0, p1, v3}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2705
    invoke-direct {p0, p1, v3}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2706
    invoke-direct {p0, p1, v3}, Lcom/android/camera2/MiCamera2;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2707
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAELocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2708
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAWBLocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2709
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2710
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2711
    return-void
.end method

.method private applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v2, 0x1

    .line 2754
    if-nez p1, :cond_0

    .line 2755
    return-void

    .line 2757
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2758
    invoke-direct {p0, p1, v2}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2759
    invoke-direct {p0, p1, v2}, Lcom/android/camera2/MiCamera2;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2760
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2761
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2762
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2763
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2764
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2765
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2766
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2771
    return-void
.end method

.method private applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2342
    if-nez p1, :cond_0

    .line 2343
    return-void

    .line 2345
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getSharpnessLevel()I

    move-result v0

    .line 2346
    .local v0, "level":I
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2347
    return-void
.end method

.method private applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2577
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportSuperResolution()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 2578
    :cond_0
    return-void

    .line 2581
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2583
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2584
    return-void

    .line 2588
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2589
    return-void
.end method

.method private applyVideoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v2, 0x2

    .line 2782
    if-nez p1, :cond_0

    .line 2783
    return-void

    .line 2785
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v1

    if-ne v2, v1, :cond_1

    const/4 v0, 0x1

    .line 2786
    .local v0, "flashOn":Z
    :goto_0
    if-eqz v0, :cond_2

    .line 2787
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2791
    :goto_1
    return-void

    .line 2785
    .end local v0    # "flashOn":Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "flashOn":Z
    goto :goto_0

    .line 2789
    :cond_2
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private applyWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "applyType"    # I

    .prologue
    .line 2593
    if-nez p1, :cond_0

    .line 2594
    return-void

    .line 2597
    :cond_0
    const/4 v1, 0x3

    if-eq p2, v1, :cond_1

    .line 2598
    return-void

    .line 2601
    :cond_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->isSupportWatermark()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2602
    return-void

    .line 2605
    :cond_2
    const-string/jumbo v1, ","

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getWaterMarkAppliedList()Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/Util;->join(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 2606
    .local v0, "appliedList":Ljava/lang/String;
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "applyWaterMark appliedList:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2607
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 2608
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2609
    const-string/jumbo v1, "watermark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2610
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getTimeWaterMarkValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2612
    :cond_3
    const-string/jumbo v1, "beautify"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2613
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFaceWaterMarkFormat()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2616
    :cond_4
    return-void
.end method

.method private applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 11
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/high16 v10, 0x40000000    # 2.0f

    .line 2389
    if-nez p1, :cond_0

    .line 2390
    return-void

    .line 2392
    :cond_0
    iget-object v7, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v7}, Lcom/android/camera2/CameraConfigs;->getZoomRatio()F

    move-result v6

    .line 2393
    .local v6, "zoomRatio":F
    iget-object v7, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v7}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v0

    .line 2394
    .local v0, "activeRegion":Landroid/graphics/Rect;
    sget-object v7, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "applyZoomRatio: ActiveArraySize="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2396
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 2397
    .local v1, "cropRegion":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v7

    div-int/lit8 v2, v7, 0x2

    .line 2398
    .local v2, "xCenter":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    div-int/lit8 v4, v7, 0x2

    .line 2399
    .local v4, "yCenter":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    mul-float v8, v10, v6

    div-float/2addr v7, v8

    float-to-int v3, v7

    .line 2400
    .local v3, "xDelta":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    mul-float v8, v10, v6

    div-float/2addr v7, v8

    float-to-int v5, v7

    .line 2402
    .local v5, "yDelta":I
    sub-int v7, v2, v3

    sub-int v8, v4, v5

    .line 2403
    add-int v9, v2, v3

    add-int v10, v4, v5

    .line 2402
    invoke-virtual {v1, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 2404
    sget-object v7, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "applyZoomRatio: cropRegion="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2406
    sget-object v7, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v7, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2407
    return-void
.end method

.method private applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    .line 2410
    if-nez p1, :cond_0

    .line 2411
    return-void

    .line 2413
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isZslEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2414
    return-void
.end method

.method private capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .param p3, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .prologue
    .line 2060
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    instance-of v1, v1, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;

    if-eqz v1, :cond_0

    .line 2064
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object v0

    .line 2065
    .local v0, "requestList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v1, v0, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->captureBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v1

    return v1

    .line 2067
    .end local v0    # "requestList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v1, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v1

    return v1
.end method

.method private captureStillPicture()V
    .locals 7

    .prologue
    .line 1828
    const-string/jumbo v3, "capture"

    invoke-direct {p0, v3}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1829
    return-void

    .line 1834
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 1835
    .local v0, "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1837
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->isFrontBeautyOn()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1838
    :cond_1
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1841
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {}, Lcom/android/camera/Device;->isSupportDynamicLightSpot()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1842
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1843
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1846
    :cond_3
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "captureStillPicture: size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v5}, Landroid/media/ImageReader;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1847
    const-string/jumbo v5, "x"

    .line 1846
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1847
    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v5}, Landroid/media/ImageReader;->getHeight()I

    move-result v5

    .line 1846
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1848
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1849
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v3, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 1848
    invoke-virtual {v0, v4, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1851
    const/4 v3, 0x3

    invoke-direct {p0, v0, v3}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1860
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportBurstHint()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1861
    const/4 v3, 0x0

    invoke-static {v0, v3}, Lcom/android/camera2/compat/MiCameraCompat;->applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1864
    :cond_4
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportBurstFps()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1865
    const/4 v3, 0x0

    invoke-static {v0, v3}, Lcom/android/camera2/compat/MiCameraCompat;->applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1868
    :cond_5
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v4

    .line 1869
    new-instance v5, Lcom/android/camera2/MiCamera2$9;

    invoke-direct {v5, p0}, Lcom/android/camera2/MiCamera2$9;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 1898
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 1868
    invoke-virtual {v3, v4, v5, v6}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1906
    .end local v0    # "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    return-void

    .line 1902
    :catch_0
    move-exception v2

    .line 1903
    .local v2, "e":Ljava/lang/IllegalStateException;
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Failed to capture a still picture, IllegalState"

    invoke-static {v3, v4, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1904
    const/16 v3, 0x100

    invoke-virtual {p0, v3}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 1899
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v1

    .line 1900
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1901
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Cannot capture a still picture"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private checkCameraDevice(Ljava/lang/String;)Z
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 2819
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2820
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "camera "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is closed when "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2821
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2827
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method private checkCaptureSession(Ljava/lang/String;)Z
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 2807
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v1, :cond_0

    .line 2808
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "session for camera "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is closed when "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2809
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2815
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method private createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;
    .locals 14
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CaptureRequest;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .prologue
    .line 3284
    if-nez p1, :cond_0

    .line 3285
    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v13, "Input capture request must not be null"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 3287
    :cond_0
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getTargets()Ljava/util/Collection;

    move-result-object v5

    .line 3288
    .local v5, "outputSurfaces":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/view/Surface;>;"
    sget-object v12, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v12}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Range;

    .line 3293
    .local v2, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    div-int/lit8 v8, v12, 0x1e

    .line 3294
    .local v8, "requestListSize":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 3298
    .local v7, "requestList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    new-instance v9, Landroid/hardware/camera2/impl/CameraMetadataNative;

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getNativeCopy()Landroid/hardware/camera2/impl/CameraMetadataNative;

    move-result-object v12

    invoke-direct {v9, v12}, Landroid/hardware/camera2/impl/CameraMetadataNative;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;)V

    .line 3301
    .local v9, "requestMetadata":Landroid/hardware/camera2/impl/CameraMetadataNative;
    new-instance v11, Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 3302
    const/4 v12, 0x0

    const/4 v13, -0x1

    .line 3301
    invoke-direct {v11, v9, v12, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;ZI)V

    .line 3305
    .local v11, "singleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 3306
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/view/Surface;>;"
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/Surface;

    .line 3307
    .local v1, "firstSurface":Landroid/view/Surface;
    const/4 v10, 0x0

    .line 3308
    .local v10, "secondSurface":Landroid/view/Surface;
    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_2

    invoke-static {v1}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v12

    xor-int/lit8 v12, v12, 0x1

    if-eqz v12, :cond_2

    .line 3309
    sget-object v12, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 3310
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 3309
    invoke-virtual {v11, v12, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3316
    :goto_0
    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Landroid/hardware/camera2/CaptureRequest$Builder;->setPartOfCHSRequestList(Z)V

    .line 3319
    const/4 v0, 0x0

    .line 3320
    .local v0, "doubleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v12

    const/4 v13, 0x2

    if-ne v12, v13, :cond_3

    .line 3323
    new-instance v9, Landroid/hardware/camera2/impl/CameraMetadataNative;

    .end local v9    # "requestMetadata":Landroid/hardware/camera2/impl/CameraMetadataNative;
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getNativeCopy()Landroid/hardware/camera2/impl/CameraMetadataNative;

    move-result-object v12

    invoke-direct {v9, v12}, Landroid/hardware/camera2/impl/CameraMetadataNative;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;)V

    .line 3324
    .restart local v9    # "requestMetadata":Landroid/hardware/camera2/impl/CameraMetadataNative;
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 3325
    .end local v0    # "doubleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    const/4 v12, 0x0

    const/4 v13, -0x1

    .line 3324
    invoke-direct {v0, v9, v12, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;ZI)V

    .line 3326
    .local v0, "doubleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    sget-object v12, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 3327
    const/4 v13, 0x3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 3326
    invoke-virtual {v0, v12, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3328
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3329
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "secondSurface":Landroid/view/Surface;
    check-cast v10, Landroid/view/Surface;

    .line 3330
    .local v10, "secondSurface":Landroid/view/Surface;
    invoke-virtual {v0, v10}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3331
    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Landroid/hardware/camera2/CaptureRequest$Builder;->setPartOfCHSRequestList(Z)V

    .line 3334
    move-object v6, v1

    .line 3335
    .local v6, "recordingSurface":Landroid/view/Surface;
    invoke-static {v1}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 3336
    move-object v6, v10

    .line 3338
    :cond_1
    invoke-virtual {v11, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3345
    .end local v0    # "doubleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v6    # "recordingSurface":Landroid/view/Surface;
    .end local v10    # "secondSurface":Landroid/view/Surface;
    :goto_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-ge v3, v8, :cond_5

    .line 3346
    if-nez v3, :cond_4

    if-eqz v0, :cond_4

    .line 3348
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v12

    invoke-interface {v7, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3345
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 3313
    .end local v3    # "i":I
    .local v10, "secondSurface":Landroid/view/Surface;
    :cond_2
    sget-object v12, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 3314
    const/4 v13, 0x3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 3313
    invoke-virtual {v11, v12, v13}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 3341
    .local v0, "doubleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :cond_3
    invoke-virtual {v11, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    goto :goto_1

    .line 3350
    .end local v0    # "doubleTargetRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v10    # "secondSurface":Landroid/view/Surface;
    .restart local v3    # "i":I
    :cond_4
    invoke-virtual {v11}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v12

    invoke-interface {v7, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 3354
    :cond_5
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    return-object v12
.end method

.method private genSessionId()I
    .locals 3

    .prologue
    .line 1478
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    .line 1479
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 1481
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "generateSessionId: id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1482
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    return v0
.end method

.method private getExposureTime()J
    .locals 2

    .prologue
    .line 1530
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    return-wide v0
.end method

.method private getFirstPlane(Landroid/media/Image;)[B
    .locals 5
    .param p1, "image"    # Landroid/media/Image;

    .prologue
    const/4 v4, 0x0

    .line 3254
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    .line 3255
    .local v2, "planes":[Landroid/media/Image$Plane;
    array-length v3, v2

    if-lez v3, :cond_0

    .line 3256
    aget-object v3, v2, v4

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 3257
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v1, v3, [B

    .line 3258
    .local v1, "data":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 3259
    return-object v1

    .line 3261
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "data":[B
    :cond_0
    const/4 v3, 0x0

    return-object v3
.end method

.method private initFocusRequestBuilder(I)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 3
    .param p1, "moduleIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .prologue
    .line 1051
    const/4 v0, 0x0

    .line 1053
    .local v0, "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    packed-switch p1, :pswitch_data_0

    .line 1070
    .end local v0    # "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1071
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    instance-of v1, v1, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;

    if-eqz v1, :cond_0

    .line 1072
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1073
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1075
    :cond_0
    return-object v0

    .line 1059
    .restart local v0    # "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .local v0, "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    goto :goto_0

    .line 1066
    .local v0, "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :pswitch_2
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .local v0, "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    goto :goto_0

    .line 1053
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private initHelperHandler(Landroid/os/Looper;)V
    .locals 1
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    .line 141
    new-instance v0, Lcom/android/camera2/MiCamera2$1;

    invoke-direct {v0, p0, p1}, Lcom/android/camera2/MiCamera2$1;-><init>(Lcom/android/camera2/MiCamera2;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    .line 159
    return-void
.end method

.method private isClosed()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1153
    iget v1, p0, Lcom/android/camera2/MiCamera2;->mOpenState:I

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isFrontBeautyOn()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 3266
    iget v1, p0, Lcom/android/camera2/MiCamera2;->mCameraId:I

    if-ne v1, v4, :cond_2

    .line 3267
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/effect/BeautyValues;

    move-result-object v0

    .line 3268
    .local v0, "beautyValues":Lcom/android/camera/effect/BeautyValues;
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3269
    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v2, v0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3270
    iget v1, v0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    if-lez v1, :cond_1

    .line 3273
    :cond_0
    return v4

    .line 3271
    :cond_1
    iget v1, v0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    if-gtz v1, :cond_0

    .line 3272
    iget v1, v0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    if-gtz v1, :cond_0

    .line 3279
    .end local v0    # "beautyValues":Lcom/android/camera/effect/BeautyValues;
    :cond_2
    return v3

    .line 3275
    .restart local v0    # "beautyValues":Lcom/android/camera/effect/BeautyValues;
    :cond_3
    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v2, v0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 3276
    return v4
.end method

.method private lockFocus()V
    .locals 7

    .prologue
    .line 1971
    const-string/jumbo v3, "lockFocus"

    invoke-direct {p0, v3}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1972
    return-void

    .line 1974
    :cond_0
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "lockFocus"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1977
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 1978
    .local v0, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1980
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForLockFocus(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1981
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    .line 1982
    .local v2, "request":Landroid/hardware/camera2/CaptureRequest;
    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v3

    iput v3, p0, Lcom/android/camera2/MiCamera2;->mLockRequestHashCode:I

    .line 1983
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1984
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->showAutoFocusStart()V

    .line 1985
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v2, v3, v4}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 1986
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    if-eqz v3, :cond_1

    .line 1987
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 1988
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x1388

    const/4 v6, 0x1

    invoke-virtual {v3, v6, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1995
    .end local v0    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v2    # "request":Landroid/hardware/camera2/CaptureRequest;
    :cond_1
    :goto_0
    return-void

    .line 1992
    :catch_0
    move-exception v1

    .line 1993
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private needOptimizedFlash()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 2014
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v2

    if-eq v2, v0, :cond_0

    .line 2015
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 2014
    :cond_0
    :goto_0
    return v0

    .line 2016
    :cond_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->getExposureTime()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v1

    .line 2014
    goto :goto_0
.end method

.method private needScreenLight()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 2021
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v1

    const/16 v2, 0x65

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private onCapturePictureFinished(Z)V
    .locals 4
    .param p1, "succeed"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1909
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result v1

    .line 1910
    .local v1, "needResumePreview":Z
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2, v3}, Lcom/android/camera2/CameraConfigs;->setNeedFlash(Z)Z

    .line 1912
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v2, v3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1914
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1916
    if-eqz v1, :cond_0

    .line 1917
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1919
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 1920
    .local v0, "callback":Lcom/android/camera2/Camera2Proxy$PictureCallback;
    if-nez p1, :cond_1

    if-eqz v0, :cond_1

    .line 1921
    invoke-interface {v0}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFailed()V

    .line 1923
    :cond_1
    return-void
.end method

.method private prepareDepthImageReader(Lcom/android/camera/CameraSize;)V
    .locals 5
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 265
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    if-eqz v1, :cond_0

    .line 266
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 268
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$6;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$6;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 289
    .local v0, "listener":Landroid/media/ImageReader$OnImageAvailableListener;
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    .line 290
    const v3, 0x20363159

    const/4 v4, 0x2

    .line 289
    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    .line 291
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 292
    return-void
.end method

.method private preparePhotoImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4
    .param p1, "size"    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 170
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 171
    const/16 v2, 0x100

    const/4 v3, 0x2

    .line 170
    invoke-static {v0, v1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    .line 172
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    new-instance v1, Lcom/android/camera2/MiCamera2$2;

    invoke-direct {v1, p0}, Lcom/android/camera2/MiCamera2$2;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 189
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 172
    invoke-virtual {v0, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 190
    return-void
.end method

.method private preparePortraitRawImageReader(Lcom/android/camera/CameraSize;)V
    .locals 5
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 295
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    if-eqz v1, :cond_0

    .line 296
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 298
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$7;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$7;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 315
    .local v0, "listener":Landroid/media/ImageReader$OnImageAvailableListener;
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v2

    const/16 v3, 0x100

    const/4 v4, 0x2

    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    .line 316
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 317
    return-void
.end method

.method private preparePreviewImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4
    .param p1, "size"    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 193
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 196
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 197
    const/16 v2, 0x23

    const/4 v3, 0x1

    .line 196
    invoke-static {v0, v1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    .line 198
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    new-instance v1, Lcom/android/camera2/MiCamera2$3;

    invoke-direct {v1, p0}, Lcom/android/camera2/MiCamera2$3;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 211
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraMainThreadHandler:Landroid/os/Handler;

    .line 198
    invoke-virtual {v0, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 212
    return-void
.end method

.method private prepareRawImageReader(Lcom/android/camera/CameraSize;)V
    .locals 5
    .param p1, "size"    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 215
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    if-eqz v1, :cond_0

    .line 216
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 219
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$4;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$4;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 232
    .local v0, "listener":Landroid/media/ImageReader$OnImageAvailableListener;
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v2

    .line 233
    const/16 v3, 0x25

    const/4 v4, 0x2

    .line 232
    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    .line 234
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 235
    return-void
.end method

.method private prepareVideoSnapshotImageReader(Lcom/android/camera/CameraSize;)V
    .locals 5
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 238
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    if-eqz v1, :cond_0

    .line 239
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 242
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$5;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$5;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 259
    .local v0, "listener":Landroid/media/ImageReader$OnImageAvailableListener;
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v2

    .line 260
    const/16 v3, 0x100

    const/4 v4, 0x2

    .line 259
    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    .line 261
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 262
    return-void
.end method

.method private reset()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 352
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 354
    iput v3, p0, Lcom/android/camera2/MiCamera2;->mOpenState:I

    .line 355
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 356
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    .line 357
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 358
    iput v3, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 359
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    .line 360
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    .line 361
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    .line 362
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    .line 363
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    .line 364
    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    .line 365
    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->setShutterCallback(Lcom/android/camera2/Camera2Proxy$ShutterCallback;)V

    .line 366
    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 367
    return-void
.end method

.method private runPrecaptureSequence()V
    .locals 5

    .prologue
    .line 1792
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "runPrecaptureSequence"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1795
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 1796
    .local v0, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1797
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForPrecapture(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1798
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    .line 1799
    .local v2, "request":Landroid/hardware/camera2/CaptureRequest;
    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v3

    iput v3, p0, Lcom/android/camera2/MiCamera2;->mPrecaptureRequestHashCode:I

    .line 1800
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1801
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v2, v3, v4}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1805
    .end local v0    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v2    # "request":Landroid/hardware/camera2/CaptureRequest;
    :goto_0
    return-void

    .line 1802
    :catch_0
    move-exception v1

    .line 1803
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private setAFModeToPreview(I)V
    .locals 3
    .param p1, "focusMode"    # I

    .prologue
    .line 1014
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setAFModeToPreview: focusMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1015
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1016
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1017
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1016
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1018
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1019
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1020
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1021
    return-void
.end method

.method private setVideoRecordControl(I)V
    .locals 4
    .param p1, "control"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .prologue
    .line 608
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setVideoRecordControl: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 611
    .local v0, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 612
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 613
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 614
    sget-object v1, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 615
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v1, v2, v3}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 616
    return-void
.end method

.method private triggerCapture()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1704
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->isNeedFlashOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1705
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, v2}, Lcom/android/camera2/CameraConfigs;->setNeedFlash(Z)Z

    .line 1706
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1707
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1708
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1707
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1709
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1710
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1709
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1712
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0, v3}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1713
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1719
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isAutoFocusSupported()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1720
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->lockFocus()V

    .line 1728
    :goto_1
    return-void

    .line 1714
    :cond_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needScreenLight()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1715
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1716
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1715
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1717
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    goto :goto_0

    .line 1722
    :cond_2
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->runPrecaptureSequence()V

    goto :goto_1

    .line 1725
    :cond_3
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, v3}, Lcom/android/camera2/CameraConfigs;->setNeedFlash(Z)Z

    .line 1726
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->captureStillPicture()V

    goto :goto_1
.end method

.method private updateFaceInfo(Landroid/hardware/camera2/CaptureResult;)V
    .locals 2
    .param p1, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 2956
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 2957
    return-void

    .line 2960
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    if-nez v0, :cond_1

    .line 2961
    new-instance v0, Lcom/android/camera/effect/FaceAnalyzeInfo;

    invoke-direct {v0}, Lcom/android/camera/effect/FaceAnalyzeInfo;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    .line 2964
    :cond_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_AGE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, v1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    .line 2965
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_GENDER:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, v1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mGender:[F

    .line 2966
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_FACESCORE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, v1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mFaceScore:[F

    .line 2967
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mFaceInfo:Lcom/android/camera/effect/FaceAnalyzeInfo;

    sget-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_PROP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, v1, Lcom/android/camera/effect/FaceAnalyzeInfo;->mProp:[F

    .line 2968
    return-void
.end method

.method private waitFlashClosed()V
    .locals 3

    .prologue
    .line 1816
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1817
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1816
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1818
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1819
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1818
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1820
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1821
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1822
    return-void
.end method


# virtual methods
.method public cancelFocus(I)V
    .locals 7
    .param p1, "moduleIndex"    # I

    .prologue
    const/4 v5, 0x1

    .line 965
    const-string/jumbo v4, "cancelFocus"

    invoke-direct {p0, v4}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 966
    return-void

    .line 969
    :cond_0
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v4}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getState()I

    move-result v4

    if-ne v5, v4, :cond_1

    .line 970
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 974
    :cond_1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->initFocusRequestBuilder(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 975
    .local v0, "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 976
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 977
    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 976
    invoke-virtual {v0, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 979
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 980
    const/4 v4, 0x1

    invoke-direct {p0, v0, v4}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 981
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 982
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 983
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 984
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 985
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 986
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 987
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 988
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 991
    :cond_2
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 992
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    .line 993
    .local v3, "request":Landroid/hardware/camera2/CaptureRequest;
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v3, v4, v5}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 1001
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/camera2/CameraConfigs;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    .line 1002
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/camera2/CameraConfigs;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    .line 1003
    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v4}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/android/camera2/MiCamera2;->setAFModeToPreview(I)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1011
    .end local v0    # "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v3    # "request":Landroid/hardware/camera2/CaptureRequest;
    :goto_0
    return-void

    .line 1007
    :catch_0
    move-exception v2

    .line 1008
    .local v2, "e":Ljava/lang/IllegalStateException;
    sget-object v4, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Failed to cancel focus, IllegalState"

    invoke-static {v4, v5, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1009
    const/16 v4, 0x100

    invoke-virtual {p0, v4}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 1004
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v1

    .line 1005
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1006
    sget-object v4, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "cancelFocus: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public captureAbortBurst()V
    .locals 4

    .prologue
    .line 952
    :try_start_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 961
    :goto_0
    return-void

    .line 957
    :catch_0
    move-exception v1

    .line 958
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to abort burst, IllegalState"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 959
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 954
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 955
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 956
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 7
    .param p1, "burstCount"    # I
    .param p2, "dataCallback"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;

    .prologue
    .line 863
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 867
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {p0, v3}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 870
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 872
    .local v0, "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 873
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 876
    const/4 v3, 0x4

    invoke-direct {p0, v0, v3}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 895
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->pausePreview()V

    .line 896
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v4

    .line 897
    new-instance v5, Lcom/android/camera2/MiCamera2$8;

    invoke-direct {v5, p0}, Lcom/android/camera2/MiCamera2$8;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 938
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 896
    invoke-virtual {v3, v4, v5, v6}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 947
    .end local v0    # "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    return-void

    .line 943
    :catch_0
    move-exception v2

    .line 944
    .local v2, "e":Ljava/lang/IllegalStateException;
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Failed to capture burst, IllegalState"

    invoke-static {v3, v4, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 945
    const/16 v3, 0x100

    invoke-virtual {p0, v3}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 940
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v1

    .line 941
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 942
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 7
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;

    .prologue
    const/4 v4, 0x2

    .line 1927
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    .line 1931
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedHardwareLevel()I

    move-result v3

    .line 1930
    if-ne v4, v3, :cond_0

    .line 1933
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 1938
    .local v0, "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1939
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "captureVideoSnapshot: size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v5}, Landroid/media/ImageReader;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1940
    const-string/jumbo v5, "x"

    .line 1939
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1940
    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v5}, Landroid/media/ImageReader;->getHeight()I

    move-result v5

    .line 1939
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1942
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForJpeg(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1943
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyVideoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1944
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1945
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1946
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1947
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v4

    .line 1948
    new-instance v5, Lcom/android/camera2/MiCamera2$10;

    invoke-direct {v5, p0}, Lcom/android/camera2/MiCamera2$10;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 1957
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 1947
    invoke-virtual {v3, v4, v5, v6}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 1965
    .end local v0    # "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_1
    return-void

    .line 1936
    :cond_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .restart local v0    # "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    goto :goto_0

    .line 1961
    .end local v0    # "captureRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :catch_0
    move-exception v2

    .line 1962
    .local v2, "e":Ljava/lang/IllegalStateException;
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Failed to capture a video snapshot, IllegalState"

    invoke-static {v3, v4, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1963
    const/16 v3, 0x100

    invoke-virtual {p0, v3}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 1958
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v1

    .line 1959
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1960
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "cannot capture a video snapshot"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public close()V
    .locals 5

    .prologue
    .line 324
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "close: cameraId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v2, :cond_1

    .line 326
    sget-boolean v2, Lcom/android/camera/Device;->IS_D5X:Z

    if-eqz v2, :cond_0

    .line 327
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    check-cast v0, Landroid/hardware/camera2/impl/CameraDeviceImpl;

    .line 329
    .local v0, "cameraDeviceImpl":Landroid/hardware/camera2/impl/CameraDeviceImpl;
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/camera2/impl/CameraDeviceImpl;->flush()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    .end local v0    # "cameraDeviceImpl":Landroid/hardware/camera2/impl/CameraDeviceImpl;
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 336
    :cond_1
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    if-eqz v2, :cond_2

    .line 337
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->close()V

    .line 339
    :cond_2
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    if-eqz v2, :cond_3

    .line 340
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->close()V

    .line 342
    :cond_3
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    if-eqz v2, :cond_4

    .line 343
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->close()V

    .line 345
    :cond_4
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    if-eqz v2, :cond_5

    .line 346
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->close()V

    .line 348
    :cond_5
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->reset()V

    .line 349
    return-void

    .line 330
    .restart local v0    # "cameraDeviceImpl":Landroid/hardware/camera2/impl/CameraDeviceImpl;
    :catch_0
    move-exception v1

    .line 331
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    goto :goto_0
.end method

.method public getCapabilities()Lcom/android/camera2/CameraCapabilities;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .prologue
    .line 1696
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .prologue
    .line 1660
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v0

    return v0
.end method

.method public getMetaDataCallback()Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;
    .locals 1

    .prologue
    .line 1552
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    return-object v0
.end method

.method public getPictureSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 1175
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .prologue
    .line 1410
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isBokehEnabled()Z

    move-result v0

    return v0
.end method

.method public isNeedFlashOn()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1732
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v3}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 1733
    return v1

    .line 1736
    :cond_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v3}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v3

    const/16 v4, 0x67

    if-eq v3, v4, :cond_1

    .line 1737
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v3}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v3

    const/16 v4, 0x65

    if-ne v3, v4, :cond_2

    .line 1738
    :cond_1
    return v1

    .line 1741
    :cond_2
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v3}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_5

    .line 1742
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getCurrentAEState()Ljava/lang/Integer;

    move-result-object v0

    .line 1743
    .local v0, "currentAEState":Ljava/lang/Integer;
    if-eqz v0, :cond_4

    .line 1744
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_3

    .line 1743
    :goto_0
    return v1

    :cond_3
    move v1, v2

    .line 1744
    goto :goto_0

    :cond_4
    move v1, v2

    .line 1743
    goto :goto_0

    .line 1747
    .end local v0    # "currentAEState":Ljava/lang/Integer;
    :cond_5
    return v2
.end method

.method public isNeedPreviewThumbnail()Z
    .locals 1

    .prologue
    .line 1752
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1753
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1754
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result v0

    .line 1752
    :goto_0
    return v0

    .line 1753
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 1752
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSessionReady()Z
    .locals 1

    .prologue
    .line 1149
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lockExposure(Z)V
    .locals 2
    .param p1, "lock"    # Z

    .prologue
    .line 1778
    const-string/jumbo v0, "lockExposure"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1779
    return-void

    .line 1782
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1783
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1784
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1785
    return-void
.end method

.method public notifyVideoStreamEnd()V
    .locals 6

    .prologue
    .line 533
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v3, :cond_0

    .line 534
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "notifyVideoStreamEnd: session is not ready"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/camera2/MiCamera2;->mPendingNotifyVideoEnd:Z

    .line 536
    return-void

    .line 540
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v3}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 543
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 544
    .local v0, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 545
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 546
    const/4 v3, 0x0

    invoke-static {v0, v3}, Lcom/android/camera2/compat/MiCameraCompat;->applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 547
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v3, v4, v5}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v2

    .line 548
    .local v2, "requestId":I
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "notifyVideoStreamEnd: requestId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 552
    .end local v0    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v2    # "requestId":I
    :goto_0
    return-void

    .line 549
    :catch_0
    move-exception v1

    .line 550
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public pausePreview()V
    .locals 5

    .prologue
    .line 729
    const-string/jumbo v2, "pausePreview"

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 730
    return-void

    .line 732
    :cond_0
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "pausePreview: cameraId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    :try_start_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 743
    :goto_0
    return-void

    .line 739
    :catch_0
    move-exception v1

    .line 740
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to pause preview, IllegalState"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 741
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 735
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 736
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 737
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to pause preview"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 1
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 799
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    if-eqz v0, :cond_0

    .line 800
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    invoke-virtual {v0, p1}, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->setClientCb(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 802
    :cond_0
    return-void
.end method

.method public releasePictureCallback()V
    .locals 1

    .prologue
    .line 806
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 807
    return-void
.end method

.method public releasePreview()V
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 747
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v2, :cond_0

    .line 748
    return-void

    .line 750
    :cond_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    if-eqz v2, :cond_1

    .line 751
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 752
    iput-object v3, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    .line 755
    :cond_1
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "releasePreview: cameraId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 757
    :try_start_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 758
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 759
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 768
    :goto_0
    return-void

    .line 764
    :catch_0
    move-exception v1

    .line 765
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to release preview, IllegalState"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 766
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 760
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 761
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 762
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to release preview"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 763
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public resetConfigs()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 772
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "resetConfigs"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    if-eqz v0, :cond_0

    .line 774
    new-instance v0, Lcom/android/camera2/CameraConfigs;

    invoke-direct {v0}, Lcom/android/camera2/CameraConfigs;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 776
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 777
    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->setShutterCallback(Lcom/android/camera2/Camera2Proxy$ShutterCallback;)V

    .line 778
    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 779
    return-void
.end method

.method public resumePreview()V
    .locals 9

    .prologue
    .line 695
    const-string/jumbo v6, "resumePreview"

    invoke-direct {p0, v6}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 696
    return-void

    .line 698
    :cond_0
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    instance-of v3, v6, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;

    .line 699
    .local v3, "isHighSpeed":Z
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "resumePreview: cameraId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " highSpeed="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 701
    if-eqz v3, :cond_1

    .line 702
    :try_start_0
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v4

    .line 706
    .local v4, "request":Landroid/hardware/camera2/CaptureRequest;
    invoke-direct {p0, v4}, Lcom/android/camera2/MiCamera2;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object v5

    .line 707
    .local v5, "requestList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v7, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v8, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v6, v5, v7, v8}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 725
    .end local v4    # "request":Landroid/hardware/camera2/CaptureRequest;
    .end local v5    # "requestList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    :goto_0
    return-void

    .line 709
    :cond_1
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v4

    .line 710
    .restart local v4    # "request":Landroid/hardware/camera2/CaptureRequest;
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v7, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v8, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v6, v4, v7, v8}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v2

    .line 711
    .local v2, "id":I
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "repeating sequenceId: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 718
    .end local v2    # "id":I
    .end local v4    # "request":Landroid/hardware/camera2/CaptureRequest;
    :catch_0
    move-exception v0

    .line 719
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Failed to resume preview"

    invoke-static {v6, v7, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 720
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 721
    .end local v0    # "e":Landroid/hardware/camera2/CameraAccessException;
    :catch_1
    move-exception v1

    .line 722
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v6, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Failed to resume preview, IllegalState"

    invoke-static {v6, v7, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 723
    const/16 v6, 0x100

    invoke-virtual {p0, v6}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public setAELock(Z)V
    .locals 4
    .param p1, "lock"    # Z

    .prologue
    .line 1596
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setAELock: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1597
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAELock(Z)Z

    move-result v0

    .line 1598
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1599
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1, p1}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1601
    :cond_0
    return-void
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
    .locals 3
    .param p1, "regions"    # [Landroid/hardware/camera2/params/MeteringRectangle;

    .prologue
    .line 1578
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "setAERegions"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1579
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    move-result v0

    .line 1580
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1581
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1583
    :cond_0
    return-void
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
    .locals 3
    .param p1, "regions"    # [Landroid/hardware/camera2/params/MeteringRectangle;

    .prologue
    .line 1587
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "setAFRegions"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1588
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    move-result v0

    .line 1589
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1590
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1592
    :cond_0
    return-void
.end method

.method public setASD(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 1347
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAiSceneDetectEnable(Z)Z

    move-result v0

    .line 1348
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1349
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAiSceneDetectEnable(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1351
    :cond_0
    return-void
.end method

.method public setASDPeriod(I)V
    .locals 2
    .param p1, "period"    # I

    .prologue
    .line 1354
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAiSceneDetectPeriod(I)Z

    move-result v0

    .line 1355
    .local v0, "hasChanged":Z
    if-eqz v0, :cond_0

    .line 1356
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAiSceneDetectPeriod(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1358
    :cond_0
    return-void
.end method

.method public setAWBLock(Z)V
    .locals 4
    .param p1, "lock"    # Z

    .prologue
    .line 1605
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setAWBLock: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1606
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAWBLock(Z)Z

    move-result v0

    .line 1607
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1608
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1, p1}, Lcom/android/camera2/MiCamera2;->applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1610
    :cond_0
    return-void
.end method

.method public setAWBMode(I)V
    .locals 4
    .param p1, "awbMode"    # I

    .prologue
    .line 1614
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setAWBMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1615
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAWBMode(I)Z

    move-result v0

    .line 1616
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1617
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1619
    :cond_0
    return-void
.end method

.method public setAntiBanding(I)V
    .locals 4
    .param p1, "antiBanding"    # I

    .prologue
    .line 1324
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setAntiBanding: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1325
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setAntiBanding(I)Z

    move-result v0

    .line 1326
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1327
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1329
    :cond_0
    return-void
.end method

.method public setBeautyValues(Lcom/android/camera/effect/BeautyValues;)V
    .locals 1
    .param p1, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    .line 1759
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setBeautyValues(Lcom/android/camera/effect/BeautyValues;)V

    .line 1760
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1761
    return-void
.end method

.method public setBokeh(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1402
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setBokehEnabled(Z)Z

    move-result v0

    .line 1403
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1404
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1406
    :cond_0
    return-void
.end method

.method public setContrast(I)V
    .locals 4
    .param p1, "level"    # I

    .prologue
    .line 1283
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setContrast: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1284
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setContrastLevel(I)Z

    move-result v0

    .line 1285
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1286
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1288
    :cond_0
    return-void
.end method

.method public setCustomAWB(I)V
    .locals 4
    .param p1, "awbValue"    # I

    .prologue
    .line 1623
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setCustomAWB: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1624
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setCustomAWB(I)Z

    move-result v0

    .line 1625
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1626
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1628
    :cond_0
    return-void
.end method

.method public setDeviceOrientation(I)V
    .locals 4
    .param p1, "deviceOrientation"    # I

    .prologue
    .line 1493
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setDeviceOrientation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1494
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setDeviceOrientation(I)Z

    move-result v0

    .line 1495
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1496
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1498
    :cond_0
    return-void
.end method

.method public setDisplayOrientation(I)V
    .locals 3
    .param p1, "displayOrientation"    # I

    .prologue
    .line 1487
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setDisplayOrientation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1488
    iput p1, p0, Lcom/android/camera2/MiCamera2;->mDisplayOrientation:I

    .line 1489
    return-void
.end method

.method public setDualCamWaterMarkEnable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 1439
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setDualCamWaterMarkEnable(Z)Z

    .line 1440
    return-void
.end method

.method public setEnableEIS(Z)V
    .locals 4
    .param p1, "enable"    # Z

    .prologue
    .line 1338
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setEnableEIS: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1339
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setEnableEIS(Z)Z

    move-result v0

    .line 1340
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1341
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1343
    :cond_0
    return-void
.end method

.method public setEnableOIS(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1247
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportOIS()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1248
    return-void

    .line 1250
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setEnableOIS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1251
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setEnableOIS(Z)V

    .line 1252
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1253
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1240
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setEnableZsl "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1241
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setEnableZsl(Z)V

    .line 1242
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1243
    return-void
.end method

.method public setExposureCompensation(I)V
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 1509
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setExposureCompensation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1510
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setExposureCompensationIndex(I)Z

    move-result v0

    .line 1511
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1512
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1514
    :cond_0
    return-void
.end method

.method public setExposureMeteringMode(I)V
    .locals 4
    .param p1, "mode"    # I

    .prologue
    .line 1310
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setExposureMeteringMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1311
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setExposureMeteringMode(I)Z

    move-result v0

    .line 1312
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1313
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1315
    :cond_0
    return-void
.end method

.method public setExposureTime(J)V
    .locals 3
    .param p1, "time"    # J

    .prologue
    .line 1523
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1, p2}, Lcom/android/camera2/CameraConfigs;->setExposureTime(J)Z

    move-result v0

    .line 1524
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1525
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1527
    :cond_0
    return-void
.end method

.method public setFaceAgeAnalyze(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1423
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setFaceAgeAnalyzeEnabled(Z)Z

    move-result v0

    .line 1424
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1425
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1427
    :cond_0
    return-void
.end method

.method public setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;

    .prologue
    .line 1557
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1558
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mFaceCallback:Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 1560
    return-void

    .line 1557
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setFaceScore(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1431
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setFaceScoreEnabled(Z)Z

    move-result v0

    .line 1432
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1433
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1435
    :cond_0
    return-void
.end method

.method public setFaceWaterMarkEnable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 1454
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFaceWaterMarkEnable(Z)Z

    .line 1455
    return-void
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 1
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 1459
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFaceWaterMarkFormat(Ljava/lang/String;)V

    .line 1460
    return-void
.end method

.method public setFlashMode(I)V
    .locals 4
    .param p1, "flashMode"    # I

    .prologue
    .line 1674
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setFlashMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1682
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setFlashMode(I)Z

    move-result v0

    .line 1683
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1684
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1686
    :cond_0
    return-void
.end method

.method public setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$FocusCallback;

    .prologue
    .line 1540
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1541
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 1543
    return-void

    .line 1540
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setFocusDistance(F)V
    .locals 4
    .param p1, "distance"    # F

    .prologue
    .line 1665
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setFocusDistance: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1666
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setFocusDistance(F)Z

    move-result v0

    .line 1667
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1668
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1670
    :cond_0
    return-void
.end method

.method public setFocusMode(I)V
    .locals 4
    .param p1, "focusMode"    # I

    .prologue
    .line 1651
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setFocusMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1652
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setFocusMode(I)Z

    move-result v0

    .line 1653
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1654
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1656
    :cond_0
    return-void
.end method

.method public setFpsRange(Landroid/util/Range;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1464
    .local p1, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setFpsRange: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1465
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPreviewFpsRange(Landroid/util/Range;)Z

    .line 1467
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1469
    return-void
.end method

.method public setFrontMirror(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 1770
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFrontMirror(Z)V

    .line 1771
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 1
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 1535
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setGpsLocation(Landroid/location/Location;)V

    .line 1536
    return-void
.end method

.method public setHDR(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1370
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setHDREnabled(Z)Z

    move-result v0

    .line 1371
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1372
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1374
    :cond_0
    return-void
.end method

.method public setHDRCheckerCallback(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;

    .prologue
    .line 1564
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1565
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mHDRCheckerCallback:Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 1567
    return-void

    .line 1564
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setHDRCheckerEnable(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1378
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setHDRCheckerEnabled(Z)Z

    move-result v0

    .line 1379
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1380
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, p1, v2}, Lcom/android/camera2/MiCamera2;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;ZI)V

    .line 1382
    :cond_0
    return-void
.end method

.method public setHHT(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1362
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setHHTEnabled(Z)Z

    move-result v0

    .line 1363
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1364
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1366
    :cond_0
    return-void
.end method

.method public setISO(I)V
    .locals 4
    .param p1, "iso"    # I

    .prologue
    .line 1632
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setISO: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1633
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setISO(I)Z

    move-result v0

    .line 1634
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1635
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1637
    :cond_0
    return-void
.end method

.method public setJpegQuality(I)V
    .locals 1
    .param p1, "quality"    # I

    .prologue
    .line 1213
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setJpegQuality(I)Z

    .line 1214
    return-void
.end method

.method public setJpegRotation(I)V
    .locals 1
    .param p1, "jpegRotation"    # I

    .prologue
    .line 1218
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setJpegRotation(I)Z

    .line 1219
    return-void
.end method

.method public setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V
    .locals 1
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 1203
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setThumbnailSize(Lcom/android/camera/CameraSize;)Z

    .line 1204
    return-void
.end method

.method public setLensDirtyDetect(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1415
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setLensDirtyDetectEnabled(Z)Z

    move-result v0

    .line 1416
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1417
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1419
    :cond_0
    return-void
.end method

.method public setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V
    .locals 0
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    .prologue
    .line 1547
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    .line 1548
    return-void
.end method

.method public setMfnr(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1394
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setMfnrEnabled(Z)Z

    move-result v0

    .line 1395
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1396
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1398
    :cond_0
    return-void
.end method

.method public setNeedPausePreview(Z)V
    .locals 1
    .param p1, "pausePreview"    # Z

    .prologue
    .line 1765
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPausePreview(Z)Z

    .line 1766
    return-void
.end method

.method public setOpticalZoomToTele(Z)V
    .locals 1
    .param p1, "toTele"    # Z

    .prologue
    .line 1333
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-static {v0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1334
    return-void
.end method

.method public setOptimizedFlash(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 1690
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setOptimizedFlash(Z)Z

    .line 1691
    return-void
.end method

.method public setParallelProcessingEnable(ZLjava/lang/String;)V
    .locals 4
    .param p1, "enable"    # Z
    .param p2, "parallelProcessingPath"    # Ljava/lang/String;

    .prologue
    .line 829
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setParallelProcessingEnable: enable="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 830
    const-string/jumbo v3, " path="

    .line 829
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 831
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setParallelEnabled(Z)Z

    move-result v0

    .line 832
    .local v0, "changed":Z
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p2}, Lcom/android/camera2/CameraConfigs;->setParallelProcessingPath(Ljava/lang/String;)V

    .line 834
    if-eqz v0, :cond_0

    .line 835
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 837
    :cond_0
    return-void
.end method

.method public setPictureSize(Lcom/android/camera/CameraSize;)V
    .locals 2
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 1183
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1184
    .local v0, "oldSize":Lcom/android/camera/CameraSize;
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1185
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setPhotoSize(Lcom/android/camera/CameraSize;)Z

    .line 1186
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader(Lcom/android/camera/CameraSize;)V

    .line 1188
    :cond_0
    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)V
    .locals 2
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 1161
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1162
    .local v0, "oldSize":Lcom/android/camera/CameraSize;
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1163
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setPreviewSize(Lcom/android/camera/CameraSize;)Z

    .line 1164
    iget-boolean v1, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz v1, :cond_0

    .line 1165
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader(Lcom/android/camera/CameraSize;)V

    .line 1168
    :cond_0
    return-void
.end method

.method public setSaturation(I)V
    .locals 4
    .param p1, "level"    # I

    .prologue
    .line 1292
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setSaturation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1293
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setSaturationLevel(I)Z

    move-result v0

    .line 1294
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1295
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1297
    :cond_0
    return-void
.end method

.method public setSceneMode(I)V
    .locals 4
    .param p1, "sceneMode"    # I

    .prologue
    .line 1274
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setSceneMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1275
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setSceneMode(I)Z

    move-result v0

    .line 1276
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1277
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1279
    :cond_0
    return-void
.end method

.method public setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    .prologue
    .line 1571
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1572
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 1574
    return-void

    .line 1571
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public setSharpness(I)V
    .locals 4
    .param p1, "level"    # I

    .prologue
    .line 1301
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setSharpness: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1302
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setSharpnessLevel(I)Z

    move-result v0

    .line 1303
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1304
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1306
    :cond_0
    return-void
.end method

.method public setSuperResolution(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 1386
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setSuperResolutionEnabled(Z)Z

    move-result v0

    .line 1387
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1388
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera2/MiCamera2;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1390
    :cond_0
    return-void
.end method

.method public setTimeWaterMarkEnable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 1444
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setTimeWaterMarkEnable(Z)Z

    .line 1445
    return-void
.end method

.method public setTimeWatermarkValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 1449
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setTimeWaterMarkValue(Ljava/lang/String;)V

    .line 1450
    return-void
.end method

.method public setVideoFpsRange(Landroid/util/Range;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1473
    .local p1, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setVideoFpsRange: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1474
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setVideoFpsRange(Landroid/util/Range;)Z

    .line 1475
    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 1
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 1208
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    .line 1209
    return-void
.end method

.method public setZoomRatio(F)V
    .locals 4
    .param p1, "zoom"    # F

    .prologue
    .line 1226
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setZoomRatio "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1227
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1, p1}, Lcom/android/camera2/CameraConfigs;->setZoomRatio(F)Z

    move-result v0

    .line 1228
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 1229
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1231
    :cond_0
    return-void
.end method

.method public startFaceDetection()V
    .locals 2

    .prologue
    .line 1025
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startFaceDetection"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1026
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraConfigs;->setFaceDetectionEnabled(Z)Z

    .line 1027
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1028
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1029
    return-void
.end method

.method public startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V
    .locals 6
    .param p1, "focusTask"    # Lcom/android/camera/module/loader/camera2/FocusTask;
    .param p2, "moduleIndex"    # I

    .prologue
    .line 1080
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "startFocus: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1082
    :try_start_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v3, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setFocusTask(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 1083
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1085
    invoke-direct {p0, p2}, Lcom/android/camera2/MiCamera2;->initFocusRequestBuilder(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 1086
    .local v0, "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1087
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->addFocusCaptureKeysToRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1088
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1089
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    .line 1094
    .local v2, "request":Landroid/hardware/camera2/CaptureRequest;
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v4, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v2, v3, v4}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 1101
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/android/camera2/CameraConfigs;->setFocusMode(I)Z

    .line 1102
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1103
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1104
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFastMotionModule()Z

    move-result v3

    .line 1103
    if-nez v3, :cond_0

    .line 1105
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSlowMotionModule()Z

    move-result v3

    .line 1103
    if-nez v3, :cond_0

    .line 1106
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v3

    .line 1103
    if-eqz v3, :cond_1

    .line 1107
    :cond_0
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v3}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1111
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1116
    .end local v0    # "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v2    # "request":Landroid/hardware/camera2/CaptureRequest;
    :goto_1
    return-void

    .line 1109
    .restart local v0    # "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .restart local v2    # "request":Landroid/hardware/camera2/CaptureRequest;
    :cond_1
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v3}, Lcom/android/camera2/MiCamera2;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1112
    .end local v0    # "afBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v2    # "request":Landroid/hardware/camera2/CaptureRequest;
    :catch_0
    move-exception v1

    .line 1113
    .local v1, "ex":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1114
    sget-object v3, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Failed to start focus"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public startHighSpeedRecordPreview()V
    .locals 2

    .prologue
    .line 664
    const-string/jumbo v0, "startHighSpeedRecordPreview"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 665
    return-void

    .line 668
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startHighSpeedRecordPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 670
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 671
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 672
    return-void
.end method

.method public startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 10
    .param p1, "previewSurface"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "recordSurface"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Surface;",
            "Landroid/view/Surface;",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 491
    .local p3, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const-string/jumbo v0, "startHighSpeedRecordSession"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 492
    return-void

    .line 495
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startHighSpeedRecordSession: previewSurface="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 496
    const-string/jumbo v3, " recordSurface="

    .line 495
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 498
    iput-object p2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    .line 499
    iput-object p3, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    .line 500
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 503
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 504
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 505
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 506
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 507
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    .line 506
    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 509
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 510
    const/4 v0, 0x2

    new-array v0, v0, [Landroid/view/Surface;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    const/4 v3, 0x0

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 511
    .local v9, "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x78

    if-ne v0, v1, :cond_2

    .line 512
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 513
    .local v2, "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "surface$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/Surface;

    .line 514
    .local v7, "surface":Landroid/view/Surface;
    new-instance v0, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {v0, v7}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 526
    .end local v2    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .end local v7    # "surface":Landroid/view/Surface;
    .end local v8    # "surface$iterator":Ljava/util/Iterator;
    .end local v9    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :catch_0
    move-exception v6

    .line 527
    .local v6, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "Failed to start high speed record session"

    invoke-static {v0, v1, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 528
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->close()V

    .line 530
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 516
    .restart local v2    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .restart local v8    # "surface$iterator":Ljava/util/Iterator;
    .restart local v9    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 519
    new-instance v4, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;

    iget v1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-direct {v4, p0, v1, p4}, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 520
    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 516
    const/4 v1, 0x0

    .line 518
    const v3, 0x8078

    .line 516
    invoke-virtual/range {v0 .. v5}, Landroid/hardware/camera2/CameraDevice;->createCustomCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;ILandroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    goto :goto_1

    .line 522
    .end local v2    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .end local v8    # "surface$iterator":Ljava/util/Iterator;
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 523
    new-instance v1, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;

    iget v3, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-direct {v1, p0, v3, p4}, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 524
    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 522
    invoke-virtual {v0, v9, v1, v3}, Landroid/hardware/camera2/CameraDevice;->createConstrainedHighSpeedCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public startHighSpeedRecording()V
    .locals 2

    .prologue
    .line 620
    const-string/jumbo v0, "startHighSpeedRecording"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 621
    return-void

    .line 624
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startHighSpeedRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 626
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 627
    return-void
.end method

.method public startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V
    .locals 2
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$PreviewCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 783
    const-string/jumbo v0, "startPreviewCallback"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 784
    return-void

    .line 786
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startPreviewCallback"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 787
    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz v0, :cond_1

    .line 788
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 789
    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    if-nez v0, :cond_1

    .line 790
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    .line 791
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 792
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 795
    :cond_1
    return-void
.end method

.method public startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 12
    .param p1, "previewSurface"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "enablePreviewCallback"    # Z
    .param p3, "enableRawCallback"    # Z
    .param p4, "operatingMode"    # I
    .param p5, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .prologue
    .line 377
    const-string/jumbo v1, "startPreviewSession"

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 378
    return-void

    .line 381
    :cond_0
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "startPreviewSession: surface="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 383
    iput-boolean p2, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    .line 384
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 387
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader(Lcom/android/camera/CameraSize;)V

    .line 388
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 389
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 391
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 392
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 393
    .local v11, "surfaces":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/Surface;>;"
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 396
    if-eqz p2, :cond_1

    .line 397
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader(Lcom/android/camera/CameraSize;)V

    .line 398
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    :cond_1
    if-eqz p3, :cond_2

    .line 401
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->prepareRawImageReader(Lcom/android/camera/CameraSize;)V

    .line 402
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 405
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/android/camera/Device;->isSupportDynamicLightSpot()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 406
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->prepareDepthImageReader(Lcom/android/camera/CameraSize;)V

    .line 407
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 408
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->preparePortraitRawImageReader(Lcom/android/camera/CameraSize;)V

    .line 409
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    :cond_3
    new-instance v1, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    iget v2, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    move-object/from16 v0, p5

    invoke-direct {v1, p0, v2, v0}, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    .line 414
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 415
    .local v3, "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "surface$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/Surface;

    .line 416
    .local v9, "surface":Landroid/view/Surface;
    new-instance v1, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {v1, v9}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 424
    .end local v3    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .end local v9    # "surface":Landroid/view/Surface;
    .end local v10    # "surface$iterator":Ljava/util/Iterator;
    .end local v11    # "surfaces":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/Surface;>;"
    :catch_0
    move-exception v7

    .line 425
    .local v7, "e":Landroid/hardware/camera2/CameraAccessException;
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Failed to start preview session"

    invoke-static {v1, v2, v7}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 426
    invoke-virtual {v7}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 431
    .end local v7    # "e":Landroid/hardware/camera2/CameraAccessException;
    :goto_1
    return-void

    .line 418
    .restart local v3    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .restart local v10    # "surface$iterator":Ljava/util/Iterator;
    .restart local v11    # "surfaces":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/Surface;>;"
    :cond_4
    :try_start_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 422
    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    .line 423
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 419
    const/4 v2, 0x0

    move/from16 v4, p4

    .line 418
    invoke-virtual/range {v1 .. v6}, Landroid/hardware/camera2/CameraDevice;->createCustomCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;ILandroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 427
    .end local v3    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .end local v10    # "surface$iterator":Ljava/util/Iterator;
    .end local v11    # "surfaces":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/Surface;>;"
    :catch_1
    move-exception v8

    .line 428
    .local v8, "e":Ljava/lang/IllegalStateException;
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Failed to start preview session, IllegalState"

    invoke-static {v1, v2, v8}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 429
    const/16 v1, 0x100

    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1
.end method

.method public startRecordPreview()V
    .locals 5

    .prologue
    .line 634
    const-string/jumbo v2, "startRecordPreview"

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 635
    return-void

    .line 638
    :cond_0
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "startRecordPreview"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    monitor-enter v2

    .line 640
    const/4 v3, 0x0

    :try_start_0
    iput-object v3, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 643
    :try_start_1
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 644
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 645
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 646
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v3, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 648
    :cond_1
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 649
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 657
    :goto_0
    return-void

    .line 639
    :catchall_0
    move-exception v3

    monitor-exit v2

    throw v3

    .line 653
    :catch_0
    move-exception v1

    .line 654
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to start record preview, IllegalState"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 655
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 650
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 651
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to start record preview"

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 652
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 12
    .param p1, "previewSurface"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "recordSurface"    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "enableVideoSnapshot"    # Z
    .param p4, "operatingMode"    # I
    .param p5, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;

    .prologue
    .line 439
    const-string/jumbo v1, "startRecordSession"

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 440
    return-void

    .line 443
    :cond_0
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "startRecordSession: previewSurface="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 444
    const-string/jumbo v4, " recordSurface="

    .line 443
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 446
    iput-object p2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    .line 447
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 448
    iget v1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    iput v1, p0, Lcom/android/camera2/MiCamera2;->mVideoSessionId:I

    .line 451
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 452
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 453
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 454
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v2, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 457
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 459
    if-eqz p3, :cond_2

    .line 460
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getVideoSnapshotSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->prepareVideoSnapshotImageReader(Lcom/android/camera/CameraSize;)V

    .line 461
    const/4 v1, 0x3

    new-array v1, v1, [Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    const/4 v4, 0x0

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 462
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    const/4 v4, 0x2

    aput-object v2, v1, v4

    .line 461
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    .line 467
    .local v11, "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :goto_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 468
    .local v3, "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "surface$iterator":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/Surface;

    .line 469
    .local v9, "surface":Landroid/view/Surface;
    new-instance v1, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {v1, v9}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 477
    .end local v3    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .end local v9    # "surface":Landroid/view/Surface;
    .end local v10    # "surface$iterator":Ljava/util/Iterator;
    .end local v11    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :catch_0
    move-exception v7

    .line 478
    .local v7, "e":Landroid/hardware/camera2/CameraAccessException;
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Failed to start recording session"

    invoke-static {v1, v2, v7}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 479
    invoke-virtual {v7}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 484
    .end local v7    # "e":Landroid/hardware/camera2/CameraAccessException;
    :goto_2
    return-void

    .line 464
    :cond_2
    const/4 v1, 0x2

    :try_start_1
    new-array v1, v1, [Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    const/4 v4, 0x0

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    .restart local v11    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    goto :goto_0

    .line 471
    .restart local v3    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .restart local v10    # "surface$iterator":Ljava/util/Iterator;
    :cond_3
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 475
    new-instance v5, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    iget v2, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    move-object/from16 v0, p5

    invoke-direct {v5, p0, v2, v0}, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 476
    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 472
    const/4 v2, 0x0

    move/from16 v4, p4

    .line 471
    invoke-virtual/range {v1 .. v6}, Landroid/hardware/camera2/CameraDevice;->createCustomCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;ILandroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 480
    .end local v3    # "configurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    .end local v10    # "surface$iterator":Ljava/util/Iterator;
    .end local v11    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :catch_1
    move-exception v8

    .line 481
    .local v8, "e":Ljava/lang/IllegalStateException;
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Failed to start recording session, IllegalState"

    invoke-static {v1, v2, v8}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 482
    const/16 v1, 0x100

    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_2
.end method

.method public startRecording()V
    .locals 4

    .prologue
    .line 556
    const-string/jumbo v2, "startRecording"

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 557
    return-void

    .line 560
    :cond_0
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "startRecording"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    :try_start_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 563
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->setVideoRecordControl(I)V

    .line 566
    :cond_1
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 567
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 568
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 572
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 573
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 581
    :goto_0
    return-void

    .line 577
    :catch_0
    move-exception v1

    .line 578
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to start recording, IllegalState"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 579
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 574
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 575
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to start recording"

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 576
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0
.end method

.method public stopFaceDetection()V
    .locals 2

    .prologue
    .line 1033
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stopFaceDetection"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1034
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraConfigs;->setFaceDetectionEnabled(Z)Z

    .line 1035
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1036
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1037
    return-void
.end method

.method public stopPreviewCallback(Z)V
    .locals 3
    .param p1, "isRelease"    # Z

    .prologue
    const/4 v2, 0x0

    .line 812
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stopPreviewCallback"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 813
    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    .line 814
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    .line 815
    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->setPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 816
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 818
    if-nez p1, :cond_1

    .line 819
    const-string/jumbo v0, "stopPreviewCallback"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 820
    return-void

    .line 822
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 825
    :cond_1
    return-void
.end method

.method public stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V
    .locals 4
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    .prologue
    .line 585
    const-string/jumbo v2, "stopRecording"

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 586
    return-void

    .line 589
    :cond_0
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "stopRecording"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 591
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mObjLock:Ljava/lang/Object;

    monitor-enter v2

    .line 592
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 595
    const/4 v2, 0x2

    :try_start_1
    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->setVideoRecordControl(I)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 604
    :cond_1
    :goto_0
    return-void

    .line 591
    :catchall_0
    move-exception v3

    monitor-exit v2

    throw v3

    .line 599
    :catch_0
    move-exception v1

    .line 600
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to stop recording, IllegalState"

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 601
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 596
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 597
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 598
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Failed to stop recording"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public takePicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 2
    .param p1, "shutterCallback"    # Lcom/android/camera2/Camera2Proxy$ShutterCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "dataCallback"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 842
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "takePicture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 843
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setShutterCallback(Lcom/android/camera2/Camera2Proxy$ShutterCallback;)V

    .line 844
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 845
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->triggerCapture()V

    .line 846
    return-void
.end method

.method public takePortraitPicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 2
    .param p1, "shutterCallback"    # Lcom/android/camera2/Camera2Proxy$ShutterCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "dataCallback"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "portraitRawCallback"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "portraitDepthCallback"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 853
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "takePortraitPicture start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 854
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setShutterCallback(Lcom/android/camera2/Camera2Proxy$ShutterCallback;)V

    .line 855
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 856
    iput-object p3, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageCallback:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    .line 857
    iput-object p4, p0, Lcom/android/camera2/MiCamera2;->mPortraitDepthImageCallback:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    .line 858
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->triggerCapture()V

    .line 859
    return-void
.end method
