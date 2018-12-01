.class public abstract Lcom/android/camera2/Camera2Proxy;
.super Ljava/lang/Object;
.source "Camera2Proxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;,
        Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;,
        Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;,
        Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;,
        Lcom/android/camera2/Camera2Proxy$FocusCallback;,
        Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;,
        Lcom/android/camera2/Camera2Proxy$PictureCallback;,
        Lcom/android/camera2/Camera2Proxy$PreviewCallback;,
        Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;,
        Lcom/android/camera2/Camera2Proxy$ShutterCallback;,
        Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    }
.end annotation


# instance fields
.field protected final mCameraId:I

.field protected mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

.field protected mFaceCallback:Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;

.field protected mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;

.field protected mHDRCheckerCallback:Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;

.field protected mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

.field private mPictureCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

.field private final mPictureCallBackLock:Ljava/lang/Object;

.field protected mPortraitDepthImageCallback:Lcom/android/camera2/Camera2Proxy$PictureCallback;

.field protected mPortraitRawImageCallback:Lcom/android/camera2/Camera2Proxy$PictureCallback;

.field private mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

.field private final mPreviewCallbackLock:Ljava/lang/Object;

.field protected mRawCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

.field protected mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

.field protected mShutterCallback:Lcom/android/camera2/Camera2Proxy$ShutterCallback;

.field private final mShutterCallbackLock:Ljava/lang/Object;

.field protected mVideoSnapshotCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBackLock:Ljava/lang/Object;

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallbackLock:Ljava/lang/Object;

    .line 52
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mShutterCallbackLock:Ljava/lang/Object;

    .line 63
    iput p1, p0, Lcom/android/camera2/Camera2Proxy;->mCameraId:I

    .line 64
    return-void
.end method


# virtual methods
.method public abstract cancelFocus(I)V
.end method

.method public abstract captureAbortBurst()V
.end method

.method public abstract captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;)V
.end method

.method public abstract captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
.end method

.method public abstract close()V
.end method

.method public abstract getCapabilities()Lcom/android/camera2/CameraCapabilities;
.end method

.method public abstract getFlashMode()I
.end method

.method public abstract getFocusMode()I
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Lcom/android/camera2/Camera2Proxy;->mCameraId:I

    return v0
.end method

.method public abstract getMetaDataCallback()Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;
.end method

.method getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;
    .locals 2

    .prologue
    .line 454
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 455
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 454
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public abstract getPictureSize()Lcom/android/camera/CameraSize;
.end method

.method getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    .locals 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 467
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 466
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public abstract getPreviewSize()Lcom/android/camera/CameraSize;
.end method

.method getShutterCallback()Lcom/android/camera2/Camera2Proxy$ShutterCallback;
    .locals 2

    .prologue
    .line 478
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mShutterCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 479
    :try_start_0
    iget-object v1, p0, Lcom/android/camera2/Camera2Proxy;->mShutterCallback:Lcom/android/camera2/Camera2Proxy$ShutterCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 478
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public abstract isBokehEnabled()Z
.end method

.method public abstract isNeedFlashOn()Z
.end method

.method public abstract isNeedPreviewThumbnail()Z
.end method

.method public abstract isSessionReady()Z
.end method

.method public abstract lockExposure(Z)V
.end method

.method protected notifyOnError(I)V
    .locals 1
    .param p1, "error"    # I

    .prologue
    .line 216
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

    invoke-interface {v0, p0, p1}, Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;->onCameraError(Lcom/android/camera2/Camera2Proxy;I)V

    .line 219
    :cond_0
    return-void
.end method

.method public abstract notifyVideoStreamEnd()V
.end method

.method public abstract pausePreview()V
.end method

.method public abstract releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract releasePictureCallback()V
.end method

.method public abstract releasePreview()V
.end method

.method public abstract resetConfigs()V
.end method

.method public abstract resumePreview()V
.end method

.method public abstract setAELock(Z)V
.end method

.method public abstract setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
.end method

.method public abstract setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
.end method

.method public abstract setASD(Z)V
.end method

.method public abstract setASDPeriod(I)V
.end method

.method public abstract setAWBLock(Z)V
.end method

.method public abstract setAWBMode(I)V
.end method

.method public abstract setAntiBanding(I)V
.end method

.method public abstract setBeautyValues(Lcom/android/camera/effect/BeautyValues;)V
.end method

.method public abstract setBokeh(Z)V
.end method

.method public abstract setContrast(I)V
.end method

.method public abstract setCustomAWB(I)V
.end method

.method public abstract setDeviceOrientation(I)V
.end method

