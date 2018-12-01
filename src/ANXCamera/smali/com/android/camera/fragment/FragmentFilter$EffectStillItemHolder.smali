.class public Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;
.super Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;
.source "FragmentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EffectStillItemHolder"
.end annotation


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mSelectedIndicator:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFilter;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    return-object v0
.end method

.method public constructor <init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentFilter;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 378
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    .line 379
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;-><init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/view/View;)V

    .line 380
    const v0, 0x7f0a0009

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mImageView:Landroid/widget/ImageView;

    .line 381
    const v0, 0x7f0a000b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    .line 382
    return-void
.end method


# virtual methods
.method public bindEffectIndex(ILcom/android/camera/data/data/ComponentDataItem;)V
    .locals 10
    .param p1, "index"    # I
    .param p2, "componentDataItem"    # Lcom/android/camera/data/data/ComponentDataItem;

    .prologue
    const-wide/16 v8, 0x1f4

    const/4 v6, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 386
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->bindEffectIndex(ILcom/android/camera/data/data/ComponentDataItem;)V

    .line 387
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mImageView:Landroid/widget/ImageView;

    iget v1, p2, Lcom/android/camera/data/data/ComponentDataItem;->mIconRes:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 388
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentFilter;->-get2(Lcom/android/camera/fragment/FragmentFilter;)I

    move-result v0

    if-ne p1, v0, :cond_2

    .line 389
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 390
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mImageView:Landroid/widget/ImageView;

    iget v2, p2, Lcom/android/camera/data/data/ComponentDataItem;->mIconRes:I

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/FragmentFilter;->-wrap0(Lcom/android/camera/fragment/FragmentFilter;Landroid/widget/ImageView;I)V

    .line 391
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->itemView:Landroid/view/View;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentFilter;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p2, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 393
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    const v3, 0x7f0f00db

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/FragmentFilter;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 392
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 394
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$1;-><init>(Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;)V

    .line 401
    const-wide/16 v2, 0x64

    .line 394
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 403
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentFilter;->-get0(Lcom/android/camera/fragment/FragmentFilter;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 404
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 405
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 406
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentFilter;->-get1(Lcom/android/camera/fragment/FragmentFilter;)Lmiui/view/animation/CubicEaseOutInterpolator;

    move-result-object v1

    .line 405
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 407
    new-instance v1, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$2;-><init>(Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;)V

    .line 405
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 455
    :goto_0
    return-void

    .line 424
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 425
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_0

    .line 429
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setActivated(Z)V

    .line 430
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentFilter;->-get0(Lcom/android/camera/fragment/FragmentFilter;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentFilter;->-get4(Lcom/android/camera/fragment/FragmentFilter;)I

    move-result v0

    if-ne p1, v0, :cond_3

    .line 431
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-static {v0, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 432
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 433
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentFilter;->-get1(Lcom/android/camera/fragment/FragmentFilter;)Lmiui/view/animation/CubicEaseOutInterpolator;

    move-result-object v1

    .line 432
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 434
    new-instance v1, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder$3;-><init>(Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;)V

    .line 432
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 450
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 451
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;->mSelectedIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setAlpha(F)V

    goto :goto_0
.end method
