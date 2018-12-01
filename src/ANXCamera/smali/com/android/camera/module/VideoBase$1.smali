.class Lcom/android/camera/module/VideoBase$1;
.super Landroid/telephony/PhoneStateListener;
.source "VideoBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoBase;


# direct methods
.method constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/VideoBase;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$1;->this$0:Lcom/android/camera/module/VideoBase;

    .line 268
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "incomingNumber"    # Ljava/lang/String;

    .prologue
    .line 271
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/VideoBase$1;->this$0:Lcom/android/camera/module/VideoBase;

    iget-boolean v0, v0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-eqz v0, :cond_0

    .line 272
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "CALL_STATE_OFFHOOK"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$1;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onStop()V

    .line 275
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/telephony/PhoneStateListener;->onCallStateChanged(ILjava/lang/String;)V

    .line 276
    return-void
.end method
