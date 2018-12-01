.class public Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraSnapPaintCircle.java"


# instance fields
.field public isInBeautyMode:Z

.field private mArcRectF:Landroid/graphics/RectF;

.field private mBeautyColor:I

.field private mNeedRing:Z

.field private mNoNeedArc:Z

.field private mRingWidth:F

.field private mSpaceAngle:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 20
    const v0, -0x3967c

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBeautyColor:I

    .line 21
    const/high16 v0, 0x40400000    # 3.0f

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNeedRing:Z

    .line 29
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 63
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNoNeedArc:Z

    if-eqz v0, :cond_0

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isRecording:Z

    .line 67
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isRecording:Z

    if-eqz v0, :cond_7

    .line 68
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    mul-float v8, v0, v1

    .line 69
    .local v8, "length":F
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    sub-float v7, v0, v8

    .line 70
    .local v7, "left":F
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    sub-float v10, v0, v8

    .line 71
    .local v10, "top":F
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    add-float v9, v0, v8

    .line 72
    .local v9, "right":F
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    add-float v6, v0, v8

    .line 74
    .local v6, "bottom":F
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isInBeautyMode:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentAlpha:I

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 78
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v7, v10, v9, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 79
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    .line 80
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isClockwise:Z

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    :goto_1
    const/high16 v2, -0x3d4c0000    # -90.0f

    add-float/2addr v0, v2

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    add-float/2addr v2, v0

    .line 81
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isClockwise:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    const/high16 v3, 0x43b40000    # 360.0f

    sub-float v0, v3, v0

    :goto_2
    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    sub-float v3, v0, v3

    .line 82
    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    move-object v0, p1

    .line 79
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 85
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->ALPHA_OPAQUE:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 87
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isInBeautyMode:Z

    if-eqz v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBeautyColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    :cond_1
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    .line 91
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isClockwise:Z

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    :goto_3
    const/high16 v2, -0x3d4c0000    # -90.0f

    add-float/2addr v0, v2

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    add-float/2addr v2, v0

    .line 92
    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isClockwise:Z

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    :goto_4
    iget v4, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    const/high16 v5, 0x40000000    # 2.0f

    mul-float/2addr v4, v5

    sub-float/2addr v0, v4

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 94
    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    .line 93
    const/4 v4, 0x0

    move-object v0, p1

    .line 90
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 96
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 106
    .end local v6    # "bottom":F
    .end local v7    # "left":F
    .end local v8    # "length":F
    .end local v9    # "right":F
    .end local v10    # "top":F
    :goto_5
    return-void

    .line 74
    .restart local v6    # "bottom":F
    .restart local v7    # "left":F
    .restart local v8    # "length":F
    .restart local v9    # "right":F
    .restart local v10    # "top":F
    :cond_2
    sget v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->ALPHA_HINT:I

    goto :goto_0

    .line 80
    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 81
    :cond_4
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    goto :goto_2

    .line 91
    :cond_5
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    goto :goto_3

    .line 92
    :cond_6
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    const/high16 v4, 0x43b40000    # 360.0f

    sub-float v0, v4, v0

    goto :goto_4

    .line 98
    .end local v6    # "bottom":F
    .end local v7    # "left":F
    .end local v8    # "length":F
    .end local v9    # "right":F
    .end local v10    # "top":F
    :cond_7
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNeedRing:Z

    if-eqz v0, :cond_8

    .line 99
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->ALPHA_OUTSTANDING:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 100
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mRingWidth:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 101
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_5

    .line 103
    :cond_8
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_5
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 34
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 37
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    .line 38
    return-void
.end method

.method public resetRecordingState()V
    .locals 1

    .prologue
    .line 42
    invoke-super {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->resetRecordingState()V

    .line 43
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setNeedSplit(Z)V

    .line 44
    return-void
.end method

.method public setNeedSplit(Z)V
    .locals 1
    .param p1, "needSplit"    # Z

    .prologue
    .line 51
    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNoNeedArc:Z

    .line 52
    if-eqz p1, :cond_0

    const/high16 v0, 0x3fc00000    # 1.5f

    :goto_0
    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    .line 53
    return-void

    .line 52
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setRingVisible(I)V
    .locals 1
    .param p1, "visible"    # I

    .prologue
    const/4 v0, 0x0

    .line 47
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNeedRing:Z

    .line 48
    return-void
.end method

.method public updateValue(F)V
    .locals 3
    .param p1, "interpolatorValue"    # F

    .prologue
    .line 57
    invoke-super {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->updateValue(F)V

    .line 58
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    const v2, 0x3ecccccd    # 0.4f

    mul-float/2addr v1, v2

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mRingWidth:F

    .line 59
    return-void
.end method
