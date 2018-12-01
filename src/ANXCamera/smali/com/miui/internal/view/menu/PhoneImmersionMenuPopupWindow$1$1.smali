.class Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

.field final synthetic Rn:Landroid/view/SubMenu;


# direct methods
.method constructor <init>(Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;Landroid/view/SubMenu;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

    iput-object p2, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rn:Landroid/view/SubMenu;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onDismiss()V
    .registers 4

    .prologue
    .line 46
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

    iget-object v0, v0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;->Rl:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 47
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

    iget-object v0, v0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;->Rl:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rn:Landroid/view/SubMenu;

    invoke-virtual {v0, v1}, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;->update(Landroid/view/Menu;)V

    .line 48
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

    iget-object v0, v0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;->Rl:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

    iget-object v1, v1, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;->Rl:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;

    invoke-static {v1}, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;->tM(Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1$1;->Rm:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;

    iget-object v2, v2, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow$1;->Rl:Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;

    invoke-static {v2}, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;->tN(Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;)Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/internal/view/menu/PhoneImmersionMenuPopupWindow;->fastShow(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 49
    return-void
.end method
