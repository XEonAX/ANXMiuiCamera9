.class public Lcom/android/camera/module/loader/camera2/Camera2DataContainer;
.super Ljava/lang/Object;
.source "Camera2DataContainer.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "MissingPermission"
    }
.end annotation

.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;


# instance fields
.field private mAuxBackCameraId:I

.field private mBokehCameraId:I

.field private mCapabilities:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/camera2/CameraCapabilities;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

.field private mFrontCameraId:I

.field private mMainBackCameraId:I

.field private mMuxCameraId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    .line 27
    new-instance v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    invoke-direct {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;-><init>()V

    sput-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    .line 25
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    .line 33
    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mAuxBackCameraId:I

    .line 34
    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mFrontCameraId:I

    .line 35
    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    .line 36
    iput v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    .line 55
    return-void
.end method

.method public static getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;
    .locals 3

    .prologue
    .line 39
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    iget-object v0, v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCapabilities:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 40
    sget-object v1, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    .line 41
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v2, "camera"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 40
    check-cast v0, Landroid/hardware/camera2/CameraManager;

    invoke-direct {v1, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->init(Landroid/hardware/camera2/CameraManager;)V

    .line 43
    :cond_0
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    return-object v0
.end method

.method public static getInstance(Landroid/hardware/camera2/CameraManager;)Lcom/android/camera/module/loader/camera2/Camera2DataContainer;
    .locals 1
    .param p0, "camera2Service"    # Landroid/hardware/camera2/CameraManager;

    .prologue
    .line 47
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    iget-object v0, v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCapabilities:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 48
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->init(Landroid/hardware/camera2/CameraManager;)V

    .line 50
    :cond_0
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->ourInstance:Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    return-object v0
.end method

.method private init(Landroid/hardware/camera2/CameraManager;)V
    .locals 14
    .param p1, "camera2Service"    # Landroid/hardware/camera2/CameraManager;

    .prologue
    const/4 v7, 0x0

    const/4 v13, 0x1

    const/4 v12, -0x1

    .line 58
    sget-object v8, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "E: init()"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    new-instance v8, Landroid/util/SparseArray;

    invoke-direct {v8}, Landroid/util/SparseArray;-><init>()V

    iput-object v8, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCapabilities:Landroid/util/SparseArray;

    .line 61
    :try_start_0
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v1

    .line 62
    .local v1, "cameraIdList":[Ljava/lang/String;
    array-length v8, v1

    :goto_0
    if-ge v7, v8, :cond_5

    aget-object v0, v1, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 63
    .local v0, "cameraId":Ljava/lang/String;
    const/4 v6, -0x1

    .line 65
    .local v6, "id":I
    :try_start_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v6

    .line 71
    :try_start_2
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v2

    .line 72
    .local v2, "characteristics":Landroid/hardware/camera2/CameraCharacteristics;
    sget-object v9, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, v9}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 73
    .local v5, "facing":Ljava/lang/Integer;
    if-eqz v5, :cond_0

    .line 74
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    if-ne v9, v12, :cond_1

    .line 75
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v13, :cond_1

    .line 76
    iput v6, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    .line 91
    :cond_0
    :goto_1
    iget-object v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCapabilities:Landroid/util/SparseArray;

    new-instance v10, Lcom/android/camera2/CameraCapabilities;

    invoke-direct {v10, v2}, Lcom/android/camera2/CameraCapabilities;-><init>(Landroid/hardware/camera2/CameraCharacteristics;)V

    invoke-virtual {v9, v6, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 62
    .end local v2    # "characteristics":Landroid/hardware/camera2/CameraCharacteristics;
    .end local v5    # "facing":Ljava/lang/Integer;
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 66
    :catch_0
    move-exception v4

    .line 67
    .local v4, "e":Ljava/lang/NumberFormatException;
    sget-object v9, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "non-integer camera id "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 98
    .end local v0    # "cameraId":Ljava/lang/String;
    .end local v1    # "cameraIdList":[Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/NumberFormatException;
    .end local v6    # "id":I
    :catch_1
    move-exception v3

    .line 108
    .local v3, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to init CameraCapabilities: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_3
    sget-object v7, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    const-string/jumbo v8, "X: init()"

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    return-void

    .line 77
    .restart local v0    # "cameraId":Ljava/lang/String;
    .restart local v1    # "cameraIdList":[Ljava/lang/String;
    .restart local v2    # "characteristics":Landroid/hardware/camera2/CameraCharacteristics;
    .restart local v5    # "facing":Ljava/lang/Integer;
    .restart local v6    # "id":I
    :cond_1
    :try_start_3
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mFrontCameraId:I

    if-ne v9, v12, :cond_2

    .line 78
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-nez v9, :cond_2

    .line 79
    iput v6, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mFrontCameraId:I

    goto :goto_1

    .line 80
    :cond_2
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mAuxBackCameraId:I

    if-ne v9, v12, :cond_3

    .line 81
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v13, :cond_3

    .line 82
    iput v6, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mAuxBackCameraId:I

    goto :goto_1

    .line 83
    :cond_3
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    if-ne v9, v12, :cond_4

    .line 84
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v13, :cond_4

    .line 85
    iput v6, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    goto :goto_1

    .line 86
    :cond_4
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    if-ne v9, v12, :cond_0

    .line 87
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v13, :cond_0

    .line 88
    iput v6, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    goto :goto_1

    .line 93
    .end local v0    # "cameraId":Ljava/lang/String;
    .end local v2    # "characteristics":Landroid/hardware/camera2/CameraCharacteristics;
    .end local v5    # "facing":Ljava/lang/Integer;
    .end local v6    # "id":I
    :cond_5
    sget-object v7, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "init: mMainBackCameraId="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 94
    const-string/jumbo v9, " mFrontCameraId="

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 94
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mFrontCameraId:I

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 95
    const-string/jumbo v9, " mAuxBackCameraId="

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 95
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mAuxBackCameraId:I

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 96
    const-string/jumbo v9, " mMuxCameraId="

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 96
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 97
    const-string/jumbo v9, " mBokehCameraId="

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 97
    iget v9, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    .line 93
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_3
.end method


# virtual methods
.method public deInit()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 114
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "E: deInit()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iput v2, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    .line 116
    iput v2, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mFrontCameraId:I

    .line 117
    iput v2, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mAuxBackCameraId:I

    .line 118
    iput v2, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    .line 119
    iput v2, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    .line 120
    iput-object v3, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCapabilities:Landroid/util/SparseArray;

    .line 121
    iput-object v3, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCurrentCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 122
    sget-object v0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "X: deInit()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    return-void
.end method

.method public getActualOpenCameraId(II)I
    .locals 6
    .param p1, "bogusCameraId"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 180
    move v0, p1

    .line 181
    .local v0, "actualCameraId":I
    if-nez p1, :cond_3

    .line 182
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraEnable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 183
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v2

    .line 185
    :goto_0
    if-nez v2, :cond_2

    .line 186
    return p1

    .line 183
    :cond_0
    const/4 v2, 0x1

    .local v2, "supportedAuxCamera":Z
    goto :goto_0

    .line 182
    .end local v2    # "supportedAuxCamera":Z
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "supportedAuxCamera":Z
    goto :goto_0

    .line 189
    .end local v2    # "supportedAuxCamera":Z
    :cond_2
    packed-switch p2, :pswitch_data_0

    .line 222
    :cond_3
    :goto_1
    :pswitch_0
    sget-object v3, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getActualOpenCameraId: bogusCameraId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 223
    const-string/jumbo v5, "actualCameraId="

    .line 222
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 224
    const-string/jumbo v5, "currentMode="

    .line 222
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    return v0

    .line 192
    :pswitch_1
    iget v3, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_4

    .line 193
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    goto :goto_1

    .line 195
    :cond_4
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    goto :goto_1

    .line 201
    :pswitch_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraSatEnable()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 202
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    goto :goto_1

    .line 208
    :pswitch_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 209
    invoke-static {p2}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object v1

    .line 210
    .local v1, "mode":Ljava/lang/String;
    const-string/jumbo v3, "wide"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 211
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    goto :goto_1

    .line 212
    :cond_5
    const-string/jumbo v3, "tele"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 213
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mAuxBackCameraId:I

    goto :goto_1

    .line 189
    nop

    :pswitch_data_0
    .packed-switch 0xa3
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getBokehCameraId()I
    .locals 1

    .prologue
    .line 138
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mBokehCameraId:I

    return v0
.end method

.method public getCapabilities(I)Lcom/android/camera2/CameraCapabilities;
    .locals 4
    .param p1, "actualCameraId"    # I

    .prologue
    .line 159
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCapabilities:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/CameraCapabilities;

    .line 160
    .local v0, "caps":Lcom/android/camera2/CameraCapabilities;
    if-nez v0, :cond_0

    .line 161
    sget-object v1, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not find the cached CameraCapabilities of camera: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    :cond_0
    return-object v0
.end method

.method public getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;
    .locals 1
    .param p1, "bogusCameraID"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 168
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getActualOpenCameraId(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCurrentCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    return-object v0
.end method

.method public getFrontCameraId()I
    .locals 1

    .prologue
    .line 130
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mFrontCameraId:I

    return v0
.end method

.method public getMainBackCameraId()I
    .locals 1

    .prologue
    .line 126
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMainBackCameraId:I

    return v0
.end method

.method public getMuxCameraId()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    return v0
.end method

.method public hasMuxCamera()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 142
    iget v1, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mMuxCameraId:I

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public setCurrentCameraCapabilities(Lcom/android/camera2/CameraCapabilities;)V
    .locals 0
    .param p1, "cameraCapabilities"    # Lcom/android/camera2/CameraCapabilities;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->mCurrentCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 173
    return-void
.end method
