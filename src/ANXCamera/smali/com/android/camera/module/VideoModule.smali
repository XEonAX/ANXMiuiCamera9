.class public Lcom/android/camera/module/VideoModule;
.super Lcom/android/camera/module/VideoBase;
.source "VideoModule.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
.implements Landroid/media/MediaRecorder$OnErrorListener;
.implements Landroid/media/MediaRecorder$OnInfoListener;
.implements Lcom/android/camera/ui/ObjectView$ObjectViewListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/VideoModule$JpegPictureCallback;
    }
.end annotation


# static fields
.field private static final HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIDEO_MIN_SINGLE_FILE_SIZE:J


# instance fields
.field private mCaptureTimeLapse:Z

.field private volatile mCurrentFileNumber:I

.field private mFovcEnabled:Z

.field private mHfrFPSLower:I

.field private mHfrFPSUpper:I

.field private final mLock:Ljava/lang/Object;

.field private mMediaRecorder:Landroid/media/MediaRecorder;

.field private mNextVideoFileName:Ljava/lang/String;

.field private mNextVideoValues:Landroid/content/ContentValues;

.field private mPauseClickTime:J

.field private volatile mPendingStopRecorder:Z

.field private mProfile:Landroid/media/CamcorderProfile;

.field private mQuality:I

.field private mQuickCapture:Z

.field private mRecorderSurface:Landroid/view/Surface;

.field private mRecordingTime:Ljava/lang/String;

.field private mRecordingTimeCountsDown:Z

.field private mSnapshotInProgress:Z

.field private mSpeed:Ljava/lang/String;

.field private mSplitWhenReachMaxSize:Z

.field private mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

.field private mTimeBetweenTimeLapseFrameCaptureMs:I

.field private mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

.field private mVideoRecordTime:J

.field private mVideoRecordedDuration:J


# direct methods
.method static synthetic -get0(Lcom/android/camera/module/VideoModule;)Landroid/media/MediaRecorder;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/module/VideoModule;)Ljava/lang/String;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/module/VideoModule;)Ljava/util/concurrent/CountDownLatch;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/module/VideoModule;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/module/VideoModule;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;
    .param p1, "-value"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/module/VideoModule;I)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;
    .param p1, "saveType"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoModule;->needImageThumbnail(I)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/VideoModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onMediaRecorderReleased()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/module/VideoModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/VideoModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 107
    const-wide/32 v0, 0x800000

    const-wide/32 v2, 0x3200000

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 106
    sput-wide v0, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    .line 150
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    .line 154
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string/jumbo v1, "3840x2160:30"

    const v2, 0x24b76a0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string/jumbo v1, "1920x1080:30"

    const v2, 0xeafc40

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string/jumbo v1, "1280x720:30"

    const v2, 0xa47d60

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    const-string/jumbo v1, "720x480:30"

    const v2, 0x150e00

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 161
    const-class v0, Lcom/android/camera/module/VideoModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoBase;-><init>(Ljava/lang/String;)V

    .line 134
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 136
    const-string/jumbo v0, "normal"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 138
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 140
    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    .line 145
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    .line 147
    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 162
    return-void
.end method

.method private convertSizeToQuality(Ljava/lang/String;)I
    .locals 3
    .param p1, "size"    # Ljava/lang/String;

    .prologue
    .line 549
    const-string/jumbo v0, "1920x1080"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 551
    const/4 v0, 0x6

    return v0

    .line 549
    :cond_0
    const-string/jumbo v0, "1280x720"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 553
    const/4 v0, 0x5

    return v0

    .line 555
    :cond_1
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unexpected hfr video size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    const/4 v0, -0x1

    return v0
.end method

.method private forceToNormalMode()V
    .locals 3

    .prologue
    .line 530
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 531
    .local v0, "editor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    const-string/jumbo v1, "pref_video_speed_key"

    const-string/jumbo v2, "normal"

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 532
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 533
    const-string/jumbo v1, "normal"

    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 534
    return-void
.end method

.method private getHevcVideoEncoderBitRate(Landroid/media/CamcorderProfile;)I
    .locals 5
    .param p1, "profile"    # Landroid/media/CamcorderProfile;

    .prologue
    .line 913
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 914
    const-string/jumbo v3, ":"

    .line 913
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 914
    iget v3, p1, Landroid/media/CamcorderProfile;->videoFrameRate:I

    .line 913
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 915
    .local v1, "key":Ljava/lang/String;
    sget-object v2, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 916
    sget-object v2, Lcom/android/camera/module/VideoModule;->HEVC_VIDEO_ENCODER_BITRATE:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 921
    .local v0, "bitRate":I
    :goto_0
    return v0

    .line 918
    .end local v0    # "bitRate":I
    :cond_0
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no pre-defined bitrate for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 919
    iget v0, p1, Landroid/media/CamcorderProfile;->videoBitRate:I

    .restart local v0    # "bitRate":I
    goto :goto_0
.end method

.method private getHfrSetting()Ljava/lang/String;
    .locals 3

    .prologue
    .line 508
    invoke-static {}, Lcom/android/camera/CameraSettings;->getHfrSetting()Ljava/lang/String;

    move-result-object v0

    .line 509
    .local v0, "hfrSetting":Ljava/lang/String;
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getSupportedHfrSettings(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 510
    .local v1, "supportedHfr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 511
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "hfrSetting":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 513
    .restart local v0    # "hfrSetting":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method private getRecorderMaxFileSize(I)J
    .locals 6
    .param p1, "debugSize"    # I

    .prologue
    .line 925
    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v2

    const-wide/32 v4, 0x3200000

    sub-long v0, v2, v4

    .line 926
    .local v0, "maxFileSize":J
    if-lez p1, :cond_0

    int-to-long v2, p1

    cmp-long v2, v2, v0

    if-gez v2, :cond_0

    .line 927
    int-to-long v0, p1

    .line 929
    :cond_0
    const-wide v2, 0xdac00000L

    cmp-long v2, v0, v2

    if-lez v2, :cond_3

    .line 930
    const-wide v0, 0xdac00000L

    .line 934
    :cond_1
    :goto_0
    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_2

    .line 935
    iget-wide v0, p0, Lcom/android/camera/module/VideoModule;->mIntentRequestSize:J

    .line 937
    :cond_2
    return-wide v0

    .line 931
    :cond_3
    sget-wide v2, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 932
    sget-wide v0, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    goto :goto_0
.end method

.method private getRecorderOrientationHint()I
    .locals 4

    .prologue
    .line 953
    const/4 v0, 0x0

    .line 954
    .local v0, "rotation":I
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v1

    .line 955
    .local v1, "sensorOrientation":I
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 956
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 957
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    sub-int v2, v1, v2

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v0, v2, 0x168

    .line 964
    :goto_0
    return v0

    .line 959
    :cond_0
    iget v2, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    add-int/2addr v2, v1

    rem-int/lit16 v0, v2, 0x168

    goto :goto_0

    .line 962
    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private getSpeedRecordVideoLength(JD)J
    .locals 7
    .param p1, "deltaMs"    # J
    .param p3, "timeBetweenFrameMs"    # D

    .prologue
    .line 1355
    const-wide/16 v2, 0x0

    cmpl-double v2, p3, v2

    if-nez v2, :cond_0

    .line 1356
    const-wide/16 v2, 0x0

    return-wide v2

    .line 1360
    :cond_0
    long-to-double v2, p1

    div-double v0, v2, p3

    .line 1362
    .local v0, "numberOfFrames":D
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getNormalVideoFrameRate()I

    move-result v2

    int-to-double v2, v2

    div-double v2, v0, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    double-to-long v2, v2

    .line 1361
    return-wide v2
.end method

.method private initRecorderSurface()V
    .locals 1

    .prologue
    .line 251
    invoke-static {}, Landroid/media/MediaCodec;->createPersistentInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    .line 252
    return-void
.end method

.method private initializeObjectTrack(Landroid/graphics/RectF;Z)Z
    .locals 1
    .param p1, "rectF"    # Landroid/graphics/RectF;
    .param p2, "up"    # Z

    .prologue
    .line 1468
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 1469
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 1470
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeObjectTrack(Landroid/graphics/RectF;Z)Z

    move-result v0

    return v0
.end method

.method private initializeRecorder()Z
    .locals 18

    .prologue
    .line 768
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v13, "initializeRecorder>>"

    invoke-static {v12, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 769
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 770
    .local v6, "start":J
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    .line 771
    .local v2, "activity":Landroid/app/Activity;
    if-nez v2, :cond_0

    .line 772
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v13, "initializeRecorder: null host"

    invoke-static {v12, v13}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    const/4 v12, 0x0

    return v12

    .line 776
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->closeVideoFileDescriptor()V

    .line 777
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->cleanupEmptyFile()V

    .line 779
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 780
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v12}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/android/camera/module/VideoModule;->parseIntent(Landroid/content/Intent;)V

    .line 782
    :cond_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-nez v12, :cond_2

    .line 783
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/android/camera/module/VideoModule;->genContentValues(II)Landroid/content/ContentValues;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 784
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    const-string/jumbo v13, "_data"

    invoke-virtual {v12, v13}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 787
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    if-eqz v12, :cond_3

    .line 788
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 790
    .local v10, "waitStart":J
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mStopRecorderDone:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v14, 0x3e8

    sget-object v13, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v12, v14, v15, v13}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 794
    :goto_0
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "initializeRecorder: waitTime="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long/2addr v14, v10

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    .end local v10    # "waitStart":J
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 798
    .local v8, "t1":J
    const/4 v5, 0x1

    .line 799
    .local v5, "success":Z
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    monitor-enter v13

    .line 800
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-nez v12, :cond_7

    .line 801
    new-instance v12, Landroid/media/MediaRecorder;

    invoke-direct {v12}, Landroid/media/MediaRecorder;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    :goto_1
    monitor-exit v13

    .line 809
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/camera/module/VideoModule;->setupRecorder(Landroid/media/MediaRecorder;)V

    .line 810
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-virtual {v12, v13}, Landroid/media/MediaRecorder;->setInputSurface(Landroid/view/Surface;)V

    .line 812
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 813
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v12}, Landroid/media/MediaRecorder;->prepare()V

    .line 814
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 815
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 816
    sget-boolean v12, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v12, :cond_5

    .line 817
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "initializeRecorder: t2="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long/2addr v14, v8

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 825
    :cond_5
    :goto_2
    sget-boolean v12, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v12, :cond_6

    .line 826
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/camera/module/VideoModule;->showSurfaceInfo(Landroid/view/Surface;)V

    .line 828
    :cond_6
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "initializeRecorder<<time="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sub-long/2addr v14, v6

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 829
    return v5

    .line 791
    .end local v5    # "success":Z
    .end local v8    # "t1":J
    .restart local v10    # "waitStart":J
    :catch_0
    move-exception v4

    .line 792
    .local v4, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v4}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0

    .line 803
    .end local v4    # "e":Ljava/lang/InterruptedException;
    .end local v10    # "waitStart":J
    .restart local v5    # "success":Z
    .restart local v8    # "t1":J
    :cond_7
    :try_start_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v12}, Landroid/media/MediaRecorder;->reset()V

    .line 804
    sget-boolean v12, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v12, :cond_4

    .line 805
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "initializeRecorder: t1="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    sub-long v16, v16, v8

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v14}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1

    .line 799
    :catchall_0
    move-exception v12

    monitor-exit v13

    throw v12

    .line 819
    :catch_1
    move-exception v3

    .line 820
    .local v3, "e":Ljava/io/IOException;
    sget-object v12, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "prepare failed for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 821
    const/4 v5, 0x0

    .line 822
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    goto/16 :goto_2
.end method

