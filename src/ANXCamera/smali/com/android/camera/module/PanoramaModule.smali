.class public Lcom/android/camera/module/PanoramaModule;
.super Lcom/android/camera/module/BaseModule;
.source "PanoramaModule.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PictureCallback;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/PanoramaModule$CaptureInfo;,
        Lcom/android/camera/module/PanoramaModule$MainHandler;,
        Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;,
        Lcom/android/camera/module/PanoramaModule$StillImageData;,
        Lcom/android/camera/module/PanoramaModule$StillProcTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sSaveOutputType:I


# instance fields
.field private final DUMP_JPEG:Z

.field private MAX_DST_IMG_WIDTH:I

.field private final USE_MULTI_THREAD:Z

.field private mAppDeviceRotation:I

.field private mAppPanoramaDirection:I

.field private mAppPanoramaDirectionSettings:I

.field private mAttachPosOffsetX:I

.field private mAttachPosOffsetY:I

.field private mCaptureInfoList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/module/PanoramaModule$CaptureInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureOrientationDecided:Z

.field private mCntProcessed:I

.field private mCntReqShoot:I

.field private mDeviceOrientationAtCapture:I

.field private mDirection:[I

.field private mDispPreviewImage:Landroid/graphics/Bitmap;

.field private mFrameRatio:F

.field private mImageID:[I

.field private final mImageSyncObj:Ljava/lang/Object;

.field private mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

.field private mIsShooting:Z

.field private mLocation:Landroid/location/Location;

.field protected final mMainHandler:Landroid/os/Handler;

.field private mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

.field private mMotionData:[B

.field private mMotionlessThreshold:I

.field private mMoveSpeed:[I

.field private mPanoramaShootingStartTime:J

.field private mPreViewScaleHeight:I

.field private mPrevDirection:I

.field private mPreviewCount:I

.field private mPreviewCroppingAdjustByAuto:I

.field private final mPreviewCroppingRatio:I

.field private mPreviewDisplayRatio:F

.field private mPreviewImage:Landroid/graphics/Bitmap;

.field private mPreviewRefY:I

.field private mPreviewSkipCount:I

.field private mRequestTakePicture:Z

.field private mSaveOutputImageTask:Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;

.field private mSnapshotFocusMode:I

.field private mStatus:[I

.field private mStillProcList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/module/PanoramaModule$StillImageData;",
            ">;"
        }
    .end annotation
.end field

.field private mStillProcTask:Lcom/android/camera/module/PanoramaModule$StillProcTask;

.field private final mSyncObj:Ljava/lang/Object;

.field private mTargetFocusMode:I

.field private mTimeTaken:J

.field private mUseImage:I

.field private mUseSensorAWF:Z

.field private mUseSensorThreshold:I

.field private mUseThreshold:I

.field private mWaitProcessorTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/module/PanoramaModule;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mImageSyncObj:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/module/PanoramaModule;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/module/PanoramaModule;)Lcom/android/camera/panorama/MorphoPanoramaGP;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/module/PanoramaModule;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/module/PanoramaModule;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/camera/module/PanoramaModule;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mTargetFocusMode:I

    return v0
.end method

.method static synthetic -get8(Lcom/android/camera/module/PanoramaModule;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    iget-wide v0, p0, Lcom/android/camera/module/PanoramaModule;->mTimeTaken:J

    return-wide v0
.end method

.method static synthetic -get9()I
    .locals 1

    sget v0, Lcom/android/camera/module/PanoramaModule;->sSaveOutputType:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/module/PanoramaModule;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/module/PanoramaModule;Lcom/android/camera/panorama/MorphoPanoramaGP;)Lcom/android/camera/panorama/MorphoPanoramaGP;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;
    .param p1, "-value"    # Lcom/android/camera/panorama/MorphoPanoramaGP;

    .prologue
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    return-object p1
.end method

.method static synthetic -set2(Lcom/android/camera/module/PanoramaModule;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/module/PanoramaModule;->mRequestTakePicture:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/module/PanoramaModule;JI)Ljava/lang/String;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;
    .param p1, "dateTaken"    # J
    .param p3, "type"    # I

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/PanoramaModule;->createNameString(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->addProcessedCount()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->addRequestCount()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->finishAttachStillImageTask()V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->initPreviewLayout()V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->resetToPreview()V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->resetUI()V

    return-void
.end method

.method static synthetic -wrap7(Lcom/android/camera/module/PanoramaModule;Ljava/lang/String;Landroid/graphics/Rect;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "rect"    # Landroid/graphics/Rect;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/PanoramaModule;->saveOutputJpeg(Ljava/lang/String;Landroid/graphics/Rect;)V

    return-void
.end method

.method static synthetic -wrap8(Lcom/android/camera/module/PanoramaModule;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/PanoramaModule;
    .param p1, "save_image"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 97
    const-class v0, Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    .line 117
    const/4 v0, 0x1

    sput v0, Lcom/android/camera/module/PanoramaModule;->sSaveOutputType:I

    .line 92
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0xa

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 122
    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    .line 123
    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureOrientationDecided:Z

    .line 125
    new-instance v0, Lcom/android/camera/module/PanoramaModule$MainHandler;

    invoke-direct {v0, p0, v4}, Lcom/android/camera/module/PanoramaModule$MainHandler;-><init>(Lcom/android/camera/module/PanoramaModule;Lcom/android/camera/module/PanoramaModule$MainHandler;)V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    .line 129
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->mTargetFocusMode:I

    .line 130
    iput v2, p0, Lcom/android/camera/module/PanoramaModule;->mSnapshotFocusMode:I

    .line 139
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    .line 140
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mImageSyncObj:Ljava/lang/Object;

    .line 147
    iput-boolean v2, p0, Lcom/android/camera/module/PanoramaModule;->USE_MULTI_THREAD:Z

    .line 148
    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->DUMP_JPEG:Z

    .line 156
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mImageID:[I

    .line 157
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMotionData:[B

    .line 158
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    .line 159
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMoveSpeed:[I

    .line 160
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureInfoList:Ljava/util/ArrayList;

    .line 162
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    .line 163
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    .line 164
    iput-object v4, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcTask:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    .line 167
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mUseImage:I

    .line 168
    iput v3, p0, Lcom/android/camera/module/PanoramaModule;->mUseThreshold:I

    .line 169
    const/16 v0, 0x7530

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    .line 170
    const v0, 0x8000

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->mMotionlessThreshold:I

    .line 171
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mUseSensorThreshold:I

    .line 172
    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mUseSensorAWF:Z

    .line 173
    iput v3, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingRatio:I

    .line 174
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    .line 175
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAppDeviceRotation:I

    .line 176
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAppPanoramaDirection:I

    .line 177
    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAppPanoramaDirectionSettings:I

    .line 181
    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mRequestTakePicture:Z

    .line 92
    return-void
.end method

.method private addImageAsApplication(Ljava/lang/String;Landroid/graphics/Rect;I)V
    .locals 12
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "rect"    # Landroid/graphics/Rect;
    .param p3, "orientation"    # I

    .prologue
    .line 1537
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mLocation:Landroid/location/Location;

    if-eqz v1, :cond_1

    const/4 v11, 0x1

    .line 1539
    .local v11, "withLocation":Z
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    .line 1540
    :goto_1
    iget-wide v4, p0, Lcom/android/camera/module/PanoramaModule;->mTimeTaken:J

    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mLocation:Landroid/location/Location;

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v8

    move-object v2, p1

    move v3, p3

    .line 1539
    invoke-static/range {v1 .. v8}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;IJLandroid/location/Location;II)Landroid/net/Uri;

    move-result-object v10

    .line 1541
    .local v10, "uri":Landroid/net/Uri;
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/PanoramaModule;->trackGeneralInfo(IZ)V

    .line 1542
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v11}, Lcom/android/camera/module/PanoramaModule;->trackPictureTaken(IZZ)V

    .line 1543
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    .line 1544
    .local v0, "activity":Lcom/android/camera/Camera;
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->isCreated()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 1545
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1547
    if-eqz v10, :cond_0

    .line 1548
    invoke-virtual {v0, v10}, Lcom/android/camera/Camera;->addSecureUri(Landroid/net/Uri;)V

    .line 1549
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 1550
    const/4 v2, 0x0

    .line 1549
    invoke-static {v1, v10, v2}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object v9

    .line 1551
    .local v9, "t":Lcom/android/camera/Thumbnail;
    invoke-static {v0, v10}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    .line 1552
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v9, v2, v3}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 1555
    .end local v9    # "t":Lcom/android/camera/Thumbnail;
    :cond_0
    return-void

    .line 1537
    .end local v0    # "activity":Lcom/android/camera/Camera;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "withLocation":Z
    :cond_1
    const/4 v11, 0x0

    .restart local v11    # "withLocation":Z
    goto :goto_0

    .line 1539
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    goto :goto_1
.end method

.method private addProcessedCount()V
    .locals 4

    .prologue
    .line 1345
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 1346
    :try_start_0
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    .line 1347
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "addProcessedCount: pro="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1348
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 1350
    return-void

    .line 1345
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private addRequestCount()V
    .locals 4

    .prologue
    .line 1337
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 1338
    :try_start_0
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    .line 1339
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "addRequestCount: req="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1340
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 1342
    return-void

    .line 1337
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private addStillImage(Lcom/android/camera/module/PanoramaModule$StillImageData;)V
    .locals 2
    .param p1, "dat"    # Lcom/android/camera/module/PanoramaModule$StillImageData;

    .prologue
    .line 1353
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcTask:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    if-nez v0, :cond_0

    .line 1354
    new-instance v0, Lcom/android/camera/module/PanoramaModule$StillProcTask;

    invoke-direct {v0, p0}, Lcom/android/camera/module/PanoramaModule$StillProcTask;-><init>(Lcom/android/camera/module/PanoramaModule;)V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcTask:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    .line 1355
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcTask:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    invoke-virtual {v0}, Lcom/android/camera/module/PanoramaModule$StillProcTask;->start()V

    .line 1357
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mImageSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 1358
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1359
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mImageSyncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 1361
    return-void

    .line 1357
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private allocateDisplayBuffers(I)V
    .locals 4
    .param p1, "direction"    # I

    .prologue
    const/4 v3, 0x0

    .line 1563
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    .line 1564
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    if-ne v1, v2, :cond_0

    .line 1565
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    if-eq v1, v2, :cond_1

    .line 1566
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 1567
    iput-object v3, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    .line 1568
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 1569
    iput-object v3, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    .line 1572
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    if-nez v1, :cond_2

    .line 1574
    packed-switch p1, :pswitch_data_0

    .line 1595
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    .line 1596
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 1597
    .local v0, "aspect":F
    iget v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreViewScaleHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    mul-int/lit8 v1, v1, 0x50

    div-int/lit8 v1, v1, 0x64

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreViewScaleHeight:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    .line 1598
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    mul-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    div-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAttachPosOffsetY:I

    .line 1602
    .end local v0    # "aspect":F
    :cond_2
    :goto_0
    return-void

    .line 1576
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    .line 1577
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 1578
    .restart local v0    # "aspect":F
    iget v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreViewScaleHeight:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    mul-int/lit8 v1, v1, 0x50

    div-int/lit8 v1, v1, 0x64

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreViewScaleHeight:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    .line 1579
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    mul-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    div-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAttachPosOffsetY:I

    goto :goto_0

    .line 1582
    .end local v0    # "aspect":F
    :pswitch_2
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    .line 1583
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 1584
    .restart local v0    # "aspect":F
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    mul-int/lit8 v2, v2, 0x50

    div-int/lit8 v2, v2, 0x64

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    .line 1585
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    div-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAttachPosOffsetX:I

    goto/16 :goto_0

    .line 1588
    .end local v0    # "aspect":F
    :pswitch_3
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    .line 1589
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 1590
    .restart local v0    # "aspect":F
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    mul-int/lit8 v2, v2, 0x50

    div-int/lit8 v2, v2, 0x64

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    .line 1591
    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    mul-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    div-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mAttachPosOffsetX:I

    goto/16 :goto_0

    .line 1574
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private calibrateRotation(I)I
    .locals 1
    .param p1, "rotation"    # I

    .prologue
    .line 1522
    if-eqz p1, :cond_0

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_0

    .line 1523
    const/16 v0, 0xb4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x10e

    if-eq p1, v0, :cond_0

    .line 1525
    const/4 p1, 0x0

    .line 1527
    :cond_0
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mDeviceOrientationAtCapture:I

    add-int/2addr v0, p1

    rem-int/lit16 v0, v0, 0x168

    return v0
.end method

.method private createNameString(JI)Ljava/lang/String;
    .locals 3
    .param p1, "dateTaken"    # J
    .param p3, "type"    # I

    .prologue
    .line 1605
    const v1, 0x7f0f00bb

    invoke-virtual {p0, v1}, Lcom/android/camera/module/PanoramaModule;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1, p2}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1607
    .local v0, "name":Ljava/lang/String;
    sget v1, Lcom/android/camera/module/PanoramaModule;->sSaveOutputType:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    const/4 v1, 0x2

    if-ne p3, v1, :cond_0

    .line 1608
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_bounding"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1610
    :cond_0
    return-object v0
.end method

.method private finishAttachStillImageTask()V
    .locals 13

    .prologue
    .line 1365
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v7

    .line 1367
    const/4 v1, 0x0

    .line 1368
    .local v1, "timeoutTimes":I
    :cond_0
    :goto_0
    :try_start_0
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    iget v8, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    if-le v6, v8, :cond_1

    .line 1369
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1370
    .local v4, "start":J
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    const-wide/16 v8, 0xbb8

    invoke-virtual {v6, v8, v9}, Ljava/lang/Object;->wait(J)V

    .line 1371
    sget-object v6, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 1372
    const-string/jumbo v9, "SaveOutputImageTask: quit waiting. req=%d pro=%d"

    .line 1371
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    .line 1373
    iget v11, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v12, 0x0

    aput-object v11, v10, v12

    iget v11, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v12, 0x1

    aput-object v11, v10, v12

    .line 1371
    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1374
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 1375
    .local v2, "now":J
    sub-long v8, v2, v4

    const-wide/16 v10, 0xbb8

    cmp-long v6, v8, v10

    if-ltz v6, :cond_2

    .line 1376
    add-int/lit8 v1, v1, 0x1

    .line 1377
    const/4 v6, 0x3

    if-le v1, v6, :cond_0

    .end local v2    # "now":J
    .end local v4    # "start":J
    :cond_1
    :goto_1
    monitor-exit v7

    .line 1389
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcTask:Lcom/android/camera/module/PanoramaModule$StillProcTask;

    .line 1390
    return-void

    .line 1381
    .restart local v2    # "now":J
    .restart local v4    # "start":J
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 1384
    .end local v2    # "now":J
    .end local v4    # "start":J
    :catch_0
    move-exception v0

    .line 1385
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_1
    sget-object v6, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "SaveOutputImageTask: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1365
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6
.end method

.method private initPreviewLayout()V
    .locals 10

    .prologue
    .line 482
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->isAlive()Z

    move-result v7

    if-nez v7, :cond_0

    .line 483
    return-void

    .line 485
    :cond_0
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v7}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v7

    iget-object v8, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v8, v8, Lcom/android/camera/CameraSize;->width:I

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v9, v9, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v7, v8, v9}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    .line 486
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v7}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    .line 487
    .local v3, "screen":Lcom/android/camera/CameraScreenNail;
    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v5

    .line 488
    .local v5, "screenWidth":I
    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v4

    .line 489
    .local v4, "screenHeight":I
    iget v7, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    mul-int/lit8 v7, v7, 0x2

    sub-int v7, v4, v7

    mul-int/lit8 v7, v7, 0x50

    div-int/lit8 v0, v7, 0x64

    .line 491
    .local v0, "croppedScreenHeight":I
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v7}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f09000a

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 492
    .local v1, "height":I
    mul-int v7, v1, v5

    div-int v6, v7, v0

    .line 495
    .local v6, "width":I
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v7

    .line 496
    const/16 v8, 0xb0

    .line 495
    invoke-virtual {v7, v8}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 497
    .local v2, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v7, v7, Lcom/android/camera/CameraSize;->width:I

    iget-object v8, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v8, v8, Lcom/android/camera/CameraSize;->height:I

    invoke-interface {v2, v6, v1, v7, v8}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->initPreviewLayout(IIII)V

    .line 498
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v7}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/CameraScreenNail;->isAnimationRunning()Z

    move-result v7

    if-nez v7, :cond_1

    .line 499
    const/4 v7, 0x0

    invoke-interface {v2, v7}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->showSmallPreview(Z)V

    .line 501
    :cond_1
    return-void
