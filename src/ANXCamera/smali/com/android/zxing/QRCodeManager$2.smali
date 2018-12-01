.class Lcom/android/zxing/QRCodeManager$2;
.super Ljava/lang/Object;
.source "QRCodeManager.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/zxing/QRCodeManager;
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
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    .line 467
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 8
    .param p1, "reader"    # Landroid/media/ImageReader;

    .prologue
    .line 474
    invoke-static {}, Lcom/android/zxing/QRCodeManager;->-get1()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "a new ImageReader received"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iget-object v3, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v3}, Lcom/android/zxing/QRCodeManager;->-wrap0(Lcom/android/zxing/QRCodeManager;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v3}, Lcom/android/zxing/QRCodeManager;->-get2(Lcom/android/zxing/QRCodeManager;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_1

    .line 476
    :cond_0
    return-void

    .line 480
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v3, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v3}, Lcom/android/zxing/QRCodeManager;->-get3(Lcom/android/zxing/QRCodeManager;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    cmp-long v3, v4, v6

    if-gez v3, :cond_2

    .line 481
    return-void

    .line 483
    :cond_2
    iget-object v3, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Lcom/android/zxing/QRCodeManager;->-set0(Lcom/android/zxing/QRCodeManager;J)J

    .line 486
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object v2

    .line 487
    .local v2, "img":Landroid/media/Image;
    invoke-virtual {v2}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 488
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v1, v3, [B

    .line 490
    .local v1, "data":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 492
    iget-object v3, p0, Lcom/android/zxing/QRCodeManager$2;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v3, v1}, Lcom/android/zxing/QRCodeManager;->-wrap4(Lcom/android/zxing/QRCodeManager;[B)V

    .line 494
    invoke-virtual {v2}, Landroid/media/Image;->close()V

    .line 495
    return-void
.end method
