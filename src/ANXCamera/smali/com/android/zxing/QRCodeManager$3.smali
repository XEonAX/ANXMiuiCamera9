.class Lcom/android/zxing/QRCodeManager$3;
.super Ljava/lang/Object;
.source "QRCodeManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/zxing/QRCodeManager;->startDecode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/zxing/QRCodeManager;


# direct methods
.method constructor <init>(Lcom/android/zxing/QRCodeManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$3;->this$0:Lcom/android/zxing/QRCodeManager;

    .line 282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$3;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->-get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager$3;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->-get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/zxing/QRCode$QRCodeResultCallback;->onStart()V

    .line 288
    :cond_0
    return-void
.end method
