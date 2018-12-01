.class public Lcom/android/zxing/QRCodeManager;
.super Ljava/lang/Object;
.source "QRCodeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/zxing/QRCodeManager$1;,
        Lcom/android/zxing/QRCodeManager$2;,
        Lcom/android/zxing/QRCodeManager$MainThreadHandler;
    }
.end annotation


# static fields
.field private static CENTER_FRAME_WIDTH:I

.field private static final DECODE_TOTAL_TIME:I

.field private static MAX_FRAME_HEIGHT:I

.field private static MAX_FRAME_WIDTH:I

.field private static final TAG:Ljava/lang/String;

.field private static sMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/Context;",
            "Lcom/android/zxing/QRCodeManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mCallBackHandler:Landroid/os/Handler;

.field private mCreated:Z

.field private mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

.field private mDecoding:Z

.field private mFuncEnable:Z

.field private mHandler:Landroid/os/Handler;

.field private mLastPreviewReceivedTime:J

.field private mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

.field private mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

.field private mPreviewFormat:I

.field private mPreviewHeight:I

.field private mPreviewLayoutHeight:I

.field private mPreviewLayoutWidth:I

.field private mPreviewWidth:I

.field private mQRCodeImageReader:Landroid/media/ImageReader;

.field private mQRCodeResultCallback:Lcom/android/zxing/QRCode$QRCodeResultCallback;

.field private mRectFinderCenter:Landroid/graphics/Rect;

.field private mRectFinderFocusArea:Landroid/graphics/Rect;

.field private mRectPreviewCenter:Landroid/graphics/Rect;

.field private mRectPreviewFocusArea:Landroid/graphics/Rect;

.field private mResumed:Z

.field private mScanResult:Ljava/lang/String;

.field private mStartTime:J

.field private objLock:Ljava/lang/Object;


# direct methods
.method static synthetic -get0()I
    .locals 1

    sget v0, Lcom/android/zxing/QRCodeManager;->DECODE_TOTAL_TIME:I

    return v0
.end method

.method static synthetic -get1()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/zxing/QRCodeManager;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    return v0
.end method

