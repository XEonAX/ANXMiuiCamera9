.class public abstract Lcom/miui/internal/view/menu/ActionMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;
.implements Lcom/miui/internal/view/menu/MenuView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;,
        Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;,
        Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;
    }
.end annotation


# instance fields
.field private Ob:Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;

.field private Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

.field private Od:Z

.field private mMenu:Lcom/miui/internal/view/menu/MenuBuilder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/internal/view/menu/ActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->setBaselineAligned(Z)V

    .line 41
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;

    invoke-direct {v0, p0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;-><init>(Lcom/miui/internal/view/menu/ActionMenuView;)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Ob:Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;

    .line 42
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->FEATURE_WHOLE_ANIM:Z

    if-nez v0, :cond_17

    .line 43
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 47
    :goto_16
    return-void

    .line 45
    :cond_17
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->initLayoutAnimation()Landroid/view/animation/LayoutAnimationController;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    goto :goto_16
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    .prologue
    .line 140
    if-eqz p1, :cond_5

    instance-of v0, p1, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    :goto_4
    return v0

    :cond_5
    const/4 v0, 0x0

    goto :goto_4
.end method

.method protected computeAlpha(FZZ)F
    .registers 6

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x41200000    # 10.0f

    .line 259
    if-eqz p2, :cond_9

    if-eqz p3, :cond_9

    .line 267
    :cond_8
    :goto_8
    return v0

    .line 261
    :cond_9
    if-eqz p2, :cond_11

    .line 262
    sub-float/2addr v0, p1

    mul-float/2addr v0, v1

    float-to-int v0, v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    goto :goto_8

    .line 263
    :cond_11
    if-eqz p3, :cond_8

    .line 264
    mul-float v0, p1, v1

    float-to-int v0, v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    goto :goto_8
.end method

.method protected computeTranslationY(FZZ)F
    .registers 12

    .prologue
    const/high16 v7, 0x40000000    # 2.0f

    const/high16 v6, 0x3f800000    # 1.0f

    .line 241
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getCollapsedHeight()I

    move-result v0

    int-to-float v0, v0

    .line 243
    if-eqz p2, :cond_1c

    if-eqz p3, :cond_1c

    .line 244
    float-to-double v2, p1

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    cmpg-double v1, v2, v4

    if-gez v1, :cond_17

    .line 245
    mul-float/2addr p1, v7

    .line 253
    :cond_15
    :goto_15
    mul-float/2addr v0, p1

    .line 254
    return v0

    .line 247
    :cond_17
    sub-float v1, v6, p1

    mul-float p1, v7, v1

    goto :goto_15

    .line 249
    :cond_1c
    if-eqz p3, :cond_15

    .line 250
    sub-float p1, v6, p1

    goto :goto_15
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 3

    .prologue
    .line 177
    const/4 v0, 0x0

    return v0
.end method

.method public filterLeftoverView(I)Z
    .registers 3

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 112
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 113
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->removeView(Landroid/view/View;)V

    .line 114
    const/4 v0, 0x1

    return v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .registers 2

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateDefaultLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;
    .registers 3

    .prologue
    const/4 v1, -0x2

    .line 119
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    invoke-direct {v0, v1, v1}, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;-><init>(II)V

    .line 121
    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->generateLayoutParams(Landroid/util/AttributeSet;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;
    .registers 4

    .prologue
    .line 126
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;
    .registers 3

    .prologue
    .line 131
    instance-of v0, p1, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    if-eqz v0, :cond_c

    .line 132
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    check-cast p1, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    invoke-direct {v0, p1}, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;-><init>(Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;)V

    .line 133
    return-object v0

    .line 135
    :cond_c
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateOverflowButtonLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;
    .registers 3

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->generateDefaultLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v0

    .line 145
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;->isOverflowButton:Z

    .line 146
    return-object v0
.end method

.method public abstract getCollapsedHeight()I
.end method

.method public getPresenter()Lcom/miui/internal/view/menu/ActionMenuPresenter;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    return-object v0
.end method

.method public getWindowAnimations()I
    .registers 2

    .prologue
    .line 154
    const/4 v0, 0x0

    return v0
.end method

.method public hasBackgroundView()Z
    .registers 2

    .prologue
    .line 182
    const/4 v0, 0x0

    return v0
.end method

.method protected hasDividerBeforeChildAt(I)Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 164
    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 165
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 167
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildCount()I

    move-result v3

    if-ge p1, v3, :cond_1b

    instance-of v3, v0, Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;

    if-eqz v3, :cond_1b

    .line 168
    check-cast v0, Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;

    invoke-interface {v0}, Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;->needsDividerAfter()Z

    move-result v2

    .line 170
    :cond_1b
    if-lez p1, :cond_2a

    instance-of v0, v1, Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;

    if-eqz v0, :cond_2c

    move-object v0, v1

    .line 171
    check-cast v0, Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;

    invoke-interface {v0}, Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;->needsDividerBefore()Z

    move-result v0

    or-int/2addr v0, v2

    .line 173
    :goto_29
    return v0

    :cond_2a
    move v0, v2

    .line 170
    goto :goto_29

    :cond_2c
    move v0, v2

    goto :goto_29
.end method

.method protected initLayoutAnimation()Landroid/view/animation/LayoutAnimationController;
    .registers 10

    .prologue
    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 50
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    move v3, v1

    move v4, v2

    move v7, v5

    move v8, v2

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 51
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/miui/internal/R$integer;->action_menu_item_appear_duration:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-long v2, v2

    .line 52
    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 53
    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 54
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/miui/internal/R$integer;->action_menu_item_anim_delay:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v6

    long-to-float v2, v2

    div-float v2, v4, v2

    .line 55
    new-instance v3, Landroid/view/animation/LayoutAnimationController;

    invoke-direct {v3, v0, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;F)V

    .line 56
    invoke-virtual {v3, v0}, Landroid/view/animation/LayoutAnimationController;->setAnimation(Landroid/view/animation/Animation;)V

    .line 57
    invoke-virtual {v3, v1}, Landroid/view/animation/LayoutAnimationController;->setOrder(I)V

    .line 58
    return-object v3
.end method

.method public initialize(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 2

    .prologue
    .line 160
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuView;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 161
    return-void
.end method

.method public invokeItem(Lcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 4

    .prologue
    .line 150
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    move-result v0

    return v0
.end method

.method public isOverflowReserved()Z
    .registers 2

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Od:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_a

    .line 72
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 75
    :cond_a
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_25

    .line 76
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0, v2}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->updateMenuView(Z)V

    .line 78
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_25

    .line 79
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0, v2}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    .line 80
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->showOverflowMenu()Z

    .line 83
    :cond_25
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 97
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 98
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->dismissPopupMenus(Z)Z

    .line 99
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_b

    .line 88
    invoke-virtual {p0, v1, v1}, Lcom/miui/internal/view/menu/ActionMenuView;->setMeasuredDimension(II)V

    .line 89
    return-void

    .line 92
    :cond_b
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 93
    return-void
.end method

.method public onPageScrolled(IFZZ)V
    .registers 8

    .prologue
    .line 272
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->FEATURE_WHOLE_ANIM:Z

    if-eqz v0, :cond_b

    .line 273
    invoke-virtual {p0, p2, p3, p4}, Lcom/miui/internal/view/menu/ActionMenuView;->computeAlpha(FZZ)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->setAlpha(F)V

    .line 276
    :cond_b
    invoke-virtual {p0, p2, p3, p4}, Lcom/miui/internal/view/menu/ActionMenuView;->computeTranslationY(FZZ)F

    move-result v0

    .line 277
    if-eqz p3, :cond_1e

    xor-int/lit8 v1, p4, 0x1

    if-nez v1, :cond_1e

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuView;->getTranslationY()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_21

    .line 278
    :cond_1e
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->setTranslationY(F)V

    .line 280
    :cond_21
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Ob:Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;

    invoke-virtual {v1, v0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->sO(F)V

    .line 281
    return-void
.end method

.method public playCloseAnimator()V
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Ob:Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->close()V

    .line 237
    return-void
.end method

.method public playOpenAnimator()V
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Ob:Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuView$OpenCloseAnimator;->sN()V

    .line 233
    return-void
.end method

.method public setOverflowReserved(Z)V
    .registers 2

    .prologue
    .line 106
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Od:Z

    .line 107
    return-void
.end method

.method public setPresenter(Lcom/miui/internal/view/menu/ActionMenuPresenter;)V
    .registers 2

    .prologue
    .line 62
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuView;->Oc:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    .line 63
    return-void
.end method
