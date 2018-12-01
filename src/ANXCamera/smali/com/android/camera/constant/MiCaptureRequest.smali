.class public Lcom/android/camera/constant/MiCaptureRequest;
.super Ljava/lang/Object;
.source "MiCaptureRequest.java"


# static fields
.field public static final VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
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
    .line 25
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "xiaomi.video.recordControl"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 24
    sput-object v0, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
