.class public abstract Lcom/android/camera/FocusManagerAbstract;
.super Ljava/lang/Object;
.source "FocusManagerAbstract.java"


# instance fields
.field protected final FOCUS_AREA_HEIGHT:I

.field protected final FOCUS_AREA_SCALE:F

.field protected final FOCUS_AREA_WIDTH:I

.field protected final METERING_AREA_SCALE:F

.field protected mCancelAutoFocusIfMove:Z

.field protected mDisplayOrientation:I

.field protected mInitialized:Z

.field protected mMatrix:Landroid/graphics/Matrix;

.field protected mMirror:Z

.field protected mPreviewHeight:I

.field protected mPreviewWidth:I

.field protected mRenderHeight:I

.field protected mRenderWidth:I

.field protected mState:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/FocusManagerAbstract;->mMatrix:Landroid/graphics/Matrix;

    .line 42
    iput-boolean v1, p0, Lcom/android/camera/FocusManagerAbstract;->mInitialized:Z

    .line 52
    iput v1, p0, Lcom/android/camera/FocusManagerAbstract;->mState:I

    .line 55
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090007

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 54
    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->FOCUS_AREA_WIDTH:I

    .line 57
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090008

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 56
    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->FOCUS_AREA_HEIGHT:I

    .line 58
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->FOCUS_AREA_SCALE:F

    .line 61
    const v0, 0x3fe66666    # 1.8f

    iput v0, p0, Lcom/android/camera/FocusManagerAbstract;->METERING_AREA_SCALE:F

    .line 26
    return-void
.end method


