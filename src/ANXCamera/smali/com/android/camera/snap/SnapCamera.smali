.class public Lcom/android/camera/snap/SnapCamera;
.super Ljava/lang/Object;
.source "SnapCamera.java"

# interfaces
.implements Landroid/media/MediaRecorder$OnErrorListener;
.implements Landroid/media/MediaRecorder$OnInfoListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x1a
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/snap/SnapCamera$1;,
        Lcom/android/camera/snap/SnapCamera$2;,
        Lcom/android/camera/snap/SnapCamera$3;,
        Lcom/android/camera/snap/SnapCamera$4;,
        Lcom/android/camera/snap/SnapCamera$SnapStatusListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

.field private mCameraDevice:Landroid/hardware/camera2/CameraDevice;

.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraId:I

.field private mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field private final mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field private mContentValues:Landroid/content/ContentValues;

.field private mContext:Landroid/content/Context;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mHeight:I

.field private mIsCamcorder:Z

.field private mMainHandler:Landroid/os/Handler;

.field private mMediaRecorder:Landroid/media/MediaRecorder;

.field private mOrientation:I

.field private mOrientationListener:Landroid/view/OrientationEventListener;

.field private final mPhotoAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

.field private mPhotoImageReader:Landroid/media/ImageReader;

.field private mPreviewSurface:Landroid/view/Surface;

.field private mProfile:Landroid/media/CamcorderProfile;

.field private mRecording:Z

.field private mSessionCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

.field private mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mWidth:I


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/snap/SnapCamera;)Landroid/hardware/camera2/CameraDevice;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/snap/SnapCamera;)Landroid/media/MediaRecorder;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/snap/SnapCamera;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    iget v0, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/snap/SnapCamera;)Lcom/android/camera/snap/SnapCamera$SnapStatusListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/snap/SnapCamera;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;
    .param p1, "-value"    # Landroid/hardware/camera2/CameraDevice;

    .prologue
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object p1
.end method