.method static synthetic -get3(Lcom/android/zxing/QRCodeManager;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    iget-wide v0, p0, Lcom/android/zxing/QRCodeManager;->mLastPreviewReceivedTime:J

    return-wide v0
.end method

.method static synthetic -get4(Lcom/android/zxing/QRCodeManager;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    return v0
.end method

.method static synthetic -get5(Lcom/android/zxing/QRCodeManager;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    return v0
.end method

.method static synthetic -get6(Lcom/android/zxing/QRCodeManager;)Lcom/android/zxing/QRCode$QRCodeResultCallback;
    .locals 1
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeResultCallback:Lcom/android/zxing/QRCode$QRCodeResultCallback;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/zxing/QRCodeManager;)J
    .locals 2
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    iget-wide v0, p0, Lcom/android/zxing/QRCodeManager;->mStartTime:J

    return-wide v0
.end method

.method static synthetic -set0(Lcom/android/zxing/QRCodeManager;J)J
    .locals 1
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;
    .param p1, "-value"    # J

    .prologue
    iput-wide p1, p0, Lcom/android/zxing/QRCodeManager;->mLastPreviewReceivedTime:J

    return-wide p1
.end method

.method static synthetic -set1(Lcom/android/zxing/QRCodeManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;
    .param p1, "-value"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager;->mScanResult:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/zxing/QRCodeManager;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;

    .prologue
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;->shouldScan()Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    invoke-static {p0}, Lcom/android/zxing/QRCodeManager;->transcoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap2(Lcom/android/zxing/QRCodeManager;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/zxing/QRCodeManager;->responseCallback(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/zxing/QRCodeManager;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;
    .param p1, "delay"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/zxing/QRCodeManager;->restartAfter(I)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/zxing/QRCodeManager;[B)V
    .locals 0
    .param p0, "-this"    # Lcom/android/zxing/QRCodeManager;
    .param p1, "data"    # [B

    .prologue
    invoke-direct {p0, p1}, Lcom/android/zxing/QRCodeManager;->sendDecodeMessage([B)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 30
    const/16 v2, 0x168

    sput v2, Lcom/android/zxing/QRCodeManager;->MAX_FRAME_HEIGHT:I

    .line 31
    const/16 v2, 0x1e0

    sput v2, Lcom/android/zxing/QRCodeManager;->MAX_FRAME_WIDTH:I

    .line 32
    const/16 v2, 0x2d0

    sput v2, Lcom/android/zxing/QRCodeManager;->CENTER_FRAME_WIDTH:I

    .line 33
    const-class v2, Lcom/android/zxing/QRCodeManager;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    .line 34
    new-instance v2, Ljava/util/WeakHashMap;

    invoke-direct {v2}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v2, Lcom/android/zxing/QRCodeManager;->sMap:Ljava/util/WeakHashMap;

    .line 35
    invoke-static {}, Lcom/android/camera/Device;->isLowPowerQRScan()Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x3a98

    :goto_0
    sput v2, Lcom/android/zxing/QRCodeManager;->DECODE_TOTAL_TIME:I

    .line 45
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 47
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/WindowManager;

    .line 48
    .local v1, "wm":Landroid/view/WindowManager;
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 49
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v2, Lcom/android/zxing/QRCodeManager;->CENTER_FRAME_WIDTH:I

    .line 50
    sget v2, Lcom/android/zxing/QRCodeManager;->CENTER_FRAME_WIDTH:I

    sput v2, Lcom/android/zxing/QRCodeManager;->MAX_FRAME_HEIGHT:I

    .line 51
    sget v2, Lcom/android/zxing/QRCodeManager;->CENTER_FRAME_WIDTH:I

    sput v2, Lcom/android/zxing/QRCodeManager;->MAX_FRAME_WIDTH:I

    .line 29
    return-void

    .line 35
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    .end local v1    # "wm":Landroid/view/WindowManager;
    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/16 v0, 0x11

    iput v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewFormat:I

    .line 65
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    .line 66
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    .line 67
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    .line 68
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    .line 77
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->objLock:Ljava/lang/Object;

    .line 79
    new-instance v0, Lcom/android/zxing/QRCodeManager$1;

    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager$1;-><init>(Lcom/android/zxing/QRCodeManager;)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    .line 467
    new-instance v0, Lcom/android/zxing/QRCodeManager$2;

    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager$2;-><init>(Lcom/android/zxing/QRCodeManager;)V

    .line 466
    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 155
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager;->mActivity:Landroid/app/Activity;

    .line 156
    new-instance v0, Lcom/android/zxing/QRCodeManager$MainThreadHandler;

    invoke-virtual {p1}, Landroid/app/Activity;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/zxing/QRCodeManager$MainThreadHandler;-><init>(Lcom/android/zxing/QRCodeManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    .line 157
    return-void
.end method

.method public static instance(Landroid/app/Activity;)Lcom/android/zxing/QRCodeManager;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 160
    sget-object v1, Lcom/android/zxing/QRCodeManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/zxing/QRCodeManager;

    .line 161
    .local v0, "instance":Lcom/android/zxing/QRCodeManager;
    if-nez v0, :cond_0

    .line 162
    new-instance v0, Lcom/android/zxing/QRCodeManager;

    .end local v0    # "instance":Lcom/android/zxing/QRCodeManager;
    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager;-><init>(Landroid/app/Activity;)V

    .line 163
    .restart local v0    # "instance":Lcom/android/zxing/QRCodeManager;
    sget-object v1, Lcom/android/zxing/QRCodeManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_0
    return-object v0
.end method

.method private static removeInstance(Landroid/app/Activity;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 169
    sget-object v1, Lcom/android/zxing/QRCodeManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/zxing/QRCodeManager;

    .line 170
    .local v0, "instance":Lcom/android/zxing/QRCodeManager;
    if-eqz v0, :cond_0

    iget-boolean v1, v0, Lcom/android/zxing/QRCodeManager;->mResumed:Z

    if-eqz v1, :cond_0

    .line 171
    invoke-virtual {v0}, Lcom/android/zxing/QRCodeManager;->pause()V

    .line 173
    :cond_0
    return-void
.end method

.method private responseCallback(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 543
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;->shouldScan()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 544
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mCallBackHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mCallBackHandler:Landroid/os/Handler;

    if-nez v0, :cond_2

    .line 545
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 550
    :cond_1
    :goto_0
    return-void

    .line 547
    :cond_2
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mCallBackHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private restartAfter(I)V
    .locals 4
    .param p1, "delay"    # I

    .prologue
    .line 515
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mFuncEnable:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mResumed:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 516
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    const v1, 0x7f0a0006

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 517
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/zxing/QRCodeManager$5;

    invoke-direct {v1, p0}, Lcom/android/zxing/QRCodeManager$5;-><init>(Lcom/android/zxing/QRCodeManager;)V

    .line 522
    int-to-long v2, p1

    .line 517
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 526
    :goto_0
    return-void

    .line 524
    :cond_0
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "restart decode failed after:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private sendDecodeMessage([B)V
    .locals 6
    .param p1, "data"    # [B

    .prologue
    .line 499
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;->shouldScan()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 500
    :cond_0
    return-void

    .line 502
    :cond_1
    sget-object v1, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "sendDecodeMessage: received a preview data"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    iget-object v2, p0, Lcom/android/zxing/QRCodeManager;->objLock:Ljava/lang/Object;

    monitor-enter v2

    .line 504
    :try_start_0
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    if-eqz v1, :cond_2

    if-eqz p1, :cond_2

    .line 505
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    invoke-virtual {v1}, Lcom/android/zxing/DecodeHandlerFactory;->getHandler()Lcom/android/zxing/DecodeHandler;

    move-result-object v1

    const v3, 0x7f0a0001

    invoke-virtual {v1, v3}, Lcom/android/zxing/DecodeHandler;->removeMessages(I)V

    .line 507
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    invoke-virtual {v1}, Lcom/android/zxing/DecodeHandlerFactory;->getHandler()Lcom/android/zxing/DecodeHandler;

    move-result-object v1

    .line 508
    iget v3, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    iget v4, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    const v5, 0x7f0a0001

    .line 507
    invoke-virtual {v1, v5, v3, v4, p1}, Lcom/android/zxing/DecodeHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 509
    .local v0, "message":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "message":Landroid/os/Message;
    :cond_2
    monitor-exit v2

    .line 512
    return-void

    .line 503
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private shouldScan()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 536
    iget-boolean v1, p0, Lcom/android/zxing/QRCodeManager;->mFuncEnable:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/zxing/QRCodeManager;->mCreated:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/zxing/QRCodeManager;->mResumed:Z

    if-eqz v1, :cond_0

    .line 537
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeResultCallback:Lcom/android/zxing/QRCode$QRCodeResultCallback;

    if-eqz v1, :cond_0

    .line 538
    iget v1, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    if-eqz v1, :cond_0

    .line 539
    iget v1, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 536
    :cond_0
    return v0
.end method

.method private static transcoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 553
    const-string/jumbo v2, ""

    .line 556
    .local v2, "format":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v4, "ISO-8859-1"

    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/nio/charset/CharsetEncoder;->canEncode(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 557
    .local v0, "ISO":Z
    if-eqz v0, :cond_0

    .line 558
    new-instance v3, Ljava/lang/String;

    const-string/jumbo v4, "ISO-8859-1"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    const-string/jumbo v5, "GB2312"

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "format":Ljava/lang/String;
    .local v3, "format":Ljava/lang/String;
    move-object v2, v3

    .line 565
    .end local v0    # "ISO":Z
    .end local v3    # "format":Ljava/lang/String;
    .restart local v2    # "format":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 560
    .restart local v0    # "ISO":Z
    :cond_0
    move-object v2, p0

    goto :goto_0

    .line 562
    .end local v0    # "ISO":Z
    :catch_0
    move-exception v1

    .line 563
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method private updateRectInPreview()V
    .locals 7

    .prologue
    .line 451
    iget v2, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    if-nez v2, :cond_0

    return-void

    .line 452
    :cond_0
    iget v2, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    int-to-float v3, v3

    div-float v1, v2, v3

    .line 453
    .local v1, "scaleWidth":F
    iget v2, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    int-to-float v3, v3

    div-float v0, v2, v3

    .line 454
    .local v0, "scaleHeight":F
    iget-object v2, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    .line 455
    iget-object v3, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    mul-float/2addr v3, v1

    float-to-int v3, v3

    .line 456
    iget-object v4, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    mul-float/2addr v4, v0

    float-to-int v4, v4

    .line 457
    iget-object v5, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    mul-float/2addr v5, v1

    float-to-int v5, v5

    .line 458
    iget-object v6, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    mul-float/2addr v6, v0

    float-to-int v6, v6

    .line 454
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 459
    iget-object v2, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    .line 460
    iget-object v3, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    mul-float/2addr v3, v1

    float-to-int v3, v3

    .line 461
    iget-object v4, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    mul-float/2addr v4, v0

    float-to-int v4, v4

    .line 462
    iget-object v5, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    mul-float/2addr v5, v1

    float-to-int v5, v5

    .line 463
    iget-object v6, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    mul-float/2addr v6, v0

    float-to-int v6, v6

    .line 459
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 464
    return-void
.end method

.method private updateViewFinderRect(Landroid/graphics/Point;)V
    .locals 9
    .param p1, "area"    # Landroid/graphics/Point;

    .prologue
    const/4 v8, 0x0

    .line 427
    iget v6, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    sget v7, Lcom/android/zxing/QRCodeManager;->CENTER_FRAME_WIDTH:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 428
    .local v5, "width":I
    iget v6, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    sget v7, Lcom/android/zxing/QRCodeManager;->CENTER_FRAME_WIDTH:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 429
    .local v1, "height":I
    const/4 v2, 0x0

    .local v2, "left":I
    const/4 v4, 0x0

    .local v4, "top":I
    const/4 v3, 0x0

    .local v3, "right":I
    const/4 v0, 0x0

    .line 430
    .local v0, "bottom":I
    iget v6, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    sub-int/2addr v6, v5

    div-int/lit8 v2, v6, 0x2

    .line 431
    iget v6, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    sub-int/2addr v6, v1

    div-int/lit8 v4, v6, 0x2

    .line 432
    add-int v3, v2, v5

    .line 433
    add-int v0, v4, v1

    .line 434
    iget-object v6, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderCenter:Landroid/graphics/Rect;

    invoke-virtual {v6, v2, v4, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 436
    if-eqz p1, :cond_0

    .line 437
    iget v6, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    sget v7, Lcom/android/zxing/QRCodeManager;->MAX_FRAME_WIDTH:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 438
    iget v6, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    sget v7, Lcom/android/zxing/QRCodeManager;->MAX_FRAME_HEIGHT:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 439
    iget v6, p1, Landroid/graphics/Point;->x:I

    div-int/lit8 v7, v5, 0x2

    sub-int/2addr v6, v7

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 440
    iget v6, p1, Landroid/graphics/Point;->y:I

    div-int/lit8 v7, v1, 0x2

    sub-int/2addr v6, v7

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 441
    iget v6, p1, Landroid/graphics/Point;->x:I

    div-int/lit8 v7, v5, 0x2

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 442
    iget v6, p1, Landroid/graphics/Point;->y:I

    div-int/lit8 v7, v1, 0x2

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 443
    iget-object v6, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    invoke-virtual {v6, v2, v4, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 447
    :goto_0
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;->updateRectInPreview()V

    .line 448
    return-void

    .line 445
    :cond_0
    iget-object v6, p0, Lcom/android/zxing/QRCodeManager;->mRectFinderFocusArea:Landroid/graphics/Rect;

    invoke-virtual {v6, v8, v8, v8, v8}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0
.end method


# virtual methods
.method buildLuminanceSource([BIIZ)Lcom/android/zxing/YUVLuminanceSource;
    .locals 9
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "center"    # Z

    .prologue
    .line 403
    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewFormat:I

    const/16 v1, 0x11

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    if-eqz v0, :cond_1

    .line 405
    if-eqz p4, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 406
    new-instance v0, Lcom/android/zxing/YUVLuminanceSource;

    .line 407
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    iget v4, v1, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 408
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 406
    invoke-direct/range {v0 .. v7}, Lcom/android/zxing/YUVLuminanceSource;-><init>([BIIIIII)V

    return-object v0

    .line 409
    :cond_0
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 410
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewCenter:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 409
    if-eqz v0, :cond_1

    .line 411
    new-instance v0, Lcom/android/zxing/YUVLuminanceSource;

    .line 412
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    iget v4, v1, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    iget v5, v1, Landroid/graphics/Rect;->top:I

    .line 413
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mRectPreviewFocusArea:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 411
    invoke-direct/range {v0 .. v7}, Lcom/android/zxing/YUVLuminanceSource;-><init>([BIIIIII)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 415
    :catch_0
    move-exception v8

    .line 416
    .local v8, "e":Ljava/lang/IllegalArgumentException;
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "buildLuminanceSource: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    .end local v8    # "e":Ljava/lang/IllegalArgumentException;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public create()V
    .locals 1

    .prologue
    .line 180
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mCreated:Z

    .line 181
    return-void
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 208
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mResumed:Z

    if-eqz v0, :cond_0

    .line 209
    invoke-virtual {p0}, Lcom/android/zxing/QRCodeManager;->pause()V

    .line 211
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mCreated:Z

    .line 212
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/zxing/QRCodeManager;->removeInstance(Landroid/app/Activity;)V

    .line 213
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 214
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 216
    :cond_1
    iput-object v1, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    .line 217
    iput-object v1, p0, Lcom/android/zxing/QRCodeManager;->mScanResult:Ljava/lang/String;

    .line 218
    iput-object v1, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeResultCallback:Lcom/android/zxing/QRCode$QRCodeResultCallback;

    .line 219
    iput-object v1, p0, Lcom/android/zxing/QRCodeManager;->mCallBackHandler:Landroid/os/Handler;

    .line 220
    return-void
.end method

.method getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;
    .locals 1

    .prologue
    .line 396
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewCallback:Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    return-object v0
.end method

.method public getScanResult()Ljava/lang/String;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mScanResult:Ljava/lang/String;

    return-object v0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    if-eqz v0, :cond_0

    .line 198
    invoke-virtual {p0}, Lcom/android/zxing/QRCodeManager;->stopDecode()V

    .line 200
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mResumed:Z

    .line 201
    return-void
.end method

.method public reset()V
    .locals 5

    .prologue
    const v4, 0x7f0a0006

    .line 299
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget v0, Lcom/android/zxing/QRCodeManager;->DECODE_TOTAL_TIME:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 300
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 301
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    sget v1, Lcom/android/zxing/QRCodeManager;->DECODE_TOTAL_TIME:I

    int-to-long v2, v1

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 303
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 2

    .prologue
    .line 188
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mResumed:Z

    .line 189
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/zxing/QRCodeManager;->mStartTime:J

    .line 190
    return-void
.end method

.method public setEnable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 229
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {p0}, Lcom/android/zxing/QRCodeManager;->stopDecode()V

    .line 232
    :cond_0
    iput-boolean p1, p0, Lcom/android/zxing/QRCodeManager;->mFuncEnable:Z

    .line 233
    return-void
.end method

.method public setPreviewFormat(I)V
    .locals 2
    .param p1, "format"    # I

    .prologue
    .line 349
    invoke-static {p1}, Landroid/graphics/ImageFormat;->isPublicFormat(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 350
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Format is unknown"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 352
    :cond_0
    iput p1, p0, Lcom/android/zxing/QRCodeManager;->mPreviewFormat:I

    .line 353
    return-void
.end method

.method public setPreviewLayoutSize(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 367
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setPreviewLayoutSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " x "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    if-eq v0, p2, :cond_1

    .line 369
    :cond_0
    iput p1, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutWidth:I

    .line 370
    iput p2, p0, Lcom/android/zxing/QRCodeManager;->mPreviewLayoutHeight:I

    .line 371
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/zxing/QRCodeManager;->updateViewFinderRect(Landroid/graphics/Point;)V

    .line 373
    :cond_1
    return-void
.end method

.method public setResultCallback(Lcom/android/zxing/QRCode$QRCodeResultCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/android/zxing/QRCode$QRCodeResultCallback;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeResultCallback:Lcom/android/zxing/QRCode$QRCodeResultCallback;

    .line 238
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mCallBackHandler:Landroid/os/Handler;

    .line 239
    return-void
.end method

.method public setTransposePreviewSize(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 357
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setTransposePreviewSize:  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " x "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    .line 359
    :cond_0
    iput p1, p0, Lcom/android/zxing/QRCodeManager;->mPreviewWidth:I

    .line 360
    iput p2, p0, Lcom/android/zxing/QRCodeManager;->mPreviewHeight:I

    .line 361
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;->updateRectInPreview()V

    .line 363
    :cond_1
    return-void
.end method

.method public startDecode()V
    .locals 3

    .prologue
    .line 263
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mFuncEnable:Z

    if-nez v0, :cond_0

    .line 264
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startDecode: Function has not been enabled!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    return-void

    .line 267
    :cond_0
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    if-eqz v0, :cond_1

    .line 268
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startDecode: already started!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    return-void

    .line 271
    :cond_1
    invoke-direct {p0}, Lcom/android/zxing/QRCodeManager;->shouldScan()Z

    move-result v0

    if-nez v0, :cond_2

    .line 272
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "startDecode: can not start decode!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    return-void

    .line 275
    :cond_2
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    if-nez v0, :cond_3

    .line 276
    new-instance v0, Lcom/android/zxing/DecodeHandlerFactory;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/zxing/DecodeHandlerFactory;-><init>(Lcom/android/zxing/QRCodeManager;Z)V

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    .line 278
    :cond_3
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    invoke-virtual {v0}, Lcom/android/zxing/DecodeHandlerFactory;->start()V

    .line 279
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_4

    .line 280
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeImageReader:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    iget-object v2, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 282
    :cond_4
    new-instance v0, Lcom/android/zxing/QRCodeManager$3;

    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager$3;-><init>(Lcom/android/zxing/QRCodeManager;)V

    invoke-direct {p0, v0}, Lcom/android/zxing/QRCodeManager;->responseCallback(Ljava/lang/Runnable;)V

    .line 290
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    .line 291
    invoke-virtual {p0}, Lcom/android/zxing/QRCodeManager;->reset()V

    .line 292
    return-void
.end method

.method public stopDecode()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 307
    iget-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    if-nez v0, :cond_0

    .line 308
    sget-object v0, Lcom/android/zxing/QRCodeManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "stopDecode: already stopped!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    return-void

    .line 311
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/QRCodeManager;->mDecoding:Z

    .line 312
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    .line 313
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mQRCodeImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0, v1, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 315
    :cond_1
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    .line 316
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    const v1, 0x7f0a0005

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 317
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    const v1, 0x7f0a0003

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 318
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    const v1, 0x7f0a0002

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 319
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mHandler:Landroid/os/Handler;

    const v1, 0x7f0a0006

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 321
    :cond_2
    iget-object v1, p0, Lcom/android/zxing/QRCodeManager;->objLock:Ljava/lang/Object;

    monitor-enter v1

    .line 322
    :try_start_0
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    if-eqz v0, :cond_3

    .line 323
    iget-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;

    invoke-virtual {v0}, Lcom/android/zxing/DecodeHandlerFactory;->quit()V

    .line 324
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/zxing/QRCodeManager;->mDecodeHandlerFactory:Lcom/android/zxing/DecodeHandlerFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    monitor-exit v1

    .line 327
    new-instance v0, Lcom/android/zxing/QRCodeManager$4;

    invoke-direct {v0, p0}, Lcom/android/zxing/QRCodeManager$4;-><init>(Lcom/android/zxing/QRCodeManager;)V

    invoke-direct {p0, v0}, Lcom/android/zxing/QRCodeManager;->responseCallback(Ljava/lang/Runnable;)V

    .line 335
    return-void

    .line 321
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
