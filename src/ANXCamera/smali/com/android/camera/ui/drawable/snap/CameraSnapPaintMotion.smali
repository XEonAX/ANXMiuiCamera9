.class public Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraSnapPaintMotion.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 17
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 28
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentWidthPercent:F

    mul-float v13, v0, v1

    .line 30
    .local v13, "radius":F
    const/16 v7, 0x9

    .line 31
    .local v7, "angel":I
    const/16 v8, 0x28

    .line 33
    .local v8, "count":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v8, :cond_6

    .line 34
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 36
    mul-int/lit8 v0, v10, 0x9

    int-to-float v9, v0

    .line 37
    .local v9, "currentAngel":F
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    invoke-virtual {p1, v9, v0, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 39
    const/16 v12, 0xc

    .line 40
    .local v12, "lineWidth":I
    iget v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentAlpha:I

    .line 42
    .local v6, "alpha":I
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isRecording:Z

    if-eqz v0, :cond_5

    .line 43
    const/4 v0, 0x0

    cmpl-float v0, v9, v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->needZero:Z

    if-eqz v0, :cond_1

    .line 44
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 50
    :goto_1
    const/high16 v0, 0x42b40000    # 90.0f

    rem-float v0, v9, v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 51
    const/16 v12, 0x13

    .line 59
    :cond_0
    :goto_2
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float v2, v0, v13

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float/2addr v0, v13

    int-to-float v4, v12

    add-float/2addr v4, v0

    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 61
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 62
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 33
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 45
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    cmpg-float v0, v9, v0

    if-gez v0, :cond_3

    .line 46
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isClockwise:Z

    if-eqz v0, :cond_2

    sget v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    :goto_3
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_1

    :cond_2
    sget v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_HINT:I

    goto :goto_3

    .line 48
    :cond_3
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isClockwise:Z

    if-eqz v0, :cond_4

    sget v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_HINT:I

    :goto_4
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_1

    :cond_4
    sget v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    goto :goto_4

    .line 54
    :cond_5
    const/high16 v0, 0x42b40000    # 90.0f

    rem-float v0, v9, v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 55
    const/16 v12, 0x13

    goto :goto_2

    .line 65
    .end local v6    # "alpha":I
    .end local v9    # "currentAngel":F
    .end local v12    # "lineWidth":I
    :cond_6
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isRecording:Z

    if-eqz v0, :cond_7

    .line 66
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 67
    iget v11, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentAlpha:I

    .line 68
    .local v11, "lastAlpha":I
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 69
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float v2, v0, v13

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float/2addr v0, v13

    const/high16 v4, 0x41980000    # 19.0f

    add-float/2addr v4, v0

    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 70
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 72
    .end local v11    # "lastAlpha":I
    :cond_7
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 22
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 24
    return-void
.end method
