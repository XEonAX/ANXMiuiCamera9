.class public Lcom/android/camera/module/FunModule;
.super Lcom/android/camera/module/VideoBase;
.source "FunModule.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/FunModule$1;,
        Lcom/android/camera/module/FunModule$SaveVideoTask;
    }
.end annotation


# instance fields
.field private mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

.field private mCountDownTimer:Landroid/os/CountDownTimer;

.field private mLastMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

.field private final mMediaEncoderListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

.field private mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

.field private mPendingSaveTaskList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/module/FunModule$SaveVideoTask;",
            ">;"
        }
    .end annotation
.end field

.field private mRequestStartTime:J


# direct methods
.method static synthetic -get0(Lcom/android/camera/module/FunModule;)Lcom/android/camera/ui/V6CameraGLSurfaceView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/FunModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/module/FunModule;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/FunModule;
    .param p1, "justOne"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/FunModule;->executeSaveTask(Z)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 81
    const-class v0, Lcom/android/camera/module/FunModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoBase;-><init>(Ljava/lang/String;)V

    .line 431
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mPendingSaveTaskList:Ljava/util/ArrayList;

    .line 785
    new-instance v0, Lcom/android/camera/module/FunModule$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/FunModule$1;-><init>(Lcom/android/camera/module/FunModule;)V

    .line 784
    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mMediaEncoderListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    .line 82
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/module/FunModule;->mOutputFormat:I

    .line 83
    return-void
.end method

