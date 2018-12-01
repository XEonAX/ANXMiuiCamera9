.class Lcom/android/camera/module/Camera2Module$9;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/Camera2Module;->startCount(I)V
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
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;

.field final synthetic val$time:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/Camera2Module;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iput p2, p0, Lcom/android/camera/module/Camera2Module$9;->val$time:I

    .line 1442
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1468
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1470
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 1471
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v1}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/module/Camera2Module;->-wrap14(Lcom/android/camera/module/Camera2Module;I)V

    .line 1472
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0, v3, v3}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 1473
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 1464
    return-void
.end method

.method public onNext(Ljava/lang/Long;)V
    .locals 3
    .param p1, "aLong"    # Ljava/lang/Long;

    .prologue
    .line 1454
    iget v1, p0, Lcom/android/camera/module/Camera2Module$9;->val$time:I

    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    sub-int v0, v1, v2

    .line 1455
    .local v0, "number":I
    if-lez v0, :cond_0

    .line 1456
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Lcom/android/camera/module/Camera2Module;->playSound(I)V

    .line 1457
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, v1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showDelayNumber(I)V

    .line 1459
    :cond_0
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1452
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module$9;->onNext(Ljava/lang/Long;)V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    const/4 v1, 0x7

    .line 1446
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->-set5(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1447
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module;->playSound(I)V

    .line 1448
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    .line 1449
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$9;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/Camera2Module$9;->val$time:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->showDelayNumber(I)V

    .line 1450
    return-void
.end method