.method private isEisOn()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1383
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-eqz v1, :cond_0

    .line 1384
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 1383
    if-eqz v1, :cond_0

    .line 1385
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v1

    .line 1383
    if-eqz v1, :cond_0

    .line 1386
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMovieSolidOn()Z

    move-result v1

    .line 1383
    if-eqz v1, :cond_0

    .line 1387
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v0

    .line 1383
    :cond_0
    return v0
.end method

.method private isHFRMode()Z
    .locals 2

    .prologue
    .line 541
    const-string/jumbo v0, "hfr"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isNormalMode()Z
    .locals 2

    .prologue
    .line 545
    const-string/jumbo v0, "normal"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSlowMode()Z
    .locals 2

    .prologue
    .line 537
    const-string/jumbo v0, "slow"

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSplitWhenReachMaxSize()Z
    .locals 1

    .prologue
    .line 945
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mSplitWhenReachMaxSize:Z

    return v0
.end method

.method private needImageThumbnail(I)Z
    .locals 1
    .param p1, "saveType"    # I

    .prologue
    .line 1865
    packed-switch p1, :pswitch_data_0

    .line 1870
    const/4 v0, 0x1

    return v0

    .line 1867
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 1865
    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_0
    .end packed-switch
.end method

.method private onMaxFileSizeReached()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1037
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1038
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v0, v1, v3, v3}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    .line 1039
    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 1040
    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1042
    :cond_0
    return-void
.end method

.method private onMediaRecorderReleased()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1223
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "onMediaRecorderReleased>>"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1224
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1225
    .local v0, "start":J
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v3, v6}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 1226
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restoreMusicSound()V

    .line 1228
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1

    .line 1230
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 1231
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v3, v4, v7, v7}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    .line 1232
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onMediaRecorderReleased: outputUri="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1234
    :cond_0
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoUri:Landroid/net/Uri;

    if-eqz v3, :cond_5

    const/4 v2, 0x1

    .line 1235
    .local v2, "succeed":Z
    :goto_0
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mQuickCapture:Z

    if-eqz v3, :cond_6

    .line 1236
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->doReturnToCaller(Z)V

    .line 1242
    .end local v2    # "succeed":Z
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v3, :cond_7

    .line 1243
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1244
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    invoke-direct {p0, v3, v4, v7, v8}, Lcom/android/camera/module/VideoModule;->saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;

    .line 1246
    :cond_2
    iput-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1247
    iput-object v6, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 1253
    :cond_3
    :goto_2
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v5, "com.android.camera.action.stop_video_recording"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    .line 1254
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    invoke-virtual {v3, v4, v8}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 1255
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "listen none"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1257
    invoke-virtual {p0, v7}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1258
    const-string/jumbo v3, "continuous-video"

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mVideoFocusMode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 1259
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusStateIfNeeded()V

    .line 1260
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v3, :cond_4

    .line 1261
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x2

    invoke-interface {v3, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 1262
    const-string/jumbo v3, "continuous-video"

    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->setVideoFocusMode(Ljava/lang/String;)V

    .line 1263
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1264
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 1269
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepScreenOnAwhile()V

    .line 1270
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onMediaRecorderReleased<<time="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1271
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStopVideoRecordEnd()V

    .line 1273
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->doLaterReleaseIfNeed()V

    .line 1274
    return-void

    .line 1234
    :cond_5
    const/4 v2, 0x0

    .restart local v2    # "succeed":Z
    goto/16 :goto_0

    .line 1237
    :cond_6
    if-eqz v2, :cond_1

    .line 1238
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->showAlert()V

    goto/16 :goto_1

    .line 1248
    .end local v2    # "succeed":Z
    :cond_7
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v3, :cond_3

    .line 1250
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    goto/16 :goto_2
.end method

.method private onStartRecorderFail()V
    .locals 3

    .prologue
    .line 1109
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1110
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    .line 1111
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mAudioManager:Landroid/media/AudioManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 1112
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->restoreMusicSound()V

    .line 1114
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1115
    const/16 v2, 0xa2

    .line 1114
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1116
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 1117
    return-void
.end method

.method private onStartRecorderSucceed()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1120
    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1121
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.android.camera.action.start_video_recording"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->sendBroadcast(Landroid/content/Intent;)V

    .line 1122
    iput-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 1123
    iput-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    .line 1124
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    .line 1125
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    .line 1126
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    .line 1127
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 1128
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "listen call state"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1130
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    .line 1131
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->keepScreenOn()V

    .line 1133
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 1134
    invoke-virtual {p0, v3, v4}, Lcom/android/camera/module/VideoModule;->trackGeneralInfo(IZ)V

    .line 1135
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 1136
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 1137
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3}, Lcom/android/camera2/Camera2Proxy;->getFlashMode()I

    move-result v3

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 1136
    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoRecording(ZLjava/lang/String;III)V

    .line 1139
    :cond_0
    return-void
.end method

.method private pauseVideoRecording()V
    .locals 6

    .prologue
    .line 1609
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "pauseVideoRecording"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1610
    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 1612
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1617
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    .line 1618
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    .line 1619
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1620
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    .line 1622
    :cond_0
    return-void

    .line 1613
    :catch_0
    move-exception v0

    .line 1614
    .local v0, "e":Ljava/lang/IllegalStateException;
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "failed to pause media recorder"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private releaseMediaRecorder()V
    .locals 8

    .prologue
    .line 968
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "releaseRecorder"

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 970
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 971
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 972
    .local v0, "recorder":Landroid/media/MediaRecorder;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v4

    .line 974
    if-eqz v0, :cond_0

    .line 975
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->cleanupEmptyFile()V

    .line 976
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 977
    .local v2, "start":J
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->reset()V

    .line 978
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "releaseRecorder: t1="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 979
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 980
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 981
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "releaseRecorder: t2="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 983
    .end local v2    # "start":J
    :cond_0
    return-void

    .line 970
    .end local v0    # "recorder":Landroid/media/MediaRecorder;
    :catchall_0
    move-exception v1

    monitor-exit v4

    throw v1
.end method

.method private releaseRecorderSurface()V
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 258
    :cond_0
    return-void
.end method

.method private releaseResources()V
    .locals 0

    .prologue
    .line 1631
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeCamera()V

    .line 1632
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    .line 1633
    return-void
.end method

