.class Lcom/miui/internal/app/AlertControllerImpl$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/internal/app/AlertControllerImpl;->zf()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic afZ:Lcom/miui/internal/app/AlertControllerImpl;

.field final synthetic aga:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/miui/internal/app/AlertControllerImpl;Landroid/widget/Button;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl$6;->afZ:Lcom/miui/internal/app/AlertControllerImpl;

    iput-object p2, p0, Lcom/miui/internal/app/AlertControllerImpl$6;->aga:Landroid/widget/Button;

    .line 660
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .prologue
    .line 663
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl$6;->afZ:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v0}, Lcom/miui/internal/app/AlertControllerImpl;->zq(Lcom/miui/internal/app/AlertControllerImpl;)Lmiui/widget/EditableListViewWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/widget/EditableListViewWrapper;->isAllItemsChecked()Z

    move-result v0

    .line 664
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$6;->afZ:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zq(Lcom/miui/internal/app/AlertControllerImpl;)Lmiui/widget/EditableListViewWrapper;

    move-result-object v1

    xor-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Lmiui/widget/EditableListViewWrapper;->setAllItemsChecked(Z)V

    .line 665
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$6;->aga:Landroid/widget/Button;

    if-eqz v0, :cond_1f

    sget v0, Lmiui/R$string;->select_all:I

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(I)V

    .line 667
    return-void

    .line 666
    :cond_1f
    sget v0, Lmiui/R$string;->deselect_all:I

    goto :goto_1b
.end method
