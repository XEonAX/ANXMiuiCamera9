.class Lcom/android/camera/Camera$MyOrientationEventListener;
.super Landroid/view/OrientationEventListener;
.source "Camera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/Camera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyOrientationEventListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method public constructor <init>(Lcom/android/camera/Camera;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/Camera;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1021
    iput-object p1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    .line 1022
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 1023
    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 4
    .param p1, "orientation"    # I

    .prologue
    .line 1030
    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    .line 1031
    return-void

    .line 1033
    :cond_0
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget-object v2, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v2, v2, Lcom/android/camera/Camera;->mOrientation:I

    invoke-static {p1, v2}, Lcom/android/camera/Util;->roundOrientation(II)I

    move-result v2

    iput v2, v1, Lcom/android/camera/Camera;->mOrientation:I

    .line 1035
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 1036
    .local v0, "displayRotation":I
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v1, v1, Lcom/android/camera/Camera;->mDisplayRotation:I

    if-eq v0, v1, :cond_1

    .line 1037
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iput v0, v1, Lcom/android/camera/Camera;->mDisplayRotation:I

    .line 1038
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/Camera;->-wrap0(Lcom/android/camera/Camera;)V

    .line 1041
    :cond_1
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget-object v2, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v2, v2, Lcom/android/camera/Camera;->mOrientation:I

    iget-object v3, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v3, v3, Lcom/android/camera/Camera;->mDisplayRotation:I

    add-int/2addr v2, v3

    rem-int/lit16 v2, v2, 0x168

    iput v2, v1, Lcom/android/camera/Camera;->mOrientationCompensation:I

    .line 1043
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget-object v1, v1, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v1, :cond_2

    .line 1044
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget-object v1, v1, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    iget-object v2, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v2, v2, Lcom/android/camera/Camera;->mOrientation:I

    iget-object v3, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v3, v3, Lcom/android/camera/Camera;->mOrientationCompensation:I

    invoke-interface {v1, v2, v3}, Lcom/android/camera/module/Module;->onOrientationChanged(II)V

    .line 1050
    :cond_2
    iget-object v1, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/Camera;->-get1(Lcom/android/camera/Camera;)Lcom/android/camera/fragment/BaseFragmentDelegate;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/Camera$MyOrientationEventListener;->this$0:Lcom/android/camera/Camera;

    iget v2, v2, Lcom/android/camera/Camera;->mOrientationCompensation:I

    invoke-virtual {v1, v2}, Lcom/android/camera/animation/AnimationComposite;->disposeRotation(I)V

    .line 1051
    return-void
.end method