.method static synthetic -set1(Lcom/android/camera/snap/SnapCamera;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;
    .param p1, "-value"    # Landroid/hardware/camera2/CameraCaptureSession;

    .prologue
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p1
.end method

.method static synthetic -set2(Lcom/android/camera/snap/SnapCamera;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    return p1
.end method

.method static synthetic -set3(Lcom/android/camera/snap/SnapCamera;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/snap/SnapCamera;->mRecording:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->capture()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/snap/SnapCamera;[B)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;
    .param p1, "jpegData"    # [B

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/snap/SnapCamera;->onPictureTaken([B)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->startPreview()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapCamera;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->stopCamcorder()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/snap/SnapCamera$SnapStatusListener;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    .prologue
    const/4 v1, 0x0

    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-boolean v1, p0, Lcom/android/camera/snap/SnapCamera;->mIsCamcorder:Z

    .line 90
    iput v1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    .line 96
    iput-boolean v1, p0, Lcom/android/camera/snap/SnapCamera;->mRecording:Z

    .line 108
    new-instance v1, Lcom/android/camera/snap/SnapCamera$1;

    invoke-direct {v1, p0}, Lcom/android/camera/snap/SnapCamera$1;-><init>(Lcom/android/camera/snap/SnapCamera;)V

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mSessionCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 130
    new-instance v1, Lcom/android/camera/snap/SnapCamera$2;

    invoke-direct {v1, p0}, Lcom/android/camera/snap/SnapCamera$2;-><init>(Lcom/android/camera/snap/SnapCamera;)V

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 430
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    .line 621
    new-instance v1, Lcom/android/camera/snap/SnapCamera$3;

    invoke-direct {v1, p0}, Lcom/android/camera/snap/SnapCamera$3;-><init>(Lcom/android/camera/snap/SnapCamera;)V

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 645
    new-instance v1, Lcom/android/camera/snap/SnapCamera$4;

    invoke-direct {v1, p0}, Lcom/android/camera/snap/SnapCamera$4;-><init>(Lcom/android/camera/snap/SnapCamera;)V

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 159
    :try_start_0
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 160
    iput-object p2, p0, Lcom/android/camera/snap/SnapCamera;->mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    .line 161
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    .line 163
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->initHandler()V

    .line 164
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->initSnapType()V

    .line 165
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->initOrientationListener()V

    .line 166
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->initCamera()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    :goto_0
    return-void

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "init failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .prologue
    const/4 v2, 0x1

    .line 295
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 296
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 297
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 296
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 298
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 299
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 300
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 301
    return-void
.end method

.method private declared-synchronized capture()V
    .locals 8

    .prologue
    monitor-enter p0

    .line 342
    :try_start_0
    iget-object v4, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v3

    .line 343
    .local v3, "requestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v4, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v4}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 344
    iget v4, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    iget v5, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    invoke-static {v4, v5}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v1

    .line 345
    .local v1, "jpegOrientation":I
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 346
    sget-object v4, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "orientation="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v2

    .line 348
    .local v2, "location":Landroid/location/Location;
    if-eqz v2, :cond_0

    .line 349
    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->JPEG_GPS_LOCATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v3, v4, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 351
    :cond_0
    iget-object v4, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v4, v5, v6, v7}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "jpegOrientation":I
    .end local v2    # "location":Landroid/location/Location;
    .end local v3    # "requestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    monitor-exit p0

    .line 355
    return-void

    .line 352
    :catch_0
    move-exception v0

    .line 353
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_1
    sget-object v4, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "takeSnap: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "e":Landroid/hardware/camera2/CameraAccessException;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method private initCamera()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 212
    iput v9, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    .line 213
    iget-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 214
    const-string/jumbo v8, "persist.camera.snap.auto_switch"

    .line 213
    invoke-static {v7, v8, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    .line 214
    const/4 v8, 0x1

    .line 213
    if-ne v7, v8, :cond_0

    .line 217
    invoke-static {}, Lcom/android/camera/CameraSettings;->readPreferredCameraId()I

    move-result v7

    iput v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    .line 220
    :cond_0
    iget-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "camera"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/CameraManager;

    .line 222
    .local v2, "cameraManager":Landroid/hardware/camera2/CameraManager;
    :try_start_0
    iget v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "cameraIdStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v7, v8}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V

    .line 225
    invoke-virtual {v2, v1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v0

    .line 226
    .local v0, "cameraCharacteristics":Landroid/hardware/camera2/CameraCharacteristics;
    new-instance v7, Lcom/android/camera2/CameraCapabilities;

    invoke-direct {v7, v0}, Lcom/android/camera2/CameraCapabilities;-><init>(Landroid/hardware/camera2/CameraCharacteristics;)V

    iput-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    invoke-virtual {p0}, Lcom/android/camera/snap/SnapCamera;->isCamcorder()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 233
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPreferVideoQuality()I

    move-result v6

    .line 234
    .local v6, "videoQuality":I
    iget v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    invoke-static {v7, v6}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 235
    iget v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    invoke-static {v7, v6}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v7

    iput-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    .line 252
    .end local v6    # "videoQuality":I
    :goto_0
    return-void

    .line 227
    .end local v0    # "cameraCharacteristics":Landroid/hardware/camera2/CameraCharacteristics;
    .end local v1    # "cameraIdStr":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 228
    .local v3, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "initCamera: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 229
    return-void

    .line 237
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "cameraCharacteristics":Landroid/hardware/camera2/CameraCharacteristics;
    .restart local v1    # "cameraIdStr":Ljava/lang/String;
    .restart local v6    # "videoQuality":I
    :cond_1
    sget-object v7, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "invalid camcorder profile "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    iget v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraId:I

    const/4 v8, 0x5

    invoke-static {v7, v8}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v7

    iput-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    goto :goto_0

    .line 241
    .end local v6    # "videoQuality":I
    :cond_2
    new-instance v7, Landroid/graphics/SurfaceTexture;

    invoke-direct {v7, v9}, Landroid/graphics/SurfaceTexture;-><init>(Z)V

    iput-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 242
    new-instance v7, Landroid/view/Surface;

    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v7, v8}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mPreviewSurface:Landroid/view/Surface;

    .line 245
    iget-object v7, p0, Lcom/android/camera/snap/SnapCamera;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v8, 0x100

    invoke-virtual {v7, v8}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v5

    .line 246
    .local v5, "supported":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/CameraSize;>;"
    invoke-static {v5, v9}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;I)V

    .line 247
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v4

    .line 248
    .local v4, "pictureSize":Lcom/android/camera/CameraSize;
    invoke-direct {p0, v4}, Lcom/android/camera/snap/SnapCamera;->preparePhotoImageReader(Lcom/android/camera/CameraSize;)V

    .line 249
    iget v7, v4, Lcom/android/camera/CameraSize;->width:I

    iput v7, p0, Lcom/android/camera/snap/SnapCamera;->mWidth:I

    .line 250
    iget v7, v4, Lcom/android/camera/CameraSize;->height:I

    iput v7, p0, Lcom/android/camera/snap/SnapCamera;->mHeight:I

    goto :goto_0
.end method

.method private initHandler()V
    .locals 2

    .prologue
    .line 193
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "SnapCameraThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mHandlerThread:Landroid/os/HandlerThread;

    .line 194
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 195
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mCameraHandler:Landroid/os/Handler;

    .line 196
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mMainHandler:Landroid/os/Handler;

    .line 197
    return-void
.end method

.method private initOrientationListener()V
    .locals 3

    .prologue
    .line 255
    new-instance v1, Lcom/android/camera/snap/SnapCamera$5;

    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    .line 256
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->sensorHasLatency()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    .line 255
    :goto_0
    invoke-direct {v1, p0, v2, v0}, Lcom/android/camera/snap/SnapCamera$5;-><init>(Lcom/android/camera/snap/SnapCamera;Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 264
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->canDetectOrientation()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 265
    sget-object v0, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "Can detect orientation"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 271
    :goto_1
    return-void

    .line 256
    :cond_0
    const/4 v0, 0x3

    goto :goto_0

    .line 268
    :cond_1
    sget-object v0, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "Cannot detect orientation"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    goto :goto_1
.end method

.method private initSnapType()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 200
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 201
    const-string/jumbo v2, "key_long_press_volume_down"

    .line 200
    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "snapType":Ljava/lang/String;
    const-string/jumbo v1, "Street-snap-picture"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 203
    iput-boolean v3, p0, Lcom/android/camera/snap/SnapCamera;->mIsCamcorder:Z

    .line 209
    :goto_0
    return-void

    .line 204
    :cond_0
    const-string/jumbo v1, "Street-snap-movie"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 205
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/snap/SnapCamera;->mIsCamcorder:Z

    goto :goto_0

    .line 207
    :cond_1
    iput-boolean v3, p0, Lcom/android/camera/snap/SnapCamera;->mIsCamcorder:Z

    goto :goto_0
.end method

.method public static isSnapEnabled(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 173
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    .line 174
    const-string/jumbo v3, "pref_camera_snap_key"

    .line 173
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "snapValue":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 176
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 177
    const-string/jumbo v3, "key_long_press_volume_down"

    .line 178
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 176
    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 179
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    const-string/jumbo v3, "pref_camera_snap_key"

    invoke-interface {v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 181
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 182
    const-string/jumbo v3, "key_long_press_volume_down"

    .line 181
    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "snapType":Ljava/lang/String;
    const-string/jumbo v2, "public_transportation_shortcuts"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 184
    const-string/jumbo v2, "none"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 183
    if-eqz v2, :cond_2

    .line 186
    :cond_1
    const/4 v2, 0x0

    return v2

    .line 188
    :cond_2
    const/4 v2, 0x1

    return v2
.end method

.method private onPictureTaken([B)V
    .locals 15
    .param p1, "jpegData"    # [B

    .prologue
    .line 405
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "_SNAP"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 406
    .local v1, "title":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v4

    .line 407
    .local v4, "loc":Landroid/location/Location;
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v5

    .line 408
    .local v5, "orientation":I
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    .line 410
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 414
    iget v7, p0, Lcom/android/camera/snap/SnapCamera;->mWidth:I

    .line 415
    iget v8, p0, Lcom/android/camera/snap/SnapCamera;->mHeight:I

    .line 416
    const/4 v9, 0x0

    .line 417
    const/4 v10, 0x0

    .line 418
    const/4 v11, 0x0

    .line 419
    const/4 v12, 0x0

    move-object/from16 v6, p1

    .line 408
    invoke-static/range {v0 .. v12}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZLjava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    .line 421
    .local v14, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    if-eqz v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    invoke-interface {v0, v14}, Lcom/android/camera/snap/SnapCamera$SnapStatusListener;->onDone(Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 427
    .end local v1    # "title":Ljava/lang/String;
    .end local v4    # "loc":Landroid/location/Location;
    .end local v5    # "orientation":I
    .end local v14    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-void

    .line 424
    :catch_0
    move-exception v13

    .line 425
    .local v13, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "save picture failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v13}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private preparePhotoImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4
    .param p1, "size"    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 306
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 307
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 309
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    .line 310
    const/16 v2, 0x100

    const/4 v3, 0x2

    .line 309
    invoke-static {v0, v1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoImageReader:Landroid/media/ImageReader;

    .line 311
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoImageReader:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 312
    return-void
.end method

.method private static sensorHasLatency()Z
    .locals 1

    .prologue
    .line 315
    sget-boolean v0, Lcom/android/camera/Device;->IS_D4:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_C1:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_D5:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/android/camera/Device;->IS_D2:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private setRecorderOrientationHint()V
    .locals 5

    .prologue
    .line 507
    const/4 v0, 0x0

    .line 508
    .local v0, "rotation":I
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v1

    .line 509
    .local v1, "sensorOrientation":I
    iget v2, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 510
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getFacing()I

    move-result v2

    if-nez v2, :cond_0

    .line 511
    iget v2, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    sub-int v2, v1, v2

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v0, v2, 0x168

    .line 518
    :goto_0
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setOrientationHint: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v2, v0}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    .line 520
    return-void

    .line 513
    :cond_0
    iget v2, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    add-int/2addr v2, v1

    rem-int/lit16 v0, v2, 0x168

    goto :goto_0

    .line 516
    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private setupMediaRecorder()V
    .locals 18

    .prologue
    .line 433
    new-instance v14, Landroid/media/MediaRecorder;

    invoke-direct {v14}, Landroid/media/MediaRecorder;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 435
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v15, 0x5

    invoke-virtual {v14, v15}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 436
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    const/4 v15, 0x2

    invoke-virtual {v14, v15}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 437
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    const v15, 0x493e0

    iput v15, v14, Landroid/media/CamcorderProfile;->duration:I

    .line 442
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    invoke-virtual {v14, v15}, Landroid/media/MediaRecorder;->setProfile(Landroid/media/CamcorderProfile;)V

    .line 443
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    iget v15, v15, Landroid/media/CamcorderProfile;->duration:I

    invoke-virtual {v14, v15}, Landroid/media/MediaRecorder;->setMaxDuration(I)V

    .line 445
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v7

    .line 446
    .local v7, "loc":Landroid/location/Location;
    if-eqz v7, :cond_0

    .line 447
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v7}, Landroid/location/Location;->getLatitude()D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v15, v0

    invoke-virtual {v7}, Landroid/location/Location;->getLongitude()D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Landroid/media/MediaRecorder;->setLocation(FF)V

    .line 450
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 451
    .local v2, "dateTaken":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    const v15, 0x7f0f00ba

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 452
    .local v12, "pattern":Ljava/lang/String;
    new-instance v14, Ljava/text/SimpleDateFormat;

    sget-object v15, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v14, v12, v15}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 454
    .local v13, "title":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "_SNAP"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 455
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    iget v15, v15, Landroid/media/CamcorderProfile;->fileFormat:I

    invoke-static {v15}, Lcom/android/camera/module/VideoModule;->convertOutputFormatToFileExt(I)Ljava/lang/String;

    move-result-object v15

    .line 454
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 456
    .local v6, "filename":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    iget v14, v14, Landroid/media/CamcorderProfile;->fileFormat:I

    invoke-static {v14}, Lcom/android/camera/module/VideoModule;->convertOutputFormatToMimeType(I)Ljava/lang/String;

    move-result-object v10

    .line 457
    .local v10, "mime":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v15, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x2f

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 458
    .local v11, "path":Ljava/lang/String;
    new-instance v14, Landroid/content/ContentValues;

    const/4 v15, 0x7

    invoke-direct {v14, v15}, Landroid/content/ContentValues;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    .line 459
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "title"

    invoke-virtual {v14, v15, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "_display_name"

    invoke-virtual {v14, v15, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "datetaken"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 462
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "mime_type"

    invoke-virtual {v14, v15, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "_data"

    invoke-virtual {v14, v15, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "resolution"

    .line 465
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string/jumbo v17, "x"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    .line 466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/snap/SnapCamera;->mProfile:Landroid/media/CamcorderProfile;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v17

    .line 465
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 464
    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    if-eqz v7, :cond_1

    .line 468
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "latitude"

    invoke-virtual {v7}, Landroid/location/Location;->getLatitude()D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 469
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v15, "longitude"

    invoke-virtual {v7}, Landroid/location/Location;->getLongitude()D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 472
    :cond_1
    sget-object v14, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "save to "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v14, v11}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 476
    invoke-static {}, Lcom/android/camera/storage/Storage;->getAvailableSpace()J

    move-result-wide v14

    const-wide/32 v16, 0x3200000

    sub-long v8, v14, v16

    .line 477
    .local v8, "maxFileSize":J
    const-wide v14, 0xdac00000L

    cmp-long v14, v14, v8

    if-gez v14, :cond_2

    .line 478
    sget-object v14, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "need reduce , now maxFileSize = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    const-wide v8, 0xdac00000L

    .line 481
    :cond_2
    sget-wide v14, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    cmp-long v14, v8, v14

    if-gez v14, :cond_3

    .line 482
    sget-wide v8, Lcom/android/camera/module/VideoModule;->VIDEO_MIN_SINGLE_FILE_SIZE:J

    .line 486
    :cond_3
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v14, v8, v9}, Landroid/media/MediaRecorder;->setMaxFileSize(J)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 494
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/snap/SnapCamera;->setRecorderOrientationHint()V

    .line 496
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 497
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 500
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v14}, Landroid/media/MediaRecorder;->prepare()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 504
    :goto_1
    return-void

    .line 501
    :catch_0
    move-exception v4

    .line 502
    .local v4, "e":Ljava/io/IOException;
    sget-object v14, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "prepare failed for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 487
    .end local v4    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v5

    .local v5, "exception":Ljava/lang/RuntimeException;
    goto :goto_0
.end method

.method private declared-synchronized startPreview()V
    .locals 6

    .prologue
    monitor-enter p0

    .line 274
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-nez v2, :cond_0

    .line 275
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "startPreview: CameraDevice was already closed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 276
    return-void

    .line 278
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v2, :cond_1

    .line 279
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "startPreview: null capture session"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 280
    return-void

    .line 284
    :cond_1
    :try_start_2
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    .line 285
    .local v1, "previewRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 286
    invoke-direct {p0, v1}, Lcom/android/camera/snap/SnapCamera;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 287
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    .line 288
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 287
    invoke-virtual {v2, v3, v4, v5}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_2
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v1    # "previewRequestBuilder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    monitor-exit p0

    .line 292
    return-void

    .line 289
    :catch_0
    move-exception v0

    .line 290
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_3
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .end local v0    # "e":Landroid/hardware/camera2/CameraAccessException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized stopCamcorder()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    monitor-enter p0

    .line 565
    :try_start_0
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    if-eqz v8, :cond_1

    .line 566
    iget-boolean v8, p0, Lcom/android/camera/snap/SnapCamera;->mRecording:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v8, :cond_0

    .line 569
    :try_start_1
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v8}, Landroid/media/MediaRecorder;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 575
    :cond_0
    :goto_0
    :try_start_2
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v8}, Landroid/media/MediaRecorder;->reset()V

    .line 576
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v8}, Landroid/media/MediaRecorder;->release()V

    .line 577
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    .line 581
    :cond_1
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v9, "_data"

    invoke-virtual {v8, v9}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 582
    .local v3, "path":Ljava/lang/String;
    iget-boolean v8, p0, Lcom/android/camera/snap/SnapCamera;->mRecording:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v8, :cond_5

    .line 583
    const/4 v7, 0x0

    .line 585
    .local v7, "uri":Landroid/net/Uri;
    :try_start_3
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 586
    .local v4, "size":J
    const-wide/16 v0, 0x0

    .line 587
    .local v0, "duration":J
    cmp-long v8, v4, v12

    if-lez v8, :cond_2

    .line 588
    invoke-static {v3}, Lcom/android/camera/Util;->getDuration(Ljava/lang/String;)J

    move-result-wide v0

    .line 589
    cmp-long v8, v0, v12

    if-lez v8, :cond_2

    .line 590
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v9, "_size"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 591
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    const-string/jumbo v9, "duration"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 592
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 593
    sget-object v9, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iget-object v10, p0, Lcom/android/camera/snap/SnapCamera;->mContentValues:Landroid/content/ContentValues;

    .line 592
    invoke-virtual {v8, v9, v10}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v7

    .line 596
    .end local v7    # "uri":Landroid/net/Uri;
    :cond_2
    cmp-long v8, v0, v12

    if-nez v8, :cond_3

    .line 597
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 610
    .end local v0    # "duration":J
    .end local v4    # "size":J
    :cond_3
    :goto_1
    :try_start_4
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    if-eqz v8, :cond_4

    .line 611
    iget-object v8, p0, Lcom/android/camera/snap/SnapCamera;->mStatusListener:Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    invoke-interface {v8, v7}, Lcom/android/camera/snap/SnapCamera$SnapStatusListener;->onDone(Landroid/net/Uri;)V

    .line 617
    :cond_4
    :goto_2
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/android/camera/snap/SnapCamera;->mRecording:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    .line 618
    return-void

    .line 570
    .end local v3    # "path":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 571
    .local v2, "e":Ljava/lang/Exception;
    const/4 v8, 0x0

    :try_start_5
    iput-boolean v8, p0, Lcom/android/camera/snap/SnapCamera;->mRecording:Z

    .line 572
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 599
    .restart local v3    # "path":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 605
    .local v6, "th":Ljava/lang/Exception;
    :try_start_6
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 606
    const/4 v7, 0x0

    .line 607
    .restart local v7    # "uri":Landroid/net/Uri;
    sget-object v8, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Failed to write MediaStore "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 614
    .end local v6    # "th":Ljava/lang/Exception;
    .end local v7    # "uri":Landroid/net/Uri;
    :cond_5
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2
.end method


# virtual methods
.method public isCamcorder()Z
    .locals 1

    .prologue
    .line 319
    iget-boolean v0, p0, Lcom/android/camera/snap/SnapCamera;->mIsCamcorder:Z

    return v0
.end method

.method public onError(Landroid/media/MediaRecorder;II)V
    .locals 0
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->stopCamcorder()V

    .line 64
    return-void
.end method

.method public onInfo(Landroid/media/MediaRecorder;II)V
    .locals 2
    .param p1, "mr"    # Landroid/media/MediaRecorder;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 68
    const/16 v0, 0x320

    if-eq p2, v0, :cond_0

    .line 69
    const/16 v0, 0x321

    if-ne p2, v0, :cond_1

    .line 70
    :cond_0
    sget-object v0, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "duration or file size reach MAX"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->stopCamcorder()V

    .line 73
    :cond_1
    return-void
.end method

.method public declared-synchronized release()V
    .locals 3

    .prologue
    monitor-enter p0

    .line 358
    :try_start_0
    sget-object v1, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "release(): E"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    const/4 v1, 0x0

    :try_start_1
    iput v1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientation:I

    .line 361
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    .line 363
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;

    if-eqz v1, :cond_0

    .line 364
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->disable()V

    .line 365
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mOrientationListener:Landroid/view/OrientationEventListener;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 372
    :cond_0
    :goto_0
    :try_start_2
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->stopCamcorder()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 378
    :goto_1
    :try_start_3
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v1, :cond_1

    .line 379
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 380
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 386
    :cond_1
    :goto_2
    :try_start_4
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mHandlerThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_2

    .line 387
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 390
    :cond_2
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v1, :cond_3

    .line 391
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v1}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 392
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 395
    :cond_3
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v1, :cond_4

    .line 396
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 397
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 399
    :cond_4
    sget-object v1, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "release(): X"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    .line 400
    return-void

    .line 367
    :catch_0
    move-exception v0

    .line 368
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v1, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 373
    :catch_1
    move-exception v0

    .line 374
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_6
    sget-object v1, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 382
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 383
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v1, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2
.end method

.method public declared-synchronized startCamcorder()V
    .locals 5

    .prologue
    monitor-enter p0

    .line 523
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-nez v2, :cond_0

    .line 524
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "startCamcorder: CameraDevice is opening or was already closed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 525
    return-void

    .line 528
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->setupMediaRecorder()V

    .line 530
    const/4 v2, 0x1

    new-array v2, v2, [Landroid/view/Surface;

    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera;->mMediaRecorder:Landroid/media/MediaRecorder;

    invoke-virtual {v3}, Landroid/media/MediaRecorder;->getSurface()Landroid/view/Surface;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 532
    .local v1, "outputSurfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :try_start_2
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    new-instance v3, Lcom/android/camera/snap/SnapCamera$6;

    invoke-direct {v3, p0}, Lcom/android/camera/snap/SnapCamera$6;-><init>(Lcom/android/camera/snap/SnapCamera;)V

    .line 558
    iget-object v4, p0, Lcom/android/camera/snap/SnapCamera;->mCameraHandler:Landroid/os/Handler;

    .line 532
    invoke-virtual {v2, v1, v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_2
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    .line 562
    return-void

    .line 559
    :catch_0
    move-exception v0

    .line 560
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_3
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "failed to startCamcorder: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .end local v0    # "e":Landroid/hardware/camera2/CameraAccessException;
    .end local v1    # "outputSurfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized takeSnap()V
    .locals 5

    .prologue
    monitor-enter p0

    .line 323
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-nez v2, :cond_0

    .line 324
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "takeSnap: CameraDevice is opening or was already closed."

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 325
    return-void

    .line 327
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v2, :cond_1

    .line 328
    const/4 v2, 0x2

    new-array v2, v2, [Landroid/view/Surface;

    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera;->mPreviewSurface:Landroid/view/Surface;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 330
    .local v1, "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :try_start_2
    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    iget-object v3, p0, Lcom/android/camera/snap/SnapCamera;->mSessionCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    iget-object v4, p0, Lcom/android/camera/snap/SnapCamera;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v3, v4}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_2
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v1    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :goto_0
    monitor-exit p0

    .line 337
    return-void

    .line 331
    .restart local v1    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :catch_0
    move-exception v0

    .line 332
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_3
    sget-object v2, Lcom/android/camera/snap/SnapCamera;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "takeSnap: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .end local v0    # "e":Landroid/hardware/camera2/CameraAccessException;
    .end local v1    # "surfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 335
    :cond_1
    :try_start_4
    invoke-direct {p0}, Lcom/android/camera/snap/SnapCamera;->capture()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method
