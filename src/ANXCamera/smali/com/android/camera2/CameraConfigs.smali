.class public Lcom/android/camera2/CameraConfigs;
.super Ljava/lang/Object;
.source "CameraConfigs.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAELocked:Z

.field private mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAWBLocked:Z

.field private mAiSceneDetectEnabled:Z

.field private mAiSceneDetectPeriod:I

.field private mAntiBanding:I

.field private mAwbCustomValue:I

.field private mAwbMode:I

.field private mBeautyValues:Lcom/android/camera/effect/BeautyValues;

.field private mBokehEnabled:Z

.field private mContrastLevel:I

.field private mDeviceOrientation:I

.field private mDualCamWaterMarkEnabled:Z

.field private mEISEnabled:Z

.field private mExposureCompensationIndex:I

.field private mExposureMeteringMode:I

.field private mExposureTime:J

.field private mFaceAgeAnalyzeEnabled:Z

.field private mFaceDetectionEnabled:Z

.field private mFaceScoreEnabled:Z

.field private mFaceWaterMarkEnabled:Z

.field private mFaceWaterMarkFormat:Ljava/lang/String;

.field private mFlashMode:I

.field private mFocusDistance:F

.field private mFocusMode:I

.field private mFrontMirror:Z

.field private mGpsLocation:Landroid/location/Location;

.field private mHDRCheckerEnabled:Z

.field private mHDREnabled:Z

.field private mHHTEnabled:Z

.field private mIso:I

.field private mJpegQuality:I

.field private mJpegRotation:I

.field private mLensDirtyDetectEnabled:Z

.field private mMfnrEnabled:Z

.field private mNeedFlash:Z

.field private mNeedPausePreview:Z

.field private mOISEnabled:Z

.field private mOptimizedFlash:Z

.field private mParallelEnabled:Z

.field private mParallelProcessingPath:Ljava/lang/String;

.field private mPhotoSize:Lcom/android/camera/CameraSize;

.field private mPreviewFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mPreviewSize:Lcom/android/camera/CameraSize;

.field private mSaturationLevel:I

.field private mSceneMode:I

.field private mSharpnessLevel:I

.field private mSuperResolutionEnabled:Z

.field private mThumbnailSize:Lcom/android/camera/CameraSize;

.field private mTimeWaterMarkEnabled:Z

.field private mTimeWatermarkValue:Ljava/lang/String;

.field private mVideoFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoSnapshotSize:Lcom/android/camera/CameraSize;

.field private mWaterMarkAppliedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomRatio:F

.field private mZslEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 76
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mParallelProcessingPath:Ljava/lang/String;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    .line 85
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 86
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 87
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 95
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 96
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAWBMode()I
    .locals 1

    .prologue
    .line 416
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    return v0
.end method

.method public getAiSceneDetectPeriod()I
    .locals 1

    .prologue
    .line 718
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    return v0
.end method

.method public getAntiBanding()I
    .locals 1

    .prologue
    .line 263
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    return v0
.end method

.method public getAwbCustomValue()I
    .locals 1

    .prologue
    .line 428
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    return v0
.end method

.method public getBeautyValues()Lcom/android/camera/effect/BeautyValues;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    return-object v0
.end method

.method public getContrastLevel()I
    .locals 1

    .prologue
    .line 665
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    .prologue
    .line 235
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    return v0
.end method

.method public getExposureCompensationIndex()I
    .locals 1

    .prologue
    .line 275
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    return v0
.end method

.method public getExposureMeteringMode()I
    .locals 1

    .prologue
    .line 702
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    return v0
.end method

.method public getExposureTime()J
    .locals 2

    .prologue
    .line 323
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    return-wide v0
.end method

.method public getFaceWaterMarkFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 821
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .prologue
    .line 338
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    return v0
.end method

.method public getFocusDistance()F
    .locals 1

    .prologue
    .line 390
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .prologue
    .line 377
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    return v0
.end method

.method public getGpsLocation()Landroid/location/Location;
    .locals 1

    .prologue
    .line 734
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getISO()I
    .locals 1

    .prologue
    .line 311
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    .prologue
    .line 211
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    .prologue
    .line 223
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    return v0
.end method

