.class public Lcom/android/camera/storage/ImageSaver;
.super Ljava/lang/Object;
.source "ImageSaver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/storage/ImageSaver$1;,
        Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;,
        Lcom/android/camera/storage/ImageSaver$MemoryManager;,
        Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;,
        Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;
    }
.end annotation


# static fields
.field private static final CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static final mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mHandler:Landroid/os/Handler;

.field private mHostState:I

.field private mIsCaptureIntent:Z

.field private mLastImageUri:Landroid/net/Uri;

.field private mMemoryManager:Lcom/android/camera/storage/ImageSaver$MemoryManager;

.field private mPendingThumbnail:Lcom/android/camera/Thumbnail;

.field private mShouldStop:Z

.field private mStop:Z

.field private mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

.field private mUpdateThumbnailLock:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;

    .prologue
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/storage/ImageSaver$MemoryManager;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;

    .prologue
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/ImageSaver$MemoryManager;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/storage/ImageSaver;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mShouldStop:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/storage/ImageSaver;Z)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "finalImage"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->needThumbnail(Z)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "addToSecure"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/storage/ImageSaver;->notifyNewImage(Landroid/net/Uri;Z)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->notifyNewVideo(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/storage/ImageSaver;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->postHideThumbnailProgressing()V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/Thumbnail;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "t"    # Lcom/android/camera/Thumbnail;
    .param p2, "needAnimation"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/storage/ImageSaver;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/Thumbnail;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "t"    # Lcom/android/camera/Thumbnail;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;)V

    return-void
.end method

.method static synthetic -wrap6(Lcom/android/camera/storage/ImageSaver;Landroid/net/Uri;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->updatePreviewThumbnailUri(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic -wrap7(Lcom/android/camera/storage/ImageSaver;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/storage/ImageSaver;
    .param p1, "needAnimation"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->updateThumbnail(Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v2, 0x4

    .line 65
    new-instance v0, Lcom/android/camera/storage/ImageSaver$1;

    invoke-direct {v0}, Lcom/android/camera/storage/ImageSaver$1;-><init>()V

    sput-object v0, Lcom/android/camera/storage/ImageSaver;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 73
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v3, 0x80

    invoke-direct {v0, v3}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    .line 72
    sput-object v0, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    .line 77
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 78
    const-wide/16 v4, 0xa

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 79
    sget-object v7, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v8, Lcom/android/camera/storage/ImageSaver;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    move v3, v2

    .line 77
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 80
    .local v1, "threadPoolExecutor":Ljava/util/concurrent/ThreadPoolExecutor;
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 81
    sput-object v1, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;Landroid/os/Handler;Z)V
    .locals 2
    .param p1, "activity"    # Lcom/android/camera/ActivityBase;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "isCaptureIntent"    # Z

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    .line 353
    new-instance v0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-direct {v0, p0}, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    .line 86
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    .line 87
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    .line 88
    iput-boolean p3, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    .line 89
    new-instance v0, Lcom/android/camera/storage/ImageSaver$MemoryManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/storage/ImageSaver$MemoryManager;-><init>(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/storage/ImageSaver$MemoryManager;)V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/ImageSaver$MemoryManager;

    .line 91
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/ImageSaver$MemoryManager;

    invoke-static {v0}, Lcom/android/camera/storage/ImageSaver$MemoryManager;->-wrap5(Lcom/android/camera/storage/ImageSaver$MemoryManager;)V

    .line 93
    return-void
.end method

.method private addImage(Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;)V
    .locals 2
    .param p1, "r"    # Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;

    .prologue
    .line 182
    monitor-enter p0

    .line 183
    :try_start_0
    iget v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    .line 184
    const-string/jumbo v0, "ImageSaver"

    const-string/jumbo v1, "addImage: host is being destroyed."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 185
    return-void

    .line 187
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 188
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mShouldStop:Z

    .line 191
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mStop:Z

    if-eqz v0, :cond_2

    .line 192
    const-string/jumbo v0, "ImageSaver"

    const-string/jumbo v1, "run: exiting"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 193
    return-void

    .line 196
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/ImageSaver$MemoryManager;

    invoke-virtual {p1}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->getSize()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/storage/ImageSaver$MemoryManager;->-wrap4(Lcom/android/camera/storage/ImageSaver$MemoryManager;I)V

    .line 198
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    .line 203
    return-void

    .line 182
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private isLastImageForThumbnail()Z
    .locals 1

    .prologue
    .line 446
    const/4 v0, 0x1

    return v0
.end method

.method private needThumbnail(Z)Z
    .locals 2
    .param p1, "finalImage"    # Z

    .prologue
    .line 375
    monitor-enter p0

    .line 380
    if-eqz p1, :cond_0

    .line 381
    :try_start_0
    iget v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 382
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->isLastImageForThumbnail()Z

    move-result v0

    .line 380
    if-eqz v0, :cond_0

    .line 383
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    monitor-exit p0

    .line 380
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 375
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private notifyNewImage(Landroid/net/Uri;Z)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "addToSecure"    # Z

    .prologue
    .line 422
    monitor-enter p0

    .line 423
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-nez v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v0, p1}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    .line 425
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mLastImageUri:Landroid/net/Uri;

    .line 426
    if-eqz p2, :cond_0

    .line 427
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0, p1}, Lcom/android/camera/ActivityBase;->addSecureUri(Landroid/net/Uri;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 431
    return-void

    .line 422
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private notifyNewVideo(Landroid/net/Uri;)V
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 434
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-nez v0, :cond_0

    .line 435
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.hardware.action.NEW_VIDEO"

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->sendBroadcast(Landroid/content/Intent;)V

    .line 436
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0, p1}, Lcom/android/camera/ActivityBase;->addSecureUri(Landroid/net/Uri;)V

    .line 438
    :cond_0
    return-void
.end method

.method private postHideThumbnailProgressing()V
    .locals 3

    .prologue
    .line 408
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v1

    .line 409
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/storage/ImageSaver$2;

    invoke-direct {v2, p0}, Lcom/android/camera/storage/ImageSaver$2;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 419
    return-void

    .line 408
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private postUpdateThumbnail(Lcom/android/camera/Thumbnail;)V
    .locals 1
    .param p1, "t"    # Lcom/android/camera/Thumbnail;

    .prologue
    .line 388
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera/storage/ImageSaver;->postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V

    .line 389
    return-void
.end method

.method private postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 3
    .param p1, "t"    # Lcom/android/camera/Thumbnail;
    .param p2, "needAnimation"    # Z

    .prologue
    .line 392
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v1

    .line 395
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 396
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {v0, p2}, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->setNeedAnimation(Z)V

    .line 397
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 399
    return-void

    .line 392
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private quitAllSaveThread()V
    .locals 0

    .prologue
    .line 99
    return-void
.end method

.method private updatePreviewThumbnailUri(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 402
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v1

    .line 403
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ThumbnailUpdater;->updatePreviewThumbnailUri(Landroid/net/Uri;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 405
    return-void

    .line 402
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private updateThumbnail(Z)V
    .locals 4
    .param p1, "needAnimation"    # Z

    .prologue
    .line 360
    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v2

    .line 361
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 362
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 363
    .local v0, "t":Lcom/android/camera/Thumbnail;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 366
    if-eqz v0, :cond_0

    .line 367
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2, p1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 368
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 369
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ThumbnailUpdater;->saveThumbnailToFile()V

    .line 372
    :cond_0
    return-void

    .line 360
    .end local v0    # "t":Lcom/android/camera/Thumbnail;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZ)V
    .locals 20
    .param p1, "data"    # [B
    .param p2, "needThumbnail"    # Z
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "date"    # J
    .param p6, "uri"    # Landroid/net/Uri;
    .param p7, "loc"    # Landroid/location/Location;
    .param p8, "width"    # I
    .param p9, "height"    # I
    .param p10, "exif"    # Lcom/android/gallery3d/exif/ExifInterface;
    .param p11, "orientation"    # I
    .param p12, "isHide"    # Z
    .param p13, "isMapFile"    # Z
    .param p14, "finalImage"    # Z
    .param p15, "mirror"    # Z

    .prologue
    .line 106
    const/4 v5, 0x0

    .line 107
    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-wide/from16 v6, p4

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move-object/from16 v12, p10

    move/from16 v13, p11

    move/from16 v14, p12

    move/from16 v15, p13

    move/from16 v16, p14

    move/from16 v17, p15

    .line 106
    invoke-virtual/range {v1 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V

    .line 108
    return-void
.end method

.method public addImage([BZLjava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V
    .locals 20
    .param p1, "data"    # [B
    .param p2, "needThumbnail"    # Z
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "date"    # J
    .param p6, "uri"    # Landroid/net/Uri;
    .param p7, "loc"    # Landroid/location/Location;
    .param p8, "width"    # I
    .param p9, "height"    # I
    .param p10, "exif"    # Lcom/android/gallery3d/exif/ExifInterface;
    .param p11, "orientation"    # I
    .param p12, "isHide"    # Z
    .param p13, "isMapFile"    # Z
    .param p14, "finalImage"    # Z
    .param p15, "mirror"    # Z
    .param p16, "isParallelProcess"    # Z
    .param p17, "algorithmName"    # Ljava/lang/String;

    .prologue
    .line 114
    const/4 v5, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-wide/from16 v6, p4

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move-object/from16 v12, p10

    move/from16 v13, p11

    move/from16 v14, p12

    move/from16 v15, p13

    move/from16 v16, p14

    move/from16 v17, p15

    move/from16 v18, p16

    move-object/from16 v19, p17

    invoke-virtual/range {v1 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V

    .line 116
    return-void
.end method

.method public addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V
    .locals 23
    .param p1, "data"    # [B
    .param p2, "needThumbnail"    # Z
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "oldTitle"    # Ljava/lang/String;
    .param p5, "date"    # J
    .param p7, "uri"    # Landroid/net/Uri;
    .param p8, "loc"    # Landroid/location/Location;
    .param p9, "width"    # I
    .param p10, "height"    # I
    .param p11, "exif"    # Lcom/android/gallery3d/exif/ExifInterface;
    .param p12, "orientation"    # I
    .param p13, "isHide"    # Z
    .param p14, "isMapFile"    # Z
    .param p15, "finalImage"    # Z
    .param p16, "mirror"    # Z
    .param p17, "isParallelProcess"    # Z
    .param p18, "algorithmName"    # Ljava/lang/String;

    .prologue
    .line 123
    if-eqz p4, :cond_0

    if-nez p7, :cond_0

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/storage/ImageSaver;->mLastImageUri:Landroid/net/Uri;

    move-object/from16 p7, v0

    .line 126
    :cond_0
    new-instance v2, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-wide/from16 v8, p5

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    move-object/from16 v14, p11

    move/from16 v15, p12

    move/from16 v16, p13

    move/from16 v17, p14

    move/from16 v18, p15

    move/from16 v19, p16

    move/from16 v20, p17

    move-object/from16 v21, p18

    invoke-direct/range {v2 .. v21}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;-><init>(Lcom/android/camera/storage/ImageSaver;[BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;)V

    .line 129
    .local v2, "r":Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/storage/ImageSaver;->addImage(Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;)V

    .line 130
    return-void
.end method

.method public addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V
    .locals 6
    .param p1, "videoPath"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "isFinal"    # Z

    .prologue
    .line 206
    monitor-enter p0

    .line 207
    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    const/4 v2, 0x2

    if-ne v2, v1, :cond_0

    .line 208
    const-string/jumbo v1, "ImageSaver"

    const-string/jumbo v2, "addVideo: host is being destroyed."

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 209
    return-void

    .line 211
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mStop:Z

    if-eqz v1, :cond_1

    .line 212
    const-string/jumbo v1, "ImageSaver"

    const-string/jumbo v2, "run: exiting"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 213
    return-void

    .line 216
    :cond_1
    :try_start_2
    new-instance v0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;

    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;-><init>(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/ActivityBase;Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 220
    .local v0, "r":Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;
    sget-object v1, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    .line 222
    return-void

    .line 206
    .end local v0    # "r":Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public addVideoSync(Ljava/lang/String;Landroid/content/ContentValues;Z)Landroid/net/Uri;
    .locals 6
    .param p1, "videoPath"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "isFinal"    # Z

    .prologue
    .line 225
    monitor-enter p0

    .line 226
    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    const/4 v2, 0x2

    if-ne v2, v1, :cond_0

    .line 227
    const-string/jumbo v1, "ImageSaver"

    const-string/jumbo v2, "addVideo: host is being destroyed."

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    const/4 v1, 0x0

    monitor-exit p0

    return-object v1

    .line 230
    :cond_0
    :try_start_1
    new-instance v0, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;

    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;-><init>(Lcom/android/camera/storage/ImageSaver;Lcom/android/camera/ActivityBase;Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 231
    .local v0, "r":Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;
    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->save()V

    .line 232
    invoke-static {v0}, Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;->-get0(Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;)Landroid/net/Uri;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 225
    .end local v0    # "r":Lcom/android/camera/storage/ImageSaver$VideoSaveRequest;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public isSaveQueueFull()Z
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/ImageSaver$MemoryManager;

    invoke-static {v0}, Lcom/android/camera/storage/ImageSaver$MemoryManager;->-wrap2(Lcom/android/camera/storage/ImageSaver$MemoryManager;)Z

    move-result v0

    return v0
.end method

.method public onHostDestroy()V
    .locals 3

    .prologue
    .line 318
    monitor-enter p0

    .line 319
    const/4 v0, 0x2

    :try_start_0
    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 320
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mStop:Z

    .line 322
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->quitAllSaveThread()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 325
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v1

    .line 326
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 327
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v1

    .line 330
    const-string/jumbo v0, "ImageSaver"

    const-string/jumbo v1, "onHostDestroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    return-void

    .line 318
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 325
    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onHostPause()V
    .locals 3

    .prologue
    .line 296
    monitor-enter p0

    .line 297
    const/4 v0, 0x1

    :try_start_0
    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 300
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v1

    .line 301
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 302
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v1

    .line 308
    const-string/jumbo v0, "ImageSaver"

    const-string/jumbo v1, "onHostPause"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    return-void

    .line 296
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 300
    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onHostResume(Z)V
    .locals 3
    .param p1, "isCaptureIntent"    # Z

    .prologue
    .line 283
    monitor-enter p0

    .line 284
    :try_start_0
    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    .line 285
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 286
    const-string/jumbo v0, "ImageSaver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onHostResume: isCapture="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 288
    return-void

    .line 283
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public shouldStopShot()Z
    .locals 1

    .prologue
    .line 237
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mShouldStop:Z

    return v0
.end method

.method public updateImage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "oldTitle"    # Ljava/lang/String;

    .prologue
    .line 134
    new-instance v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;

    invoke-direct {v0, p0}, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    .line 135
    .local v0, "r":Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;
    iput-object p1, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->title:Ljava/lang/String;

    .line 136
    iput-object p2, v0, Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 137
    invoke-direct {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addImage(Lcom/android/camera/storage/ImageSaver$ImageSaveRequest;)V

    .line 138
    return-void
.end method