.method private saveVideo(Ljava/lang/String;Landroid/content/ContentValues;ZZ)Landroid/net/Uri;
    .locals 4
    .param p1, "videoPath"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "isFinal"    # Z
    .param p4, "sync"    # Z

    .prologue
    .line 1045
    const/4 v0, 0x0

    .line 1046
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v1, :cond_1

    .line 1047
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "saveVideo: path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " isFinal="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1048
    if-nez p4, :cond_0

    .line 1049
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 1056
    .end local v0    # "uri":Landroid/net/Uri;
    :goto_0
    return-object v0

    .line 1051
    .restart local v0    # "uri":Landroid/net/Uri;
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Lcom/android/camera/storage/ImageSaver;->addVideoSync(Ljava/lang/String;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    move-result-object v0

    .local v0, "uri":Landroid/net/Uri;
    goto :goto_0

    .line 1054
    .local v0, "uri":Landroid/net/Uri;
    :cond_1
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "saveVideo: failed to save "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setJpegQuality()V
    .locals 4

    .prologue
    .line 1391
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1392
    return-void

    .line 1394
    :cond_0
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    .line 1395
    const/4 v2, 0x2

    .line 1394
    invoke-static {v1, v2}, Landroid/media/CameraProfile;->getJpegEncodingQualityParameter(II)I

    move-result v0

    .line 1396
    .local v0, "jpegQuality":I
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "jpegQuality="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1397
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    .line 1398
    return-void
.end method

.method private setSplitWhenReachMaxSize(Z)V
    .locals 0
    .param p1, "split"    # Z

    .prologue
    .line 941
    iput-boolean p1, p0, Lcom/android/camera/module/VideoModule;->mSplitWhenReachMaxSize:Z

    .line 942
    return-void
.end method

.method private setupRecorder(Landroid/media/MediaRecorder;)V
    .locals 14
    .param p1, "mediaRecorder"    # Landroid/media/MediaRecorder;

    .prologue
    .line 842
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v3

    .line 843
    .local v3, "isNormal":Z
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v2

    .line 844
    .local v2, "isHFR":Z
    if-nez v3, :cond_6

    move v8, v2

    .line 845
    :goto_0
    const/4 v9, 0x2

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 846
    if-eqz v8, :cond_0

    .line 847
    const/4 v9, 0x5

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 849
    :cond_0
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->fileFormat:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 851
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setVideoEncoder(I)V

    .line 852
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v10, v10, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-virtual {p1, v9, v10}, Landroid/media/MediaRecorder;->setVideoSize(II)V

    .line 853
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 855
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->videoCodec:I

    const/4 v10, 0x5

    if-ne v10, v9, :cond_7

    .line 856
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    invoke-direct {p0, v9}, Lcom/android/camera/module/VideoModule;->getHevcVideoEncoderBitRate(Landroid/media/CamcorderProfile;)I

    move-result v0

    .line 857
    .local v0, "bitrate":I
    sget-object v9, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "H265 bitrate: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 862
    :goto_1
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 864
    if-eqz v8, :cond_1

    .line 865
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->audioBitRate:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setAudioEncodingBitRate(I)V

    .line 866
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->audioChannels:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setAudioChannels(I)V

    .line 867
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->audioSampleRate:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setAudioSamplingRate(I)V

    .line 868
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->audioCodec:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 870
    :cond_1
    iget-boolean v9, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-eqz v9, :cond_8

    .line 871
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    int-to-double v10, v9

    const-wide v12, 0x408f400000000000L    # 1000.0

    div-double v10, v12, v10

    invoke-virtual {p1, v10, v11}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    .line 881
    :cond_2
    :goto_2
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setMaxDuration(I)V

    .line 882
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v4

    .line 883
    .local v4, "loc":Landroid/location/Location;
    if-eqz v4, :cond_3

    .line 884
    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v10

    double-to-float v9, v10

    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v10

    double-to-float v10, v10

    invoke-virtual {p1, v9, v10}, Landroid/media/MediaRecorder;->setLocation(FF)V

    .line 888
    :cond_3
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v9, :cond_a

    .line 889
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mVideoFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v9}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v9

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/io/FileDescriptor;)V

    .line 895
    :goto_3
    const-string/jumbo v9, "camera.debug.video_max_size"

    const/4 v10, 0x0

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 896
    .local v1, "debugSize":I
    invoke-direct {p0, v1}, Lcom/android/camera/module/VideoModule;->getRecorderMaxFileSize(I)J

    move-result-wide v6

    .line 897
    .local v6, "maxFileSize":J
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-lez v9, :cond_4

    .line 898
    sget-object v9, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "maxFileSize="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    invoke-virtual {p1, v6, v7}, Landroid/media/MediaRecorder;->setMaxFileSize(J)V

    .line 901
    :cond_4
    if-gtz v1, :cond_5

    const-wide v10, 0xdac00000L

    cmp-long v9, v6, v10

    if-nez v9, :cond_b

    .line 902
    :cond_5
    const/4 v9, 0x1

    invoke-direct {p0, v9}, Lcom/android/camera/module/VideoModule;->setSplitWhenReachMaxSize(Z)V

    .line 906
    :goto_4
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getRecorderOrientationHint()I

    move-result v5

    .line 907
    .local v5, "orientationHint":I
    invoke-virtual {p1, v5}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    .line 908
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mOrientationCompensation:I

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mOrientationCompensationAtRecordStart:I

    .line 909
    return-void

    .line 844
    .end local v0    # "bitrate":I
    .end local v1    # "debugSize":I
    .end local v4    # "loc":Landroid/location/Location;
    .end local v5    # "orientationHint":I
    .end local v6    # "maxFileSize":J
    :cond_6
    const/4 v8, 0x1

    .local v8, "recordAudio":Z
    goto/16 :goto_0

    .line 859
    .end local v8    # "recordAudio":Z
    :cond_7
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v9, Landroid/media/CamcorderProfile;->videoBitRate:I

    .line 860
    .restart local v0    # "bitrate":I
    sget-object v9, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "H264 bitrate: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 872
    :cond_8
    if-nez v3, :cond_2

    .line 873
    if-eqz v2, :cond_9

    .line 874
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 875
    int-to-long v10, v0

    iget v9, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    int-to-long v12, v9

    mul-long/2addr v10, v12

    const-wide/16 v12, 0x1e

    div-long/2addr v10, v12

    long-to-int v0, v10

    .line 876
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 878
    :cond_9
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    int-to-double v10, v9

    invoke-virtual {p1, v10, v11}, Landroid/media/MediaRecorder;->setCaptureRate(D)V

    goto/16 :goto_2

    .line 891
    .restart local v4    # "loc":Landroid/location/Location;
    :cond_a
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {p1, v9}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 904
    .restart local v1    # "debugSize":I
    .restart local v6    # "maxFileSize":J
    :cond_b
    const/4 v9, 0x0

    invoke-direct {p0, v9}, Lcom/android/camera/module/VideoModule;->setSplitWhenReachMaxSize(Z)V

    goto :goto_4
.end method

.method private showSurfaceInfo(Landroid/view/Surface;)V
    .locals 7
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 833
    invoke-virtual {p1}, Landroid/view/Surface;->isValid()Z

    move-result v2

    .line 834
    .local v2, "isValid":Z
    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v1

    .line 835
    .local v1, "isForHwVideoEncoder":Z
    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->getSurfaceSize(Landroid/view/Surface;)Landroid/util/Size;

    move-result-object v3

    .line 836
    .local v3, "size":Landroid/util/Size;
    invoke-static {p1}, Landroid/hardware/camera2/utils/SurfaceUtils;->getSurfaceFormat(Landroid/view/Surface;)I

    move-result v0

    .line 837
    .local v0, "format":I
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "showSurfaceInfo: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 838
    const-string/jumbo v6, "|"

    .line 837
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 838
    const-string/jumbo v6, "|"

    .line 837
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    return-void
.end method

.method private startHighSpeedRecordSession()V
    .locals 6

    .prologue
    .line 656
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startHighSpeedRecordSession"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 658
    return-void

    .line 660
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 661
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 662
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 665
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 666
    new-instance v1, Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 667
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    .line 668
    new-instance v3, Landroid/util/Range;

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 665
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 670
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 671
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    invoke-direct {p0, v0}, Lcom/android/camera/module/VideoModule;->showSurfaceInfo(Landroid/view/Surface;)V

    .line 672
    return-void
.end method

.method private startPreviewAfterRecord()V
    .locals 1

    .prologue
    .line 365
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 366
    return-void

    .line 368
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_2

    .line 369
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 370
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecordPreview()V

    .line 375
    :cond_2
    :goto_0
    return-void

    .line 372
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->startRecordPreview()V

    goto :goto_0
.end method

.method private startPreviewSession()V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 675
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "startPreviewSession"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 677
    return-void

    .line 679
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 680
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 681
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 682
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 683
    new-instance v1, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 684
    .local v1, "surface":Landroid/view/Surface;
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    move v3, v2

    move v4, v2

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 689
    return-void
.end method

.method private startRecordSession()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 625
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "startRecordSession: mode="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 627
    return-void

    .line 629
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 630
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 631
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 632
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    .line 636
    const v4, 0xf010

    .line 637
    .local v4, "operatingMode":I
    iget v1, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-nez v1, :cond_4

    .line 638
    const/4 v4, 0x0

    .line 642
    :cond_1
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFovcEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 643
    if-eqz v4, :cond_2

    move v0, v3

    :cond_2
    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mFovcEnabled:Z

    .line 645
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 646
    new-instance v1, Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 647
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mRecorderSurface:Landroid/view/Surface;

    move-object v5, p0

    .line 645
    invoke-virtual/range {v0 .. v5}, Lcom/android/camera2/Camera2Proxy;->startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 651
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 652
    iput-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 653
    return-void

    .line 639
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 640
    const v4, 0x8004

    goto :goto_0
.end method

