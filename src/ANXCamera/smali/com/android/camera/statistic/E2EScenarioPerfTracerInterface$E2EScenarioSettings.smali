.class public Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;
.super Ljava/lang/Object;
.source "E2EScenarioPerfTracerInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "E2EScenarioSettings"
.end annotation


# instance fields
.field private final scenarioSettings:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;

    .prologue
    iget-object v0, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->scenarioSettings:Ljava/lang/Object;

    return-object v0
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "scenarioSettings"    # Ljava/lang/Object;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->scenarioSettings:Ljava/lang/Object;

    .line 39
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;)V
    .locals 0
    .param p1, "scenarioSettings"    # Ljava/lang/Object;
    .param p2, "-this1"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public setHistoryLimitPerDay(I)V
    .locals 6
    .param p1, "historyLimitPerDay"    # I

    .prologue
    .line 52
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->-get3()Ljava/lang/reflect/Method;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 54
    :try_start_0
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->-get3()Ljava/lang/reflect/Method;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->scenarioSettings:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public setStatisticsMode(I)V
    .locals 6
    .param p1, "mode"    # I

    .prologue
    .line 42
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->-get4()Ljava/lang/reflect/Method;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 44
    :try_start_0
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->-get4()Ljava/lang/reflect/Method;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioSettings;->scenarioSettings:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
