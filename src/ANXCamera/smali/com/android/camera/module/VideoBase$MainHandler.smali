.class Lcom/android/camera/module/VideoBase$MainHandler;
.super Landroid/os/Handler;
.source "VideoBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoBase;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/VideoBase;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/VideoBase;Lcom/android/camera/module/VideoBase$MainHandler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/VideoBase;
    .param p2, "-this1"    # Lcom/android/camera/module/VideoBase$MainHandler;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoBase$MainHandler;-><init>(Lcom/android/camera/module/VideoBase;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v5, 0x80

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 148
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 149
    invoke-virtual {p0, v3}, Lcom/android/camera/module/VideoBase$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 150
    return-void

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    if-nez v0, :cond_1

    .line 154
    return-void

    .line 157
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 159
    sget-boolean v0, Lcom/android/camera/module/VideoBase;->DEBUG:Z

    if-eqz v0, :cond_2

    .line 160
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "no consumer for this message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_2
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "no consumer for this message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    :sswitch_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/Window;->clearFlags(I)V

    .line 251
    :cond_3
    :goto_0
    return-void

    .line 170
    :sswitch_1
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 171
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 172
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/Window;->addFlags(I)V

    .line 173
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v1}, Lcom/android/camera/module/VideoBase;->getScreenDelay()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 177
    :sswitch_2
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->updateRecordingTime()V

    goto :goto_0

    .line 186
    :sswitch_3
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget v1, v1, Lcom/android/camera/module/VideoBase;->mDisplayRotation:I

    if-eq v0, v1, :cond_4

    .line 187
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-boolean v0, v0, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    xor-int/lit8 v0, v0, 0x1

    .line 186
    if-eqz v0, :cond_4

    .line 188
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 190
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-wide v2, v2, Lcom/android/camera/module/VideoBase;->mOnResumeTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v0, v0, v2

    if-gez v0, :cond_3

    .line 191
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x64

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 196
    :sswitch_4
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-static {v0}, Lcom/android/camera/module/VideoBase;->-wrap0(Lcom/android/camera/module/VideoBase;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 197
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/VideoBase;->enableCameraControls(Z)V

    goto :goto_0

    .line 202
    :sswitch_5
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 203
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-boolean v1, v0, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    .line 204
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    goto :goto_0

    .line 208
    :sswitch_6
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 209
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_3

    .line 210
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-boolean v1, v0, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    .line 211
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    goto/16 :goto_0

    .line 216
    :sswitch_7
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onPreviewStart()V

    .line 217
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-object v3, v0, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    goto/16 :goto_0

    .line 221
    :sswitch_8
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 222
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    const/4 v1, 0x6

    .line 223
    const v2, 0x7f0f016b

    .line 222
    invoke-virtual {v0, v1, v2, v4}, Lcom/android/camera/module/VideoBase;->updateTipMessage(III)V

    goto/16 :goto_0

    .line 229
    :sswitch_9
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->restoreMusicSound()V

    goto/16 :goto_0

    .line 233
    :sswitch_a
    iget-object v3, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget v0, p1, Landroid/os/Message;->arg1:I

    if-lez v0, :cond_5

    move v0, v1

    :goto_1
    iget v4, p1, Landroid/os/Message;->arg2:I

    if-lez v4, :cond_6

    :goto_2
    invoke-static {v3, v0, v1}, Lcom/android/camera/module/VideoBase;->-wrap1(Lcom/android/camera/module/VideoBase;ZZ)V

    goto/16 :goto_0

    :cond_5
    move v0, v2

    goto :goto_1

    :cond_6
    move v1, v2

    goto :goto_2

    .line 237
    :sswitch_b
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0, v3}, Lcom/android/camera/module/VideoBase;->setActivity(Lcom/android/camera/Camera;)V

    goto/16 :goto_0

    .line 241
    :sswitch_c
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onWaitStopCallbackTimeout()V

    goto/16 :goto_0

    .line 245
    :sswitch_d
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandlerFinishEmitter:Lio/reactivex/CompletableEmitter;

    if-eqz v0, :cond_3

    .line 246
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandlerFinishEmitter:Lio/reactivex/CompletableEmitter;

    invoke-interface {v0}, Lio/reactivex/CompletableEmitter;->onComplete()V

    .line 247
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-object v3, v0, Lcom/android/camera/module/VideoBase;->mHandlerFinishEmitter:Lio/reactivex/CompletableEmitter;

    goto/16 :goto_0

    .line 157
    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x4 -> :sswitch_3
        0x9 -> :sswitch_7
        0xa -> :sswitch_5
        0x11 -> :sswitch_1
        0x16 -> :sswitch_4
        0x23 -> :sswitch_a
        0x28 -> :sswitch_8
        0x2a -> :sswitch_2
        0x2b -> :sswitch_9
        0x2d -> :sswitch_b
        0x2e -> :sswitch_c
        0x2f -> :sswitch_d
        0x33 -> :sswitch_6
    .end sparse-switch
.end method
