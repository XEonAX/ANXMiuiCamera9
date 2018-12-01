.class Lcom/android/camera/module/Camera2Module$4;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->multiCapture()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$4;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 4

    .prologue
    .line 473
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 474
    const/16 v3, 0xb8

    .line 473
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;

    .line 475
    .local v1, "snapShotIndicator":Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;->setSnapNumVisible(Z)V

    .line 479
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 480
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    const-string/jumbo v2, "d"

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 481
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 468
    return-void
.end method

.method public onNext(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "integer"    # Ljava/lang/Integer;

    .prologue
    .line 463
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 459
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module$4;->onNext(Ljava/lang/Integer;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 4
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 455
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$4;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/android/camera/module/Camera2Module;->-set4(Lcom/android/camera/module/Camera2Module;J)J

    .line 456
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$4;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->-set1(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 457
    return-void
.end method
