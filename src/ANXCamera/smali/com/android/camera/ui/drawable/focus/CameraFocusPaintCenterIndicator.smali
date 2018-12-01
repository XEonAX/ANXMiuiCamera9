.class public Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraFocusPaintCenterIndicator.java"


# instance fields
.field public indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

.field private mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

.field private mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

.field private mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

.field private mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

.field private mLockMatrix:Landroid/graphics/Matrix;

.field private mMinusMoonPaint:Landroid/graphics/Paint;

.field private mSunPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 35
    return-void
.end method

.method private drawCenterCaptureBitmap(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    if-nez v0, :cond_1

    .line 111
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    .line 115
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    .line 117
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 118
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    .line 116
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 120
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 122
    :cond_0
    return-void

    .line 113
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    goto :goto_0
.end method

.method private drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "cx"    # F
    .param p3, "cy"    # F
    .param p4, "radius"    # F
    .param p5, "paint"    # Landroid/graphics/Paint;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 106
    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 107
    return-void
.end method

.method private drawCenterLock(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1

    .line 170
    :cond_0
    return-void

    .line 172
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    if-nez v0, :cond_3

    .line 173
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    .line 178
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 179
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 180
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mAEAFHeadPosition:F

    add-float/2addr v2, v3

    .line 179
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 181
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 182
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 183
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 184
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    .line 183
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 185
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 187
    :cond_2
    return-void

    .line 175
    :cond_3
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    goto :goto_0
.end method

.method private drawCenterMoon(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 159
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRadius:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object v1, p1

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V

    .line 161
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleCenter:I

    neg-int v0, v0

    int-to-float v2, v0

    .line 162
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleCenter:I

    neg-int v0, v0

    int-to-float v3, v0

    .line 163
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleRadius:F

    .line 164
    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object v1, p1

    .line 160
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V

    .line 165
    return-void
.end method

.method private drawCenterSun(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    .line 125
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentAngle:F

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 126
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    const/4 v0, 0x2

    if-ge v6, v0, :cond_1

    .line 127
    if-lez v6, :cond_0

    .line 128
    const/high16 v0, 0x42340000    # 45.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v1, v0

    .line 132
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v0, v0

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    sub-int/2addr v0, v2

    int-to-float v2, v0

    .line 133
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v3, v0

    .line 134
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v0, v0

    int-to-float v4, v0

    .line 135
    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 131
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 137
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v1, v0

    .line 138
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    int-to-float v2, v0

    .line 139
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v3, v0

    .line 140
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    iget-object v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v4, v4, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    .line 141
    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 137
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 143
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v1, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    sub-int/2addr v0, v1

    int-to-float v1, v0

    .line 144
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v2, v0

    .line 145
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v0, v0

    int-to-float v3, v0

    .line 146
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v4, v0

    .line 147
    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 143
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 149
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    int-to-float v1, v0

    .line 150
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v2, v0

    .line 151
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    add-int/2addr v0, v3

    int-to-float v3, v0

    .line 152
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v4, v0

    .line 153
    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 149
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 126
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 155
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRadius:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v7, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 156
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 67
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMiddleY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 68
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    packed-switch v0, :pswitch_data_0

    .line 72
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentStrokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 73
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 74
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentWidthPercent:F

    mul-float v4, v0, v1

    iget-object v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    move-object v0, p0

    move-object v1, p1

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V

    .line 99
    :goto_0
    return-void

    .line 78
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 79
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCaptureBitmap(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 83
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 85
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterSun(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 89
    :pswitch_3
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 91
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterMoon(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 95
    :pswitch_4
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 96
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterLock(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 68
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    .line 50
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 51
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    .line 54
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 56
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 58
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    .line 59
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 61
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 62
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 63
    return-void
.end method

.method public setAEAFIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "indicatorState"    # Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;
    .param p2, "head"    # Landroid/graphics/Bitmap;
    .param p3, "body"    # Landroid/graphics/Bitmap;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    .line 44
    iput-object p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    .line 45
    iput-object p3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    .line 46
    return-void
.end method

.method public setCenterFlag(I)V
    .locals 1
    .param p1, "centerFlag"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iput p1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    .line 103
    return-void
.end method

.method public setIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "indicatorState"    # Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    .line 39
    iput-object p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    .line 40
    return-void
.end method

.method public updateValue(F)V
    .locals 3
    .param p1, "interpolatorValue"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .prologue
    .line 191
    invoke-super {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->updateValue(F)V

    .line 192
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v1, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    .line 194
    const/4 v0, 0x5

    .line 195
    .local v0, "LOCK_HEAD_DEEP":I
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    const/high16 v2, 0x40a00000    # 5.0f

    mul-float/2addr v2, p1

    iput v2, v1, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mAEAFHeadPosition:F

    .line 197
    .end local v0    # "LOCK_HEAD_DEEP":I
    :cond_0
    return-void
.end method
