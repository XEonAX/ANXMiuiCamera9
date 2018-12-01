.class public Lcom/android/camera/module/ModuleManager;
.super Ljava/lang/Object;
.source "ModuleManager.java"


# static fields
.field private static sCurrentModuleIndex:I

.field private static sInstance:Lcom/android/camera/module/ModuleManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, -0x1

    sput v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    .line 12
    new-instance v0, Lcom/android/camera/module/ModuleManager;

    invoke-direct {v0}, Lcom/android/camera/module/ModuleManager;-><init>()V

    sput-object v0, Lcom/android/camera/module/ModuleManager;->sInstance:Lcom/android/camera/module/ModuleManager;

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActiveModuleIndex()I
    .locals 1

    .prologue
    .line 45
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    return v0
.end method

.method private static getCameraByDevice()Lcom/android/camera/module/Module;
    .locals 1

    .prologue
    .line 101
    new-instance v0, Lcom/android/camera/module/Camera2Module;

    invoke-direct {v0}, Lcom/android/camera/module/Camera2Module;-><init>()V

    return-object v0
.end method

.method private static getFunByDevice()Lcom/android/camera/module/Module;
    .locals 1

    .prologue
    .line 105
    new-instance v0, Lcom/android/camera/module/FunModule;

    invoke-direct {v0}, Lcom/android/camera/module/FunModule;-><init>()V

    return-object v0
.end method

.method public static getModuleByIndex(I)Lcom/android/camera/module/Module;
    .locals 1
    .param p0, "moduleIndex"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 20
    packed-switch p0, :pswitch_data_0

    .line 40
    :pswitch_0
    const/4 v0, 0x0

    return-object v0

    .line 25
    :pswitch_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getCameraByDevice()Lcom/android/camera/module/Module;

    move-result-object v0

    return-object v0

    .line 31
    :pswitch_2
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getVideoByDevice()Lcom/android/camera/module/Module;

    move-result-object v0

    return-object v0

    .line 34
    :pswitch_3
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getFunByDevice()Lcom/android/camera/module/Module;

    move-result-object v0

    return-object v0

    .line 37
    :pswitch_4
    new-instance v0, Lcom/android/camera/module/PanoramaModule;

    invoke-direct {v0}, Lcom/android/camera/module/PanoramaModule;-><init>()V

    return-object v0

    .line 20
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static getVideoByDevice()Lcom/android/camera/module/Module;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lcom/android/camera/module/VideoModule;

    invoke-direct {v0}, Lcom/android/camera/module/VideoModule;-><init>()V

    return-object v0
.end method

.method public static isCameraModule()Z
    .locals 2

    .prologue
    .line 73
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCapture()Z
    .locals 1

    .prologue
    .line 97
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isFastMotionModule()Z
    .locals 2

    .prologue
    .line 69
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isFunModule()Z
    .locals 2

    .prologue
    .line 53
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isManualModule()Z
    .locals 2

    .prologue
    .line 85
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPanoramaModule()Z
    .locals 2

    .prologue
    .line 81
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPortraitModule()Z
    .locals 2

    .prologue
    .line 93
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xab

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSlowMotionModule()Z
    .locals 2

    .prologue
    .line 61
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSquareModule()Z
    .locals 2

    .prologue
    .line 77
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isVideoModule()Z
    .locals 2

    .prologue
    .line 57
    sget v0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    const/16 v1, 0xa2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setActiveModuleIndex(I)V
    .locals 0
    .param p0, "moduleIndex"    # I

    .prologue
    .line 49
    sput p0, Lcom/android/camera/module/ModuleManager;->sCurrentModuleIndex:I

    .line 50
    return-void
.end method
