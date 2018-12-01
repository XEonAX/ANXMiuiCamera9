.class public abstract Lcom/android/camera/ui/FrameView;
.super Landroid/view/View;
.source "FrameView.java"

# interfaces
.implements Lcom/android/camera/ui/FocusIndicator;


# instance fields
.field protected mCameraDisplayOrientation:I

.field protected mIsBigEnoughRect:Z

.field protected mMatrix:Landroid/graphics/Matrix;

.field protected mPause:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/FrameView;->mMatrix:Landroid/graphics/Matrix;

    .line 27
    return-void
.end method


# virtual methods
.method public isNeedExposure()Z
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/android/camera/ui/FrameView;->mIsBigEnoughRect:Z

    return v0
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/FrameView;->mPause:Z

    .line 89
    return-void
.end method

.method public showFail()V
    .locals 0

    .prologue
    .line 76
    return-void
.end method

.method public showStart()V
    .locals 0

    .prologue
    .line 66
    return-void
.end method

.method public showSuccess()V
    .locals 0

    .prologue
    .line 71
    return-void
.end method