.method private addSaveTask(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 2
    .param p1, "videoPath"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 434
    new-instance v0, Lcom/android/camera/module/FunModule$SaveVideoTask;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/camera/module/FunModule$SaveVideoTask;-><init>(Lcom/android/camera/module/FunModule;Ljava/lang/String;Landroid/content/ContentValues;)V

    .line 435
    .local v0, "task":Lcom/android/camera/module/FunModule$SaveVideoTask;
    monitor-enter p0

    .line 436
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mPendingSaveTaskList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 438
    return-void

    .line 435
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private convertToFilePath(Ljava/io/FileDescriptor;)Ljava/lang/String;
    .locals 1
    .param p1, "fd"    # Ljava/io/FileDescriptor;

    .prologue
    .line 411
    const/4 v0, 0x0

    return-object v0
.end method

.method private executeSaveTask(Z)V
    .locals 5
    .param p1, "justOne"    # Z

    .prologue
    .line 441
    monitor-enter p0

    .line 442
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mPendingSaveTaskList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 443
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mPendingSaveTaskList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/FunModule$SaveVideoTask;

    .line 444
    .local v0, "task":Lcom/android/camera/module/FunModule$SaveVideoTask;
    sget-object v1, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "executeSaveTask: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/android/camera/module/FunModule$SaveVideoTask;->videoPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    iget-object v2, v0, Lcom/android/camera/module/FunModule$SaveVideoTask;->videoPath:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/camera/module/FunModule$SaveVideoTask;->contentValues:Landroid/content/ContentValues;

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 446
    if-eqz p1, :cond_0

    .line 451
    .end local v0    # "task":Lcom/android/camera/module/FunModule$SaveVideoTask;
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->doLaterReleaseIfNeed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 453
    return-void

    .line 441
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private initializeRecorder()V
    .locals 7

    .prologue
    .line 373
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v2, :cond_0

    .line 374
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "initializeRecorder: null camera"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    return-void

    .line 378
    :cond_0
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "initializeRecorder"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->closeVideoFileDescriptor()V

    .line 381
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isCaptureIntent()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 382
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/FunModule;->parseIntent(Landroid/content/Intent;)V

    .line 386
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v2, :cond_2

    .line 387
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/camera/module/FunModule;->convertToFilePath(Ljava/io/FileDescriptor;)Ljava/lang/String;

    move-result-object v1

    .line 395
    .local v1, "path":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->releaseLastMediaRecorder()V

    .line 396
    new-instance v2, Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-direct {v2, v1}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    .line 397
    new-instance v2, Lcom/android/camera/module/encoder/MediaVideoEncoder;

    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mMediaEncoderListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    iget-object v5, p0, Lcom/android/camera/module/FunModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v5, v5, Lcom/android/camera/CameraSize;->width:I

    iget-object v6, p0, Lcom/android/camera/module/FunModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v6, v6, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/android/camera/module/encoder/MediaVideoEncoder;-><init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;II)V

    .line 398
    new-instance v2, Lcom/android/camera/module/encoder/MediaAudioEncoder;

    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mMediaEncoderListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    invoke-direct {v2, v3, v4}, Lcom/android/camera/module/encoder/MediaAudioEncoder;-><init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;)V

    .line 399
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-virtual {v2}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->prepare()V

    .line 400
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "rotation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/module/FunModule;->mOrientationCompensation:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    iget v3, p0, Lcom/android/camera/module/FunModule;->mOrientationCompensation:I

    invoke-virtual {v2, v3}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->setOrientationHint(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 406
    :goto_1
    iget v2, p0, Lcom/android/camera/module/FunModule;->mOrientationCompensation:I

    iput v2, p0, Lcom/android/camera/module/FunModule;->mOrientationCompensationAtRecordStart:I

    .line 407
    return-void

    .line 389
    .end local v1    # "path":Ljava/lang/String;
    :cond_2
    iget v2, p0, Lcom/android/camera/module/FunModule;->mOutputFormat:I

    const/4 v3, -0x1

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/module/FunModule;->genContentValues(II)Landroid/content/ContentValues;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 390
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const-string/jumbo v3, "_data"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 391
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoFilename:Ljava/lang/String;

    .restart local v1    # "path":Ljava/lang/String;
    goto :goto_0

    .line 402
    :catch_0
    move-exception v0

    .line 403
    .local v0, "e":Ljava/io/IOException;
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private onStartRecorderFail()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 507
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/FunModule;->enableCameraControls(Z)V

    .line 508
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 509
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->restoreMusicSound()V

    .line 511
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 512
    const/16 v2, 0xa2

    .line 511
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 514
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-eqz v0, :cond_0

    .line 515
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 517
    :cond_0
    return-void
.end method

.method private onStartRecorderSucceed()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 520
    invoke-virtual {p0, v3}, Lcom/android/camera/module/FunModule;->enableCameraControls(Z)V

    .line 521
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.android.camera.action.start_video_recording"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    .line 522
    iput-boolean v3, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    .line 523
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/FunModule;->mRecordingStartTime:J

    .line 524
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 525
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "listen call state"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->updateRecordingTime()V

    .line 528
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->keepScreenOn()V

    .line 529
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 530
    const/4 v0, 0x0

    invoke-virtual {p0, v3, v0}, Lcom/android/camera/module/FunModule;->trackGeneralInfo(IZ)V

    .line 531
    return-void
.end method

.method private releaseLastMediaRecorder()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 415
    sget-object v1, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "releaseLastMediaRecorder "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mLastMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mLastMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    if-eqz v0, :cond_0

    .line 417
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mLastMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->join()V

    .line 418
    iput-object v3, p0, Lcom/android/camera/module/FunModule;->mLastMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    .line 420
    :cond_0
    return-void

    .line 415
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private releaseMediaRecorder()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 423
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "releaseMediaRecorder"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mLastMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    .line 426
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->cleanupEmptyFile()V

    .line 427
    iput-object v2, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    .line 429
    :cond_0
    return-void
.end method

.method private releaseResources()V
    .locals 0

    .prologue
    .line 672
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->closeCamera()V

    .line 673
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->releaseMediaRecorder()V

    .line 674
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->releaseLastMediaRecorder()V

    .line 675
    return-void
.end method

.method private setVideoSize(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 310
    iget v0, p0, Lcom/android/camera/module/FunModule;->mCameraDisplayOrientation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    .line 311
    new-instance v0, Lcom/android/camera/CameraSize;

    invoke-direct {v0, p1, p2}, Lcom/android/camera/CameraSize;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 315
    :goto_0
    return-void

    .line 313
    :cond_0
    new-instance v0, Lcom/android/camera/CameraSize;

    invoke-direct {v0, p2, p1}, Lcom/android/camera/CameraSize;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mVideoSize:Lcom/android/camera/CameraSize;

    goto :goto_0
.end method

.method private startRecorder()Z
    .locals 8

    .prologue
    .line 487
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->initializeRecorder()V

    .line 488
    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    if-nez v3, :cond_0

    .line 489
    sget-object v3, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "fail to initialize recorder"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    const/4 v3, 0x0

    return v3

    .line 492
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/camera/module/FunModule;->mRequestStartTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x1c2

    sub-long v0, v6, v4

    .line 493
    .local v0, "startOffset":J
    const-wide/16 v4, 0x0

    cmp-long v3, v0, v4

    if-gez v3, :cond_1

    .line 494
    const-wide/16 v0, 0x0

    .line 496
    :cond_1
    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->startRecording(J)Z

    move-result v2

    .line 497
    .local v2, "started":Z
    if-nez v2, :cond_2

    .line 498
    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-virtual {v3}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->stopRecording()V

    .line 499
    const v3, 0x7f0f0153

    .line 500
    const v4, 0x7f0f0155

    .line 499
    invoke-virtual {p0, v3, v4}, Lcom/android/camera/module/FunModule;->showConfirmMessage(II)V

    .line 501
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->releaseMediaRecorder()V

    .line 503
    :cond_2
    return v2
.end method

.method private updateFilter()V
    .locals 4

    .prologue
    .line 762
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 763
    .local v0, "effect":I
    sget-object v1, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "updateFilter: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 765
    return-void
.end method

.method private updateFpsRange()V
    .locals 4

    .prologue
    const/16 v3, 0x1e

    .line 768
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/util/Range;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    .line 769
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 6

    .prologue
    .line 752
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v3, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v2, v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    .line 753
    .local v1, "supportedVideoSize":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    iget v2, p0, Lcom/android/camera/module/FunModule;->mModuleIndex:I

    iget v3, p0, Lcom/android/camera/module/FunModule;->mBogusCameraId:I

    .line 754
    const/16 v4, 0x10

    const/16 v5, 0x9

    invoke-static {v4, v5}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v4

    float-to-double v4, v4

    .line 753
    invoke-static {v2, v3, v1, v4, v5}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 756
    .local v0, "previewSize":Lcom/android/camera/CameraSize;
    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 757
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/module/FunModule;->updateCameraScreenNailSize(II)V

    .line 758
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "previewSize: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 759
    return-void
.end method

.method private updateVideoStabilization()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 617
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 618
    return-void

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 622
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 623
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 624
    return-void
.end method


# virtual methods
.method public varargs consumePreference([I)V
    .locals 6
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .prologue
    .line 679
    const/4 v1, 0x0

    array-length v2, p1

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p1, v1

    .line 680
    .local v0, "type":I
    packed-switch v0, :pswitch_data_0

    .line 740
    :pswitch_0
    sget-boolean v3, Lcom/android/camera/module/FunModule;->DEBUG:Z

    if-eqz v3, :cond_0

    .line 741
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

    .line 682
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->updatePictureAndPreviewSize()V

    .line 679
    :goto_1
    :pswitch_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 686
    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->updateFilter()V

    goto :goto_1

    .line 690
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->updateFocusArea()V

    goto :goto_1

    .line 694
    :pswitch_5
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->updateFace()V

    goto :goto_1

    .line 698
    :pswitch_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/FunModule;->updateAntiBanding(Ljava/lang/String;)V

    goto :goto_1

    .line 702
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->updateFlashPreference()V

    goto :goto_1

    .line 706
    :pswitch_8
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->updateVideoFocusMode()V

    goto :goto_1

    .line 710
    :pswitch_9
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->getZoomValue()F

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/FunModule;->setZoomRatio(F)V

    goto :goto_1

    .line 714
    :pswitch_a
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->focusCenter()V

    goto :goto_1

    .line 718
    :pswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->updateExposureMeteringMode()V

    goto :goto_1

    .line 722
    :pswitch_c
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->updateVideoStabilization()V

    goto :goto_1

    .line 726
    :pswitch_d
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->setEvValue()V

    goto :goto_1

    .line 736
    :pswitch_e
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->updateFpsRange()V

    goto :goto_1

    .line 743
    :cond_0
    sget-object v3, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "no consumer for this updateType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 748
    .end local v0    # "type":I
    :cond_1
    return-void

    .line 680
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_2
        :pswitch_d
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_a
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_2
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public isNeedMute()Z
    .locals 1

    .prologue
    .line 667
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->isNeedMute()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected onCameraOpened()V
    .locals 1

    .prologue
    .line 156
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    .line 157
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->readVideoPreferences()V

    .line 158
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->initializeFocusManager()V

    .line 159
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->setPreviewFrameLayoutAspectRatio()V

    .line 160
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/FunModule;->updatePreferenceTrampoline([I)V

    .line 161
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->startPreview()V

    .line 162
    return-void
.end method

.method public onCreate(II)V
    .locals 2
    .param p1, "moduleIndex"    # I
    .param p2, "cameraId"    # I

    .prologue
    .line 140
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->onCreate(II)V

    .line 142
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->changeConflictPreference()V

    .line 143
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/FunModule;->setCaptureIntent(Z)V

    .line 144
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 146
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    .line 147
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/FunModule;->enableCameraControls(Z)V

    .line 148
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 150
    const-string/jumbo v0, "continuous-video"

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mVideoFocusMode:Ljava/lang/String;

    .line 151
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->onCameraOpened()V

    .line 152
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 305
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onDestroy()V

    .line 306
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 307
    return-void
.end method

.method public onFilterChanged(II)V
    .locals 3
    .param p1, "category"    # I
    .param p2, "newIndex"    # I

    .prologue
    .line 123
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x2

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/module/FunModule;->updatePreferenceTrampoline([I)V

    .line 124
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateEffectViewVisible()V

    .line 125
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 267
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onPause()V

    .line 269
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->waitStereoSwitchThread()V

    .line 270
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->unregisterReceiver()V

    .line 272
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->releaseResources()V

    .line 274
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/FunModule;->updateStereoSettings(Z)V

    .line 282
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->closeVideoFileDescriptor()V

    .line 284
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 285
    invoke-virtual {p0, v1}, Lcom/android/camera/module/FunModule;->stopFaceDetection(Z)V

    .line 286
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->resetScreenOn()V

    .line 288
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 289
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 291
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/ui/PopupManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/ui/PopupManager;

    move-result-object v0

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/ui/PopupManager;->notifyShowPopup(Landroid/view/View;I)V

    .line 293
    :cond_0
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 111
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onPreviewLayoutChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 113
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 115
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    .line 116
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 114
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 117
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 119
    :cond_0
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 773
    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 775
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 776
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onPreviewSessionSuccess: module is not ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    return-void

    .line 779
    :cond_0
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

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

    .line 780
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/FunModule;->mFaceDetectionEnabled:Z

    .line 781
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/FunModule;->updatePreferenceInWorkThread([I)V

    .line 782
    return-void
.end method

.method protected onPreviewStart()V
    .locals 5
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    const/16 v4, 0x16

    const/4 v1, 0x1

    .line 361
    iget-boolean v0, p0, Lcom/android/camera/module/FunModule;->mPreviewing:Z

    if-eqz v0, :cond_0

    .line 362
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 363
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 364
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 366
    invoke-virtual {p0, v1}, Lcom/android/camera/module/FunModule;->enableCameraControls(Z)V

    .line 368
    const/4 v0, 0x3

    .line 367
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/module/FunModule;->onShutterButtonFocus(ZI)V

    .line 370
    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged()V
    .locals 1

    .prologue
    .line 236
    iget-boolean v0, p0, Lcom/android/camera/module/FunModule;->mPaused:Z

    if-eqz v0, :cond_0

    .line 237
    return-void

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_1

    .line 241
    return-void

    .line 244
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->readVideoPreferences()V

    .line 245
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 7
    .param p1, "mode"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 188
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onShutterButtonClick  isRecording="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 189
    iget-boolean v4, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    .line 188
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 190
    const-string/jumbo v4, " inStartingFocusRecording="

    .line 188
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 190
    iget-boolean v4, p0, Lcom/android/camera/module/FunModule;->mInStartingFocusRecording:Z

    .line 188
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iput-boolean v5, p0, Lcom/android/camera/module/FunModule;->mInStartingFocusRecording:Z

    .line 192
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isIgnoreTouchEvent()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 193
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "onShutterButtonClick: ignore touch event"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    return-void

    .line 198
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 199
    const/16 v3, 0xa2

    .line 198
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 200
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilter()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 201
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideFilter()V

    .line 204
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    .line 205
    .local v1, "stop":Z
    if-eqz v1, :cond_2

    .line 206
    invoke-virtual {p0, v6, v5}, Lcom/android/camera/module/FunModule;->stopVideoRecording(ZZ)V

    .line 231
    :goto_0
    return-void

    .line 208
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->checkCallingState()Z

    move-result v2

    if-nez v2, :cond_3

    .line 209
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 210
    return-void

    .line 213
    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 214
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 215
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 216
    return-void

    .line 219
    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/camera/module/FunModule;->setTriggerMode(I)V

    .line 220
    invoke-virtual {p0, v5}, Lcom/android/camera/module/FunModule;->enableCameraControls(Z)V

    .line 222
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/FunModule;->playCameraSound(I)V

    .line 223
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/FunModule;->mRequestStartTime:J

    .line 224
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->canRecord()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 225
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->startVideoRecording()V

    goto :goto_0

    .line 227
    :cond_5
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "wait for autoFocus"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    iput-boolean v6, p0, Lcom/android/camera/module/FunModule;->mInStartingFocusRecording:Z

    goto :goto_0
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0
    .param p1, "pressed"    # Z
    .param p2, "from"    # I

    .prologue
    .line 183
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 629
    iget-boolean v2, p0, Lcom/android/camera/module/FunModule;->mPaused:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/android/camera/module/FunModule;->mSnapshotInProgress:Z

    if-nez v2, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/FunModule;->isInTapableRect(II)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    .line 630
    :cond_0
    return-void

    .line 633
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isSessionReady()Z

    move-result v2

    if-nez v2, :cond_2

    .line 634
    sget-object v2, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "onSingleTapUp: null session"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 635
    return-void

    .line 638
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isFrameAvailable()Z

    move-result v2

    if-nez v2, :cond_3

    .line 639
    return-void

    .line 643
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 644
    const/16 v3, 0xab

    .line 643
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 645
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 646
    return-void

    .line 653
    :cond_4
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 654
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/FunModule;->mTouchFocusStartingTime:J

    .line 655
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 656
    .local v1, "point":Landroid/graphics/Point;
    invoke-virtual {p0, v1}, Lcom/android/camera/module/FunModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 657
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v4, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 658
    return-void
.end method

.method public onStickerChanged(Ljava/lang/String;)V
    .locals 4
    .param p1, "newSticker"    # Ljava/lang/String;

    .prologue
    .line 129
    sget-object v1, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onStickerChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    if-eqz v1, :cond_0

    .line 131
    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->getGLCanvas()Lcom/android/gallery3d/ui/GLCanvasImpl;

    move-result-object v0

    .line 132
    .local v0, "glCanvas":Lcom/android/gallery3d/ui/GLCanvas;
    instance-of v1, v0, Lcom/android/gallery3d/ui/GLCanvasImpl;

    if-eqz v1, :cond_0

    .line 133
    check-cast v0, Lcom/android/gallery3d/ui/GLCanvasImpl;

    .end local v0    # "glCanvas":Lcom/android/gallery3d/ui/GLCanvas;
    invoke-virtual {v0, p1}, Lcom/android/gallery3d/ui/GLCanvasImpl;->setSticker(Ljava/lang/String;)V

    .line 136
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 297
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onStop()V

    .line 300
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->setCurrentSticker(Ljava/lang/String;)V

    .line 301
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .prologue
    .line 339
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/FunModule;->mPreviewing:Z

    .line 341
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 344
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_1

    .line 345
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 347
    :cond_1
    return-void
.end method

.method protected readVideoPreferences()V
    .locals 1

    .prologue
    .line 249
    const/16 v0, 0x28d2

    iput v0, p0, Lcom/android/camera/module/FunModule;->mMaxVideoDurationInMs:I

    .line 250
    return-void
.end method

.method public registerProtocol()V
    .locals 5

    .prologue
    .line 87
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->registerProtocol()V

    .line 88
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 89
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 90
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 91
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb2

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 92
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 94
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/16 v3, 0xa4

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 95
    return-void
.end method

.method protected resizeForPreviewAspectRatio()V
    .locals 5

    .prologue
    .line 254
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 257
    .local v0, "degrees":I
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v1

    .line 258
    .local v1, "sensorOrientation":I
    sub-int v2, v1, v0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_0

    .line 259
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->width:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    .line 263
    :goto_0
    return-void

    .line 261
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/FunModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    goto :goto_0
.end method

.method public resumePreview()V
    .locals 2

    .prologue
    .line 351
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/FunModule;->mPreviewing:Z

    .line 353
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 356
    :cond_0
    return-void
.end method

.method public startPreview()V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 319
    sget-object v0, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startPreview: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v3, p0, Lcom/android/camera/module/FunModule;->mPreviewing:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 321
    return-void

    .line 323
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->checkDisplayOrientation()V

    .line 324
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/FunModule;->setVideoSize(II)V

    .line 325
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 326
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/FunModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 327
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 328
    new-instance v1, Landroid/view/Surface;

    iget-object v3, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    move v3, v2

    move v4, v2

    move-object v5, p0

    .line 327
    invoke-virtual/range {v0 .. v5}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 333
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/FunModule;->mPreviewing:Z

    .line 335
    return-void
.end method

.method protected startVideoRecording()V
    .locals 3

    .prologue
    .line 467
    sget-object v1, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "startVideoRecording"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoUri:Landroid/net/Uri;

    .line 470
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->silenceSounds()V

    .line 471
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->startRecorder()Z

    move-result v1

    if-nez v1, :cond_0

    .line 472
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->onStartRecorderFail()V

    .line 473
    return-void

    .line 477
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 478
    const/16 v2, 0xa2

    .line 477
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 479
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingStart()V

    .line 481
    sget-object v1, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "startVideoRecording process done"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->onStartRecorderSucceed()V

    .line 483
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 10
    .param p1, "stopRecorder"    # Z
    .param p2, "fromRelease"    # Z

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 535
    iget-boolean v4, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    if-nez v4, :cond_0

    .line 536
    return-void

    .line 539
    :cond_0
    iput-boolean v9, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    .line 540
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/camera/module/FunModule;->mRecordingStartTime:J

    sub-long v2, v4, v6

    .line 541
    .local v2, "videoDuration":J
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mMuxer:Lcom/android/camera/module/encoder/MediaMuxerWrapper;

    invoke-virtual {v4}, Lcom/android/camera/module/encoder/MediaMuxerWrapper;->stopRecording()V

    .line 542
    iget-boolean v4, p0, Lcom/android/camera/module/FunModule;->mPaused:Z

    if-nez v4, :cond_1

    .line 543
    const/4 v4, 0x3

    invoke-virtual {p0, v4}, Lcom/android/camera/module/FunModule;->playCameraSound(I)V

    .line 545
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/FunModule;->releaseMediaRecorder()V

    .line 546
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-nez v4, :cond_6

    const/4 v1, 0x1

    .line 547
    .local v1, "emptyVideo":Z
    :goto_0
    if-nez v1, :cond_2

    const-wide/16 v4, 0x3e8

    cmp-long v4, v2, v4

    if-gez v4, :cond_2

    .line 548
    const/4 v1, 0x1

    .line 549
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/android/camera/module/FunModule;->deleteVideoFile(Ljava/lang/String;)V

    .line 551
    :cond_2
    if-nez v1, :cond_3

    .line 552
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v5, p0, Lcom/android/camera/module/FunModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v4, v5}, Lcom/android/camera/module/FunModule;->addSaveTask(Ljava/lang/String;Landroid/content/ContentValues;)V

    .line 555
    :cond_3
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "com.android.camera.action.stop_video_recording"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    .line 556
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v5, p0, Lcom/android/camera/module/FunModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v4, v5, v9}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 557
    sget-object v4, Lcom/android/camera/module/FunModule;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "listen none"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->animateHold()V

    .line 562
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v4, :cond_4

    .line 563
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v4}, Landroid/os/CountDownTimer;->cancel()V

    .line 567
    :cond_4
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 568
    const/16 v5, 0xa2

    .line 567
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 570
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFinish()V

    .line 572
    if-nez p2, :cond_5

    const-string/jumbo v4, "continuous-video"

    iget-object v5, p0, Lcom/android/camera/module/FunModule;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_5

    .line 573
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v5, 0x2

    invoke-interface {v4, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 574
    const-string/jumbo v4, "continuous-video"

    invoke-virtual {p0, v4}, Lcom/android/camera/module/FunModule;->setVideoFocusMode(Ljava/lang/String;)V

    .line 575
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 576
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 580
    :cond_5
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4, v8}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 581
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->restoreMusicSound()V

    .line 582
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->keepScreenOnAwhile()V

    .line 583
    iget-object v4, p0, Lcom/android/camera/module/FunModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v4}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    .line 584
    return-void

    .line 546
    .end local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    .end local v1    # "emptyVideo":Z
    :cond_6
    const/4 v1, 0x0

    .restart local v1    # "emptyVideo":Z
    goto/16 :goto_0
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 99
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->unRegisterProtocol()V

    .line 100
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 101
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 102
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 103
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb2

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 104
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 106
    invoke-virtual {p0}, Lcom/android/camera/module/FunModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 107
    return-void
.end method

.method protected updateRecordingTime()V
    .locals 6

    .prologue
    .line 588
    iget-boolean v0, p0, Lcom/android/camera/module/FunModule;->mMediaRecorderRecording:Z

    if-nez v0, :cond_0

    .line 589
    return-void

    .line 592
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_1

    .line 593
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 596
    :cond_1
    new-instance v0, Lcom/android/camera/module/FunModule$2;

    iget v1, p0, Lcom/android/camera/module/FunModule;->mMaxVideoDurationInMs:I

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/module/FunModule$2;-><init>(Lcom/android/camera/module/FunModule;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/FunModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    .line 613
    iget-object v0, p0, Lcom/android/camera/module/FunModule;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 614
    return-void
.end method
