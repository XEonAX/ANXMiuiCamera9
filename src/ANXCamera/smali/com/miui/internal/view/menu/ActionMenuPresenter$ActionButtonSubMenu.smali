.class Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;
.super Lcom/miui/internal/view/menu/MenuDialogHelper;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionButtonSubMenu"
.end annotation


# instance fields
.field final synthetic Pw:Lcom/miui/internal/view/menu/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/SubMenuBuilder;)V
    .registers 4

    .prologue
    .line 615
    iput-object p1, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;->Pw:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    .line 616
    invoke-direct {p0, p2}, Lcom/miui/internal/view/menu/MenuDialogHelper;-><init>(Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 617
    iget-object v0, p1, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pj:Lcom/miui/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    invoke-virtual {p1, v0}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->setCallback(Lcom/miui/internal/view/menu/MenuPresenter$Callback;)V

    .line 618
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4

    .prologue
    .line 622
    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/MenuDialogHelper;->onDismiss(Landroid/content/DialogInterface;)V

    .line 623
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;->Pw:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/internal/view/menu/ActionMenuPresenter;->td(Lcom/miui/internal/view/menu/ActionMenuPresenter;Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;)Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    .line 624
    iget-object v0, p0, Lcom/miui/internal/view/menu/ActionMenuPresenter$ActionButtonSubMenu;->Pw:Lcom/miui/internal/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    iput v1, v0, Lcom/miui/internal/view/menu/ActionMenuPresenter;->Pe:I

    .line 625
    return-void
.end method
