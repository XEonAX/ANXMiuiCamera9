.class public Lcom/miui/internal/view/menu/ActionMenuPresenter;
.super Lcom/miui/internal/view/menu/BaseMenuPresenter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;,
        Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;
    }
.end annotation


# instance fields
.field private final OV:Landroid/util/SparseBooleanArray;

.field private OW:Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

.field private OX:I

.field private OY:Z

.field private OZ:I

.field private Pa:I

.field private Pb:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

.field private Pc:I

.field private Pd:Z

.field Pe:I

.field private Pf:Landroid/view/View;

.field private Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

.field private Ph:I

.field private Pi:Lcom/miui/internal/view/menu/MenuItemImpl;

.field final Pj:Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;

.field private Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

.field private Pl:Z

.field private Pm:Z

.field private Pn:Landroid/view/View;

.field private Po:Z

.field private Pp:I

.field private Pq:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 10

    .prologue
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    .line 68
    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/ActionMenuPresenter;-><init>(Landroid/content/Context;IIII)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIII)V
    .registers 8

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/internal/view/menu/BaseMenuPresenter;-><init>(Landroid/content/Context;II)V

    .line 47
    const v0, 0x10102f6

    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Ph:I

    .line 50
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OV:Landroid/util/SparseBooleanArray;

    .line 64
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pj:Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    .line 74
    iput p4, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pa:I

    .line 75
    iput p5, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OZ:I

    .line 76
    return-void
.end method

.method private sW(Landroid/view/MenuItem;)Landroid/view/View;
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 262
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    .line 263
    if-nez v0, :cond_8

    .line 264
    return-object v5

    .line 267
    :cond_8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    .line 268
    const/4 v1, 0x0

    move v3, v1

    :goto_e
    if-ge v3, v4, :cond_26

    .line 269
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 270
    instance-of v1, v2, Lcom/miui/internal/view/menu/MenuView$ItemView;

    if-eqz v1, :cond_22

    move-object v1, v2

    .line 271
    check-cast v1, Lcom/miui/internal/view/menu/MenuView$ItemView;

    invoke-interface {v1}, Lcom/miui/internal/view/menu/MenuView$ItemView;->getItemData()Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v1

    if-ne v1, p1, :cond_22

    .line 272
    return-object v2

    .line 268
    :cond_22
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_e

    .line 275
    :cond_26
    return-object v5
.end method

