.class public Lcom/android/camera/AutoLockManager;
.super Ljava/lang/Object;
.source "AutoLockManager.java"


# static fields
.field public static HIBERNATION_TIMEOUT:I

.field private static MILLIS_IN_MINUTE:J

.field private static final TAG:Ljava/lang/String;

.field private static sMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/Context;",
            "Lcom/android/camera/AutoLockManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCameraAlwaysKeepScreenOn:Z

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mHibernationTimeOut:J

.field private mPaused:Z

.field private mScreenOffTimeOut:J


# direct methods
.method static synthetic -wrap0(Lcom/android/camera/AutoLockManager;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/AutoLockManager;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/AutoLockManager;->hibernate()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/AutoLockManager;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/AutoLockManager;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/AutoLockManager;->lockScreen()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 18
    const-class v0, Lcom/android/camera/AutoLockManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/AutoLockManager;->TAG:Ljava/lang/String;

    .line 20
    const/16 v0, 0x8

    sput v0, Lcom/android/camera/AutoLockManager;->HIBERNATION_TIMEOUT:I

    .line 21
    const-wide/32 v0, 0xea60

    sput-wide v0, Lcom/android/camera/AutoLockManager;->MILLIS_IN_MINUTE:J

    .line 32
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 31
    sput-object v0, Lcom/android/camera/AutoLockManager;->sMap:Ljava/util/WeakHashMap;

    .line 16
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-wide/16 v2, 0x3a98

    iput-wide v2, p0, Lcom/android/camera/AutoLockManager;->mScreenOffTimeOut:J

    .line 29
    iput-boolean v4, p0, Lcom/android/camera/AutoLockManager;->mCameraAlwaysKeepScreenOn:Z

    .line 35
    iput-object p1, p0, Lcom/android/camera/AutoLockManager;->mContext:Landroid/content/Context;

    .line 36
    const-string/jumbo v1, "camera.debug.hibernation_timeout_seconds"

    invoke-static {v1, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 37
    .local v0, "timeoutSeconds":I
    const-string/jumbo v1, "camera_always_keep_screen_on"

    invoke-static {v1, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/AutoLockManager;->mCameraAlwaysKeepScreenOn:Z

    .line 38
    if-lez v0, :cond_0

    .line 39
    int-to-long v2, v0

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    iput-wide v2, p0, Lcom/android/camera/AutoLockManager;->mHibernationTimeOut:J

    .line 43
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/camera/AutoLockManager;->updateScreenOffTimeout(Landroid/content/Context;)V

    .line 44
    return-void

    .line 41
    :cond_0
    sget-wide v2, Lcom/android/camera/AutoLockManager;->MILLIS_IN_MINUTE:J

    invoke-static {}, Lcom/android/camera/Device;->getHibernationTimeout()I

    move-result v1

    int-to-long v4, v1

    mul-long/2addr v2, v4

    iput-wide v2, p0, Lcom/android/camera/AutoLockManager;->mHibernationTimeOut:J

    goto :goto_0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    sget-object v1, Lcom/android/camera/AutoLockManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/AutoLockManager;

    .line 57
    .local v0, "instance":Lcom/android/camera/AutoLockManager;
    if-nez v0, :cond_0

    .line 58
    new-instance v0, Lcom/android/camera/AutoLockManager;

    .end local v0    # "instance":Lcom/android/camera/AutoLockManager;
    invoke-direct {v0, p0}, Lcom/android/camera/AutoLockManager;-><init>(Landroid/content/Context;)V

    .line 59
    .restart local v0    # "instance":Lcom/android/camera/AutoLockManager;
    sget-object v1, Lcom/android/camera/AutoLockManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    :cond_0
    return-object v0
.end method

.method private hibernate()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->onHibernate()V

    .line 104
    return-void
.end method

.method private initHandler()V
    .locals 3

    .prologue
    .line 86
    iget-object v1, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    .line 87
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "my_handler_thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 88
    .local v0, "handlerThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 89
    new-instance v1, Lcom/android/camera/AutoLockManager$1;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/AutoLockManager$1;-><init>(Lcom/android/camera/AutoLockManager;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    .line 100
    .end local v0    # "handlerThread":Landroid/os/HandlerThread;
    :cond_0
    return-void
.end method

.method private lockScreen()V
    .locals 2

    .prologue
    .line 107
    iget-boolean v1, p0, Lcom/android/camera/AutoLockManager;->mPaused:Z

    if-nez v1, :cond_0

    .line 108
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.miui.app.ExtraStatusBarManager.TRIGGER_TOGGLE_LOCK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 109
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/camera/AutoLockManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 111
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public static removeInstance(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    sget-object v1, Lcom/android/camera/AutoLockManager;->sMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/AutoLockManager;

    .line 66
    .local v0, "instance":Lcom/android/camera/AutoLockManager;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 67
    iget-object v1, v0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    .line 69
    :cond_0
    return-void
.end method

.method private updateScreenOffTimeout(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 49
    const-string/jumbo v2, "screen_off_timeout"

    .line 48
    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/android/camera/AutoLockManager;->mScreenOffTimeOut:J
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :goto_0
    return-void

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Landroid/provider/Settings$SettingNotFoundException;
    sget-object v1, Lcom/android/camera/AutoLockManager;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/provider/Settings$SettingNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public hibernateDelayed()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 130
    iget-boolean v0, p0, Lcom/android/camera/AutoLockManager;->mCameraAlwaysKeepScreenOn:Z

    if-eqz v0, :cond_0

    .line 131
    return-void

    .line 134
    :cond_0
    iget-wide v0, p0, Lcom/android/camera/AutoLockManager;->mHibernationTimeOut:J

    iget-wide v2, p0, Lcom/android/camera/AutoLockManager;->mScreenOffTimeOut:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 135
    return-void

    .line 138
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/AutoLockManager;->initHandler()V

    .line 139
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    .line 140
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 141
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isVideoRecording()Z

    move-result v0

    if-nez v0, :cond_2

    .line 142
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    iget-wide v2, p0, Lcom/android/camera/AutoLockManager;->mHibernationTimeOut:J

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 145
    :cond_2
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/AutoLockManager;->mPaused:Z

    .line 73
    invoke-virtual {p0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 74
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/AutoLockManager;->mPaused:Z

    .line 78
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/android/camera/AutoLockManager;->updateScreenOffTimeout(Landroid/content/Context;)V

    .line 79
    return-void
.end method

.method public onUserInteraction()V
    .locals 0

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/android/camera/AutoLockManager;->hibernateDelayed()V

    .line 83
    return-void
.end method

.method public removeMessage()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 114
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/android/camera/AutoLockManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 117
    :cond_0
    return-void
.end method
