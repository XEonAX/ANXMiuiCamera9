.class Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/PhoneActionMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OverflowMenuViewAnimator"
.end annotation


# instance fields
.field private Qo:Landroid/animation/AnimatorSet;

.field private Qp:Landroid/animation/AnimatorSet;

.field private Qq:Lcom/miui/internal/widget/ActionBarOverlayLayout;

.field final synthetic Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;


# direct methods
.method private constructor <init>(Lcom/miui/internal/view/menu/PhoneActionMenuView;)V
    .registers 2

    .prologue
    .line 405
    iput-object p1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/internal/view/menu/PhoneActionMenuView;Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;-><init>(Lcom/miui/internal/view/menu/PhoneActionMenuView;)V

    return-void
.end method

.method private tA(Z)V
    .registers 4

    .prologue
    .line 530
    if-eqz p1, :cond_d

    .line 531
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qq:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v0}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContentView()Landroid/view/View;

    move-result-object v0

    .line 532
    const/4 v1, 0x0

    .line 531
    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 537
    :goto_c
    return-void

    .line 534
    :cond_d
    invoke-static {}, Lcom/miui/internal/variable/Android_View_View_class$Factory;->getInstance()Lcom/miui/internal/variable/Android_View_View_class$Factory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/internal/variable/Android_View_View_class$Factory;->get()Lcom/miui/internal/variable/Android_View_View_class;

    move-result-object v0

    .line 535
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qq:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContentView()Landroid/view/View;

    move-result-object v1

    .line 534
    invoke-virtual {v0, v1}, Lcom/miui/internal/variable/Android_View_View_class;->setImportantForAccessibilityNoHideDescendants(Landroid/view/View;)V

    goto :goto_c
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 456
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 457
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 459
    :cond_11
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 460
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 462
    :cond_22
    return-void
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 449
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->ty()V

    .line 450
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 451
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 452
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 453
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 4

    .prologue
    .line 517
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tv(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object v0

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qm:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_14

    .line 518
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tv(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object v0

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_24

    .line 519
    :cond_14
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setValue(F)V

    .line 520
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->tA(Z)V

    .line 526
    :cond_1e
    :goto_1e
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->postInvalidateOnAnimation()V

    .line 527
    return-void

    .line 521
    :cond_24
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tv(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object v0

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qk:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_38

    .line 522
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tv(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object v0

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_1e

    .line 523
    :cond_38
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setValue(F)V

    .line 524
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->tA(Z)V

    goto :goto_1e
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4

    .prologue
    .line 500
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tw(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 501
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tw(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_28

    .line 502
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    invoke-static {v0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tx(Lcom/miui/internal/view/menu/PhoneActionMenuView;Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 503
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->tA(Z)V

    .line 510
    :cond_22
    :goto_22
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->postInvalidateOnAnimation()V

    .line 511
    return-void

    .line 504
    :cond_28
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tw(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getMeasuredHeight()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_22

    .line 505
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    invoke-static {v0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tx(Lcom/miui/internal/view/menu/PhoneActionMenuView;Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 506
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->tA(Z)V

    .line 507
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tt(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tu(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_22
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    .prologue
    .line 514
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    .prologue
    .line 497
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4

    .prologue
    .line 541
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tv(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object v0

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_14

    .line 542
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getPresenter()Lcom/miui/internal/view/menu/ActionMenuPresenter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    .line 544
    :cond_14
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 442
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->ty()V

    .line 443
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 444
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 445
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 446
    return-void
.end method

.method public ty()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    const/high16 v7, 0x10e0000

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 414
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_a8

    .line 416
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    .line 415
    invoke-static {v0}, Lmiui/util/ActionBarUtils;->getActionBarOverlayLayout(Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/widget/ActionBarOverlayLayout;

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qq:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    .line 418
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 419
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    const-string/jumbo v2, "Value"

    new-array v3, v4, [F

    fill-array-data v3, :array_aa

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 420
    new-array v2, v4, [Landroid/animation/Animator;

    aput-object v1, v2, v5

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qq:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v1, p0}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;->show()Landroid/animation/Animator;

    move-result-object v1

    aput-object v1, v2, v6

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 421
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 422
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 423
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 424
    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    .line 426
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 427
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    const-string/jumbo v2, "Value"

    new-array v3, v4, [F

    fill-array-data v3, :array_b2

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 428
    new-array v2, v4, [Landroid/animation/Animator;

    aput-object v1, v2, v5

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qq:Lcom/miui/internal/widget/ActionBarOverlayLayout;

    invoke-virtual {v1, v8}, Lcom/miui/internal/widget/ActionBarOverlayLayout;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/internal/widget/ActionBarOverlayLayout$ContentMaskAnimator;->hide()Landroid/animation/Animator;

    move-result-object v1

    aput-object v1, v2, v6

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 429
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qr:Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 430
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 431
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 432
    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    .line 434
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->FEATURE_WHOLE_ANIM:Z

    if-nez v0, :cond_a8

    .line 435
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 436
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 439
    :cond_a8
    return-void

    .line 419
    nop

    :array_aa
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 427
    :array_b2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public tz()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 465
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_44

    .line 467
    :try_start_7
    const-string/jumbo v0, "android.animation.AnimatorSet"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string/jumbo v1, "reverse"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 468
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 469
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    :cond_28
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 472
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_38} :catch_39

    .line 494
    :cond_38
    :goto_38
    return-void

    .line 474
    :catch_39
    move-exception v0

    .line 475
    const-string/jumbo v1, "PhoneActionMenuView"

    const-string/jumbo v2, "reverse: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_38

    .line 479
    :cond_44
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_52

    .line 480
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qp:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v0

    .line 482
    :cond_52
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_60

    .line 483
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->Qo:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v0

    .line 486
    :cond_60
    if-nez v0, :cond_63

    .line 487
    return-void

    .line 490
    :cond_63
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_67
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/Animator;

    .line 491
    check-cast v0, Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->reverse()V

    goto :goto_67
.end method
