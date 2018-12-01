.class Lcom/android/camera/snap/SnapCamera$5;
.super Landroid/view/OrientationEventListener;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/snap/SnapCamera;->initOrientationListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/snap/SnapCamera;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapCamera;Landroid/content/Context;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/snap/SnapCamera;
    .param p2, "$anonymous0"    # Landroid/content/Context;
    .param p3, "$anonymous1"    # I

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    .line 255
    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    .line 1
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 2
    .param p1, "orientation"    # I

    .prologue
    .line 260
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v1}, Lcom/android/camera/snap/SnapCamera;->-get3(Lcom/android/camera/snap/SnapCamera;)I

    move-result v1

    invoke-static {p1, v1}, Lcom/android/camera/Util;->roundOrientation(II)I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/snap/SnapCamera;->-set2(Lcom/android/camera/snap/SnapCamera;I)I

    .line 261
    return-void
.end method
