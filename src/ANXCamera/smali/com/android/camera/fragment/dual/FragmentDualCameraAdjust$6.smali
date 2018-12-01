.class Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;
.super Ljava/lang/Object;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->setZoomText()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-virtual {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;->this$0:Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    invoke-static {v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->-get0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->sendAccessibilityEvent(I)V

    .line 331
    :cond_0
    return-void
.end method