.method public getParallelProcessingPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mParallelProcessingPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getPreviewFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getSaturationLevel()I
    .locals 1

    .prologue
    .line 677
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    return v0
.end method

.method public getSceneMode()I
    .locals 1

    .prologue
    .line 454
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    return v0
.end method

.method public getSharpnessLevel()I
    .locals 1

    .prologue
    .line 689
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    return v0
.end method

.method public getThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 629
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getTimeWaterMarkValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 813
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoSnapshotSize()Lcom/android/camera/CameraSize;
    .locals 1

    .prologue
    .line 746
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getWaterMarkAppliedList()Ljava/util/List;
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
    .line 754
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    return v0
.end method

.method public isAELocked()Z
    .locals 1

    .prologue
    .line 287
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    return v0
.end method

.method public isAWBLocked()Z
    .locals 1

    .prologue
    .line 440
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    return v0
.end method

.method public isAiSceneDetectEnabled()Z
    .locals 1

    .prologue
    .line 706
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    return v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .prologue
    .line 600
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    return v0
.end method

.method public isEISEnabled()Z
    .locals 1

    .prologue
    .line 468
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    return v0
.end method

.method public isFaceAgeAnalyzeEnabled()Z
    .locals 1

    .prologue
    .line 576
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    return v0
.end method

.method public isFaceDetectionEnabled()Z
    .locals 1

    .prologue
    .line 641
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    return v0
.end method

.method public isFaceScoreEnabled()Z
    .locals 1

    .prologue
    .line 588
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    .prologue
    .line 841
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return v0
.end method

.method public isHDRCheckerEnabled()Z
    .locals 1

    .prologue
    .line 519
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    return v0
.end method

.method public isHDREnabled()Z
    .locals 1

    .prologue
    .line 506
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    return v0
.end method

.method public isHHTEnabled()Z
    .locals 1

    .prologue
    .line 493
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    return v0
.end method

.method public isLensDirtyDetectEnabled()Z
    .locals 1

    .prologue
    .line 612
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    return v0
.end method

.method public isMfnrEnabled()Z
    .locals 1

    .prologue
    .line 564
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    return v0
.end method

.method public isNeedFlash()Z
    .locals 1

    .prologue
    .line 362
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    return v0
.end method

.method public isOISEnabled()Z
    .locals 1

    .prologue
    .line 195
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return v0
.end method

.method public isParallelEnabled()Z
    .locals 1

    .prologue
    .line 536
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mParallelEnabled:Z

    return v0
.end method

.method public isSuperResolutionEnabled()Z
    .locals 1

    .prologue
    .line 532
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    return v0
.end method

.method public isZslEnabled()Z
    .locals 1

    .prologue
    .line 187
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return v0
.end method

.method public setAELock(Z)Z
    .locals 1
    .param p1, "locked"    # Z

    .prologue
    .line 279
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    if-eq v0, p1, :cond_0

    .line 280
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    .line 281
    const/4 v0, 0x1

    return v0

    .line 283
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1
    .param p1, "regions"    # [Landroid/hardware/camera2/params/MeteringRectangle;

    .prologue
    .line 291
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 292
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 293
    const/4 v0, 0x1

    return v0

    .line 295
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1
    .param p1, "regions"    # [Landroid/hardware/camera2/params/MeteringRectangle;

    .prologue
    .line 394
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 395
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 396
    const/4 v0, 0x1

    return v0

    .line 398
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAWBLock(Z)Z
    .locals 1
    .param p1, "locked"    # Z

    .prologue
    .line 432
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    if-eq v0, p1, :cond_0

    .line 433
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    .line 434
    const/4 v0, 0x1

    return v0

    .line 436
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAWBMode(I)Z
    .locals 1
    .param p1, "awbMode"    # I

    .prologue
    .line 408
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    if-eq v0, p1, :cond_0

    .line 409
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 410
    const/4 v0, 0x1

    return v0

    .line 412
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAiSceneDetectEnable(Z)Z
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 710
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 711
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    .line 712
    const/4 v0, 0x1

    return v0

    .line 714
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAiSceneDetectPeriod(I)Z
    .locals 1
    .param p1, "period"    # I

    .prologue
    .line 722
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    if-eq v0, p1, :cond_0

    .line 723
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    .line 724
    const/4 v0, 0x1

    return v0

    .line 726
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setAntiBanding(I)Z
    .locals 1
    .param p1, "antiBanding"    # I

    .prologue
    .line 255
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    if-eq v0, p1, :cond_0

    .line 256
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 257
    const/4 v0, 0x1

    return v0

    .line 259
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setBeautyValues(Lcom/android/camera/effect/BeautyValues;)V
    .locals 0
    .param p1, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/effect/BeautyValues;

    .line 112
    return-void
