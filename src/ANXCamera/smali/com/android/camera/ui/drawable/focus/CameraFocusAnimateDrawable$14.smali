.class Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;
.super Lmiui/view/animation/CubicEaseInOutInterpolator;
.source "CameraFocusAnimateDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startFocusFailAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;->this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .line 589
    invoke-direct {p0}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 2
    .param p1, "t"    # F

    .prologue
    .line 593
    invoke-super {p0, p1}, Lmiui/view/animation/CubicEaseInOutInterpolator;->getInterpolation(F)F

    move-result v0

    .line 594
    .local v0, "value":F
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;->this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-static {v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->-get1(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->updateValue(F)V

    .line 595
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;->this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-static {v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->-get2(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->updateValue(F)V

    .line 596
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;->this$0:Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    invoke-virtual {v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->invalidateSelf()V

    .line 597
    return v0
.end method