.method private sX()Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 303
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->IS_TABLET:Z

    if-eqz v0, :cond_13

    .line 304
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;

    iget-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    iget-object v4, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    const/4 v5, 0x1

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/View;Z)V

    return-object v0

    .line 306
    :cond_13
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pb:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    if-nez v0, :cond_1e

    .line 307
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;

    invoke-direct {v0, p0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pb:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    .line 309
    :cond_1e
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pb:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    return-object v0
.end method

.method private sY()Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 9

    .prologue
    const/4 v2, 0x0

    .line 314
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pi:Lcom/miui/internal/view/menu/MenuItemImpl;

    if-nez v0, :cond_1b

    .line 315
    new-instance v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    sget v3, Lcom/miui/internal/R$id;->more:I

    .line 316
    iget-object v4, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    sget v5, Lcom/miui/internal/R$string;->more:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    move v4, v2

    move v5, v2

    move v7, v2

    .line 315
    invoke-direct/range {v0 .. v7}, Lcom/miui/internal/view/menu/MenuItemImpl;-><init>(Lcom/miui/internal/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pi:Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 318
    :cond_1b
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pi:Lcom/miui/internal/view/menu/MenuItemImpl;

    return-object v0
.end method

.method static synthetic sZ(Lcom/miui/internal/view/menu/ActionMenuPresenter;)I
    .registers 2

    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OZ:I

    return v0
.end method

.method static synthetic ta(Lcom/miui/internal/view/menu/ActionMenuPresenter;)I
    .registers 2

    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pa:I

    return v0
.end method

.method static synthetic tb(Lcom/miui/internal/view/menu/ActionMenuPresenter;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    return-object v0
.end method

.method static synthetic tc(Lcom/miui/internal/view/menu/ActionMenuPresenter;)I
    .registers 2

    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Ph:I

    return v0
.end method

.method static synthetic td(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;)Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;
    .registers 2

    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OW:Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    return-object p1
.end method

.method static synthetic te(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;)Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;
    .registers 2

    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    return-object p1
.end method

.method static synthetic tf(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;)Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;
    .registers 2

    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    return-object p1
.end method

.method static synthetic tg(Lcom/miui/internal/view/menu/ActionMenuPresenter;)Lcom/miui/internal/view/menu/MenuItemImpl;
    .registers 2

    invoke-direct {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->sY()Lcom/miui/internal/view/menu/MenuItemImpl;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bindItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Lcom/miui/internal/view/menu/MenuView$ItemView;)V
    .registers 4

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-interface {p2, p1, v0}, Lcom/miui/internal/view/menu/MenuView$ItemView;->initialize(Lcom/miui/internal/view/menu/MenuItemImpl;I)V

    .line 181
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;

    invoke-interface {p2, v0}, Lcom/miui/internal/view/menu/MenuView$ItemView;->setItemInvoker(Lcom/miui/internal/view/menu/MenuBuilder$ItemInvoker;)V

    .line 182
    return-void
.end method

.method protected createOverflowMenuButton(Landroid/content/Context;)Landroid/view/View;
    .registers 3

    .prologue
    .line 667
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;

    invoke-direct {v0, p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenuButton;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Landroid/content/Context;)V

    return-object v0
.end method

.method public dismissPopupMenus(Z)Z
    .registers 3

    .prologue
    .line 351
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    move-result v0

    return v0
.end method

.method public flagActionItems()Z
    .registers 9

    .prologue
    const/4 v2, 0x1

    const/4 v5, 0x0

    .line 382
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v6

    .line 383
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 385
    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pc:I

    if-ge v0, v7, :cond_35

    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pc:I

    add-int/lit8 v0, v0, -0x1

    :goto_14
    move v4, v5

    move v3, v0

    .line 387
    :goto_16
    if-ge v4, v7, :cond_38

    if-lez v3, :cond_38

    .line 388
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 389
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->requestsActionButton()Z

    move-result v1

    if-nez v1, :cond_48

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->requiresActionButton()Z

    move-result v1

    .line 390
    :goto_2a
    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    .line 391
    if-eqz v1, :cond_4b

    .line 392
    add-int/lit8 v0, v3, -0x1

    .line 394
    :goto_31
    add-int/lit8 v4, v4, 0x1

    move v3, v0

    goto :goto_16

    .line 385
    :cond_35
    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pc:I

    goto :goto_14

    :cond_38
    move v1, v4

    .line 397
    :goto_39
    if-ge v1, v7, :cond_4a

    .line 398
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    .line 399
    invoke-virtual {v0, v5}, Lcom/miui/internal/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    .line 400
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_39

    :cond_48
    move v1, v2

    .line 389
    goto :goto_2a

    .line 402
    :cond_4a
    return v2

    :cond_4b
    move v0, v3

    goto :goto_31
.end method

.method public getItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    .prologue
    const/4 v0, 0x0

    .line 161
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object v1

    .line 162
    if-eqz v1, :cond_d

    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->hasCollapsibleActionView()Z

    move-result v2

    if-eqz v2, :cond_37

    .line 163
    :cond_d
    instance-of v1, p2, Lcom/miui/internal/view/menu/ActionMenuItemView;

    if-nez v1, :cond_12

    move-object p2, v0

    .line 166
    :cond_12
    invoke-super {p0, p1, p2, p3}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->getItemView(Lcom/miui/internal/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 168
    :goto_16
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result v1

    if-eqz v1, :cond_35

    const/16 v1, 0x8

    :goto_1e
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 170
    check-cast p3, Lcom/miui/internal/view/menu/ActionMenuView;

    .line 171
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 172
    invoke-virtual {p3, v1}, Lcom/miui/internal/view/menu/ActionMenuView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v2

    if-nez v2, :cond_34

    .line 173
    invoke-virtual {p3, v1}, Lcom/miui/internal/view/menu/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    :cond_34
    return-object v0

    .line 168
    :cond_35
    const/4 v1, 0x0

    goto :goto_1e

    :cond_37
    move-object v0, v1

    goto :goto_16
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Lcom/miui/internal/view/menu/MenuView;
    .registers 4

    .prologue
    .line 154
    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Lcom/miui/internal/view/menu/MenuView;

    move-result-object v1

    move-object v0, v1

    .line 155
    check-cast v0, Lcom/miui/internal/view/menu/ActionMenuView;

    invoke-virtual {v0, p0}, Lcom/miui/internal/view/menu/ActionMenuView;->setPresenter(Lcom/miui/internal/view/menu/ActionMenuPresenter;)V

    .line 156
    return-object v1
.end method

.method public hideOverflowMenu(Z)Z
    .registers 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 327
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    if-eqz v0, :cond_1c

    .line 328
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 329
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 330
    iput-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    .line 331
    const/4 v0, 0x1

    return v0

    .line 334
    :cond_1c
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    if-eqz v0, :cond_33

    .line 335
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    invoke-interface {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;->isShowing()Z

    move-result v0

    .line 336
    if-eqz v0, :cond_2d

    .line 337
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 339
    :cond_2d
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    invoke-interface {v1, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;->dismiss(Z)V

    .line 340
    return v0

    .line 342
    :cond_33
    return v3
.end method

.method public hideSubMenus()Z
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OW:Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    if-eqz v0, :cond_b

    .line 361
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OW:Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;->dismiss()V

    .line 362
    const/4 v0, 0x1

    return v0

    .line 364
    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public initForMenu(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 80
    invoke-super {p0, p1, p2}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->initForMenu(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 82
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 84
    invoke-static {p1}, Lcom/miui/internal/view/ActionBarPolicy;->get(Landroid/content/Context;)Lcom/miui/internal/view/ActionBarPolicy;

    move-result-object v0

    .line 85
    iget-boolean v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pm:Z

    if-nez v1, :cond_16

    .line 86
    invoke-virtual {v0}, Lcom/miui/internal/view/ActionBarPolicy;->showsOverflowMenuButton()Z

    move-result v1

    iput-boolean v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    .line 89
    :cond_16
    iget-boolean v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pq:Z

    if-nez v1, :cond_20

    .line 90
    invoke-virtual {v0}, Lcom/miui/internal/view/ActionBarPolicy;->getEmbeddedMenuWidthLimit()I

    move-result v1

    iput v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pp:I

    .line 94
    :cond_20
    iget-boolean v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pd:Z

    if-nez v1, :cond_2a

    .line 95
    invoke-virtual {v0}, Lcom/miui/internal/view/ActionBarPolicy;->getMaxActionButtons()I

    move-result v0

    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pc:I

    .line 98
    :cond_2a
    iget v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pp:I

    .line 99
    iget-boolean v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    if-eqz v1, :cond_51

    .line 100
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    if-nez v1, :cond_45

    .line 101
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->createOverflowMenuButton(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    .line 102
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 103
    iget-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v2, v1, v1}, Landroid/view/View;->measure(II)V

    .line 105
    :cond_45
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    sub-int/2addr v0, v1

    .line 110
    :goto_4c
    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OX:I

    .line 113
    iput-object v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pn:Landroid/view/View;

    .line 114
    return-void

    .line 107
    :cond_51
    iput-object v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    goto :goto_4c
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    .prologue
    .line 371
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pg:Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    invoke-interface {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;->isShowing()Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isOverflowReserved()Z
    .registers 2

    .prologue
    .line 378
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    return v0
.end method

.method public onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V
    .registers 4

    .prologue
    .line 407
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->dismissPopupMenus(Z)Z

    .line 408
    invoke-super {p0, p1, p2}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V

    .line 409
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    .prologue
    .line 117
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pd:Z

    if-nez v0, :cond_12

    .line 118
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 119
    sget v1, Lcom/miui/internal/R$integer;->abc_max_action_buttons:I

    .line 118
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pc:I

    .line 121
    :cond_12
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_1c

    .line 122
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sC(Z)V

    .line 124
    :cond_1c
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    .prologue
    .line 420
    check-cast p1, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;

    .line 421
    iget v0, p1, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;->Pr:I

    if-lez v0, :cond_19

    .line 422
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    iget v1, p1, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;->Pr:I

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 423
    if-eqz v0, :cond_19

    .line 424
    invoke-interface {v0}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/SubMenuBuilder;

    .line 425
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z

    .line 428
    :cond_19
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .prologue
    .line 413
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;

    invoke-direct {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;-><init>()V

    .line 414
    iget v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pe:I

    iput v1, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$SavedState;->Pr:I

    .line 415
    return-object v0
.end method

.method public onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z
    .registers 7

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 238
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;->hasVisibleItems()Z

    move-result v0

    if-nez v0, :cond_9

    .line 239
    return v4

    :cond_9
    move-object v0, p1

    .line 243
    :goto_a
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/SubMenuBuilder;->getParentMenu()Landroid/view/Menu;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-eq v1, v2, :cond_19

    .line 244
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/SubMenuBuilder;->getParentMenu()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/SubMenuBuilder;

    goto :goto_a

    .line 246
    :cond_19
    invoke-virtual {v0}, Lcom/miui/internal/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->sW(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    .line 247
    if-nez v0, :cond_2a

    .line 248
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    if-nez v0, :cond_28

    .line 249
    return v4

    .line 251
    :cond_28
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    .line 254
    :cond_2a
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pe:I

    .line 255
    new-instance v0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    invoke-direct {v0, p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/SubMenuBuilder;)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OW:Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    .line 256
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OW:Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    invoke-virtual {v0, v3}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;->show(Landroid/os/IBinder;)V

    .line 257
    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z

    .line 258
    const/4 v0, 0x1

    return v0
.end method

.method public onSubUiVisibilityChanged(Z)V
    .registers 4

    .prologue
    .line 431
    if-eqz p1, :cond_7

    .line 433
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z

    .line 437
    :goto_6
    return-void

    .line 435
    :cond_7
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    goto :goto_6
.end method

.method public setActionEditMode(Z)V
    .registers 3

    .prologue
    .line 147
    if-eqz p1, :cond_6

    .line 148
    sget v0, Lcom/miui/internal/R$attr;->actionModeOverflowButtonStyle:I

    iput v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Ph:I

    .line 150
    :cond_6
    return-void
.end method

.method public setExpandedActionViewsExclusive(Z)V
    .registers 2

    .prologue
    .line 143
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->OY:Z

    .line 144
    return-void
.end method

.method public setItemLimit(I)V
    .registers 3

    .prologue
    .line 138
    iput p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pc:I

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pd:Z

    .line 140
    return-void
.end method

.method public setReserveOverflow(Z)V
    .registers 3

    .prologue
    .line 133
    iput-boolean p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    .line 134
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pm:Z

    .line 135
    return-void
.end method

.method public setWidthLimit(IZ)V
    .registers 4

    .prologue
    .line 127
    iput p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pp:I

    .line 128
    iput-boolean p2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Po:Z

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pq:Z

    .line 130
    return-void
.end method

.method public shouldIncludeItem(ILcom/miui/internal/view/menu/MenuItemImpl;)Z
    .registers 4

    .prologue
    .line 186
    invoke-virtual {p2}, Lcom/miui/internal/view/menu/MenuItemImpl;->isActionButton()Z

    move-result v0

    return v0
.end method

.method public showOverflowMenu()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 284
    iget-boolean v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    if-eqz v0, :cond_37

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_37

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_37

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    if-eqz v0, :cond_37

    .line 285
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    if-nez v0, :cond_37

    .line 286
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->sX()Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    move-result-object v0

    .line 287
    new-instance v1, Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-direct {v1, p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;)V

    iput-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    .line 289
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pk:Lcom/miui/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 293
    invoke-super {p0, v2}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->onSubMenuSelected(Lcom/miui/internal/view/menu/SubMenuBuilder;)Z

    .line 295
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 297
    return v3

    .line 299
    :cond_37
    const/4 v0, 0x0

    return v0
.end method

.method public updateMenuView(Z)V
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v0, 0x0

    .line 191
    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/BaseMenuPresenter;->updateMenuView(Z)V

    .line 193
    iget-object v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    if-nez v3, :cond_b

    .line 194
    return-void

    .line 197
    :cond_b
    iget-object v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    if-eqz v3, :cond_15

    .line 198
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v0

    .line 201
    :cond_15
    iget-boolean v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    if-eqz v3, :cond_72

    if-eqz v0, :cond_72

    .line 202
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 203
    if-ne v3, v1, :cond_74

    .line 204
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 210
    :goto_2d
    if-eqz v0, :cond_81

    .line 211
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    if-nez v0, :cond_7a

    .line 212
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->createOverflowMenuButton(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    .line 217
    :goto_3b
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 218
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    if-eq v0, v1, :cond_5b

    .line 219
    if-eqz v0, :cond_4e

    .line 220
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 222
    :cond_4e
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/ActionMenuView;

    .line 223
    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/ActionMenuView;->generateOverflowButtonLayoutParams()Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/view/menu/ActionMenuView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 229
    :cond_5b
    :goto_5b
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/ActionMenuView;

    iget-boolean v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pl:Z

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/ActionMenuView;->setOverflowReserved(Z)V

    .line 232
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->IS_TABLET:Z

    if-nez v0, :cond_71

    .line 233
    invoke-direct {p0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->sX()Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-interface {v0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;->th(Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 235
    :cond_71
    return-void

    :cond_72
    move v0, v2

    .line 201
    goto :goto_2d

    .line 206
    :cond_74
    if-lez v3, :cond_78

    move v0, v1

    goto :goto_2d

    :cond_78
    move v0, v2

    goto :goto_2d

    .line 215
    :cond_7a
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_3b

    .line 225
    :cond_81
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    if-eqz v0, :cond_5b

    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    if-ne v0, v1, :cond_5b

    .line 226
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pf:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_5b
.end method
