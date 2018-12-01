.class final Lcom/android/zxing/DecodeHandler;
.super Landroid/os/Handler;
.source "DecodeHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCancel:Z

.field private final mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private final mQRCodeProxy:Lcom/android/zxing/QRCodeManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/android/zxing/DecodeHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/zxing/DecodeHandler;->TAG:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public constructor <init>(Lcom/android/zxing/QRCodeManager;Landroid/os/Looper;Ljava/util/Hashtable;)V
    .locals 1
    .param p1, "mProxy"    # Lcom/android/zxing/QRCodeManager;
    .param p2, "looper"    # Landroid/os/Looper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/zxing/QRCodeManager;",
            "Landroid/os/Looper;",
            "Ljava/util/Hashtable",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p3, "hints":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 28
    iput-object p1, p0, Lcom/android/zxing/DecodeHandler;->mQRCodeProxy:Lcom/android/zxing/QRCodeManager;

    .line 29
    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/DecodeHandler;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 30
    iget-object v0, p0, Lcom/android/zxing/DecodeHandler;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0, p3}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 31
    return-void
.end method

.method private decode([BII)V
    .locals 10
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v8, 0x0

    .line 50
    iget-boolean v7, p0, Lcom/android/zxing/DecodeHandler;->mCancel:Z

    if-eqz v7, :cond_0

    .line 51
    return-void

    .line 54
    :cond_0
    mul-int v7, p2, p3

    new-array v5, v7, [B

    .line 56
    .local v5, "rotatedData":[B
    array-length v7, p1

    mul-int v9, p2, p3

    if-le v7, v9, :cond_2

    .line 57
    array-length v7, v5

    invoke-static {p1, v8, v5, v8, v7}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 62
    :goto_0
    const/4 v0, 0x0

    .line 63
    .local v0, "bitmap":Lcom/google/zxing/BinaryBitmap;
    const/4 v1, 0x2

    .line 64
    .local v1, "decodeTimeMost":I
    const/4 v6, 0x0

    .line 65
    .local v6, "source":Lcom/android/zxing/YUVLuminanceSource;
    const/4 v3, 0x0

    .line 69
    .end local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .end local v6    # "source":Lcom/android/zxing/YUVLuminanceSource;
    :cond_1
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_6

    .line 70
    iget-boolean v7, p0, Lcom/android/zxing/DecodeHandler;->mCancel:Z

    if-eqz v7, :cond_3

    return-void

    .line 59
    .end local v1    # "decodeTimeMost":I
    :cond_2
    move-object v5, p1

    goto :goto_0

    .line 71
    .restart local v1    # "decodeTimeMost":I
    :cond_3
    iget-object v9, p0, Lcom/android/zxing/DecodeHandler;->mQRCodeProxy:Lcom/android/zxing/QRCodeManager;

    if-nez v1, :cond_4

    const/4 v7, 0x1

    :goto_1
    invoke-virtual {v9, v5, p2, p3, v7}, Lcom/android/zxing/QRCodeManager;->buildLuminanceSource([BIIZ)Lcom/android/zxing/YUVLuminanceSource;

    move-result-object v6

    .line 72
    .local v6, "source":Lcom/android/zxing/YUVLuminanceSource;
    if-eqz v6, :cond_1

    .line 75
    new-instance v0, Lcom/google/zxing/BinaryBitmap;

    new-instance v7, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v7, v6}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {v0, v7}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 77
    .local v0, "bitmap":Lcom/google/zxing/BinaryBitmap;
    :try_start_0
    iget-object v7, p0, Lcom/android/zxing/DecodeHandler;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7, v0}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 81
    .local v3, "rawResult":Lcom/google/zxing/Result;
    iget-object v7, p0, Lcom/android/zxing/DecodeHandler;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 83
    .end local v3    # "rawResult":Lcom/google/zxing/Result;
    :goto_2
    if-eqz v3, :cond_1

    .line 84
    iget-boolean v7, p0, Lcom/android/zxing/DecodeHandler;->mCancel:Z

    if-eqz v7, :cond_5

    return-void

    .end local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .end local v6    # "source":Lcom/android/zxing/YUVLuminanceSource;
    :cond_4
    move v7, v8

    .line 71
    goto :goto_1

    .line 78
    .restart local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .restart local v6    # "source":Lcom/android/zxing/YUVLuminanceSource;
    :catch_0
    move-exception v4

    .line 79
    .local v4, "re":Lcom/google/zxing/ReaderException;
    :try_start_1
    sget-object v7, Lcom/android/zxing/DecodeHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "decode: ReaderException: "

    invoke-static {v7, v9, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    iget-object v7, p0, Lcom/android/zxing/DecodeHandler;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7}, Lcom/google/zxing/MultiFormatReader;->reset()V

    goto :goto_2

    .line 80
    .end local v4    # "re":Lcom/google/zxing/ReaderException;
    :catchall_0
    move-exception v7

    .line 81
    iget-object v8, p0, Lcom/android/zxing/DecodeHandler;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v8}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 80
    throw v7

    .line 85
    :cond_5
    iget-object v7, p0, Lcom/android/zxing/DecodeHandler;->mQRCodeProxy:Lcom/android/zxing/QRCodeManager;

    invoke-virtual {v7}, Lcom/android/zxing/QRCodeManager;->getHandler()Landroid/os/Handler;

    move-result-object v7

    const v8, 0x7f0a0003

    invoke-virtual {v7, v8, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 86
    .local v2, "message":Landroid/os/Message;
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 87
    return-void

    .line 90
    .end local v0    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .end local v2    # "message":Landroid/os/Message;
    .end local v6    # "source":Lcom/android/zxing/YUVLuminanceSource;
    :cond_6
    iget-boolean v7, p0, Lcom/android/zxing/DecodeHandler;->mCancel:Z

    if-eqz v7, :cond_7

    .line 91
    return-void

    .line 93
    :cond_7
    iget-object v7, p0, Lcom/android/zxing/DecodeHandler;->mQRCodeProxy:Lcom/android/zxing/QRCodeManager;

    invoke-virtual {v7}, Lcom/android/zxing/QRCodeManager;->getHandler()Landroid/os/Handler;

    move-result-object v7

    const v8, 0x7f0a0005

    invoke-virtual {v7, v8}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 94
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/DecodeHandler;->mCancel:Z

    .line 44
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 35
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 40
    :goto_0
    return-void

    .line 37
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v0, v1, v2}, Lcom/android/zxing/DecodeHandler;->decode([BII)V

    goto :goto_0

    .line 35
    :pswitch_data_0
    .packed-switch 0x7f0a0001
        :pswitch_0
    .end packed-switch
.end method
