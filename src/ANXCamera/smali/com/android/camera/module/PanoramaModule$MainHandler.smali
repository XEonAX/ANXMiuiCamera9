.class Lcom/android/camera/module/PanoramaModule$MainHandler;
.super Landroid/os/Handler;
.source "PanoramaModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/PanoramaModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/PanoramaModule;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/PanoramaModule;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/PanoramaModule;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/PanoramaModule;Lcom/android/camera/module/PanoramaModule$MainHandler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/PanoramaModule;
    .param p2, "-this1"    # Lcom/android/camera/module/PanoramaModule$MainHandler;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/PanoramaModule$MainHandler;-><init>(Lcom/android/camera/module/PanoramaModule;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v6, 0x80

    const/4 v5, 0x2

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 239
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->isCreated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 240
    invoke-virtual {p0, v2}, Lcom/android/camera/module/PanoramaModule$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 241
    return-void

    .line 245
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    if-nez v1, :cond_1

    .line 246
    return-void

    .line 249
    :cond_1
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_0

    .line 251
    sget-boolean v1, Lcom/android/camera/module/PanoramaModule;->DEBUG:Z

    if-eqz v1, :cond_2

    .line 252
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no consumer for this message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 254
    :cond_2
    invoke-static {}, Lcom/android/camera/module/PanoramaModule;->-get0()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no consumer for this message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    :sswitch_0
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/Window;->clearFlags(I)V

    .line 313
    :cond_3
    :goto_0
    return-void

    .line 263
    :sswitch_1
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 264
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 265
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/Window;->addFlags(I)V

    .line 266
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mMainHandler:Landroid/os/Handler;

    .line 267
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v2}, Lcom/android/camera/module/PanoramaModule;->getScreenDelay()I

    move-result v2

    int-to-long v2, v2

    .line 266
    invoke-virtual {v1, v5, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 272
    :sswitch_2
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera;->setBlurFlag(Z)V

    .line 273
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1, v4}, Lcom/android/camera/module/PanoramaModule;->enableCameraControls(Z)V

    goto :goto_0

    .line 277
    :sswitch_3
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iput-boolean v4, v1, Lcom/android/camera/module/PanoramaModule;->mOpenCameraFail:Z

    .line 278
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->onCameraException()V

    goto :goto_0

    .line 282
    :sswitch_4
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v1

    if-nez v1, :cond_3

    .line 283
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iput-boolean v4, v1, Lcom/android/camera/module/PanoramaModule;->mOpenCameraFail:Z

    .line 284
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1}, Lcom/android/camera/module/PanoramaModule;->onCameraException()V

    goto :goto_0

    .line 289
    :sswitch_5
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 290
    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v3, v3, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v2, v3}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v2

    .line 289
    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setPreviewAspectRatio(F)V

    goto :goto_0

    .line 295
    :sswitch_6
    const-wide/16 v2, 0x64

    const/16 v1, 0x16

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/camera/module/PanoramaModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 296
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v1, v1, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget-object v2, v2, Lcom/android/camera/module/PanoramaModule;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->getUIStyleByPreview(II)I

    move-result v0

    .line 297
    .local v0, "style":I
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iget v1, v1, Lcom/android/camera/module/PanoramaModule;->mUIStyle:I

    if-eq v0, v1, :cond_4

    .line 298
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    iput v0, v1, Lcom/android/camera/module/PanoramaModule;->mUIStyle:I

    .line 300
    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-wrap4(Lcom/android/camera/module/PanoramaModule;)V

    .line 301
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1, v4}, Lcom/android/camera/module/PanoramaModule;->enableCameraControls(Z)V

    goto/16 :goto_0

    .line 305
    .end local v0    # "style":I
    :sswitch_7
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-virtual {v1, v2}, Lcom/android/camera/module/PanoramaModule;->setActivity(Lcom/android/camera/Camera;)V

    goto/16 :goto_0

    .line 310
    :sswitch_8
    iget-object v1, p0, Lcom/android/camera/module/PanoramaModule$MainHandler;->this$0:Lcom/android/camera/module/PanoramaModule;

    invoke-static {v1}, Lcom/android/camera/module/PanoramaModule;->-wrap6(Lcom/android/camera/module/PanoramaModule;)V

    goto/16 :goto_0

    .line 249
    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x8 -> :sswitch_5
        0x9 -> :sswitch_6
        0xa -> :sswitch_3
        0x11 -> :sswitch_1
        0x16 -> :sswitch_2
        0x2d -> :sswitch_7
        0x33 -> :sswitch_4
        0x35 -> :sswitch_8
    .end sparse-switch
.end method
