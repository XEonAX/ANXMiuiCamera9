.class Lcom/android/camera2/MiCamera2$1;
.super Landroid/os/Handler;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->initHelperHandler(Landroid/os/Looper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera2/MiCamera2;
    .param p2, "$anonymous0"    # Landroid/os/Looper;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    .line 141
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 145
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 157
    :goto_0
    return-void

    .line 147
    :pswitch_0
    invoke-static {}, Lcom/android/camera2/MiCamera2;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "waiting af lock timeOut"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-get1(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->showAutoFocusFinish(Z)V

    .line 149
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-wrap1(Lcom/android/camera2/MiCamera2;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-wrap8(Lcom/android/camera2/MiCamera2;)V

    goto :goto_0

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-get1(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 153
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->-wrap4(Lcom/android/camera2/MiCamera2;)V

    goto :goto_0

    .line 145
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
