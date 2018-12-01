.class Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

.field final synthetic Rj:Landroid/view/SubMenu;


# direct methods
.method constructor <init>(Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;Landroid/view/SubMenu;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

    iput-object p2, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Rj:Landroid/view/SubMenu;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onDismiss()V
    .registers 4

    .prologue
    .line 44
    iget-object v0, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

    iget-object v0, v0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;->Rh:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 45
    iget-object v0, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

    iget-object v0, v0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;->Rh:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Rj:Landroid/view/SubMenu;

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;->update(Landroid/view/Menu;)V

    .line 46
    iget-object v0, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

    iget-object v0, v0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;->Rh:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

    iget-object v1, v1, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;->Rh:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;

    invoke-static {v1}, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;->sK(Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1$1;->Ri:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;

    iget-object v2, v2, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow$1;->Rh:Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;

    invoke-static {v2}, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;->sL(Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;)Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/view/menu/PadImmersionMenuPopupWindow;->fastShow(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 47
    return-void
.end method
