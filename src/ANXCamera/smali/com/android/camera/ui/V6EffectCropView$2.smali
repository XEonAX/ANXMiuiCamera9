.class Lcom/android/camera/ui/V6EffectCropView$2;
.super Landroid/os/Handler;
.source "V6EffectCropView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/V6EffectCropView;->initHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/V6EffectCropView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/V6EffectCropView;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/V6EffectCropView;
    .param p2, "$anonymous0"    # Landroid/os/Looper;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    .line 674
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1
    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 677
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 703
    :cond_0
    :goto_0
    return-void

    .line 679
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get12(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 680
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get10(Lcom/android/camera/ui/V6EffectCropView;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/ui/V6EffectCropView;->-set2(Lcom/android/camera/ui/V6EffectCropView;Z)Z

    .line 684
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get11(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->setupStartValues()V

    .line 685
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get11(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0

    .line 689
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get11(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 690
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get12(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 691
    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v1}, Lcom/android/camera/ui/V6EffectCropView;->-get11(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->getDuration()J

    move-result-wide v2

    .line 692
    iget-object v1, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v1}, Lcom/android/camera/ui/V6EffectCropView;->-get11(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->getCurrentPlayTime()J

    move-result-wide v4

    .line 691
    sub-long/2addr v2, v4

    .line 690
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 696
    :goto_1
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get10(Lcom/android/camera/ui/V6EffectCropView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 697
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get12(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0

    .line 694
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/V6EffectCropView$2;->this$0:Lcom/android/camera/ui/V6EffectCropView;

    invoke-static {v0}, Lcom/android/camera/ui/V6EffectCropView;->-get12(Lcom/android/camera/ui/V6EffectCropView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    goto :goto_1

    .line 677
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
