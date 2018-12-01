.class public Lcom/android/camera/fragment/DefaultItemAnimator;
.super Landroid/support/v7/widget/RecyclerView$ItemAnimator;
.source "DefaultItemAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;,
        Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;,
        Lcom/android/camera/fragment/DefaultItemAnimator$VpaListenerAdapter;
    }
.end annotation


# instance fields
.field private mAddAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mAdditionsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;>;"
        }
    .end annotation
.end field

.field private mAleft:Z

.field private mChangeAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mChangesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private mMoveAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mMovesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPendingAdditions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingChanges:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingMoves:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingRemovals:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mRemoveAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAddAnimations:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMoveAnimations:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/fragment/DefaultItemAnimator;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mRemoveAnimations:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->animateAddImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/fragment/DefaultItemAnimator;Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;
    .param p1, "changeInfo"    # Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->animateChangeImpl(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "fromX"    # I
    .param p3, "fromY"    # I
    .param p4, "toX"    # I
    .param p5, "toY"    # I

    .prologue
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/fragment/DefaultItemAnimator;->animateMoveImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/fragment/DefaultItemAnimator;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/DefaultItemAnimator;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchFinishedWhenDone()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAddAnimations:Ljava/util/ArrayList;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMoveAnimations:Ljava/util/ArrayList;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mRemoveAnimations:Ljava/util/ArrayList;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAleft:Z

    .line 21
    return-void
.end method

.method private animateAddImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 6
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 209
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 210
    .local v1, "view":Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 211
    .local v0, "animation":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v2, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAddAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getAddDuration()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 213
    new-instance v3, Lcom/android/camera/fragment/DefaultItemAnimator$5;

    invoke-direct {v3, p0, p1, v0}, Lcom/android/camera/fragment/DefaultItemAnimator$5;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v4/view/ViewPropertyAnimatorCompat;)V

    .line 212
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 232
    return-void
.end method

