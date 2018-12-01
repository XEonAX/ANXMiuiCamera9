.class Lcom/android/zxing/QRCodeManager$1;
.super Ljava/lang/Object;
.source "QRCodeManager.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


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
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onPreviewFrame(Lcom/android/camera2/PreviewImageProp;Lcom/android/camera2/Camera2Proxy;)V
    .locals 6
    .param p1, "previewImage"    # Lcom/android/camera2/PreviewImageProp;
    .param p2, "camera"    # Lcom/android/camera2/Camera2Proxy;

    .prologue
    .line 82
    invoke-static {}, Lcom/android/zxing/QRCodeManager;->-get1()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "preview frame buffer received"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->-wrap0(Lcom/android/zxing/QRCodeManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->-get2(Lcom/android/zxing/QRCodeManager;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 84
    :cond_0
    return-void

    .line 86
    :cond_1
    invoke-static {}, Lcom/android/zxing/QRCodeManager;->-get0()I

    move-result v1

    if-ltz v1, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->-get7(Lcom/android/zxing/QRCodeManager;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {}, Lcom/android/zxing/QRCodeManager;->-get0()I

    move-result v1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    .line 87
    return-void

    .line 90
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->-get3(Lcom/android/zxing/QRCodeManager;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    cmp-long v1, v2, v4

    if-gez v1, :cond_3

    .line 91
    return-void

    .line 93
    :cond_3
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/android/zxing/QRCodeManager;->-set0(Lcom/android/zxing/QRCodeManager;J)J

    .line 97
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1}, Lcom/android/zxing/QRCodeManager;->-get5(Lcom/android/zxing/QRCodeManager;)I

    move-result v1

    iget-object v2, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v2}, Lcom/android/zxing/QRCodeManager;->-get4(Lcom/android/zxing/QRCodeManager;)I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/android/camera2/PreviewImageProp;->removePadding(Lcom/android/camera2/PreviewImageProp;II)[B

    move-result-object v0

    .line 98
    .local v0, "mNoStrideData":[B
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager$1;->this$0:Lcom/android/zxing/QRCodeManager;

    invoke-static {v1, v0}, Lcom/android/zxing/QRCodeManager;->-wrap4(Lcom/android/zxing/QRCodeManager;[B)V

    .line 99
    return-void
.end method
