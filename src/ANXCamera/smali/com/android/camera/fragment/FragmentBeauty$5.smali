.class Lcom/android/camera/fragment/FragmentBeauty$5;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBeauty;->animateExpanding(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentBeauty;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$5;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    .line 292
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 306
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 301
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 295
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty$5;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBeauty;->-get0(Lcom/android/camera/fragment/FragmentBeauty;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 296
    return-void
.end method
