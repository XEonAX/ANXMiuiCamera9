.class Lcom/android/zxing/QRCodeManager$MainThreadHandler$1;
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


# direct methods
.method constructor <init>(Lcom/android/zxing/QRCodeManager$MainThreadHandler;)V
    .locals 0
    .param p1, "this$1"    # Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$1;->this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$1;->this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    iget-object v0, v0, Lcom/android/zxing/QRCodeManager$MainThreadHandler;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->-get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$MainThreadHandler$1;->this$1:Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    iget-object v0, v0, Lcom/android/zxing/QRCodeManager$MainThreadHandler;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->-get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/zxing/QRCode$QRCodeResultCallback;->onFailed()V

    .line 118
    :cond_0
    return-void
.end method
