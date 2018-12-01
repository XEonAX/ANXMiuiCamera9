.class public Lcom/android/camera/module/Camera2Module;
.super Lcom/android/camera/module/BaseModule;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.implements Lcom/android/camera/ui/ObjectView$ObjectViewListener;
.implements Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera2/Camera2Proxy$ShutterCallback;
.implements Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;
.implements Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;
.implements Lcom/android/camera2/Camera2Proxy$PictureCallback;
.implements Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
.implements Lcom/android/camera2/Camera2Proxy$FocusCallback;
.implements Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;
.implements Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Camera2Module$1;,
        Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;,
        Lcom/android/camera/module/Camera2Module$MainHandler;,
        Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static mIsBeautyFrontOn:Z


# instance fields
.field private volatile isDetectedInHDR:Z

.field private m3ALocked:Z

.field private mAFEndLogTimes:I

.field private mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

.field private mAiSceneEnabled:Z

.field private mAiSceneFloableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mBeautyValues:Lcom/android/camera/effect/BeautyValues;

.field private mBroadcastIntent:Landroid/content/Intent;

.field private mBurstDisposable:Lio/reactivex/disposables/Disposable;

.field private mBurstEmitter:Lio/reactivex/ObservableEmitter;

.field private mBurstNextDelayTime:J

.field private mBurstShotTitle:Ljava/lang/String;

.field private mBurstStartTime:J

.field private mCaptureStartTime:J

.field private mCountdownDisposable:Lio/reactivex/disposables/Disposable;

.field private mCropValue:Ljava/lang/String;

.field private mCurrentAiScene:I

.field private mCurrentAsdScene:I

.field private mCurrentDetectedScene:I

.field private mCurrentFaceScene:I

.field private mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

.field private mEnabledPreviewThumbnail:Z

.field private mFaceDetectionEnabled:Z

.field private mFaceDetectionStarted:Z

.field private mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field private mGroupFaceNum:I

.field private mGroupShot:Lcom/android/camera/groupshot/GroupShot;

.field private mGroupShotTimes:I

.field private mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

.field private mHasAiSceneFilterEffect:Z

.field private mIsImageCaptureIntent:Z

.field private mIsParallelProcess:Z

.field private mIsSaveCaptureImage:Z

.field private mJpegCallbackFinishTime:J

