.class Lmiui/hardware/display/DisplayFeatureManager$2;
.super Ljava/lang/Object;
.source "DisplayFeatureManager.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmiui/hardware/display/DisplayFeatureManager;->initServiceDeathRecipient()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/hardware/display/DisplayFeatureManager;


# direct methods
.method constructor <init>(Lmiui/hardware/display/DisplayFeatureManager;)V
    .registers 2
    .param p1, "this$0"    # Lmiui/hardware/display/DisplayFeatureManager;

    .prologue
    .line 1
    iput-object p1, p0, Lmiui/hardware/display/DisplayFeatureManager$2;->this$0:Lmiui/hardware/display/DisplayFeatureManager;

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 4

    .prologue
    .line 132
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager$2;->this$0:Lmiui/hardware/display/DisplayFeatureManager;

    invoke-static {v0}, Lmiui/hardware/display/DisplayFeatureManager;->-get1(Lmiui/hardware/display/DisplayFeatureManager;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 133
    :try_start_7
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "binder service binderDied!"

    invoke-static {v0, v2}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager$2;->this$0:Lmiui/hardware/display/DisplayFeatureManager;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lmiui/hardware/display/DisplayFeatureManager;->-set0(Lmiui/hardware/display/DisplayFeatureManager;Lmiui/hardware/display/DisplayFeatureServiceProxy;)Lmiui/hardware/display/DisplayFeatureServiceProxy;
    :try_end_17
    .catchall {:try_start_7 .. :try_end_17} :catchall_19

    monitor-exit v1

    .line 136
    return-void

    .line 132
    :catchall_19
    move-exception v0

    monitor-exit v1

    throw v0
.end method