.end method

.method private initializeMiscControls()V
    .locals 3

    .prologue
    .line 340
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mStillProcList:Ljava/util/ArrayList;

    .line 341
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mPreViewScaleHeight:I

    int-to-float v0, v0

    .line 342
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09000a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float/2addr v1, v2

    .line 343
    const/high16 v2, 0x42a00000    # 80.0f

    .line 342
    div-float/2addr v1, v2

    .line 341
    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->mFrameRatio:F

    .line 344
    return-void
.end method

.method private isProcessingFinishTask()Z
    .locals 2

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSaveOutputImageTask:Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;

    if-eqz v0, :cond_0

    .line 1394
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSaveOutputImageTask:Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;

    invoke-virtual {v0}, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 1395
    const/4 v0, 0x1

    return v0

    .line 1397
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isShootingTooShort()Z
    .locals 4

    .prologue
    .line 608
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/PanoramaModule;->mPanoramaShootingStartTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isZslMode()Z
    .locals 1

    .prologue
    .line 1714
    const/4 v0, 0x1

    return v0
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    .prologue
    .line 834
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    .line 835
    const-wide/16 v2, 0x3e8

    .line 834
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 836
    return-void
.end method

.method private onCaptureOrientationDecided()V
    .locals 4

    .prologue
    .line 1615
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1616
    const/16 v2, 0xb0

    .line 1615
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1617
    .local v0, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mAttachPosOffsetX:I

    iget v3, p0, Lcom/android/camera/module/PanoramaModule;->mAttachPosOffsetY:I

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->onCaptureOrientationDecided(III)V

    .line 1618
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureOrientationDecided:Z

    .line 1619
    return-void
