.class public Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;
.super Ljava/lang/Object;
.source "E2EScenarioPerfTracerInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "E2EScenarioPayload"
.end annotation


# instance fields
.field private final payload:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;

    .prologue
    iget-object v0, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;->payload:Ljava/lang/Object;

    return-object v0
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "payload"    # Ljava/lang/Object;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;->payload:Ljava/lang/Object;

    .line 78
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;)V
    .locals 0
    .param p1, "payload"    # Ljava/lang/Object;
    .param p2, "-this1"    # Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public putAll(Ljava/util/Map;)V
    .locals 5
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 94
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->-get0()Ljava/lang/reflect/Method;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 96
    :try_start_0
    invoke-static {}, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface;->-get0()Ljava/lang/reflect/Method;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/statistic/E2EScenarioPerfTracerInterface$E2EScenarioPayload;->payload:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
