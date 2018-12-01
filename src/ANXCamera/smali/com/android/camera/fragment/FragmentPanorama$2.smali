.class Lcom/android/camera/fragment/FragmentPanorama$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FragmentPanorama.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentPanorama;->moveToDirection(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentPanorama;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentPanorama;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentPanorama$2;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    .line 203
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 5
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/16 v4, 0xb

    const/16 v3, 0x9

    .line 207
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama$2;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentPanorama;->-get4(Lcom/android/camera/fragment/FragmentPanorama;)Lcom/android/camera/ui/GLTextureView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 208
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama$2;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentPanorama;->-get2(Lcom/android/camera/fragment/FragmentPanorama;)I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_1

    .line 209
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 210
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 215
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama$2;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentPanorama;->-get4(Lcom/android/camera/fragment/FragmentPanorama;)Lcom/android/camera/ui/GLTextureView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->requestLayout()V

    .line 216
    return-void

    .line 211
    :cond_1
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama$2;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentPanorama;->-get2(Lcom/android/camera/fragment/FragmentPanorama;)I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 212
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 213
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_0
.end method
