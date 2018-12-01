.class Lcom/android/camera/fragment/DefaultItemAnimator$9;
.super Lcom/android/camera/fragment/DefaultItemAnimator$VpaListenerAdapter;
.source "DefaultItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/DefaultItemAnimator;->animateChangeImpl(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

.field final synthetic val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

.field final synthetic val$newView:Landroid/view/View;

.field final synthetic val$newViewAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/DefaultItemAnimator;Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iput-object p2, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iput-object p3, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$newViewAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    iput-object p4, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$newView:Landroid/view/View;

    .line 373
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/DefaultItemAnimator$VpaListenerAdapter;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator$VpaListenerAdapter;)V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 381
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$newViewAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 382
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$newView:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 383
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$newView:Landroid/view/View;

    invoke-static {v0, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 384
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$newView:Landroid/view/View;

    invoke-static {v0, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 385
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 386
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-static {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->-get2(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 387
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-static {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->-wrap3(Lcom/android/camera/fragment/DefaultItemAnimator;)V

    .line 388
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 376
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$9;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 377
    return-void
.end method
