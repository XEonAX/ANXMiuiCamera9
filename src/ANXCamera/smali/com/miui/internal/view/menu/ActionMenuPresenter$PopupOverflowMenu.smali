.class Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;
.super Lcom/miui/internal/view/menu/MenuPopupHelper;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupOverflowMenu"
.end annotation


# instance fields
.field final synthetic Pv:Lcom/miui/internal/view/menu/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/View;Z)V
    .registers 7

    .prologue
    .line 586
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->Pv:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    .line 588
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/miui/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Lcom/miui/internal/view/menu/MenuBuilder;Landroid/view/View;Z)V

    .line 589
    iget-object v0, p1, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pj:Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->setCallback(Lcom/miui/internal/view/menu/MenuPresenter$Callback;)V

    .line 590
    sget v0, Lcom/miui/internal/R$layout;->overflow_popup_menu_item_layout:I

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->setMenuItemLayout(I)V

    .line 591
    return-void
.end method


# virtual methods
.method public dismiss(Z)V
    .registers 4

    .prologue
    .line 606
    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/MenuPopupHelper;->dismiss(Z)V

    .line 607
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->Pv:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-static {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->tb(Lcom/miui/internal/view/menu/ActionMenuPresenter;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 608
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->Pv:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-static {v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->tb(Lcom/miui/internal/view/menu/ActionMenuPresenter;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 610
    :cond_15
    return-void
.end method

.method public onDismiss()V
    .registers 3

    .prologue
    .line 595
    invoke-super {p0}, Lcom/miui/internal/view/menu/MenuPopupHelper;->onDismiss()V

    .line 596
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->Pv:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/internal/view/menu/MenuBuilder;->close()V

    .line 597
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupOverflowMenu;->Pv:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->te(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;)Lcom/miui/internal/view/menu/ActionMenuPresenter$OverflowMenu;

    .line 598
    return-void
.end method

.method public th(Lcom/miui/internal/view/menu/MenuBuilder;)V
    .registers 2

    .prologue
    .line 602
    return-void
.end method
