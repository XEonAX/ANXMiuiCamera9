.class Lcom/miui/internal/app/AlertControllerImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/app/AlertControllerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic afU:Lcom/miui/internal/app/AlertControllerImpl;


# direct methods
.method constructor <init>(Lcom/miui/internal/app/AlertControllerImpl;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 138
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zm(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_35

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zn(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;

    move-result-object v1

    if-eqz v1, :cond_35

    .line 139
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v0}, Lcom/miui/internal/app/AlertControllerImpl;->zn(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object v0

    .line 145
    :cond_1b
    :goto_1b
    if-eqz v0, :cond_20

    .line 146
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 150
    :cond_20
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v0}, Lcom/miui/internal/app/AlertControllerImpl;->zr(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zp(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/content/DialogInterface;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 152
    return-void

    .line 140
    :cond_35
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zi(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_50

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zj(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;

    move-result-object v1

    if-eqz v1, :cond_50

    .line 141
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v0}, Lcom/miui/internal/app/AlertControllerImpl;->zj(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object v0

    goto :goto_1b

    .line 142
    :cond_50
    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zk(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/widget/Button;

    move-result-object v1

    if-ne p1, v1, :cond_1b

    iget-object v1, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v1}, Lcom/miui/internal/app/AlertControllerImpl;->zl(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 143
    iget-object v0, p0, Lcom/miui/internal/app/AlertControllerImpl$1;->afU:Lcom/miui/internal/app/AlertControllerImpl;

    invoke-static {v0}, Lcom/miui/internal/app/AlertControllerImpl;->zl(Lcom/miui/internal/app/AlertControllerImpl;)Landroid/os/Message;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Message;)Landroid/os/Message;

    move-result-object v0

    goto :goto_1b
.end method