.method private startRecorder()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1089
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initializeRecorder()Z

    move-result v1

    .line 1090
    .local v1, "success":Z
    if-nez v1, :cond_0

    .line 1091
    return v4

    .line 1095
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2}, Landroid/media/MediaRecorder;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1105
    const/4 v2, 0x1

    return v2

    .line 1096
    :catch_0
    move-exception v0

    .line 1097
    .local v0, "e":Ljava/lang/IllegalStateException;
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "could not start recorder"

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1098
    instance-of v2, v0, Ljava/lang/IllegalStateException;

    if-eqz v2, :cond_1

    .line 1099
    const v2, 0x7f0f0153

    .line 1100
    const v3, 0x7f0f0155

    .line 1099
    invoke-virtual {p0, v2, v3}, Lcom/android/camera/module/VideoModule;->showConfirmMessage(II)V

    .line 1102
    :cond_1
    return v4
.end method

.method private startVideoRecordingIfNeeded()V
    .locals 6

    .prologue
    .line 744
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 745
    return-void

    .line 747
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isOpenOnly()Z

    move-result v1

    if-nez v1, :cond_3

    .line 749
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.CAMERA_OPEN_ONLY"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 750
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    .line 751
    .local v0, "durationTime":I
    const/16 v1, 0x3c

    if-le v0, v1, :cond_1

    .line 752
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Caller delivered a wrong duration time large as 60s!"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    return-void

    .line 756
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    new-instance v3, Lcom/android/camera/module/VideoModule$1;

    invoke-direct {v3, p0}, Lcom/android/camera/module/VideoModule$1;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 761
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    const/16 v1, 0x5dc

    :goto_0
    int-to-long v4, v1

    .line 756
    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 765
    .end local v0    # "durationTime":I
    :goto_1
    return-void

    .line 761
    .restart local v0    # "durationTime":I
    :cond_2
    mul-int/lit16 v1, v0, 0x3e8

    goto :goto_0

    .line 763
    .end local v0    # "durationTime":I
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private stopRecorder()V
    .locals 2

    .prologue
    .line 1184
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    .line 1185
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1187
    new-instance v0, Lcom/android/camera/module/VideoModule$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/VideoModule$2;-><init>(Lcom/android/camera/module/VideoModule;)V

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    .line 1212
    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 1187
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 1213
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    .line 1187
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    .line 1214
    new-instance v1, Lcom/android/camera/module/VideoModule$3;

    invoke-direct {v1, p0}, Lcom/android/camera/module/VideoModule$3;-><init>(Lcom/android/camera/module/VideoModule;)V

    .line 1187
    invoke-virtual {v0, v1}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 1220
    return-void
.end method

.method private updateFpsRange()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 1763
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1764
    return-void

    .line 1766
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1767
    :cond_1
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 1768
    new-instance v4, Landroid/util/Range;

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget v6, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 1767
    invoke-virtual {v3, v4}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    .line 1782
    :goto_0
    return-void

    .line 1770
    :cond_2
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v4}, Lcom/android/camera2/CameraCapabilities;->getSupportedFpsRange()[Landroid/util/Range;

    move-result-object v0

    .line 1771
    .local v0, "availableFpsRange":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    aget-object v1, v0, v3

    .line 1772
    .local v1, "bestRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    array-length v5, v0

    move v4, v3

    :goto_1
    if-ge v4, v5, :cond_5

    aget-object v2, v0, v4

    .line 1773
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

    if-ge v6, v3, :cond_4

    .line 1774
    move-object v1, v2

    .line 1772
    :cond_3
    :goto_2
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_1

    .line 1775
    :cond_4
    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    if-ne v3, v6, :cond_3

    .line 1776
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

    if-ge v6, v3, :cond_3

    .line 1777
    move-object v1, v2

    goto :goto_2

    .line 1780
    .end local v2    # "r":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_5
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setVideoFpsRange(Landroid/util/Range;)V

    goto :goto_0
.end method

.method private updateHfrFPSRange(Landroid/util/Size;I)V
    .locals 7
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "upperFps"    # I

    .prologue
    .line 517
    const/4 v0, 0x0

    .line 518
    .local v0, "candidateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v3, p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object v2

    .line 519
    .local v2, "ranges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    array-length v5, v2

    move v4, v3

    .end local v0    # "candidateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v1, v2, v4

    .line 520
    .local v1, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p2, :cond_1

    .line 521
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v6, v3, :cond_1

    .line 522
    :cond_0
    move-object v0, v1

    .line 519
    :cond_1
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_0

    .line 525
    .end local v1    # "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_2
    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSLower:I

    .line 526
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    .line 527
    return-void
.end method

.method private updateMutexModePreference()V
    .locals 3

    .prologue
    .line 1401
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/VideoModule;->mModuleIndex:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1402
    .local v0, "hdr":Ljava/lang/String;
    const-string/jumbo v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1403
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    .line 1405
    :cond_0
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 14

    .prologue
    .line 1714
    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v10, v10, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    int-to-double v10, v10

    iget-object v12, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v12, v12, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    int-to-double v12, v12

    div-double v8, v10, v12

    .line 1716
    .local v8, "videoAspectRatio":D
    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v11, Landroid/media/MediaRecorder;

    invoke-virtual {v10, v11}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v6

    .line 1718
    .local v6, "supportedVideoSize":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v10, v10, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget-object v11, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v11, v11, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 1717
    invoke-static {v6, v8, v9, v10, v11}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v7

    .line 1719
    .local v7, "videoSize":Lcom/android/camera/CameraSize;
    iput-object v7, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 1720
    sget-object v10, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "videoSize: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v7}, Lcom/android/camera/CameraSize;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1723
    const v1, 0x7fffffff

    .line 1724
    .local v1, "maxWidth":I
    const v0, 0x7fffffff

    .line 1725
    .local v0, "maxHeight":I
    invoke-static {}, Lcom/android/camera/Device;->isVideoSnapshotSizeLimited()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1726
    iget v1, v7, Lcom/android/camera/CameraSize;->width:I

    .line 1727
    iget v0, v7, Lcom/android/camera/CameraSize;->height:I

    .line 1730
    :cond_0
    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v11, 0x100

    invoke-virtual {v10, v11}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v4

    .line 1731
    .local v4, "supportedPictureSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-static {v4, v8, v9, v1, v0}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 1733
    .local v3, "pictureSize":Lcom/android/camera/CameraSize;
    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 1734
    sget-object v10, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "pictureSize: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1738
    iget v10, v7, Lcom/android/camera/CameraSize;->width:I

    sget v11, Lcom/android/camera/Util;->sWindowHeight:I

    if-gt v10, v11, :cond_1

    iget v10, v7, Lcom/android/camera/CameraSize;->width:I

    const/16 v11, 0x2d0

    if-ge v10, v11, :cond_2

    .line 1739
    :cond_1
    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    .line 1740
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    .line 1746
    :goto_0
    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v11, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v10, v11}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v5

    .line 1747
    .local v5, "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-static {v5, v8, v9, v1, v0}, Lcom/android/camera/Util;->getOptimalVideoSnapshotPictureSize(Ljava/util/List;DII)Lcom/android/camera/CameraSize;

    move-result-object v2

    .line 1749
    .local v2, "optimalSize":Lcom/android/camera/CameraSize;
    iput-object v2, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 1750
    sget-object v10, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "previewSize: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1752
    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v10, v10, Lcom/android/camera/CameraSize;->width:I

    iget-object v11, p0, Lcom/android/camera/module/VideoModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v11, v11, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v10, v11}, Lcom/android/camera/module/VideoModule;->updateCameraScreenNailSize(II)V

    .line 1753
    return-void

    .line 1742
    .end local v2    # "optimalSize":Lcom/android/camera/CameraSize;
    .end local v5    # "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    :cond_2
    iget v1, v7, Lcom/android/camera/CameraSize;->width:I

    .line 1743
    iget v0, v7, Lcom/android/camera/CameraSize;->height:I

    goto :goto_0
.end method

.method private updateVideoStabilization()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1366
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1367
    return-void

    .line 1369
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isEisOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1370
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "videoStabilization: EIS"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1371
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1372
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1373
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    .line 1380
    :goto_0
    return-void

    .line 1375
    :cond_1
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "videoStabilization: OIS"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1376
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableEIS(Z)V

    .line 1377
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 1378
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->setVideoStabilizationCropped(Z)V

    goto :goto_0
.end method


