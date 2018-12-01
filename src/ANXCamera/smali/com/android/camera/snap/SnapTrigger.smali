.class public Lcom/android/camera/snap/SnapTrigger;
.super Ljava/lang/Object;
.source "SnapTrigger.java"

# interfaces
.implements Lcom/android/camera/snap/SnapCamera$SnapStatusListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/snap/SnapTrigger$1;,
        Lcom/android/camera/snap/SnapTrigger$2;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/android/camera/snap/SnapTrigger;


# instance fields
.field private mBurstCount:I

.field private mCamera:Lcom/android/camera/snap/SnapCamera;

.field private mCameraOpened:Z

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private final mLongPressRunnable:Ljava/lang/Runnable;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mProximityLock:Lcom/android/camera/ProximitySensorLock;

.field private final mSnapRunnable:Ljava/lang/Runnable;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/snap/SnapTrigger;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    iget v0, p0, Lcom/android/camera/snap/SnapTrigger;->mBurstCount:I

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera/snap/SnapTrigger;)Lcom/android/camera/snap/SnapCamera;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/snap/SnapTrigger;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCameraOpened:Z

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/snap/SnapTrigger;)Landroid/os/Handler;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/snap/SnapTrigger;)Landroid/os/PowerManager;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mPowerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/snap/SnapTrigger;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mSnapRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/snap/SnapTrigger;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/snap/SnapTrigger;->mBurstCount:I

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/snap/SnapTrigger;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapTrigger;->shouldQuitSnap()Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/snap/SnapTrigger;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapTrigger;->initCamera()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/snap/SnapTrigger;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapTrigger;->shutdownWatchDog()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/snap/SnapTrigger;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;
    .param p1, "immediately"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/snap/SnapTrigger;->triggerWatchdog(Z)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/camera/snap/SnapTrigger;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/snap/SnapTrigger;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/snap/SnapTrigger;->vibratorShort()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/android/camera/snap/SnapTrigger;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/snap/SnapTrigger;->mBurstCount:I

    .line 39
    iput-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mPowerManager:Landroid/os/PowerManager;

    .line 129
    new-instance v0, Lcom/android/camera/snap/SnapTrigger$1;

    invoke-direct {v0, p0}, Lcom/android/camera/snap/SnapTrigger$1;-><init>(Lcom/android/camera/snap/SnapTrigger;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mSnapRunnable:Ljava/lang/Runnable;

    .line 166
    new-instance v0, Lcom/android/camera/snap/SnapTrigger$2;

    invoke-direct {v0, p0}, Lcom/android/camera/snap/SnapTrigger$2;-><init>(Lcom/android/camera/snap/SnapTrigger;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mLongPressRunnable:Ljava/lang/Runnable;

    .line 26
    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 3

    .prologue
    const-class v1, Lcom/android/camera/snap/SnapTrigger;

    monitor-enter v1

    .line 72
    :try_start_0
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    if-eqz v0, :cond_1

    .line 73
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    invoke-direct {v0}, Lcom/android/camera/snap/SnapTrigger;->onDestroy()V

    .line 74
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    const/4 v2, 0x0

    iput v2, v0, Lcom/android/camera/snap/SnapTrigger;->mBurstCount:I

    .line 76
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    iget-object v0, v0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    if-eqz v0, :cond_0

    .line 77
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    iget-object v0, v0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {v0}, Lcom/android/camera/snap/SnapCamera;->release()V

    .line 78
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    .line 81
    :cond_0
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    .line 82
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    .line 84
    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v1

    .line 86
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getInstance()Lcom/android/camera/snap/SnapTrigger;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/android/camera/snap/SnapTrigger;

    invoke-direct {v0}, Lcom/android/camera/snap/SnapTrigger;-><init>()V

    sput-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    .line 45
    :cond_0
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->sInstance:Lcom/android/camera/snap/SnapTrigger;

    return-object v0
.end method

.method private initCamera()V
    .locals 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    if-eqz v0, :cond_0

    .line 195
    return-void

    .line 198
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCameraOpened:Z

    .line 199
    new-instance v0, Lcom/android/camera/snap/SnapCamera;

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/android/camera/snap/SnapCamera;-><init>(Landroid/content/Context;Lcom/android/camera/snap/SnapCamera$SnapStatusListener;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    .line 200
    return-void
.end method

.method public static notifyForDetail(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "content"    # Ljava/lang/String;
    .param p4, "isVideo"    # Z

    .prologue
    .line 251
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 252
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "android.intent.action.VIEW"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 253
    if-eqz p4, :cond_0

    const-string/jumbo v5, "video/*"

    :goto_0
    invoke-virtual {v1, p1, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {p0, v5, v1, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 256
    .local v4, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v5, Landroid/app/Notification$Builder;

    invoke-direct {v5, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, p2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5, p3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 260
    const v6, 0x1080041

    .line 256
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 261
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 256
    invoke-virtual {v5, v6, v7}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 262
    .local v2, "notification":Landroid/app/Notification;
    iget v5, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v2, Landroid/app/Notification;->flags:I

    .line 263
    iget-object v5, v2, Landroid/app/Notification;->extraNotification:Landroid/app/MiuiNotification;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/app/MiuiNotification;->setMessageCount(I)V

    .line 266
    const-string/jumbo v5, "notification"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 267
    .local v3, "notificationManager":Landroid/app/NotificationManager;
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 271
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "notification":Landroid/app/Notification;
    .end local v3    # "notificationManager":Landroid/app/NotificationManager;
    .end local v4    # "pendingIntent":Landroid/app/PendingIntent;
    :goto_1
    return-void

    .line 253
    .restart local v1    # "intent":Landroid/content/Intent;
    :cond_0
    const-string/jumbo v5, "image/*"
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 268
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/NullPointerException;
    goto :goto_1
.end method

.method private onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 61
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->destroy()V

    .line 64
    :cond_0
    iput-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    .line 65
    return-void
.end method

.method private shouldQuitSnap()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 117
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->enabled()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/android/camera/Util;->isNonUIEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 118
    invoke-static {}, Lcom/android/camera/Util;->isNonUI()Z

    move-result v0

    .line 119
    .local v0, "isNonUI":Z
    sget-object v2, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "shouldQuitSnap isNonUI = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    if-eqz v0, :cond_0

    .line 121
    const-string/jumbo v2, "counter"

    const-string/jumbo v3, "pocket_mode_enter"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    .line 122
    const-string/jumbo v5, "\u65b9\u5f0f"

    aput-object v5, v4, v1

    const-string/jumbo v1, "NonUI\u8857\u62cd"

    const/4 v5, 0x1

    aput-object v1, v4, v5

    .line 121
    invoke-static {v2, v3, v4}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 124
    :cond_0
    return v0

    .line 126
    .end local v0    # "isNonUI":Z
    :cond_1
    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v2, :cond_2

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1}, Lcom/android/camera/ProximitySensorLock;->shouldQuitSnap()Z

    move-result v1

    :cond_2
    return v1
.end method

.method private shutdownWatchDog()V
    .locals 2

    .prologue
    .line 187
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 188
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "watch dog Off"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 191
    :cond_0
    return-void
.end method

.method private triggerWatchdog(Z)V
    .locals 5
    .param p1, "immediately"    # Z

    .prologue
    const/16 v4, 0x65

    .line 179
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 180
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "watch dog On -"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 182
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    :goto_0
    int-to-long v2, v0

    invoke-virtual {v1, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 184
    :cond_0
    return-void

    .line 182
    :cond_1
    const/16 v0, 0x1388

    goto :goto_0
.end method

.method private vibrator([J)V
    .locals 4
    .param p1, "pattern"    # [J

    .prologue
    .line 242
    :try_start_0
    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    const-string/jumbo v3, "vibrator"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    .line 243
    .local v1, "vibrator":Landroid/os/Vibrator;
    const/4 v2, -0x1

    invoke-virtual {v1, p1, v2}, Landroid/os/Vibrator;->vibrate([JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    .end local v1    # "vibrator":Landroid/os/Vibrator;
    :goto_0
    return-void

    .line 244
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private vibratorShort()V
    .locals 1

    .prologue
    .line 237
    const/4 v0, 0x2

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    invoke-direct {p0, v0}, Lcom/android/camera/snap/SnapTrigger;->vibrator([J)V

    .line 238
    return-void

    .line 237
    :array_0
    .array-data 8
        0xa
        0x14
    .end array-data
.end method


# virtual methods
.method public handleKeyEvent(IIJ)V
    .locals 6
    .param p1, "keyCode"    # I
    .param p2, "keyAction"    # I
    .param p3, "keyEventTime"    # J

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/android/camera/snap/SnapTrigger;->isRunning()Z

    move-result v1

    if-nez v1, :cond_0

    .line 90
    return-void

    .line 92
    :cond_0
    const/4 v0, 0x0

    .line 93
    .local v0, "immediately":Z
    const/16 v1, 0x19

    if-ne p1, v1, :cond_3

    .line 94
    if-nez p2, :cond_2

    .line 95
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mLongPressRunnable:Ljava/lang/Runnable;

    .line 96
    invoke-static {}, Landroid/view/ViewConfiguration;->getGlobalActionKeyTimeout()J

    move-result-wide v4

    .line 95
    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 113
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/camera/snap/SnapTrigger;->triggerWatchdog(Z)V

    .line 114
    return-void

    .line 97
    :cond_2
    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    .line 98
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mLongPressRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 99
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mSnapRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 101
    const/4 v0, 0x1

    goto :goto_0

    .line 104
    :cond_3
    const/16 v1, 0x1a

    if-ne p1, v1, :cond_1

    .line 105
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mLongPressRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 106
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mSnapRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 108
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public declared-synchronized init(Landroid/content/Context;Landroid/os/Handler;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    monitor-enter p0

    .line 49
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    .line 50
    iput-object p2, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    .line 51
    const-string/jumbo v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mPowerManager:Landroid/os/PowerManager;

    .line 52
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->enabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->isNonUIEnabled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 53
    new-instance v0, Lcom/android/camera/ProximitySensorLock;

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/camera/ProximitySensorLock;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    .line 54
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "init, create a new instance -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mProximityLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->startWatching()V

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/snap/SnapTrigger;->isRunning()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isRunning()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onCameraOpened()V
    .locals 2

    .prologue
    .line 225
    invoke-virtual {p0}, Lcom/android/camera/snap/SnapTrigger;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 226
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onCameraOpened: exit"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    return-void

    .line 229
    :cond_0
    sget-object v0, Lcom/android/camera/snap/SnapTrigger;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onCameraOpened"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCameraOpened:Z

    .line 231
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 232
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mSnapRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 234
    :cond_1
    return-void
.end method

.method public onDone(Landroid/net/Uri;)V
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 204
    invoke-virtual {p0}, Lcom/android/camera/snap/SnapTrigger;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 205
    return-void

    .line 208
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/snap/SnapTrigger;->triggerWatchdog(Z)V

    .line 209
    invoke-direct {p0}, Lcom/android/camera/snap/SnapTrigger;->vibratorShort()V

    .line 211
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {v0}, Lcom/android/camera/snap/SnapCamera;->isCamcorder()Z

    move-result v0

    if-nez v0, :cond_1

    .line 212
    iget v0, p0, Lcom/android/camera/snap/SnapTrigger;->mBurstCount:I

    const/16 v1, 0x64

    if-ge v0, v1, :cond_1

    .line 213
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mSnapRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 216
    :cond_1
    if-nez p1, :cond_2

    .line 217
    return-void

    .line 219
    :cond_2
    iget-object v0, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    const v2, 0x7f0f0156

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 220
    iget-object v2, p0, Lcom/android/camera/snap/SnapTrigger;->mContext:Landroid/content/Context;

    const v3, 0x7f0f0157

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/snap/SnapTrigger;->mCamera:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {v3}, Lcom/android/camera/snap/SnapCamera;->isCamcorder()Z

    move-result v3

    .line 219
    invoke-static {v0, p1, v1, v2, v3}, Lcom/android/camera/snap/SnapTrigger;->notifyForDetail(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 221
    return-void
.end method
