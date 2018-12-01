.class Lcom/android/camera/animation/AnimationComposite$2;
.super Ljava/lang/Object;
.source "AnimationComposite.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/animation/AnimationComposite;->disposeRotation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/animation/AnimationComposite;

.field final synthetic val$pendingViews:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/android/camera/animation/AnimationComposite;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/animation/AnimationComposite;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/animation/AnimationComposite$2;->this$0:Lcom/android/camera/animation/AnimationComposite;

    iput-object p2, p0, Lcom/android/camera/animation/AnimationComposite$2;->val$pendingViews:Ljava/util/List;

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 194
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 195
    .local v0, "value":I
    iget-object v3, p0, Lcom/android/camera/animation/AnimationComposite$2;->this$0:Lcom/android/camera/animation/AnimationComposite;

    invoke-static {v3, v0}, Lcom/android/camera/animation/AnimationComposite;->-set1(Lcom/android/camera/animation/AnimationComposite;I)I

    .line 196
    iget-object v3, p0, Lcom/android/camera/animation/AnimationComposite$2;->val$pendingViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "view$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 197
    .local v1, "view":Landroid/view/View;
    iget-object v3, p0, Lcom/android/camera/animation/AnimationComposite$2;->this$0:Lcom/android/camera/animation/AnimationComposite;

    invoke-static {v3}, Lcom/android/camera/animation/AnimationComposite;->-get0(Lcom/android/camera/animation/AnimationComposite;)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v1, v3}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    goto :goto_0

    .line 199
    .end local v1    # "view":Landroid/view/View;
    :cond_0
    return-void
.end method
