.class Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;
.super Ljava/lang/Object;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x0

    .line 201
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    .line 203
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-set1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z

    .line 204
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    .line 205
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x0

    .line 193
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    .line 195
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-set1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z

    .line 196
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    .line 197
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 210
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x1

    .line 182
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    .line 184
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-get3(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    .line 189
    :goto_0
    return-void

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V

    goto :goto_0
.end method