.end method

.method private onPreviewMoving()V
    .locals 3

    .prologue
    .line 1623
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb0

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1624
    .local v0, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->onPreviewMoving()V

    .line 1625
    return-void
.end method

.method private onStopShooting(Z)V
    .locals 3
    .param p1, "succeed"    # Z

    .prologue
    .line 1115
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1116
    const/16 v2, 0xa2

    .line 1115
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1117
    .local v0, "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-eqz p1, :cond_0

    .line 1118
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFinish()V

    .line 1122
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v2, 0x35

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1123
    return-void

    .line 1120
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    goto :goto_0
.end method

.method private releaseResources()V
    .locals 0

    .prologue
    .line 840
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->closeCamera()V

    .line 841
    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    .prologue
    .line 829
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 830
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 831
    return-void
.end method

.method private resetToPreview()V
    .locals 3

    .prologue
    .line 693
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 694
    const/16 v2, 0xb0

    .line 693
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 695
    .local v0, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->isShown()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 696
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->resetUI()V

    .line 698
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mPaused:Z

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isZslMode()Z

    move-result v1

    .line 699
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->startPreview()V

    .line 701
    :cond_1
    return-void
.end method

.method private resetUI()V
    .locals 4

    .prologue
    .line 668
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 669
    const/16 v3, 0xb0

    .line 668
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 670
    .local v1, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->resetShootUI()V

    .line 673
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 674
    const/16 v3, 0xb6

    .line 673
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 675
    .local v0, "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    if-eqz v0, :cond_0

    .line 676
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->showZoomButton()V

    .line 678
    :cond_0
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/android/camera/module/PanoramaModule;->showSmallPreview(Z)V

    .line 679
    return-void
.end method

