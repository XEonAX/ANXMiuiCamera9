.class Lcom/android/camera/module/loader/camera2/FocusManager2$1;
.super Ljava/lang/Object;
.source "FocusManager2.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/FocusManager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Lcom/android/camera/module/loader/camera2/FocusTask;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/FocusManager2;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/module/loader/camera2/FocusManager2;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 361
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public accept(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 7
    .param p1, "focusTask"    # Lcom/android/camera/module/loader/camera2/FocusTask;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v2, 0x4

    const/4 v5, 0x3

    const/4 v1, 0x1

    .line 364
    const-string/jumbo v0, "FocusManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "focusResult: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 365
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v4

    .line 364
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 365
    const-string/jumbo v4, "|"

    .line 364
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 365
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v4

    .line 364
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 365
    const-string/jumbo v4, "|"

    .line 364
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 365
    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v4}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get6(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v4

    .line 364
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    if-eq v0, v6, :cond_0

    .line 367
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    if-ne v0, v5, :cond_1

    .line 368
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap2(Lcom/android/camera/module/loader/camera2/FocusManager2;ZZ)V

    .line 369
    return-void

    .line 372
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get6(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v0

    if-ne v0, v6, :cond_4

    .line 376
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 377
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap3(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 378
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap4(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 383
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 384
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get5(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 385
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap1(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    .line 415
    :goto_1
    return-void

    .line 380
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap3(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 381
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap4(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    goto :goto_0

    .line 387
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap0(Lcom/android/camera/module/loader/camera2/FocusManager2;)V

    goto :goto_1

    .line 389
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get6(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v0

    if-ne v0, v1, :cond_8

    .line 393
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 394
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap3(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 395
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v5}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap4(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 399
    const-string/jumbo v0, "auto"

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get0(Lcom/android/camera/module/loader/camera2/FocusManager2;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 400
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get2(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v0

    if-eq v0, v1, :cond_5

    .line 401
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get3(Lcom/android/camera/module/loader/camera2/FocusManager2;)Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;->playSound(I)V

    .line 407
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->updateFocusUI()V

    .line 409
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get1(Lcom/android/camera/module/loader/camera2/FocusManager2;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 410
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-set0(Lcom/android/camera/module/loader/camera2/FocusManager2;Z)Z

    goto :goto_1

    .line 404
    :cond_6
    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get4(Lcom/android/camera/module/loader/camera2/FocusManager2;)Z

    move-result v0

    if-eqz v0, :cond_7

    move v0, v1

    :goto_3
    invoke-static {v3, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap3(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    .line 405
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-wrap4(Lcom/android/camera/module/loader/camera2/FocusManager2;I)V

    goto :goto_2

    :cond_7
    move v0, v2

    .line 404
    goto :goto_3

    .line 411
    :cond_8
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->this$0:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->-get6(Lcom/android/camera/module/loader/camera2/FocusManager2;)I

    move-result v0

    goto :goto_1
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 362
    check-cast p1, Lcom/android/camera/module/loader/camera2/FocusTask;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2$1;->accept(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    return-void
.end method
