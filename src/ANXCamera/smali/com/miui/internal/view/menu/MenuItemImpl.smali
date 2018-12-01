.class public final Lcom/miui/internal/view/menu/MenuItemImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem;


# static fields
.field private static final QA:I = 0x20

.field static final QB:I = 0x0

.field private static final QC:I = 0x3

.field private static QY:Ljava/lang/String; = null

.field private static QZ:Ljava/lang/String; = null

.field private static final Qv:I = 0x1

.field private static final Qw:I = 0x2

.field private static final Qx:I = 0x10

.field private static final Qy:I = 0x4

.field private static final Qz:I = 0x8

.field private static Ra:Ljava/lang/String; = null

.field private static Rb:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "MenuItemImpl"


# instance fields
.field private QD:Landroid/view/ActionProvider;

.field private QE:Landroid/view/View;

.field private final QF:I

.field private QG:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private QH:I

.field private final QI:I

.field private QJ:Landroid/graphics/drawable/Drawable;

.field private QK:I

.field private final QL:I

.field private QM:Landroid/content/Intent;

.field private QN:Z

.field private QO:Ljava/lang/Runnable;

.field private QP:Landroid/view/ContextMenu$ContextMenuInfo;

.field private QQ:Landroid/view/MenuItem$OnActionExpandListener;

.field private final QR:I

.field private QS:C

.field private QT:C

.field private QU:I

.field private QV:Lcom/miui/internal/view/menu/SubMenuBuilder;

.field private QW:Ljava/lang/CharSequence;

.field private QX:Ljava/lang/CharSequence;

.field private mMenu:Lcom/miui/internal/view/menu/MenuBuilder;


