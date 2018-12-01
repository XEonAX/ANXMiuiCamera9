.class Lcom/android/camera2/compat/MiCameraCompatQcomImpl;
.super Lcom/android/camera2/compat/MiCameraCompatBaseImpl;
.source "MiCameraCompatQcomImpl.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final AI_SCENE:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_APPLY:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_AVAILABLE_MODES:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<[I>;"
        }
    .end annotation
.end field

.field private static final AI_SCENE_PERIOD:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final CONTRAST_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final EXPOSURE_METERING:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final IS_HFR_PREVIEW:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final RECORDING_END_STREAM:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field private static final SATURATION:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final SELECT_PRIORITY:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final SHARPNESS_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final USE_CUSTOM_WB:Landroid/hardware/camera2/CaptureRequest$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureRequest$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final USE_ISO_VALUE:Landroid/hardware/camera2/CaptureRequest$Key;
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
    .line 21
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.iso_exp_priority.select_priority"

    .line 22
    const-class v2, Ljava/lang/Integer;

    .line 21
    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 20
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SELECT_PRIORITY:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 24
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.iso_exp_priority.use_iso_exp_priority"

    .line 25
    const-class v2, Ljava/lang/Long;

    .line 24
    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 23
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 27
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.iso_exp_priority.use_iso_value"

    .line 28
    const-class v2, Ljava/lang/Integer;

    .line 27
    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 26
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->USE_ISO_VALUE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 31
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "com.qti.stats.awbwrapper.AWBCCT"

    .line 32
    const-class v2, Ljava/lang/Integer;

    .line 31
    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 30
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->USE_CUSTOM_WB:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 35
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.saturation.use_saturation"

    .line 36
    const-class v2, Ljava/lang/Integer;

    .line 35
    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 34
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SATURATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 39
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.sharpness.strength"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 38
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SHARPNESS_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 42
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.exposure_metering.exposure_metering_mode"

    .line 43
    const-class v2, Ljava/lang/Integer;

    .line 42
    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 41
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->EXPOSURE_METERING:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.quic.camera.recording.endOfStream"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 45
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->RECORDING_END_STREAM:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 52
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "xiaomi.ai.asd.enabled"

    const-class v2, Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 51
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->AI_SCENE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 58
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "xiaomi.ai.asd.sceneApplied"

    const-class v2, Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 57
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->AI_SCENE_APPLY:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 64
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "xiaomi.ai.asd.availableSceneMode"

    const-class v2, [I

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 63
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->AI_SCENE_AVAILABLE_MODES:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 70
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "xiaomi.ai.asd.period"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 69
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->AI_SCENE_PERIOD:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 76
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "org.codeaurora.qcamera3.contrast.level"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 75
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->CONTRAST_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 82
    new-instance v0, Landroid/hardware/camera2/CaptureRequest$Key;

    const-string/jumbo v1, "xiaomi.hfrPreview.isHFRPreview"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 81
    sput-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->IS_HFR_PREVIEW:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 18
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "enable"    # Z

    .prologue
    .line 206
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->AI_SCENE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 207
    return-void
.end method

.method public applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "period"    # I

    .prologue
    .line 216
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->AI_SCENE_PERIOD:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 217
    return-void
.end method

.method public applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "value"    # I

    .prologue
    .line 130
    add-int/lit8 v0, p2, 0x1

    .line 131
    .local v0, "level":I
    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->CONTRAST_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 132
    return-void
.end method

.method public applyCustomWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "awbValue"    # I

    .prologue
    .line 125
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->USE_CUSTOM_WB:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 126
    return-void
.end method

.method public applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "mode"    # I

    .prologue
    .line 195
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->EXPOSURE_METERING:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 196
    return-void
.end method

.method public applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "exposureTime"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 118
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    cmp-long v0, p2, v2

    if-lez v0, :cond_0

    .line 119
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SELECT_PRIORITY:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 120
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    .line 121
    return-void
.end method

.method public applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "iso"    # I

    .prologue
    .line 87
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SELECT_PRIORITY:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 89
    sparse-switch p2, :sswitch_data_0

    .line 112
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unknown iso value"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :sswitch_0
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 114
    :goto_0
    return-void

    .line 94
    :sswitch_1
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 97
    :sswitch_2
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x3

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 100
    :sswitch_3
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 103
    :sswitch_4
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 106
    :sswitch_5
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x6

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 109
    :sswitch_6
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->ISO_EXP:Landroid/hardware/camera2/CaptureRequest$Key;

    const-wide/16 v2, 0x7

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 89
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x64 -> :sswitch_1
        0xc8 -> :sswitch_2
        0x190 -> :sswitch_3
        0x320 -> :sswitch_4
        0x640 -> :sswitch_5
        0xc80 -> :sswitch_6
    .end sparse-switch
.end method

.method public applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "isPreview"    # Z

    .prologue
    .line 221
    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->IS_HFR_PREVIEW:Landroid/hardware/camera2/CaptureRequest$Key;

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 222
    return-void

    .line 221
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "level"    # I

    .prologue
    .line 136
    const/4 v0, 0x0

    .line 137
    .local v0, "result":I
    packed-switch p2, :pswitch_data_0

    .line 160
    :goto_0
    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SATURATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 161
    return-void

    .line 139
    :pswitch_0
    const/4 v0, 0x0

    .line 140
    goto :goto_0

    .line 142
    :pswitch_1
    const/4 v0, 0x2

    .line 143
    goto :goto_0

    .line 145
    :pswitch_2
    const/4 v0, 0x4

    .line 146
    goto :goto_0

    .line 148
    :pswitch_3
    const/4 v0, 0x5

    .line 149
    goto :goto_0

    .line 151
    :pswitch_4
    const/4 v0, 0x6

    .line 152
    goto :goto_0

    .line 154
    :pswitch_5
    const/16 v0, 0x8

    .line 155
    goto :goto_0

    .line 157
    :pswitch_6
    const/16 v0, 0xa

    .line 158
    goto :goto_0

    .line 137
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "level"    # I

    .prologue
    .line 165
    const/4 v0, 0x0

    .line 166
    .local v0, "result":I
    packed-switch p2, :pswitch_data_0

    .line 189
    :goto_0
    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->SHARPNESS_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 190
    return-void

    .line 168
    :pswitch_0
    const/4 v0, 0x0

    .line 169
    goto :goto_0

    .line 171
    :pswitch_1
    const/4 v0, 0x1

    .line 172
    goto :goto_0

    .line 174
    :pswitch_2
    const/4 v0, 0x2

    .line 175
    goto :goto_0

    .line 177
    :pswitch_3
    const/4 v0, 0x3

    .line 178
    goto :goto_0

    .line 180
    :pswitch_4
    const/4 v0, 0x4

    .line 181
    goto :goto_0

    .line 183
    :pswitch_5
    const/4 v0, 0x5

    .line 184
    goto :goto_0

    .line 186
    :pswitch_6
    const/4 v0, 0x6

    .line 187
    goto :goto_0

    .line 166
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 3
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p2, "start"    # Z

    .prologue
    .line 200
    const-string/jumbo v1, "MiCameraCompat"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "recordingEndOfStream: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p2, :cond_0

    const-string/jumbo v0, "0x0"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->RECORDING_END_STREAM:Landroid/hardware/camera2/CaptureRequest$Key;

    if-eqz p2, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 202
    return-void

    .line 200
    :cond_0
    const-string/jumbo v0, "0x1"

    goto :goto_0

    .line 201
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public supportContrast(Ljava/util/HashSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 227
    .local p1, "supportedVendorKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;->CONTRAST_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public supportExtraHighSpeedVideoConfiguration(Ljava/util/HashSet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 232
    .local p1, "supportedVendorKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 233
    sget-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 232
    if-eqz v0, :cond_0

    .line 234
    sget-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_NUMBER:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 232
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
