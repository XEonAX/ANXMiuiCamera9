.class Lcom/android/camera/ui/ToggleSwitch$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ToggleSwitch.java"


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
    iput-object p1, p0, Lcom/android/camera/ui/ToggleSwitch$2;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    .line 449
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 458
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 459
    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch$2;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/ui/ToggleSwitch;->-set0(Lcom/android/camera/ui/ToggleSwitch;Z)Z

    .line 460
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 452
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 453
    iget-object v0, p0, Lcom/android/camera/ui/ToggleSwitch$2;->this$0:Lcom/android/camera/ui/ToggleSwitch;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/ui/ToggleSwitch;->-set0(Lcom/android/camera/ui/ToggleSwitch;Z)Z

    .line 454
    return-void
.end method
