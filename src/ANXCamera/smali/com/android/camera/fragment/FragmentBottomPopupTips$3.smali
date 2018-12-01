.class Lcom/android/camera/fragment/FragmentBottomPopupTips$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FragmentBottomPopupTips.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBottomPopupTips;->initBeautyIntroAnimator()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mCancelled:Z

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .line 180
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 190
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->mCancelled:Z

    .line 191
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 195
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->mCancelled:Z

    if-nez v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->-get0(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 197
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->-get5(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 199
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 185
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;->mCancelled:Z

    .line 186
    return-void
.end method