# direct methods
.method constructor <init>(Lcom/miui/internal/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V
    .registers 10

    .prologue
    const/4 v1, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QK:I

    .line 64
    const/16 v0, 0x10

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 72
    iput v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    .line 77
    iput-boolean v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QN:Z

    .line 122
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    .line 123
    iput p3, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QL:I

    .line 124
    iput p2, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QI:I

    .line 125
    iput p4, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QF:I

    .line 126
    iput p5, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QR:I

    .line 127
    iput-object p6, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QW:Ljava/lang/CharSequence;

    .line 128
    iput p7, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    .line 129
    return-void
.end method

.method static synthetic tJ(Lcom/miui/internal/view/menu/MenuItemImpl;)Lcom/miui/internal/view/menu/MenuBuilder;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    return-object v0
.end method


# virtual methods
.method public actionFormatChanged()V
    .registers 2

    .prologue
    .line 522
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->sA(Lcom/miui/internal/view/menu/MenuItemImpl;)V

    .line 523
    return-void
.end method

.method public collapseActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 658
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_1d

    .line 659
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QQ:Landroid/view/MenuItem$OnActionExpandListener;

    if-eqz v1, :cond_17

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QQ:Landroid/view/MenuItem$OnActionExpandListener;

    invoke-interface {v1, p0}, Landroid/view/MenuItem$OnActionExpandListener;->onMenuItemActionCollapse(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 660
    :cond_17
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->collapseItemActionView(Lcom/miui/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    .line 658
    :cond_1d
    :goto_1d
    return v0

    .line 659
    :cond_1e
    const/4 v0, 0x1

    goto :goto_1d
.end method

.method public expandActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 651
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_1d

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    if-eqz v1, :cond_1d

    .line 652
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QQ:Landroid/view/MenuItem$OnActionExpandListener;

    if-eqz v1, :cond_17

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QQ:Landroid/view/MenuItem$OnActionExpandListener;

    invoke-interface {v1, p0}, Landroid/view/MenuItem$OnActionExpandListener;->onMenuItemActionExpand(Landroid/view/MenuItem;)Z

    move-result v1

    .line 651
    if-eqz v1, :cond_1d

    .line 653
    :cond_17
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->expandItemActionView(Lcom/miui/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    .line 651
    :cond_1d
    return v0
.end method

.method public getActionProvider()Landroid/view/ActionProvider;
    .registers 3

    .prologue
    .line 613
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 614
    const-string/jumbo v1, "Implementation should use getSupportActionProvider!"

    .line 613
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getActionView()Landroid/view/View;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 595
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    if-eqz v0, :cond_8

    .line 596
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    return-object v0

    .line 597
    :cond_8
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    if-eqz v0, :cond_17

    .line 598
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    invoke-virtual {v0, p0}, Landroid/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    .line 599
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    return-object v0

    .line 601
    :cond_17
    return-object v1
.end method

.method public getAlphabeticShortcut()C
    .registers 2

    .prologue
    .line 223
    iget-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QS:C

    return v0
.end method

.method getCallback()Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QO:Ljava/lang/Runnable;

    return-object v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 183
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QI:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 4

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 385
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QJ:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 386
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QJ:Landroid/graphics/drawable/Drawable;

    return-object v0

    .line 389
    :cond_9
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QK:I

    if-eqz v0, :cond_1e

    .line 390
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QK:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 391
    iput v2, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QK:I

    .line 392
    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QJ:Landroid/graphics/drawable/Drawable;

    .line 393
    return-object v0

    .line 396
    :cond_1e
    return-object v1
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QM:Landroid/content/Intent;

    return-object v0
.end method

.method public getItemId()I
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 189
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QL:I

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 518
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QP:Landroid/view/ContextMenu$ContextMenuInfo;

    return-object v0
.end method

.method public getNumericShortcut()C
    .registers 2

    .prologue
    .line 241
    iget-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QT:C

    return v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 194
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QF:I

    return v0
.end method

.method public getOrdering()I
    .registers 2

    .prologue
    .line 198
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QR:I

    return v0
.end method

.method public getSubMenu()Landroid/view/SubMenu;
    .registers 2

    .prologue
    .line 321
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QV:Lcom/miui/internal/view/menu/SubMenuBuilder;

    return-object v0
.end method

.method public getSupportActionProvider()Landroid/view/ActionProvider;
    .registers 2

    .prologue
    .line 618
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 338
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QW:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QX:Ljava/lang/CharSequence;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QX:Ljava/lang/CharSequence;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QW:Ljava/lang/CharSequence;

    goto :goto_6
.end method

.method public hasCollapsibleActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 669
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    if-eqz v1, :cond_c

    const/4 v0, 0x1

    :cond_c
    return v0
.end method

.method public hasSubMenu()Z
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QV:Lcom/miui/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public invoke()Z
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 137
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QG:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v0, :cond_e

    .line 138
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QG:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v0, p0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    .line 137
    if-eqz v0, :cond_e

    .line 139
    return v2

    .line 142
    :cond_e
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/MenuBuilder;->getRootMenu()Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->dispatchMenuItemSelected(Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 143
    return v2

    .line 146
    :cond_1d
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QO:Ljava/lang/Runnable;

    if-eqz v0, :cond_27

    .line 147
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QO:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 148
    return v2

    .line 151
    :cond_27
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QM:Landroid/content/Intent;

    if-eqz v0, :cond_41

    .line 153
    :try_start_2b
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QM:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_36
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2b .. :try_end_36} :catch_37

    .line 154
    return v2

    .line 155
    :catch_37
    move-exception v0

    .line 156
    const-string/jumbo v1, "MenuItemImpl"

    const-string/jumbo v2, "Can\'t find activity to handle intent; ignoring"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 160
    :cond_41
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->onPerformDefaultAction()Z

    move-result v0

    :goto_4b
    return v0

    :cond_4c
    const/4 v0, 0x0

    goto :goto_4b
.end method

.method public isActionButton()Z
    .registers 3

    .prologue
    .line 533
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isActionViewExpanded()Z
    .registers 2

    .prologue
    .line 679
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QN:Z

    return v0
.end method

.method public isCheckable()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 421
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isChecked()Z
    .registers 3

    .prologue
    .line 445
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isEnabled()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 165
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_8

    const/4 v0, 0x1

    :cond_8
    return v0
.end method

.method public isExclusiveCheckable()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 440
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_8

    const/4 v0, 0x1

    :cond_8
    return v0
.end method

.method public isVisible()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 471
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    invoke-virtual {v1}, Landroid/view/ActionProvider;->overridesItemVisibility()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 472
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_19

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    invoke-virtual {v0}, Landroid/view/ActionProvider;->isVisible()Z

    move-result v0

    :cond_19
    return v0

    .line 474
    :cond_1a
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_21

    const/4 v0, 0x1

    :cond_21
    return v0
.end method

.method public requestsActionButton()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 537
    iget v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public requiresActionButton()Z
    .registers 3

    .prologue
    .line 541
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 607
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 608
    const-string/jumbo v1, "Implementation should use setSupportActionProvider!"

    .line 607
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActionView(I)Landroid/view/MenuItem;
    .registers 5

    .prologue
    .line 587
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 588
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 589
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-virtual {v1, p1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 590
    return-object p0
.end method

.method public setActionView(Landroid/view/View;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 576
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    .line 577
    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    .line 578
    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QL:I

    if-lez v0, :cond_17

    .line 579
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QL:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    .line 581
    :cond_17
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->sA(Lcom/miui/internal/view/menu/MenuItemImpl;)V

    .line 582
    return-object p0
.end method

.method public setActionViewExpanded(Z)V
    .registers 4

    .prologue
    .line 673
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QN:Z

    .line 674
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 675
    return-void
.end method

.method public setAlphabeticShortcut(C)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 228
    iget-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QS:C

    if-ne v0, p1, :cond_5

    .line 229
    return-object p0

    .line 232
    :cond_5
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QS:C

    .line 234
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 236
    return-object p0
.end method

.method public setCallback(Ljava/lang/Runnable;)Landroid/view/MenuItem;
    .registers 2

    .prologue
    .line 217
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QO:Ljava/lang/Runnable;

    .line 218
    return-object p0
.end method

.method public setCheckable(Z)Landroid/view/MenuItem;
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 426
    iget v2, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 427
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v3, v0, -0x2

    if-eqz p1, :cond_17

    const/4 v0, 0x1

    :goto_a
    or-int/2addr v0, v3

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 428
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    if-eq v2, v0, :cond_16

    .line 429
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 432
    :cond_16
    return-object p0

    :cond_17
    move v0, v1

    .line 427
    goto :goto_a
.end method

.method public setChecked(Z)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 450
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_c

    .line 453
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->sE(Landroid/view/MenuItem;)V

    .line 458
    :goto_b
    return-object p0

    .line 455
    :cond_c
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tD(Z)V

    goto :goto_b
.end method

.method public setEnabled(Z)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 170
    if-eqz p1, :cond_f

    .line 171
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 176
    :goto_8
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 178
    return-object p0

    .line 173
    :cond_f
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    goto :goto_8
.end method

.method public setExclusiveCheckable(Z)V
    .registers 4

    .prologue
    .line 436
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v1, v0, -0x5

    if-eqz p1, :cond_b

    const/4 v0, 0x4

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 437
    return-void

    .line 436
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIcon(I)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 410
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QJ:Landroid/graphics/drawable/Drawable;

    .line 411
    iput p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QK:I

    .line 414
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 416
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 401
    iput v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QK:I

    .line 402
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QJ:Landroid/graphics/drawable/Drawable;

    .line 403
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 405
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;
    .registers 2

    .prologue
    .line 208
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QM:Landroid/content/Intent;

    .line 209
    return-object p0
.end method

.method public setIsActionButton(Z)V
    .registers 3

    .prologue
    .line 545
    if-eqz p1, :cond_9

    .line 546
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 550
    :goto_8
    return-void

    .line 548
    :cond_9
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    goto :goto_8
.end method

.method public setNumericShortcut(C)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 246
    iget-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QT:C

    if-ne v0, p1, :cond_5

    .line 247
    return-object p0

    .line 250
    :cond_5
    iput-char p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QT:C

    .line 252
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 254
    return-object p0
.end method

.method public setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 684
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Implementation should use setSupportOnActionExpandListener!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    .registers 2

    .prologue
    .line 503
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QG:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 504
    return-object p0
.end method

.method public setShortcut(CC)Landroid/view/MenuItem;
    .registers 5

    .prologue
    .line 259
    iput-char p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QT:C

    .line 260
    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QS:C

    .line 262
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 264
    return-object p0
.end method

.method public setShowAsAction(I)V
    .registers 4

    .prologue
    .line 558
    and-int/lit8 v0, p1, 0x3

    packed-switch v0, :pswitch_data_16

    .line 567
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 570
    :pswitch_e
    iput p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    .line 571
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->sA(Lcom/miui/internal/view/menu/MenuItemImpl;)V

    .line 572
    return-void

    .line 558
    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
        :pswitch_e
        :pswitch_e
    .end packed-switch
.end method

.method public setShowAsActionFlags(I)Landroid/view/MenuItem;
    .registers 2

    .prologue
    .line 645
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->setShowAsAction(I)V

    .line 646
    return-object p0
.end method

.method public setSupportActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 622
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    if-ne v0, p1, :cond_6

    .line 623
    return-object p0

    .line 626
    :cond_6
    iput-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QE:Landroid/view/View;

    .line 627
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    if-eqz v0, :cond_11

    .line 628
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    invoke-virtual {v0, v1}, Landroid/view/ActionProvider;->setVisibilityListener(Landroid/view/ActionProvider$VisibilityListener;)V

    .line 630
    :cond_11
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QD:Landroid/view/ActionProvider;

    .line 631
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 632
    if-eqz p1, :cond_23

    .line 633
    new-instance v0, Lcom/miui/internal/view/menu/MenuItemImpl$1;

    invoke-direct {v0, p0}, Lcom/miui/internal/view/menu/MenuItemImpl$1;-><init>(Lcom/miui/internal/view/menu/MenuItemImpl;)V

    invoke-virtual {p1, v0}, Landroid/view/ActionProvider;->setVisibilityListener(Landroid/view/ActionProvider$VisibilityListener;)V

    .line 640
    :cond_23
    return-object p0
.end method

.method public setSupportOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .registers 2

    .prologue
    .line 664
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QQ:Landroid/view/MenuItem$OnActionExpandListener;

    .line 665
    return-object p0
.end method

.method public setTitle(I)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 368
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 355
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QW:Ljava/lang/CharSequence;

    .line 357
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 359
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QV:Lcom/miui/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_11

    .line 360
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QV:Lcom/miui/internal/view/menu/SubMenuBuilder;

    invoke-virtual {v0, p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 363
    :cond_11
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4

    .prologue
    .line 378
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QX:Ljava/lang/CharSequence;

    .line 379
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 380
    return-object p0
.end method

.method public setVisible(Z)Landroid/view/MenuItem;
    .registers 3

    .prologue
    .line 496
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->tE(Z)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/MenuBuilder;->sB(Lcom/miui/internal/view/menu/MenuItemImpl;)V

    .line 498
    :cond_b
    return-object p0
.end method

.method public shouldShowIcon()Z
    .registers 2

    .prologue
    .line 529
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->sy()Z

    move-result v0

    return v0
.end method

.method public showsTextAsAction()Z
    .registers 3

    .prologue
    .line 553
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QU:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method tB(Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 2

    .prologue
    .line 513
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QP:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 514
    return-void
.end method

.method tC(Lcom/miui/internal/view/menu/SubMenuBuilder;)V
    .registers 3

    .prologue
    .line 330
    iput-object p1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QV:Lcom/miui/internal/view/menu/SubMenuBuilder;

    .line 332
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 333
    return-void
.end method

.method tD(Z)V
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 462
    iget v2, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 463
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v3, v0, -0x3

    if-eqz p1, :cond_17

    const/4 v0, 0x2

    :goto_a
    or-int/2addr v0, v3

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 464
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    if-eq v2, v0, :cond_16

    .line 465
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 467
    :cond_16
    return-void

    :cond_17
    move v0, v1

    .line 463
    goto :goto_a
.end method

.method tE(Z)Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 486
    iget v2, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 487
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    and-int/lit8 v3, v0, -0x9

    if-eqz p1, :cond_13

    move v0, v1

    :goto_a
    or-int/2addr v0, v3

    iput v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    .line 488
    iget v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QH:I

    if-eq v2, v0, :cond_12

    const/4 v1, 0x1

    :cond_12
    return v1

    .line 487
    :cond_13
    const/16 v0, 0x8

    goto :goto_a
.end method

.method tF(Lcom/miui/internal/view/menu/MenuView$ItemView;)Ljava/lang/CharSequence;
    .registers 3

    .prologue
    .line 348
    if-eqz p1, :cond_d

    invoke-interface {p1}, Lcom/miui/internal/view/menu/MenuView$ItemView;->prefersCondensedTitle()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 349
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getTitleCondensed()Ljava/lang/CharSequence;

    move-result-object v0

    .line 348
    :goto_c
    return-object v0

    .line 350
    :cond_d
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_c
.end method

.method tG()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 316
    iget-object v1, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Lcom/miui/internal/view/menu/MenuBuilder;->isShortcutsVisible()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuItemImpl;->tH()C

    move-result v1

    if-eqz v1, :cond_10

    const/4 v0, 0x1

    :cond_10
    return v0
.end method

.method tH()C
    .registers 2

    .prologue
    .line 272
    iget-char v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QS:C

    return v0
.end method

.method tI()Ljava/lang/String;
    .registers 4

    .prologue
    .line 282
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/MenuItemImpl;->tH()C

    move-result v0

    .line 283
    if-nez v0, :cond_a

    .line 284
    const-string/jumbo v0, ""

    return-object v0

    .line 287
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/miui/internal/view/menu/MenuItemImpl;->Ra:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    sparse-switch v0, :sswitch_data_2e

    .line 303
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 307
    :goto_17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 291
    :sswitch_1c
    sget-object v0, Lcom/miui/internal/view/menu/MenuItemImpl;->QZ:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17

    .line 295
    :sswitch_22
    sget-object v0, Lcom/miui/internal/view/menu/MenuItemImpl;->QY:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17

    .line 299
    :sswitch_28
    sget-object v0, Lcom/miui/internal/view/menu/MenuItemImpl;->Rb:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17

    .line 288
    :sswitch_data_2e
    .sparse-switch
        0x8 -> :sswitch_22
        0xa -> :sswitch_1c
        0x20 -> :sswitch_28
    .end sparse-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 509
    iget-object v0, p0, Lcom/miui/internal/view/menu/MenuItemImpl;->QW:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
