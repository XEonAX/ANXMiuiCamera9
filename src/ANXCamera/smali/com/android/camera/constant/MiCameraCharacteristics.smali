.class public Lcom/android/camera/constant/MiCameraCharacteristics;
.super Ljava/lang/Object;
.source "MiCameraCharacteristics.java"


# static fields
.field public static final EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key",
            "<[I>;"
        }
    .end annotation
.end field

.field public static final EXTRA_HIGH_SPEED_VIDEO_NUMBER:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static IS_QCFA_SENSOR:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 11
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.quadra_cfa.is_qcfa_sensor"

    const-class v2, Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->IS_QCFA_SENSOR:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 17
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.additional_hfr_video_sizes.hfr_video_size"

    const-class v2, [I

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 16
    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 20
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.additional_hfr_video_sizes.valid_number"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 19
    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_NUMBER:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
