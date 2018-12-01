.class Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;
.super Landroid/os/Handler;
.source "FocusManager2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/FocusManager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/loader/camera2/FocusManager2;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/loader/camera2/FocusManager2;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 130
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 131
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x4

    .line 135
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 173
    :goto_0
    return-void

    .line 147
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 148
    const/16 v2, 0xa6

    .line 147
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 150
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
    if-eqz v0, :cond_0

    .line 151
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->reShowFaceRect()V

    .line 155
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 156
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v1

    .line 155
    if-eqz v1, :cond_2

    .line 157
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v1, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap3(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 158
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v1, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap4(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 159
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get5(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 160
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap1(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto :goto_0

    .line 162
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap0(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto :goto_0

    .line 165
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$MainHandler;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelFocus()V

    goto :goto_0

    .line 135
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
