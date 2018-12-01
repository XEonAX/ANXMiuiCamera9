.class Lcom/android/camera/fragment/FragmentBottomAction$5;
.super Ljava/lang/Object;
.source "FragmentBottomAction.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBottomAction;->processingFailed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBottomAction;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBottomAction;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    .line 541
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 544
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get2(Lcom/android/camera/fragment/FragmentBottomAction;)Lcom/android/camera/ui/EdgeHorizonScrollView;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 545
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-get5(Lcom/android/camera/fragment/FragmentBottomAction;)Lcom/android/camera/ui/ModeSelectView;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 546
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentBottomAction;->-set0(Lcom/android/camera/fragment/FragmentBottomAction;Z)Z

    .line 547
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-virtual {v0, v2}, Lcom/android/camera/fragment/FragmentBottomAction;->updateLoading(Z)V

    .line 548
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction$5;->this$0:Lcom/android/camera/fragment/FragmentBottomAction;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentBottomAction;->-wrap0(Lcom/android/camera/fragment/FragmentBottomAction;)V

    .line 549
    return-void
.end method
