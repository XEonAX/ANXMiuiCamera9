.class Lcom/android/camera/module/Camera2Module$MainHandler;
.super Landroid/os/Handler;
.source "Camera2Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Camera2Module;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 1760
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1761
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1762
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

    .line 1766
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1767
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1768
    return-void

    .line 1771
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1772
    return-void

    .line 1775
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 1778
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

    .line 1781
    :sswitch_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 1782
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V

    .line 1869
    :cond_2
    :goto_0
    :sswitch_1
    return-void

    .line 1795
    :sswitch_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->checkActivityOrientation()V

    .line 1798
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->-get12(Lcom/android/camera/module/Camera2Module;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 1799
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v0

    const-wide/16 v2, 0x64

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 1804
    :sswitch_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/Camera2Module;->-wrap12(Lcom/android/camera/module/Camera2Module;II)V

    goto :goto_0

    .line 1808
    :sswitch_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-wrap11(Lcom/android/camera/module/Camera2Module;)V

    goto :goto_0

    .line 1812
    :sswitch_5
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v0, p1, Landroid/os/Message;->arg1:I

    if-lez v0, :cond_3

    move v0, v1

    :goto_1
    iget v4, p1, Landroid/os/Message;->arg2:I

    if-lez v4, :cond_4

    :goto_2
    invoke-static {v3, v0, v1}, Lcom/android/camera/module/Camera2Module;->-wrap8(Lcom/android/camera/module/Camera2Module;ZZ)V

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_1

    :cond_4
    move v1, v2

    goto :goto_2

    .line 1816
    :sswitch_6
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0

    .line 1820
    :sswitch_7
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1821
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1822
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/Window;->addFlags(I)V

    .line 1823
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get5(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->getScreenDelay()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v4, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 1827
    :sswitch_8
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0, v3}, Lcom/android/camera/module/Camera2Module;->setActivity(Lcom/android/camera/Camera;)V

    goto/16 :goto_0

    .line 1831
    :sswitch_9
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1832
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean v1, v0, Lcom/android/camera/module/Camera2Module;->mOpenCameraFail:Z

    .line 1833
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->onCameraException()V

    goto/16 :goto_0

    .line 1838
    :sswitch_a
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean v1, v0, Lcom/android/camera/module/Camera2Module;->mOpenCameraFail:Z

    .line 1839
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->onCameraException()V

    goto/16 :goto_0

    .line 1843
    :sswitch_b
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    goto/16 :goto_0

    .line 1847
    :sswitch_c
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1848
    return-void

    .line 1850
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-wrap15(Lcom/android/camera/module/Camera2Module;)V

    .line 1851
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->-get1(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object v0

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->onComplete()V

    goto/16 :goto_0

    .line 1855
    :sswitch_d
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "later release timeout!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1857
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->onPictureTakenFailed()V

    goto/16 :goto_0

    .line 1861
    :sswitch_e
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    goto/16 :goto_0

    .line 1865
    :sswitch_f
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->restartModule()V

    goto/16 :goto_0

    .line 1775
    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_6
        0x4 -> :sswitch_2
        0x9 -> :sswitch_0
        0xa -> :sswitch_a
        0xb -> :sswitch_1
        0x11 -> :sswitch_7
        0x1f -> :sswitch_4
        0x21 -> :sswitch_3
        0x23 -> :sswitch_5
        0x2c -> :sswitch_f
        0x2d -> :sswitch_8
        0x30 -> :sswitch_b
        0x31 -> :sswitch_c
        0x32 -> :sswitch_d
        0x33 -> :sswitch_9
        0x34 -> :sswitch_e
    .end sparse-switch
.end method
