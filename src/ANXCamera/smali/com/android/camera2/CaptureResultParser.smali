.class public Lcom/android/camera2/CaptureResultParser;
.super Ljava/lang/Object;
.source "CaptureResultParser.java"


# static fields
.field private static final AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Lcom/android/camera2/AWBFrameControl;",
            ">;"
        }
    .end annotation
.end field

.field private static final LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 10
    const-class v0, Lcom/android/camera2/CaptureResultParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CaptureResultParser;->TAG:Ljava/lang/String;

    .line 23
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.ai.asd.enabled"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 22
    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_ENABLE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 28
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.ai.asd.sceneDetected"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 27
    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 34
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.hdr.hdrDetected"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 33
    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 40
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.ai.add.lensDirtyDetected"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 39
    sput-object v0, Lcom/android/camera2/CaptureResultParser;->LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    .line 46
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "org.quic.camera2.statsconfigs.AWBFrameControl"

    const-class v2, Lcom/android/camera2/AWBFrameControl;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 45
    sput-object v0, Lcom/android/camera2/CaptureResultParser;->AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    .line 49
    new-instance v0, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;

    invoke-direct {v0}, Lcom/android/camera2/AWBFrameControl$MarshalQueryableAWBFrameControl;-><init>()V

    invoke-static {v0}, Landroid/hardware/camera2/marshal/MarshalRegistry;->registerMarshalQueryable(Landroid/hardware/camera2/marshal/MarshalQueryable;)V

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

.method public static getAWBFrameControl(Landroid/hardware/camera2/CaptureResult;)Lcom/android/camera2/AWBFrameControl;
    .locals 1
    .param p0, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 96
    sget-object v0, Lcom/android/camera2/CaptureResultParser;->AWB_FRAME_CONTROL:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/AWBFrameControl;

    return-object v0
.end method

.method public static getAsdDetectedModes(Landroid/hardware/camera2/CaptureResult;)I
    .locals 2
    .param p0, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 67
    sget-object v1, Lcom/android/camera2/CaptureResultParser;->AI_SCENE_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 68
    .local v0, "b":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 71
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public static getHDRDetectedScene(Landroid/hardware/camera2/CaptureResult;)I
    .locals 2
    .param p0, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    .line 80
    sget-object v1, Lcom/android/camera2/CaptureResultParser;->AI_HDR_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    .line 81
    .local v0, "b":Ljava/lang/Byte;
    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v1

    return v1

    .line 84
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public static isLensDirtyDetected(Landroid/hardware/camera2/CaptureResult;)Z
    .locals 4
    .param p0, "result"    # Landroid/hardware/camera2/CaptureResult;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 88
    sget-object v3, Lcom/android/camera2/CaptureResultParser;->LENS_DIRTY_DETECTED:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 89
    .local v0, "data":Ljava/lang/Integer;
    if-eqz v0, :cond_1

    .line 90
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v1, :cond_0

    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0

    .line 92
    :cond_1
    return v2
.end method
