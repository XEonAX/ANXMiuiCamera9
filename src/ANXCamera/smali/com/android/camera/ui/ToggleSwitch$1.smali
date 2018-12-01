.class Lcom/android/camera/ui/ToggleSwitch$1;
.super Ljava/lang/Object;
.source "ToggleSwitch.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/ToggleSwitch;->animateToCheckedState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/ToggleSwitch;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/ToggleSwitch;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/ui/ToggleSwitch;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch$1;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .prologue
    .line 444
    iget-object v1, p0, Lcom/android/camera/ui/ToggleSwitch$1;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v1, v0}, Lcom/android/camera/ui/ToggleSwitch;->-set1(Lcom/android/camera/ui/ToggleSwitch;F)F

    .line 445
    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch$1;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0}, Lcom/android/camera/ui/ToggleSwitch;->invalidate()V

    .line 446
    return-void
.end method