.end method

.method public setBokehEnabled(Z)Z
    .locals 1
    .param p1, "bokehEnabled"    # Z

    .prologue
    .line 568
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    if-eq v0, p1, :cond_0

    .line 569
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    .line 570
    const/4 v0, 0x1

    return v0

    .line 572
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setContrastLevel(I)Z
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 657
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    if-eq v0, p1, :cond_0

    .line 658
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 659
    const/4 v0, 0x1

    return v0

    .line 661
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setCustomAWB(I)Z
    .locals 1
    .param p1, "awbValue"    # I

    .prologue
    .line 420
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    if-eq v0, p1, :cond_0

    .line 421
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    .line 422
    const/4 v0, 0x1

    return v0

    .line 424
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setDeviceOrientation(I)Z
    .locals 1
    .param p1, "deviceOrientation"    # I

    .prologue
    .line 227
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    if-eq v0, p1, :cond_0

    .line 228
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 229
    const/4 v0, 0x1

    return v0

    .line 231
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setDualCamWaterMarkEnable(Z)Z
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 758
    const-string/jumbo v1, "device"

    iget-object v2, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 759
    .local v0, "contained":Z
    if-eqz p1, :cond_1

    .line 760
    if-nez v0, :cond_0

    .line 761
    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string/jumbo v2, "device"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 767
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    if-eq v1, p1, :cond_2

    .line 768
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 769
    const/4 v1, 0x1

    return v1

    .line 763
    :cond_1
    if-eqz v0, :cond_0

    .line 764
    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string/jumbo v2, "device"

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 771
    :cond_2
    const/4 v1, 0x0

    return v1
.end method

