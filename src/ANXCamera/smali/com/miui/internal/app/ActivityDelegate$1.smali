.class Lcom/miui/internal/app/ActivityDelegate$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/app/ActivityDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic agd:Lcom/miui/internal/app/ActivityDelegate;


# direct methods
.method constructor <init>(Lcom/miui/internal/app/ActivityDelegate;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 67
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0}, Lcom/miui/internal/app/ActivityDelegate;->createMenu()Lcom/miui/internal/view/menu/MenuBuilder;

    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v1}, Lcom/miui/internal/app/ActivityDelegate;->isImmersionMenuEnabled()Z

    move-result v1

    if-nez v1, :cond_26

    .line 69
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    invoke-static {v1, v2, v0}, Lcom/miui/internal/app/ActivityDelegate;->zA(Lcom/miui/internal/app/ActivityDelegate;ILandroid/view/Menu;)Z

    move-result v1

    .line 68
    if-eqz v1, :cond_26

    .line 70
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    invoke-static {v1, v2, v3, v0}, Lcom/miui/internal/app/ActivityDelegate;->zB(Lcom/miui/internal/app/ActivityDelegate;ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v1

    .line 68
    if-eqz v1, :cond_26

    .line 71
    iget-object v1, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v1, v0}, Lcom/miui/internal/app/ActivityDelegate;->setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V

    .line 75
    :goto_25
    return-void

    .line 73
    :cond_26
    iget-object v0, p0, Lcom/miui/internal/app/ActivityDelegate$1;->agd:Lcom/miui/internal/app/ActivityDelegate;

    invoke-virtual {v0, v3}, Lcom/miui/internal/app/ActivityDelegate;->setMenu(Lcom/miui/internal/view/menu/MenuBuilder;)V

    goto :goto_25
.end method
