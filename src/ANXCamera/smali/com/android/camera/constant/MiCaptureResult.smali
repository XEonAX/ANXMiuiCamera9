.class public Lcom/android/camera/constant/MiCaptureResult;
.super Ljava/lang/Object;
.source "MiCaptureResult.java"


# static fields
.field public static final STATISTICS_FACE_AGE:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<[F>;"
        }
    .end annotation
.end field

.field public static final STATISTICS_FACE_FACESCORE:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<[F>;"
        }
    .end annotation
.end field

.field public static final STATISTICS_FACE_GENDER:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<[F>;"
        }
    .end annotation
.end field

.field public static final STATISTICS_FACE_INFO:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<[B>;"
        }
    .end annotation
.end field

.field public static final STATISTICS_FACE_PROP:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<[F>;"
        }
    .end annotation
.end field

.field public static final VIDEO_RECORD_STATE:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 21
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.video.recordState"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 20
    sput-object v0, Lcom/android/camera/constant/MiCaptureResult;->VIDEO_RECORD_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 24
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.faceAnalyzeResult.result"

    const-class v2, [B

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 23
    sput-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_INFO:Landroid/hardware/camera2/CaptureResult$Key;

    .line 27
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.faceAnalyzeResult.age"

    const-class v2, [F

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 26
    sput-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_AGE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 30
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.faceAnalyzeResult.gender"

    const-class v2, [F

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 29
    sput-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_GENDER:Landroid/hardware/camera2/CaptureResult$Key;

    .line 33
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.faceAnalyzeResult.score"

    const-class v2, [F

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 32
    sput-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_FACESCORE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 36
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.faceAnalyzeResult.prop"

    const-class v2, [F

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 35
    sput-object v0, Lcom/android/camera/constant/MiCaptureResult;->STATISTICS_FACE_PROP:Landroid/hardware/camera2/CaptureResult$Key;

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
