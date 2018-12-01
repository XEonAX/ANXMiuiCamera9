.class Lcom/android/camera/module/FunModule$2;
.super Landroid/os/CountDownTimer;
.source "FunModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/FunModule;->updateRecordingTime()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/FunModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/FunModule;JJ)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/FunModule;
    .param p2, "$anonymous0"    # J
    .param p4, "$anonymous1"    # J

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/FunModule$2;->this$0:Lcom/android/camera/module/FunModule;

    .line 596
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 1
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .prologue
    .line 609
    iget-object v0, p0, Lcom/android/camera/module/FunModule$2;->this$0:Lcom/android/camera/module/FunModule;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/FunModule;->stopVideoRecording(ZZ)V

    .line 610
    return-void
.end method

.method public onTick(J)V
    .locals 7
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 600
    const-wide/16 v2, 0x3b6

    add-long/2addr v2, p1

    const-wide/16 v4, 0x1c2

    sub-long/2addr v2, v4

    const/4 v4, 0x0

    .line 599
    invoke-static {v2, v3, v4}, Lcom/android/camera/module/FunModule;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object v0

    .line 602
    .local v0, "text":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 603
    const/16 v3, 0xac

    .line 602
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 604
    .local v1, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 605
    return-void
.end method
