.class Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/miui/internal/view/menu/MenuPresenter$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupPresenterCallback"
.end annotation


# instance fields
.field final synthetic Px:Lcom/miui/internal/view/menu/ActionMenuPresenter;


# direct methods
.method private constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;)V
    .registers 2

    .prologue
    .line 628
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;->Px:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;-><init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;)V

    return-void
.end method


# virtual methods
.method public onCloseMenu(Lcom/miui/internal/view/menu/MenuBuilder;Z)V
    .registers 5

    .prologue
    .line 642
    instance-of v0, p1, Lcom/miui/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_c

    .line 643
    invoke-virtual {p1}, Lcom/miui/internal/view/menu/MenuBuilder;->getRootMenu()Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/MenuBuilder;->sq(Z)V

    .line 645
    :cond_c
    return-void
.end method

.method public onOpenSubMenu(Lcom/miui/internal/view/menu/MenuBuilder;)Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 632
    if-nez p1, :cond_4

    .line 633
    return v2

    .line 636
    :cond_4
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;->Px:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    check-cast p1, Lcom/miui/internal/view/menu/SubMenuBuilder;

    invoke-virtual {p1}, Lcom/miui/internal/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    iput v1, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pe:I

    .line 637
    return v2
.end method
