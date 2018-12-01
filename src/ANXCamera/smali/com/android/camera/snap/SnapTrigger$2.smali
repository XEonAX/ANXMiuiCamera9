.class Lcom/android/camera/snap/SnapTrigger$2;
.super Ljava/lang/Object;
.source "SnapTrigger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/snap/SnapTrigger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/snap/SnapTrigger;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapTrigger;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 169
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    invoke-static {v0}, Lcom/android/camera/snap/SnapTrigger;->-wrap1(Lcom/android/camera/snap/SnapTrigger;)V

    .line 170
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    invoke-static {v0}, Lcom/android/camera/snap/SnapTrigger;->-get4(Lcom/android/camera/snap/SnapTrigger;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    invoke-static {v0}, Lcom/android/camera/snap/SnapTrigger;->-get3(Lcom/android/camera/snap/SnapTrigger;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 171
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    invoke-static {v0}, Lcom/android/camera/snap/SnapTrigger;->-get4(Lcom/android/camera/snap/SnapTrigger;)Landroid/os/Handler;

    move-result-object v1

    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    invoke-static {v0}, Lcom/android/camera/snap/SnapTrigger;->-get6(Lcom/android/camera/snap/SnapTrigger;)Ljava/lang/Runnable;

    move-result-object v2

    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger$2;->this$0:Lcom/android/camera/snap/SnapTrigger;

    invoke-static {v0}, Lcom/android/camera/snap/SnapTrigger;->-get2(Lcom/android/camera/snap/SnapTrigger;)Lcom/android/camera/snap/SnapCamera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/snap/SnapCamera;->isCamcorder()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x64

    :goto_0
    int-to-long v4, v0

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 175
    :goto_1
    return-void

    .line 171
    :cond_0
    const/16 v0, 0xc8

    goto :goto_0

    .line 173
    :cond_1
    invoke-static {}, Lcom/android/camera/snap/SnapTrigger;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "wait camera"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