.method public setEnableEIS(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 460
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    if-eq v0, p1, :cond_0

    .line 461
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    .line 462
    const/4 v0, 0x1

    return v0

    .line 464
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setEnableOIS(Z)V
    .locals 0
    .param p1, "enableOIS"    # Z

    .prologue
    .line 191
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    .line 192
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 183
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    .line 184
    return-void
.end method

.method public setExposureCompensationIndex(I)Z
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 267
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    if-eq v0, p1, :cond_0

    .line 268
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    .line 269
    const/4 v0, 0x1

    return v0

    .line 271
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setExposureMeteringMode(I)Z
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 693
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    if-eq v0, p1, :cond_0

    .line 694
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 695
    const/4 v0, 0x1

    return v0

    .line 697
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setExposureTime(J)Z
    .locals 3
    .param p1, "exposureTime"    # J

    .prologue
    .line 315
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 316
    iput-wide p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    .line 317
    const/4 v0, 0x1

    return v0

    .line 319
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFaceAgeAnalyzeEnabled(Z)Z
    .locals 1
    .param p1, "faceAgeAnalyzeEnabled"    # Z

    .prologue
    .line 580
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    if-eq v0, p1, :cond_0

    .line 581
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    .line 582
    const/4 v0, 0x1

    return v0

    .line 584
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFaceDetectionEnabled(Z)Z
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 633
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 634
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    .line 635
    const/4 v0, 0x1

    return v0

    .line 637
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFaceScoreEnabled(Z)Z
    .locals 1
    .param p1, "faceScoreEnabled"    # Z

    .prologue
    .line 592
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    if-eq v0, p1, :cond_0

    .line 593
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    .line 594
    const/4 v0, 0x1

    return v0

    .line 596
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFaceWaterMarkEnable(Z)Z
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 792
    const-string/jumbo v1, "beautify"

    iget-object v2, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 793
    .local v0, "contained":Z
    if-eqz p1, :cond_1

    .line 794
    if-nez v0, :cond_0

    .line 795
    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string/jumbo v2, "beautify"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 801
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    if-eq v1, p1, :cond_2

    .line 802
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 803
    const/4 v1, 0x1

    return v1

    .line 797
    :cond_1
    if-eqz v0, :cond_0

    .line 798
    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string/jumbo v2, "beautify"

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 805
    :cond_2
    const/4 v1, 0x0

    return v1
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 0
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 817
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 818
    return-void
.end method

.method public setFlashMode(I)Z
    .locals 1
    .param p1, "flashMode"    # I

    .prologue
    .line 329
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    if-eq v0, p1, :cond_0

    .line 330
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 331
    const/4 v0, 0x1

    return v0

    .line 333
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFocusDistance(F)Z
    .locals 1
    .param p1, "focusDistance"    # F

    .prologue
    .line 381
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 382
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    .line 383
    const/4 v0, 0x1

    return v0

    .line 386
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFocusMode(I)Z
    .locals 1
    .param p1, "focusMode"    # I

    .prologue
    .line 368
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    if-eq v0, p1, :cond_0

    .line 369
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 370
    const/4 v0, 0x1

    return v0

    .line 372
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setFrontMirror(Z)V
    .locals 0
    .param p1, "frontMirror"    # Z

    .prologue
    .line 837
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    .line 838
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 0
    .param p1, "loc"    # Landroid/location/Location;

    .prologue
    .line 730
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    .line 731
    return-void
.end method

.method public setHDRCheckerEnabled(Z)Z
    .locals 1
    .param p1, "hdrCheckerEnabled"    # Z

    .prologue
    .line 510
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    if-eq v0, p1, :cond_0

    .line 511
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    .line 512
    const/4 v0, 0x1

    return v0

    .line 515
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setHDREnabled(Z)Z
    .locals 1
    .param p1, "hdrEnabled"    # Z

    .prologue
    .line 497
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    if-eq v0, p1, :cond_0

    .line 498
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    .line 499
    const/4 v0, 0x1

    return v0

    .line 502
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setHHTEnabled(Z)Z
    .locals 1
    .param p1, "hhtEnabled"    # Z

    .prologue
    .line 484
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    if-eq v0, p1, :cond_0

    .line 485
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    .line 486
    const/4 v0, 0x1

    return v0

    .line 489
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setISO(I)Z
    .locals 1
    .param p1, "iso"    # I

    .prologue
    .line 303
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    if-eq v0, p1, :cond_0

    .line 304
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    .line 305
    const/4 v0, 0x1

    return v0

    .line 307
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setJpegQuality(I)Z
    .locals 4
    .param p1, "quality"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 199
    if-lt p1, v1, :cond_0

    const/16 v0, 0x64

    if-le p1, v0, :cond_1

    .line 200
    :cond_0
    sget-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setJpegQuality: invalid jpeg quality "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    return v3

    .line 203
    :cond_1
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    if-eq v0, p1, :cond_2

    .line 204
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 205
    return v1

    .line 207
    :cond_2
    return v3
.end method

.method public setJpegRotation(I)Z
    .locals 1
    .param p1, "jpegRotation"    # I

    .prologue
    .line 215
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    if-eq v0, p1, :cond_0

    .line 216
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 217
    const/4 v0, 0x1

    return v0

    .line 219
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setLensDirtyDetectEnabled(Z)Z
    .locals 1
    .param p1, "lensDirtyDetectEnabled"    # Z

    .prologue
    .line 604
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 605
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    .line 606
    const/4 v0, 0x1

    return v0

    .line 608
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setMfnrEnabled(Z)Z
    .locals 1
    .param p1, "mfnrEnabled"    # Z

    .prologue
    .line 556
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 557
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    .line 558
    const/4 v0, 0x1

    return v0

    .line 560
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setNeedFlash(Z)Z
    .locals 1
    .param p1, "needFlash"    # Z

    .prologue
    .line 354
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    if-eq v0, p1, :cond_0

    .line 355
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    .line 356
    const/4 v0, 0x1

    return v0

    .line 358
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setOptimizedFlash(Z)Z
    .locals 1
    .param p1, "optimizedFlash"    # Z

    .prologue
    .line 342
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    if-eq v0, p1, :cond_0

    .line 343
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    .line 344
    const/4 v0, 0x1

    return v0

    .line 346
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setParallelEnabled(Z)Z
    .locals 1
    .param p1, "parallelEnabled"    # Z

    .prologue
    .line 540
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mParallelEnabled:Z

    if-eq v0, p1, :cond_0

    .line 541
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mParallelEnabled:Z

    .line 542
    const/4 v0, 0x1

    return v0

    .line 544
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setParallelProcessingPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "parallelProcessingPath"    # Ljava/lang/String;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mParallelProcessingPath:Ljava/lang/String;

    .line 553
    return-void
.end method

.method public setPausePreview(Z)Z
    .locals 1
    .param p1, "pausePreview"    # Z

    .prologue
    .line 825
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    if-eq v0, p1, :cond_0

    .line 826
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 827
    const/4 v0, 0x1

    return v0

    .line 829
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1
    .param p1, "photoSize"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 160
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    .line 161
    const/4 v0, 0x1

    return v0

    .line 163
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setPreviewFpsRange(Landroid/util/Range;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    .line 123
    const/4 v0, 0x1

    return v0

    .line 125
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1
    .param p1, "previewSize"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 135
    const/4 v0, 0x1

    return v0

    .line 137
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setSaturationLevel(I)Z
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 669
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    if-eq v0, p1, :cond_0

    .line 670
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 671
    const/4 v0, 0x1

    return v0

    .line 673
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setSceneMode(I)Z
    .locals 1
    .param p1, "sceneMode"    # I

    .prologue
    .line 446
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    if-eq v0, p1, :cond_0

    .line 447
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    .line 448
    const/4 v0, 0x1

    return v0

    .line 450
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setSharpnessLevel(I)Z
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 681
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    if-eq v0, p1, :cond_0

    .line 682
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 683
    const/4 v0, 0x1

    return v0

    .line 685
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setSuperResolutionEnabled(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 523
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 524
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    .line 525
    const/4 v0, 0x1

    return v0

    .line 528
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setThumbnailSize(Lcom/android/camera/CameraSize;)Z
    .locals 1
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 616
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 617
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    .line 618
    const/4 v0, 0x1

    return v0

    .line 620
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setTimeWaterMarkEnable(Z)Z
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    .line 775
    const-string/jumbo v1, "watermark"

    iget-object v2, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 776
    .local v0, "contained":Z
    if-eqz p1, :cond_1

    .line 777
    if-nez v0, :cond_0

    .line 778
    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string/jumbo v2, "watermark"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 784
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    if-eq v1, p1, :cond_2

    .line 785
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 786
    const/4 v1, 0x1

    return v1

    .line 780
    :cond_1
    if-eqz v0, :cond_0

    .line 781
    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string/jumbo v2, "watermark"

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 788
    :cond_2
    const/4 v1, 0x0

    return v1
.end method

.method public setTimeWaterMarkValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 809
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 810
    return-void
.end method

.method public setVideoFpsRange(Landroid/util/Range;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "fpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 100
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    .line 101
    const/4 v0, 0x1

    return v0

    .line 103
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 0
    .param p1, "size"    # Lcom/android/camera/CameraSize;

    .prologue
    .line 750
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    .line 751
    return-void
.end method

.method public setZoomRatio(F)Z
    .locals 4
    .param p1, "ratio"    # F

    .prologue
    .line 241
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 242
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 243
    const/4 v0, 0x1

    return v0

    .line 245
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
