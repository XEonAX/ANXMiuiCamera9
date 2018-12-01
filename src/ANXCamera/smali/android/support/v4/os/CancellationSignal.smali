.class public final Landroid/support/v4/os/CancellationSignal;
.super Ljava/lang/Object;
.source "CancellationSignal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    }
.end annotation


# instance fields
.field private mCancelInProgress:Z

.field private mCancellationSignalObj:Ljava/lang/Object;

.field private mIsCanceled:Z

.field private mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method private waitForCancelFinishedLocked()V
    .registers 3

    .prologue
    .line 150
    :goto_0
    iget-boolean v1, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    if-nez v1, :cond_5

    .line 156
    return-void

    .line 152
    :cond_5
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_8} :catch_9

    goto :goto_0

    .line 153
    :catch_9
    move-exception v0

    .local v0, "ex":Ljava/lang/InterruptedException;
    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .registers 10

    .prologue
    .line 67
    move-object v0, p0

    .local v0, "-l_3_R":Ljava/lang/Object;
    monitor-enter p0

    .line 68
    :try_start_2
    iget-boolean v8, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-nez v8, :cond_1f

    .line 71
    const/4 v8, 0x1

    iput-boolean v8, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    .line 72
    const/4 v8, 0x1

    iput-boolean v8, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    .line 73
    iget-object v6, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    .line 74
    .local v6, "listener":Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    iget-object v7, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    .line 75
    .local v7, "obj":Ljava/lang/Object;
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_2 .. :try_end_11} :catchall_21

    .line 78
    if-nez v6, :cond_24

    .line 81
    :goto_13
    if-nez v7, :cond_33

    .line 85
    :goto_15
    move-object v0, p0

    monitor-enter p0

    .line 86
    const/4 v8, 0x0

    :try_start_18
    iput-boolean v8, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 88
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_18 .. :try_end_1e} :catchall_37

    .line 90
    return-void

    .line 69
    .end local v6    # "listener":Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    .end local v7    # "obj":Ljava/lang/Object;
    :cond_1f
    :try_start_1f
    monitor-exit p0

    return-void

    .line 75
    :catchall_21
    move-exception v1

    .local v1, "-l_4_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_1f .. :try_end_23} :catchall_21

    throw v1

    .line 79
    .end local v1    # "-l_4_R":Ljava/lang/Object;
    .restart local v6    # "listener":Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    .restart local v7    # "obj":Ljava/lang/Object;
    :cond_24
    :try_start_24
    invoke-interface {v6}, Landroid/support/v4/os/CancellationSignal$OnCancelListener;->onCancel()V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_28

    goto :goto_13

    .line 85
    :catchall_28
    move-exception v3

    .local v3, "-l_6_R":Ljava/lang/Object;
    move-object v4, p0

    .local v4, "-l_7_R":Ljava/lang/Object;
    monitor-enter p0

    .line 86
    const/4 v8, 0x0

    :try_start_2c
    iput-boolean v8, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 88
    monitor-exit p0
    :try_end_32
    .catchall {:try_start_2c .. :try_end_32} :catchall_3a

    throw v3

    .line 82
    .end local v3    # "-l_6_R":Ljava/lang/Object;
    .end local v4    # "-l_7_R":Ljava/lang/Object;
    :cond_33
    :try_start_33
    invoke-static {v7}, Landroid/support/v4/os/CancellationSignalCompatJellybean;->cancel(Ljava/lang/Object;)V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_28

    goto :goto_15

    .line 88
    :catchall_37
    move-exception v2

    .local v2, "-l_5_R":Ljava/lang/Object;
    :try_start_38
    monitor-exit p0
    :try_end_39
    .catchall {:try_start_38 .. :try_end_39} :catchall_37

    throw v2

    .end local v2    # "-l_5_R":Ljava/lang/Object;
    .restart local v3    # "-l_6_R":Ljava/lang/Object;
    .restart local v4    # "-l_7_R":Ljava/lang/Object;
    :catchall_3a
    move-exception v5

    .local v5, "-l_8_R":Ljava/lang/Object;
    :try_start_3b
    monitor-exit p0
    :try_end_3c
    .catchall {:try_start_3b .. :try_end_3c} :catchall_3a

    throw v5
.end method

.method public getCancellationSignalObject()Ljava/lang/Object;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 135
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_11

    .line 138
    move-object v0, p0

    .local v0, "-l_1_R":Ljava/lang/Object;
    monitor-enter p0

    .line 139
    :try_start_9
    iget-object v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    if-eqz v2, :cond_12

    .line 145
    :cond_d
    :goto_d
    iget-object v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    monitor-exit p0

    return-object v2

    .line 136
    .end local v0    # "-l_1_R":Ljava/lang/Object;
    :cond_11
    return-object v4

    .line 140
    .restart local v0    # "-l_1_R":Ljava/lang/Object;
    :cond_12
    invoke-static {}, Landroid/support/v4/os/CancellationSignalCompatJellybean;->create()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    .line 141
    iget-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v2, :cond_d

    .line 142
    iget-object v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    invoke-static {v2}, Landroid/support/v4/os/CancellationSignalCompatJellybean;->cancel(Ljava/lang/Object;)V

    goto :goto_d

    .line 146
    :catchall_22
    move-exception v1

    .local v1, "-l_2_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_24
    .catchall {:try_start_9 .. :try_end_24} :catchall_22

    throw v1
.end method

.method public isCanceled()Z
    .registers 4

    .prologue
    .line 44
    move-object v0, p0

    .local v0, "-l_1_R":Ljava/lang/Object;
    monitor-enter p0

    .line 45
    :try_start_2
    iget-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    monitor-exit p0

    return v2

    .line 46
    :catchall_6
    move-exception v1

    .local v1, "-l_2_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_6

    throw v1
.end method

.method public setOnCancelListener(Landroid/support/v4/os/CancellationSignal$OnCancelListener;)V
    .registers 5
    .param p1, "listener"    # Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    .prologue
    .line 109
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 110
    :try_start_2
    invoke-direct {p0}, Landroid/support/v4/os/CancellationSignal;->waitForCancelFinishedLocked()V

    .line 112
    iget-object v2, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    if-eq v2, p1, :cond_11

    .line 115
    iput-object p1, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    .line 116
    iget-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-nez v2, :cond_13

    .line 117
    :cond_f
    monitor-exit p0

    return-void

    .line 113
    :cond_11
    monitor-exit p0

    return-void

    .line 116
    :cond_13
    if-eqz p1, :cond_f

    .line 119
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_2 .. :try_end_16} :catchall_1a

    .line 120
    invoke-interface {p1}, Landroid/support/v4/os/CancellationSignal$OnCancelListener;->onCancel()V

    .line 121
    return-void

    .line 119
    :catchall_1a
    move-exception v1

    .local v1, "-l_3_R":Ljava/lang/Object;
    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw v1
.end method

.method public throwIfCanceled()V
    .registers 2

    .prologue
    .line 55
    invoke-virtual {p0}, Landroid/support/v4/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_7

    .line 58
    return-void

    .line 56
    :cond_7
    new-instance v0, Landroid/support/v4/os/OperationCanceledException;

    invoke-direct {v0}, Landroid/support/v4/os/OperationCanceledException;-><init>()V

    throw v0
.end method
