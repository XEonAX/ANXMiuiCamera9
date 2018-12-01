.class Lcom/android/camera/module/VideoModule$2;
.super Ljava/lang/Object;
.source "VideoModule.java"

# interfaces
.implements Lio/reactivex/SingleOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/VideoModule;->stopRecorder()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleOnSubscribe",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/VideoModule;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/VideoModule;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    .line 1187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/SingleEmitter;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<Ljava/lang/Boolean;>;"
    const/4 v6, 0x0

    .line 1190
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    new-instance v4, Ljava/util/concurrent/CountDownLatch;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    invoke-static {v1, v4}, Lcom/android/camera/module/VideoModule;->-set1(Lcom/android/camera/module/VideoModule;Ljava/util/concurrent/CountDownLatch;)Ljava/util/concurrent/CountDownLatch;

    .line 1191
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1192
    .local v2, "start":J
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v1}, Lcom/android/camera/module/VideoModule;->-get1(Lcom/android/camera/module/VideoModule;)Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-virtual {v4}, Lcom/android/camera/module/VideoModule;->isFrontCamera()Z

    move-result v4

    invoke-static {v1, v4}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackStopVideoRecordStart(Ljava/lang/String;Z)V

    .line 1194
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v1}, Lcom/android/camera/module/VideoModule;->-get0(Lcom/android/camera/module/VideoModule;)Landroid/media/MediaRecorder;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/media/MediaRecorder;->setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V

    .line 1195
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v1}, Lcom/android/camera/module/VideoModule;->-get0(Lcom/android/camera/module/VideoModule;)Landroid/media/MediaRecorder;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/media/MediaRecorder;->setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V

    .line 1196
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v1}, Lcom/android/camera/module/VideoModule;->-get0(Lcom/android/camera/module/VideoModule;)Landroid/media/MediaRecorder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaRecorder;->stop()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1204
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    iget-boolean v1, v1, Lcom/android/camera/module/VideoModule;->mPaused:Z

    if-nez v1, :cond_1

    .line 1205
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    const/4 v4, 0x3

    invoke-virtual {v1, v4}, Lcom/android/camera/module/VideoModule;->playCameraSound(I)V

    .line 1207
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v1}, Lcom/android/camera/module/VideoModule;->-wrap2(Lcom/android/camera/module/VideoModule;)V

    .line 1208
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {v1}, Lcom/android/camera/module/VideoModule;->-get2(Lcom/android/camera/module/VideoModule;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1209
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "releaseTime="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1210
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, v1}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V

    .line 1211
    return-void

    .line 1197
    :catch_0
    move-exception v0

    .line 1198
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v1, Lcom/android/camera/module/VideoModule;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "failed to stop media recorder"

    invoke-static {v1, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1199
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    iget-object v1, v1, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1200
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    iget-object v4, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    iget-object v4, v4, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/android/camera/module/VideoModule;->deleteVideoFile(Ljava/lang/String;)V

    .line 1201
    iget-object v1, p0, Lcom/android/camera/module/VideoModule$2;->this$0:Lcom/android/camera/module/VideoModule;

    iput-object v6, v1, Lcom/android/camera/module/VideoModule;->mCurrentVideoFilename:Ljava/lang/String;

    goto :goto_0
.end method
