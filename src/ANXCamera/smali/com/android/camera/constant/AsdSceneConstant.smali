.class public Lcom/android/camera/constant/AsdSceneConstant;
.super Ljava/lang/Object;
.source "AsdSceneConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/AsdSceneConstant$SceneResult;
    }
.end annotation


# static fields
.field private static final AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final XIAO_MI_SCENE_RESULT:Landroid/hardware/camera2/CaptureResult$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CaptureResult$Key",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static mIsFlashRetain:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 47
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "xiaomi.scene.result"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 46
    sput-object v0, Lcom/android/camera/constant/AsdSceneConstant;->XIAO_MI_SCENE_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    .line 50
    new-instance v0, Landroid/hardware/camera2/CaptureResult$Key;

    const-string/jumbo v1, "com.qti.chi.statsaec.AecLux"

    const-class v2, Ljava/lang/Float;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CaptureResult$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 49
    sput-object v0, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;

    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseRtbSceneResult(Landroid/hardware/camera2/CaptureResult;Z)I
    .locals 5
    .param p0, "captureResult"    # Landroid/hardware/camera2/CaptureResult;
    .param p1, "isFrontCamera"    # Z

    .prologue
    const/16 v4, 0x9

    const/4 v3, 0x0

    .line 83
    sget-object v2, Lcom/android/camera/constant/AsdSceneConstant;->AEC_LUX:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 84
    .local v0, "aecLux":F
    if-nez p1, :cond_3

    .line 85
    sput-boolean v3, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    .line 86
    const/high16 v2, 0x43e10000    # 450.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_0

    .line 87
    const/4 v2, 0x6

    return v2

    .line 90
    :cond_0
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 91
    .local v1, "distance":F
    const/high16 v2, 0x40200000    # 2.5f

    cmpl-float v2, v1, v2

    if-ltz v2, :cond_1

    .line 92
    const/4 v2, 0x4

    return v2

    .line 93
    :cond_1
    const/high16 v2, 0x3f000000    # 0.5f

    cmpg-float v2, v1, v2

    if-gtz v2, :cond_2

    .line 94
    const/4 v2, 0x5

    return v2

    .line 96
    :cond_2
    const/4 v2, 0x7

    return v2

    .line 99
    .end local v1    # "distance":F
    :cond_3
    sget-boolean v2, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    if-eqz v2, :cond_4

    const/high16 v2, 0x43960000    # 300.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_4

    .line 100
    return v4

    .line 102
    :cond_4
    const/high16 v2, 0x43af0000    # 350.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_5

    .line 103
    const/4 v2, 0x1

    sput-boolean v2, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    .line 104
    return v4

    .line 106
    :cond_5
    sput-boolean v3, Lcom/android/camera/constant/AsdSceneConstant;->mIsFlashRetain:Z

    .line 107
    const/4 v2, -0x1

    return v2
.end method
