.class Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;
.super Ljava/lang/Object;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mAnimated:Z

.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->mAnimated:Z

    .line 1
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 121
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 122
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->mAnimated:Z

    if-nez v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-get5(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 124
    iput-boolean v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->mAnimated:Z

    .line 133
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-wrap3(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    .line 134
    return v2

    .line 126
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v3, :cond_2

    .line 127
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 128
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->mAnimated:Z

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-get6(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/animation/AnimatorSet;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 130
    iput-boolean v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;->mAnimated:Z

    goto :goto_0
.end method
