.class public Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "VideoBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MyBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoBase;


# direct methods
.method protected constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/VideoBase;

    .prologue
    .line 1442
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1445
    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v1, v1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v1, v1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1446
    :cond_0
    return-void

    .line 1449
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/storage/Storage;->isRelatedStorage(Landroid/net/Uri;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1450
    return-void

    .line 1452
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1453
    .local v0, "action":Ljava/lang/String;
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onReceive: action="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1454
    const-string/jumbo v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1455
    invoke-static {}, Lcom/android/camera/storage/Storage;->isCurrentStorageIsSecondary()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1456
    invoke-static {}, Lcom/android/camera/storage/Storage;->switchToPhoneStorage()V

    .line 1457
    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 1470
    :cond_3
    :goto_0
    return-void

    .line 1459
    :cond_4
    const-string/jumbo v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1460
    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v1, v1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1461
    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v1, v1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    goto :goto_0

    .line 1462
    :cond_5
    const-string/jumbo v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1464
    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v1, v1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    goto :goto_0

    .line 1465
    :cond_6
    const-string/jumbo v1, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1466
    sget-object v1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "media scanner started"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1467
    :cond_7
    const-string/jumbo v1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1468
    iget-object v1, p0, Lcom/android/camera/module/VideoBase$MyBroadcastReceiver;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v1, v1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    goto :goto_0
.end method
