.class Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;
.super Ljava/lang/Object;
.source "E2EScenarioPerfTracerInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;,
        Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;,
        Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    }
.end annotation


# static fields
.field private static volatile sAbortMatchingScenario:Ljava/lang/reflect/Method;

.field private static volatile sAbortMatchingScenarioWithTag:Ljava/lang/reflect/Method;

.field private static volatile sAbortSpecificScenario:Ljava/lang/reflect/Method;

.field private static volatile sBeginScenario:Ljava/lang/reflect/Method;

.field private static volatile sBeginScenarioWithPayload:Ljava/lang/reflect/Method;

.field private static volatile sBeginScenarioWithTag:Ljava/lang/reflect/Method;

.field private static volatile sBeginScenarioWithTagAndPayload:Ljava/lang/reflect/Method;

.field private static volatile sE2EScenarioClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioPayloadClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioPayloadConstuctor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioPayloadMethodPutAll:Ljava/lang/reflect/Method;

.field private static volatile sE2EScenarioPayloadMethodPutValues:Ljava/lang/reflect/Method;

.field private static volatile sE2EScenarioPerfTracerClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioSettingsClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioSettingsConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private static volatile sE2EScenarioSettingsMethodEnableAutoAnalysis:Ljava/lang/reflect/Method;

.field private static volatile sE2EScenarioSettingsMethodSetHistoryLimitPerDay:Ljava/lang/reflect/Method;

.field private static volatile sE2EScenarioSettingsMethodSetStatisticsMode:Ljava/lang/reflect/Method;

.field private static volatile sFinishMatchingScenario:Ljava/lang/reflect/Method;

.field private static volatile sFinishMatchingScenarioWithPayload:Ljava/lang/reflect/Method;

.field private static volatile sFinishMatchingScenarioWithTag:Ljava/lang/reflect/Method;

.field private static volatile sFinishMatchingScenarioWithTagAndPayload:Ljava/lang/reflect/Method;

.field private static volatile sFinishSpecificScenario:Ljava/lang/reflect/Method;

.field private static volatile sFinishSpecificScenarioWithPayload:Ljava/lang/reflect/Method;

.field private static final sInitLockObject:Ljava/lang/Object;

.field private static volatile sInitialized:Z


# direct methods
.method static synthetic -get0()Ljava/lang/reflect/Method;
    .locals 1

    sget-object v0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadMethodPutAll:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method static synthetic -get3()Ljava/lang/reflect/Method;
    .locals 1

    sget-object v0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsMethodSetHistoryLimitPerDay:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method static synthetic -get4()Ljava/lang/reflect/Method;
    .locals 1

    sget-object v0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsMethodSetStatisticsMode:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 105
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitLockObject:Ljava/lang/Object;

    .line 21
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    return-void
.end method

.method public static abortScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)V
    .locals 5
    .param p0, "scenario"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    .prologue
    .line 350
    if-nez p0, :cond_0

    .line 351
    return-void

    .line 354
    :cond_0
    sget-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v1, :cond_1

    .line 355
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 358
    :cond_1
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sAbortMatchingScenario:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_2

    .line 360
    :try_start_0
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sAbortMatchingScenario:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 365
    :cond_2
    :goto_0
    return-void

    .line 361
    :catch_0
    move-exception v0

    .line 362
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static beginScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)Landroid/os/Bundle;
    .locals 6
    .param p0, "scenario"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;
    .param p1, "scenarioSettings"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;

    .prologue
    const/4 v5, 0x0

    .line 270
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 271
    :cond_0
    return-object v5

    .line 274
    :cond_1
    sget-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v1, :cond_2

    .line 275
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 278
    :cond_2
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenario:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_3

    .line 280
    :try_start_0
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenario:Ljava/lang/reflect/Method;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 281
    :catch_0
    move-exception v0

    .line 282
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 285
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_3
    return-object v5
.end method

.method public static beginScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;)Landroid/os/Bundle;
    .locals 6
    .param p0, "scenario"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;
    .param p1, "scenarioSettings"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    .param p2, "payload"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;

    .prologue
    const/4 v2, 0x0

    .line 309
    if-nez p0, :cond_0

    .line 310
    return-object v2

    .line 313
    :cond_0
    sget-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v1, :cond_1

    .line 314
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 317
    :cond_1
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenarioWithPayload:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_3

    .line 319
    :try_start_0
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenarioWithPayload:Ljava/lang/reflect/Method;

    const/4 v1, 0x3

    new-array v4, v1, [Ljava/lang/Object;

    .line 320
    invoke-static {p0}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)Ljava/lang/Object;

    move-result-object v1

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {p1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)Ljava/lang/Object;

    move-result-object v1

    const/4 v5, 0x1

    aput-object v1, v4, v5

    if-nez p2, :cond_2

    move-object v1, v2

    :goto_0
    const/4 v5, 0x2

    aput-object v1, v4, v5

    const/4 v1, 0x0

    .line 319
    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    return-object v1

    .line 320
    :cond_2
    invoke-static {p2}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 321
    :catch_0
    move-exception v0

    .line 322
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 325
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_3
    return-object v2
