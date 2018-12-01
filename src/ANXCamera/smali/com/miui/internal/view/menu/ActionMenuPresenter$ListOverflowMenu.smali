.class Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ListOverflowMenu"
.end annotation


# instance fields
.field private Pt:Lcom/miui/internal/view/menu/ListMenuPresenter;

.field final synthetic Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;


# direct methods
.method private constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;)V
    .registers 2

    .prologue
    .line 546
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;)V

    return-void
.end method

.method private ti(Lcom/miui/internal/view/menu/MenuBuilder;)Lcom/miui/internal/view/menu/ListMenuPresenter;
    .registers 6

    .prologue
    .line 551
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pt:Lcom/miui/internal/view/menu/ListMenuPresenter;

    if-nez v0, :cond_1b

    .line 552
    new-instance v0, Lcom/miui/internal/view/menu/ListMenuPresenter;

    iget-object v1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v1, v1, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-static {v2}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->ta(Lcom/miui/internal/view/menu/ActionMenuPresenter;)I

    move-result v2

    iget-object v3, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-static {v3}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->sZ(Lcom/miui/internal/view/menu/ActionMenuPresenter;)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/internal/view/menu/ListMenuPresenter;-><init>(Landroid/content/Context;II)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pt:Lcom/miui/internal/view/menu/ListMenuPresenter;

    .line 554
    :cond_1b
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pt:Lcom/miui/internal/view/menu/ListMenuPresenter;

    invoke-virtual {p1, v0}, Lcom/miui/internal/view/menu/MenuBuilder;->addMenuPresenter(Lcom/miui/internal/view/menu/MenuPresenter;)V

    .line 555
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pt:Lcom/miui/internal/view/menu/ListMenuPresenter;

    return-object v0
.end method


# virtual methods
.method public dismiss(Z)V
    .registers 3

    .prologue
    .line 575
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->hideOverflowMenu()Z

    .line 576
    return-void
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 570
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    return v0
.end method

.method public th(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 4

    .prologue
    .line 580
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->tj(Lcom/miui/internal/view/menu/MenuBuilder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setOverflowMenuView(Landroid/view/View;)V

    .line 581
    return-void
.end method

.method public tj(Lcom/miui/internal/view/menu/MenuBuilder;)Landroid/view/View;
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 559
    if-eqz p1, :cond_1d

    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1d

    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->ti(Lcom/miui/internal/view/menu/MenuBuilder;)Lcom/miui/internal/view/menu/ListMenuPresenter;

    move-result-object v1

    .line 560
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    .line 559
    invoke-virtual {v1, v0}, Lcom/miui/internal/view/menu/ListMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Lcom/miui/internal/view/menu/MenuView;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :cond_1d
    return-object v0
.end method

.method public tryShow()Z
    .registers 2

    .prologue
    .line 565
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ListOverflowMenu;->Pu:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/internal/view/menu/MenuView;

    check-cast v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->showOverflowMenu()Z

    move-result v0

    return v0
.end method
