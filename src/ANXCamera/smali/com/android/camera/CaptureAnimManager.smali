.class public Lcom/android/camera/CaptureAnimManager;
.super Ljava/lang/Object;
.source "CaptureAnimManager.java"


# instance fields
.field private mAnimStartTime:J

.field private mAnimType:I

.field private mDrawHeight:I

.field private mDrawWidth:I

.field private mX:F

.field private mY:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method public animateHoldAndSlide()V
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    .line 81
    return-void
.end method

.method public clearAnimation()V
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    .line 77
    return-void
.end method

.method public drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)Z
    .locals 11
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "review"    # Lcom/android/gallery3d/ui/RawTexture;

    .prologue
    const/4 v4, 0x3

    const/4 v10, 0x1

    const/4 v7, 0x0

    .line 85
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/CaptureAnimManager;->mAnimStartTime:J

    sub-long v8, v0, v2

    .line 87
    .local v8, "timeDiff":J
    iget v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    if-ne v0, v4, :cond_0

    const-wide/16 v0, 0x78

    cmp-long v0, v8, v0

    if-lez v0, :cond_0

    .line 88
    return v7

    .line 90
    :cond_0
    iget v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    if-ne v0, v10, :cond_1

    const-wide/16 v0, 0x8c

    cmp-long v0, v8, v0

    if-lez v0, :cond_1

    .line 91
    return v7

    .line 94
    :cond_1
    iget v6, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    .line 95
    .local v6, "animStep":I
    iget v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    if-ne v0, v10, :cond_2

    .line 96
    const-wide/16 v0, 0x14

    cmp-long v0, v8, v0

    if-gez v0, :cond_3

    const/4 v6, 0x2

    .line 99
    :cond_2
    :goto_0
    const/4 v0, 0x2

    if-ne v6, v0, :cond_4

    .line 100
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget v1, p0, Lcom/android/camera/CaptureAnimManager;->mX:F

    float-to-int v2, v1

    iget v1, p0, Lcom/android/camera/CaptureAnimManager;->mY:F

    float-to-int v3, v1

    iget v4, p0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    iget v5, p0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 112
    :goto_1
    return v10

    .line 96
    :cond_3
    const/4 v6, 0x3

    goto :goto_0

    .line 101
    :cond_4
    if-ne v6, v4, :cond_5

    .line 102
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget v1, p0, Lcom/android/camera/CaptureAnimManager;->mX:F

    float-to-int v2, v1

    iget v1, p0, Lcom/android/camera/CaptureAnimManager;->mY:F

    float-to-int v3, v1

    iget v4, p0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    iget v5, p0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 103
    new-instance v0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;

    iget v1, p0, Lcom/android/camera/CaptureAnimManager;->mX:F

    .line 104
    iget v2, p0, Lcom/android/camera/CaptureAnimManager;->mY:F

    .line 105
    iget v3, p0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    int-to-float v3, v3

    .line 106
    iget v4, p0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    int-to-float v4, v4

    .line 107
    const/16 v5, 0xb2

    invoke-static {v5, v7, v7, v7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    .line 103
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/FillRectAttribute;-><init>(FFFFI)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    goto :goto_1

    .line 109
    :cond_5
    return v7
.end method

.method public startAnimation(IIII)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 55
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimStartTime:J

    .line 57
    iput p3, p0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    .line 58
    iput p4, p0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    .line 59
    int-to-float v0, p1

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mX:F

    .line 60
    int-to-float v0, p2

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mY:F

    .line 61
    return-void
.end method