.method private saveOutputJpeg(Ljava/lang/String;Landroid/graphics/Rect;)V
    .locals 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "rect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 1505
    const/4 v1, 0x1

    .line 1506
    .local v1, "orientation":I
    new-array v3, v7, [I

    .line 1507
    .local v3, "progress":[I
    invoke-static {p1}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1508
    .local v2, "path":Ljava/lang/String;
    iget-object v5, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    invoke-virtual {v5, v2, p2, v1, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP;->saveOutputJpeg(Ljava/lang/String;Landroid/graphics/Rect;I[I)I

    move-result v4

    .line 1509
    .local v4, "ret":I
    if-nez v4, :cond_1

    .line 1510
    invoke-direct {p0, v1}, Lcom/android/camera/module/PanoramaModule;->calibrateRotation(I)I

    move-result v1

    .line 1511
    invoke-direct {p0, v2, p2, v1}, Lcom/android/camera/module/PanoramaModule;->addImageAsApplication(Ljava/lang/String;Landroid/graphics/Rect;I)V

    .line 1519
    :cond_0
    :goto_0
    return-void

    .line 1513
    :cond_1
    sget-object v5, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v6, "saveOutputJpeg() -> 0x%x"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1514
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1515
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1516
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0
.end method

.method private setShootUI()V
    .locals 4

    .prologue
    .line 985
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 986
    const/16 v3, 0xb0

    .line 985
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 987
    .local v1, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setShootUI()V

    .line 989
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 990
    const/16 v3, 0xb6

    .line 989
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 991
    .local v0, "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    if-eqz v0, :cond_0

    .line 992
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->hideZoomButton()V

    .line 994
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->keepScreenOnAwhile()V

    .line 995
    return-void
.end method

.method private setupCaptureParams()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 374
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v1, :cond_0

    .line 375
    sget-object v1, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "camera device is not ready"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    return-void

    .line 386
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mTargetFocusMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 387
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setZoomRatio(F)V

    .line 388
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setFlashMode(I)V

    .line 390
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, "antiBanding":Ljava/lang/String;
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAntiBanding(I)V

    .line 392
    sget-object v1, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "antiBanding="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    .line 395
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    .line 396
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 397
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 398
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 399
    return-void
.end method

.method private showSmallPreview(Z)V
    .locals 3
    .param p1, "animation"    # Z

    .prologue
    .line 682
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    if-eqz v1, :cond_0

    .line 683
    return-void

    .line 686
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 687
    const/16 v2, 0xb0

    .line 686
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 688
    .local v0, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->showSmallPreview(Z)V

    .line 689
    return-void
.end method

.method private startPanoramaGP()Z
    .locals 12

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1000
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v6

    .line 1001
    const/16 v9, 0xb0

    .line 1000
    invoke-virtual {v6, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1002
    .local v2, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    if-nez v6, :cond_2

    .line 1003
    new-array v0, v7, [I

    .line 1004
    .local v0, "buff_size":[I
    new-instance v6, Lcom/android/camera/panorama/MorphoPanoramaGP;

    invoke-direct {v6}, Lcom/android/camera/panorama/MorphoPanoramaGP;-><init>()V

    iput-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    .line 1005
    new-instance v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    invoke-direct {v6}, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;-><init>()V

    iput-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    .line 1006
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    const-string/jumbo v9, "YVU420_SEMIPLANAR"

    iput-object v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->format:Ljava/lang/String;

    .line 1007
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, p0, Lcom/android/camera/module/PanoramaModule;->mUseThreshold:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->use_threshold:I

    .line 1009
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v9, v9, Lcom/android/camera/CameraSize;->width:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_width:I

    .line 1010
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v9, v9, Lcom/android/camera/CameraSize;->height:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_height:I

    .line 1013
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v9, v9, Lcom/android/camera/CameraSize;->width:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->still_width:I

    .line 1014
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v9, v9, Lcom/android/camera/CameraSize;->height:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->still_height:I

    .line 1019
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v9, v7}, Lcom/android/camera2/CameraCapabilities;->getViewAngle(Z)F

    move-result v9

    float-to-double v10, v9

    iput-wide v10, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->angle_of_view_degree:D

    .line 1020
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iput v8, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->draw_cur_image:I

    .line 1021
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v6}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v1

    .line 1022
    .local v1, "degrees":I
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->mBogusCameraId:I

    invoke-static {v1, v6}, Lcom/android/camera/Util;->getDisplayOrientation(II)I

    move-result v5

    .line 1023
    .local v5, "tmpDegrees":I
    iput v8, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    .line 1024
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->mAppPanoramaDirectionSettings:I

    iput v6, p0, Lcom/android/camera/module/PanoramaModule;->mAppPanoramaDirection:I

    .line 1026
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getPanoramaMoveDirection()I

    move-result v9

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->direction:I

    .line 1028
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->still_height:I

    int-to-float v9, v9

    iget v10, p0, Lcom/android/camera/module/PanoramaModule;->mFrameRatio:F

    mul-float/2addr v9, v10

    float-to-int v9, v9

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_width:I

    .line 1029
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->still_width:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_height:I

    .line 1030
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_height:I

    int-to-float v9, v9

    iget v10, p0, Lcom/android/camera/module/PanoramaModule;->mFrameRatio:F

    mul-float/2addr v9, v10

    float-to-int v9, v9

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    .line 1031
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_width:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    .line 1032
    packed-switch v5, :pswitch_data_0

    .line 1037
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    const/16 v9, 0x5a

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->output_rotation:I

    .line 1040
    :goto_0
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    sget v10, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v9, v10

    add-int/lit8 v9, v9, -0x1

    invoke-static {v9, v7}, Ljava/lang/Math;->max(II)I

    move-result v9

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_shrink_ratio:I

    .line 1041
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    const-wide v10, 0x4076800000000000L    # 360.0

    invoke-static {v6, v10, v11}, Lcom/android/camera/panorama/MorphoPanoramaGP;->calcImageSize(Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;D)I

    .line 1042
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_width:I

    if-ge v6, v9, :cond_0

    .line 1043
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    int-to-float v6, v6

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_width:I

    int-to-float v9, v9

    div-float v4, v6, v9

    .line 1044
    .local v4, "scale":F
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_width:I

    .line 1045
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    int-to-float v9, v9

    mul-float/2addr v9, v4

    float-to-int v9, v9

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    .line 1047
    .end local v4    # "scale":F
    :cond_0
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_height:I

    if-ge v6, v9, :cond_1

    .line 1048
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    int-to-float v6, v6

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v9, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_height:I

    int-to-float v9, v9

    div-float v4, v6, v9

    .line 1049
    .restart local v4    # "scale":F
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, p0, Lcom/android/camera/module/PanoramaModule;->MAX_DST_IMG_WIDTH:I

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->dst_img_height:I

    .line 1050
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    int-to-float v9, v9

    mul-float/2addr v9, v4

    float-to-int v9, v9

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    .line 1052
    .end local v4    # "scale":F
    :cond_1
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    and-int/lit8 v9, v9, -0x2

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_width:I

    .line 1053
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    and-int/lit8 v9, v9, -0x2

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->preview_img_height:I

    .line 1055
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    invoke-virtual {v6, v9, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP;->initialize(Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;[I)I

    move-result v3

    .line 1056
    .local v3, "ret":I
    if-eqz v3, :cond_2

    .line 1057
    sget-object v6, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "initialize() -> 0x%x"

    new-array v10, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v8

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1060
    .end local v0    # "buff_size":[I
    .end local v1    # "degrees":I
    .end local v3    # "ret":I
    .end local v5    # "tmpDegrees":I
    :cond_2
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    iget v9, p0, Lcom/android/camera/module/PanoramaModule;->mMotionlessThreshold:I

    invoke-virtual {v6, v9}, Lcom/android/camera/panorama/MorphoPanoramaGP;->setMotionlessThreshold(I)I

    .line 1061
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    iget v9, p0, Lcom/android/camera/module/PanoramaModule;->mUseSensorThreshold:I

    invoke-virtual {v6, v9}, Lcom/android/camera/panorama/MorphoPanoramaGP;->setUseSensorThreshold(I)I

    .line 1062
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->mAppDeviceRotation:I

    iget v9, p0, Lcom/android/camera/module/PanoramaModule;->mAppPanoramaDirection:I

    add-int/2addr v6, v9

    invoke-direct {p0, v6}, Lcom/android/camera/module/PanoramaModule;->allocateDisplayBuffers(I)V

    .line 1063
    iget-object v9, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    .line 1064
    iget-boolean v6, p0, Lcom/android/camera/module/PanoramaModule;->mUseSensorAWF:Z

    if-eqz v6, :cond_4

    move v6, v7

    .line 1063
    :goto_1
    invoke-virtual {v9, v8, v6}, Lcom/android/camera/panorama/MorphoPanoramaGP;->setUseSensorAssist(II)I

    move-result v3

    .line 1065
    .restart local v3    # "ret":I
    if-eqz v3, :cond_3

    .line 1066
    sget-object v6, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "setUseSensorAssist() -> 0x%x"

    new-array v10, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v8

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1069
    :cond_3
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    invoke-virtual {v6}, Lcom/android/camera/panorama/MorphoPanoramaGP;->start()I

    move-result v3

    .line 1070
    if-eqz v3, :cond_5

    .line 1071
    sget-object v6, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "start() -> 0x%x"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v8

    invoke-static {v9, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1072
    return v8

    .line 1034
    .end local v3    # "ret":I
    .restart local v0    # "buff_size":[I
    .restart local v1    # "degrees":I
    .restart local v5    # "tmpDegrees":I
    :pswitch_0
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    const/16 v9, 0x10e

    iput v9, v6, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->output_rotation:I

    goto/16 :goto_0

    .end local v0    # "buff_size":[I
    .end local v1    # "degrees":I
    .end local v5    # "tmpDegrees":I
    :cond_4
    move v6, v8

    .line 1064
    goto :goto_1

    .line 1074
    .restart local v3    # "ret":I
    :cond_5
    return v7

    .line 1032
    nop

    :pswitch_data_0
    .packed-switch 0x10e
        :pswitch_0
    .end packed-switch
.end method

.method private stopPanoramaShooting(Z)V
    .locals 1
    .param p1, "save_image"    # Z

    .prologue
    .line 1078
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(ZZ)V

    .line 1079
    return-void
.end method

.method private stopPanoramaShooting(ZZ)V
    .locals 4
    .param p1, "save_image"    # Z
    .param p2, "from_shutter_button"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1082
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "stopPanoramaShooting: saveImage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->keepScreenOnAwhile()V

    .line 1084
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    if-nez v0, :cond_1

    .line 1085
    :cond_0
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "panorama is stopped"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1086
    return-void

    .line 1088
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isProcessingFinishTask()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1089
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "previous save task is on going"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1090
    return-void

    .line 1092
    :cond_2
    iput-boolean v3, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureOrientationDecided:Z

    .line 1093
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    .line 1094
    if-nez p1, :cond_3

    .line 1095
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mImageSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 1096
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    .line 1097
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mImageSyncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 1101
    :cond_3
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    if-eqz v0, :cond_4

    .line 1102
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    .line 1103
    :cond_4
    const/4 p1, 0x0

    .line 1106
    .end local p1    # "save_image":Z
    :cond_5
    new-instance v0, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;

    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-direct {v0, p0, v1, p1}, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;-><init>(Lcom/android/camera/module/PanoramaModule;Landroid/content/Context;Z)V

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSaveOutputImageTask:Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;

    .line 1107
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSaveOutputImageTask:Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;

    new-array v1, v3, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/PanoramaModule$SaveOutputImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1110
    invoke-direct {p0, p1}, Lcom/android/camera/module/PanoramaModule;->onStopShooting(Z)V

    .line 1111
    return-void

    .line 1095
    .restart local p1    # "save_image":Z
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private updatePictureAndPreviewSize()V
    .locals 10

    .prologue
    .line 440
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v7, 0x100

    invoke-virtual {v6, v7}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v4

    .line 441
    .local v4, "supportedPictureSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-virtual {p0, v4}, Lcom/android/camera/module/PanoramaModule;->getBestPanoPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 444
    .local v0, "pictureSize":Lcom/android/camera/CameraSize;
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v7, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v6, v7}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v5

    .line 445
    .local v5, "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    iget v6, p0, Lcom/android/camera/module/PanoramaModule;->mModuleIndex:I

    iget v7, p0, Lcom/android/camera/module/PanoramaModule;->mBogusCameraId:I

    .line 446
    iget v8, v0, Lcom/android/camera/CameraSize;->width:I

    iget v9, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v8, v9}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v8

    float-to-double v8, v8

    .line 445
    invoke-static {v6, v7, v5, v8, v9}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v1

    .line 448
    .local v1, "previewSize":Lcom/android/camera/CameraSize;
    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 449
    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 450
    sget-object v6, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "pictureSize= "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " previewSize="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v6, v6, Lcom/android/camera/CameraSize;->width:I

    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v7, v7, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v6, v7}, Lcom/android/camera/module/PanoramaModule;->updateCameraScreenNailSize(II)V

    .line 454
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v6}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v6

    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v7}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v7

    if-ge v6, v7, :cond_0

    .line 455
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v6}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v6

    int-to-double v6, v6

    iget-object v8, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v8}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v8

    int-to-double v8, v8

    div-double v2, v6, v8

    .line 459
    .local v2, "scale":D
    :goto_0
    sget v6, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-double v6, v6

    mul-double/2addr v6, v2

    double-to-int v6, v6

    iput v6, p0, Lcom/android/camera/module/PanoramaModule;->mPreViewScaleHeight:I

    .line 460
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->initializeMiscControls()V

    .line 461
    return-void

    .line 457
    .end local v2    # "scale":D
    :cond_0
    iget-object v6, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v6}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v6

    int-to-double v6, v6

    iget-object v8, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v8}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v8

    int-to-double v8, v8

    div-double v2, v6, v8

    .restart local v2    # "scale":D
    goto :goto_0
