.class Lcom/android/zxing/QRCodeManager$MainThreadHandler$2;
.super Ljava/lang/Object;
.source "QRCodeManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/zxing/QRCodeManager$MainThreadHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

.field final synthetic val$msg:Landroid/os/Message;


# direct methods
.method constructor <init>(Lcom/android/zxing/QRCodeManager$MainThreadHandler;Landroid/os/Message;)V
    .locals 0
    .param p1, "this$1"    # Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$2;->this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    iput-object p2, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$2;->val$msg:Landroid/os/Message;

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 127
    invoke-static {}, Lcom/android/zxing/QRCodeManager;->-get1()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "run: "

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$2;->this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    iget-object v0, v0, Lcom/android/zxing/QRCodeManager$MainThreadHandler;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->-get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$2;->this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    iget-object v0, v0, Lcom/android/zxing/QRCodeManager$MainThreadHandler;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->-get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;

    move-result-object v1

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$2;->val$msg:Landroid/os/Message;

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/zxing/Result;

    invoke-interface {v1, v0}, Lcom/android/zxing/QRCode$QRCodeResultCallback;->onFindQRCode(Lcom/google/zxing/Result;)V

    .line 131
    :cond_0
    return-void
.end method
