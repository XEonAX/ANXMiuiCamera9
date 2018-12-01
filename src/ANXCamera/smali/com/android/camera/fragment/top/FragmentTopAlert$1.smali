.class Lcom/android/camera/fragment/top/FragmentTopAlert$1;
.super Ljava/lang/Object;
.source "FragmentTopAlert.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/top/FragmentTopAlert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    .line 286
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 289
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get3(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 290
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-wrap0(Lcom/android/camera/fragment/top/FragmentTopAlert;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-wrap2(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;I)V

    .line 296
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 297
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 298
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/android/camera/ui/ToggleSwitch;->setVisibility(I)V

    .line 299
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 300
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    .line 299
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 301
    const/high16 v1, 0x3f800000    # 1.0f

    .line 299
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 301
    const-wide/16 v2, 0x190

    .line 299
    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 303
    :cond_0
    return-void

    .line 291
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get1(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 292
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get1(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-wrap1(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-wrap2(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;I)V

    goto :goto_0

    .line 294
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;->this$0:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-static {v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-get4(Lcom/android/camera/fragment/top/FragmentTopAlert;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->-wrap2(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;I)V

    goto :goto_0
.end method
