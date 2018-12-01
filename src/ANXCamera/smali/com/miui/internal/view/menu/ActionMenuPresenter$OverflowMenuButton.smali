.class Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;
.super Landroid/widget/Button;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/ActionMenuView$ActionMenuChildView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OverflowMenuButton"
.end annotation


# instance fields
.field final synthetic Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Landroid/content/Context;)V
    .registers 8

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 474
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    .line 475
    invoke-static {p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->tc(Lcom/miui/internal/view/menu/ActionMenuPresenter;)I

    move-result v0

    invoke-direct {p0, p2, v3, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 477
    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->setClickable(Z)V

    .line 478
    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->setFocusable(Z)V

    .line 479
    invoke-virtual {p0, v4}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->setVisibility(I)V

    .line 480
    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->setEnabled(Z)V

    .line 482
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v0, v0, v1

    .line 483
    if-eqz v0, :cond_30

    .line 484
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 485
    sget v2, Lcom/miui/internal/R$dimen;->action_button_icon_bounds:I

    .line 484
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 486
    invoke-virtual {v0, v4, v4, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 487
    invoke-virtual {p0, v3, v0, v3, v3}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 489
    :cond_30
    return-void
.end method

.method private isVisible()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 493
    :goto_2
    if-eqz p0, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_16

    .line 494
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 496
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1c

    .line 497
    check-cast v0, Landroid/view/ViewGroup;

    :goto_14
    move-object p0, v0

    goto :goto_2

    .line 500
    :cond_16
    if-nez p0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    move v0, v2

    goto :goto_19

    :cond_1c
    move-object v0, v1

    goto :goto_14
.end method


# virtual methods
.method public needsDividerAfter()Z
    .registers 2

    .prologue
    .line 531
    const/4 v0, 0x0

    return v0
.end method

.method public needsDividerBefore()Z
    .registers 2

    .prologue
    .line 527
    const/4 v0, 0x0

    return v0
.end method

.method public performClick()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 505
    invoke-super {p0}, Landroid/widget/Button;->performClick()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 506
    return v3

    .line 509
    :cond_8
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->isVisible()Z

    move-result v0

    if-nez v0, :cond_f

    .line 510
    return v3

    .line 513
    :cond_f
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_2a

    .line 514
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v1, v1, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/MenuBuilder;->getRootMenu()Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-static {v2}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->tg(Lcom/miui/internal/view/menu/ActionMenuPresenter;)Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/view/menu/MenuBuilder;->dispatchMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    .line 517
    :cond_2a
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->playSoundEffect(I)V

    .line 518
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 519
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0, v3}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    .line 523
    :goto_39
    return v3

    .line 521
    :cond_3a
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;->Ps:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->showOverflowMenu()Z

    goto :goto_39
.end method