.field private mJpegImageData:[B

.field private mJpegPictureCallbackTime:J

.field private mJpegRotation:I

.field private mKeepBitmapTexture:Z

.field private mLastCaptureTime:J

.field private mLastChangeSceneTime:J

.field private mLatestFaceScene:I

.field private mLensApi:Lcom/google/lens/sdk/LensApi;

.field private mLensStatus:I

.field private mLocation:Landroid/location/Location;

.field private mLongPressedAutoFocus:Z

.field private mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

.field private mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mMultiSnapPictureSize:Lcom/android/camera/CameraSize;

.field private mMultiSnapStatus:Z

.field private mMultiSnapStopRequest:Z

.field private mNeedAutoFocus:Z

.field private mOnResumeTime:J

.field private mOperatingMode:I

.field private mParallelProcessingFilePath:Ljava/lang/String;

.field private mParsedAiScene:I

.field private mPendingMultiCapture:Z

.field private mPortraitDepthData:[B

.field private mPortraitRawData:[B

.field private mQuickCapture:Z

.field private mReceivedJpegCallbackNum:I

.field private mSameFaceSceneDetectedTimes:I

.field private mSaveUri:Landroid/net/Uri;

.field private mSavedJpegCallbackNum:I

.field private mSceneMode:Ljava/lang/String;

.field private mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field private mShootOrientation:I

.field private mShootRotation:F

.field private mShutterCallbackTime:J

.field private mShutterLag:J

.field private mTotalJpegCallbackNum:I

.field private mUpdateImageTitle:Z

.field private mVolumeLongPress:Z

.field private volatile resetedFromMutex:Z


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBurstEmitter:Lio/reactivex/ObservableEmitter;

    return-object v0
.end method

.method static synthetic -get10(Lcom/android/camera/module/Camera2Module;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    return v0
.end method

.method static synthetic -get11(Lcom/android/camera/module/Camera2Module;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    return v0
.end method

.method static synthetic -get12(Lcom/android/camera/module/Camera2Module;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mOnResumeTime:J

    return-wide v0
.end method

.method static synthetic -get13(Lcom/android/camera/module/Camera2Module;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    return v0
.end method

.method static synthetic -get14(Lcom/android/camera/module/Camera2Module;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mSavedJpegCallbackNum:I

    return v0
.end method

.method static synthetic -get15(Lcom/android/camera/module/Camera2Module;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    return v0
.end method

.method static synthetic -get16(Lcom/android/camera/module/Camera2Module;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/module/Camera2Module;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShotTimes:I

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/module/Camera2Module;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    return v0
.end method

.method static synthetic -get7(Lcom/android/camera/module/Camera2Module;)Lcom/google/lens/sdk/LensApi;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    return-object v0
.end method

.method static synthetic -get8(Lcom/android/camera/module/Camera2Module;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    return v0
.end method

.method static synthetic -get9(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/CameraSize;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapPictureSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/module/Camera2Module;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Lio/reactivex/FlowableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFloableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Lio/reactivex/disposables/Disposable;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic -set10(Lcom/android/camera/module/Camera2Module;[B)[B
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # [B

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mPortraitRawData:[B

    return-object p1
.end method

.method static synthetic -set11(Lcom/android/camera/module/Camera2Module;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    return p1
.end method

.method static synthetic -set12(Lcom/android/camera/module/Camera2Module;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mSavedJpegCallbackNum:I

    return p1
.end method

.method static synthetic -set13(Lcom/android/camera/module/Camera2Module;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->resetedFromMutex:Z

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera/module/Camera2Module;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Lio/reactivex/ObservableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic -set3(Lcom/android/camera/module/Camera2Module;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic -set4(Lcom/android/camera/module/Camera2Module;J)J
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # J

    .prologue
    iput-wide p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstStartTime:J

    return-wide p1
.end method

.method static synthetic -set5(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Lio/reactivex/disposables/Disposable;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic -set6(Lcom/android/camera/module/Camera2Module;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mGroupShotTimes:I

    return p1
.end method

.method static synthetic -set7(Lcom/android/camera/module/Camera2Module;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    return p1
.end method

.method static synthetic -set8(Lcom/android/camera/module/Camera2Module;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # Lio/reactivex/FlowableEmitter;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic -set9(Lcom/android/camera/module/Camera2Module;[B)[B
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "-value"    # [B

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mPortraitDepthData:[B

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/module/Camera2Module;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->is3ALocked()Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/Camera2Module;I)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "saveType"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap10(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "scene"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    return-void
.end method

.method static synthetic -wrap11(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setOrientationParameter()V

    return-void
.end method

.method static synthetic -wrap12(Lcom/android/camera/module/Camera2Module;II)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "orientation"    # I
    .param p2, "orientationCompensation"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->setOrientation(II)V

    return-void
.end method

.method static synthetic -wrap13(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->startLensActivity()V

    return-void
.end method

.method static synthetic -wrap14(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "mode"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->startNormalCapture(I)V

    return-void
.end method

.method static synthetic -wrap15(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->stopMultiSnap()V

    return-void
.end method

.method static synthetic -wrap16(Lcom/android/camera/module/Camera2Module;II)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "cameraMode"    # I
    .param p2, "scene"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    return-void
.end method

.method static synthetic -wrap17(Lcom/android/camera/module/Camera2Module;Ljava/lang/String;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "hdrMode"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/module/Camera2Module;I)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "scene"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->shouldChangeAiScene(I)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap3(Lcom/android/camera/module/Camera2Module;Landroid/hardware/camera2/CaptureResult;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "captureResult"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->parseAiSceneResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v0

    return v0
.end method

.method static synthetic -wrap4(Lcom/android/camera/module/Camera2Module;Landroid/hardware/camera2/CaptureResult;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "captureResult"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->parseAsdSceneResult(Landroid/hardware/camera2/CaptureResult;)I

    move-result v0

    return v0
.end method

.method static synthetic -wrap5(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->applyBacklightEffect()V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/camera/module/Camera2Module;IZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "newResult"    # I
    .param p2, "isReset"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->consumeAiSceneResult(IZ)V

    return-void
.end method

.method static synthetic -wrap7(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "newResult"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->consumeAsdSceneResult(I)V

    return-void
.end method

.method static synthetic -wrap8(Lcom/android/camera/module/Camera2Module;ZZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;
    .param p1, "visible"    # Z
    .param p2, "clearFaces"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method static synthetic -wrap9(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 163
    const-class v0, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    .line 144
    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 144
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 205
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 206
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    .line 207
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 208
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 211
    iput-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mBurstNextDelayTime:J

    .line 214
    iput v2, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 215
    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 216
    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mSavedJpegCallbackNum:I

    .line 229
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupFaceNum:I

    .line 239
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    .line 241
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    .line 271
    iput v2, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    .line 3783
    new-instance v0, Lcom/android/camera/module/Camera2Module$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$1;-><init>(Lcom/android/camera/module/Camera2Module;)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    .line 4358
    iput-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mLastChangeSceneTime:J

    .line 4370
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->resetedFromMutex:Z

    .line 144
    return-void
.end method

.method private animateCapture()V
    .locals 2

    .prologue
    .line 1316
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_0

    .line 1317
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraRotation()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->animateCapture(I)V

    .line 1319
    :cond_0
    return-void
.end method

.method private applyBacklightEffect()V
    .locals 2

    .prologue
    const/16 v1, 0x17

    .line 4687
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 4688
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 4690
    const-string/jumbo v0, "normal"

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    .line 4691
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetEvValue()V

    .line 4692
    return-void
.end method

.method private composeDepthMapPicture([B[B[B)[B
    .locals 16
    .param p1, "jpegData"    # [B
    .param p2, "depthMapOriginalData"    # [B
    .param p3, "rawData"    # [B

    .prologue
    .line 2505
    sget-object v11, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v12, "composeDepthMapPicture: process in portrait depth map picture"

    invoke-static {v11, v12}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2506
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 2507
    .local v8, "startTime":J
    new-instance v3, Lcom/android/camera2/ArcsoftDepthMap;

    move-object/from16 v0, p2

    invoke-direct {v3, v0}, Lcom/android/camera2/ArcsoftDepthMap;-><init>([B)V

    .line 2509
    .local v3, "depthMap":Lcom/android/camera2/ArcsoftDepthMap;
    const/4 v4, 0x0

    .line 2510
    .local v4, "dulCameraWaterMark":[B
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 2512
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v7, v11}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 2513
    .local v7, "is":Ljava/io/InputStream;
    invoke-static {v7}, Lmiui/util/IOUtils;->toByteArray(Ljava/io/InputStream;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 2518
    .end local v4    # "dulCameraWaterMark":[B
    .end local v7    # "is":Ljava/io/InputStream;
    :cond_0
    :goto_0
    const/4 v10, 0x0

    .line 2519
    .local v10, "timeWaterMark":[B
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 2520
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v11}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v12}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v12

    invoke-static {v11, v12}, Lcom/android/camera/Util;->getTimeWaterMarkData(II)[B

    move-result-object v10

    .line 2522
    .end local v10    # "timeWaterMark":[B
    :cond_1
    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v4, v10}, Lcom/android/camera2/ArcsoftDepthMap;->writeDepthExif([B[B[B)[B

    move-result-object p1

    .line 2523
    invoke-virtual {v3}, Lcom/android/camera2/ArcsoftDepthMap;->getDepthMapData()[B

    move-result-object v2

    .line 2524
    .local v2, "depthData":[B
    move-object/from16 v0, p1

    array-length v11, v0

    move-object/from16 v0, p3

    array-length v12, v0

    add-int/2addr v11, v12

    array-length v12, v2

    add-int/2addr v11, v12

    new-array v6, v11, [B

    .line 2526
    .local v6, "finalJpegData":[B
    move-object/from16 v0, p1

    array-length v11, v0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v12, v6, v13, v11}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2528
    move-object/from16 v0, p1

    array-length v11, v0

    move-object/from16 v0, p3

    array-length v12, v0

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-static {v0, v13, v6, v11, v12}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2531
    move-object/from16 v0, p1

    array-length v11, v0

    move-object/from16 v0, p3

    array-length v12, v0

    add-int/2addr v11, v12

    array-length v12, v2

    .line 2530
    const/4 v13, 0x0

    invoke-static {v2, v13, v6, v11, v12}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 2532
    sget-object v11, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "composeDepthMapPicture: compose portrait picture cost: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 2533
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long/2addr v14, v8

    .line 2532
    invoke-virtual {v12, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2535
    return-object v6

    .line 2514
    .end local v2    # "depthData":[B
    .end local v6    # "finalJpegData":[B
    .restart local v4    # "dulCameraWaterMark":[B
    :catch_0
    move-exception v5

    .line 2515
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private consumeAiSceneResult(IZ)V
    .locals 9
    .param p1, "newResult"    # I
    .param p2, "isReset"    # Z

    .prologue
    .line 4473
    iget v6, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    if-ne v6, p1, :cond_0

    .line 4474
    return-void

    .line 4477
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_2

    .line 4478
    :cond_1
    return-void

    .line 4481
    :cond_2
    if-eqz p2, :cond_3

    iget-boolean v6, p0, Lcom/android/camera/module/Camera2Module;->resetedFromMutex:Z

    if-eqz v6, :cond_3

    .line 4482
    return-void

    .line 4485
    :cond_3
    if-nez p2, :cond_4

    .line 4486
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/android/camera/module/Camera2Module;->resetedFromMutex:Z

    .line 4488
    :cond_4
    sget-object v6, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "consumeAiSceneResult: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "; isReset: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4489
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v6

    .line 4490
    const/16 v7, 0xac

    .line 4489
    invoke-virtual {v6, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v5

    check-cast v5, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 4492
    .local v5, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v6

    .line 4493
    const/16 v7, 0xa4

    .line 4492
    invoke-virtual {v6, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 4495
    .local v0, "config":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    packed-switch p1, :pswitch_data_0

    .line 4609
    :pswitch_0
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 4610
    sget-object v6, Lcom/android/camera/constant/UpdateConstant;->AI_SCENE_CONFIG:[I

    invoke-virtual {p0, v6}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 4614
    :goto_0
    iget v6, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {p0, v6, p1}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 4615
    invoke-interface {v5, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 4616
    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(ILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 4617
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 4618
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 4619
    if-nez p2, :cond_5

    .line 4620
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4622
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    .line 4623
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 4624
    return-void

    .line 4497
    :pswitch_1
    new-instance v2, Lcom/android/camera/module/Camera2Module$23;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Camera2Module$23;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4517
    .local v2, "listener":Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;
    const-string/jumbo v6, "e"

    .line 4518
    const/16 v7, 0xc2

    const/16 v8, 0xc1

    .line 4517
    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-interface {v0, v6, v7}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 4519
    const/16 v6, 0x17

    invoke-interface {v5, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 4520
    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-interface {v5, v6, v7, v8}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertHDR(IZZ)V

    .line 4521
    const/4 v6, 0x0

    invoke-interface {v5, v6, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(ILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 4522
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->applyBacklightEffect()V

    .line 4523
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 4524
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 4525
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4526
    return-void

    .line 4528
    .end local v2    # "listener":Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;
    :pswitch_2
    iget v6, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v7, 0x19

    invoke-direct {p0, v6, v7}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 4529
    const/16 v6, 0x19

    invoke-interface {v5, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 4530
    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(ILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 4531
    const/16 v6, 0x19

    invoke-direct {p0, v6}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 4532
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4533
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 4535
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 4536
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 4537
    return-void

    .line 4540
    :pswitch_3
    const-string/jumbo v6, "e"

    .line 4541
    const/16 v7, 0xc2

    const/16 v8, 0xc1

    .line 4540
    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-interface {v0, v6, v7}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 4543
    const-string/jumbo v6, "0"

    invoke-virtual {p0, v6}, Lcom/android/camera/module/Camera2Module;->setFlashMode(Ljava/lang/String;)V

    .line 4544
    const/4 v6, 0x1

    invoke-direct {p0, v6}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 4545
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateOIS()V

    goto/16 :goto_0

    .line 4548
    :pswitch_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSharpness()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 4549
    .local v4, "sharpValue1":I
    const/4 v6, 0x6

    if-ge v4, v6, :cond_6

    .line 4550
    add-int/lit8 v4, v4, 0x1

    .line 4552
    :cond_6
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4553
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 4554
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v6, v4}, Lcom/android/camera2/Camera2Proxy;->setSharpness(I)V

    goto/16 :goto_0

    .line 4557
    .end local v4    # "sharpValue1":I
    :pswitch_5
    invoke-static {}, Lcom/android/camera/CameraSettings;->getContrast()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 4558
    .local v1, "contrastLevel":I
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v6, v1}, Lcom/android/camera2/Camera2Proxy;->setContrast(I)V

    .line 4559
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4560
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 4561
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSuperResolution()V

    goto/16 :goto_0

    .line 4565
    .end local v1    # "contrastLevel":I
    :pswitch_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSharpness()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 4566
    .local v3, "sharpValue":I
    const/4 v6, 0x6

    if-ge v3, v6, :cond_7

    .line 4567
    add-int/lit8 v3, v3, 0x1

    .line 4569
    :cond_7
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v6, v3}, Lcom/android/camera2/Camera2Proxy;->setSharpness(I)V

    .line 4570
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4571
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4575
    .end local v3    # "sharpValue":I
    :pswitch_7
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4576
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4583
    :pswitch_8
    const-string/jumbo v6, "e"

    .line 4584
    const/16 v7, 0xc2

    const/16 v8, 0xc1

    .line 4583
    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-interface {v0, v6, v7}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 4585
    const-string/jumbo v6, "normal"

    invoke-direct {p0, v6}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4595
    :pswitch_9
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/android/camera/data/data/feature/DataItemFeature;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/data/feature/DataItemFeature;->supportIndiaAi()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 4596
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 4597
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 4600
    :cond_8
    const/4 p1, 0x0

    .line 4601
    const-string/jumbo v6, "e"

    invoke-interface {v0, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 4602
    sget-object v6, Lcom/android/camera/constant/UpdateConstant;->AI_SCENE_CONFIG:[I

    invoke-virtual {p0, v6}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto/16 :goto_0

    .line 4495
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_8
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
    .end packed-switch
.end method

.method private consumeAsdSceneResult(I)V
    .locals 1
    .param p1, "newResult"    # I

    .prologue
    .line 4252
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    if-ne v0, p1, :cond_0

    .line 4253
    return-void

    .line 4256
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->exitAsdScene(I)V

    .line 4257
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->enterAsdScene(I)V

    .line 4258
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    .line 4259
    return-void
.end method

.method private doAttach()V
    .locals 15

    .prologue
    const/4 v14, -0x1

    .line 2585
    iget-boolean v11, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v11, :cond_0

    .line 2586
    return-void

    .line 2588
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    .line 2589
    .local v2, "data":[B
    iget-boolean v11, p0, Lcom/android/camera/module/Camera2Module;->mIsSaveCaptureImage:Z

    if-eqz v11, :cond_1

    .line 2590
    invoke-direct {p0, v2}, Lcom/android/camera/module/Camera2Module;->saveJpegData([B)V

    .line 2592
    :cond_1
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mCropValue:Ljava/lang/String;

    if-nez v11, :cond_3

    .line 2597
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    if-eqz v11, :cond_2

    .line 2598
    const/4 v7, 0x0

    .line 2600
    .local v7, "outputStream":Ljava/io/OutputStream;
    :try_start_0
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v12, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    invoke-virtual {v11, v12}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v7

    .line 2601
    .local v7, "outputStream":Ljava/io/OutputStream;
    invoke-virtual {v7, v2}, Ljava/io/OutputStream;->write([B)V

    .line 2602
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 2604
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v12, -0x1

    invoke-virtual {v11, v12}, Lcom/android/camera/Camera;->setResult(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2610
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v11}, Lcom/android/camera/Camera;->finish()V

    .line 2611
    invoke-static {v7}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2661
    .end local v7    # "outputStream":Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 2605
    :catch_0
    move-exception v4

    .line 2607
    .local v4, "ex":Ljava/io/IOException;
    :try_start_1
    sget-object v11, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v12, "IOException when doAttach"

    invoke-static {v11, v12}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2608
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2610
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v11}, Lcom/android/camera/Camera;->finish()V

    .line 2611
    invoke-static {v7}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 2609
    .end local v4    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    .line 2610
    iget-object v12, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v12}, Lcom/android/camera/Camera;->finish()V

    .line 2611
    invoke-static {v7}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2609
    throw v11

    .line 2614
    :cond_2
    const v11, 0xc800

    invoke-static {v2, v11}, Lcom/android/camera/Util;->makeBitmap([BI)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2615
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    invoke-static {v11}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v6

    .line 2616
    .local v6, "orientation":I
    invoke-static {v0, v6}, Lcom/android/camera/Util;->rotate(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2617
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 2618
    new-instance v12, Landroid/content/Intent;

    const-string/jumbo v13, "inline-data"

    invoke-direct {v12, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "data"

    invoke-virtual {v12, v13, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v12

    .line 2617
    invoke-virtual {v11, v14, v12}, Lcom/android/camera/Camera;->setResult(ILandroid/content/Intent;)V

    .line 2619
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v11}, Lcom/android/camera/Camera;->finish()V

    goto :goto_0

    .line 2623
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v6    # "orientation":I
    :cond_3
    const/4 v10, 0x0

    .line 2624
    .local v10, "tempUri":Landroid/net/Uri;
    const/4 v9, 0x0

    .line 2626
    .local v9, "tempStream":Ljava/io/FileOutputStream;
    :try_start_2
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const-string/jumbo v12, "crop-temp"

    invoke-virtual {v11, v12}, Lcom/android/camera/Camera;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 2627
    .local v8, "path":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 2628
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const-string/jumbo v12, "crop-temp"

    const/4 v13, 0x0

    invoke-virtual {v11, v12, v13}, Lcom/android/camera/Camera;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v9

    .line 2629
    .local v9, "tempStream":Ljava/io/FileOutputStream;
    invoke-virtual {v9, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 2630
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 2631
    const/4 v9, 0x0

    .line 2632
    .local v9, "tempStream":Ljava/io/FileOutputStream;
    invoke-static {v8}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v10

    .line 2642
    .local v10, "tempUri":Landroid/net/Uri;
    invoke-static {v9}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2644
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 2645
    .local v5, "newExtras":Landroid/os/Bundle;
    const-string/jumbo v11, "circle"

    iget-object v12, p0, Lcom/android/camera/module/Camera2Module;->mCropValue:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 2646
    const-string/jumbo v11, "circleCrop"

    const-string/jumbo v12, "true"

    invoke-virtual {v5, v11, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2648
    :cond_4
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    if-eqz v11, :cond_5

    .line 2649
    const-string/jumbo v11, "output"

    iget-object v12, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    invoke-virtual {v5, v11, v12}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 2654
    :goto_1
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v11, "com.android.camera.action.CROP"

    invoke-direct {v1, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2656
    .local v1, "cropIntent":Landroid/content/Intent;
    invoke-virtual {v1, v10}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 2657
    invoke-virtual {v1, v5}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 2659
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/16 v12, 0x3e8

    invoke-virtual {v11, v1, v12}, Lcom/android/camera/Camera;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 2637
    .end local v1    # "cropIntent":Landroid/content/Intent;
    .end local v5    # "newExtras":Landroid/os/Bundle;
    .end local v8    # "path":Ljava/io/File;
    .end local v9    # "tempStream":Ljava/io/FileOutputStream;
    .local v10, "tempUri":Landroid/net/Uri;
    :catch_1
    move-exception v4

    .line 2638
    .restart local v4    # "ex":Ljava/io/IOException;
    :try_start_3
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/android/camera/Camera;->setResult(I)V

    .line 2639
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v11}, Lcom/android/camera/Camera;->finish()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2642
    invoke-static {v9}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2640
    return-void

    .line 2633
    .end local v4    # "ex":Ljava/io/IOException;
    :catch_2
    move-exception v3

    .line 2634
    .local v3, "ex":Ljava/io/FileNotFoundException;
    :try_start_4
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/android/camera/Camera;->setResult(I)V

    .line 2635
    iget-object v11, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v11}, Lcom/android/camera/Camera;->finish()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 2642
    invoke-static {v9}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2636
    return-void

    .line 2641
    .end local v3    # "ex":Ljava/io/FileNotFoundException;
    :catchall_1
    move-exception v11

    .line 2642
    invoke-static {v9}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 2641
    throw v11

    .line 2651
    .restart local v5    # "newExtras":Landroid/os/Bundle;
    .restart local v8    # "path":Ljava/io/File;
    .restart local v9    # "tempStream":Ljava/io/FileOutputStream;
    .local v10, "tempUri":Landroid/net/Uri;
    :cond_5
    const-string/jumbo v11, "return-data"

    const/4 v12, 0x1

    invoke-virtual {v5, v11, v12}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_1
.end method

.method private doLaterReleaseIfNeed()V
    .locals 2

    .prologue
    .line 1742
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 1743
    :cond_0
    return-void

    .line 1745
    :cond_1
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "doLaterRelease"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1746
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_2

    .line 1747
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1749
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_3

    .line 1750
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->releaseAll(Z)V

    .line 1752
    :cond_3
    return-void
.end method

.method private enablePreviewAsThumbnail()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2217
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2218
    return v1

    .line 2222
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2223
    return v1

    .line 2227
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2228
    return v1

    .line 2231
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2232
    return v2

    .line 2236
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2237
    :cond_4
    return v1

    .line 2241
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isNeedPreviewThumbnail()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2242
    return v2

    .line 2245
    :cond_6
    return v1
.end method

.method private enterAsdScene(I)V
    .locals 9
    .param p1, "currentAsdScene"    # I

    .prologue
    const/16 v8, 0xa

    const/4 v7, 0x1

    const/4 v6, 0x6

    const/4 v5, 0x4

    const/4 v4, 0x0

    .line 4294
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 4295
    const/16 v3, 0xac

    .line 4294
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 4296
    .local v1, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    packed-switch p1, :pswitch_data_0

    .line 4336
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 4298
    :pswitch_1
    invoke-interface {v1, v4, v4, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    goto :goto_0

    .line 4301
    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 4302
    .local v0, "currentFlash":Ljava/lang/String;
    const-string/jumbo v2, "3"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4303
    new-array v2, v7, [I

    aput v8, v2, v4

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 4304
    :cond_1
    const-string/jumbo v2, "103"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4305
    invoke-interface {v1, v4, v4, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    .line 4306
    new-array v2, v7, [I

    aput v8, v2, v4

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 4310
    .end local v0    # "currentFlash":Ljava/lang/String;
    :pswitch_3
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v2, :cond_0

    .line 4311
    invoke-direct {p0, v4}, Lcom/android/camera/module/Camera2Module;->setPortraitSuccessHintVisible(I)V

    goto :goto_0

    .line 4315
    :pswitch_4
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v2, :cond_0

    .line 4317
    const v2, 0x7f0f0173

    .line 4316
    invoke-virtual {p0, v6, v2, v5}, Lcom/android/camera/module/Camera2Module;->updateTipMessage(III)V

    goto :goto_0

    .line 4322
    :pswitch_5
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v2, :cond_0

    .line 4324
    const v2, 0x7f0f0174

    .line 4323
    invoke-virtual {p0, v6, v2, v5}, Lcom/android/camera/module/Camera2Module;->updateTipMessage(III)V

    goto :goto_0

    .line 4329
    :pswitch_6
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v2, :cond_0

    .line 4331
    const v2, 0x7f0f0172

    .line 4330
    invoke-virtual {p0, v6, v2, v5}, Lcom/android/camera/module/Camera2Module;->updateTipMessage(III)V

    goto :goto_0

    .line 4296
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private exitAsdScene(I)V
    .locals 6
    .param p1, "lastAsdScene"    # I

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 4263
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 4264
    const/16 v2, 0xac

    .line 4263
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 4265
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    packed-switch p1, :pswitch_data_0

    .line 4290
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 4267
    :pswitch_1
    invoke-interface {v0, v5, v4, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    goto :goto_0

    .line 4270
    :pswitch_2
    const-string/jumbo v1, "103"

    .line 4271
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 4270
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4272
    invoke-interface {v0, v5, v4, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    .line 4274
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/16 v2, 0xa

    aput v2, v1, v4

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 4279
    :pswitch_3
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v1, :cond_0

    .line 4280
    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->hideTipMessage(I)V

    goto :goto_0

    .line 4284
    :pswitch_4
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v1, :cond_0

    .line 4285
    invoke-direct {p0, v5}, Lcom/android/camera/module/Camera2Module;->setPortraitSuccessHintVisible(I)V

    goto :goto_0

    .line 4265
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private faceSceneFiltering(I)Z
    .locals 4
    .param p1, "scene"    # I

    .prologue
    const/16 v2, 0x14

    const/4 v3, 0x0

    .line 4643
    const/16 v0, 0x14

    .line 4645
    .local v0, "MAX_SAME_DETECTED_TIMES":I
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mLatestFaceScene:I

    if-eq v1, p1, :cond_1

    .line 4646
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mLatestFaceScene:I

    .line 4647
    iput v3, p0, Lcom/android/camera/module/Camera2Module;->mSameFaceSceneDetectedTimes:I

    .line 4657
    :cond_0
    return v3

    .line 4648
    :cond_1
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mSameFaceSceneDetectedTimes:I

    if-ge v1, v2, :cond_0

    .line 4649
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mSameFaceSceneDetectedTimes:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mSameFaceSceneDetectedTimes:I

    .line 4650
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mSameFaceSceneDetectedTimes:I

    if-ne v2, v1, :cond_0

    .line 4651
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentFaceScene:I

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mLatestFaceScene:I

    if-eq v1, v2, :cond_0

    .line 4652
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentFaceScene:I

    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mLatestFaceScene:I

    .line 4653
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mLatestFaceScene:I

    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentFaceScene:I

    .line 4654
    const/4 v1, 0x1

    return v1
.end method

.method private getCountDownTimes()I
    .locals 3

    .prologue
    .line 1010
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    if-eqz v1, :cond_0

    .line 1011
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    invoke-static {v1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    .line 1015
    .local v0, "countdownTime":I
    :goto_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1017
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    if-eqz v1, :cond_1

    .line 1018
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 1022
    :goto_1
    sparse-switch v0, :sswitch_data_0

    .line 1028
    const/4 v1, 0x3

    return v1

    .line 1013
    .end local v0    # "countdownTime":I
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    .restart local v0    # "countdownTime":I
    goto :goto_0

    .line 1020
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_1

    .line 1024
    :sswitch_0
    const/4 v1, 0x0

    return v1

    .line 1026
    :sswitch_1
    const/4 v1, 0x5

    return v1

    .line 1031
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCountDownTimes()I

    move-result v1

    return v1

    .line 1022
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5 -> :sswitch_1
    .end sparse-switch
.end method

.method private getDefaultRatio(Ljava/lang/String;Z)I
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "legacyMode"    # Z

    .prologue
    const/4 v5, 0x0

    .line 3169
    if-eqz p2, :cond_3

    .line 3170
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautifyValueRange()[I

    move-result-object v2

    .line 3171
    .local v2, "range":[I
    if-eqz v2, :cond_0

    array-length v3, v2

    const/4 v4, 0x2

    if-eq v3, v4, :cond_1

    .line 3172
    :cond_0
    return v5

    .line 3174
    :cond_1
    const/4 v3, 0x1

    aget v3, v2, v3

    aget v4, v2, v5

    sub-int v1, v3, v4

    .line 3175
    .local v1, "denominator":I
    if-nez v1, :cond_2

    .line 3176
    return v5

    .line 3178
    :cond_2
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->getBeautifyDefaultValue(Ljava/lang/String;)I

    move-result v0

    .line 3179
    .local v0, "defaultValue":I
    aget v3, v2, v5

    sub-int v3, v0, v3

    mul-int/lit8 v3, v3, 0x64

    div-int/2addr v3, v1

    return v3

    .line 3181
    .end local v0    # "defaultValue":I
    .end local v1    # "denominator":I
    .end local v2    # "range":[I
    :cond_3
    return v5
.end method

.method private getDrawJPEGAttribute([BZIILjava/lang/String;ILjava/lang/String;Z)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .locals 22
    .param p1, "jpegData"    # [B
    .param p2, "needThumbnail"    # Z
    .param p3, "resultWidth"    # I
    .param p4, "resultHeight"    # I
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "orientation"    # I
    .param p7, "algorithmName"    # Ljava/lang/String;
    .param p8, "applyWaterMark"    # Z

    .prologue
    .line 2472
    new-instance v3, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .line 2475
    move/from16 v0, p3

    move/from16 v1, p4

    if-le v0, v1, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 2477
    :goto_0
    move/from16 v0, p4

    move/from16 v1, p3

    if-le v0, v1, :cond_1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 2481
    :goto_1
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/android/camera/effect/EffectController;->getEffect(Z)I

    move-result v10

    .line 2482
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->copyEffectRectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-result-object v11

    .line 2483
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    if-nez v2, :cond_2

    const/4 v12, 0x0

    .line 2485
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 2486
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    move/from16 v16, v0

    .line 2488
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v2

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v2, v2, v4

    if-nez v2, :cond_3

    const/16 v18, 0x0

    .line 2489
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result v19

    move-object/from16 v4, p1

    move/from16 v5, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v13, p5

    move/from16 v17, p6

    move-object/from16 v20, p7

    move/from16 v21, p8

    .line 2472
    invoke-direct/range {v3 .. v21}, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;-><init>([BZIIIIILcom/android/camera/effect/EffectController$EffectRectAttribute;Landroid/location/Location;Ljava/lang/String;JIIFZLjava/lang/String;Z)V

    return-object v3

    .line 2476
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v6

    goto :goto_0

    .line 2478
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v7

    goto :goto_1

    .line 2483
    :cond_2
    new-instance v12, Landroid/location/Location;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    invoke-direct {v12, v2}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    goto :goto_2

    .line 2488
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    move/from16 v18, v0

    goto :goto_3
.end method

.method private getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 3955
    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object v0

    .line 3956
    .local v0, "preferences":Lcom/android/camera/preferences/CameraSettingPreferences;
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3957
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 3956
    .end local p2    # "defaultValue":Ljava/lang/String;
    :cond_0
    return-object p2
.end method

.method private getOperatingMode()I
    .locals 4

    .prologue
    .line 2019
    const/4 v0, 0x0

    .line 2021
    .local v0, "operatingMode":I
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2022
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters;->isFaceBeautyOn()Z

    move-result v1

    sput-boolean v1, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    .line 2023
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "off"

    .line 2024
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 2023
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2025
    const v0, 0x8007

    .line 2042
    :goto_0
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    .line 2043
    return v0

    .line 2027
    :cond_0
    const v0, 0x8005

    goto :goto_0

    .line 2030
    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 2038
    const v0, 0x8001

    .line 2039
    goto :goto_0

    .line 2032
    :sswitch_0
    const v0, 0x8002

    .line 2033
    goto :goto_0

    .line 2035
    :sswitch_1
    const v0, 0x8003

    .line 2036
    goto :goto_0

    .line 2030
    nop

    :sswitch_data_0
    .sparse-switch
        0xa7 -> :sswitch_1
        0xab -> :sswitch_0
    .end sparse-switch
.end method

.method private getRequestFlashMode()Ljava/lang/String;
    .locals 4

    .prologue
    .line 3550
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSupportSceneMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3551
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getFlashModeByScene(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3552
    .local v1, "override":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3553
    return-object v1

    .line 3557
    .end local v1    # "override":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isSupportedFlashOn()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isSupportedTorch()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    .line 3558
    const-string/jumbo v2, "0"

    return-object v2

    .line 3560
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 3561
    .local v0, "currentFlash":Ljava/lang/String;
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    const/16 v3, 0x9

    if-ne v2, v3, :cond_3

    .line 3562
    const-string/jumbo v2, "3"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3563
    const-string/jumbo v2, "2"

    return-object v2

    .line 3564
    :cond_2
    const-string/jumbo v2, "103"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 3565
    const-string/jumbo v2, "101"

    return-object v2

    .line 3568
    :cond_3
    return-object v0
.end method

.method private getSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3542
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3543
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->getSuffix()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 3545
    :cond_0
    const-string/jumbo v0, ""

    return-object v0
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6
    .param p1, "visible"    # Z
    .param p2, "clearFaces"    # Z

    .prologue
    const/4 v2, 0x1

    .line 959
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v3

    .line 960
    .local v3, "mirror":Z
    if-eqz p1, :cond_2

    .line 962
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFaceBeautyMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 963
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq v2, v0, :cond_1

    .line 964
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 965
    iget v5, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    move v1, p1

    move v4, v2

    .line 964
    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    .line 970
    :cond_1
    :goto_0
    return-void

    .line 968
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0
.end method

.method private hidePostCaptureAlert()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 2568
    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 2569
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2570
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resumePreview()V

    .line 2574
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setEffectViewVisible(Z)V

    .line 2578
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 2579
    const/16 v2, 0xa0

    .line 2578
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 2581
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const/4 v1, 0x6

    .line 2580
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 2582
    return-void

    .line 2572
    .end local v0    # "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startPreview()V

    goto :goto_0
.end method

.method private hideSceneSelector()V
    .locals 2

    .prologue
    .line 683
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$5;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$5;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 691
    return-void
.end method

.method private initAiSceneParser()V
    .locals 2

    .prologue
    .line 4390
    new-instance v0, Lcom/android/camera/module/Camera2Module$19;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$19;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4396
    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 4389
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4397
    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 4389
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4398
    new-instance v1, Lcom/android/camera/module/Camera2Module$20;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$20;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4389
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4404
    new-instance v1, Lcom/android/camera/module/Camera2Module$21;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$21;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4389
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4410
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    .line 4389
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4411
    new-instance v1, Lcom/android/camera/module/Camera2Module$22;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$22;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4389
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

    .line 4420
    return-void
.end method

.method private initBeautyValues(Lcom/android/camera/effect/BeautyValues;Z)V
    .locals 2
    .param p1, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;
    .param p2, "legacyMode"    # Z

    .prologue
    .line 3186
    if-nez p1, :cond_0

    .line 3187
    return-void

    .line 3190
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 3192
    const-string/jumbo v0, "pref_beautify_slim_face_ratio_key"

    .line 3194
    .local v0, "key":Ljava/lang/String;
    invoke-direct {p0, v0, p2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3193
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    .line 3196
    const-string/jumbo v0, "pref_beautify_enlarge_eye_ratio_key"

    .line 3198
    invoke-direct {p0, v0, p2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3197
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    .line 3200
    const-string/jumbo v0, "pref_beautify_skin_color_ratio_key"

    .line 3202
    invoke-direct {p0, v0, p2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3201
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    .line 3204
    const-string/jumbo v0, "pref_beautify_skin_smooth_ratio_key"

    .line 3206
    invoke-direct {p0, v0, p2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3205
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    .line 3207
    return-void
.end method

.method private initFlashAutoStateForTrack(Z)V
    .locals 3
    .param p1, "mBackFlashMode"    # Z

    .prologue
    .line 4777
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFlashAutoModeState:Ljava/lang/String;

    .line 4778
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 4779
    .local v0, "currentFlash":Ljava/lang/String;
    const-string/jumbo v1, "3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4780
    const-string/jumbo v1, "103"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 4779
    if-eqz v1, :cond_2

    .line 4781
    :cond_0
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    const/16 v2, 0x9

    if-eq v1, v2, :cond_1

    if-eqz p1, :cond_3

    .line 4783
    :cond_1
    const-string/jumbo v1, "auto-on"

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFlashAutoModeState:Ljava/lang/String;

    .line 4788
    :cond_2
    :goto_0
    return-void

    .line 4785
    :cond_3
    const-string/jumbo v1, "auto-off"

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFlashAutoModeState:Ljava/lang/String;

    goto :goto_0
.end method

.method private initMetaParser()V
    .locals 4

    .prologue
    .line 4198
    new-instance v0, Lcom/android/camera/module/Camera2Module$15;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$15;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4203
    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 4197
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4204
    const-wide/16 v2, 0x1f4

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4197
    invoke-virtual {v0, v2, v3, v1}, Lio/reactivex/Flowable;->sample(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4205
    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 4197
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4207
    new-instance v1, Lcom/android/camera/module/Camera2Module$16;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$16;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4197
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4214
    new-instance v1, Lcom/android/camera/module/Camera2Module$17;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$17;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4197
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4221
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    .line 4197
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 4222
    new-instance v1, Lcom/android/camera/module/Camera2Module$18;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$18;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4197
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Flowable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 4229
    return-void
.end method

.method private initNewBeautyValues(Lcom/android/camera/effect/BeautyValues;)V
    .locals 3
    .param p1, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    const/4 v2, 0x0

    .line 3210
    if-nez p1, :cond_0

    .line 3211
    return-void

    .line 3214
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 3216
    const-string/jumbo v0, "pref_beautify_slim_face_ratio_key"

    .line 3218
    .local v0, "key":Ljava/lang/String;
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3217
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    .line 3220
    const-string/jumbo v0, "pref_beautify_enlarge_eye_ratio_key"

    .line 3222
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3221
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    .line 3224
    const-string/jumbo v0, "pref_beautify_nose_ratio_key"

    .line 3226
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3225
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    .line 3228
    const-string/jumbo v0, "pref_beautify_risorius_ratio_key"

    .line 3230
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3229
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    .line 3232
    const-string/jumbo v0, "pref_beautify_lips_ratio_key"

    .line 3234
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3233
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    .line 3236
    const-string/jumbo v0, "pref_beautify_chin_ratio_key"

    .line 3238
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3237
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    .line 3240
    const-string/jumbo v0, "pref_beautify_neck_ratio_key"

    .line 3242
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3241
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    .line 3244
    const-string/jumbo v0, "pref_beautify_smile_ratio_key"

    .line 3246
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3245
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    .line 3248
    const-string/jumbo v0, "pref_beautify_slim_nose_ratio_key"

    .line 3250
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    .line 3249
    iput v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    .line 3251
    return-void
.end method

.method private initializeFocusManager()V
    .locals 5

    .prologue
    .line 2767
    new-instance v1, Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 2768
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 2770
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v3

    .line 2771
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v4}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    .line 2767
    invoke-direct {v1, v2, p0, v3, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 2774
    const/4 v0, 0x0

    .line 2775
    .local v0, "rect":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2776
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 2778
    .end local v0    # "rect":Landroid/graphics/Rect;
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 2779
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    .line 2780
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 2779
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 2781
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 2789
    :goto_0
    return-void

    .line 2786
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 2787
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_0
.end method

.method private is3ALocked()Z
    .locals 1

    .prologue
    .line 3764
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    return v0
.end method

.method private isAiSceneEnabled()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 312
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-eqz v2, :cond_2

    .line 313
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v3, 0xa3

    if-eq v2, v3, :cond_0

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v3, 0xa5

    if-ne v2, v3, :cond_1

    .line 312
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 313
    goto :goto_0

    :cond_2
    move v0, v1

    .line 312
    goto :goto_0
.end method

.method private isFaceBeautyOn(Lcom/android/camera/effect/BeautyValues;)Z
    .locals 3
    .param p1, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 4753
    if-nez p1, :cond_0

    .line 4754
    return v1

    .line 4757
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 4758
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAdvancedBeautyOn()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 4759
    iget v2, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    if-gtz v2, :cond_1

    .line 4760
    iget v2, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    if-lez v2, :cond_2

    .line 4759
    :cond_1
    :goto_0
    return v0

    .line 4761
    :cond_2
    iget v2, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    if-gtz v2, :cond_1

    move v0, v1

    goto :goto_0

    .line 4763
    :cond_3
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 4766
    :cond_4
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private isFrontMirror()Z
    .locals 1

    .prologue
    .line 2539
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2540
    const/4 v0, 0x0

    return v0

    .line 2543
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v0

    return v0
.end method

.method private isInCountDown()Z
    .locals 1

    .prologue
    .line 1478
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isNeedRawStream()Z
    .locals 6

    .prologue
    .line 2003
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isEnableDNG()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2005
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v4, 0x25

    invoke-virtual {v3, v4}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v2

    .line 2006
    .local v2, "supportedPictureSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "pictureSize$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraSize;

    .line 2007
    .local v0, "pictureSize":Lcom/android/camera/CameraSize;
    sget-object v3, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2008
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v5, v5, Lcom/android/camera/CameraSize;->width:I

    .line 2007
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2008
    const-string/jumbo v5, "x"

    .line 2007
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2008
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v5, v5, Lcom/android/camera/CameraSize;->height:I

    .line 2007
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2009
    iget v3, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->width:I

    if-ne v3, v4, :cond_0

    .line 2010
    iget v3, v0, Lcom/android/camera/CameraSize;->height:I

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    if-ne v3, v4, :cond_0

    .line 2011
    const/4 v3, 0x1

    return v3

    .line 2015
    .end local v0    # "pictureSize":Lcom/android/camera/CameraSize;
    .end local v1    # "pictureSize$iterator":Ljava/util/Iterator;
    .end local v2    # "supportedPictureSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    :cond_1
    const/4 v3, 0x0

    return v3
.end method

.method private isParallelEnable()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 4098
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraParallelProcessEnable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4099
    return v1

    .line 4104
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4105
    :cond_1
    return v1

    .line 4107
    :cond_2
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 4108
    :cond_3
    const/4 v0, 0x1

    return v0

    .line 4110
    :cond_4
    return v1
.end method

.method private isSelectingCapturedImage()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1516
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v1, :cond_0

    .line 1517
    return v3

    .line 1521
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa0

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 1522
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const v1, 0x7f0a009c

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    .line 1523
    const/16 v2, 0xff3

    .line 1522
    if-eq v1, v2, :cond_1

    .line 1524
    return v3

    .line 1527
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    .prologue
    .line 3974
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const-wide/16 v2, 0x3e8

    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 3975
    return-void
.end method

.method private lockAEAF()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 3757
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "lockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3758
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 3760
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    .line 3761
    return-void
.end method

.method private needImageThumbnail(I)Z
    .locals 2
    .param p1, "saveType"    # I

    .prologue
    const/4 v1, 0x0

    .line 2200
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnabledPreviewThumbnail:Z

    if-eqz v0, :cond_0

    .line 2201
    return v1

    .line 2204
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 2213
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 2210
    :pswitch_1
    return v1

    .line 2204
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private needShowThumbProgressImmediately()Z
    .locals 4

    .prologue
    .line 4080
    const-string/jumbo v0, "pref_qc_camera_exposuretime_key"

    .line 4081
    const v1, 0x7f0f010b

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 4080
    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 4081
    const-wide/32 v2, 0xee6b280

    .line 4080
    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 4082
    const/4 v0, 0x1

    return v0

    .line 4084
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private onPictureTakenFinished(Z)V
    .locals 2
    .param p1, "failed"    # Z

    .prologue
    const/4 v1, 0x1

    .line 2495
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2496
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2497
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 2500
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 2501
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->doLaterReleaseIfNeed()V

    .line 2502
    return-void
.end method

.method private parseAiSceneResult(Landroid/hardware/camera2/CaptureResult;)I
    .locals 12
    .param p1, "captureResult"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    const/4 v7, 0x0

    .line 4431
    const/high16 v0, -0x80000000

    .line 4432
    .local v0, "SCENE_OTHER":I
    const/high16 v4, -0x80000000

    .line 4435
    .local v4, "scene":I
    sget-object v6, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v6}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/hardware/camera2/params/Face;

    .line 4436
    .local v2, "faces":[Landroid/hardware/camera2/params/Face;
    if-eqz v2, :cond_2

    array-length v6, v2

    if-lez v6, :cond_2

    .line 4437
    array-length v8, v2

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_2

    aget-object v1, v2, v6

    .line 4438
    .local v1, "face":Landroid/hardware/camera2/params/Face;
    invoke-virtual {v1}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v9

    const/16 v10, 0x12c

    if-le v9, v10, :cond_0

    .line 4439
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getHDRDetectedScene(Landroid/hardware/camera2/CaptureResult;)I

    move-result v3

    .line 4440
    .local v3, "hdrMode":I
    sget-object v9, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "parseAiSceneResult: AI_SCENE_MODE_HUMAN  face.length = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 4441
    array-length v11, v2

    .line 4440
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 4442
    const-string/jumbo v11, ";face.width = "

    .line 4440
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 4442
    invoke-virtual {v1}, Landroid/hardware/camera2/params/Face;->getBounds()Landroid/graphics/Rect;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v11

    .line 4440
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 4443
    const-string/jumbo v11, ";hdrMode = "

    .line 4440
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 4445
    const/4 v9, 0x1

    if-ne v3, v9, :cond_1

    .line 4446
    const/4 v4, -0x1

    .line 4437
    .end local v3    # "hdrMode":I
    :cond_0
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 4448
    .restart local v3    # "hdrMode":I
    :cond_1
    const/16 v4, 0x19

    goto :goto_1

    .line 4454
    .end local v1    # "face":Landroid/hardware/camera2/params/Face;
    .end local v3    # "hdrMode":I
    :cond_2
    invoke-static {p1}, Lcom/android/camera2/CaptureResultParser;->getAsdDetectedModes(Landroid/hardware/camera2/CaptureResult;)I

    move-result v5

    .line 4455
    .local v5, "sceneResult":I
    invoke-direct {p0, v4}, Lcom/android/camera/module/Camera2Module;->faceSceneFiltering(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 4457
    const/high16 v6, -0x80000000

    if-eq v4, v6, :cond_3

    const/16 v6, 0x1b

    if-ne v5, v6, :cond_6

    .line 4458
    :cond_3
    if-gez v5, :cond_5

    .line 4459
    sget-object v6, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "parseAiSceneResult: parse a error result: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4460
    iput v7, p0, Lcom/android/camera/module/Camera2Module;->mParsedAiScene:I

    .line 4468
    :cond_4
    :goto_2
    iget v6, p0, Lcom/android/camera/module/Camera2Module;->mParsedAiScene:I

    return v6

    .line 4462
    :cond_5
    iput v5, p0, Lcom/android/camera/module/Camera2Module;->mParsedAiScene:I

    goto :goto_2

    .line 4465
    :cond_6
    iput v4, p0, Lcom/android/camera/module/Camera2Module;->mParsedAiScene:I

    goto :goto_2
.end method

.method private parseAsdSceneResult(Landroid/hardware/camera2/CaptureResult;)I
    .locals 5
    .param p1, "captureResult"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 4233
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 4234
    .local v0, "currentAEState":Ljava/lang/Integer;
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    .line 4236
    .local v1, "isFrontCamera":Z
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v4, 0xab

    if-eq v3, v4, :cond_0

    if-eqz v1, :cond_1

    .line 4238
    :cond_0
    invoke-static {p1, v1}, Lcom/android/camera/constant/AsdSceneConstant;->parseRtbSceneResult(Landroid/hardware/camera2/CaptureResult;Z)I

    move-result v2

    .line 4239
    .local v2, "result":I
    return v2

    .line 4240
    .end local v2    # "result":I
    :cond_1
    if-eqz v0, :cond_2

    .line 4241
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 4242
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAsdFlash()Z

    move-result v3

    .line 4240
    if-eqz v3, :cond_2

    .line 4243
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v3, :cond_2

    .line 4244
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->getFlashMode()I

    move-result v3

    const/4 v4, 0x3

    if-ne v4, v3, :cond_2

    .line 4245
    const/4 v3, 0x0

    return v3

    .line 4248
    :cond_2
    const/4 v3, -0x1

    return v3
.end method

.method private parseIntent()V
    .locals 2

    .prologue
    .line 1897
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    .line 1898
    .local v0, "manager":Lcom/android/camera/CameraIntentManager;
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    .line 1899
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v1, :cond_0

    .line 1900
    return-void

    .line 1902
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getExtraSavedUri()Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    .line 1903
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getExtraCropValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCropValue:Ljava/lang/String;

    .line 1904
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getExtraShouldSaveCapture()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsSaveCaptureImage:Z

    .line 1905
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isQuickCapture()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mQuickCapture:Z

    .line 1906
    return-void
.end method

.method private prepareEffectProcessor(I)V
    .locals 3
    .param p1, "effect"    # I

    .prologue
    .line 3019
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-nez v0, :cond_0

    .line 3020
    new-instance v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;-><init>(Lcom/android/camera/ActivityBase;Z)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 3021
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 3022
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->prepareEffectRender(I)V

    .line 3023
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->getJpegQuality(Z)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setQuality(I)V

    .line 3025
    :cond_0
    return-void
.end method

.method private prepareGroupShot()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 587
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getGroupShotNum()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 588
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->initGroupShot(I)V

    .line 589
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    if-eqz v0, :cond_0

    .line 590
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0, v1}, Lcom/android/camera/groupshot/GroupShot;->attach_start(I)I

    .line 594
    :goto_0
    return-void

    .line 592
    :cond_0
    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    goto :goto_0
.end method

.method private prepareNormalCapture()V
    .locals 7

    .prologue
    const/4 v2, 0x0

    const/4 v6, 0x0

    .line 1067
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->isNeedFlashOn()Z

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/camera/module/Camera2Module;->initFlashAutoStateForTrack(Z)V

    .line 1068
    iput-boolean v6, p0, Lcom/android/camera/module/Camera2Module;->mEnabledPreviewThumbnail:Z

    .line 1069
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 1070
    iput v6, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 1071
    iput v6, p0, Lcom/android/camera/module/Camera2Module;->mSavedJpegCallbackNum:I

    .line 1072
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    .line 1073
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v3

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v3, v4}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackCaptureTimeStart(ZI)V

    .line 1074
    iget-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    iput-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mLastCaptureTime:J

    .line 1075
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 1078
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-static {v3, v4}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v3

    iput v3, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    .line 1079
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    invoke-virtual {v3, v4}, Lcom/android/camera2/Camera2Proxy;->setJpegRotation(I)V

    .line 1082
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v1

    .line 1083
    .local v1, "loc":Landroid/location/Location;
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    .line 1084
    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    .line 1087
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFrontMirror()V

    .line 1090
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1091
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    .line 1095
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelEnable()Z

    move-result v0

    .line 1097
    .local v0, "enableParallel":Z
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsParallelProcess:Z

    .line 1098
    if-eqz v0, :cond_1

    .line 1099
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1098
    :cond_1
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mParallelProcessingFilePath:Ljava/lang/String;

    .line 1101
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mParallelProcessingFilePath:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lcom/android/camera2/Camera2Proxy;->setParallelProcessingEnable(ZLjava/lang/String;)V

    .line 1104
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setWaterMark()V

    .line 1105
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setPictureOrientation()V

    .line 1108
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateJpegQuality()V

    .line 1112
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->needShowThumbProgressImmediately()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1113
    invoke-direct {p0, v6}, Lcom/android/camera/module/Camera2Module;->updateThumbProgress(Z)V

    .line 1115
    :cond_2
    return-void
.end method

.method private releaseEffectProcessor()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3978
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-eqz v0, :cond_0

    .line 3979
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 3980
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->release()V

    .line 3981
    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 3983
    :cond_0
    return-void
.end method

.method private resetAiSceneInHdrOrFlashOn()V
    .locals 2

    .prologue
    .line 4661
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isAiSceneEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->resetedFromMutex:Z

    if-nez v0, :cond_0

    .line 4662
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    if-nez v0, :cond_1

    .line 4663
    :cond_0
    return-void

    .line 4666
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 4667
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_4

    .line 4671
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$24;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$24;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 4679
    :cond_3
    return-void

    .line 4668
    :cond_4
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0x15

    if-eq v0, v1, :cond_2

    .line 4669
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0x16

    if-eq v0, v1, :cond_2

    .line 4670
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_3

    goto :goto_0
.end method

.method private resetGradienter()V
    .locals 2

    .prologue
    .line 3961
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3962
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setGradienterEnabled(Z)V

    .line 3964
    :cond_0
    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    .prologue
    .line 3967
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    .line 3968
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 3969
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 3971
    :cond_0
    return-void
.end method

.method private resumePreviewInWorkThread()V
    .locals 1

    .prologue
    .line 2170
    const/4 v0, 0x0

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 2171
    return-void
.end method

.method private saveJpegData([B)V
    .locals 18
    .param p1, "data"    # [B

    .prologue
    .line 2665
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v9

    .line 2666
    .local v9, "loc":Landroid/location/Location;
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v13

    .line 2668
    .local v13, "orientation":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    add-int/2addr v2, v13

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_0

    .line 2669
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v10

    .line 2670
    .local v10, "width":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v11

    .line 2675
    .local v11, "height":I
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v5

    .line 2677
    .local v5, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    .line 2679
    const/16 v3, 0xb

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v4

    .line 2681
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 2682
    const/4 v8, 0x0

    .line 2686
    const/4 v12, 0x0

    .line 2688
    const/4 v14, 0x0

    .line 2689
    const/4 v15, 0x0

    .line 2690
    const/16 v16, 0x1

    .line 2691
    const/16 v17, 0x0

    move-object/from16 v3, p1

    .line 2677
    invoke-virtual/range {v2 .. v17}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZ)V

    .line 2692
    return-void

    .line 2672
    .end local v5    # "title":Ljava/lang/String;
    .end local v10    # "width":I
    .end local v11    # "height":I
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v10

    .line 2673
    .restart local v10    # "width":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v11

    .restart local v11    # "height":I
    goto :goto_0
.end method

.method private setAiSceneEffect(I)V
    .locals 9
    .param p1, "scene"    # I

    .prologue
    const/4 v8, 0x5

    const/4 v5, 0x0

    .line 2992
    sget-object v4, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "setAiSceneEffect: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2995
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/android/camera/effect/EffectController;->getFilterInfo(I)Ljava/util/ArrayList;

    move-result-object v3

    .line 2996
    .local v3, "filterInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    if-ltz p1, :cond_0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le p1, v4, :cond_1

    .line 2997
    :cond_0
    sget-object v4, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "setAiSceneEffect: scene unknown!"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2998
    return-void

    .line 3002
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v2

    .line 3003
    .local v2, "filterId":I
    invoke-static {v2}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v0

    .line 3004
    .local v0, "category":I
    if-eq v0, v8, :cond_2

    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v2, v4, :cond_2

    .line 3005
    return-void

    .line 3007
    :cond_2
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/effect/FilterInfo;

    invoke-virtual {v4}, Lcom/android/camera/effect/FilterInfo;->getId()I

    move-result v1

    .line 3009
    .local v1, "effectId":I
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/android/camera/effect/EffectController;->setAiSceneEffect(I)V

    .line 3010
    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v1, v4, :cond_4

    const/4 v4, 0x1

    :goto_0
    iput-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->mHasAiSceneFilterEffect:Z

    .line 3012
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3013
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 3015
    :cond_3
    return-void

    :cond_4
    move v4, v5

    .line 3010
    goto :goto_0
.end method

.method private setEffectFilter(I)V
    .locals 3
    .param p1, "effect"    # I

    .prologue
    .line 2983
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setEffectFilter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2984
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 2986
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2987
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 2989
    :cond_0
    return-void
.end method

.method private setOrientation(II)V
    .locals 3
    .param p1, "orientation"    # I
    .param p2, "orientationCompensation"    # I

    .prologue
    .line 3642
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 3643
    return-void

    .line 3646
    :cond_0
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    .line 3647
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    .line 3648
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-static {v1, v2}, Lcom/android/camera/Util;->getShootOrientation(Landroid/app/Activity;I)I

    move-result v1

    .line 3647
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->setOrientation(I)V

    .line 3649
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->checkActivityOrientation()V

    .line 3653
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    if-eq v0, p2, :cond_1

    .line 3654
    iput p2, p0, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    .line 3655
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setOrientationParameter()V

    .line 3657
    :cond_1
    return-void
.end method

.method private setOrientationParameter()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 3660
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3661
    return-void

    .line 3663
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 3664
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-ne v0, v2, :cond_2

    .line 3665
    new-array v0, v2, [I

    const/16 v1, 0x23

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 3670
    :cond_1
    :goto_0
    return-void

    .line 3667
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    goto :goto_0
.end method

.method private setPictureOrientation()V
    .locals 2

    .prologue
    .line 3601
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isDeviceLying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    :goto_0
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    .line 3602
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    :goto_1
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    .line 3603
    return-void

    .line 3601
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    goto :goto_0

    .line 3602
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    goto :goto_1
.end method

.method private setPortraitSuccessHintVisible(I)V
    .locals 3
    .param p1, "visible"    # I

    .prologue
    .line 4347
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 4348
    const/16 v2, 0xaf

    .line 4347
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 4349
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->setPortraitHintVisible(I)V

    .line 4350
    return-void
.end method

.method private setPreviewFrameLayoutAspectRatio()V
    .locals 3

    .prologue
    .line 2757
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    if-eqz v0, :cond_0

    .line 2758
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 2759
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v1

    .line 2758
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    .line 2761
    :cond_0
    return-void
.end method

.method private setSceneMode(Ljava/lang/String;)Z
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 3532
    const/4 v1, -0x1

    invoke-static {p1, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 3533
    .local v0, "sceneMode":I
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedSceneModes()[I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3534
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "sceneMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3535
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSceneMode(I)V

    .line 3536
    const/4 v1, 0x1

    return v1

    .line 3538
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private setWaterMark()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 3607
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_0

    .line 3608
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_1

    .line 3613
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    .line 3614
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 3615
    return-void

    .line 3609
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    .line 3607
    if-nez v0, :cond_0

    .line 3610
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, v1, :cond_0

    .line 3611
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mHasAiSceneFilterEffect:Z

    .line 3607
    if-nez v0, :cond_0

    .line 3612
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    .line 3607
    if-nez v0, :cond_0

    .line 3617
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3618
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    .line 3622
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3623
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 3624
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWatermarkValue(Ljava/lang/String;)V

    .line 3628
    :goto_1
    return-void

    .line 3620
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    goto :goto_0

    .line 3626
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    goto :goto_1
.end method

.method private shouldChangeAiScene(I)Z
    .locals 5
    .param p1, "scene"    # I

    .prologue
    const/4 v4, 0x0

    .line 4627
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 4628
    :cond_0
    return v4

    .line 4632
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentDetectedScene:I

    if-eq v0, p1, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mLastChangeSceneTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x12c

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 4633
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentDetectedScene:I

    .line 4634
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mLastChangeSceneTime:J

    .line 4635
    const/4 v0, 0x1

    return v0

    .line 4638
    :cond_2
    return v4
.end method

.method private showPostCaptureAlert()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 2547
    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 2548
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 2550
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->stopFaceDetection(Z)V

    .line 2551
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->pausePreview()V

    .line 2553
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setEffectViewVisible(Z)V

    .line 2557
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 2558
    const/16 v2, 0xa0

    .line 2557
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 2560
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const/4 v1, 0x6

    .line 2559
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 2564
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetMetaDataManager()V

    .line 2565
    return-void
.end method

.method private startCount(I)V
    .locals 4
    .param p1, "time"    # I

    .prologue
    .line 1437
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1438
    const-string/jumbo v0, "startCount:"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1440
    const-wide/16 v0, 0x1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v1, v2}, Lio/reactivex/Observable;->interval(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lio/reactivex/Observable;->take(J)Lio/reactivex/Observable;

    move-result-object v0

    .line 1441
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    .line 1440
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 1442
    new-instance v1, Lcom/android/camera/module/Camera2Module$9;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/Camera2Module$9;-><init>(Lcom/android/camera/module/Camera2Module;I)V

    .line 1440
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 1475
    return-void
.end method

.method private startLensActivity()V
    .locals 6

    .prologue
    .line 4124
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 4125
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    if-nez v3, :cond_0

    .line 4126
    return-void

    .line 4128
    :cond_0
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    if-eqz v3, :cond_1

    .line 4129
    return-void

    .line 4131
    :cond_1
    const/4 v2, 0x0

    .line 4132
    .local v2, "openFeature":I
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3, v4, v2}, Lcom/google/lens/sdk/LensApi;->launchLensActivity(Landroid/app/Activity;I)V

    .line 4147
    .end local v2    # "openFeature":I
    :goto_0
    return-void

    .line 4134
    :cond_2
    sget-object v3, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "start ai lens"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4136
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 4137
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "android.media.action.XIAOAI_CONTROL"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4138
    const-string/jumbo v3, "com.xiaomi.lens"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 4139
    const-string/jumbo v3, "preview_width"

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 4140
    const-string/jumbo v3, "preview_height"

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 4141
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 4142
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v3

    const/high16 v4, 0x7f050000

    const v5, 0x7f050001

    invoke-virtual {v3, v4, v5}, Lcom/android/camera/Camera;->overridePendingTransition(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4143
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 4144
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "onClick: occur a exception"

    invoke-static {v3, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private startNormalCapture(I)V
    .locals 4
    .param p1, "mode"    # I

    .prologue
    .line 1118
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareNormalCapture()V

    .line 1119
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1120
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareGroupShot()V

    .line 1122
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    const-wide/16 v2, 0x1f40

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 1123
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/Device;->isSupportDynamicLightSpot()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1124
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1125
    new-instance v1, Lcom/android/camera/module/Camera2Module$7;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$7;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 1142
    new-instance v2, Lcom/android/camera/module/Camera2Module$8;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Camera2Module$8;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 1124
    invoke-virtual {v0, p0, p0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->takePortraitPicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 1162
    :goto_0
    return-void

    .line 1160
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0, p0}, Lcom/android/camera2/Camera2Proxy;->takePicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    goto :goto_0
.end method

.method private stopMultiSnap()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 494
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v4, 0x31

    invoke-virtual {v2, v4}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 495
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v2, :cond_0

    .line 496
    return-void

    .line 498
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mLastCaptureTime:J

    .line 499
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 501
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "burst: stopMultiSnap | "

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->captureAbortBurst()V

    .line 507
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-nez v2, :cond_1

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 508
    .local v1, "takeNum":I
    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    xor-int/lit8 v0, v2, 0x1

    .line 509
    .local v0, "isBurst":Z
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    .line 510
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    :goto_1
    invoke-virtual {p0, v1, v0, v2}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZ)V

    .line 512
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    .line 514
    iput-object v6, p0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 515
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 516
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const-wide/16 v4, 0x320

    const/16 v3, 0x30

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 517
    return-void

    .line 507
    .end local v0    # "isBurst":Z
    .end local v1    # "takeNum":I
    :cond_1
    const/4 v1, 0x1

    .restart local v1    # "takeNum":I
    goto :goto_0

    .restart local v0    # "isBurst":Z
    :cond_2
    move v2, v3

    .line 510
    goto :goto_1
.end method

.method private trackAISceneChanged(II)V
    .locals 1
    .param p1, "cameraMode"    # I
    .param p2, "scene"    # I

    .prologue
    .line 4683
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackAISceneChanged(IILandroid/content/res/Resources;)V

    .line 4684
    return-void
.end method

.method private trackBeautyInfo(IZLcom/android/camera/effect/BeautyValues;)V
    .locals 1
    .param p1, "takenNum"    # I
    .param p2, "isFrontCamera"    # Z
    .param p3, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    .line 4772
    if-eqz p2, :cond_0

    const-string/jumbo v0, "\u524d\u6444"

    .line 4771
    :goto_0
    invoke-static {p1, v0, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackBeautyInfo(ILjava/lang/String;Lcom/android/camera/effect/BeautyValues;)V

    .line 4774
    return-void

    .line 4772
    :cond_0
    const-string/jumbo v0, "\u540e\u6444"

    goto :goto_0
.end method

.method private trackManualInfo(I)V
    .locals 5
    .param p1, "takenNum"    # I

    .prologue
    .line 4743
    const-string/jumbo v3, "pref_camera_whitebalance_key"

    .line 4744
    const v4, 0x7f0f005a

    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4743
    invoke-direct {p0, v3, v4}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 4745
    .local v2, "whiteBalance":Ljava/lang/String;
    const-string/jumbo v3, "pref_qc_camera_exposuretime_key"

    .line 4746
    const v4, 0x7f0f010b

    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4745
    invoke-direct {p0, v3, v4}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4747
    .local v0, "exposureTime":Ljava/lang/String;
    const-string/jumbo v3, "pref_qc_camera_iso_key"

    .line 4748
    const v4, 0x7f0f009c

    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4747
    invoke-direct {p0, v3, v4}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 4749
    .local v1, "iso":Ljava/lang/String;
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {p1, v2, v0, v1, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTakenInManual(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 4750
    return-void
.end method

.method private unlockAEAF()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 3748
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "unlockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3749
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    .line 3750
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAeLockSupported:Z

    if-eqz v0, :cond_0

    .line 3751
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 3753
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 3754
    return-void
.end method

.method private updateASD()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 626
    iput v2, p0, Lcom/android/camera/module/Camera2Module;->mLatestFaceScene:I

    .line 627
    iput v2, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 628
    iput v2, p0, Lcom/android/camera/module/Camera2Module;->mParsedAiScene:I

    .line 629
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    .line 631
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 632
    invoke-direct {p0, v2}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 633
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-eqz v0, :cond_0

    .line 634
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x12c

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setASDPeriod(I)V

    .line 641
    :goto_0
    return-void

    .line 636
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->hideSceneSelector()V

    .line 637
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateHDRPreference()V

    .line 638
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateFlashPreference()V

    .line 639
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    goto :goto_0
.end method

.method private updateBeauty()V
    .locals 3

    .prologue
    .line 3254
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xa7

    if-ne v1, v2, :cond_0

    .line 3255
    return-void

    .line 3258
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    if-nez v1, :cond_1

    .line 3259
    new-instance v1, Lcom/android/camera/effect/BeautyValues;

    invoke-direct {v1}, Lcom/android/camera/effect/BeautyValues;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    .line 3262
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3263
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraPortraitWithFaceBeauty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3264
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result v1

    .line 3263
    if-eqz v1, :cond_2

    .line 3265
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    iput-object v2, v1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 3290
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setBeautyValues(Lcom/android/camera/effect/BeautyValues;)V

    .line 3291
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFaceAgeAnalyze()V

    .line 3292
    return-void

    .line 3267
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iput-object v2, v1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    goto :goto_0

    .line 3277
    :cond_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v0

    .line 3278
    .local v0, "isClose":Z
    if-eqz v0, :cond_4

    .line 3279
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyCloseValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    goto :goto_0

    .line 3281
    :cond_4
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 3282
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->initNewBeautyValues(Lcom/android/camera/effect/BeautyValues;)V

    goto :goto_0

    .line 3284
    :cond_5
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/android/camera/module/Camera2Module;->initBeautyValues(Lcom/android/camera/effect/BeautyValues;Z)V

    goto :goto_0
.end method

.method private updateBokeh()V
    .locals 4

    .prologue
    .line 644
    const-string/jumbo v1, "on"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v2

    .line 645
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    .line 644
    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 646
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 647
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v1

    .line 646
    if-eqz v1, :cond_1

    .line 648
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v0

    .line 649
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setBokeh(Z)V

    .line 650
    return-void

    .line 644
    :cond_0
    const/4 v0, 0x1

    .local v0, "enable":Z
    goto :goto_0

    .line 646
    .end local v0    # "enable":Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "enable":Z
    goto :goto_0
.end method

.method private updateContrast()V
    .locals 2

    .prologue
    .line 3486
    invoke-static {}, Lcom/android/camera/CameraSettings;->getContrast()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 3487
    .local v0, "level":I
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setContrast(I)V

    .line 3488
    return-void
.end method

.method private updateDeviceOrientation()V
    .locals 2

    .prologue
    .line 3528
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 3529
    return-void
.end method

.method private updateExposureTime()V
    .locals 4

    .prologue
    .line 3477
    const-string/jumbo v1, "pref_qc_camera_exposuretime_key"

    .line 3478
    const v2, 0x7f0f010b

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 3477
    invoke-direct {p0, v1, v2}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3479
    .local v0, "exposureTime":Ljava/lang/String;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/android/camera2/Camera2Proxy;->setExposureTime(J)V

    .line 3480
    return-void
.end method

.method private updateFace()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    .line 3353
    const/4 v1, 0x1

    .line 3354
    .local v1, "faceDrawing":Z
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3355
    :cond_0
    const/4 v0, 0x0

    .line 3370
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v2, :cond_2

    .line 3371
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_8

    xor-int/lit8 v2, v1, 0x1

    :goto_1
    invoke-interface {v4, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 3373
    :cond_2
    if-eqz v0, :cond_9

    .line 3374
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-nez v2, :cond_3

    .line 3375
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    .line 3376
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startFaceDetection()V

    .line 3384
    :cond_3
    :goto_2
    return-void

    .line 3356
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result v2

    if-nez v2, :cond_5

    .line 3357
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v2

    .line 3356
    if-nez v2, :cond_5

    .line 3358
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v2

    .line 3356
    if-nez v2, :cond_5

    .line 3359
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result v2

    .line 3356
    if-eqz v2, :cond_6

    .line 3360
    :cond_5
    const/4 v0, 0x1

    .local v0, "faceDetection":Z
    goto :goto_0

    .line 3362
    .end local v0    # "faceDetection":Z
    :cond_6
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 3363
    const-string/jumbo v4, "pref_camera_facedetection_key"

    .line 3364
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0c0006

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    .line 3362
    invoke-virtual {v2, v4, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 3365
    .local v0, "faceDetection":Z
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v2

    if-nez v2, :cond_7

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3366
    :cond_7
    const/4 v1, 0x0

    goto :goto_0

    .end local v0    # "faceDetection":Z
    :cond_8
    move v2, v3

    .line 3371
    goto :goto_1

    .line 3379
    :cond_9
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-eqz v2, :cond_3

    .line 3380
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->stopFaceDetection(Z)V

    .line 3381
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    goto :goto_2
.end method

.method private updateFaceAgeAnalyze()V
    .locals 3

    .prologue
    .line 659
    const/4 v0, 0x0

    .line 660
    .local v0, "enable":Z
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    const-string/jumbo v2, "pref_camera_show_gender_age_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 661
    const/4 v0, 0x1

    .line 669
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFaceAgeAnalyze(Z)V

    .line 670
    return-void

    .line 662
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    if-eqz v1, :cond_0

    .line 663
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyCloseValue()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    iget-object v2, v2, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 664
    const/4 v0, 0x0

    goto :goto_0

    .line 666
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private updateFaceScore()V
    .locals 3

    .prologue
    .line 654
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    const-string/jumbo v2, "pref_camera_magic_mirror_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 655
    .local v0, "enable":Z
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFaceScore(Z)V

    .line 656
    return-void
.end method

.method private updateFilter()V
    .locals 1

    .prologue
    .line 2978
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 2979
    .local v0, "effect":I
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->setEffectFilter(I)V

    .line 2980
    return-void
.end method

.method private updateFocusArea()V
    .locals 3

    .prologue
    .line 3136
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 3137
    .local v0, "cropRegion":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    .line 3138
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    .line 3137
    :goto_0
    invoke-virtual {v2, v1}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 3140
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 3142
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-eqz v1, :cond_1

    .line 3143
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 3147
    :goto_1
    return-void

    .line 3138
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 3145
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    goto :goto_1
.end method

.method private updateFocusMode()V
    .locals 6

    .prologue
    .line 3300
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3301
    .local v1, "focusMode":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->setFocusMode(Ljava/lang/String;)V

    .line 3303
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFocusModeSwitching()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 3304
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->setFocusModeSwitching(Z)V

    .line 3305
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusStateIfNeeded()V

    .line 3312
    :cond_0
    const-string/jumbo v4, "manual"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 3313
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v3

    .line 3314
    .local v3, "position":I
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v4}, Lcom/android/camera2/CameraCapabilities;->getMinimumFocusDistance()F

    move-result v2

    .line 3316
    .local v2, "minimumFocusDistance":F
    int-to-float v4, v3

    mul-float/2addr v4, v2

    const/high16 v5, 0x447a0000    # 1000.0f

    div-float v0, v4, v5

    .line 3317
    .local v0, "distance":F
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusDistance(F)V

    .line 3322
    .end local v0    # "distance":F
    .end local v2    # "minimumFocusDistance":F
    .end local v3    # "position":I
    :cond_1
    return-void
.end method

.method private updateFpsRange()V
    .locals 8

    .prologue
    const/16 v7, 0x1e

    const/4 v3, 0x0

    .line 3331
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v4}, Lcom/android/camera2/CameraCapabilities;->getSupportedFpsRange()[Landroid/util/Range;

    move-result-object v0

    .line 3332
    .local v0, "availableFpsRange":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    aget-object v1, v0, v3

    .line 3333
    .local v1, "bestRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    array-length v5, v0

    move v4, v3

    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v2, v0, v4

    .line 3334
    .local v2, "r":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v6, v3, :cond_1

    .line 3335
    move-object v1, v2

    .line 3333
    :cond_0
    :goto_1
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_0

    .line 3336
    :cond_1
    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    if-ne v3, v6, :cond_0

    .line 3337
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v2}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v6, v3, :cond_0

    .line 3338
    move-object v1, v2

    goto :goto_1

    .line 3342
    .end local v2    # "r":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_2
    sget-boolean v3, Lcom/android/camera/Device;->IS_E2:Z

    if-nez v3, :cond_3

    sget-boolean v3, Lcom/android/camera/Device;->IS_E10:Z

    if-eqz v3, :cond_4

    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 3343
    new-instance v1, Landroid/util/Range;

    .end local v1    # "bestRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 3347
    .restart local v1    # "bestRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    .line 3348
    return-void

    .line 3345
    :cond_4
    return-void
.end method

.method private updateFrontMirror()V
    .locals 2

    .prologue
    .line 674
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-nez v1, :cond_0

    .line 675
    const/4 v0, 0x0

    .line 679
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFrontMirror(Z)V

    .line 680
    return-void

    .line 677
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v0

    .local v0, "enable":Z
    goto :goto_0
.end method

.method private updateHDR(Ljava/lang/String;)V
    .locals 4
    .param p1, "hdrMode"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 3085
    const-string/jumbo v1, "auto"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3087
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->isDetectedInHDR:Z

    .line 3089
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->getMutexHdrMode(Ljava/lang/String;)I

    move-result v0

    .line 3090
    .local v0, "mutexHdr":I
    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->stopObjectTracking(Z)V

    .line 3092
    if-eqz v0, :cond_3

    .line 3093
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    .line 3099
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3100
    new-array v1, v2, [I

    const/16 v2, 0x29

    aput v2, v1, v3

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 3102
    :cond_2
    return-void

    .line 3094
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3095
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetMutexModeManually()V

    goto :goto_0
.end method

.method private updateISO()V
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 3465
    const v2, 0x7f0f009c

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 3466
    .local v0, "defaultValue":Ljava/lang/String;
    const-string/jumbo v2, "pref_qc_camera_iso_key"

    invoke-direct {p0, v2, v0}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3468
    .local v1, "iso":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 3470
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v1, v3}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v4}, Lcom/android/camera2/CameraCapabilities;->getMaxIso()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setISO(I)V

    .line 3474
    :goto_0
    return-void

    .line 3472
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setISO(I)V

    goto :goto_0
.end method

.method private updateJpegQuality()V
    .locals 2

    .prologue
    .line 3387
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->getJpegQuality(Z)I

    move-result v0

    .line 3388
    .local v0, "quality":I
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    .line 3389
    return-void
.end method

.method private updateJpegThumbnailSize()V
    .locals 4

    .prologue
    .line 3522
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getJpegThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 3523
    .local v0, "size":Lcom/android/camera/CameraSize;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V

    .line 3524
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "thumbnailSize="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3525
    return-void
.end method

.method private updateMfnr(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 3424
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xa7

    if-eq v1, v2, :cond_4

    .line 3425
    sget-boolean v1, Lcom/android/camera/Device;->IS_D5X:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualCamera()Z

    move-result v1

    .line 3424
    if-eqz v1, :cond_4

    .line 3426
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v1

    .line 3424
    if-eqz v1, :cond_4

    if-eqz p1, :cond_4

    .line 3428
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3429
    invoke-static {}, Lcom/android/camera/Device;->isSupportFrontBeautyMFNR()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 3430
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v2, 0x8005

    if-ne v1, v2, :cond_4

    .line 3431
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/android/camera/data/data/feature/DataItemFeature;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/feature/DataItemFeature;->supportZoomMfnr()Z

    move-result v1

    if-nez v1, :cond_2

    .line 3432
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-nez v1, :cond_3

    const/4 v0, 0x1

    .line 3433
    .local v0, "result":Z
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setMfnr(Z)V

    .line 3434
    return-void

    .line 3431
    .end local v0    # "result":Z
    :cond_2
    const/4 v0, 0x1

    .restart local v0    # "result":Z
    goto :goto_0

    .line 3432
    .end local v0    # "result":Z
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "result":Z
    goto :goto_0

    .line 3424
    .end local v0    # "result":Z
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "result":Z
    goto :goto_0
.end method

.method private updateMute()V
    .locals 0

    .prologue
    .line 3417
    return-void
.end method

.method private updateOIS()V
    .locals 8

    .prologue
    .line 3392
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualCamera()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3393
    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v5, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_2

    const/4 v1, 0x1

    .line 3395
    .local v1, "isDualZoomed":Z
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v3

    .line 3396
    .local v3, "isPortrait":Z
    const/4 v2, 0x0

    .line 3398
    .local v2, "isLongExposure":Z
    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v5, 0xa7

    if-ne v4, v5, :cond_0

    .line 3399
    const-string/jumbo v4, "pref_qc_camera_exposuretime_key"

    .line 3400
    const v5, 0x7f0f010b

    invoke-virtual {p0, v5}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 3399
    invoke-direct {p0, v4, v5}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3401
    .local v0, "exposureTime":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/32 v6, 0x3b9aca00

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 3402
    const/4 v2, 0x1

    .line 3406
    .end local v0    # "exposureTime":Ljava/lang/String;
    :cond_0
    if-nez v1, :cond_1

    if-nez v3, :cond_1

    if-eqz v2, :cond_4

    .line 3409
    :cond_1
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 3413
    :goto_1
    return-void

    .line 3393
    .end local v1    # "isDualZoomed":Z
    .end local v2    # "isLongExposure":Z
    .end local v3    # "isPortrait":Z
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "isDualZoomed":Z
    goto :goto_0

    .line 3392
    .end local v1    # "isDualZoomed":Z
    :cond_3
    const/4 v1, 0x0

    .restart local v1    # "isDualZoomed":Z
    goto :goto_0

    .line 3411
    .restart local v2    # "isLongExposure":Z
    .restart local v3    # "isPortrait":Z
    :cond_4
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    goto :goto_1
.end method

.method private updateOperatingMode()V
    .locals 4

    .prologue
    .line 3105
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 3106
    .local v0, "componentConfigHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 3107
    .local v1, "hdrMode":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/BeautyParameters;->isFaceBeautyOn()Z

    move-result v2

    if-nez v2, :cond_2

    .line 3108
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v3, 0x8007

    if-eq v2, v3, :cond_0

    .line 3109
    const-string/jumbo v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 3108
    if-nez v2, :cond_1

    .line 3110
    :cond_0
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v3, 0x8005

    if-eq v2, v3, :cond_2

    .line 3111
    const-string/jumbo v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 3108
    if-eqz v2, :cond_2

    .line 3112
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 3115
    :cond_2
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 10

    .prologue
    .line 2955
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v6, 0x100

    invoke-virtual {v5, v6}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v3

    .line 2956
    .local v3, "supportedPictureSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v2

    .line 2959
    .local v2, "pictureSize":Lcom/android/camera/CameraSize;
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v6, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v5, v6}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    .line 2960
    .local v4, "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    iget v5, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    iget v6, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    .line 2961
    iget v7, v2, Lcom/android/camera/CameraSize;->width:I

    iget v8, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v7, v8}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v7

    float-to-double v8, v7

    .line 2960
    invoke-static {v5, v6, v4, v8, v9}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 2963
    .local v0, "optimalSize":Lcom/android/camera/CameraSize;
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 2964
    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 2965
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5}, Lcom/android/camera2/Camera2Proxy;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    .line 2966
    .local v1, "original":Lcom/android/camera/CameraSize;
    invoke-virtual {v0, v1}, Lcom/android/camera/CameraSize;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 2967
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v5, v0}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    .line 2970
    :cond_0
    const-string/jumbo v5, "updateSize:"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, v2, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " | "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 2971
    const-string/jumbo v7, " || "

    .line 2970
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 2971
    iget-object v7, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v7, v7, Lcom/android/camera/CameraSize;->width:I

    .line 2970
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 2971
    const-string/jumbo v7, " | "

    .line 2970
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 2971
    iget-object v7, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v7, v7, Lcom/android/camera/CameraSize;->height:I

    .line 2970
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2974
    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v5, v5, Lcom/android/camera/CameraSize;->width:I

    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v6, v6, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v5, v6}, Lcom/android/camera/module/Camera2Module;->updateCameraScreenNailSize(II)V

    .line 2975
    return-void
.end method

.method private updateQr()V
    .locals 4

    .prologue
    .line 3507
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 3508
    return-void

    .line 3511
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v1, v2, v3}, Lcom/android/zxing/QRCodeManager;->setTransposePreviewSize(II)V

    .line 3512
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v1

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Lcom/android/zxing/QRCodeManager;->setPreviewFormat(I)V

    .line 3514
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v1, v2, v3}, Lcom/android/zxing/QRCodeManager;->setPreviewLayoutSize(II)V

    .line 3516
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/zxing/QRCodeManager;->getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    move-result-object v0

    .line 3517
    .local v0, "previewCallback":Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 3518
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/zxing/QRCodeManager;->startDecode()V

    .line 3519
    return-void
.end method

.method private updateSaturation()V
    .locals 2

    .prologue
    .line 3494
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSaturation()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 3495
    .local v0, "level":I
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSaturation(I)V

    .line 3496
    return-void
.end method

.method private updateScene()V
    .locals 4

    .prologue
    .line 3150
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 3151
    .local v0, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isSceneHdr()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3152
    const-string/jumbo v1, "18"

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    .line 3158
    :goto_0
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "sceneMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " mutexMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v3}, Lcom/android/camera/MutexModeManager;->getMutexMode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3159
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setSceneMode(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3160
    const-string/jumbo v1, "0"

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    .line 3163
    :cond_0
    const-string/jumbo v1, "0"

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "18"

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_3

    .line 3164
    return-void

    .line 3153
    :cond_1
    const-string/jumbo v1, "pref_camera_scenemode_setting_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 3154
    const-string/jumbo v1, "0"

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    goto :goto_0

    .line 3156
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningSceneValue()Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    goto :goto_0

    .line 3166
    :cond_3
    return-void
.end method

.method private updateSharpness()V
    .locals 2

    .prologue
    .line 3502
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSharpness()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 3503
    .local v0, "level":I
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSharpness(I)V

    .line 3504
    return-void
.end method

.method private updateSuperResolution()V
    .locals 2

    .prologue
    .line 3437
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3438
    return-void

    .line 3441
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSREnable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3442
    return-void

    .line 3444
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_4

    .line 3445
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_super_resolution_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3446
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3447
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->resetMutexMode()V

    .line 3457
    :cond_2
    :goto_0
    return-void

    .line 3449
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    goto :goto_0

    .line 3453
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3454
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    goto :goto_0
.end method

.method private updateThumbProgress(Z)V
    .locals 3
    .param p1, "hideOrShowThumbProgress"    # Z

    .prologue
    .line 4090
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 4091
    const/16 v2, 0xa2

    .line 4090
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 4092
    .local v0, "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-eqz v0, :cond_0

    .line 4093
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateLoading(Z)V

    .line 4095
    :cond_0
    return-void
.end method

.method private updateWhiteBalance()V
    .locals 3

    .prologue
    .line 3460
    const-string/jumbo v1, "pref_camera_whitebalance_key"

    const-string/jumbo v2, "1"

    invoke-direct {p0, v1, v2}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3461
    .local v0, "whiteBalance":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setAWBMode(Ljava/lang/String;)V

    .line 3462
    return-void
.end method

.method private updateZsl()V
    .locals 2

    .prologue
    .line 3420
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isZeroShotMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    .line 3421
    return-void
.end method


# virtual methods
.method public cancelFocus(Z)V
    .locals 2
    .param p1, "resetFocusMode"    # Z

    .prologue
    .line 351
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 352
    return-void

    .line 355
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 356
    return-void

    .line 359
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_2

    .line 360
    return-void

    .line 363
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    .line 364
    if-eqz p1, :cond_3

    .line 365
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 367
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 370
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_5

    .line 371
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 373
    :cond_5
    return-void
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .prologue
    .line 3674
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3675
    return-void

    .line 3677
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 3678
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_1

    .line 3679
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 3682
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    .line 3683
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 3685
    :cond_2
    return-void
.end method

.method public closeCamera()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1913
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 1914
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_7

    .line 1916
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBurstDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    .line 1917
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBurstDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1920
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    .line 1921
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 1924
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_2

    .line 1925
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1928
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFloableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_3

    .line 1929
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFloableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 1931
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_4

    .line 1932
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1934
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V

    .line 1935
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 1936
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerCallback(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V

    .line 1939
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 1940
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->releasePictureCallback()V

    .line 1941
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 1942
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 1943
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 1944
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;

    .line 1945
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1946
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    .line 1949
    :cond_5
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-eqz v0, :cond_6

    .line 1950
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    .line 1952
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V

    .line 1974
    :cond_6
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    .line 1976
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1979
    :cond_7
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_8

    .line 1980
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 1981
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->destroy()V

    .line 1983
    :cond_8
    return-void
.end method

.method public varargs consumePreference([I)V
    .locals 4
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .prologue
    .line 2801
    const/4 v1, 0x0

    array-length v2, p1

    :goto_0
    if-ge v1, v2, :cond_0

    aget v0, p1, v1

    .line 2802
    .local v0, "type":I
    packed-switch v0, :pswitch_data_0

    .line 2947
    :pswitch_0
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no consumer for this updateType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2804
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updatePictureAndPreviewSize()V

    .line 2801
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2808
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFilter()V

    goto :goto_1

    .line 2812
    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateJpegQuality()V

    goto :goto_1

    .line 2816
    :pswitch_4
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateJpegThumbnailSize()V

    goto :goto_1

    .line 2820
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateFlashPreference()V

    goto :goto_1

    .line 2824
    :pswitch_6
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateHDRPreference()V

    goto :goto_1

    .line 2828
    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFocusArea()V

    goto :goto_1

    .line 2832
    :pswitch_8
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateScene()V

    goto :goto_1

    .line 2836
    :pswitch_9
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    goto :goto_1

    .line 2840
    :pswitch_a
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFocusMode()V

    goto :goto_1

    .line 2844
    :pswitch_b
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFpsRange()V

    goto :goto_1

    .line 2848
    :pswitch_c
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFace()V

    goto :goto_1

    .line 2852
    :pswitch_d
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->updateAntiBanding(Ljava/lang/String;)V

    goto :goto_1

    .line 2856
    :pswitch_e
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateQr()V

    goto :goto_1

    .line 2860
    :pswitch_f
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateOIS()V

    goto :goto_1

    .line 2864
    :pswitch_10
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateMute()V

    goto :goto_1

    .line 2868
    :pswitch_11
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateZsl()V

    goto :goto_1

    .line 2872
    :pswitch_12
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    goto :goto_1

    .line 2876
    :pswitch_13
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSuperResolution()V

    goto :goto_1

    .line 2880
    :pswitch_14
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateWhiteBalance()V

    goto :goto_1

    .line 2884
    :pswitch_15
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateISO()V

    goto :goto_1

    .line 2888
    :pswitch_16
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateExposureTime()V

    goto :goto_1

    .line 2892
    :pswitch_17
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getZoomValue()F

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->setZoomRatio(F)V

    goto :goto_1

    .line 2896
    :pswitch_18
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->focusCenter()V

    goto :goto_1

    .line 2900
    :pswitch_19
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateContrast()V

    goto :goto_1

    .line 2904
    :pswitch_1a
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSaturation()V

    goto :goto_1

    .line 2908
    :pswitch_1b
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSharpness()V

    goto :goto_1

    .line 2912
    :pswitch_1c
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateExposureMeteringMode()V

    goto :goto_1

    .line 2916
    :pswitch_1d
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateDeviceOrientation()V

    goto :goto_1

    .line 2920
    :pswitch_1e
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateASD()V

    goto/16 :goto_1

    .line 2924
    :pswitch_1f
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBokeh()V

    goto/16 :goto_1

    .line 2928
    :pswitch_20
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFaceAgeAnalyze()V

    goto/16 :goto_1

    .line 2932
    :pswitch_21
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFaceScore()V

    goto/16 :goto_1

    .line 2936
    :pswitch_22
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->setEvValue()V

    goto/16 :goto_1

    .line 2940
    :pswitch_23
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFrontMirror()V

    goto/16 :goto_1

    .line 2944
    :pswitch_24
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateOperatingMode()V

    goto/16 :goto_1

    .line 2950
    .end local v0    # "type":I
    :cond_0
    return-void

    .line 2802
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_c
        :pswitch_14
        :pswitch_3
        :pswitch_4
        :pswitch_d
        :pswitch_5
        :pswitch_6
        :pswitch_22
        :pswitch_9
        :pswitch_a
        :pswitch_15
        :pswitch_16
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_e
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_13
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_12
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_23
        :pswitch_24
    .end packed-switch
.end method

.method public enterMutexMode(I)V
    .locals 2
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x1

    .line 4044
    sparse-switch p1, :sswitch_data_0

    .line 4057
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 4058
    return-void

    .line 4046
    :sswitch_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHDR(Z)V

    goto :goto_0

    .line 4050
    :sswitch_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    goto :goto_0

    .line 4054
    :sswitch_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    goto :goto_0

    .line 4044
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x3 -> :sswitch_1
        0xa -> :sswitch_2
    .end sparse-switch
.end method

.method public exitMutexMode(I)V
    .locals 2
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x0

    .line 4062
    sparse-switch p1, :sswitch_data_0

    .line 4076
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 4077
    return-void

    .line 4064
    :sswitch_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHDR(Z)V

    .line 4065
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSuperResolution()V

    goto :goto_0

    .line 4069
    :sswitch_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    goto :goto_0

    .line 4073
    :sswitch_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    goto :goto_0

    .line 4062
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x3 -> :sswitch_1
        0xa -> :sswitch_2
    .end sparse-switch
.end method

.method protected focusCenter()V
    .locals 0

    .prologue
    .line 3327
    return-void
.end method

.method protected getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .prologue
    .line 3576
    .local p1, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getMaxPictureSize()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;I)V

    .line 3578
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method public getGroupShotMaxImage()I
    .locals 5

    .prologue
    .line 561
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFaces()[Lcom/android/camera2/CameraHardwareFace;

    move-result-object v1

    .line 562
    .local v1, "faces":[Lcom/android/camera2/CameraHardwareFace;
    if-eqz v1, :cond_0

    array-length v0, v1

    .line 563
    .local v0, "faceNum":I
    :goto_0
    add-int/lit8 v2, v0, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x4

    invoke-static {v2, v3, v4}, Lcom/android/camera/Util;->clamp(III)I

    move-result v2

    return v2

    .line 562
    .end local v0    # "faceNum":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "faceNum":I
    goto :goto_0
.end method

.method public getGroupShotNum()I
    .locals 2

    .prologue
    .line 552
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShotTimes:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_1

    .line 553
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->isMemoryRich(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShotTimes:I

    if-nez v0, :cond_1

    .line 554
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getGroupShotMaxImage()I

    move-result v0

    return v0

    .line 556
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method protected getMaxPictureSize()I
    .locals 1

    .prologue
    .line 3595
    const/4 v0, 0x0

    return v0
.end method

.method protected getMutexHdrMode(Ljava/lang/String;)I
    .locals 1
    .param p1, "hdr"    # Ljava/lang/String;

    .prologue
    .line 4000
    const-string/jumbo v0, "normal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4001
    invoke-static {}, Lcom/android/camera/Device;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/Device;->isSupportedAsdHdr()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4002
    :cond_0
    const/4 v0, 0x1

    .line 4001
    :goto_0
    return v0

    .line 4003
    :cond_1
    const/4 v0, 0x5

    goto :goto_0

    .line 4004
    :cond_2
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAoHDR()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "live"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4005
    const/4 v0, 0x2

    return v0

    .line 4007
    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method public initGroupShot(I)V
    .locals 7
    .param p1, "maxImage"    # I

    .prologue
    .line 567
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0}, Lcom/android/camera/groupshot/GroupShot;->isUsed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 568
    :cond_0
    new-instance v0, Lcom/android/camera/groupshot/GroupShot;

    invoke-direct {v0}, Lcom/android/camera/groupshot/GroupShot;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    .line 571
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/Device;->isISPRotated()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 572
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mGroupFaceNum:I

    .line 573
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v3

    .line 574
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v4

    .line 575
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v5, v1, Lcom/android/camera/CameraSize;->height:I

    .line 576
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v6, v1, Lcom/android/camera/CameraSize;->width:I

    move v1, p1

    .line 572
    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    .line 584
    :goto_0
    return-void

    .line 578
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mGroupFaceNum:I

    .line 579
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v3

    .line 580
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v4

    .line 581
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v5, v1, Lcom/android/camera/CameraSize;->width:I

    .line 582
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v6, v1, Lcom/android/camera/CameraSize;->height:I

    move v1, p1

    .line 578
    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    goto :goto_0
.end method

.method public initializeCapabilities()V
    .locals 2

    .prologue
    .line 2747
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 2750
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 2749
    const/4 v1, 0x4

    .line 2748
    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mContinuousFocusSupported:Z

    .line 2751
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxFaceCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mMaxFaceCount:I

    .line 2752
    return-void
.end method

.method public isDoingAction()Z
    .locals 2

    .prologue
    .line 1416
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    .line 1417
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isZooming:Z

    .line 1416
    if-nez v0, :cond_0

    .line 1418
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    .line 1416
    if-nez v0, :cond_0

    .line 1419
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 1416
    if-nez v0, :cond_0

    .line 1420
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_1

    .line 1416
    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 1421
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 1422
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isInCountDown()Z

    move-result v0

    goto :goto_0
.end method

.method protected isFaceBeautyMode()Z
    .locals 1

    .prologue
    .line 974
    const/4 v0, 0x0

    return v0
.end method

.method public isKeptBitmapTexture()Z
    .locals 1

    .prologue
    .line 1492
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    return v0
.end method

.method public isMeteringAreaOnly()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 4032
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v3, :cond_0

    .line 4033
    return v2

    .line 4036
    :cond_0
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    .line 4037
    .local v0, "focusMode":I
    iget-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mMeteringAreaSupported:Z

    if-nez v3, :cond_2

    .line 4038
    :cond_1
    const/4 v3, 0x5

    if-ne v3, v0, :cond_3

    .line 4037
    :cond_2
    :goto_0
    return v1

    .line 4039
    :cond_3
    if-eqz v0, :cond_2

    move v1, v2

    goto :goto_0
.end method

.method public isShowAeAfLockIndicator()Z
    .locals 1

    .prologue
    .line 4020
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    return v0
.end method

.method public isShowCaptureButton()Z
    .locals 1

    .prologue
    .line 4015
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isBurstShoot()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSupportFocusShoot()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSupportFocusShoot()Z
    .locals 2

    .prologue
    .line 4025
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 4026
    const-string/jumbo v1, "pref_camera_focus_shoot_key"

    .line 4025
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isGlobalSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected isSupportSceneMode()Z
    .locals 1

    .prologue
    .line 3572
    const/4 v0, 0x0

    return v0
.end method

.method protected isZeroShotMode()Z
    .locals 2

    .prologue
    .line 2281
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_0

    .line 2282
    const/4 v0, 0x0

    return v0

    .line 2284
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 2

    .prologue
    .line 3947
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 3948
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 3947
    if-eqz v0, :cond_0

    .line 3949
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 3947
    if-eqz v0, :cond_0

    .line 3950
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 3947
    if-eqz v0, :cond_0

    .line 3951
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 3947
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public multiCapture()Z
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 388
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 389
    return v6

    .line 393
    :cond_0
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    if-nez v2, :cond_1

    .line 394
    return v6

    .line 396
    :cond_1
    iput-boolean v6, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    .line 398
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 399
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 400
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Not enough space or storage not ready. remaining="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 401
    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v4

    .line 400
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    return v6

    .line 405
    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/storage/ImageSaver;->shouldStopShot()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 406
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "ImageSaver is full, wait for a moment!"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v2

    const v3, 0x7f0f018b

    invoke-virtual {v2, v3, v6}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    .line 408
    return v6

    .line 413
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 414
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    const-string/jumbo v2, "d"

    .line 415
    const/16 v3, 0xc1

    .line 416
    const/16 v4, 0xc2

    .line 417
    const/16 v5, 0xc4

    .line 418
    const/16 v6, 0xef

    .line 419
    const/16 v7, 0xc9

    .line 414
    filled-new-array {v3, v4, v5, v6, v7}, [I

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 422
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->prepareMultiCapture()V

    .line 424
    new-instance v2, Lcom/android/camera/module/Camera2Module$2;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Camera2Module$2;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-static {v2}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v2

    .line 429
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v3

    .line 424
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v1

    .line 433
    .local v1, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Ljava/lang/Integer;>;"
    new-instance v2, Lcom/android/camera/module/Camera2Module$3;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Camera2Module$3;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v1, v2}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v2

    .line 452
    new-instance v3, Lcom/android/camera/module/Camera2Module$4;

    invoke-direct {v3, p0}, Lcom/android/camera/module/Camera2Module$4;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 433
    invoke-virtual {v2, v3}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 484
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mBurstNextDelayTime:J

    .line 485
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 486
    new-instance v4, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;-><init>(Lcom/android/camera/module/Camera2Module;Landroid/location/Location;)V

    .line 485
    invoke-virtual {v2, v3, v4}, Lcom/android/camera2/Camera2Proxy;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 489
    const/4 v2, 0x1

    return v2
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .prologue
    .line 985
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x3

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 986
    return-void
.end method

.method public onBackPressed()Z
    .locals 4

    .prologue
    .line 1565
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1566
    const/4 v0, 0x0

    return v0

    .line 1569
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1571
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 1572
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mLastCaptureTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1f40

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 1573
    const/4 v0, 0x1

    return v0

    .line 1577
    :cond_1
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onBeautyParameterChanged()V
    .locals 6

    .prologue
    const/16 v5, 0xd

    .line 604
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/BeautyParameters;->isFaceBeautyOn()Z

    move-result v1

    .line 605
    .local v1, "curBeautyOn":Z
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 606
    .local v0, "componentConfigHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 607
    .local v2, "hdrMode":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v3

    if-eqz v3, :cond_2

    sget-boolean v3, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    if-eq v3, v1, :cond_2

    .line 608
    if-eqz v1, :cond_1

    .line 609
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v4, 0x8005

    if-eq v3, v4, :cond_1

    .line 613
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->restartModule()V

    .line 619
    :goto_0
    sput-boolean v1, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    .line 620
    return-void

    .line 610
    :cond_1
    if-nez v1, :cond_2

    .line 611
    const-string/jumbo v3, "off"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 610
    if-eqz v3, :cond_2

    .line 612
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v4, 0x8007

    if-ne v3, v4, :cond_0

    .line 614
    :cond_2
    invoke-static {}, Lcom/android/camera/Device;->isSupportFrontBeautyMFNR()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 615
    const/16 v3, 0x22

    filled-new-array {v5, v3}, [I

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 617
    :cond_3
    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput v5, v3, v4

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0
.end method

.method public onBeautyStatusChanged(Z)V
    .locals 0
    .param p1, "faceBeautyOn"    # Z

    .prologue
    .line 600
    return-void
.end method

.method public onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 529
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 530
    :cond_0
    return-void

    .line 532
    :cond_1
    const-string/jumbo v1, "android.media.action.VOICE_COMMAND"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 533
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "on Receive voice control broadcast action intent"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    invoke-static {p2}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->getVoiceControlAction()Ljava/lang/String;

    move-result-object v0

    .line 535
    .local v0, "action":Ljava/lang/String;
    iput-object p2, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    .line 536
    const-string/jumbo v1, "CAPTURE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 538
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 539
    iput-object v3, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    .line 545
    :cond_2
    invoke-static {p2}, Lcom/android/camera/CameraIntentManager;->removeInstance(Landroid/content/Intent;)V

    .line 547
    .end local v0    # "action":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1
    .param p1, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 4181
    if-nez p1, :cond_0

    .line 4182
    return-void

    .line 4185
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onCameraMetaData(Landroid/hardware/camera2/CaptureResult;)V

    .line 4187
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_1

    .line 4188
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFloableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 4191
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFloableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isAiSceneEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 4192
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFloableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 4194
    :cond_2
    return-void
.end method

.method protected onCameraOpened()V
    .locals 2

    .prologue
    .line 2724
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 2725
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->initializeFocusManager()V

    .line 2727
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 2729
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setPreviewFrameLayoutAspectRatio()V

    .line 2731
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2732
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startPreview()V

    .line 2735
    :cond_0
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/effect/BeautyParameters;->setOnFaceBeautyChangedListener(Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;)V

    .line 2736
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->initMetaParser()V

    .line 2737
    invoke-static {}, Lcom/android/camera/Device;->isSupportAiScene()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2738
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->initAiSceneParser()V

    .line 2741
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mOnResumeTime:J

    .line 2742
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2743
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2744
    return-void
.end method

.method public onCreate(II)V
    .locals 2
    .param p1, "moduleIndex"    # I
    .param p2, "cameraId"    # I

    .prologue
    .line 1875
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 1877
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->parseIntent()V

    .line 1879
    new-instance v0, Lcom/android/camera/module/Camera2Module$MainHandler;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;-><init>(Lcom/android/camera/module/Camera2Module;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    .line 1880
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 1882
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->create()V

    .line 1883
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->onCameraOpened()V

    .line 1885
    new-instance v0, Lcom/google/lens/sdk/LensApi;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-direct {v0, v1}, Lcom/google/lens/sdk/LensApi;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    .line 1886
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    new-instance v1, Lcom/android/camera/module/Camera2Module$13;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$13;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/google/lens/sdk/LensApi;->checkLensAvailability(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V

    .line 1894
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 1708
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 1709
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    .line 1710
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 1712
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->destroy()V

    .line 1713
    return-void
.end method

.method public onFaceBeautySwitched(Z)V
    .locals 1
    .param p1, "advanced"    # Z

    .prologue
    .line 742
    if-eqz p1, :cond_1

    const-string/jumbo v0, "pref_camera_face_beauty_advanced_key"

    .line 741
    :goto_0
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setFaceBeautySwitch(Ljava/lang/String;)V

    .line 743
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 744
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->onBeautyParameterChanged()V

    .line 746
    :cond_0
    return-void

    .line 742
    :cond_1
    const-string/jumbo v0, "pref_camera_face_beauty_key"

    goto :goto_0
.end method

.method public onFaceDetected([Landroid/hardware/camera2/params/Face;Lcom/android/camera/effect/FaceAnalyzeInfo;Lcom/android/camera2/Camera2Proxy;)V
    .locals 5
    .param p1, "faces"    # [Landroid/hardware/camera2/params/Face;
    .param p2, "faceInfo"    # Lcom/android/camera/effect/FaceAnalyzeInfo;
    .param p3, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    const/4 v2, 0x0

    .line 913
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getFrameAvailableFlag()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 914
    :cond_0
    return-void

    .line 916
    :cond_1
    if-nez p1, :cond_2

    .line 917
    return-void

    .line 922
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 923
    :cond_3
    array-length v1, p1

    if-lez v1, :cond_5

    iget-object v1, p2, Lcom/android/camera/effect/FaceAnalyzeInfo;->mAge:[F

    if-eqz v1, :cond_5

    .line 924
    invoke-static {p1, p2}, Lcom/android/camera2/CameraHardwareFace;->convertExCameraHardwareFace([Landroid/hardware/camera2/params/Face;Lcom/android/camera/effect/FaceAnalyzeInfo;)[Lcom/android/camera2/CameraHardwareFace;

    move-result-object v0

    .line 930
    .local v0, "cameraFaces":[Lcom/android/camera2/CameraHardwareFace;
    :goto_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportedObjectTrack()Z

    move-result v1

    if-eqz v1, :cond_6

    array-length v1, v0

    if-lez v1, :cond_6

    .line 931
    aget-object v1, v0, v2

    iget v1, v1, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    const v2, 0xface

    if-ne v1, v2, :cond_6

    .line 932
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mObjectTrackingStarted:Z

    if-eqz v1, :cond_4

    .line 933
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/4 v4, 0x3

    invoke-interface {v1, v4, v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    .line 947
    :cond_4
    return-void

    .line 926
    .end local v0    # "cameraFaces":[Lcom/android/camera2/CameraHardwareFace;
    :cond_5
    invoke-static {p1}, Lcom/android/camera2/CameraHardwareFace;->convertCameraHardwareFace([Landroid/hardware/camera2/params/Face;)[Lcom/android/camera2/CameraHardwareFace;

    move-result-object v0

    .restart local v0    # "cameraFaces":[Lcom/android/camera2/CameraHardwareFace;
    goto :goto_0

    .line 937
    :cond_6
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/4 v4, 0x1

    invoke-interface {v1, v4, v0, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result v1

    if-nez v1, :cond_4

    .line 938
    return-void
.end method

.method public onFilterChanged(II)V
    .locals 3
    .param p1, "category"    # I
    .param p2, "newIndex"    # I

    .prologue
    .line 1558
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x2

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 1559
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateEffectViewVisible()V

    .line 1560
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 13
    .param p1, "focusTask"    # Lcom/android/camera/module/loader/camera2/FocusTask;

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 2099
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v3

    if-nez v3, :cond_0

    .line 2100
    return-void

    .line 2103
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 2147
    :cond_1
    :goto_0
    return-void

    .line 2105
    :pswitch_0
    sget-object v3, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v5, "FocusTime=%1$dms focused=%2$b"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    .line 2106
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getElapsedTime()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v11

    .line 2105
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2108
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v3

    if-nez v3, :cond_2

    .line 2109
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v3

    if-eq v3, v12, :cond_2

    .line 2110
    invoke-virtual {p0, v11}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2114
    :cond_2
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 2115
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 2117
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-eqz v3, :cond_1

    .line 2118
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v11}, Lcom/android/camera2/Camera2Proxy;->lockExposure(Z)V

    goto :goto_0

    .line 2124
    :pswitch_1
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v1

    .line 2125
    .local v1, "moving":Z
    const/4 v2, 0x0

    .line 2126
    .local v2, "requestScan":Z
    const/4 v0, 0x0

    .line 2127
    .local v0, "logContent":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 2128
    const-string/jumbo v0, "onAutoFocusMoving start"

    .line 2129
    .local v0, "logContent":Ljava/lang/String;
    iput v10, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    .line 2135
    .end local v0    # "logContent":Ljava/lang/String;
    :cond_3
    :goto_1
    sget-boolean v3, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v3, :cond_4

    if-eqz v0, :cond_4

    .line 2136
    sget-object v3, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2140
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v3

    if-ne v3, v12, :cond_5

    .line 2141
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v3

    if-ne v3, v12, :cond_1

    .line 2142
    :cond_5
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v3, v10}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 2143
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto/16 :goto_0

    .line 2130
    .local v0, "logContent":Ljava/lang/String;
    :cond_6
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    if-nez v3, :cond_3

    .line 2131
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onAutoFocusMoving end. result="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2132
    .local v0, "logContent":Ljava/lang/String;
    const/4 v2, 0x1

    .line 2133
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    goto :goto_1

    .line 2103
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public onGradienterSwitched(Z)V
    .locals 2
    .param p1, "switchOn"    # Z

    .prologue
    .line 3768
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/SensorStateManager;->setGradienterEnabled(Z)V

    .line 3769
    const/4 v0, 0x2

    const/4 v1, 0x5

    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 3770
    return-void
.end method

.method public onHDRSceneChanged(Z)V
    .locals 5
    .param p1, "isInHdr"    # Z

    .prologue
    .line 695
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->isDetectedInHDR:Z

    if-eq v2, p1, :cond_0

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v2, :cond_1

    .line 696
    :cond_0
    return-void

    .line 699
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 700
    .local v0, "componentConfigHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 701
    return-void

    .line 703
    :cond_2
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 704
    .local v1, "hdrMode":Ljava/lang/String;
    const-string/jumbo v2, "auto"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 705
    return-void

    .line 711
    :cond_3
    if-eqz p1, :cond_6

    .line 712
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-gtz v2, :cond_4

    .line 713
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_5

    .line 715
    :cond_4
    return-void

    .line 714
    :cond_5
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->isNeedFlashOn()Z

    move-result v2

    .line 712
    if-nez v2, :cond_4

    .line 718
    :cond_6
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v3, Lcom/android/camera/module/Camera2Module$6;

    invoke-direct {v3, p0, p1}, Lcom/android/camera/module/Camera2Module$6;-><init>(Lcom/android/camera/module/Camera2Module;Z)V

    invoke-virtual {v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 727
    if-eqz p1, :cond_8

    .line 728
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 729
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    .line 735
    :cond_7
    :goto_0
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->isDetectedInHDR:Z

    .line 736
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onHDRSceneChanged: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    return-void

    .line 731
    :cond_8
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isMorphoHdr()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 732
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->resetMutexMode()V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 3853
    sparse-switch p1, :sswitch_data_0

    .line 3884
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 3855
    :sswitch_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 3856
    invoke-virtual {p0, v1, v1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 3858
    :cond_1
    return v1

    .line 3861
    :sswitch_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_2

    .line 3862
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3863
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3864
    const/16 v0, 0x1e

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 3870
    :cond_2
    :goto_0
    return v1

    .line 3867
    :cond_3
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    goto :goto_0

    .line 3876
    :sswitch_2
    const/16 v2, 0x18

    if-eq p1, v2, :cond_5

    .line 3877
    const/16 v2, 0x58

    if-ne p1, v2, :cond_4

    move v0, v1

    .line 3878
    :cond_4
    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    .line 3875
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/module/Camera2Module;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3879
    return v1

    :cond_5
    move v0, v1

    .line 3876
    goto :goto_1

    .line 3853
    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_2
        0x19 -> :sswitch_2
        0x1b -> :sswitch_1
        0x42 -> :sswitch_1
        0x50 -> :sswitch_0
        0x57 -> :sswitch_2
        0x58 -> :sswitch_2
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 3889
    sparse-switch p1, :sswitch_data_0

    .line 3911
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1

    .line 3895
    :sswitch_0
    const/16 v1, 0x18

    if-eq p1, v1, :cond_1

    .line 3896
    const/16 v1, 0x58

    if-ne p1, v1, :cond_2

    move v1, v2

    .line 3897
    :goto_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v4

    .line 3894
    invoke-virtual {p0, v1, v3, v4}, Lcom/android/camera/module/Camera2Module;->handleVolumeKeyEvent(ZZI)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3898
    return v2

    :cond_1
    move v1, v2

    .line 3895
    goto :goto_0

    :cond_2
    move v1, v3

    .line 3896
    goto :goto_0

    .line 3904
    :sswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 3905
    const/16 v3, 0xab

    .line 3904
    invoke-virtual {v1, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 3906
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3907
    return v2

    .line 3889
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
    .end sparse-switch
.end method

.method public onLongPress(II)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 1329
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->isInTapableRect(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1330
    return-void

    .line 1332
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->onSingleTapUp(II)V

    .line 1335
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1336
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->lockAEAF()V

    .line 1338
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSupportFocusShoot()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->is3ALocked()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 1339
    const/16 v0, 0x50

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setTriggerMode(I)V

    .line 1340
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 1342
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->performHapticFeedback(I)V

    .line 1343
    return-void
.end method

.method public onObjectStable()V
    .locals 0

    .prologue
    .line 1001
    return-void
.end method

.method public onOrientationChanged(II)V
    .locals 1
    .param p1, "orientation"    # I
    .param p2, "orientationCompensation"    # I

    .prologue
    .line 3633
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3634
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->setOrientation(II)V

    .line 3636
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1658
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 1664
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 1665
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 1668
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetGradienter()V

    .line 1669
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1670
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 1671
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 1674
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetScreenOn()V

    .line 1676
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->closeCamera()V

    .line 1678
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/BeautyParameters;->setOnFaceBeautyChangedListener(Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;)V

    .line 1680
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->releaseEffectProcessor()V

    .line 1682
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Lcom/android/camera/module/Camera2Module$12;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$12;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1692
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->pause()V

    .line 1693
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_1

    .line 1694
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {v0, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1696
    :cond_1
    return-void
.end method

.method public onPictureBurstFinished(Z)V
    .locals 0
    .param p1, "success"    # Z

    .prologue
    .line 2466
    return-void
.end method

.method public onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V
    .locals 64
    .param p1, "jpegData"    # [B
    .param p2, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 2291
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v2

    if-nez v2, :cond_0

    .line 2292
    return-void

    .line 2294
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegPictureCallbackTime:J

    .line 2295
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 2297
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v55

    .line 2298
    .local v55, "jpegWidth":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v54

    .line 2299
    .local v54, "jpegHeight":I
    sget-object v3, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "JpegPictureCallback#onPictureTaken data "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez p1, :cond_6

    const-string/jumbo v2, "null"

    :goto_0
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2301
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v8

    .line 2303
    .local v8, "orientation":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    add-int/2addr v2, v8

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_7

    .line 2304
    move/from16 v5, v55

    .line 2305
    .local v5, "resultWidth":I
    move/from16 v6, v54

    .line 2310
    .local v6, "resultHeight":I
    :goto_1
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 2311
    const/16 v28, 0x0

    .line 2312
    .local v28, "isParallelProcess":Z
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->isParallelEnable()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 2313
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mIsParallelProcess:Z

    move/from16 v28, v0

    .line 2314
    .local v28, "isParallelProcess":Z
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "is parallel processing "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2315
    if-eqz v28, :cond_1

    .line 2316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mParallelProcessingFilePath:Ljava/lang/String;

    move-object/from16 v51, v0

    .line 2317
    .local v51, "filePath":Ljava/lang/String;
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "is parallel processing, read file path from hal filePath:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v51

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2318
    invoke-static/range {v51 .. v51}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 2319
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "the file path should exist in params"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2329
    .end local v28    # "isParallelProcess":Z
    .end local v51    # "filePath":Ljava/lang/String;
    :cond_1
    :goto_2
    const/4 v9, 0x0

    .line 2330
    .local v9, "algorithmName":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/Device;->enableAlgorithmInFileSuffix()Z

    move-result v2

    if-nez v2, :cond_2

    .line 2331
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->isBokehEnabled()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 2332
    const-string/jumbo v9, "soft-portrait"

    .line 2339
    .end local v9    # "algorithmName":Ljava/lang/String;
    :cond_2
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 2340
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-static {v14, v15}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 2342
    :cond_3
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 2344
    .local v7, "title":Ljava/lang/String;
    const/16 v53, 0x0

    .line 2345
    .local v53, "jpeg":Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2346
    const/4 v2, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v4

    .line 2347
    const/4 v10, 0x1

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    .line 2346
    invoke-direct/range {v2 .. v10}, Lcom/android/camera/module/Camera2Module;->getDrawJPEGAttribute([BZIILjava/lang/String;ILjava/lang/String;Z)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v53

    .line 2350
    .end local v53    # "jpeg":Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    :cond_4
    const/4 v2, 0x1

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    .line 2351
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    if-eqz v2, :cond_c

    const/4 v2, 0x1

    :goto_4
    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v2}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZ)V

    .line 2353
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v2, :cond_14

    .line 2354
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 2355
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/android/camera/groupshot/GroupShot;->attach([B)I

    move-result v60

    .line 2356
    .local v60, "result":I
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v4, "mGroupShot attach() = 0x%08x index=%d"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    .line 2357
    invoke-static/range {v60 .. v60}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v14, 0x0

    aput-object v12, v11, v14

    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v14, 0x1

    aput-object v12, v11, v14

    .line 2356
    invoke-static {v3, v4, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2358
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    if-ge v2, v3, :cond_d

    .line 2360
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 2361
    const-string/jumbo v3, "pref_groupshot_with_primitive_picture_key"

    const/4 v4, 0x1

    .line 2360
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2362
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v10

    .line 2363
    const/16 v2, 0xa

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v12

    .line 2364
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 2365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    move-object/from16 v17, v0

    .line 2364
    const/16 v16, 0x0

    .line 2365
    const/16 v20, 0x0

    .line 2366
    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/16 v25, 0x0

    move-object/from16 v11, p1

    move-object v13, v7

    move/from16 v18, v5

    move/from16 v19, v6

    move/from16 v21, v8

    .line 2362
    invoke-virtual/range {v10 .. v25}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZ)V

    .line 2368
    :cond_5
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 2369
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    move-object/from16 v0, p0

    move-object/from16 v1, p0

    invoke-virtual {v2, v0, v1}, Lcom/android/camera2/Camera2Proxy;->takePicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 2370
    return-void

    .line 2299
    .end local v5    # "resultWidth":I
    .end local v6    # "resultHeight":I
    .end local v7    # "title":Ljava/lang/String;
    .end local v8    # "orientation":I
    .end local v60    # "result":I
    :cond_6
    move-object/from16 v0, p1

    array-length v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_0

    .line 2307
    .restart local v8    # "orientation":I
    :cond_7
    move/from16 v5, v54

    .line 2308
    .restart local v5    # "resultWidth":I
    move/from16 v6, v55

    .restart local v6    # "resultHeight":I
    goto/16 :goto_1

    .line 2321
    .restart local v28    # "isParallelProcess":Z
    .restart local v51    # "filePath":Ljava/lang/String;
    :cond_8
    invoke-static/range {v51 .. v51}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    .line 2322
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "fileTitle from path is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 2326
    .end local v51    # "filePath":Ljava/lang/String;
    .local v28, "isParallelProcess":Z
    :cond_9
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "disable parallel processing "

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 2333
    .end local v28    # "isParallelProcess":Z
    .restart local v9    # "algorithmName":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v3, 0xab

    if-ne v2, v3, :cond_b

    .line 2334
    const-string/jumbo v9, "portrait"

    .local v9, "algorithmName":Ljava/lang/String;
    goto/16 :goto_3

    .line 2336
    .local v9, "algorithmName":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->getAlgorithmName()Ljava/lang/String;

    move-result-object v9

    .local v9, "algorithmName":Ljava/lang/String;
    goto/16 :goto_3

    .line 2351
    .end local v9    # "algorithmName":Ljava/lang/String;
    .restart local v7    # "title":Ljava/lang/String;
    :cond_c
    const/4 v2, 0x0

    goto/16 :goto_4

    .line 2373
    .restart local v60    # "result":I
    :cond_d
    new-instance v10, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 2374
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    move-object/from16 v19, v0

    move-object/from16 v11, p0

    move v15, v5

    move/from16 v16, v6

    move/from16 v17, v8

    move-object/from16 v18, v7

    .line 2373
    invoke-direct/range {v10 .. v19}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;-><init>(Lcom/android/camera/module/Camera2Module;JLandroid/location/Location;IIILjava/lang/String;Lcom/android/camera/groupshot/GroupShot;)V

    .line 2375
    .local v10, "saveOutputImageTask":Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v10, v2, v3}, Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2376
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/Camera2Module;->mGroupShotTimes:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/Camera2Module;->mGroupShotTimes:I

    .line 2439
    .end local v10    # "saveOutputImageTask":Lcom/android/camera/module/Camera2Module$SaveOutputImageTask;
    .end local v60    # "result":I
    :cond_e
    :goto_5
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPortraitDepthData:[B

    .line 2440
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPortraitRawData:[B

    .line 2442
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v56

    .line 2443
    .local v56, "now":J
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegPictureCallbackTime:J

    sub-long v2, v56, v2

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegCallbackFinishTime:J

    .line 2444
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mJpegCallbackFinishTime = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/android/camera/module/Camera2Module;->mJpegCallbackFinishTime:J

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2445
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    sub-long v48, v56, v2

    .line 2446
    .local v48, "captureCostTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    move-wide/from16 v0, v48

    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackTakePictureCost(JZI)V

    .line 2447
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackCaptureTimeEnd()V

    .line 2449
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mCaptureStartTime(from onShutterButtonClick start to jpegCallback finished) = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v48

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 2450
    const-string/jumbo v4, "ms"

    .line 2449
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2451
    invoke-static {}, Lcom/android/camera/Util;->isKPILogEnabled()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 2452
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "[KPI] Capture duration: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v48

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2455
    :cond_f
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/Camera2Module;->onPictureTakenFinished(Z)V

    .line 2456
    return-void

    .line 2378
    .end local v48    # "captureCostTime":J
    .end local v56    # "now":J
    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPortraitDepthData:[B

    if-eqz v2, :cond_12

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPortraitRawData:[B

    if-eqz v2, :cond_12

    .line 2379
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v62

    .line 2380
    .local v62, "startTime":J
    if-eqz v53, :cond_11

    .line 2381
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    move-object/from16 v0, v53

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)V

    .line 2382
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/Camera2Module;->mPortraitRawData:[B

    .line 2383
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v13

    .line 2384
    const/16 v19, 0x0

    move-object/from16 v11, p0

    move v14, v5

    move v15, v6

    move-object/from16 v16, v7

    move/from16 v17, v8

    move-object/from16 v18, v9

    .line 2382
    invoke-direct/range {v11 .. v19}, Lcom/android/camera/module/Camera2Module;->getDrawJPEGAttribute([BZIILjava/lang/String;ILjava/lang/String;Z)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v59

    .line 2385
    .local v59, "rawJPEGAttribute":Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    move-object/from16 v0, v59

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)V

    .line 2386
    move-object/from16 v0, v53

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    .line 2387
    move-object/from16 v0, v59

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mPortraitRawData:[B

    .line 2388
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onPictureTaken: DrawJPEG cost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long v14, v14, v62

    invoke-virtual {v3, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2393
    .end local v59    # "rawJPEGAttribute":Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    :goto_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/module/Camera2Module;->mPortraitDepthData:[B

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mPortraitRawData:[B

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/android/camera/module/Camera2Module;->composeDepthMapPicture([B[B[B)[B

    move-result-object v13

    .line 2395
    .local v13, "finalJpegData":[B
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v12

    .line 2396
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v14

    .line 2397
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    move-object/from16 v19, v0

    const/16 v18, 0x0

    .line 2398
    const/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    .line 2399
    const/16 v26, 0x1

    const/16 v27, 0x0

    move-object v15, v7

    move/from16 v20, v5

    move/from16 v21, v6

    move/from16 v23, v8

    move-object/from16 v29, v9

    .line 2395
    invoke-virtual/range {v12 .. v29}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V

    goto/16 :goto_5

    .line 2390
    .end local v13    # "finalJpegData":[B
    :cond_11
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    goto :goto_6

    .line 2401
    .end local v62    # "startTime":J
    :cond_12
    if-eqz v53, :cond_13

    .line 2404
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    move-object/from16 v0, v53

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegAsync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)Z

    goto/16 :goto_5

    .line 2406
    :cond_13
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v30

    .line 2407
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/Camera2Module;->needImageThumbnail(I)Z

    move-result v32

    .line 2408
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v34

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    move-object/from16 v37, v0

    const/16 v36, 0x0

    .line 2409
    const/16 v40, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x0

    .line 2410
    const/16 v44, 0x1

    const/16 v45, 0x0

    move-object/from16 v31, p1

    move-object/from16 v33, v7

    move/from16 v38, v5

    move/from16 v39, v6

    move/from16 v41, v8

    move/from16 v46, v28

    move-object/from16 v47, v9

    .line 2406
    invoke-virtual/range {v30 .. v47}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V

    goto/16 :goto_5

    .line 2414
    :cond_14
    if-eqz v53, :cond_15

    .line 2415
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    move-object/from16 v0, v53

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)V

    .line 2416
    move-object/from16 v0, v53

    iget-object v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    .line 2420
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/camera/module/Camera2Module;->mQuickCapture:Z

    if-nez v2, :cond_16

    .line 2421
    int-to-double v2, v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->width:I

    int-to-double v14, v4

    div-double/2addr v2, v14

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v0, v2

    move/from16 v58, v0

    .line 2422
    .local v58, "ratio":I
    invoke-static/range {v58 .. v58}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v52

    .line 2424
    .local v52, "inSampleSize":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    .line 2425
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    rsub-int v3, v3, 0x168

    add-int/2addr v3, v8

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/Camera2Module;->mDisplayRotation:I

    add-int/2addr v3, v4

    .line 2426
    const/4 v4, 0x0

    .line 2424
    move/from16 v0, v52

    invoke-static {v2, v3, v4, v0}, Lcom/android/camera/Thumbnail;->createBitmap([BIZI)Landroid/graphics/Bitmap;

    move-result-object v50

    .line 2428
    .local v50, "cover":Landroid/graphics/Bitmap;
    if-eqz v50, :cond_e

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 2429
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    move-object/from16 v0, v50

    invoke-virtual {v2, v0}, Lcom/android/camera/CameraScreenNail;->renderBitmapToCanvas(Landroid/graphics/Bitmap;)V

    .line 2430
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    .line 2431
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->showPostCaptureAlert()V

    goto/16 :goto_5

    .line 2418
    .end local v50    # "cover":Landroid/graphics/Bitmap;
    .end local v52    # "inSampleSize":I
    .end local v58    # "ratio":I
    :cond_15
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/camera/module/Camera2Module;->mJpegImageData:[B

    goto :goto_7

    .line 2434
    :cond_16
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Camera2Module;->doAttach()V

    goto/16 :goto_5
.end method

.method public onPictureTakenFailed()V
    .locals 1

    .prologue
    .line 2460
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->onPictureTakenFinished(Z)V

    .line 2461
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 1535
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 1536
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1537
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    .line 1538
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 1537
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1539
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1541
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1542
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/zxing/QRCodeManager;->setPreviewLayoutSize(II)V

    .line 1544
    :cond_1
    return-void
.end method

.method public onPreviewPixelsRead([BII)V
    .locals 7
    .param p1, "pixels"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 2254
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    .line 2255
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->playSound(I)V

    .line 2257
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2258
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 2260
    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    iget v5, p0, Lcom/android/camera/module/Camera2Module;->mDisplayRotation:I

    sub-int v1, v4, v5

    .line 2261
    .local v1, "shootOrientation":I
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2262
    invoke-static {}, Lcom/android/camera/Device;->isFrontCameraAtBottom()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2264
    rem-int/lit16 v4, v1, 0xb4

    if-nez v4, :cond_0

    .line 2265
    const/4 v1, 0x0

    .line 2270
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    :cond_1
    const/4 v4, 0x0

    invoke-static {v4, v0, v1, v3}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object v2

    .line 2271
    .local v2, "thumbnail":Lcom/android/camera/Thumbnail;
    invoke-virtual {v2}, Lcom/android/camera/Thumbnail;->startWaitingForUri()V

    .line 2272
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v3

    invoke-virtual {v3, v2, v6, v6}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 2273
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 2090
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onPreviewSessionClosed: "

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2093
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->stopDecode()V

    .line 2094
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2095
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 2085
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x33

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2086
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 2048
    const-string/jumbo v0, "onPreviewSessionSuccess:"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2049
    if-nez p1, :cond_0

    .line 2050
    return-void

    .line 2052
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2053
    return-void

    .line 2056
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2057
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2060
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2062
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    .line 2064
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 2065
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2066
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_MANUALLY:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 2069
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2071
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isOpenOnly()Z

    move-result v0

    if-nez v0, :cond_5

    .line 2073
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.CAMERA_OPEN_ONLY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 2075
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const-wide/16 v2, 0x3e8

    const/16 v1, 0x34

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 2080
    :cond_4
    :goto_0
    return-void

    .line 2077
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onPreviewSizeChanged(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 1548
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 1549
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1551
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 1584
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 1585
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1586
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initEffectCropView()V

    .line 1587
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isSelectingCapturedImage()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1588
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    .line 1589
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->releaseBitmapIfNeeded()V

    .line 1593
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1594
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/zxing/QRCodeManager;->setEnable(Z)V

    .line 1595
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->resume()V

    .line 1596
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/Camera2Module$10;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$10;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/zxing/QRCodeManager;->setResultCallback(Lcom/android/zxing/QRCode$QRCodeResultCallback;)V

    .line 1631
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->keepScreenOnAwhile()V

    .line 1633
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Lcom/android/camera/module/Camera2Module$11;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$11;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1641
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1502
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    .line 1503
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isSelectingCapturedImage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1504
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->releaseBitmapIfNeeded()V

    .line 1505
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->hidePostCaptureAlert()V

    .line 1512
    :goto_0
    return-void

    .line 1509
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/Camera;->setResult(ILandroid/content/Intent;)V

    .line 1510
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V

    goto :goto_0
.end method

.method public onReviewDoneClicked()V
    .locals 0

    .prologue
    .line 1497
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->doAttach()V

    .line 1498
    return-void
.end method

.method public onShutter()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 2178
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_0

    .line 2179
    return-void

    .line 2181
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mShutterCallbackTime:J

    .line 2182
    iget-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mShutterCallbackTime:J

    iget-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mShutterLag:J

    .line 2183
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "mShutterLag = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mShutterLag:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2185
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    if-nez v0, :cond_1

    .line 2186
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->enablePreviewAsThumbnail()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnabledPreviewThumbnail:Z

    .line 2188
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestReadPixels()V

    .line 2196
    :cond_1
    :goto_0
    return-void

    .line 2190
    :cond_2
    invoke-direct {p0, v4}, Lcom/android/camera/module/Camera2Module;->updateThumbProgress(Z)V

    .line 2191
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    .line 2192
    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->playSound(I)V

    goto :goto_0
.end method

.method public onShutterButtonClick(I)V
    .locals 5
    .param p1, "mode"    # I

    .prologue
    const/4 v4, 0x0

    .line 1038
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1039
    return-void

    .line 1042
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setTriggerMode(I)V

    .line 1043
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onShutterButtonClick "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1045
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getCountDownTimes()I

    move-result v0

    .line 1046
    .local v0, "countDownTime":I
    if-lez v0, :cond_1

    .line 1047
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->startCount(I)V

    .line 1048
    return-void

    .line 1051
    :cond_1
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1052
    return-void

    .line 1059
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mNeedAutoFocus:Z

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->prepareCapture(ZI)V

    .line 1060
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->doSnap()V

    .line 1061
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1062
    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 1064
    :cond_3
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0
    .param p1, "pressed"    # Z
    .param p2, "from"    # I

    .prologue
    .line 1325
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1347
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1348
    return v3

    .line 1351
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-eqz v0, :cond_1

    .line 1352
    return v3

    .line 1355
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBurstShootingEnable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1356
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    .line 1355
    if-eqz v0, :cond_3

    .line 1358
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1359
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1360
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1361
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1362
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_hand_night_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1363
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1364
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1365
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result v0

    .line 1355
    if-eqz v0, :cond_3

    .line 1366
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1367
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1368
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    xor-int/lit8 v0, v0, 0x1

    .line 1355
    if-eqz v0, :cond_3

    .line 1371
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFastCapture()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1372
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 1375
    :cond_2
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    .line 1376
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->doMultiSnap(Z)V

    .line 1378
    return v2

    .line 1382
    :cond_3
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    .line 1383
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1384
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->requestAutoFocus()V

    .line 1385
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1386
    return v3
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 5
    .param p1, "in"    # Z

    .prologue
    const/4 v4, 0x0

    .line 1398
    iput-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    .line 1400
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-eqz v0, :cond_0

    .line 1401
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const-wide/16 v2, 0x7d0

    const/16 v1, 0x31

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 1404
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    .line 1406
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    if-eqz v0, :cond_1

    .line 1407
    iput-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    .line 1408
    if-eqz p1, :cond_1

    .line 1409
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 1412
    :cond_1
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 6
    .param p1, "eventX"    # I
    .param p2, "eventY"    # I

    .prologue
    const/4 v5, 0x1

    .line 3690
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onSingleTapUp mPaused: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3691
    const-string/jumbo v4, "; mCamera2Device: "

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3691
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3691
    const-string/jumbo v4, "; isInCountDown: "

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3691
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isInCountDown()Z

    move-result v4

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3692
    const-string/jumbo v4, "; getCameraState: "

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3692
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v4

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3692
    const-string/jumbo v4, "; mMultiSnapStatus: "

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3692
    iget-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3693
    const-string/jumbo v4, "; Camera2Module: "

    .line 3690
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3696
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v2, :cond_0

    .line 3697
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v2, :cond_1

    .line 3705
    :cond_0
    return-void

    .line 3698
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 3696
    if-nez v2, :cond_0

    .line 3699
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->isInTapableRect(II)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 3696
    if-nez v2, :cond_0

    .line 3700
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    .line 3701
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_0

    .line 3702
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v2

    if-eqz v2, :cond_0

    .line 3703
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isInCountDown()Z

    move-result v2

    .line 3696
    if-nez v2, :cond_0

    .line 3704
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 3696
    if-nez v2, :cond_0

    .line 3709
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v2

    if-nez v2, :cond_2

    .line 3710
    return-void

    .line 3714
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xab

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 3715
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 3716
    return-void

    .line 3719
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 3721
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-nez v2, :cond_4

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMeteringAreaSupported:Z

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_4

    .line 3722
    return-void

    .line 3726
    :cond_4
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 3727
    return-void

    .line 3729
    :cond_5
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mObjectTrackingStarted:Z

    if-eqz v2, :cond_6

    .line 3730
    invoke-virtual {p0, v5}, Lcom/android/camera/module/Camera2Module;->stopObjectTracking(Z)V

    .line 3732
    :cond_6
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v2, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 3734
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 3735
    .local v1, "point":Landroid/graphics/Point;
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 3737
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->unlockAEAF()V

    .line 3738
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 3739
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v4, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 3742
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-nez v2, :cond_7

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMeteringAreaSupported:Z

    if-eqz v2, :cond_7

    .line 3743
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 3745
    :cond_7
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1700
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 1701
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    .line 1702
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1704
    :cond_0
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1427
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1428
    return-void

    .line 1430
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1431
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 1433
    :cond_1
    return-void
.end method

.method public onTiltShiftSwitched(Z)V
    .locals 2
    .param p1, "switchOn"    # Z

    .prologue
    .line 3773
    if-eqz p1, :cond_0

    .line 3774
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetEvValue()V

    .line 3776
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initEffectCropView()V

    .line 3777
    const/4 v0, 0x2

    const/4 v1, 0x5

    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 3778
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateEffectViewVisible()V

    .line 3779
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v1, p1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setEvAdjustable(Z)V

    .line 3780
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 1

    .prologue
    .line 377
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    const/4 v0, 0x0

    return v0

    .line 381
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->startNormalCapture(I)V

    .line 382
    const/4 v0, 0x1

    return v0
.end method

.method protected openSettingActivity()V
    .locals 4

    .prologue
    .line 2705
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2706
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 2707
    const-string/jumbo v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2708
    const-string/jumbo v1, "IsCaptureIntent"

    .line 2709
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    .line 2708
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2710
    const-string/jumbo v1, ":miui:starting_window_label"

    .line 2711
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0039

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2710
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2713
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2714
    const-string/jumbo v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2716
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 2717
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 2719
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 2720
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .prologue
    .line 2152
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2153
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 2154
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->stopDecode()V

    .line 2155
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2156
    return-void
.end method

.method protected performVolumeKeyClicked(IZ)V
    .locals 3
    .param p1, "repeatCount"    # I
    .param p2, "pressed"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 3916
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_1

    .line 3917
    :cond_0
    return-void

    .line 3919
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_2

    .line 3920
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->restoreBottom()V

    .line 3922
    :cond_2
    if-nez p1, :cond_5

    .line 3923
    if-eqz p2, :cond_4

    .line 3924
    const/4 v0, 0x2

    invoke-virtual {p0, v2, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 3925
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 3942
    :cond_3
    :goto_0
    return-void

    .line 3927
    :cond_4
    invoke-virtual {p0, v1, v1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 3928
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    if-eqz v0, :cond_3

    .line 3929
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 3930
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonLongClickCancel(Z)V

    goto :goto_0

    .line 3934
    :cond_5
    if-eqz p2, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    .line 3935
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 3936
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonLongClick()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 3937
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    if-eqz v0, :cond_3

    .line 3938
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    goto :goto_0
.end method

.method public playSound(I)V
    .locals 0
    .param p1, "soundId"    # I

    .prologue
    .line 990
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 991
    return-void
.end method

.method protected prepareMultiCapture()V
    .locals 2

    .prologue
    .line 1165
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 1166
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    .line 1167
    invoke-static {}, Lcom/android/camera/Util;->clearMemoryLimit()V

    .line 1168
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareNormalCapture()V

    .line 1169
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-static {}, Lcom/android/camera2/CameraCapabilities;->getBurstShootCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 1170
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapPictureSize:Lcom/android/camera/CameraSize;

    .line 1171
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x31

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1172
    return-void
.end method

.method public registerProtocol()V
    .locals 4

    .prologue
    .line 281
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 282
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 283
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 284
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 285
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 286
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc3

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 287
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 288
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 291
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    .line 292
    const/16 v2, 0xa4

    .line 293
    const/16 v3, 0xae

    .line 291
    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 294
    return-void
.end method

.method protected resetMetaDataManager()V
    .locals 1

    .prologue
    .line 2695
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedMetadata()Z

    move-result v0

    .line 2698
    return-void
.end method

.method public resumePreview()V
    .locals 2

    .prologue
    .line 2160
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2161
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 2162
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2163
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->startDecode()V

    .line 2165
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2166
    return-void
.end method

.method public scanQRCodeEnabled()Z
    .locals 2

    .prologue
    .line 325
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isScanQRCode(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_0

    .line 327
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    xor-int/lit8 v0, v0, 0x1

    .line 325
    if-eqz v0, :cond_0

    .line 328
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result v0

    .line 325
    if-eqz v0, :cond_0

    .line 329
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    xor-int/lit8 v0, v0, 0x1

    .line 325
    if-eqz v0, :cond_0

    .line 330
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 325
    if-eqz v0, :cond_0

    .line 331
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 325
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    .prologue
    .line 4174
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 4175
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 2
    .param p1, "available"    # Z

    .prologue
    .line 1645
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    .line 1647
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1648
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1649
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1650
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1651
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1652
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1654
    :cond_0
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 5

    .prologue
    const v4, 0x7f0f010b

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1728
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_3

    .line 1729
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_3

    .line 1730
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    xor-int/lit8 v0, v0, 0x1

    .line 1728
    if-eqz v0, :cond_3

    .line 1732
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v3, 0x30

    invoke-virtual {v0, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1733
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v3, 0x31

    invoke-virtual {v0, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    .line 1732
    :goto_0
    xor-int/lit8 v0, v0, 0x1

    .line 1728
    if-eqz v0, :cond_3

    .line 1735
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1728
    if-eqz v0, :cond_3

    .line 1736
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xa7

    if-ne v0, v2, :cond_0

    .line 1737
    const-string/jumbo v0, "pref_qc_camera_exposuretime_key"

    .line 1738
    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1737
    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1738
    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1737
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1728
    :cond_0
    :goto_1
    return v1

    :cond_1
    move v0, v1

    .line 1732
    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v1, v2

    .line 1728
    goto :goto_1
.end method

.method public showQRCodeResult()V
    .locals 6

    .prologue
    .line 4151
    iget-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v4, :cond_0

    .line 4152
    return-void

    .line 4154
    :cond_0
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v4}, Lcom/android/zxing/QRCodeManager;->instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/zxing/QRCodeManager;->getScanResult()Ljava/lang/String;

    move-result-object v3

    .line 4155
    .local v3, "result":Ljava/lang/String;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 4156
    :cond_1
    sget-object v4, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "showQRCodeResult: get a null result!"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4157
    return-void

    .line 4160
    :cond_2
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 4161
    .local v0, "activityBase":Lcom/android/camera/ActivityBase;
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->dismissKeyguard()V

    .line 4162
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "miui.intent.action.receiverResultBarcodeScanner"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4163
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "com.xiaomi.scanner"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 4164
    const-string/jumbo v4, "result"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4165
    invoke-virtual {v0, v2}, Lcom/android/camera/ActivityBase;->startActivity(Landroid/content/Intent;)V

    .line 4166
    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Lcom/android/camera/ActivityBase;->setJumpFlag(I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4170
    .end local v0    # "activityBase":Lcom/android/camera/ActivityBase;
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 4167
    :catch_0
    move-exception v1

    .line 4168
    .local v1, "ex":Landroid/content/ActivityNotFoundException;
    sget-object v4, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public startAiLens()V
    .locals 4

    .prologue
    .line 4115
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$14;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$14;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 4120
    const-wide/16 v2, 0x12c

    .line 4115
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 4121
    return-void
.end method

.method public startFaceDetection()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 880
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 881
    :cond_0
    return-void

    .line 883
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mMaxFaceCount:I

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 884
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    .line 885
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    .line 887
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V

    .line 888
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 889
    invoke-virtual {p0, v1, v1}, Lcom/android/camera/module/Camera2Module;->updateFaceView(ZZ)V

    .line 891
    :cond_2
    return-void
.end method

.method public startFocus()V
    .locals 3

    .prologue
    .line 336
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 337
    return-void

    .line 339
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 340
    return-void

    .line 342
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 343
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    .line 347
    :goto_0
    return-void

    .line 345
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    goto :goto_0
.end method

.method public startObjectTracking()V
    .locals 0

    .prologue
    .line 996
    return-void
.end method

.method public startPreview()V
    .locals 6

    .prologue
    .line 1988
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 1989
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 1990
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 1991
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V

    .line 1992
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 1993
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 1994
    new-instance v1, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 1995
    .local v1, "surface":Landroid/view/Surface;
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v2

    .line 1996
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isNeedRawStream()Z

    move-result v3

    .line 1997
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getOperatingMode()I

    move-result v4

    move-object v5, p0

    .line 1995
    invoke-virtual/range {v0 .. v5}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 1999
    .end local v1    # "surface":Landroid/view/Surface;
    :cond_0
    return-void
.end method

.method public startScreenLight(II)V
    .locals 3
    .param p1, "color"    # I
    .param p2, "brightness"    # I

    .prologue
    .line 4697
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;

    .line 4699
    .local v0, "protocol":Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;
    if-eqz v0, :cond_0

    .line 4700
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v2, Lcom/android/camera/module/Camera2Module$25;

    invoke-direct {v2, p0, p2}, Lcom/android/camera/module/Camera2Module$25;-><init>(Lcom/android/camera/module/Camera2Module;I)V

    invoke-virtual {v1, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 4709
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;->setScreenLightColor(I)V

    .line 4710
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;->showScreenLight()V

    .line 4712
    :cond_0
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 3
    .param p1, "clearFaces"    # Z

    .prologue
    const/4 v2, 0x0

    .line 895
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 896
    :cond_0
    return-void

    .line 899
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 900
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3

    .line 901
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_3

    .line 902
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 904
    :cond_3
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    .line 905
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    .line 906
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V

    .line 907
    invoke-virtual {p0, v2, p1}, Lcom/android/camera/module/Camera2Module;->updateFaceView(ZZ)V

    .line 908
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 0
    .param p1, "realStop"    # Z

    .prologue
    .line 981
    return-void
.end method

.method public stopScreenLight()V
    .locals 4

    .prologue
    .line 4716
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;

    .line 4717
    .local v0, "protocol":Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "stopScreenLight: protocol = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", mHandler = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4718
    if-eqz v0, :cond_0

    .line 4719
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;->hideScreenLight()V

    .line 4721
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v2, Lcom/android/camera/module/Camera2Module$26;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Camera2Module$26;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 4729
    return-void
.end method

.method protected trackModeCustomInfo(I)V
    .locals 3
    .param p1, "takenNum"    # I

    .prologue
    .line 4733
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_1

    .line 4734
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->trackManualInfo(I)V

    .line 4740
    :cond_0
    :goto_0
    return-void

    .line 4735
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_0

    .line 4736
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->isFaceBeautyOn(Lcom/android/camera/effect/BeautyValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4737
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    new-instance v1, Lcom/android/camera/effect/BeautyValues;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    invoke-direct {v1, v2}, Lcom/android/camera/effect/BeautyValues;-><init>(Lcom/android/camera/effect/BeautyValues;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/android/camera/module/Camera2Module;->trackBeautyInfo(IZLcom/android/camera/effect/BeautyValues;)V

    goto :goto_0
.end method

.method public tryRemoveCountDownMessage()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1483
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 1484
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1485
    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    .line 1486
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->hideDelayNumber()V

    .line 1488
    :cond_0
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 298
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 299
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 300
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 301
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 302
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 303
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc3

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 304
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 308
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 309
    return-void
.end method

.method protected updateFaceView(ZZ)V
    .locals 5
    .param p1, "visible"    # Z
    .param p2, "clearFaces"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v4, 0x23

    .line 951
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {v2, v4}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 952
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {v2, v4}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 954
    :cond_0
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    .line 955
    if-eqz p1, :cond_1

    move v2, v0

    :goto_0
    if-eqz p2, :cond_2

    .line 954
    :goto_1
    invoke-virtual {v3, v4, v2, v0}, Lcom/android/camera/module/Camera2Module$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 956
    return-void

    :cond_1
    move v2, v1

    .line 955
    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method

.method public updateFlashPreference()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3029
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getRequestFlashMode()Ljava/lang/String;

    move-result-object v0

    .line 3031
    .local v0, "flashMode":Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    .line 3032
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetAiSceneInHdrOrFlashOn()V

    .line 3034
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setFlashMode(Ljava/lang/String;)V

    .line 3046
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->stopObjectTracking(Z)V

    .line 3047
    return-void
.end method

.method public updateHDRPreference()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    .line 3052
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 3053
    .local v0, "componentConfigHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3054
    return-void

    .line 3056
    :cond_0
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 3058
    .local v1, "hdrMode":Ljava/lang/String;
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    .line 3059
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3060
    const-string/jumbo v2, "auto"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 3059
    if-eqz v2, :cond_1

    .line 3061
    invoke-virtual {p0, v4}, Lcom/android/camera/module/Camera2Module;->onHDRSceneChanged(Z)V

    .line 3066
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    .line 3068
    const-string/jumbo v2, "off"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    xor-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_3

    .line 3069
    :cond_2
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4

    .line 3070
    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v5}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerCallback(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V

    .line 3071
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v4}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerEnable(Z)V

    .line 3082
    :goto_0
    return-void

    .line 3073
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetAiSceneInHdrOrFlashOn()V

    .line 3074
    const-string/jumbo v2, "auto"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 3075
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, p0}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerCallback(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V

    .line 3080
    :goto_1
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerEnable(Z)V

    goto :goto_0

    .line 3078
    :cond_5
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v5}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerCallback(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V

    goto :goto_1
.end method
