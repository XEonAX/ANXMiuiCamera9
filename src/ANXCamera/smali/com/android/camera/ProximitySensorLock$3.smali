.class Lcom/android/camera/ProximitySensorLock$3;
.super Ljava/lang/Object;
.source "ProximitySensorLock.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ProximitySensorLock;->hide()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ProximitySensorLock;


# direct methods
.method constructor <init>(Lcom/android/camera/ProximitySensorLock;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ProximitySensorLock;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ProximitySensorLock$3;->this$0:Lcom/android/camera/ProximitySensorLock;

    .line 326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 329
    iget-object v1, p0, Lcom/android/camera/ProximitySensorLock$3;->this$0:Lcom/android/camera/ProximitySensorLock;

    invoke-static {v1}, Lcom/android/camera/ProximitySensorLock;->-get0(Lcom/android/camera/ProximitySensorLock;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_0

    .line 330
    return-void

    .line 332
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ProximitySensorLock$3;->this$0:Lcom/android/camera/ProximitySensorLock;

    invoke-static {v1}, Lcom/android/camera/ProximitySensorLock;->-get0(Lcom/android/camera/ProximitySensorLock;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 333
    .local v0, "parent":Landroid/view/ViewGroup;
    if-eqz v0, :cond_1

    .line 334
    iget-object v1, p0, Lcom/android/camera/ProximitySensorLock$3;->this$0:Lcom/android/camera/ProximitySensorLock;

    invoke-static {v1}, Lcom/android/camera/ProximitySensorLock;->-get0(Lcom/android/camera/ProximitySensorLock;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 336
    :cond_1
    return-void
.end method
