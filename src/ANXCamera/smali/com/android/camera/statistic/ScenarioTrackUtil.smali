.class public Lcom/android/camera/statistic/ScenarioTrackUtil;
.super Ljava/lang/Object;
.source "ScenarioTrackUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static final sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

.field public static final sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 16
    const-class v0, Lcom/android/camera/statistic/ScenarioTrackUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    .line 19
    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string/jumbo v1, "CameraLaunchTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    .line 21
    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string/jumbo v1, "CaptureTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    .line 23
    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string/jumbo v1, "SwitchCameraTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    .line 25
    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string/jumbo v1, "SwitchModeTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    .line 27
    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string/jumbo v1, "StartVideoRecordTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    .line 29
    new-instance v0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    const-string/jumbo v1, "StopVideoRecordTime"

    invoke-direct {v0, v1}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static abortScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V
    .locals 3
    .param p0, "scenario"    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 171
    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    if-nez v0, :cond_0

    .line 172
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "track "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 173
    const-string/jumbo v2, " event start cancel due to scenario is null!"

    .line 172
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    return-void

    .line 177
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    if-eqz v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->abortScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)V

    .line 180
    :cond_1
    return-void
.end method

.method private static beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V
    .locals 6
    .param p0, "scenario"    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "payLoadMap"    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 113
    iget-object v3, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    if-nez v3, :cond_0

    .line 114
    sget-object v3, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "track "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 115
    const-string/jumbo v5, " event start cancel due to scenario is null!"

    .line 114
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    return-void

    .line 119
    :cond_0
    iget-boolean v3, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    if-eqz v3, :cond_1

    .line 120
    iget-object v3, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    invoke-static {v3}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->abortScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)V

    .line 124
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->createE2EScenarioSettings()Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;

    move-result-object v2

    .line 125
    .local v2, "scenarioSettings":Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    if-eqz v2, :cond_2

    .line 132
    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->setStatisticsMode(I)V

    .line 134
    const/16 v3, 0xc8

    invoke-virtual {v2, v3}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->setHistoryLimitPerDay(I)V

    .line 136
    :cond_2
    if-eqz p1, :cond_3

    .line 138
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->createE2EScenarioPayload()Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;

    move-result-object v1

    .line 139
    .local v1, "payload":Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;
    invoke-virtual {v1, p1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;->putAll(Ljava/util/Map;)V

    .line 140
    iget-object v3, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    invoke-static {v3, v2, v1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->beginScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;)Landroid/os/Bundle;

    .line 144
    .end local v1    # "payload":Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;
    :goto_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    .line 148
    .end local v2    # "scenarioSettings":Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    :goto_1
    return-void

    .line 142
    .restart local v2    # "scenarioSettings":Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    :cond_3
    iget-object v3, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    invoke-static {v3, v2}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->beginScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 145
    .end local v2    # "scenarioSettings":Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "track "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " event start failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V
    .locals 4
    .param p0, "scenario"    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 151
    iget-object v1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    if-nez v1, :cond_0

    .line 152
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "track "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 153
    const-string/jumbo v3, " event end cancel, due to scenario is null!"

    .line 152
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void

    .line 157
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z

    if-nez v1, :cond_1

    .line 158
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "track "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 159
    const-string/jumbo v3, " event end cancel, due to scenario has not started!"

    .line 158
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    return-void

    .line 163
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->e2eScenario:Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    invoke-static {v1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->finishScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)V

    .line 164
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->isTrackStarted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :goto_0
    return-void

    .line 165
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "track "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " event end failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static trackAppLunchTimeEnd()V
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 39
    return-void
.end method

.method public static trackAppLunchTimeStart(Z)V
    .locals 3
    .param p0, "isColdLaunch"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 33
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "LaunchMode"

    if-eqz p0, :cond_0

    const-string/jumbo v1, "COLD"

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->sLaunchTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v1, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V

    .line 35
    return-void

    .line 33
    :cond_0
    const-string/jumbo v1, "HOT"

    goto :goto_0
.end method

.method public static trackCaptureTimeEnd()V
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 50
    return-void
.end method

.method public static trackCaptureTimeStart(ZI)V
    .locals 3
    .param p0, "isFrontCamera"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "modeIndex"    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 43
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "CameraID"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    const-string/jumbo v1, "Module"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->sCaptureTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v1, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V

    .line 46
    return-void
.end method

.method public static trackScenarioAbort(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V
    .locals 0
    .param p0, "scenario"    # Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 100
    invoke-static {p0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->abortScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 101
    return-void
.end method

.method public static trackStartVideoRecordEnd()V
    .locals 1

    .prologue
    .line 84
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 85
    return-void
.end method

.method public static trackStartVideoRecordStart(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "mode"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "isFrontCamera"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 78
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "mode"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    const-string/jumbo v1, "cameraId"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStartVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v1, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V

    .line 81
    return-void
.end method

.method public static trackStopVideoRecordEnd()V
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 96
    return-void
.end method

.method public static trackStopVideoRecordStart(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "mode"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "isFrontCamera"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "mode"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string/jumbo v1, "cameraId"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->sStopVideoRecordTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v1, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V

    .line 92
    return-void
.end method

.method public static trackSwitchCameraEnd()V
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 62
    return-void
.end method

.method public static trackSwitchCameraStart(ZZI)V
    .locals 3
    .param p0, "isFrontCameraFrom"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "isFrontCameraTo"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "inMode"    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 54
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "from"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string/jumbo v1, "to"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string/jumbo v1, "inMode"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchCameraTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v1, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V

    .line 58
    return-void
.end method

.method public static trackSwitchModeEnd()V
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->finishScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;)V

    .line 74
    return-void
.end method

.method public static trackSwitchModeStart(IIZ)V
    .locals 3
    .param p0, "fromMode"    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "toMode"    # I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isFrontCamera"    # Z
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 66
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "from"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string/jumbo v1, "to"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-string/jumbo v1, "cameraId"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->cameraIdToName(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v1, Lcom/android/camera/statistic/ScenarioTrackUtil;->sSwitchModeTimeScenario:Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;

    invoke-static {v1, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->beginScenario(Lcom/android/camera/statistic/ScenarioTrackUtil$CameraEventScenario;Ljava/util/Map;)V

    .line 70
    return-void
.end method