# virtual methods
.method public varargs consumePreference([I)V
    .locals 7
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .prologue
    .line 1637
    const/4 v2, 0x0

    array-length v3, p1

    :goto_0
    if-ge v2, v3, :cond_4

    aget v1, p1, v2

    .line 1638
    .local v1, "type":I
    packed-switch v1, :pswitch_data_0

    .line 1703
    :pswitch_0
    sget-boolean v4, Lcom/android/camera/module/VideoModule;->DEBUG:Z

    if-eqz v4, :cond_3

    .line 1704
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "no consumer for this updateType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1640
    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updatePictureAndPreviewSize()V

    .line 1637
    :cond_0
    :goto_1
    :pswitch_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1644
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFocusArea()V

    goto :goto_1

    .line 1648
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFace()V

    goto :goto_1

    .line 1652
    :pswitch_5
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1653
    :cond_1
    const-string/jumbo v0, "0"

    .line 1655
    .local v0, "antiBanding":Ljava/lang/String;
    :goto_2
    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updateAntiBanding(Ljava/lang/String;)V

    goto :goto_1

    .line 1654
    .end local v0    # "antiBanding":Ljava/lang/String;
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "antiBanding":Ljava/lang/String;
    goto :goto_2

    .line 1659
    .end local v0    # "antiBanding":Ljava/lang/String;
    :pswitch_6
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateFlashPreference()V

    goto :goto_1

    .line 1663
    :pswitch_7
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateVideoFocusMode()V

    goto :goto_1

    .line 1667
    :pswitch_8
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateFpsRange()V

    goto :goto_1

    .line 1671
    :pswitch_9
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getZoomValue()F

    move-result v4

    invoke-virtual {p0, v4}, Lcom/android/camera/module/VideoModule;->setZoomRatio(F)V

    goto :goto_1

    .line 1675
    :pswitch_a
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->focusCenter()V

    goto :goto_1

    .line 1679
    :pswitch_b
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateExposureMeteringMode()V

    goto :goto_1

    .line 1683
    :pswitch_c
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateVideoStabilization()V

    goto :goto_1

    .line 1687
    :pswitch_d
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v4, :cond_0

    .line 1688
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v5, p0, Lcom/android/camera/module/VideoModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v4, v5}, Lcom/android/camera2/Camera2Proxy;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    goto :goto_1

    .line 1693
    :pswitch_e
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->setEvValue()V

    goto :goto_1

    .line 1706
    :cond_3
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "no consumer for this updateType: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1711
    .end local v1    # "type":I
    :cond_4
    return-void

    .line 1638
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_2
        :pswitch_e
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_8
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
        :pswitch_d
        :pswitch_2
    .end packed-switch
.end method