.end method


# virtual methods
.method public closeCamera()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 365
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->setCameraState(I)V

    .line 366
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 368
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    .line 369
    iput-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 371
    :cond_0
    return-void
.end method

.method public varargs consumePreference([I)V
    .locals 6
    .param p1, "updateTypes"    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .prologue
    .line 408
    const/4 v1, 0x0

    array-length v2, p1

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p1, v1

    .line 409
    .local v0, "type":I
    sparse-switch v0, :sswitch_data_0

    .line 423
    sget-boolean v3, Lcom/android/camera/module/PanoramaModule;->DEBUG:Z

    if-eqz v3, :cond_0

    .line 424
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

    .line 411
    :sswitch_0
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->updatePictureAndPreviewSize()V

    .line 408
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 415
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->getZoomValue()F

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/camera/module/PanoramaModule;->setZoomRatio(F)V

    goto :goto_1

    .line 419
    :sswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->setupCaptureParams()V

    goto :goto_1

    .line 426
    :cond_0
    sget-object v3, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

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

    .line 431
    .end local v0    # "type":I
    :cond_1
    return-void

    .line 409
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x18 -> :sswitch_1
        0x20 -> :sswitch_2
    .end sparse-switch
.end method

.method protected getBestPanoPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
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
    .line 464
    .local p1, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;I)V

    .line 465
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPanoPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method public isDoingAction()Z
    .locals 1

    .prologue
    .line 623
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isProcessingFinishTask()Z

    move-result v0

    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    .prologue
    .line 435
    const/4 v0, 0x0

    return v0
.end method

