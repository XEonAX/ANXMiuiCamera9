.class Lcom/android/camera/Camera$WatchDogThread;
.super Ljava/lang/Thread;
.source "Camera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/Camera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WatchDogThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method private constructor <init>(Lcom/android/camera/Camera;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/Camera;

    .prologue
    .line 1109
    iput-object p1, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/Camera;Lcom/android/camera/Camera$WatchDogThread;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/Camera;
    .param p2, "-this1"    # Lcom/android/camera/Camera$WatchDogThread;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/Camera$WatchDogThread;-><init>(Lcom/android/camera/Camera;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1115
    const-string/jumbo v2, "ANR-WatchDog"

    invoke-virtual {p0, v2}, Lcom/android/camera/Camera$WatchDogThread;->setName(Ljava/lang/String;)V

    .line 1118
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera$WatchDogThread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1119
    const-string/jumbo v2, "WatchDogThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "watch dog run "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1120
    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/Camera;->-get2(Lcom/android/camera/Camera;)I

    move-result v1

    .line 1121
    .local v1, "lastTick":I
    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    iget-object v2, v2, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v3}, Lcom/android/camera/Camera;->-get3(Lcom/android/camera/Camera;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1123
    const-wide/16 v2, 0x1388

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1130
    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/Camera;->-get2(Lcom/android/camera/Camera;)I

    move-result v2

    if-ne v2, v1, :cond_0

    .line 1131
    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v2, v6}, Lcom/android/camera/CameraSettings;->setEdgeMode(Landroid/content/Context;Z)V

    .line 1132
    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/android/camera/Camera;->-wrap1(Lcom/android/camera/Camera;I)V

    .line 1133
    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v2, v6}, Lcom/android/camera/Camera;->-wrap2(Lcom/android/camera/Camera;Z)V

    .line 1134
    return-void

    .line 1124
    :catch_0
    move-exception v0

    .line 1125
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string/jumbo v2, "WatchDogThread"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "watch dog InterruptedException "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1126
    return-void

    .line 1137
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "lastTick":I
    :cond_1
    return-void
.end method
