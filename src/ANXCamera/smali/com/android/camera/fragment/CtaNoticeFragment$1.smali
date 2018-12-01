.class Lcom/android/camera/fragment/CtaNoticeFragment$1;
.super Ljava/lang/Object;
.source "CtaNoticeFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/CtaNoticeFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/CtaNoticeFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/CtaNoticeFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/CtaNoticeFragment;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/camera/fragment/CtaNoticeFragment$1;->this$0:Lcom/android/camera/fragment/CtaNoticeFragment;

    invoke-virtual {v0}, Lcom/android/camera/fragment/CtaNoticeFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result v0

    invoke-static {v0}, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->setCanConnectNetwork(Z)V

    .line 82
    return-void
.end method