.method public onBackPressed()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 634
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 635
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    if-eqz v0, :cond_1

    .line 636
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isProcessingFinishTask()Z

    move-result v0

    if-nez v0, :cond_0

    .line 637
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->playCameraSound(I)V

    .line 638
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 640
    return v2

    :cond_1
    monitor-exit v1

    .line 644
    const/4 v0, 0x0

    return v0

    .line 634
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected onCameraOpened()V
    .locals 2

    .prologue
    .line 325
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 328
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->checkDisplayOrientation()V

    .line 329
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->updatePreferenceTrampoline([I)V

    .line 331
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 332
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->startSession()V

    .line 333
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 334
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "SetupCameraThread done"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->setCameraState(I)V

    .line 337
    return-void
.end method

.method public onCreate(II)V
    .locals 2
    .param p1, "moduleIndex"    # I
    .param p2, "cameraId"    # I

    .prologue
    .line 318
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 319
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 320
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->onCameraOpened()V

    .line 321
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 763
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 764
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 765
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 514
    iget-boolean v2, p0, Lcom/android/camera/module/PanoramaModule;->mPaused:Z

    if-eqz v2, :cond_0

    .line 515
    return v1

    .line 517
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 549
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 520
    :sswitch_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 521
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 522
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 523
    const/16 v0, 0x1e

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->onShutterButtonClick(I)V

    .line 528
    :cond_2
    :goto_0
    return v1

    .line 526
    :cond_3
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->onShutterButtonClick(I)V

    goto :goto_0

    .line 532
    :sswitch_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 533
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->onShutterButtonClick(I)V

    .line 534
    return v1

    .line 542
    :sswitch_2
    const/16 v2, 0x18

    if-eq p1, v2, :cond_5

    .line 543
    const/16 v2, 0x58

    if-ne p1, v2, :cond_4

    move v0, v1

    .line 544
    :cond_4
    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    .line 541
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/module/PanoramaModule;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 545
    return v1

    :cond_5
    move v0, v1

    .line 542
    goto :goto_1

    .line 517
    nop

    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_1
        0x18 -> :sswitch_2
        0x19 -> :sswitch_2
        0x1b -> :sswitch_0
        0x42 -> :sswitch_0
        0x57 -> :sswitch_2
        0x58 -> :sswitch_2
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x1

    .line 554
    iget-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mPaused:Z

    if-eqz v1, :cond_0

    .line 555
    return v3

    .line 557
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 570
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    return v1

    .line 560
    :sswitch_0
    return v3

    .line 564
    :sswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 565
    const/16 v2, 0xab

    .line 564
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 566
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 567
    return v3

    .line 557
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x1b -> :sswitch_0
        0x42 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 722
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 725
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 726
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    if-eqz v0, :cond_0

    .line 727
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->playCameraSound(I)V

    .line 728
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(Z)V

    .line 730
    :cond_0
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    if-le v0, v2, :cond_1

    .line 732
    iget v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    iput v0, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    .line 733
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 735
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 736
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 737
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    .line 739
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    .line 740
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 741
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    monitor-exit v1

    .line 745
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->releaseResources()V

    .line 747
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mWaitProcessorTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_4

    .line 748
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mWaitProcessorTask:Landroid/os/AsyncTask;

    invoke-virtual {v0, v4}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 749
    iput-object v3, p0, Lcom/android/camera/module/PanoramaModule;->mWaitProcessorTask:Landroid/os/AsyncTask;

    .line 751
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->resetScreenOn()V

    .line 753
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 754
    return-void

    .line 725
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onPictureBurstFinished(Z)V
    .locals 0
    .param p1, "success"    # Z

    .prologue
    .line 1709
    return-void
.end method

.method public onPictureTaken([BLcom/android/camera2/Camera2Proxy;)V
    .locals 8
    .param p1, "data"    # [B
    .param p2, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    const/4 v1, 0x0

    .line 1629
    iput-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mRequestTakePicture:Z

    .line 1630
    sget-object v1, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onPictureTaken>>len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1631
    iget-object v7, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v7

    .line 1632
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_0

    .line 1633
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    :cond_0
    monitor-exit v7

    .line 1635
    return-void

    .line 1634
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureInfoList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 1656
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureInfoList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/camera/module/PanoramaModule$CaptureInfo;

    .line 1659
    .local v6, "capInfo":Lcom/android/camera/module/PanoramaModule$CaptureInfo;
    new-instance v0, Lcom/android/camera/module/PanoramaModule$StillImageData;

    iget v2, v6, Lcom/android/camera/module/PanoramaModule$CaptureInfo;->mId:I

    iget v3, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCount:I

    iget-object v5, p0, Lcom/android/camera/module/PanoramaModule;->mMotionData:[B

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/module/PanoramaModule$StillImageData;-><init>(Lcom/android/camera/module/PanoramaModule;II[B[B)V

    .line 1660
    .local v0, "still_image_data":Lcom/android/camera/module/PanoramaModule$StillImageData;
    invoke-direct {p0, v0}, Lcom/android/camera/module/PanoramaModule;->addStillImage(Lcom/android/camera/module/PanoramaModule$StillImageData;)V

    .line 1669
    iget v1, v6, Lcom/android/camera/module/PanoramaModule$CaptureInfo;->mStatus:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sparse-switch v1, :sswitch_data_0

    :goto_0
    monitor-exit v7

    .line 1698
    sget-object v1, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "onPictureTaken<<"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1699
    return-void

    .line 1673
    :sswitch_0
    const/4 v1, 0x1

    :try_start_2
    invoke-direct {p0, v1}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1631
    .end local v0    # "still_image_data":Lcom/android/camera/module/PanoramaModule$StillImageData;
    .end local v6    # "capInfo":Lcom/android/camera/module/PanoramaModule$CaptureInfo;
    :catchall_0
    move-exception v1

    monitor-exit v7

    throw v1

    .line 1669
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x3 -> :sswitch_0
        0xb -> :sswitch_0
    .end sparse-switch
.end method

.method public onPictureTakenFailed()V
    .locals 0

    .prologue
    .line 1704
    return-void
.end method

.method public onPreviewFrame(Lcom/android/camera2/PreviewImageProp;Lcom/android/camera2/Camera2Proxy;)V
    .locals 26
    .param p1, "previewImage"    # Lcom/android/camera2/PreviewImageProp;
    .param p2, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 1137
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera2/PreviewImageProp;->getData()[B

    move-result-object v3

    .line 1138
    .local v3, "data":[B
    sget-object v4, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onPreviewFrame>>len="

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v3, :cond_0

    array-length v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1139
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/PanoramaModule;->isAlive()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1140
    return-void

    .line 1138
    :cond_0
    const/4 v2, -0x1

    goto :goto_0

    .line 1142
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    move-object/from16 v25, v0

    monitor-enter v25

    .line 1143
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    if-eqz v2, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/PanoramaModule;->isProcessingFinishTask()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    monitor-exit v25

    .line 1144
    return-void

    .line 1147
    :cond_3
    :try_start_1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewSkipCount:I

    if-lez v2, :cond_4

    .line 1148
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewSkipCount:I

    add-int/lit8 v2, v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewSkipCount:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v25

    .line 1149
    return-void

    .line 1153
    :cond_4
    :try_start_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1154
    const/16 v4, 0xb0

    .line 1153
    invoke-virtual {v2, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v20

    check-cast v20, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1155
    .local v20, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCount:I

    .line 1156
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMoveSpeed:[I

    const/4 v4, 0x0

    const/4 v5, 0x0

    aput v4, v2, v5

    .line 1157
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mUseImage:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/PanoramaModule;->mImageID:[I

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/camera/module/PanoramaModule;->mMotionData:[B

    .line 1158
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual/range {p1 .. p1}, Lcom/android/camera2/PreviewImageProp;->getYLength()I

    move-result v9

    .line 1159
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera2/PreviewImageProp;->getYStride()I

    move-result v10

    invoke-virtual/range {p1 .. p1}, Lcom/android/camera2/PreviewImageProp;->getUVStride()I

    move-result v11

    .line 1157
    invoke-virtual/range {v2 .. v11}, Lcom/android/camera/panorama/MorphoPanoramaGP;->attachPreview([BI[I[B[ILandroid/graphics/Bitmap;III)I

    move-result v21

    .line 1160
    .local v21, "ret":I
    if-eqz v21, :cond_5

    .line 1161
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "attachPreview() -> 0x%x"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1163
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    if-eqz v2, :cond_6

    .line 1164
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "attachPreview status="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1165
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    packed-switch v2, :pswitch_data_0

    .line 1181
    :cond_6
    :goto_1
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    invoke-virtual {v2, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP;->getCurrentDirection([I)I

    move-result v21

    .line 1182
    if-eqz v21, :cond_7

    .line 1183
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "getCurrentDirection() -> 0x%x"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1186
    :cond_7
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    if-eqz v2, :cond_10

    .line 1187
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    const/4 v4, 0x1

    if-eq v2, v4, :cond_10

    .line 1188
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    const/16 v4, 0x8

    if-eq v2, v4, :cond_10

    .line 1190
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v24

    .line 1191
    .local v24, "sw":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v22

    .line 1192
    .local v22, "sh":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    .line 1193
    .local v17, "dw":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    .line 1194
    .local v15, "dh":I
    new-instance v13, Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    invoke-direct {v13, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1195
    .local v13, "canvas":Landroid/graphics/Canvas;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    const/4 v4, 0x0

    invoke-virtual {v13, v4, v2}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 1196
    new-instance v16, Landroid/graphics/Rect;

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v0, v2, v4, v1, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1198
    .local v16, "dst":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    mul-int/lit8 v2, v2, 0x2

    sub-int v22, v22, v2

    .line 1199
    new-instance v23, Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    mul-int/lit8 v4, v22, 0xa

    div-int/lit8 v4, v4, 0x64

    add-int/2addr v2, v4

    .line 1200
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    mul-int/lit8 v5, v22, 0x5a

    div-int/lit8 v5, v5, 0x64

    add-int/2addr v4, v5

    .line 1199
    const/4 v5, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v24

    invoke-direct {v0, v5, v2, v1, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 1201
    .local v23, "src":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewImage:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v13, v2, v0, v1, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 1204
    new-instance v12, Landroid/graphics/Point;

    invoke-direct {v12}, Landroid/graphics/Point;-><init>()V

    .line 1205
    .local v12, "attachedPos":Landroid/graphics/Point;
    new-instance v18, Landroid/graphics/Point;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/Point;-><init>()V

    .line 1206
    .local v18, "guidePos":Landroid/graphics/Point;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-object/from16 v0, v18

    invoke-virtual {v2, v12, v0}, Lcom/android/camera/panorama/MorphoPanoramaGP;->getGuidancePos(Landroid/graphics/Point;Landroid/graphics/Point;)I

    .line 1207
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getGuidancePos attachedPos="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " guidePos="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1208
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    packed-switch v2, :pswitch_data_1

    .line 1221
    :goto_2
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    const/4 v4, 0x0

    cmpl-float v2, v2, v4

    if-nez v2, :cond_8

    .line 1222
    move/from16 v0, v17

    if-ge v0, v15, :cond_e

    int-to-float v2, v15

    move/from16 v0, v22

    int-to-float v4, v0

    div-float/2addr v2, v4

    :goto_3
    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    .line 1224
    :cond_8
    move/from16 v0, v24

    move/from16 v1, v22

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewRefY:I

    .line 1225
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewRefY:I

    if-eqz v2, :cond_9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    const/4 v4, 0x0

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_9

    .line 1226
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewRefY:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewRefY:I

    .line 1228
    :cond_9
    iget v2, v12, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    iput v2, v12, Landroid/graphics/Point;->x:I

    .line 1229
    iget v2, v12, Landroid/graphics/Point;->y:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    iput v2, v12, Landroid/graphics/Point;->y:I

    .line 1230
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    move-object/from16 v0, v18

    iput v2, v0, Landroid/graphics/Point;->x:I

    .line 1231
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/Point;->y:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    mul-float/2addr v2, v4

    float-to-int v2, v2

    move-object/from16 v0, v18

    iput v2, v0, Landroid/graphics/Point;->y:I

    .line 1232
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "change position with ratio Point="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1233
    const-string/jumbo v5, " "

    .line 1232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1233
    const-string/jumbo v5, " output_rotation="

    .line 1232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1234
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->output_rotation:I

    .line 1232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1234
    const-string/jumbo v5, " mDirection[0]="

    .line 1232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1234
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    .line 1232
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1236
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/PanoramaModule;->mMoveSpeed:[I

    invoke-virtual {v2, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP;->getMoveSpeed([I)I

    .line 1238
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/4 v4, 0x5

    if-ne v2, v4, :cond_f

    const/4 v2, 0x1

    .line 1239
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/PanoramaModule;->mMoveSpeed:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    .line 1237
    move-object/from16 v0, v20

    invoke-interface {v0, v2, v4}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDirectionTooFast(ZI)V

    .line 1240
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewRefY:I

    move-object/from16 v0, v20

    invoke-interface {v0, v12, v2}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDirectionPosition(Landroid/graphics/Point;I)V

    .line 1242
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/PanoramaModule;->onPreviewMoving()V

    .line 1243
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/camera/module/PanoramaModule;->mCaptureOrientationDecided:Z

    if-nez v2, :cond_a

    .line 1244
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/PanoramaModule;->onCaptureOrientationDecided()V

    .line 1255
    .end local v12    # "attachedPos":Landroid/graphics/Point;
    .end local v13    # "canvas":Landroid/graphics/Canvas;
    .end local v15    # "dh":I
    .end local v16    # "dst":Landroid/graphics/Rect;
    .end local v17    # "dw":I
    .end local v18    # "guidePos":Landroid/graphics/Point;
    .end local v22    # "sh":I
    .end local v23    # "src":Landroid/graphics/Rect;
    .end local v24    # "sw":I
    :cond_a
    :goto_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDispPreviewImage:Landroid/graphics/Bitmap;

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V

    .line 1256
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onPreviewFrame: imageId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/PanoramaModule;->mImageID:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1257
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mImageID:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    if-ltz v2, :cond_b

    .line 1258
    move-object v14, v3

    .line 1261
    .local v14, "data2":[B
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mCaptureInfoList:Ljava/util/ArrayList;

    new-instance v4, Lcom/android/camera/module/PanoramaModule$CaptureInfo;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/module/PanoramaModule;->mImageID:[I

    const/4 v6, 0x0

    aget v5, v5, v6

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/camera/module/PanoramaModule;->mStatus:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5, v6}, Lcom/android/camera/module/PanoramaModule$CaptureInfo;-><init>(Lcom/android/camera/module/PanoramaModule;II)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1262
    new-instance v19, Landroid/os/Handler;

    invoke-direct/range {v19 .. v19}, Landroid/os/Handler;-><init>()V

    .line 1263
    .local v19, "mHandler":Landroid/os/Handler;
    new-instance v2, Lcom/android/camera/module/PanoramaModule$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/android/camera/module/PanoramaModule$1;-><init>(Lcom/android/camera/module/PanoramaModule;[B)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1288
    .end local v14    # "data2":[B
    .end local v19    # "mHandler":Landroid/os/Handler;
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    .line 1289
    sget-object v2, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onPreviewFrame<<prevDirection="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v25

    .line 1291
    return-void

    .line 1168
    :pswitch_1
    const/4 v2, 0x1

    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit v25

    .line 1169
    return-void

    .line 1173
    :pswitch_2
    const/4 v2, 0x1

    :try_start_4
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit v25

    .line 1174
    return-void

    .line 1176
    :pswitch_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mMorphoPanoramaGP:Lcom/android/camera/panorama/MorphoPanoramaGP;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/module/PanoramaModule;->mMoveSpeed:[I

    invoke-virtual {v2, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP;->getMoveSpeed([I)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_1

    .line 1142
    .end local v20    # "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    .end local v21    # "ret":I
    :catchall_0
    move-exception v2

    monitor-exit v25

    throw v2

    .line 1211
    .restart local v12    # "attachedPos":Landroid/graphics/Point;
    .restart local v13    # "canvas":Landroid/graphics/Canvas;
    .restart local v15    # "dh":I
    .restart local v16    # "dst":Landroid/graphics/Rect;
    .restart local v17    # "dw":I
    .restart local v18    # "guidePos":Landroid/graphics/Point;
    .restart local v20    # "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    .restart local v21    # "ret":I
    .restart local v22    # "sh":I
    .restart local v23    # "src":Landroid/graphics/Rect;
    .restart local v24    # "sw":I
    :pswitch_4
    :try_start_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->output_rotation:I

    if-eqz v2, :cond_c

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->output_rotation:I

    const/16 v4, 0xb4

    if-ne v2, v4, :cond_d

    .line 1212
    :cond_c
    iget v2, v12, Landroid/graphics/Point;->y:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    sub-int/2addr v2, v4

    iput v2, v12, Landroid/graphics/Point;->y:I

    .line 1213
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/Point;->y:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    sub-int/2addr v2, v4

    move-object/from16 v0, v18

    iput v2, v0, Landroid/graphics/Point;->y:I

    goto/16 :goto_2

    .line 1215
    :cond_d
    iget v2, v12, Landroid/graphics/Point;->x:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    sub-int/2addr v2, v4

    iput v2, v12, Landroid/graphics/Point;->x:I

    .line 1216
    move-object/from16 v0, v18

    iget v2, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/module/PanoramaModule;->mPreviewCroppingAdjustByAuto:I

    sub-int/2addr v2, v4

    move-object/from16 v0, v18

    iput v2, v0, Landroid/graphics/Point;->x:I

    goto/16 :goto_2

    .line 1222
    :cond_e
    move/from16 v0, v17

    int-to-float v2, v0

    move/from16 v0, v24

    int-to-float v4, v0

    div-float/2addr v2, v4

    goto/16 :goto_3

    .line 1238
    :cond_f
    const/4 v2, 0x0

    goto/16 :goto_4

    .line 1248
    .end local v12    # "attachedPos":Landroid/graphics/Point;
    .end local v13    # "canvas":Landroid/graphics/Canvas;
    .end local v15    # "dh":I
    .end local v16    # "dst":Landroid/graphics/Rect;
    .end local v17    # "dw":I
    .end local v18    # "guidePos":Landroid/graphics/Point;
    .end local v22    # "sh":I
    .end local v23    # "src":Landroid/graphics/Rect;
    .end local v24    # "sw":I
    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    if-eqz v2, :cond_a

    .line 1249
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/4 v4, 0x1

    if-eq v2, v4, :cond_a

    .line 1250
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/module/PanoramaModule;->mDirection:[I

    const/4 v4, 0x0

    aget v2, v2, v4

    const/16 v4, 0x8

    if-eq v2, v4, :cond_a

    .line 1251
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/PanoramaModule;->onCaptureOrientationDecided()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_5

    .line 1165
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 1208
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 203
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 232
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x33

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 227
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    .line 214
    if-nez p1, :cond_0

    .line 215
    return-void

    .line 217
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 218
    return-void

    .line 221
    :cond_1
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->updatePreferenceInWorkThread([I)V

    .line 222
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 208
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 705
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 706
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->keepScreenOnAwhile()V

    .line 707
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 0

    .prologue
    .line 664
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 0

    .prologue
    .line 659
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 4
    .param p1, "mode"    # I

    .prologue
    .line 577
    iget-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mPaused:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->getCameraState()I

    move-result v1

    if-nez v1, :cond_1

    .line 578
    :cond_0
    return-void

    .line 581
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/module/PanoramaModule;->setTriggerMode(I)V

    .line 583
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mSyncObj:Ljava/lang/Object;

    monitor-enter v2

    .line 584
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    if-nez v1, :cond_3

    .line 585
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 586
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 588
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 589
    const/16 v3, 0xa2

    .line 588
    invoke-virtual {v1, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 590
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 591
    return-void

    .line 594
    .end local v0    # "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_2
    const/4 v1, 0x2

    :try_start_1
    invoke-virtual {p0, v1}, Lcom/android/camera/module/PanoramaModule;->playCameraSound(I)V

    .line 595
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->startPanoramaShooting()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit v2

    .line 605
    return-void

    .line 597
    :cond_3
    :try_start_2
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isShootingTooShort()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 598
    sget-object v1, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "panorama shooting is too short, ignore this click"

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v2

    .line 599
    return-void

    .line 601
    :cond_4
    const/4 v1, 0x3

    :try_start_3
    invoke-virtual {p0, v1}, Lcom/android/camera/module/PanoramaModule;->playCameraSound(I)V

    .line 602
    const/4 v1, 0x1

    const/4 v3, 0x1

    invoke-direct {p0, v1, v3}, Lcom/android/camera/module/PanoramaModule;->stopPanoramaShooting(ZZ)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 583
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0
    .param p1, "pressed"    # Z
    .param p2, "from"    # I

    .prologue
    .line 629
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    .prologue
    .line 613
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 2
    .param p1, "in"    # Z

    .prologue
    .line 618
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/PanoramaModule;->onShutterButtonFocus(ZI)V

    .line 619
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 758
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 759
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .prologue
    .line 649
    iget-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mPaused:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isProcessingFinishTask()Z

    move-result v0

    if-nez v0, :cond_0

    .line 650
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object v0

    if-nez v0, :cond_1

    .line 651
    :cond_0
    return-void

    .line 653
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 654
    return-void
.end method

.method protected openSettingActivity()V
    .locals 4

    .prologue
    .line 348
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 349
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 350
    const-string/jumbo v1, "from_where"

    .line 351
    const/16 v2, 0xa6

    .line 350
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 352
    const-string/jumbo v1, ":miui:starting_window_label"

    .line 353
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0039

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 352
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 354
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 355
    const-string/jumbo v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 357
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 358
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 360
    iget v1, p0, Lcom/android/camera/module/PanoramaModule;->mModuleIndex:I

    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 361
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .prologue
    .line 808
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 809
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 810
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->setCameraState(I)V

    .line 811
    return-void
.end method

.method protected performVolumeKeyClicked(IZ)V
    .locals 1
    .param p1, "repeatCount"    # I
    .param p2, "pressed"    # Z

    .prologue
    .line 505
    if-nez p1, :cond_0

    if-eqz p2, :cond_0

    .line 506
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->onShutterButtonClick(I)V

    .line 508
    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 4

    .prologue
    .line 186
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 187
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 188
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    .line 189
    const/16 v2, 0xae

    .line 190
    const/16 v3, 0xa4

    .line 188
    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 191
    return-void
.end method

.method public requestRender()V
    .locals 3

    .prologue
    .line 1128
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1129
    const/16 v2, 0xb0

    .line 1128
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1130
    .local v0, "panorama":Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
    if-eqz v0, :cond_0

    .line 1131
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->requestRender()V

    .line 1133
    :cond_0
    return-void
.end method

.method public resumePreview()V
    .locals 2

    .prologue
    .line 815
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 816
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 817
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->setCameraState(I)V

    .line 818
    return-void
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    .prologue
    .line 1719
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1720
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 2
    .param p1, "available"    # Z

    .prologue
    .line 711
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    .line 713
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 715
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 716
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 718
    :cond_0
    return-void
.end method

.method public startPanoramaShooting()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 939
    sget-object v1, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "startPanoramaShooting"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 940
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->isProcessingFinishTask()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 941
    return-void

    .line 944
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->startPanoramaGP()Z

    .line 947
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP$InitParam;->direction:I

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mPrevDirection:I

    .line 948
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewCount:I

    .line 949
    iput v5, p0, Lcom/android/camera/module/PanoramaModule;->mCntReqShoot:I

    .line 950
    iput v5, p0, Lcom/android/camera/module/PanoramaModule;->mCntProcessed:I

    .line 951
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCaptureInfoList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 952
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/PanoramaModule;->mTimeTaken:J

    .line 953
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewDisplayRatio:F

    .line 954
    iput v4, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSkipCount:I

    .line 955
    iget v1, p0, Lcom/android/camera/module/PanoramaModule;->mOrientationCompensation:I

    iput v1, p0, Lcom/android/camera/module/PanoramaModule;->mDeviceOrientationAtCapture:I

    .line 956
    iput-boolean v4, p0, Lcom/android/camera/module/PanoramaModule;->mIsShooting:Z

    .line 959
    iget-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mAeLockSupported:Z

    if-eqz v1, :cond_1

    .line 960
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 962
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/PanoramaModule;->mAwbLockSupported:Z

    if-eqz v1, :cond_2

    .line 963
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v4}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 965
    :cond_2
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mLocation:Landroid/location/Location;

    .line 966
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mLocation:Landroid/location/Location;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    .line 967
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/PanoramaModule;->mSnapshotFocusMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 969
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v5}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    .line 970
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 971
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, p0}, Lcom/android/camera2/Camera2Proxy;->startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 974
    invoke-direct {p0}, Lcom/android/camera/module/PanoramaModule;->setShootUI()V

    .line 976
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 977
    const/16 v2, 0xa2

    .line 976
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 978
    .local v0, "actionProcessing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingStart()V

    .line 980
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/module/PanoramaModule;->mPanoramaShootingStartTime:J

    .line 981
    return-void
.end method

.method public startPreview()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 787
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 788
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startPreview: camera has been closed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 789
    return-void

    .line 792
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->checkDisplayOrientation()V

    .line 793
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/PanoramaModule;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDisplayOrientation(I)V

    .line 795
    iget-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mAeLockSupported:Z

    if-eqz v0, :cond_1

    .line 796
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 798
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/PanoramaModule;->mAwbLockSupported:Z

    if-eqz v0, :cond_2

    .line 799
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 801
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/PanoramaModule;->mTargetFocusMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 802
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 803
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/PanoramaModule;->setCameraState(I)V

    .line 804
    return-void
.end method

.method public startSession()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 768
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 769
    sget-object v0, Lcom/android/camera/module/PanoramaModule;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startPreview: camera has been closed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 770
    return-void

    .line 773
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 774
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    .line 775
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 776
    sget-boolean v0, Lcom/android/camera/Device;->IS_E2:Z

    if-nez v0, :cond_1

    sget-boolean v6, Lcom/android/camera/Device;->IS_E10:Z

    .line 777
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/PanoramaModule;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 778
    new-instance v1, Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 781
    if-eqz v6, :cond_2

    const v4, 0x8008

    .line 779
    :goto_1
    const/4 v2, 0x1

    move-object v5, p0

    .line 777
    invoke-virtual/range {v0 .. v5}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 783
    return-void

    .line 776
    :cond_1
    const/4 v6, 0x1

    .local v6, "panorama":Z
    goto :goto_0

    .end local v6    # "panorama":Z
    :cond_2
    move v4, v3

    .line 781
    goto :goto_1
.end method

.method protected trackModeCustomInfo(I)V
    .locals 0
    .param p1, "takenNum"    # I

    .prologue
    .line 1559
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTakenInPanorama(I)V

    .line 1560
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .prologue
    .line 195
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 196
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 197
    invoke-virtual {p0}, Lcom/android/camera/module/PanoramaModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 198
    return-void
.end method
