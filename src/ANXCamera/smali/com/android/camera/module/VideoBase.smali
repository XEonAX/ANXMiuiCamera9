.class public abstract Lcom/android/camera/module/VideoBase;
.super Lcom/android/camera/module/BaseModule;
.source "VideoBase.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
.implements Lcom/android/camera2/Camera2Proxy$FocusCallback;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/VideoBase$1;,
        Lcom/android/camera/module/VideoBase$2;,
        Lcom/android/camera/module/VideoBase$MainHandler;,
        Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;,
        Lcom/android/camera/module/VideoBase$StereoSwitchThread;
    }
.end annotation


# static fields
.field protected static TAG:Ljava/lang/String;


# instance fields
.field protected mAudioManager:Landroid/media/AudioManager;

.field protected mBaseFileName:Ljava/lang/String;

.field protected mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

.field protected mCurrentVideoFilename:Ljava/lang/String;

.field protected mCurrentVideoUri:Landroid/net/Uri;

.field protected mCurrentVideoValues:Landroid/content/ContentValues;

.field private mDialog:Landroid/app/AlertDialog;

.field protected mFaceDetectionEnabled:Z

.field protected mFaceDetectionStarted:Z

.field protected mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field protected mHandler:Landroid/os/Handler;

.field protected mInStartingFocusRecording:Z

.field protected mIntentRequestSize:J

.field private mIsSessionReady:Z

.field private mIsVideoCaptureIntent:Z

.field protected mLastBackPressedTime:J

.field protected mMaxVideoDurationInMs:I

.field protected volatile mMediaRecorderRecording:Z

.field protected mMediaRecorderRecordingPaused:Z

.field private mMessageId:I

.field protected mOnResumeTime:J

.field protected mOrientationCompensationAtRecordStart:I

.field protected mOriginalMusicVolume:I

.field protected mOutputFormat:I

.field protected final mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field protected mPreviewing:Z

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field protected mRecordingStartTime:J

.field protected mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field protected mSnapshotInProgress:Z

.field protected mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

.field protected mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mTitleId:I

.field protected mTouchFocusStartingTime:J

.field protected mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

.field protected mVideoFocusMode:Ljava/lang/String;

.field protected mVideoSize:Lcom/android/camera/CameraSize;