.method protected enableFaceDetection()Z
    .locals 4

    .prologue
    .line 1757
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1758
    const-string/jumbo v1, "pref_camera_facedetection_key"

    .line 1759
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0006

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1757
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected fetchProfile(II)Landroid/media/CamcorderProfile;
    .locals 1
    .param p1, "cameraId"    # I
    .param p2, "quality"    # I

    .prologue
    .line 561
    invoke-static {p1, p2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    return-object v0
.end method

.method protected getNormalVideoFrameRate()I
    .locals 1

    .prologue
    .line 1347
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v0, :cond_0

    .line 1348
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameRate:I

    return v0

    .line 1351
    :cond_0
    const/16 v0, 0x1e

    return v0
.end method

.method public getSupportedSettingKeys()Ljava/util/List;
    .locals 2
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
    .line 199
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .local v0, "keys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 201
    const-string/jumbo v1, "pref_video_speed_fast_key"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 203
    const-string/jumbo v1, "pref_video_speed_slow_key"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    :cond_0
    return-object v0
.end method

.method public isNeedMute()Z
    .locals 1

    .prologue
    .line 1452
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->isNeedMute()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    if-nez v0, :cond_0

    .line 1453
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    xor-int/lit8 v0, v0, 0x1

    .line 1452
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 1453
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isShowHFRDuration()Z
    .locals 1

    .prologue
    .line 1343
    const/4 v0, 0x1

    return v0
.end method

.method public onBackPressed()Z
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 262
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCreated()Z

    move-result v2

    if-nez v2, :cond_0

    .line 263
    return v6

    .line 266
    :cond_0
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-eqz v2, :cond_1

    .line 267
    return v7

    .line 270
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    if-eqz v2, :cond_2

    .line 271
    return v6

    .line 274
    :cond_2
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v2, :cond_4

    .line 275
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 276
    .local v0, "now":J
    iget-wide v2, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    .line 277
    iput-wide v0, p0, Lcom/android/camera/module/VideoModule;->mLastBackPressedTime:J

    .line 278
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const v3, 0x7f0f00fe

    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 283
    :goto_0
    return v7

    .line 281
    :cond_3
    invoke-virtual {p0, v7, v6}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    goto :goto_0

    .line 286
    .end local v0    # "now":J
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 287
    return v7

    .line 290
    :cond_5
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onBackPressed()Z

    move-result v2

    return v2
.end method

.method protected onCameraOpened()V
    .locals 2

    .prologue
    .line 231
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    .line 232
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->readVideoPreferences()V

    .line 233
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->initializeFocusManager()V

    .line 234
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->setPreviewFrameLayoutAspectRatio()V

    .line 235
    sget-object v1, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_INIT:[I

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    .line 238
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initializeRecorder()Z

    move-result v0

    .line 239
    .local v0, "success":Z
    if-eqz v0, :cond_2

    .line 240
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 241
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startHighSpeedRecordSession()V

    .line 248
    :goto_0
    return-void

    .line 243
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startRecordSession()V

    goto :goto_0

    .line 246
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewSession()V

    goto :goto_0
.end method

.method public onCreate(II)V
    .locals 2
    .param p1, "moduleIndex"    # I
    .param p2, "cameraId"    # I

    .prologue
    .line 211
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/VideoBase;->onCreate(II)V

    .line 213
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->changeConflictPreference()V

    .line 214
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->setCaptureIntent(Z)V

    .line 215
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 217
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 219
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isQuickCapture()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mQuickCapture:Z

    .line 220
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V

    .line 221
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 222
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const-string/jumbo v1, "phone"

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 224
    const-string/jumbo v0, "continuous-video"

    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mVideoFocusMode:Ljava/lang/String;

    .line 225
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->initRecorderSurface()V

    .line 226
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->onCameraOpened()V

    .line 227
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 618
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onDestroy()V

    .line 619
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseRecorderSurface()V

    .line 620
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 621
    return-void
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 4
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    const/4 v3, 0x1

    .line 988
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "MediaRecorder error. what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " extra="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 989
    if-ne p2, v3, :cond_1

    .line 991
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    .line 992
    const/4 v0, 0x0

    invoke-virtual {p0, v3, v0}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 994
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 996
    :cond_1
    return-void
.end method

.method public onGestureTrack(Landroid/graphics/RectF;Z)Z
    .locals 1
    .param p1, "rectF"    # Landroid/graphics/RectF;
    .param p2, "up"    # Z

    .prologue
    .line 1458
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    if-nez v0, :cond_0

    .line 1459
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isBackCamera()Z

    move-result v0

    .line 1458
    if-eqz v0, :cond_0

    .line 1459
    invoke-static {}, Lcom/android/camera/Device;->isSupportedObjectTrack()Z

    move-result v0

    .line 1458
    if-eqz v0, :cond_0

    .line 1460
    iget v0, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1458
    if-eqz v0, :cond_0

    .line 1461
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 1458
    if-eqz v0, :cond_0

    .line 1462
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->initializeObjectTrack(Landroid/graphics/RectF;Z)Z

    move-result v0

    return v0

    .line 1464
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 8
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 1000
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v3, :cond_0

    .line 1001
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onInfo: ignore event "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1002
    return-void

    .line 1004
    :cond_0
    const/16 v3, 0x320

    if-ne p2, v3, :cond_2

    .line 1005
    invoke-virtual {p0, v6, v7}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1034
    :cond_1
    :goto_0
    return-void

    .line 1006
    :cond_2
    const/16 v3, 0x321

    if-ne p2, v3, :cond_3

    .line 1007
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "reached max size. fileNumber="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1008
    invoke-virtual {p0, v6, v7}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1009
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ui/ScreenHint;->isScreenHintVisible()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1010
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    const v4, 0x7f0f00bc

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1013
    :cond_3
    const/16 v3, 0x322

    if-ne p2, v3, :cond_4

    .line 1014
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSplitWhenReachMaxSize()Z

    move-result v2

    .line 1015
    .local v2, "split":Z
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "max file size is approaching. split: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1016
    if-eqz v2, :cond_1

    .line 1017
    iget v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    .line 1018
    iget v3, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/module/VideoModule;->genContentValues(II)Landroid/content/ContentValues;

    move-result-object v1

    .line 1019
    .local v1, "nextVideoValues":Landroid/content/ContentValues;
    const-string/jumbo v3, "_data"

    invoke-virtual {v1, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1020
    .local v0, "nextVideoPath":Ljava/lang/String;
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "nextVideoPath: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1021
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-static {v3, v0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setNextOutputFile(Landroid/media/MediaRecorder;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1022
    iput-object v1, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    .line 1023
    iput-object v0, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    goto/16 :goto_0

    .line 1026
    .end local v0    # "nextVideoPath":Ljava/lang/String;
    .end local v1    # "nextVideoValues":Landroid/content/ContentValues;
    .end local v2    # "split":Z
    :cond_4
    const/16 v3, 0x323

    if-ne p2, v3, :cond_1

    .line 1027
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "next output file started"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1028
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onMaxFileSizeReached()V

    .line 1029
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoValues:Landroid/content/ContentValues;

    .line 1030
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    .line 1031
    iput-object v5, p0, Lcom/android/camera/module/VideoModule;->mNextVideoValues:Landroid/content/ContentValues;

    .line 1032
    iput-object v5, p0, Lcom/android/camera/module/VideoModule;->mNextVideoFileName:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method public onObjectStable()V
    .locals 0

    .prologue
    .line 1540
    return-void
.end method

.method public onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 579
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onPause()V

    .line 581
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mFovcEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 582
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->notifyVideoStreamEnd()V

    .line 584
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->waitStereoSwitchThread()V

    .line 585
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->unregisterReceiver()V

    .line 586
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 587
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseResources()V

    .line 589
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->updateStereoSettings(Z)V

    .line 597
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->closeVideoFileDescriptor()V

    .line 599
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 600
    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->stopFaceDetection(Z)V

    .line 601
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->resetScreenOn()V

    .line 603
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 604
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 606
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/ui/PopupManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/ui/PopupManager;

    move-result-object v0

    invoke-virtual {v0, v1, v3}, Lcom/android/camera/ui/PopupManager;->notifyShowPopup(Landroid/view/View;I)V

    .line 608
    :cond_1
    return-void
.end method

.method public onPauseButtonClick()V
    .locals 8

    .prologue
    .line 1571
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "onPauseButtonClick: isRecordingPaused="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1572
    const-string/jumbo v6, " isRecording="

    .line 1571
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1572
    iget-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 1571
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1573
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1574
    .local v2, "now":J
    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-eqz v4, :cond_0

    iget-wide v4, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x1f4

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 1575
    :cond_0
    return-void

    .line 1577
    :cond_1
    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mPauseClickTime:J

    .line 1579
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 1580
    const/16 v5, 0xa2

    .line 1579
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1581
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    if-eqz v4, :cond_3

    .line 1583
    :try_start_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x18

    if-lt v4, v5, :cond_2

    .line 1584
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-static {v4}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->resumeMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 1588
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    .line 1589
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    .line 1590
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    .line 1591
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v5, 0x2a

    invoke-virtual {v4, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 1592
    const-string/jumbo v4, ""

    iput-object v4, p0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    .line 1593
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->updateRecordingTime()V

    .line 1594
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingResume()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1605
    :goto_1
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "onPauseButtonClick"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1606
    return-void

    .line 1586
    :cond_2
    :try_start_1
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v4}, Landroid/media/MediaRecorder;->start()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1595
    :catch_0
    move-exception v1

    .line 1596
    .local v1, "e":Ljava/lang/IllegalStateException;
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "failed to resume media recorder"

    invoke-static {v4, v5, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1597
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->releaseMediaRecorder()V

    .line 1598
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFinish()V

    goto :goto_1

    .line 1601
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->pauseVideoRecording()V

    .line 1602
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v4

    invoke-static {v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackPauseVideoRecording(Z)V

    .line 1603
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingPause()V

    goto :goto_1
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 186
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

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

    .line 187
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 188
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraScreenNail;->setRenderArea(Landroid/graphics/Rect;)V

    .line 190
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 191
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    .line 192
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 190
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 193
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 195
    :cond_0
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 1802
    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 1803
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1804
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    const/4 v3, 0x1

    .line 1786
    invoke-super {p0, p1}, Lcom/android/camera/module/VideoBase;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 1788
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1789
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onPreviewSessionSuccess: module is not ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1790
    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1791
    return-void

    .line 1794
    :cond_0
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onPreviewSessionSuccess: session="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1795
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mFaceDetectionEnabled:Z

    .line 1796
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/VideoModule;->updatePreferenceInWorkThread([I)V

    .line 1797
    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1798
    return-void
.end method

.method protected onPreviewStart()V
    .locals 5
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    .prologue
    const/16 v4, 0x16

    const/4 v1, 0x1

    .line 727
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    if-eqz v0, :cond_0

    .line 728
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, p0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 729
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->updateMutexModePreference()V

    .line 730
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 731
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 733
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 734
    const/4 v0, 0x3

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/module/VideoModule;->onShutterButtonFocus(ZI)V

    .line 735
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startVideoRecordingIfNeeded()V

    .line 737
    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 380
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-eqz v2, :cond_0

    .line 381
    return-void

    .line 384
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v2, :cond_1

    .line 385
    return-void

    .line 388
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v1, v2, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 389
    .local v1, "lastWidth":I
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v0, v2, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 390
    .local v0, "lastHeight":I
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->readVideoPreferences()V

    .line 391
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    if-ne v2, v1, :cond_2

    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v2, v2, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    if-eq v2, v0, :cond_3

    .line 392
    :cond_2
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v4, "profile size changed [%d %d]->[%d %d]"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    .line 393
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v6, v6, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x2

    aput-object v6, v5, v7

    iget-object v6, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v6, v6, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x3

    aput-object v6, v5, v7

    .line 392
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    new-array v2, v8, [I

    aput v8, v2, v9

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    .line 396
    :cond_3
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 8
    .param p1, "mode"    # I

    .prologue
    const/16 v7, 0xa2

    const/4 v6, 0x0

    .line 317
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onShutterButtonClick isRecording="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 318
    iget-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 317
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 319
    const-string/jumbo v5, " inStartingFocusRecording="

    .line 317
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 319
    iget-boolean v5, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    .line 317
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iput-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    .line 321
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isIgnoreTouchEvent()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 322
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "onShutterButtonClick: ignore touch event"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    return-void

    .line 326
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 327
    .local v1, "stop":Z
    if-eqz v1, :cond_1

    .line 329
    const/4 v2, 0x1

    .line 330
    .local v2, "stopRecorder":Z
    invoke-virtual {p0, v2, v6}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 362
    .end local v2    # "stopRecorder":Z
    :goto_0
    return-void

    .line 332
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkCallingState()Z

    move-result v3

    if-nez v3, :cond_2

    .line 334
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 336
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 337
    return-void

    .line 340
    .end local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_2
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 341
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 343
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 345
    .restart local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 346
    return-void

    .line 349
    .end local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/camera/module/VideoModule;->setTriggerMode(I)V

    .line 350
    invoke-virtual {p0, v6}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 352
    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoModule;->playCameraSound(I)V

    .line 353
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 354
    const/16 v4, 0xac

    .line 353
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    iput-object v3, p0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 355
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->canRecord()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 356
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->startVideoRecording()V

    goto :goto_0

    .line 358
    :cond_4
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "wait for autoFocus"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mInStartingFocusRecording:Z

    goto :goto_0
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0
    .param p1, "pressed"    # Z
    .param p2, "from"    # I

    .prologue
    .line 312
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 5
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 1410
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    if-nez v2, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/VideoModule;->isInTapableRect(II)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    .line 1411
    :cond_0
    return-void

    .line 1414
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isSessionReady()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1415
    sget-object v2, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "onSingleTapUp: null session"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1416
    return-void

    .line 1419
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrameAvailable()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1420
    return-void

    .line 1425
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1426
    const/16 v3, 0xab

    .line 1425
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1427
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1428
    return-void

    .line 1435
    :cond_4
    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    if-eqz v2, :cond_5

    .line 1436
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 1438
    :cond_5
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1439
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/VideoModule;->mTouchFocusStartingTime:J

    .line 1440
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 1441
    .local v1, "point":Landroid/graphics/Point;
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 1442
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v3, v1, Landroid/graphics/Point;->x:I

    iget v4, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 1443
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 612
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->onStop()V

    .line 613
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 614
    return-void
.end method

.method public onVideoRecordStopped()V
    .locals 3

    .prologue
    .line 1808
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onVideoRecordStopped: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1809
    iget-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    if-eqz v0, :cond_0

    .line 1810
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    .line 1811
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    .line 1813
    :cond_0
    return-void
.end method

.method protected onWaitStopCallbackTimeout()V
    .locals 0

    .prologue
    .line 1179
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    .line 1180
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    .line 1181
    return-void
.end method

.method protected pauseMediaRecorder(Landroid/media/MediaRecorder;)V
    .locals 0
    .param p1, "mediaRecorder"    # Landroid/media/MediaRecorder;

    .prologue
    .line 1625
    invoke-static {p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->pauseMediaRecorder(Landroid/media/MediaRecorder;)V

    .line 1626
    return-void
.end method

.method public pausePreview()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 702
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    iput-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 704
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->currentIsMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 705
    invoke-virtual {p0, v2}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 707
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 708
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 710
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    .line 711
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 713
    :cond_2
    return-void
.end method

.method protected readVideoPreferences()V
    .locals 15

    .prologue
    .line 402
    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoQuality()I

    move-result v5

    .line 406
    .local v5, "quality":I
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/CameraIntentManager;->getVideoQuality()I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v9

    if-lez v9, :cond_4

    .line 407
    const/4 v5, 0x1

    .line 415
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 416
    .local v0, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    .line 418
    const/4 v9, 0x0

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 419
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    .line 421
    const-string/jumbo v9, "fast"

    iget-object v10, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 423
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v9

    .line 424
    const-string/jumbo v10, "pref_video_time_lapse_frame_interval_key"

    .line 425
    const v11, 0x7f0f002b

    invoke-virtual {p0, v11}, Lcom/android/camera/module/VideoModule;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 423
    invoke-virtual {v9, v10, v11}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 426
    .local v3, "frameIntervalStr":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    .line 427
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    if-eqz v9, :cond_5

    const/4 v9, 0x1

    :goto_1
    iput-boolean v9, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    .line 429
    iget-boolean v9, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    if-eqz v9, :cond_1

    .line 430
    add-int/lit16 v5, v5, 0x3e8

    .line 431
    const/16 v9, 0x3e8

    if-lt v5, v9, :cond_0

    .line 432
    const/16 v9, 0x3f0

    if-le v5, v9, :cond_1

    .line 433
    :cond_0
    add-int/lit16 v5, v5, -0x3e8

    .line 434
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    .line 435
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->forceToNormalMode()V

    .line 436
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v9}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v9

    iget v10, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    const v11, 0x7f0f00ff

    invoke-virtual {v9, v11, v10}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    .line 439
    :cond_1
    rem-int/lit16 v9, v5, 0x3e8

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 478
    .end local v3    # "frameIntervalStr":Ljava/lang/String;
    :goto_2
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->quality:I

    rem-int/lit16 v9, v9, 0x3e8

    iget v10, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    if-eq v9, v10, :cond_2

    .line 479
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/android/camera/module/VideoModule;->stopObjectTracking(Z)V

    .line 481
    :cond_2
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    invoke-virtual {p0, v9, v5}, Lcom/android/camera/module/VideoModule;->fetchProfile(II)Landroid/media/CamcorderProfile;

    move-result-object v9

    iput-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    .line 482
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoEncoder()I

    move-result v10

    iput v10, v9, Landroid/media/CamcorderProfile;->videoCodec:I

    .line 483
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v9, v9, Landroid/media/CamcorderProfile;->fileFormat:I

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mOutputFormat:I

    .line 484
    sget-object v9, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v11, "frameRate=%d profileSize=%dx%d codec=%d"

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Object;

    .line 485
    iget-object v13, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v13, v13, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x0

    aput-object v13, v12, v14

    iget-object v13, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v13, v13, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x1

    aput-object v13, v12, v14

    .line 486
    iget-object v13, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v13, v13, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x2

    aput-object v13, v12, v14

    iget-object v13, p0, Lcom/android/camera/module/VideoModule;->mProfile:Landroid/media/CamcorderProfile;

    iget v13, v13, Landroid/media/CamcorderProfile;->videoCodec:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x3

    aput-object v13, v12, v14

    .line 484
    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    :try_start_1
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v9}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/CameraIntentManager;->getVideoDurationTime()I

    move-result v9

    mul-int/lit16 v9, v9, 0x3e8

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 501
    :goto_3
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    if-eqz v9, :cond_3

    .line 502
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    const/16 v10, 0x3e8

    if-ge v9, v10, :cond_3

    .line 503
    const/16 v9, 0x3e8

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    .line 505
    :cond_3
    return-void

    .line 409
    .end local v0    # "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    :cond_4
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 427
    .restart local v0    # "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    .restart local v3    # "frameIntervalStr":Ljava/lang/String;
    :cond_5
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 440
    .end local v3    # "frameIntervalStr":Ljava/lang/String;
    :cond_6
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v9

    if-nez v9, :cond_7

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v9

    if-eqz v9, :cond_d

    .line 441
    :cond_7
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->getHfrSetting()Ljava/lang/String;

    move-result-object v4

    .line 442
    .local v4, "hfrSetting":Ljava/lang/String;
    const-string/jumbo v9, ":"

    invoke-virtual {v4, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 443
    .local v7, "splitValues":[Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 444
    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-direct {p0, v9}, Lcom/android/camera/module/VideoModule;->convertSizeToQuality(Ljava/lang/String;)I

    move-result v9

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 450
    :goto_4
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    const/4 v10, -0x1

    if-ne v9, v10, :cond_9

    .line 451
    sget-object v9, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "invalid hfr setting: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->forceToNormalMode()V

    .line 453
    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto/16 :goto_2

    .line 446
    :cond_8
    const/4 v9, 0x6

    invoke-static {v5, v9}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 447
    const/4 v9, 0x5

    invoke-static {v5, v9}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 448
    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto :goto_4

    .line 455
    :cond_9
    iget v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    .line 456
    const/4 v6, 0x0

    .line 457
    .local v6, "size":Landroid/util/Size;
    const/4 v9, 0x6

    if-ne v9, v5, :cond_b

    .line 458
    new-instance v6, Landroid/util/Size;

    .end local v6    # "size":Landroid/util/Size;
    const/16 v9, 0x780

    const/16 v10, 0x438

    invoke-direct {v6, v9, v10}, Landroid/util/Size;-><init>(II)V

    .line 463
    .local v6, "size":Landroid/util/Size;
    :goto_5
    const/4 v9, 0x1

    aget-object v9, v7, v9

    const/16 v10, 0x78

    invoke-static {v9, v10}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v8

    .line 464
    .local v8, "upperFps":I
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 465
    iget-object v9, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v9, v6}, Lcom/android/camera2/CameraCapabilities;->getSupportedHFRVideoFPSList(Landroid/util/Size;)Ljava/util/List;

    move-result-object v2

    .line 466
    .local v2, "fpsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/16 v9, 0x78

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 467
    const/16 v8, 0x78

    .line 472
    .end local v2    # "fpsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_a
    :goto_6
    invoke-direct {p0, v6, v8}, Lcom/android/camera/module/VideoModule;->updateHfrFPSRange(Landroid/util/Size;I)V

    goto/16 :goto_2

    .line 460
    .end local v8    # "upperFps":I
    .local v6, "size":Landroid/util/Size;
    :cond_b
    new-instance v6, Landroid/util/Size;

    .end local v6    # "size":Landroid/util/Size;
    const/16 v9, 0x500

    const/16 v10, 0x2d0

    invoke-direct {v6, v9, v10}, Landroid/util/Size;-><init>(II)V

    .local v6, "size":Landroid/util/Size;
    goto :goto_5

    .line 469
    .restart local v2    # "fpsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v8    # "upperFps":I
    :cond_c
    const/4 v9, 0x0

    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    goto :goto_6

    .line 475
    .end local v2    # "fpsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v4    # "hfrSetting":Ljava/lang/String;
    .end local v6    # "size":Landroid/util/Size;
    .end local v7    # "splitValues":[Ljava/lang/String;
    .end local v8    # "upperFps":I
    :cond_d
    iput v5, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    goto/16 :goto_2

    .line 492
    :catch_0
    move-exception v1

    .line 493
    .local v1, "e":Ljava/lang/RuntimeException;
    iget v9, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    invoke-static {v9}, Lcom/android/camera/CameraSettings;->is4KHigherVideoQuality(I)Z

    move-result v9

    if-eqz v9, :cond_e

    iget-boolean v9, p0, Lcom/android/camera/module/VideoModule;->mCaptureTimeLapse:Z

    xor-int/lit8 v9, v9, 0x1

    if-eqz v9, :cond_e

    .line 494
    const v9, 0x75300

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    goto/16 :goto_3

    .line 496
    :cond_e
    const/4 v9, 0x0

    iput v9, p0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    goto/16 :goto_3

    .line 411
    .end local v0    # "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v1

    .restart local v1    # "e":Ljava/lang/RuntimeException;
    goto/16 :goto_0
.end method

.method public registerProtocol()V
    .locals 5

    .prologue
    .line 166
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->registerProtocol()V

    .line 167
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 168
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 169
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 171
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/16 v3, 0xa4

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 172
    return-void
.end method

.method protected resizeForPreviewAspectRatio()V
    .locals 5

    .prologue
    .line 566
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 569
    .local v0, "degrees":I
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v1

    .line 570
    .local v1, "sensorOrientation":I
    sub-int v2, v1, v0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_0

    .line 571
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->width:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    .line 575
    :goto_0
    return-void

    .line 573
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/VideoModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-interface {v2, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    goto :goto_0
.end method

.method public resumePreview()V
    .locals 2

    .prologue
    .line 717
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 718
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 719
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 720
    iget-object v0, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 722
    :cond_0
    return-void
.end method

.method public startObjectTracking()V
    .locals 3

    .prologue
    .line 1518
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "startObjectTracking: started="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1531
    return-void
.end method

.method public startPreview()V
    .locals 3

    .prologue
    .line 693
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "startPreview: previewing="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 694
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->checkDisplayOrientation()V

    .line 697
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoModule;->mPreviewing:Z

    .line 698
    return-void
.end method

.method protected startVideoRecording()V
    .locals 4

    .prologue
    .line 1061
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startVideoRecording: mode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1062
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1063
    return-void

    .line 1065
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v2

    invoke-static {v1, v2}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStartVideoRecordStart(Ljava/lang/String;Z)V

    .line 1066
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isCaptureIntent()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, -0x1

    :goto_0
    iput v1, p0, Lcom/android/camera/module/VideoModule;->mCurrentFileNumber:I

    .line 1067
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->silenceSounds()V

    .line 1068
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startRecorder()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1069
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onStartRecorderFail()V

    .line 1070
    return-void

    .line 1066
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 1073
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1074
    const/16 v2, 0xa2

    .line 1073
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1075
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingStart()V

    .line 1077
    sget-object v1, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_RECORD:[I

    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoModule;->updatePreferenceTrampoline([I)V

    .line 1078
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1079
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->startHighSpeedRecording()V

    .line 1083
    :goto_1
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "startVideoRecording process done"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1084
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStartVideoRecordEnd()V

    .line 1085
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->onStartRecorderSucceed()V

    .line 1086
    return-void

    .line 1081
    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->startRecording()V

    goto :goto_1
.end method

.method public stopObjectTracking(Z)V
    .locals 3
    .param p1, "restartFD"    # Z

    .prologue
    .line 1544
    sget-object v0, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "stopObjectTracking: started="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/VideoModule;->mObjectTrackingStarted:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1565
    return-void
.end method

.method public stopVideoRecording(ZZ)V
    .locals 8
    .param p1, "stopRecorder"    # Z
    .param p2, "fromRelease"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v7, 0x0

    .line 1143
    sget-object v4, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "stopVideoRecording>>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1144
    iget-boolean v4, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    if-nez v4, :cond_0

    .line 1145
    return-void

    .line 1148
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1149
    .local v2, "start":J
    iput-boolean v7, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    .line 1150
    invoke-virtual {p0, v7}, Lcom/android/camera/module/VideoModule;->enableCameraControls(Z)V

    .line 1151
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v4, :cond_1

    .line 1152
    iget-object v4, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz p1, :cond_3

    :goto_0
    invoke-virtual {v4, v1}, Lcom/android/camera2/Camera2Proxy;->stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V

    .line 1155
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1156
    const/16 v4, 0xa2

    .line 1155
    invoke-virtual {v1, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1157
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFinish()V

    .line 1160
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1161
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mQuality:I

    iget v5, p0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    iget-wide v6, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    invoke-static {v1, v4, v5, v6, v7}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoModeRecorded(Ljava/lang/String;IIJ)V

    .line 1163
    :cond_2
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 1165
    if-eqz p1, :cond_4

    .line 1166
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->stopRecorder()V

    .line 1167
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->startPreviewAfterRecord()V

    .line 1173
    :goto_1
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    .line 1174
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "stopVideoRecording<<time="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1175
    return-void

    .end local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_3
    move-object v1, p0

    .line 1152
    goto :goto_0

    .line 1169
    .restart local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_4
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/VideoModule;->mPendingStopRecorder:Z

    .line 1171
    iget-object v1, p0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x2e

    const-wide/16 v6, 0x12c

    invoke-virtual {v1, v4, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1
.end method

.method public takeVideoSnapShoot()Z
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1474
    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1

    .line 1475
    :cond_0
    return v5

    .line 1478
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isDeviceAlive()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1479
    return v5

    .line 1483
    :cond_2
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1484
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "capture: low storage"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1486
    const/4 v2, 0x1

    .line 1487
    .local v2, "stopRecorder":Z
    invoke-virtual {p0, v2, v5}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1488
    return v5

    .line 1491
    .end local v2    # "stopRecorder":Z
    :cond_3
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/storage/ImageSaver;->shouldStopShot()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1492
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "capture: ImageSaver is full"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1493
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v3}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v3

    const v4, 0x7f0f018b

    invoke-virtual {v3, v4, v5}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    .line 1494
    return v5

    .line 1498
    :cond_4
    iget v3, p0, Lcom/android/camera/module/VideoModule;->mBogusCameraId:I

    iget v4, p0, Lcom/android/camera/module/VideoModule;->mOrientation:I

    invoke-static {v3, v4}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v0

    .line 1499
    .local v0, "jpegRotation":I
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegRotation(I)V

    .line 1500
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v1

    .line 1501
    .local v1, "loc":Landroid/location/Location;
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    .line 1502
    invoke-direct {p0}, Lcom/android/camera/module/VideoModule;->setJpegQuality()V

    .line 1503
    invoke-static {}, Lcom/android/camera/Device;->isMDPRender()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1508
    :goto_0
    sget-object v3, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "capture: start"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1509
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v4, Lcom/android/camera/module/VideoModule$JpegPictureCallback;

    invoke-direct {v4, p0, v1}, Lcom/android/camera/module/VideoModule$JpegPictureCallback;-><init>(Lcom/android/camera/module/VideoModule;Landroid/location/Location;)V

    invoke-virtual {v3, v4}, Lcom/android/camera2/Camera2Proxy;->captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 1510
    iput-boolean v6, p0, Lcom/android/camera/module/VideoModule;->mSnapshotInProgress:Z

    .line 1511
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v3

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackVideoSnapshot(Z)V

    .line 1512
    return v6

    .line 1506
    :cond_5
    iget-object v3, p0, Lcom/android/camera/module/VideoModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getCameraRotation()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/camera/CameraScreenNail;->animateCapture(I)V

    goto :goto_0
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 176
    invoke-super {p0}, Lcom/android/camera/module/VideoBase;->unRegisterProtocol()V

    .line 177
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 178
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 179
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 181
    invoke-virtual {p0}, Lcom/android/camera/module/VideoModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 182
    return-void
.end method

.method protected updateRecordingTime()V
    .locals 22

    .prologue
    .line 1278
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecording:Z

    move/from16 v18, v0

    if-nez v18, :cond_0

    .line 1279
    return-void

    .line 1281
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    .line 1282
    .local v12, "now":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/camera/module/VideoModule;->mRecordingStartTime:J

    move-wide/from16 v18, v0

    sub-long v8, v12, v18

    .line 1283
    .local v8, "delta":J
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    move/from16 v18, v0

    if-eqz v18, :cond_1

    .line 1284
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/android/camera/module/VideoModule;->mVideoRecordedDuration:J

    .line 1289
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    move/from16 v18, v0

    if-eqz v18, :cond_8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    move/from16 v18, v0

    const v19, 0xea60

    sub-int v18, v18, v19

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    cmp-long v18, v8, v18

    if-ltz v18, :cond_8

    const/4 v6, 0x1

    .line 1290
    .local v6, "countdownRemainingTime":Z
    :goto_0
    move-wide v10, v8

    .line 1291
    .local v10, "deltaAdjusted":J
    if-eqz v6, :cond_2

    .line 1292
    const-wide/16 v18, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/VideoModule;->mMaxVideoDurationInMs:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    sub-long v20, v20, v10

    invoke-static/range {v18 .. v21}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v18

    const-wide/16 v20, 0x3e7

    add-long v10, v18, v20

    .line 1295
    :cond_2
    const-wide/16 v14, 0x3e8

    .line 1296
    .local v14, "targetNextUpdateDelay":J
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isNormalMode()Z

    move-result v18

    if-nez v18, :cond_3

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isHFRMode()Z

    move-result v18

    if-eqz v18, :cond_9

    .line 1297
    :cond_3
    const-wide/16 v18, 0x3e8

    div-long v18, v10, v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/camera/module/VideoModule;->mVideoRecordTime:J

    .line 1298
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-static {v10, v11, v0}, Lcom/android/camera/module/VideoModule;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v7

    .line 1324
    .local v7, "text":Ljava/lang/String;
    :cond_4
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    move-object/from16 v18, v0

    if-eqz v18, :cond_5

    .line 1325
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/VideoModule;->mTopAlert:Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v7}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 1327
    :cond_5
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    .line 1329
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/module/VideoModule;->mRecordingTimeCountsDown:Z

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v0, v6, :cond_6

    .line 1332
    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/android/camera/module/VideoModule;->mRecordingTimeCountsDown:Z

    .line 1335
    :cond_6
    const-wide/16 v4, 0x1f4

    .line 1336
    .local v4, "actualNextUpdateDelay":J
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/module/VideoModule;->mMediaRecorderRecordingPaused:Z

    move/from16 v18, v0

    if-nez v18, :cond_7

    .line 1337
    rem-long v18, v8, v14

    sub-long v4, v14, v18

    .line 1339
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/VideoModule;->mHandler:Landroid/os/Handler;

    move-object/from16 v18, v0

    const/16 v19, 0x2a

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v0, v1, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1340
    return-void

    .line 1289
    .end local v4    # "actualNextUpdateDelay":J
    .end local v6    # "countdownRemainingTime":Z
    .end local v7    # "text":Ljava/lang/String;
    .end local v10    # "deltaAdjusted":J
    .end local v14    # "targetNextUpdateDelay":J
    :cond_8
    const/4 v6, 0x0

    .restart local v6    # "countdownRemainingTime":Z
    goto :goto_0

    .line 1300
    .restart local v10    # "deltaAdjusted":J
    .restart local v14    # "targetNextUpdateDelay":J
    :cond_9
    const-wide/16 v16, 0x0

    .line 1301
    .local v16, "timeBetweenFrameMs":D
    const-string/jumbo v18, "fast"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b

    .line 1302
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/VideoModule;->mTimeBetweenTimeLapseFrameCaptureMs:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v16, v0

    .line 1303
    move-wide/from16 v0, v16

    double-to-long v14, v0

    .line 1311
    :cond_a
    :goto_2
    const-wide/16 v18, 0x0

    cmpl-double v18, v16, v18

    if-eqz v18, :cond_c

    .line 1313
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    invoke-direct {v0, v8, v9, v1, v2}, Lcom/android/camera/module/VideoModule;->getSpeedRecordVideoLength(JD)J

    move-result-wide v18

    .line 1314
    const-string/jumbo v20, "fast"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/VideoModule;->mSpeed:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    .line 1312
    invoke-static/range {v18 .. v20}, Lcom/android/camera/module/VideoModule;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v7

    .line 1316
    .restart local v7    # "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/VideoModule;->mRecordingTime:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 1317
    move-wide/from16 v0, v16

    double-to-long v14, v0

    goto/16 :goto_1

    .line 1304
    .end local v7    # "text":Ljava/lang/String;
    :cond_b
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isSlowMode()Z

    move-result v18

    if-eqz v18, :cond_a

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/VideoModule;->isShowHFRDuration()Z

    move-result v18

    if-eqz v18, :cond_a

    .line 1305
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0x408f400000000000L    # 1000.0

    div-double v16, v20, v18

    .line 1306
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/module/VideoModule;->mHfrFPSUpper:I

    move/from16 v18, v0

    const/16 v19, 0x7530

    div-int v18, v19, v18

    move/from16 v0, v18

    int-to-long v14, v0

    goto :goto_2

    .line 1320
    :cond_c
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-static {v10, v11, v0}, Lcom/android/camera/module/VideoModule;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "text":Ljava/lang/String;
    goto/16 :goto_1
.end method
