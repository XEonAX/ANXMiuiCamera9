.class public abstract Lcom/android/camera/effect/renders/RegionEffectRender;
.super Lcom/android/camera/effect/renders/ConvolutionEffectRender;
.source "RegionEffectRender.java"


# instance fields
.field private mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

.field private mThresholdHeight:I

.field private mThresholdWidth:I

.field protected mUniformEffectParameterH:I

.field protected mUniformEffectRectH:I

.field protected mUniformInvertRectH:I


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 31
    invoke-direct {p0}, Lcom/android/camera/effect/renders/RegionEffectRender;->init()V

    .line 32
    return-void
.end method

.method private getChangeMatrix()Landroid/graphics/Matrix;
    .locals 5

    .prologue
    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v3, -0x41000000    # -0.5f

    .line 149
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 150
    .local v0, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 151
    iget v1, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mOrientation:I

    iget v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mJpegOrientation:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 152
    invoke-virtual {v0, v3, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 153
    invoke-virtual {v0, v4, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 154
    return-object v0
.end method

.method private getEffectArray(Z)[F
    .locals 10
    .param p1, "isSnapShot"    # Z

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x1

    const/4 v5, 0x2

    const/4 v2, 0x0

    .line 88
    if-eqz p1, :cond_0

    .line 89
    invoke-direct {p0}, Lcom/android/camera/effect/renders/RegionEffectRender;->getChangeMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 90
    .local v0, "matrix":Landroid/graphics/Matrix;
    const/4 v3, 0x5

    new-array v1, v3, [F

    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v3, v3, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint1:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    aput v3, v1, v2

    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v3, v3, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint1:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    aput v3, v1, v7

    .line 91
    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v3, v3, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint2:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    aput v3, v1, v5

    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v3, v3, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint2:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    aput v3, v1, v8

    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget v3, v3, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRangeWidth:F

    aput v3, v1, v9

    .local v1, "points":[F
    move-object v3, v1

    move v4, v2

    .line 92
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Matrix;->mapPoints([FI[FII)V

    .line 93
    return-object v1

    .line 96
    .end local v0    # "matrix":Landroid/graphics/Matrix;
    .end local v1    # "points":[F
    :cond_0
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/EffectController;->getEffectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-result-object v6

    .line 97
    .local v6, "attribute":Lcom/android/camera/effect/EffectController$EffectRectAttribute;
    const/4 v3, 0x5

    new-array v3, v3, [F

    iget-object v4, v6, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint1:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    aput v4, v3, v2

    iget-object v2, v6, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint1:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    aput v2, v3, v7

    .line 98
    iget-object v2, v6, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint2:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    aput v2, v3, v5

    iget-object v2, v6, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint2:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    aput v2, v3, v8

    .line 99
    iget v2, v6, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRangeWidth:F

    aput v2, v3, v9

    .line 97
    return-object v3
.end method

.method private init()V
    .locals 2

    .prologue
    .line 24
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 25
    .local v0, "resources":Landroid/content/res/Resources;
    const v1, 0x7f090024

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mThresholdWidth:I

    .line 26
    const v1, 0x7f090025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mThresholdHeight:I

    .line 27
    return-void
.end method

.method private setEffectRectF(Landroid/graphics/RectF;)V
    .locals 6
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 60
    if-eqz p1, :cond_0

    .line 61
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    iget v1, p1, Landroid/graphics/RectF;->left:F

    aput v1, v0, v3

    .line 62
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    iget v1, p1, Landroid/graphics/RectF;->top:F

    aput v1, v0, v4

    .line 63
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    iget v1, p1, Landroid/graphics/RectF;->right:F

    aput v1, v0, v5

    .line 64
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 71
    :goto_0
    return-void

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aput v1, v0, v3

    .line 67
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aput v1, v0, v4

    .line 68
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aput v2, v0, v5

    .line 69
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    const/4 v1, 0x3

    aput v2, v0, v1

    goto :goto_0
.end method


# virtual methods
.method protected getEffectRect(Z)[F
    .locals 11
    .param p1, "isSnapShot"    # Z

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    .line 104
    if-eqz p1, :cond_2

    .line 105
    const/4 v1, 0x0

    .line 107
    .local v1, "rectF":Landroid/graphics/RectF;
    iget-boolean v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mMirror:Z

    if-eqz v2, :cond_1

    .line 108
    iget v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mOrientation:I

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_0

    .line 109
    new-instance v1, Landroid/graphics/RectF;

    .line 110
    .end local v1    # "rectF":Landroid/graphics/RectF;
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v2, v2, v6

    sub-float v2, v7, v2

    .line 111
    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v3, v3, v8

    .line 112
    iget-object v4, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v4, v4, v9

    sub-float v4, v7, v4

    .line 113
    iget-object v5, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v5, v5, v10

    .line 109
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 129
    .local v1, "rectF":Landroid/graphics/RectF;
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/effect/renders/RegionEffectRender;->getChangeMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 130
    .local v0, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 132
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mSnapshotEffectRect:[F

    iget v3, v1, Landroid/graphics/RectF;->left:F

    aput v3, v2, v6

    .line 133
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mSnapshotEffectRect:[F

    iget v3, v1, Landroid/graphics/RectF;->top:F

    aput v3, v2, v8

    .line 134
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mSnapshotEffectRect:[F

    iget v3, v1, Landroid/graphics/RectF;->right:F

    aput v3, v2, v9

    .line 135
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mSnapshotEffectRect:[F

    iget v3, v1, Landroid/graphics/RectF;->bottom:F

    aput v3, v2, v10

    .line 136
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mSnapshotEffectRect:[F

    return-object v2

    .line 115
    .end local v0    # "matrix":Landroid/graphics/Matrix;
    .local v1, "rectF":Landroid/graphics/RectF;
    :cond_0
    new-instance v1, Landroid/graphics/RectF;

    .line 116
    .end local v1    # "rectF":Landroid/graphics/RectF;
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v2, v2, v6

    .line 117
    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v3, v3, v8

    sub-float v3, v7, v3

    .line 118
    iget-object v4, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v4, v4, v9

    .line 119
    iget-object v5, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v5, v5, v10

    sub-float v5, v7, v5

    .line 115
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .local v1, "rectF":Landroid/graphics/RectF;
    goto :goto_0

    .line 122
    .local v1, "rectF":Landroid/graphics/RectF;
    :cond_1
    new-instance v1, Landroid/graphics/RectF;

    .line 123
    .end local v1    # "rectF":Landroid/graphics/RectF;
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v2, v2, v6

    .line 124
    iget-object v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v3, v3, v8

    .line 125
    iget-object v4, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v4, v4, v9

    .line 126
    iget-object v5, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    aget v5, v5, v10

    .line 122
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .local v1, "rectF":Landroid/graphics/RectF;
    goto :goto_0

    .line 138
    .end local v1    # "rectF":Landroid/graphics/RectF;
    :cond_2
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->getEffectRectF()Landroid/graphics/RectF;

    move-result-object v1

    .line 139
    .restart local v1    # "rectF":Landroid/graphics/RectF;
    iget v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewWidth:I

    iget v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mThresholdWidth:I

    if-le v2, v3, :cond_3

    iget v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewHeight:I

    iget v3, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mThresholdHeight:I

    if-le v2, v3, :cond_3

    .line 140
    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/RegionEffectRender;->setEffectRectF(Landroid/graphics/RectF;)V

    .line 144
    :goto_1
    iget-object v2, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mPreviewEffectRect:[F

    return-object v2

    .line 142
    :cond_3
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/android/camera/effect/renders/RegionEffectRender;->setEffectRectF(Landroid/graphics/RectF;)V

    goto :goto_1
.end method

.method protected getInvertFlag(Z)I
    .locals 1
    .param p1, "isSnapShot"    # Z

    .prologue
    .line 74
    if-eqz p1, :cond_0

    .line 75
    iget-object v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mInvertFlag:I

    return v0

    .line 77
    :cond_0
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->getInvertFlag()I

    move-result v0

    return v0
.end method

.method protected initEffectRect(Z)V
    .locals 4
    .param p1, "isSnapShot"    # Z

    .prologue
    const/4 v3, 0x0

    .line 82
    iget v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mUniformEffectRectH:I

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/RegionEffectRender;->getEffectRect(Z)[F

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v2, v1, v3}, Landroid/opengl/GLES20;->glUniform4fv(II[FI)V

    .line 83
    iget v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mUniformInvertRectH:I

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/RegionEffectRender;->getInvertFlag(Z)I

    move-result v1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 84
    iget v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mUniformEffectParameterH:I

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RegionEffectRender;->getEffectArray(Z)[F

    move-result-object v1

    const/4 v2, 0x5

    invoke-static {v0, v2, v1, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 85
    return-void
.end method

.method protected initShader()V
    .locals 2

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->initShader()V

    .line 42
    iget v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mProgram:I

    const-string/jumbo v1, "uEffectRect"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mUniformEffectRectH:I

    .line 43
    iget v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mProgram:I

    const-string/jumbo v1, "uInvertRect"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mUniformInvertRectH:I

    .line 44
    iget v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mProgram:I

    const-string/jumbo v1, "uEffectArray"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mUniformEffectParameterH:I

    .line 45
    return-void
.end method

.method protected initShaderValue(Z)V
    .locals 0
    .param p1, "isSnapShot"    # Z

    .prologue
    .line 49
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->initShaderValue(Z)V

    .line 50
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/RegionEffectRender;->initEffectRect(Z)V

    .line 51
    return-void
.end method

.method public setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V
    .locals 1
    .param p1, "attribute"    # Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/android/camera/effect/renders/RegionEffectRender;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    .line 56
    iget-object v0, p1, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRectF:Landroid/graphics/RectF;

    invoke-direct {p0, v0}, Lcom/android/camera/effect/renders/RegionEffectRender;->setEffectRectF(Landroid/graphics/RectF;)V

    .line 57
    return-void
.end method