# direct methods
.method static synthetic -wrap0(Lcom/android/camera/module/VideoBase;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/VideoBase;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->isSelectingCapturedVideo()Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/VideoBase;ZZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/VideoBase;
    .param p1, "visible"    # Z
    .param p2, "clearFaces"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 336
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 268
    new-instance v0, Lcom/android/camera/module/VideoBase$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoBase$1;-><init>(Lcom/android/camera/module/VideoBase;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 1473
    new-instance v0, Lcom/android/camera/module/VideoBase$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoBase$2;-><init>(Lcom/android/camera/module/VideoBase;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    .line 337
    sput-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    .line 338
    new-instance v0, Lcom/android/camera/module/VideoBase$MainHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/module/VideoBase$MainHandler;-><init>(Lcom/android/camera/module/VideoBase;Lcom/android/camera/module/VideoBase$MainHandler;)V

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    .line 339
    return-void
.end method

.method public static convertOutputFormatToFileExt(I)Ljava/lang/String;
    .locals 1
    .param p0, "outputFileFormat"    # I

    .prologue
    .line 288
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 289
    const-string/jumbo v0, ".mp4"

    return-object v0

    .line 291
    :cond_0
    const-string/jumbo v0, ".3gp"

    return-object v0
.end method

.method public static convertOutputFormatToMimeType(I)Ljava/lang/String;
    .locals 1
    .param p0, "outputFileFormat"    # I

    .prologue
    .line 281
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 282
    const-string/jumbo v0, "video/mp4"

    return-object v0

    .line 284
    :cond_0
    const-string/jumbo v0, "video/3gpp"

    return-object v0
.end method

.method private createName(JI)Ljava/lang/String;
    .locals 5
    .param p1, "dateTaken"    # J
    .param p3, "fileNo"    # I

    .prologue
    .line 857
    if-gtz p3, :cond_0

    .line 858
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 860
    .local v0, "date":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const v2, 0x7f0f00ba

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoBase;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 861
    .local v1, "dateFormat":Ljava/text/SimpleDateFormat;
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/VideoBase;->mBaseFileName:Ljava/lang/String;

    .line 862
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mBaseFileName:Ljava/lang/String;

    return-object v2

    .line 864
    .end local v0    # "date":Ljava/util/Date;
    .end local v1    # "dateFormat":Ljava/text/SimpleDateFormat;
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mBaseFileName:Ljava/lang/String;

    return-object v2
.end method

.method private deleteCurrentVideo()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 895
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 896
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->deleteVideoFile(Ljava/lang/String;)V

    .line 897
    iput-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    .line 898
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 899
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-static {v0, v1, v1}, Lcom/android/camera/Util;->safeDelete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 900
    iput-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    .line 903
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 904
    return-void
.end method

.method private getReviewBitmap()Landroid/graphics/Bitmap;
    .locals 4

    .prologue
    .line 766
    const/4 v0, 0x0

    .line 767
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v2, :cond_2

    .line 768
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    .line 769
    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getPreviewWidth()I

    move-result v3

    .line 768
    invoke-static {v2, v3}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/io/FileDescriptor;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 775
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 778
    iget v2, p0, Lcom/android/camera/module/VideoBase;->mOrientationCompensationAtRecordStart:I

    neg-int v2, v2

    .line 779
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v3

    .line 778
    invoke-static {v0, v2, v3}, Lcom/android/camera/Util;->rotateAndMirror(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 781
    :cond_1
    return-object v0

    .line 770
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 771
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    .line 773
    .local v1, "videoPath":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getPreviewWidth()I

    move-result v2

    .line 772
    invoke-static {v1, v2}, Lcom/android/camera/Thumbnail;->createVideoThumbnailBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, "bitmap":Landroid/graphics/Bitmap;
    goto :goto_0
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6
    .param p1, "visible"    # Z
    .param p2, "clearFaces"    # Z

    .prologue
    const/4 v2, 0x1

    .line 255
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v3

    .line 256
    .local v3, "mirror":Z
    if-eqz p1, :cond_1

    .line 258
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq v2, v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 261
    iget v5, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    move v1, p1

    move v4, v2

    .line 260
    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    .line 266
    :cond_0
    :goto_0
    return-void

    .line 264
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0
.end method

.method private hideAlert()V
    .locals 3

    .prologue
    .line 797
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 798
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->resumePreview()V

    .line 802
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->hideReviewViews()V

    .line 803
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoBase;->enableCameraControls(Z)V

    .line 805
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 806
    const/16 v2, 0xa0

    .line 805
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 807
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const/4 v1, 0x6

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 808
    return-void

    .line 800
    .end local v0    # "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    goto :goto_0
.end method

.method private isSelectingCapturedVideo()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 750
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCaptureIntent()Z

    move-result v1

    if-nez v1, :cond_0

    .line 751
    return v3

    .line 755
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 756
    const/16 v2, 0xa0

    .line 755
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 757
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const v1, 0x7f0a009c

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    .line 758
    const/16 v2, 0xff3

    .line 757
    if-eq v1, v2, :cond_1

    .line 759
    return v3

    .line 762
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method protected static millisecondToTimeString(JZ)Ljava/lang/String;
    .locals 18
    .param p0, "milliSeconds"    # J
    .param p2, "displayCentiSeconds"    # Z

    .prologue
    .line 295
    const-wide/16 v14, 0x3e8

    div-long v10, p0, v14

    .line 296
    .local v10, "seconds":J
    const-wide/16 v14, 0x3c

    div-long v2, v10, v14

    .line 297
    .local v2, "minutes":J
    const-wide/16 v14, 0x3c

    div-long v0, v2, v14

    .line 298
    .local v0, "hours":J
    const-wide/16 v14, 0x3c

    mul-long/2addr v14, v0

    sub-long v6, v2, v14

    .line 299
    .local v6, "remainderMinutes":J
    const-wide/16 v14, 0x3c

    mul-long/2addr v14, v2

    sub-long v8, v10, v14

    .line 301
    .local v8, "remainderSeconds":J
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .local v12, "timeStringBuilder":Ljava/lang/StringBuilder;
    const-wide/16 v14, 0x0

    cmp-long v13, v0, v14

    if-lez v13, :cond_1

    .line 305
    const-wide/16 v14, 0xa

    cmp-long v13, v0, v14

    if-gez v13, :cond_0

    .line 306
    const/16 v13, 0x30

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 308
    :cond_0
    invoke-virtual {v12, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x3a

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 312
    :cond_1
    const-wide/16 v14, 0xa

    cmp-long v13, v6, v14

    if-gez v13, :cond_2

    .line 313
    const/16 v13, 0x30

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 315
    :cond_2
    invoke-virtual {v12, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x3a

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 318
    const-wide/16 v14, 0xa

    cmp-long v13, v8, v14

    if-gez v13, :cond_3

    .line 319
    const/16 v13, 0x30

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 321
    :cond_3
    invoke-virtual {v12, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 324
    if-eqz p2, :cond_5

    .line 325
    const/16 v13, 0x2e

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 326
    const-wide/16 v14, 0x3e8

    mul-long/2addr v14, v10

    sub-long v14, p0, v14

    const-wide/16 v16, 0xa

    div-long v4, v14, v16

    .line 327
    .local v4, "remainderCentiSeconds":J
    const-wide/16 v14, 0xa

    cmp-long v13, v4, v14

    if-gez v13, :cond_4

    .line 328
    const/16 v13, 0x30

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 330
    :cond_4
    invoke-virtual {v12, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 333
    .end local v4    # "remainderCentiSeconds":J
    :cond_5
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    return-object v13
.end method

.method private restorePreferences()V
    .locals 1

    .prologue
    .line 657
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isZoomSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 658
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setZoomValue(F)V

    .line 660
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 661
    return-void
.end method

.method private startPlayVideoActivity()V
    .locals 5

    .prologue
    .line 684
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 685
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    iget v3, p0, Lcom/android/camera/module/VideoBase;->mOutputFormat:I

    invoke-static {v3}, Lcom/android/camera/module/VideoBase;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 686
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 688
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2, v1}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 692
    :goto_0
    return-void

    .line 689
    :catch_0
    move-exception v0

    .line 690
    .local v0, "ex":Landroid/content/ActivityNotFoundException;
    sget-object v2, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "failed to view video "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method protected animateHold()V
    .locals 0

    .prologue
    .line 885
    return-void
.end method

.method public cancelFocus(Z)V
    .locals 3
    .param p1, "resetFocusMode"    # Z

    .prologue
    .line 1317
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1318
    return-void

    .line 1320
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isSessionReady()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1321
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "cancelFocus: null session"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1322
    return-void

    .line 1324
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1325
    return-void

    .line 1328
    :cond_2
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "cancelFocus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1329
    if-eqz p1, :cond_3

    .line 1330
    const-string/jumbo v0, "continuous-video"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setVideoFocusMode(Ljava/lang/String;)V

    .line 1332
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 1333
    return-void
.end method

.method protected checkCallingState()Z
    .locals 2

    .prologue
    .line 1245
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    .line 1246
    const v0, 0x7f0f0153

    .line 1247
    const v1, 0x7f0f0154

    .line 1246
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->showConfirmMessage(II)V

    .line 1248
    const/4 v0, 0x0

    return v0

    .line 1250
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .prologue
    .line 448
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 449
    return-void

    .line 451
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 452
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_1

    .line 453
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 455
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 456
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDisplayOrientation(I)V

    .line 458
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 459
    return-void
.end method

.method protected cleanupEmptyFile()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 869
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 870
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 871
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 872
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no video file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 873
    iput-object v6, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    .line 879
    .end local v0    # "f":Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 874
    .restart local v0    # "f":Ljava/io/File;
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 875
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "delete empty video file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    iput-object v6, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoFilename:Ljava/lang/String;

    goto :goto_0
.end method

.method public closeCamera()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 602
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "closeCamera"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    iput-boolean v3, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    .line 604
    iput-boolean v3, p0, Lcom/android/camera/module/VideoBase;->mSnapshotInProgress:Z

    .line 605
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 606
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 607
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 608
    iput-object v2, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 610
    :cond_0
    return-void
.end method

.method protected closeVideoFileDescriptor()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 945
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v1, :cond_0

    .line 947
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 951
    :goto_0
    iput-object v3, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 953
    :cond_0
    return-void

    .line 948
    :catch_0
    move-exception v0

    .line 949
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "fail to close fd"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected deleteVideoFile(Ljava/lang/String;)V
    .locals 4
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 907
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "delete invalid video "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 908
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 909
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_0

    .line 910
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "fail to delete "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 912
    :cond_0
    return-void
.end method

.method protected doLaterReleaseIfNeed()V
    .locals 2

    .prologue
    .line 1547
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 1548
    :cond_0
    return-void

    .line 1550
    :cond_1
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "doLaterRelease"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1551
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_2

    .line 1552
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->pause()V

    .line 1553
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->releaseAll(Z)V

    .line 1555
    :cond_2
    return-void
.end method

.method protected doReturnToCaller(Z)V
    .locals 3
    .param p1, "valid"    # Z

    .prologue
    .line 811
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 813
    .local v1, "resultIntent":Landroid/content/Intent;
    if-eqz p1, :cond_0

    .line 814
    const/4 v0, -0x1

    .line 815
    .local v0, "resultCode":I
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 816
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 820
    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2, v0, v1}, Lcom/android/camera/Camera;->setResult(ILandroid/content/Intent;)V

    .line 821
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->finish()V

    .line 822
    return-void

    .line 818
    .end local v0    # "resultCode":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "resultCode":I
    goto :goto_0
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .prologue
    .line 1053
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1054
    const-string/jumbo v1, "pref_camera_facedetection_key"

    .line 1055
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1053
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public enterMutexMode(I)V
    .locals 5
    .param p1, "mode"    # I

    .prologue
    const/4 v4, 0x0

    .line 931
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setZoomValue(F)V

    .line 932
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    .line 933
    const-string/jumbo v2, "pref_camera_whitebalance_key"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object v4, v1, v2

    .line 934
    const-string/jumbo v2, "pref_camera_coloreffect_key"

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const/4 v2, 0x3

    aput-object v4, v1, v2

    .line 932
    invoke-virtual {v0, v1}, Lcom/android/camera/preferences/SettingsOverrider;->overrideSettings([Ljava/lang/String;)V

    .line 935
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 936
    return-void
.end method

.method public exitMutexMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 940
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    invoke-virtual {v0}, Lcom/android/camera/preferences/SettingsOverrider;->restoreSettings()Z

    .line 941
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    .line 942
    return-void
.end method

.method protected genContentValues(II)Landroid/content/ContentValues;
    .locals 16
    .param p1, "outputFileFormat"    # I
    .param p2, "fileNo"    # I

    .prologue
    .line 829
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 830
    .local v2, "dateTaken":J
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v2, v3, v1}, Lcom/android/camera/module/VideoBase;->createName(JI)Ljava/lang/String;

    move-result-object v9

    .line 831
    .local v9, "title":Ljava/lang/String;
    if-lez p2, :cond_0

    .line 832
    sget-object v11, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v12, "_%d"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/4 v15, 0x0

    aput-object v14, v13, v15

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 833
    .local v8, "postfix":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 835
    .end local v8    # "postfix":Ljava/lang/String;
    :cond_0
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static/range {p1 .. p1}, Lcom/android/camera/module/VideoBase;->convertOutputFormatToFileExt(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 836
    .local v4, "filename":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/android/camera/module/VideoBase;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object v6

    .line 837
    .local v6, "mime":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x2f

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 838
    .local v7, "path":Ljava/lang/String;
    sget-object v11, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "genContentValues: path="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    new-instance v10, Landroid/content/ContentValues;

    const/16 v11, 0x8

    invoke-direct {v10, v11}, Landroid/content/ContentValues;-><init>(I)V

    .line 840
    .local v10, "values":Landroid/content/ContentValues;
    const-string/jumbo v11, "title"

    invoke-virtual {v10, v11, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    const-string/jumbo v11, "_display_name"

    invoke-virtual {v10, v11, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 842
    const-string/jumbo v11, "datetaken"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 843
    const-string/jumbo v11, "mime_type"

    invoke-virtual {v10, v11, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 844
    const-string/jumbo v11, "_data"

    invoke-virtual {v10, v11, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 845
    const-string/jumbo v11, "resolution"

    .line 846
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/module/VideoBase;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v13, v13, Lcom/android/camera/CameraSize;->width:I

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "x"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/module/VideoBase;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v13, v13, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 845
    invoke-virtual {v10, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 847
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v5

    .line 848
    .local v5, "loc":Landroid/location/Location;
    if-eqz v5, :cond_2

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmpl-double v11, v12, v14

    if-nez v11, :cond_1

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v12

    const-wide/16 v14, 0x0

    cmpl-double v11, v12, v14

    if-eqz v11, :cond_2

    .line 849
    :cond_1
    const-string/jumbo v11, "latitude"

    invoke-virtual {v5}, Landroid/location/Location;->getLatitude()D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 850
    const-string/jumbo v11, "longitude"

    invoke-virtual {v5}, Landroid/location/Location;->getLongitude()D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 853
    :cond_2
    return-object v10
.end method

.method protected getCameraRotation()I
    .locals 2

    .prologue
    .line 825
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOrientationCompensation:I

    iget v1, p0, Lcom/android/camera/module/VideoBase;->mDisplayRotation:I

    sub-int/2addr v0, v1

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    return v0
.end method

.method protected initializeCapabilities()V
    .locals 2

    .prologue
    .line 343
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 346
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 345
    const/4 v1, 0x3

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    .line 344
    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mContinuousFocusSupported:Z

    .line 347
    return-void
.end method

.method protected initializeFocusManager()V
    .locals 5

    .prologue
    .line 1075
    new-instance v1, Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 1077
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrontCamera()Z

    move-result v3

    .line 1078
    iget-object v4, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v4}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    .line 1075
    invoke-direct {v1, v2, p0, v3, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 1080
    const/4 v0, 0x0

    .line 1081
    .local v0, "rect":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1082
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 1084
    .end local v0    # "rect":Landroid/graphics/Rect;
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 1085
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    .line 1086
    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 1085
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1087
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1095
    :goto_0
    return-void

    .line 1092
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1093
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_0
.end method

.method public isCaptureIntent()Z
    .locals 1

    .prologue
    .line 401
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mIsVideoCaptureIntent:Z

    return v0
.end method

.method public isDoingAction()Z
    .locals 1

    .prologue
    .line 716
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecordingPaused:Z

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMeteringAreaOnly()Z
    .locals 1

    .prologue
    .line 1109
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFocusAreaSupported:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMeteringAreaSupported:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isSessionReady()Z
    .locals 1

    .prologue
    .line 1254
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mIsSessionReady:Z

    return v0
.end method

.method public isVideoRecording()Z
    .locals 1

    .prologue
    .line 557
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    .prologue
    .line 665
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected keepScreenOn()V
    .locals 2

    .prologue
    .line 475
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 476
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 477
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 478
    return-void
.end method

.method protected keepScreenOnAwhile()V
    .locals 4

    .prologue
    .line 470
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    .line 471
    const-wide/16 v2, 0x3e8

    .line 470
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 472
    return-void
.end method

.method public multiCapture()Z
    .locals 2

    .prologue
    .line 1348
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "multiCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1349
    const/4 v0, 0x0

    return v0
.end method

.method public notifyError()V
    .locals 2

    .prologue
    .line 567
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->notifyError()V

    .line 569
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->currentIsMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 570
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 571
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPaused:Z

    if-eqz v0, :cond_0

    .line 572
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->closeCamera()V

    .line 575
    :cond_0
    return-void
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .prologue
    .line 1431
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x3

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->updatePreferenceTrampoline([I)V

    .line 1432
    return-void
.end method

.method public onBackPressed()Z
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 614
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v2

    if-nez v2, :cond_0

    .line 615
    return v6

    .line 618
    :cond_0
    iget-boolean v2, p0, Lcom/android/camera/module/VideoBase;->mPaused:Z

    if-eqz v2, :cond_1

    .line 619
    return v7

    .line 622
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v2, :cond_2

    .line 623
    return v6

    .line 626
    :cond_2
    iget-boolean v2, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-eqz v2, :cond_4

    .line 627
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 628
    .local v0, "now":J
    iget-wide v2, p0, Lcom/android/camera/module/VideoBase;->mLastBackPressedTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    .line 629
    iput-wide v0, p0, Lcom/android/camera/module/VideoBase;->mLastBackPressedTime:J

    .line 630
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const v3, 0x7f0f00fe

    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoBase;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 635
    :goto_0
    return v7

    .line 633
    :cond_3
    invoke-virtual {p0, v7, v6}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    goto :goto_0

    .line 638
    .end local v0    # "now":J
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 639
    return v7

    .line 642
    :cond_5
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v2

    return v2
.end method

.method public onFaceDetected([Landroid/hardware/camera2/params/Face;Lcom/android/camera/effect/FaceAnalyzeInfo;Lcom/android/camera2/Camera2Proxy;)V
    .locals 0
    .param p1, "faces"    # [Landroid/hardware/camera2/params/Face;
    .param p2, "faceInfo"    # Lcom/android/camera/effect/FaceAnalyzeInfo;
    .param p3, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 1397
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 4
    .param p1, "focusTask"    # Lcom/android/camera/module/loader/camera2/FocusTask;

    .prologue
    .line 1521
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1522
    :cond_0
    return-void

    .line 1525
    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1543
    :cond_2
    :goto_0
    return-void

    .line 1527
    :pswitch_0
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "focusTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getElapsedTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1528
    const-string/jumbo v2, "ms focused="

    .line 1527
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1528
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v2

    .line 1527
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1528
    const-string/jumbo v2, " waitForRecording="

    .line 1527
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1529
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v2

    .line 1527
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1531
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1532
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 1533
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    goto :goto_0

    .line 1537
    :pswitch_1
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez v0, :cond_2

    .line 1538
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1539
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_0

    .line 1525
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 500
    iget-boolean v2, p0, Lcom/android/camera/module/VideoBase;->mPaused:Z

    if-eqz v2, :cond_0

    .line 501
    return v1

    .line 504
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 534
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 507
    :sswitch_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->restoreBottom()V

    .line 509
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 510
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 511
    const/16 v0, 0x1e

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->onShutterButtonClick(I)V

    .line 516
    :cond_2
    :goto_0
    return v1

    .line 514
    :cond_3
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->onShutterButtonClick(I)V

    goto :goto_0

    .line 524
    :sswitch_1
    const/16 v2, 0x18

    if-eq p1, v2, :cond_5

    .line 525
    const/16 v2, 0x58

    if-ne p1, v2, :cond_4

    move v0, v1

    .line 526
    :cond_4
    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    .line 523
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/module/VideoBase;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 527
    return v1

    :cond_5
    move v0, v1

    .line 524
    goto :goto_1

    .line 504
    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_1
        0x19 -> :sswitch_1
        0x1b -> :sswitch_0
        0x42 -> :sswitch_0
        0x57 -> :sswitch_1
        0x58 -> :sswitch_1
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x1

    .line 539
    sparse-switch p1, :sswitch_data_0

    .line 552
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1

    .line 542
    :sswitch_0
    return v3

    .line 546
    :sswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 547
    const/16 v2, 0xab

    .line 546
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 548
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 549
    return v3

    .line 539
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x1b -> :sswitch_0
        0x42 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    const/4 v3, 0x0

    .line 1287
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onPreviewSessionClosed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1288
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CameraCaptureSession;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1289
    iput-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 1290
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setSessionReady(Z)V

    .line 1292
    :cond_0
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    const/4 v3, 0x0

    .line 1277
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onPreviewSessionFailed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1278
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CameraCaptureSession;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1279
    iput-object v3, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 1280
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setSessionReady(Z)V

    .line 1282
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x33

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1283
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 1264
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onPreviewSessionSuccess: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1265
    if-nez p1, :cond_0

    .line 1266
    return-void

    .line 1268
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1269
    return-void

    .line 1271
    :cond_1
    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mCurrentSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 1272
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setSessionReady(Z)V

    .line 1273
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 6
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 351
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v2, "onPreviewSizeChanged: %dx%d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 353
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 355
    :cond_0
    return-void
.end method

.method protected onPreviewStart()V
    .locals 0

    .prologue
    .line 1179
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 359
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 360
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 361
    return-void

    .line 363
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mCameraDisabled:Z

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 364
    :cond_1
    return-void

    .line 367
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->updateStereoSettings(Z)V

    .line 370
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    if-nez v0, :cond_3

    .line 371
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 373
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 375
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->keepScreenOnAwhile()V

    .line 376
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->registerReceiver()V

    .line 378
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSettingsBack()V

    .line 380
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewing:Z

    if-eqz v0, :cond_4

    .line 381
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoBase;->mOnResumeTime:J

    .line 382
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 385
    :cond_4
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 2
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 740
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->isSelectingCapturedVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 741
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->deleteCurrentVideo()V

    .line 742
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->hideAlert()V

    .line 747
    :goto_0
    return-void

    .line 744
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 745
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoBase;->doReturnToCaller(Z)V

    goto :goto_0
.end method

.method public onReviewDoneClicked()V
    .locals 1
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .prologue
    .line 734
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->doReturnToCaller(Z)V

    .line 735
    return-void
.end method

.method protected onSettingsBack()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x1

    .line 646
    sget-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    .line 647
    .local v0, "cm":Lcom/android/camera/ChangeManager;
    invoke-virtual {v0, v3}, Lcom/android/camera/ChangeManager;->check(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 648
    invoke-virtual {v0, v3}, Lcom/android/camera/ChangeManager;->clear(I)V

    .line 649
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->restorePreferences()V

    .line 654
    :cond_0
    :goto_0
    return-void

    .line 650
    :cond_1
    invoke-virtual {v0, v2}, Lcom/android/camera/ChangeManager;->check(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 651
    invoke-virtual {v0, v2}, Lcom/android/camera/ChangeManager;->clear(I)V

    .line 652
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->onSharedPreferenceChanged()V

    goto :goto_0
.end method

.method public onShutterButtonClick(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 697
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0
    .param p1, "pressed"    # Z
    .param p2, "from"    # I

    .prologue
    .line 707
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 2

    .prologue
    .line 700
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onShutterButtonLongClick"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 701
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 2
    .param p1, "in"    # Z

    .prologue
    .line 711
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/VideoBase;->onShutterButtonFocus(ZI)V

    .line 712
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .prologue
    .line 721
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 722
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 724
    :cond_0
    return-void
.end method

.method protected onWaitStopCallbackTimeout()V
    .locals 0

    .prologue
    .line 583
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1337
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "capture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1338
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    if-eqz v0, :cond_0

    .line 1339
    iput-boolean v2, p0, Lcom/android/camera/module/VideoBase;->mInStartingFocusRecording:Z

    .line 1340
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startVideoRecording()V

    .line 1341
    const/4 v0, 0x1

    return v0

    .line 1343
    :cond_0
    return v2
.end method

.method protected openSettingActivity()V
    .locals 4

    .prologue
    .line 915
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 916
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 917
    const-string/jumbo v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 918
    const-string/jumbo v1, ":miui:starting_window_label"

    .line 919
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0039

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 918
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 920
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 921
    const-string/jumbo v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 923
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 924
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 926
    iget v1, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 927
    return-void
.end method

.method protected parseIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 409
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 410
    .local v1, "extras":Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 411
    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraIntentManager;->getRequestSize()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/module/VideoBase;->mIntentRequestSize:J

    .line 412
    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraIntentManager;->getExtraSavedUri()Landroid/net/Uri;

    move-result-object v2

    .line 413
    .local v2, "saveUri":Landroid/net/Uri;
    if-eqz v2, :cond_0

    .line 415
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mContentResolver:Landroid/content/ContentResolver;

    const-string/jumbo v4, "rw"

    invoke-virtual {v3, v2, v4}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/VideoBase;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 416
    iput-object v2, p0, Lcom/android/camera/module/VideoBase;->mCurrentVideoUri:Landroid/net/Uri;

    .line 417
    sget-object v3, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "parseIntent: outputUri="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 424
    .end local v2    # "saveUri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-void

    .line 418
    .restart local v2    # "saveUri":Landroid/net/Uri;
    :catch_0
    move-exception v0

    .line 420
    .local v0, "ex":Ljava/io/FileNotFoundException;
    sget-object v3, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected performVolumeKeyClicked(IZ)V
    .locals 2
    .param p1, "repeatCount"    # I
    .param p2, "pressed"    # Z

    .prologue
    .line 487
    if-nez p1, :cond_1

    if-eqz p2, :cond_1

    .line 488
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->restoreBottom()V

    .line 489
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 490
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "ignore volume key"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    return-void

    .line 493
    :cond_0
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->onShutterButtonClick(I)V

    .line 495
    :cond_1
    return-void
.end method

.method public playSound(I)V
    .locals 1
    .param p1, "soundId"    # I

    .prologue
    .line 1436
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isNeedMute()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1437
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoBase;->playCameraSound(I)V

    .line 1439
    :cond_0
    return-void
.end method

.method public playVideo()V
    .locals 0

    .prologue
    .line 680
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->startPlayVideoActivity()V

    .line 681
    return-void
.end method

.method protected readVideoPreferences()V
    .locals 0

    .prologue
    .line 670
    return-void
.end method

.method protected registerReceiver()V
    .locals 3

    .prologue
    .line 429
    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 430
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 431
    const-string/jumbo v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 432
    const-string/jumbo v1, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 433
    const-string/jumbo v1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 434
    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 435
    new-instance v1, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;-><init>(Lcom/android/camera/module/VideoBase;)V

    iput-object v1, p0, Lcom/android/camera/module/VideoBase;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 436
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 437
    return-void
.end method

.method protected resetScreenOn()V
    .locals 2

    .prologue
    .line 481
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 482
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 483
    return-void
.end method

.method protected resizeForPreviewAspectRatio()V
    .locals 0

    .prologue
    .line 1175
    return-void
.end method

.method protected restoreMusicSound()V
    .locals 3

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x0

    .line 980
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    if-eqz v0, :cond_0

    .line 981
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 982
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v2, v1}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 984
    :cond_0
    iput v1, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    .line 985
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2b

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 986
    return-void
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    .prologue
    .line 1118
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1119
    return-void
.end method

.method protected setCaptureIntent(Z)V
    .locals 0
    .param p1, "captureIntent"    # Z

    .prologue
    .line 405
    iput-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mIsVideoCaptureIntent:Z

    .line 406
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 2
    .param p1, "available"    # Z

    .prologue
    .line 389
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    .line 391
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 393
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 394
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 395
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 397
    :cond_0
    return-void
.end method

.method protected setPreviewFrameLayoutAspectRatio()V
    .locals 3

    .prologue
    .line 990
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mPreviewSize:Lcom/android/camera/CameraSize;

    if-eqz v0, :cond_0

    .line 991
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 992
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v1

    .line 991
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    .line 994
    :cond_0
    return-void
.end method

.method protected setSessionReady(Z)V
    .locals 0
    .param p1, "ready"    # Z

    .prologue
    .line 1258
    iput-boolean p1, p0, Lcom/android/camera/module/VideoBase;->mIsSessionReady:Z

    .line 1259
    return-void
.end method

.method protected setVideoFocusMode(Ljava/lang/String;)V
    .locals 1
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    .line 1210
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 1211
    iput-object p1, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    .line 1212
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->updateVideoFocusMode()V

    .line 1214
    :cond_0
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 1

    .prologue
    .line 562
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->isSelectingCapturedVideo()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected showAlert()V
    .locals 4

    .prologue
    .line 785
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->pausePreview()V

    .line 786
    invoke-direct {p0}, Lcom/android/camera/module/VideoBase;->getReviewBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 787
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v2, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showReviewViews(Landroid/graphics/Bitmap;)V

    .line 788
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoBase;->enableCameraControls(Z)V

    .line 791
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 792
    const/16 v3, 0xa0

    .line 791
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 793
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const/4 v2, 0x6

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 794
    return-void
.end method

.method protected showConfirmMessage(II)V
    .locals 7
    .param p1, "title"    # I
    .param p2, "message"    # I

    .prologue
    const/4 v4, 0x0

    .line 1229
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1230
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mTitleId:I

    if-eq v0, p1, :cond_0

    iget v0, p0, Lcom/android/camera/module/VideoBase;->mMessageId:I

    if-ne v0, p2, :cond_1

    .line 1231
    :cond_0
    return-void

    .line 1233
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1235
    :cond_2
    iput p1, p0, Lcom/android/camera/module/VideoBase;->mTitleId:I

    .line 1236
    iput p2, p0, Lcom/android/camera/module/VideoBase;->mMessageId:I

    .line 1238
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    .line 1239
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, p1}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1240
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2, p2}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1241
    iget-object v3, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const v5, 0x104000a

    invoke-virtual {v3, v5}, Lcom/android/camera/Camera;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    move-object v6, v4

    .line 1237
    invoke-static/range {v0 .. v6}, Lcom/android/camera/RotateDialogController;->showSystemAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mDialog:Landroid/app/AlertDialog;

    .line 1242
    return-void
.end method

.method protected silenceSounds()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x3

    .line 960
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    if-nez v0, :cond_0

    .line 961
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    const-string/jumbo v1, "audio"

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    .line 964
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    .line 965
    const/4 v1, 0x2

    .line 964
    invoke-virtual {v0, v3, v2, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 971
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    .line 972
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mOriginalMusicVolume:I

    if-eqz v0, :cond_1

    .line 973
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 975
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0xbb8

    const/16 v1, 0x2b

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 977
    :cond_1
    return-void
.end method

.method public startFaceDetection()V
    .locals 1

    .prologue
    .line 1355
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isAlive()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 1356
    :cond_0
    return-void

    .line 1358
    :cond_1
    iget v0, p0, Lcom/android/camera/module/VideoBase;->mMaxFaceCount:I

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 1359
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    .line 1360
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V

    .line 1361
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 1367
    :cond_2
    return-void
.end method

.method public startFocus()V
    .locals 3

    .prologue
    .line 1299
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1300
    return-void

    .line 1302
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1303
    return-void

    .line 1306
    :cond_1
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1307
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 1308
    const-string/jumbo v0, "auto"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setVideoFocusMode(Ljava/lang/String;)V

    .line 1309
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    .line 1313
    :goto_0
    return-void

    .line 1311
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    goto :goto_0
.end method

.method protected startVideoRecording()V
    .locals 0

    .prologue
    .line 1114
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 2
    .param p1, "clearFaces"    # Z

    .prologue
    const/4 v1, 0x0

    .line 1371
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 1372
    :cond_0
    return-void

    .line 1375
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionStarted:Z

    .line 1376
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 1377
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 1378
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V

    .line 1384
    :cond_2
    return-void
.end method

.method public stopObjectTracking(Z)V
    .locals 0
    .param p1, "realStop"    # Z

    .prologue
    .line 1427
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 0
    .param p1, "stopRecorder"    # Z
    .param p2, "fromRelease"    # Z

    .prologue
    .line 579
    return-void
.end method

.method protected unregisterReceiver()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 440
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 441
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 442
    iput-object v2, p0, Lcom/android/camera/module/VideoBase;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 444
    :cond_0
    return-void
.end method

.method protected updateFace()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1034
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->enableFaceDetection()Z

    move-result v0

    .line 1036
    .local v0, "faceDetection":Z
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v1, :cond_0

    .line 1037
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 1039
    :cond_0
    if-eqz v0, :cond_2

    .line 1040
    iget-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-nez v1, :cond_1

    .line 1041
    iput-boolean v3, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    .line 1042
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->startFaceDetection()V

    .line 1050
    :cond_1
    :goto_0
    return-void

    .line 1045
    :cond_2
    iget-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    if-eqz v1, :cond_1

    .line 1046
    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoBase;->stopFaceDetection(Z)V

    .line 1047
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mFaceDetectionEnabled:Z

    goto :goto_0
.end method

.method public updateFlashPreference()V
    .locals 3

    .prologue
    .line 1060
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isSupportedFlashOn()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 1061
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isSupportedTorch()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 1060
    if-eqz v1, :cond_0

    .line 1062
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->resetMutexModeManually()V

    .line 1068
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v1

    .line 1069
    iget v2, p0, Lcom/android/camera/module/VideoBase;->mModuleIndex:I

    .line 1068
    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1070
    .local v0, "flashMode":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoBase;->setFlashMode(Ljava/lang/String;)V

    .line 1072
    return-void
.end method

.method protected updateFocusArea()V
    .locals 3

    .prologue
    .line 1016
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v1, :cond_0

    .line 1017
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "updateFocusArea: null camera device"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1018
    return-void

    .line 1020
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 1021
    .local v0, "cropRegion":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    .line 1022
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    .line 1021
    :goto_0
    invoke-virtual {v2, v1}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1024
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 1025
    iget-boolean v1, p0, Lcom/android/camera/module/VideoBase;->mFocusAreaSupported:Z

    if-eqz v1, :cond_2

    .line 1026
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 1030
    :goto_1
    return-void

    .line 1022
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 1028
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    goto :goto_1
.end method

.method protected updateFocusCallback()V
    .locals 2

    .prologue
    .line 1217
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 1218
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "updateFocusCallback: null camera device"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1219
    return-void

    .line 1221
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase;->mContinuousFocusSupported:Z

    if-eqz v0, :cond_1

    .line 1222
    const-string/jumbo v0, "continuous-video"

    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1223
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 1226
    :cond_1
    return-void
.end method

.method protected updateMotionFocusManager()V
    .locals 3

    .prologue
    .line 1011
    const-string/jumbo v1, "auto"

    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1012
    .local v0, "enable":Z
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 1013
    return-void
.end method

.method protected updateRecordingTime()V
    .locals 0

    .prologue
    .line 587
    return-void
.end method

.method protected updateStereoSettings(Z)V
    .locals 4
    .param p1, "open"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1194
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1195
    if-eqz p1, :cond_1

    .line 1196
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    .line 1197
    const-string/jumbo v2, "pref_camera_video_flashmode_key"

    aput-object v2, v1, v3

    .line 1198
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 1196
    invoke-virtual {v0, v1}, Lcom/android/camera/preferences/SettingsOverrider;->overrideSettings([Ljava/lang/String;)V

    .line 1203
    :cond_0
    :goto_0
    return-void

    .line 1200
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase;->mSettingsOverrider:Lcom/android/camera/preferences/SettingsOverrider;

    invoke-virtual {v0}, Lcom/android/camera/preferences/SettingsOverrider;->restoreSettings()Z

    goto :goto_0
.end method

.method protected updateVideoFocusMode()V
    .locals 4

    .prologue
    .line 997
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v2, :cond_0

    .line 998
    sget-object v2, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "updateVideoFocusMode: null camera device"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 999
    return-void

    .line 1001
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v1

    .line 1002
    .local v1, "supportedFocusMode":[I
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mVideoFocusMode:Ljava/lang/String;

    invoke-static {v2}, Lcom/android/camera/constant/AutoFocus;->convertToFocusMode(Ljava/lang/String;)I

    move-result v0

    .line 1003
    .local v0, "focusMode":I
    invoke-static {v0, v1}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1004
    iget-object v2, p0, Lcom/android/camera/module/VideoBase;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1005
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->updateMotionFocusManager()V

    .line 1006
    invoke-virtual {p0}, Lcom/android/camera/module/VideoBase;->updateFocusCallback()V

    .line 1008
    :cond_1
    return-void
.end method

.method protected waitStereoSwitchThread()V
    .locals 3

    .prologue
    .line 1183
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v1, :cond_0

    .line 1184
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    invoke-virtual {v1}, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->cancel()V

    .line 1185
    iget-object v1, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    invoke-virtual {v1}, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->join()V

    .line 1186
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1191
    :cond_0
    :goto_0
    return-void

    .line 1188
    :catch_0
    move-exception v0

    .line 1189
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
