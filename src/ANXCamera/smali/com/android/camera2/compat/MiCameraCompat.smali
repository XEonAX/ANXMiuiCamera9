.class public Lcom/android/camera2/compat/MiCameraCompat;
.super Ljava/lang/Object;
.source "MiCameraCompat.java"


# static fields
.field static final IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    invoke-static {}, Lcom/android/camera/Device;->isQcomPlatform()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatQcomImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    .line 18
    :goto_0
    return-void

    .line 25
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 26
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatMtkImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatMtkImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    goto :goto_0

    .line 28
    :cond_1
    new-instance v0, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-direct {v0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;-><init>()V

    sput-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 139
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 140
    return-void
.end method

.method public static applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "period"    # I

    .prologue
    .line 158
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 159
    return-void
.end method

.method public static applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/effect/BeautyValues;)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    .line 122
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/effect/BeautyValues;)V

    .line 123
    return-void
.end method

.method public static applyBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 102
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 103
    return-void
.end method

.method public static applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "fps"    # I

    .prologue
    .line 174
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBurstFps(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 175
    return-void
.end method

.method public static applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "hint"    # I

    .prologue
    .line 170
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyBurstHint(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 171
    return-void
.end method

.method public static applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "level"    # I

    .prologue
    .line 45
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 46
    return-void
.end method

.method public static applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "awbValue"    # I

    .prologue
    .line 41
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyCustomWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 42
    return-void
.end method

.method public static applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "orientation"    # I

    .prologue
    .line 118
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 119
    return-void
.end method

.method public static applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "mode"    # I

    .prologue
    .line 58
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 59
    return-void
.end method

.method public static applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "exposureTime"    # J

    .prologue
    .line 37
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    .line 38
    return-void
.end method

.method public static applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 110
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceAnalyzeAge(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 111
    return-void
.end method

.method public static applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 114
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 115
    return-void
.end method

.method public static applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "applied"    # Ljava/lang/String;

    .prologue
    .line 94
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public static applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 166
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 167
    return-void
.end method

.method public static applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 66
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 67
    return-void
.end method

.method public static applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 70
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 71
    return-void
.end method

.method public static applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 62
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 63
    return-void
.end method

.method public static applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "iso"    # I

    .prologue
    .line 33
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 34
    return-void
.end method

.method public static applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "isPreview"    # Z

    .prologue
    .line 178
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 179
    return-void
.end method

.method public static applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 182
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 183
    return-void
.end method

.method public static applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 98
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 99
    return-void
.end method

.method public static applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 78
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyParallelProcessEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 79
    return-void
.end method

.method public static applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 74
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyParallelProcessPath(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public static applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "level"    # I

    .prologue
    .line 49
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 50
    return-void
.end method

.method public static applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "level"    # I

    .prologue
    .line 53
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 54
    return-void
.end method

.method public static applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 162
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 163
    return-void
.end method

.method public static applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 106
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 107
    return-void
.end method

.method public static applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "enable"    # Z

    .prologue
    .line 82
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 83
    return-void
.end method

.method public static applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "applied"    # Ljava/lang/String;

    .prologue
    .line 90
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public static applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "start"    # Z

    .prologue
    .line 126
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 127
    return-void
.end method

.method public static applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V
    .locals 1
    .param p0, "request"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "applied"    # Ljava/lang/String;

    .prologue
    .line 86
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public static supportBeautyType(Ljava/util/HashSet;Lcom/android/camera/effect/BeautyParameters$Type;)Z
    .locals 1
    .param p1, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/camera/effect/BeautyParameters$Type;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, "supportedVendorKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0, p1}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportBeautyType(Ljava/util/HashSet;Lcom/android/camera/effect/BeautyParameters$Type;)Z

    move-result v0

    return v0
.end method

.method public static supportContrast(Ljava/util/HashSet;)Z
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
    .line 187
    .local p0, "supportedVendorKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportContrast(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method

.method public static supportExtraHighSpeedVideoConfiguration(Ljava/util/HashSet;)Z
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
    .line 200
    .local p0, "supportedVendorKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportExtraHighSpeedVideoConfiguration(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method

.method public static supportLensDirtyDetect(Ljava/util/HashSet;)Z
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
    .line 191
    .local p0, "supportedVendorKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    sget-object v0, Lcom/android/camera2/compat/MiCameraCompat;->IMPL:Lcom/android/camera2/compat/MiCameraCompatBaseImpl;

    invoke-virtual {v0, p0}, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->supportLensDirtyDetect(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method