# virtual methods
.method protected calculateTapArea(IIFIIIILandroid/graphics/Rect;)V
    .locals 10
    .param p1, "focusWidth"    # I
    .param p2, "focusHeight"    # I
    .param p3, "areaMultiple"    # F
    .param p4, "x"    # I
    .param p5, "y"    # I
    .param p6, "previewWidth"    # I
    .param p7, "previewHeight"    # I
    .param p8, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 114
    int-to-float v6, p1

    mul-float/2addr v6, p3

    float-to-int v2, v6

    .line 115
    .local v2, "areaWidth":I
    int-to-float v6, p2

    mul-float/2addr v6, p3

    float-to-int v1, v6

    .line 116
    .local v1, "areaHeight":I
    div-int/lit8 v6, v2, 0x2

    sub-int v6, p4, v6

    sub-int v7, p6, v2

    const/4 v8, 0x0

    invoke-static {v6, v8, v7}, Lcom/android/camera/Util;->clamp(III)I

    move-result v3

    .line 117
    .local v3, "left":I
    div-int/lit8 v6, v1, 0x2

    sub-int v6, p5, v6

    sub-int v7, p7, v1

    const/4 v8, 0x0

    invoke-static {v6, v8, v7}, Lcom/android/camera/Util;->clamp(III)I

    move-result v5

    .line 118
    .local v5, "top":I
    new-instance v4, Landroid/graphics/RectF;

    int-to-float v6, v3

    int-to-float v7, v5

    add-int v8, v3, v2

    int-to-float v8, v8

    add-int v9, v5, v1

    int-to-float v9, v9

    invoke-direct {v4, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 119
    .local v4, "rectF":Landroid/graphics/RectF;
    iget-object v6, p0, Lcom/android/camera/FocusManagerAbstract;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 120
    move-object/from16 v0, p8

    invoke-static {v4, v0}, Lcom/android/camera/Util;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 121
    return-void
.end method

.method protected convertToCamera2Coordinates(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 7
    .param p1, "camera1Region"    # Landroid/graphics/Rect;
    .param p2, "cropRegion"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v6, 0x44fa0000    # 2000.0f

    const/high16 v5, 0x40000000    # 2.0f

    .line 124
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 125
    .local v1, "matrix2":Landroid/graphics/Matrix;
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    div-float/2addr v3, v5

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    div-float/2addr v4, v5

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 126
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float v3, v6, v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v6, v4

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 127
    invoke-virtual {v1, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 129
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 130
    .local v2, "rectF":Landroid/graphics/RectF;
    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 132
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 133
    .local v0, "camera2Region":Landroid/graphics/Rect;
    invoke-static {v2, v0}, Lcom/android/camera/Util;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 134
    iget v3, v0, Landroid/graphics/Rect;->left:I

    iget v4, p2, Landroid/graphics/Rect;->left:I

    .line 135
    iget v5, p2, Landroid/graphics/Rect;->right:I

    .line 134
    invoke-static {v3, v4, v5}, Lcom/android/camera/Util;->clamp(III)I

    move-result v3

    iput v3, v0, Landroid/graphics/Rect;->left:I

    .line 136
    iget v3, v0, Landroid/graphics/Rect;->top:I

    iget v4, p2, Landroid/graphics/Rect;->top:I

    .line 137
    iget v5, p2, Landroid/graphics/Rect;->bottom:I

    .line 136
    invoke-static {v3, v4, v5}, Lcom/android/camera/Util;->clamp(III)I

    move-result v3

    iput v3, v0, Landroid/graphics/Rect;->top:I

    .line 138
    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v4, p2, Landroid/graphics/Rect;->left:I

    .line 139
    iget v5, p2, Landroid/graphics/Rect;->right:I

    .line 138
    invoke-static {v3, v4, v5}, Lcom/android/camera/Util;->clamp(III)I

    move-result v3

    iput v3, v0, Landroid/graphics/Rect;->right:I

    .line 140
    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    iget v4, p2, Landroid/graphics/Rect;->top:I

    .line 141
    iget v5, p2, Landroid/graphics/Rect;->bottom:I

    .line 140
    invoke-static {v3, v4, v5}, Lcom/android/camera/Util;->clamp(III)I

    move-result v3

    iput v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 143
    return-object v0
.end method

.method public setDisplayOrientation(I)V
    .locals 0
    .param p1, "displayOrientation"    # I

    .prologue
    .line 152
    iput p1, p0, Lcom/android/camera/FocusManagerAbstract;->mDisplayOrientation:I

    .line 153
    invoke-virtual {p0}, Lcom/android/camera/FocusManagerAbstract;->setMatrix()V

    .line 154
    return-void
.end method

.method protected setMatrix()V
    .locals 8

    .prologue
    const/high16 v7, 0x40000000    # 2.0f

    .line 70
    iget v1, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewWidth:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewHeight:I

    if-eqz v1, :cond_0

    .line 71
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 72
    .local v0, "matrix":Landroid/graphics/Matrix;
    iget-boolean v1, p0, Lcom/android/camera/FocusManagerAbstract;->mMirror:Z

    iget v2, p0, Lcom/android/camera/FocusManagerAbstract;->mDisplayOrientation:I

    iget v3, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    iget v4, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    .line 73
    iget v5, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewWidth:I

    int-to-float v5, v5

    div-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    iget v6, p0, Lcom/android/camera/FocusManagerAbstract;->mPreviewHeight:I

    int-to-float v6, v6

    div-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 72
    invoke-static/range {v0 .. v6}, Lcom/android/camera/Util;->prepareMatrix(Landroid/graphics/Matrix;ZIIIII)V

    .line 76
    iget-object v1, p0, Lcom/android/camera/FocusManagerAbstract;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 78
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/FocusManagerAbstract;->mInitialized:Z

    .line 80
    .end local v0    # "matrix":Landroid/graphics/Matrix;
    :cond_0
    return-void
.end method

.method public setMirror(Z)V
    .locals 0
    .param p1, "mirror"    # Z

    .prologue
    .line 147
    iput-boolean p1, p0, Lcom/android/camera/FocusManagerAbstract;->mMirror:Z

    .line 148
    invoke-virtual {p0}, Lcom/android/camera/FocusManagerAbstract;->setMatrix()V

    .line 149
    return-void
.end method

.method public setRenderSize(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 91
    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    if-eq p2, v0, :cond_1

    .line 92
    :cond_0
    iput p1, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    .line 93
    iput p2, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    .line 95
    const-string/jumbo v0, "focus setRenderSize: "

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/FocusManagerAbstract;->mRenderHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-virtual {p0}, Lcom/android/camera/FocusManagerAbstract;->setMatrix()V

    .line 98
    :cond_1
    return-void
.end method