.method public abstract setDisplayOrientation(I)V
.end method

.method public abstract setDualCamWaterMarkEnable(Z)V
.end method

.method public abstract setEnableEIS(Z)V
.end method

.method public abstract setEnableOIS(Z)V
.end method

.method public abstract setEnableZsl(Z)V
.end method

.method public setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V
    .locals 0
    .param p1, "cb"    # Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 202
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mErrorCallback:Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;

    .line 203
    return-void
.end method

.method public abstract setExposureCompensation(I)V
.end method

.method public abstract setExposureMeteringMode(I)V
.end method

.method public abstract setExposureTime(J)V
.end method

.method public abstract setFaceAgeAnalyze(Z)V
.end method

.method public abstract setFaceDetectionCallback(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;)V
.end method

.method public abstract setFaceScore(Z)V
.end method

.method public abstract setFaceWaterMarkEnable(Z)V
.end method

.method public abstract setFaceWaterMarkFormat(Ljava/lang/String;)V
.end method

.method public abstract setFlashMode(I)V
.end method

.method public abstract setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V
.end method

.method public abstract setFocusDistance(F)V
.end method

.method public abstract setFocusMode(I)V
.end method

.method public abstract setFpsRange(Landroid/util/Range;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setFrontMirror(Z)V
.end method

.method public abstract setGpsLocation(Landroid/location/Location;)V
.end method

.method public abstract setHDR(Z)V
.end method

.method public abstract setHDRCheckerCallback(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V
.end method

.method public abstract setHDRCheckerEnable(Z)V
.end method

.method public abstract setHHT(Z)V
.end method

.method public abstract setISO(I)V
.end method

.method public abstract setJpegQuality(I)V
.end method

.method public abstract setJpegRotation(I)V
.end method

.method public abstract setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setLensDirtyDetect(Z)V
.end method

.method public abstract setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V
.end method

.method public abstract setMfnr(Z)V
.end method

.method public abstract setNeedPausePreview(Z)V
.end method

.method public abstract setOpticalZoomToTele(Z)V
.end method

.method public abstract setOptimizedFlash(Z)V
.end method

.method public abstract setParallelProcessingEnable(ZLjava/lang/String;)V
.end method

.method setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 2
    .param p1, "callback"    # Lcom/android/camera2/Camera2Proxy$PictureCallback;

    .prologue
    .line 448
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 449
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mPictureCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 451
    return-void

    .line 448
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public abstract setPictureSize(Lcom/android/camera/CameraSize;)V
.end method

.method setPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V
    .locals 2
    .param p1, "mPreviewCallback"    # Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    .prologue
    .line 460
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 461
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 463
    return-void

    .line 460
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public abstract setPreviewSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setSaturation(I)V
.end method

.method public abstract setSceneMode(I)V
.end method

.method public abstract setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V
.end method

.method public abstract setSharpness(I)V
.end method

.method setShutterCallback(Lcom/android/camera2/Camera2Proxy$ShutterCallback;)V
    .locals 2
    .param p1, "mShutterCallback"    # Lcom/android/camera2/Camera2Proxy$ShutterCallback;

    .prologue
    .line 472
    iget-object v0, p0, Lcom/android/camera2/Camera2Proxy;->mShutterCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 473
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/Camera2Proxy;->mShutterCallback:Lcom/android/camera2/Camera2Proxy$ShutterCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    .line 475
    return-void

    .line 472
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public abstract setSuperResolution(Z)V
.end method

.method public abstract setTimeWaterMarkEnable(Z)V
.end method

.method public abstract setTimeWatermarkValue(Ljava/lang/String;)V
.end method

.method public abstract setVideoFpsRange(Landroid/util/Range;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
.end method

.method public abstract setZoomRatio(F)V
.end method

.method public abstract startFaceDetection()V
.end method

.method public abstract startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V
.end method

.method public abstract startHighSpeedRecordPreview()V
.end method

.method public abstract startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
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
.end method

.method public abstract startHighSpeedRecording()V
.end method

.method public abstract startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$PreviewCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
.end method

.method public abstract startRecordPreview()V
.end method

.method public abstract startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract startRecording()V
.end method

.method public abstract stopFaceDetection()V
.end method

.method public abstract stopPreviewCallback(Z)V
.end method

.method public abstract stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V
.end method

.method public abstract takePicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$ShutterCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract takePortraitPicture(Lcom/android/camera2/Camera2Proxy$ShutterCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .param p1    # Lcom/android/camera2/Camera2Proxy$ShutterCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " - cameraId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera2/Camera2Proxy;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
