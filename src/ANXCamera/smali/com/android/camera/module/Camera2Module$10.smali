.class Lcom/android/camera/module/Camera2Module$10;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/zxing/QRCode$QRCodeResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$10;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1596
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onDecodeTimeOut()V
    .locals 3

    .prologue
    .line 1614
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1615
    const/16 v2, 0xaf

    .line 1614
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1616
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideQrCodeTip()V

    .line 1617
    return-void
.end method

.method public onFailed()V
    .locals 0

    .prologue
    .line 1622
    return-void
.end method

.method public onFindQRCode(Lcom/google/zxing/Result;)V
    .locals 3
    .param p1, "result"    # Lcom/google/zxing/Result;

    .prologue
    .line 1605
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$10;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1606
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1607
    const/16 v2, 0xaf

    .line 1606
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 1608
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showQrCodeTip()V

    .line 1610
    .end local v0    # "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 1600
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "onStart"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1601
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 1627
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "onStop"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1628
    return-void
.end method