.method private animateChangeImpl(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V
    .locals 11
    .param p1, "changeInfo"    # Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    .prologue
    const/4 v10, 0x0

    .line 328
    iget-object v0, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 329
    .local v0, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v0, :cond_2

    const/4 v6, 0x0

    .line 330
    :goto_0
    iget-object v1, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 331
    .local v1, "newHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_3

    iget-object v2, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 332
    :goto_1
    if-eqz v6, :cond_0

    .line 334
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getChangeDuration()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v5

    .line 335
    .local v5, "oldViewAnim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    iget-object v8, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    iget v7, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->toX:I

    iget v8, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->fromX:I

    sub-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v5, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 337
    iget v7, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->toY:I

    iget v8, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->fromY:I

    sub-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v5, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 338
    new-instance v7, Lcom/android/camera/fragment/DefaultItemAnimator$7;

    invoke-direct {v7, p0, p1, v5}, Lcom/android/camera/fragment/DefaultItemAnimator$7;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v4/view/ViewPropertyAnimatorCompat;)V

    invoke-virtual {v5, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 354
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    const-wide/16 v8, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    .line 355
    .local v4, "oldViewAlpha":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    invoke-virtual {v4, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    new-instance v8, Lcom/android/camera/fragment/DefaultItemAnimator$8;

    invoke-direct {v8, p0, v4, p1}, Lcom/android/camera/fragment/DefaultItemAnimator$8;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v4/view/ViewPropertyAnimatorCompat;Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V

    invoke-virtual {v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 369
    .end local v4    # "oldViewAlpha":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .end local v5    # "oldViewAnim":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    :cond_0
    if-eqz v2, :cond_1

    .line 370
    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    .line 371
    .local v3, "newViewAnimation":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    iget-object v8, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    invoke-virtual {v3, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getChangeDuration()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    .line 373
    const/high16 v8, 0x3f800000    # 1.0f

    .line 372
    invoke-virtual {v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    .line 373
    new-instance v8, Lcom/android/camera/fragment/DefaultItemAnimator$9;

    invoke-direct {v8, p0, p1, v3, v2}, Lcom/android/camera/fragment/DefaultItemAnimator$9;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    .line 372
    invoke-virtual {v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 391
    .end local v3    # "newViewAnimation":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    :cond_1
    return-void

    .line 329
    .end local v1    # "newHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_2
    iget-object v6, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .local v6, "view":Landroid/view/View;
    goto/16 :goto_0

    .line 331
    .end local v6    # "view":Landroid/view/View;
    .restart local v1    # "newHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_3
    const/4 v2, 0x0

    .local v2, "newView":Landroid/view/View;
    goto/16 :goto_1
.end method

.method private animateMoveImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)V
    .locals 8
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "fromX"    # I
    .param p3, "fromY"    # I
    .param p4, "toX"    # I
    .param p5, "toY"    # I

    .prologue
    const/4 v1, 0x0

    .line 263
    iget-object v6, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 264
    .local v6, "view":Landroid/view/View;
    sub-int v3, p4, p2

    .line 265
    .local v3, "deltaX":I
    sub-int v4, p5, p3

    .line 266
    .local v4, "deltaY":I
    if-eqz v3, :cond_0

    .line 267
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 269
    :cond_0
    if-eqz v4, :cond_1

    .line 270
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 275
    :cond_1
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v5

    .line 276
    .local v5, "animation":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getMoveDuration()J

    move-result-wide v0

    invoke-virtual {v5, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator$6;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/DefaultItemAnimator$6;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;IILandroid/support/v4/view/ViewPropertyAnimatorCompat;)V

    invoke-virtual {v7, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 301
    return-void
.end method

.method private animateRemoveImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 178
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 179
    .local v1, "view":Landroid/view/View;
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 180
    .local v0, "animation":Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    iget-object v2, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mRemoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getRemoveDuration()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 182
    const/4 v3, 0x0

    .line 181
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 182
    new-instance v3, Lcom/android/camera/fragment/DefaultItemAnimator$4;

    invoke-direct {v3, p0, p1, v0}, Lcom/android/camera/fragment/DefaultItemAnimator$4;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v4/view/ViewPropertyAnimatorCompat;)V

    .line 181
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 197
    return-void
.end method

.method private dispatchFinishedWhenDone()V
    .locals 1

    .prologue
    .line 538
    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 539
    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAnimationsFinished()V

    .line 541
    :cond_0
    return-void
.end method

.method private endChangeAnimation(Ljava/util/List;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 3
    .param p2, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;",
            ">;",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 394
    .local p1, "infoList":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 395
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    .line 396
    .local v0, "changeInfo":Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;
    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 397
    iget-object v2, v0, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-nez v2, :cond_0

    iget-object v2, v0, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-nez v2, :cond_0

    .line 398
    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 394
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 402
    .end local v0    # "changeInfo":Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;
    :cond_1
    return-void
.end method

.method private endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V
    .locals 1
    .param p1, "changeInfo"    # Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    .prologue
    .line 405
    iget-object v0, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v0, :cond_0

    .line 406
    iget-object v0, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    .line 408
    :cond_0
    iget-object v0, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v0, :cond_1

    .line 409
    iget-object v0, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    .line 411
    :cond_1
    return-void
.end method

.method private endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 4
    .param p1, "changeInfo"    # Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;
    .param p2, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 414
    const/4 v0, 0x0

    .line 415
    .local v0, "oldItem":Z
    iget-object v1, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v1, p2, :cond_0

    .line 416
    iput-object v2, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->newHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 423
    :goto_0
    iget-object v1, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 424
    iget-object v1, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 425
    iget-object v1, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 426
    invoke-virtual {p0, p2, v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 427
    const/4 v1, 0x1

    return v1

    .line 417
    :cond_0
    iget-object v1, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v1, p2, :cond_1

    .line 418
    iput-object v2, p1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 419
    const/4 v0, 0x1

    goto :goto_0

    .line 421
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private resetAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 513
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/animation/AnimatorCompatHelper;->clearInterpolator(Landroid/view/View;)V

    .line 514
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->endAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 515
    return-void
.end method


# virtual methods
.method public animateAdd(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 201
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->resetAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 202
    iget-boolean v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAleft:Z

    if-eqz v1, :cond_0

    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 203
    .local v0, "deltaX":I
    :goto_0
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    int-to-float v2, v0

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 204
    iget-object v1, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    const/4 v1, 0x1

    return v1

    .line 202
    .end local v0    # "deltaX":I
    :cond_0
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    neg-int v0, v1

    .restart local v0    # "deltaX":I
    goto :goto_0
.end method

.method public animateChange(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z
    .locals 15
    .param p1, "oldHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "newHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "fromX"    # I
    .param p4, "fromY"    # I
    .param p5, "toX"    # I
    .param p6, "toY"    # I

    .prologue
    .line 306
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTranslationX(Landroid/view/View;)F

    move-result v12

    .line 307
    .local v12, "prevTranslationX":F
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v13

    .line 308
    .local v13, "prevTranslationY":F
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getAlpha(Landroid/view/View;)F

    move-result v11

    .line 309
    .local v11, "prevAlpha":F
    invoke-direct/range {p0 .. p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->resetAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 310
    sub-int v1, p5, p3

    int-to-float v1, v1

    sub-float/2addr v1, v12

    float-to-int v9, v1

    .line 311
    .local v9, "deltaX":I
    sub-int v1, p6, p4

    int-to-float v1, v1

    sub-float/2addr v1, v13

    float-to-int v10, v1

    .line 313
    .local v10, "deltaY":I
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1, v12}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 314
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1, v13}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 315
    move-object/from16 v0, p1

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1, v11}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 316
    if-eqz p2, :cond_0

    move-object/from16 v0, p2

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 318
    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/DefaultItemAnimator;->resetAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 319
    move-object/from16 v0, p2

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    neg-int v2, v9

    int-to-float v2, v2

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 320
    move-object/from16 v0, p2

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    neg-int v2, v10

    int-to-float v2, v2

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 321
    move-object/from16 v0, p2

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 323
    :cond_0
    iget-object v14, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    new-instance v1, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    const/4 v8, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    invoke-direct/range {v1 .. v8}, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;-><init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIIILcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V

    invoke-virtual {v14, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    const/4 v1, 0x1

    return v1
.end method

.method public animateMove(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z
    .locals 11
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "fromX"    # I
    .param p3, "fromY"    # I
    .param p4, "toX"    # I
    .param p5, "toY"    # I

    .prologue
    .line 237
    iget-object v9, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 238
    .local v9, "view":Landroid/view/View;
    int-to-float v0, p2

    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTranslationX(Landroid/view/View;)F

    move-result v1

    add-float/2addr v0, v1

    float-to-int p2, v0

    .line 239
    int-to-float v0, p3

    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v1

    add-float/2addr v0, v1

    float-to-int p3, v0

    .line 240
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->resetAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 241
    sub-int v7, p4, p2

    .line 242
    .local v7, "deltaX":I
    sub-int v8, p5, p3

    .line 243
    .local v8, "deltaY":I
    if-nez v7, :cond_0

    if-nez v8, :cond_0

    .line 244
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 245
    const/4 v0, 0x0

    return v0

    .line 247
    :cond_0
    if-eqz v7, :cond_1

    .line 248
    neg-int v0, v7

    int-to-float v0, v0

    invoke-static {v9, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 250
    :cond_1
    if-lez v7, :cond_3

    .line 251
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAleft:Z

    .line 255
    :goto_0
    if-eqz v8, :cond_2

    .line 256
    neg-int v0, v8

    int-to-float v0, v0

    invoke-static {v9, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 258
    :cond_2
    iget-object v10, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;

    const/4 v6, 0x0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;-><init>(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIIILcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;)V

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    const/4 v0, 0x1

    return v0

    .line 253
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAleft:Z

    goto :goto_0
.end method

.method public animateRemove(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 172
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->resetAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 173
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    const/4 v0, 0x1

    return v0
.end method

.method cancelAll(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 630
    .local p1, "viewHolders":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 631
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v1, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 630
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 633
    :cond_0
    return-void
.end method

.method public endAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 10
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    .line 432
    iget-object v6, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 434
    .local v6, "view":Landroid/view/View;
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 436
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_1

    .line 437
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;

    .line 438
    .local v4, "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    iget-object v7, v4, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v7, p1, :cond_0

    .line 439
    invoke-static {v6, v8}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 440
    invoke-static {v6, v8}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 441
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 442
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 436
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 445
    .end local v4    # "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    :cond_1
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-direct {p0, v7, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimation(Ljava/util/List;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 446
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 447
    invoke-static {v6, v9}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 448
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 450
    :cond_2
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 451
    invoke-static {v6, v9}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 452
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 455
    :cond_3
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    :goto_1
    if-ltz v2, :cond_5

    .line 456
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 457
    .local v1, "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    invoke-direct {p0, v1, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimation(Ljava/util/List;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 458
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 459
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 455
    :cond_4
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 462
    .end local v1    # "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    :cond_5
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    :goto_2
    if-ltz v2, :cond_8

    .line 463
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 464
    .local v5, "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    .local v3, "j":I
    :goto_3
    if-ltz v3, :cond_6

    .line 465
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;

    .line 466
    .restart local v4    # "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    iget-object v7, v4, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v7, p1, :cond_7

    .line 467
    invoke-static {v6, v8}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 468
    invoke-static {v6, v8}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 469
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 470
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 471
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 472
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 462
    .end local v4    # "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    :cond_6
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 464
    .restart local v4    # "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    :cond_7
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    .line 478
    .end local v3    # "j":I
    .end local v4    # "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    .end local v5    # "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    :cond_8
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    :goto_4
    if-ltz v2, :cond_a

    .line 479
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 480
    .local v0, "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 481
    invoke-static {v6, v9}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 482
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 483
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 484
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 478
    :cond_9
    add-int/lit8 v2, v2, -0x1

    goto :goto_4

    .line 490
    .end local v0    # "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    :cond_a
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mRemoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    .line 495
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAddAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    .line 500
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    .line 505
    iget-object v7, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    .line 509
    invoke-direct {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchFinishedWhenDone()V

    .line 510
    return-void
.end method

.method public endAnimations()V
    .locals 14

    .prologue
    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    .line 545
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 546
    .local v2, "count":I
    add-int/lit8 v3, v2, -0x1

    .local v3, "i":I
    :goto_0
    if-ltz v3, :cond_0

    .line 547
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;

    .line 548
    .local v5, "item":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    iget-object v11, v5, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v10, v11, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 549
    .local v10, "view":Landroid/view/View;
    invoke-static {v10, v12}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 550
    invoke-static {v10, v12}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 551
    iget-object v11, v5, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 552
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 546
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 554
    .end local v5    # "item":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    .end local v10    # "view":Landroid/view/View;
    :cond_0
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 555
    add-int/lit8 v3, v2, -0x1

    :goto_1
    if-ltz v3, :cond_1

    .line 556
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 557
    .local v4, "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 558
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 555
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 560
    .end local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_1
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 561
    add-int/lit8 v3, v2, -0x1

    :goto_2
    if-ltz v3, :cond_2

    .line 562
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 563
    .restart local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v10, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 564
    .restart local v10    # "view":Landroid/view/View;
    invoke-static {v10, v13}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 565
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 566
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 561
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 568
    .end local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v10    # "view":Landroid/view/View;
    :cond_2
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 569
    add-int/lit8 v3, v2, -0x1

    :goto_3
    if-ltz v3, :cond_3

    .line 570
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    invoke-direct {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V

    .line 569
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    .line 572
    :cond_3
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 573
    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->isRunning()Z

    move-result v11

    if-nez v11, :cond_4

    .line 574
    return-void

    .line 577
    :cond_4
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 578
    .local v7, "listCount":I
    add-int/lit8 v3, v7, -0x1

    :goto_4
    if-ltz v3, :cond_7

    .line 579
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/ArrayList;

    .line 580
    .local v9, "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 581
    add-int/lit8 v6, v2, -0x1

    .local v6, "j":I
    :goto_5
    if-ltz v6, :cond_6

    .line 582
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;

    .line 583
    .local v8, "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    iget-object v4, v8, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 584
    .restart local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v10, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 585
    .restart local v10    # "view":Landroid/view/View;
    invoke-static {v10, v12}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 586
    invoke-static {v10, v12}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 587
    iget-object v11, v8, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 588
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 589
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 590
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 581
    :cond_5
    add-int/lit8 v6, v6, -0x1

    goto :goto_5

    .line 578
    .end local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v8    # "moveInfo":Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;
    .end local v10    # "view":Landroid/view/View;
    :cond_6
    add-int/lit8 v3, v3, -0x1

    goto :goto_4

    .line 594
    .end local v6    # "j":I
    .end local v9    # "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    :cond_7
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 595
    add-int/lit8 v3, v7, -0x1

    :goto_6
    if-ltz v3, :cond_a

    .line 596
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 597
    .local v0, "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 598
    add-int/lit8 v6, v2, -0x1

    .restart local v6    # "j":I
    :goto_7
    if-ltz v6, :cond_9

    .line 599
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 600
    .restart local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v10, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 601
    .restart local v10    # "view":Landroid/view/View;
    invoke-static {v10, v13}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 602
    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 603
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 604
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_8

    .line 605
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 598
    :cond_8
    add-int/lit8 v6, v6, -0x1

    goto :goto_7

    .line 595
    .end local v4    # "item":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v10    # "view":Landroid/view/View;
    :cond_9
    add-int/lit8 v3, v3, -0x1

    goto :goto_6

    .line 609
    .end local v0    # "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    .end local v6    # "j":I
    :cond_a
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 610
    add-int/lit8 v3, v7, -0x1

    :goto_8
    if-ltz v3, :cond_d

    .line 611
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 612
    .local v1, "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 613
    add-int/lit8 v6, v2, -0x1

    .restart local v6    # "j":I
    :goto_9
    if-ltz v6, :cond_c

    .line 614
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    invoke-direct {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->endChangeAnimationIfNecessary(Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;)V

    .line 615
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_b

    .line 616
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 613
    :cond_b
    add-int/lit8 v6, v6, -0x1

    goto :goto_9

    .line 610
    :cond_c
    add-int/lit8 v3, v3, -0x1

    goto :goto_8

    .line 621
    .end local v1    # "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    .end local v6    # "j":I
    :cond_d
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mRemoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->cancelAll(Ljava/util/List;)V

    .line 622
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->cancelAll(Ljava/util/List;)V

    .line 623
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAddAnimations:Ljava/util/ArrayList;

    invoke-virtual {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->cancelAll(Ljava/util/List;)V

    .line 624
    iget-object v11, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    invoke-virtual {p0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator;->cancelAll(Ljava/util/List;)V

    .line 626
    invoke-virtual {p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->dispatchAnimationsFinished()V

    .line 627
    return-void
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 519
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 520
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 521
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 522
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 523
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 524
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mRemoveAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 525
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAddAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 526
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangeAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 527
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 528
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    if-nez v0, :cond_0

    .line 529
    iget-object v0, p0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 519
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public runPendingAnimations()V
    .locals 18

    .prologue
    .line 86
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v15

    xor-int/lit8 v13, v15, 0x1

    .line 87
    .local v13, "removalsPending":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v15

    xor-int/lit8 v12, v15, 0x1

    .line 88
    .local v12, "movesPending":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v15

    xor-int/lit8 v7, v15, 0x1

    .line 89
    .local v7, "changesPending":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v15

    xor-int/lit8 v4, v15, 0x1

    .line 90
    .local v4, "additionsPending":Z
    if-nez v13, :cond_0

    xor-int/lit8 v15, v12, 0x1

    if-eqz v15, :cond_0

    xor-int/lit8 v15, v4, 0x1

    if-eqz v15, :cond_0

    xor-int/lit8 v15, v7, 0x1

    if-eqz v15, :cond_0

    .line 92
    return-void

    .line 95
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "holder$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 96
    .local v8, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/android/camera/fragment/DefaultItemAnimator;->animateRemoveImpl(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    goto :goto_0

    .line 98
    .end local v8    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingRemovals:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 100
    if-eqz v12, :cond_2

    .line 101
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v11, "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 103
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mMovesList:Ljava/util/ArrayList;

    invoke-virtual {v15, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingMoves:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 105
    new-instance v10, Lcom/android/camera/fragment/DefaultItemAnimator$1;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v11}, Lcom/android/camera/fragment/DefaultItemAnimator$1;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Ljava/util/ArrayList;)V

    .line 116
    .local v10, "mover":Ljava/lang/Runnable;
    if-eqz v13, :cond_5

    .line 117
    const/4 v15, 0x0

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;

    iget-object v15, v15, Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;->holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v14, v15, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 118
    .local v14, "view":Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getRemoveDuration()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-static {v14, v10, v0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    .line 124
    .end local v10    # "mover":Ljava/lang/Runnable;
    .end local v11    # "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    .end local v14    # "view":Landroid/view/View;
    :cond_2
    :goto_1
    if-eqz v7, :cond_3

    .line 125
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .local v6, "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 127
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mChangesList:Ljava/util/ArrayList;

    invoke-virtual {v15, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingChanges:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 129
    new-instance v5, Lcom/android/camera/fragment/DefaultItemAnimator$2;

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v6}, Lcom/android/camera/fragment/DefaultItemAnimator$2;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Ljava/util/ArrayList;)V

    .line 139
    .local v5, "changer":Ljava/lang/Runnable;
    if-eqz v13, :cond_6

    .line 140
    const/4 v15, 0x0

    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;

    iget-object v8, v15, Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;->oldHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 141
    .restart local v8    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v15, v8, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getRemoveDuration()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-static {v15, v5, v0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    .line 147
    .end local v5    # "changer":Ljava/lang/Runnable;
    .end local v6    # "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    .end local v8    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    .line 148
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v3, "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v3, v15}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 150
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mAdditionsList:Ljava/util/ArrayList;

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/fragment/DefaultItemAnimator;->mPendingAdditions:Ljava/util/ArrayList;

    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 152
    new-instance v2, Lcom/android/camera/fragment/DefaultItemAnimator$3;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/android/camera/fragment/DefaultItemAnimator$3;-><init>(Lcom/android/camera/fragment/DefaultItemAnimator;Ljava/util/ArrayList;)V

    .line 161
    .local v2, "adder":Ljava/lang/Runnable;
    if-eqz v13, :cond_7

    .line 162
    const/4 v15, 0x0

    invoke-virtual {v3, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v14, v15, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 163
    .restart local v14    # "view":Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/DefaultItemAnimator;->getRemoveDuration()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-static {v14, v2, v0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    .line 168
    .end local v2    # "adder":Ljava/lang/Runnable;
    .end local v3    # "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    .end local v14    # "view":Landroid/view/View;
    :cond_4
    :goto_3
    return-void

    .line 120
    .restart local v10    # "mover":Ljava/lang/Runnable;
    .restart local v11    # "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    :cond_5
    invoke-interface {v10}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 143
    .end local v10    # "mover":Ljava/lang/Runnable;
    .end local v11    # "moves":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$MoveInfo;>;"
    .restart local v5    # "changer":Ljava/lang/Runnable;
    .restart local v6    # "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    :cond_6
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V

    goto :goto_2

    .line 165
    .end local v5    # "changer":Ljava/lang/Runnable;
    .end local v6    # "changes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/fragment/DefaultItemAnimator$ChangeInfo;>;"
    .restart local v2    # "adder":Ljava/lang/Runnable;
    .restart local v3    # "additions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/widget/RecyclerView$ViewHolder;>;"
    :cond_7
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_3
.end method
