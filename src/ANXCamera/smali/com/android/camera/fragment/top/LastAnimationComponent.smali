.class public Lcom/android/camera/fragment/top/LastAnimationComponent;
.super Ljava/lang/Object;
.source "LastAnimationComponent.java"


# static fields
.field public static final DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;


# instance fields
.field public mAnchorView:Landroid/view/View;

.field public mHidedViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field public mReverseLeft:I

.field public mReverseRecyclerViewLeft:I

.field public mShown:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    sput-object v0, Lcom/android/camera/fragment/top/LastAnimationComponent;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hideOtherViews(ILjava/util/List;)V
    .locals 4
    .param p1, "tag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Landroid/widget/ImageView;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p2, "views":Ljava/util/List;, "Ljava/util/List<Landroid/widget/ImageView;>;"
    iget-boolean v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    if-eqz v2, :cond_0

    .line 104
    return-void

    .line 107
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    .line 109
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    if-nez v2, :cond_2

    .line 110
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    .line 114
    :goto_0
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "view$iterator":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 116
    .local v0, "view":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, p1, :cond_1

    .line 120
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    .line 124
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_1

    .line 128
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    new-instance v2, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {v2, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    sget-object v3, Lcom/android/camera/fragment/top/LastAnimationComponent;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    const/16 v3, 0x96

    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 112
    .end local v0    # "view":Landroid/view/View;
    .end local v1    # "view$iterator":Ljava/util/Iterator;
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    goto :goto_0

    .line 131
    .restart local v1    # "view$iterator":Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method public reverse(Z)Z
    .locals 9
    .param p1, "anim"    # Z

    .prologue
    const/16 v8, 0x12c

    const/4 v3, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 39
    iget-boolean v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    if-nez v2, :cond_0

    .line 40
    return v3

    .line 43
    :cond_0
    iput-boolean v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    .line 45
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    if-eqz v2, :cond_3

    .line 46
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "view$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 47
    .local v0, "view":Landroid/view/View;
    if-eqz p1, :cond_1

    .line 48
    new-instance v2, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {v2, v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v8}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 50
    new-instance v3, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    .line 48
    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 51
    const/16 v3, 0x96

    .line 48
    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 54
    :cond_1
    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 58
    .end local v0    # "view":Landroid/view/View;
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 59
    iput-object v6, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    .line 63
    .end local v1    # "view$iterator":Ljava/util/Iterator;
    :cond_3
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    if-eqz v2, :cond_4

    .line 64
    if-eqz p1, :cond_5

    .line 65
    new-instance v2, Lcom/android/camera/animation/type/TranslateXOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    iget v4, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v5, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-virtual {v2, v8}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 67
    sget-object v3, Lcom/android/camera/fragment/top/LastAnimationComponent;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 65
    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 72
    :goto_1
    iput-object v6, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    .line 76
    :cond_4
    if-eqz p1, :cond_6

    .line 77
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 79
    iget v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v4, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    .line 77
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 80
    const-wide/16 v4, 0x12c

    .line 77
    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 81
    sget-object v3, Lcom/android/camera/fragment/top/LastAnimationComponent;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 77
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 82
    new-instance v3, Lcom/android/camera/fragment/top/LastAnimationComponent$1;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/top/LastAnimationComponent$1;-><init>(Lcom/android/camera/fragment/top/LastAnimationComponent;)V

    .line 77
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 99
    :goto_2
    const/4 v2, 0x1

    return v2

    .line 70
    :cond_5
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    iget v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v4, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_1

    .line 92
    :cond_6
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v2, v7}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 93
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v4, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 94
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 95
    iput-object v6, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    goto :goto_2
.end method
