.class Lcom/android/camera/fragment/DefaultItemAnimator$7;
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

.field final synthetic val$oldViewAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/DefaultItemAnimator;Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v4/view/ViewPropertyAnimatorCompat;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iput-object p2, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iput-object p3, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->val$oldViewAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 338
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

    .line 346
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->val$oldViewAnim:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 347
    invoke-static {p1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 348
    invoke-static {p1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 349
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 350
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-static {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->-get2(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 351
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-static {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->-wrap3(Lcom/android/camera/fragment/DefaultItemAnimator;)V

    .line 352
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 341
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->this$0:Lcom/android/camera/fragment/DefaultItemAnimator;

    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator$7;->val$changeInfo:Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 342
    return-void
.end method