.end method

.method public static createE2EScenario(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;
    .locals 6
    .param p0, "namespace"    # Ljava/lang/String;
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 222
    sget-boolean v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v3, :cond_0

    .line 223
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 226
    :cond_0
    const/4 v1, 0x0

    .line 227
    .local v1, "result":Ljava/lang/Object;
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v3, :cond_1

    .line 229
    :try_start_0
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioConstructor:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    const/4 v5, 0x2

    aput-object p2, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 234
    .end local v1    # "result":Ljava/lang/Object;
    :cond_1
    :goto_0
    if-nez v1, :cond_2

    :goto_1
    return-object v2

    .line 230
    .restart local v1    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 231
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 234
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v1    # "result":Ljava/lang/Object;
    :cond_2
    new-instance v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    invoke-direct {v3, v1, v2}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;-><init>(Ljava/lang/Object;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)V

    move-object v2, v3

    goto :goto_1
.end method

.method public static createE2EScenarioPayload()Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 254
    sget-boolean v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v3, :cond_0

    .line 255
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 258
    :cond_0
    const/4 v1, 0x0

    .line 259
    .local v1, "result":Ljava/lang/Object;
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadConstuctor:Ljava/lang/reflect/Constructor;

    if-eqz v3, :cond_1

    .line 261
    :try_start_0
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadConstuctor:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 266
    .local v0, "ex":Ljava/lang/Exception;
    :cond_1
    :goto_0
    if-nez v1, :cond_2

    :goto_1
    return-object v2

    .line 262
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 263
    .restart local v0    # "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 266
    :cond_2
    new-instance v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;

    invoke-direct {v3, v1, v2}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;-><init>(Ljava/lang/Object;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;)V

    move-object v2, v3

    goto :goto_1
.end method

.method public static createE2EScenarioSettings()Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 238
    sget-boolean v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v3, :cond_0

    .line 239
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 242
    :cond_0
    const/4 v1, 0x0

    .line 243
    .local v1, "result":Ljava/lang/Object;
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v3, :cond_1

    .line 245
    :try_start_0
    sget-object v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsConstructor:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 250
    .local v0, "ex":Ljava/lang/Exception;
    :cond_1
    :goto_0
    if-nez v1, :cond_2

    :goto_1
    return-object v2

    .line 246
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 247
    .restart local v0    # "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 250
    :cond_2
    new-instance v3, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;

    invoke-direct {v3, v1, v2}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;-><init>(Ljava/lang/Object;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)V

    move-object v2, v3

    goto :goto_1
.end method

.method public static finishScenario(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)V
    .locals 5
    .param p0, "scenario"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;

    .prologue
    .line 407
    if-nez p0, :cond_0

    .line 408
    return-void

    .line 411
    :cond_0
    sget-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v1, :cond_1

    .line 412
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->init()V

    .line 415
    :cond_1
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishMatchingScenario:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_2

    .line 417
    :try_start_0
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishMatchingScenario:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;->-get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenario;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 422
    :cond_2
    :goto_0
    return-void

    .line 418
    :catch_0
    move-exception v0

    .line 419
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static init()V
    .locals 7

    .prologue
    .line 140
    sget-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z

    if-nez v1, :cond_1

    .line 141
    sget-object v2, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitLockObject:Ljava/lang/Object;

    monitor-enter v2

    .line 142
    :try_start_0
    sget-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 145
    :try_start_1
    const-string/jumbo v1, "android.os.statistics.E2EScenario"

    .line 144
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    .line 146
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    .line 147
    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x2

    aput-object v4, v3, v5

    .line 146
    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioConstructor:Ljava/lang/reflect/Constructor;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    .local v0, "ex":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    const-string/jumbo v1, "android.os.statistics.E2EScenarioSettings"

    .line 152
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    .line 154
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsConstructor:Ljava/lang/reflect/Constructor;

    .line 155
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    .line 156
    const-string/jumbo v3, "setStatisticsMode"

    .line 155
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 156
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 155
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsMethodSetStatisticsMode:Ljava/lang/reflect/Method;

    .line 157
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    .line 158
    const-string/jumbo v3, "setHistoryLimitPerDay"

    .line 157
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 158
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 157
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsMethodSetHistoryLimitPerDay:Ljava/lang/reflect/Method;

    .line 159
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    .line 160
    const-string/jumbo v3, "enableAutoAnalysis"

    .line 159
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    .line 160
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 159
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsMethodEnableAutoAnalysis:Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 166
    :goto_1
    :try_start_3
    const-string/jumbo v1, "android.os.statistics.E2EScenarioPayload"

    .line 165
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    .line 167
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadConstuctor:Ljava/lang/reflect/Constructor;

    .line 168
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    .line 169
    const-string/jumbo v3, "putValues"

    .line 168
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 169
    const-class v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 168
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadMethodPutValues:Ljava/lang/reflect/Method;

    .line 170
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    .line 171
    const-string/jumbo v3, "putAll"

    .line 170
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 171
    const-class v5, Ljava/util/Map;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 170
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadMethodPutAll:Ljava/lang/reflect/Method;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 177
    :goto_2
    :try_start_4
    const-string/jumbo v1, "android.os.statistics.E2EScenarioPerfTracer"

    .line 176
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 178
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 179
    const-string/jumbo v3, "beginScenario"

    .line 178
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    .line 179
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 178
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenario:Ljava/lang/reflect/Method;

    .line 180
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 181
    const-string/jumbo v3, "beginScenario"

    .line 180
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    .line 181
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    .line 180
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenarioWithTag:Ljava/lang/reflect/Method;

    .line 182
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 183
    const-string/jumbo v3, "beginScenario"

    .line 182
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    .line 183
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    .line 182
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenarioWithPayload:Ljava/lang/reflect/Method;

    .line 184
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 185
    const-string/jumbo v3, "beginScenario"

    .line 184
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Class;

    .line 185
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioSettingsClass:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    const/4 v6, 0x3

    aput-object v5, v4, v6

    .line 184
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sBeginScenarioWithTagAndPayload:Ljava/lang/reflect/Method;

    .line 186
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 187
    const-string/jumbo v3, "abortScenario"

    .line 186
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 187
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 186
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sAbortMatchingScenario:Ljava/lang/reflect/Method;

    .line 188
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 189
    const-string/jumbo v3, "abortScenario"

    .line 188
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    .line 189
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 188
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sAbortMatchingScenarioWithTag:Ljava/lang/reflect/Method;

    .line 190
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 191
    const-string/jumbo v3, "abortScenario"

    .line 190
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 191
    const-class v5, Landroid/os/Bundle;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 190
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sAbortSpecificScenario:Ljava/lang/reflect/Method;

    .line 192
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 193
    const-string/jumbo v3, "finishScenario"

    .line 192
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 193
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 192
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishMatchingScenario:Ljava/lang/reflect/Method;

    .line 194
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 195
    const-string/jumbo v3, "finishScenario"

    .line 194
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    .line 195
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 194
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishMatchingScenarioWithPayload:Ljava/lang/reflect/Method;

    .line 196
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 197
    const-string/jumbo v3, "finishScenario"

    .line 196
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    .line 197
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 196
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishMatchingScenarioWithTag:Ljava/lang/reflect/Method;

    .line 198
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 199
    const-string/jumbo v3, "finishScenario"

    .line 198
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    .line 199
    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioClass:Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    .line 198
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishMatchingScenarioWithTagAndPayload:Ljava/lang/reflect/Method;

    .line 200
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 201
    const-string/jumbo v3, "finishScenario"

    .line 200
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    .line 201
    const-class v5, Landroid/os/Bundle;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 200
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishSpecificScenario:Ljava/lang/reflect/Method;

    .line 202
    sget-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPerfTracerClass:Ljava/lang/Class;

    .line 203
    const-string/jumbo v3, "finishScenario"

    .line 202
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    .line 203
    const-class v5, Landroid/os/Bundle;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v5, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sE2EScenarioPayloadClass:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    .line 202
    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sFinishSpecificScenarioWithPayload:Ljava/lang/reflect/Method;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 207
    :goto_3
    const/4 v1, 0x1

    :try_start_5
    sput-boolean v1, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->sInitialized:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :cond_0
    monitor-exit v2

    .line 211
    :cond_1
    return-void

    .line 204
    :catch_0
    move-exception v0

    .line 205
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    .line 141
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 172
    :catch_1
    move-exception v0

    goto/16 :goto_2

    .line 161
    :catch_2
    move-exception v0

    goto/16 :goto_1

    .line 148
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_3
    move-exception v0

    .restart local v0    # "ex":Ljava/lang/Exception;
    goto/16 :goto_0
.end method
