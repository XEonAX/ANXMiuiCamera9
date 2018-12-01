.class public Lcom/android/camera/CameraPerformanceTracker;
.super Ljava/lang/Object;
.source "CameraPerformanceTracker.java"


# static fields
.field private static sInstance:Lcom/android/camera/CameraPerformanceTracker;


# instance fields
.field private mAppResumeTime:J

.field private mAppStartTime:J

.field private mFirstPreviewFrameLatencyColdStart:J

.field private mFirstPreviewFrameLatencyWarmStart:J

.field private mModeSwitchDuration:J

.field private mModeSwitchStartTime:J


# direct methods
.method private constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-wide v2, p0, Lcom/android/camera/CameraPerformanceTracker;->mAppStartTime:J

    .line 43
    iput-wide v2, p0, Lcom/android/camera/CameraPerformanceTracker;->mAppResumeTime:J

    .line 44
    iput-wide v2, p0, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchStartTime:J

    .line 47
    iput-wide v2, p0, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyColdStart:J

    .line 48
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyWarmStart:J

    .line 50
    iput-wide v2, p0, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchDuration:J

    .line 55
    return-void
.end method

.method public static onEvent(I)V
    .locals 8
    .param p0, "eventType"    # I

    .prologue
    const-wide/16 v6, -0x1

    .line 65
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    if-nez v2, :cond_0

    .line 66
    new-instance v2, Lcom/android/camera/CameraPerformanceTracker;

    invoke-direct {v2}, Lcom/android/camera/CameraPerformanceTracker;-><init>()V

    sput-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    .line 68
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 69
    .local v0, "currentTime":J
    packed-switch p0, :pswitch_data_0

    .line 118
    :cond_1
    :goto_0
    :pswitch_0
    return-void

    .line 71
    :pswitch_1
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iput-wide v0, v2, Lcom/android/camera/CameraPerformanceTracker;->mAppStartTime:J

    goto :goto_0

    .line 74
    :pswitch_2
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iput-wide v6, v2, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyWarmStart:J

    goto :goto_0

    .line 77
    :pswitch_3
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iput-wide v0, v2, Lcom/android/camera/CameraPerformanceTracker;->mAppResumeTime:J

    goto :goto_0

    .line 80
    :pswitch_4
    const-string/jumbo v2, "CameraPerformanceTracker"

    const-string/jumbo v3, "First preview frame received"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v2, v2, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyColdStart:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_2

    .line 83
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    .line 84
    sget-object v3, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v4, v3, Lcom/android/camera/CameraPerformanceTracker;->mAppStartTime:J

    sub-long v4, v0, v4

    .line 83
    iput-wide v4, v2, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyColdStart:J

    .line 85
    invoke-static {}, Lcom/android/camera/Util;->isKPILogEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 86
    const-string/jumbo v2, "CameraPerformanceTracker"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "[KPI] Cold start duration: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v4, v4, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyColdStart:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 88
    :cond_2
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v2, v2, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyWarmStart:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_3

    .line 90
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    .line 91
    sget-object v3, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v4, v3, Lcom/android/camera/CameraPerformanceTracker;->mAppResumeTime:J

    sub-long v4, v0, v4

    .line 90
    iput-wide v4, v2, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyWarmStart:J

    .line 92
    invoke-static {}, Lcom/android/camera/Util;->isKPILogEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 93
    const-string/jumbo v2, "CameraPerformanceTracker"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "[KPI] Warm start duration: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v4, v4, Lcom/android/camera/CameraPerformanceTracker;->mFirstPreviewFrameLatencyWarmStart:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 95
    :cond_3
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v2, v2, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchStartTime:J

    cmp-long v2, v2, v6

    if-eqz v2, :cond_1

    .line 97
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    sget-object v3, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v4, v3, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchStartTime:J

    sub-long v4, v0, v4

    iput-wide v4, v2, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchDuration:J

    .line 98
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iput-wide v6, v2, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchStartTime:J

    .line 99
    invoke-static {}, Lcom/android/camera/Util;->isKPILogEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 100
    const-string/jumbo v2, "CameraPerformanceTracker"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "[KPI] Mode switch duration: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iget-wide v4, v4, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchDuration:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 105
    :pswitch_5
    sget-object v2, Lcom/android/camera/CameraPerformanceTracker;->sInstance:Lcom/android/camera/CameraPerformanceTracker;

    iput-wide v0, v2, Lcom/android/camera/CameraPerformanceTracker;->mModeSwitchStartTime:J

    goto/16 :goto_0

    .line 69
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method
