.class Lcom/android/camera/fragment/FragmentBottomAction$7;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBottomAction;->updateBottomInRecording(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBottomAction;

.field final synthetic val$start:Z


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBottomAction;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    iput-boolean p2, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->val$start:Z

    .line 852
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 887
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x0

    const/16 v2, 0x8

    .line 866
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->canProvide()Z

    move-result v0

    if-nez v0, :cond_0

    .line 867
    return-void

    .line 869
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get12(Lcom/android/camera/fragment/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 870
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get6(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v3

    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->val$start:Z

    if-eqz v0, :cond_5

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 872
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get11(Lcom/android/camera/fragment/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 873
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get7(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    iget-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->val$start:Z

    if-eqz v3, :cond_6

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 875
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->val$start:Z

    if-eqz v0, :cond_4

    .line 876
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get9(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 877
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get0(Lcom/android/camera/fragment/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 878
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get1(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 880
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get8(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 882
    :cond_4
    return-void

    :cond_5
    move v0, v2

    .line 870
    goto :goto_0

    :cond_6
    move v1, v2

    .line 873
    goto :goto_1
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 892
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x0

    .line 855
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->val$start:Z

    if-nez v0, :cond_1

    .line 856
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get0(Lcom/android/camera/fragment/FragmentBottomAction;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 857
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get1(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 859
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get8(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 860
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$7;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get9(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 862
    :cond_1
    return-void
.end method
