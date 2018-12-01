.class Lcom/android/camera/ActivityBase$2;
.super Ljava/lang/Object;
.source "ActivityBase.java"

# interfaces
.implements Lcom/android/camera/CameraScreenNail$NailListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ActivityBase;->createCameraScreenNail(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ActivityBase;


# direct methods
.method constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ActivityBase;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public isKeptBitmapTexture()Z
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isKeptBitmapTexture()Z

    move-result v0

    return v0
.end method

.method public onFrameAvailable(I)V
    .locals 10
    .param p1, "arrivedType"    # I

    .prologue
    const-wide/16 v8, 0x0

    .line 424
    const/4 v3, 0x5

    invoke-static {v3}, Lcom/android/camera/CameraPerformanceTracker;->onEvent(I)V

    .line 425
    const/4 v3, 0x1

    if-ne v3, p1, :cond_0

    iget-object v3, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    iget-wide v4, v3, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    cmp-long v3, v4, v8

    if-eqz v3, :cond_0

    .line 427
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v3, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    iget-wide v6, v3, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    sub-long v0, v4, v6

    .line 428
    .local v0, "cost":J
    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackStartAppCost(J)V

    .line 429
    const-string/jumbo v3, "ActivityBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "onFrameAvailable: trackStartAppCost: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 434
    .end local v0    # "cost":J
    :goto_0
    iget-object v3, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    iput-wide v8, v3, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    .line 436
    :cond_0
    iget-object v3, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    invoke-virtual {v3, p1}, Lcom/android/camera/ActivityBase;->notifyOnFirstFrameArrived(I)V

    .line 437
    return-void

    .line 430
    :catch_0
    move-exception v2

    .line 431
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    const-string/jumbo v3, "ActivityBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 432
    const-string/jumbo v5, ", start time: "

    .line 431
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 432
    iget-object v5, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    iget-wide v6, v5, Lcom/android/camera/ActivityBase;->mAppStartTime:J

    .line 431
    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 432
    const-string/jumbo v5, ", now: "

    .line 431
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 432
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 431
    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onPreviewPixelsRead([BII)V
    .locals 1
    .param p1, "pixels"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 419
    iget-object v0, p0, Lcom/android/camera/ActivityBase$2;->this$0:Lcom/android/camera/ActivityBase;

    iget-object v0, v0, Lcom/android/camera/ActivityBase;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/module/Module;->onPreviewPixelsRead([BII)V

    .line 420
    return-void
.end method

.method public onPreviewTextureCopied()V
    .locals 0

    .prologue
    .line 415
    return-void
.end method
