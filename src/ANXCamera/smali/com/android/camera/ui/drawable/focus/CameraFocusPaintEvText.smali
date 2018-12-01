.class public Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraFocusPaintEvText.java"


# instance fields
.field private final mDefaultPaintAlpha:I

.field private final mDefaultPaintColor:I

.field private final mDefaultTextSize:I

.field private mEvTextMargin:I

.field private mEvValue:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 29
    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    .line 26
    const/16 v1, 0xc0

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultPaintAlpha:I

    .line 32
    const v1, 0x1010095

    const v2, 0x1010098

    filled-new-array {v1, v2}, [I

    move-result-object v1

    .line 31
    const v2, 0x7f110007

    .line 30
    invoke-virtual {p1, v2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 33
    .local v0, "textStyle":Landroid/content/res/TypedArray;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultPaintColor:I

    .line 34
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultTextSize:I

    .line 35
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09003d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvTextMargin:I

    .line 37
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    const/4 v5, 0x0

    .line 59
    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    cmpl-float v4, v4, v5

    if-nez v4, :cond_0

    .line 60
    return-void

    .line 63
    :cond_0
    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_1

    const-string/jumbo v0, "-"

    .line 64
    .local v0, "symbol":Ljava/lang/String;
    :goto_0
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v5, "%s %.1f"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    iget v7, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "text":Ljava/lang/String;
    iget-object v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 68
    .local v1, "symbolWidth":F
    iget-object v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    .line 69
    .local v3, "textWidth":F
    iget v4, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mMiddleX:F

    div-float v5, v3, v9

    sub-float/2addr v4, v5

    div-float v5, v1, v9

    sub-float/2addr v4, v5

    .line 70
    iget v5, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mMiddleY:F

    sget v6, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvTextMargin:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    .line 69
    invoke-virtual {p1, v2, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 71
    return-void

    .line 63
    .end local v0    # "symbol":Ljava/lang/String;
    .end local v1    # "symbolWidth":F
    .end local v2    # "text":Ljava/lang/String;
    .end local v3    # "textWidth":F
    :cond_1
    const-string/jumbo v0, "+"

    .restart local v0    # "symbol":Ljava/lang/String;
    goto :goto_0
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultPaintColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 47
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mDefaultTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 48
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 49
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mPaint:Landroid/graphics/Paint;

    const/16 v1, 0xc0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 51
    return-void
.end method

.method public resetPaint()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->initPaint(Landroid/content/Context;)V

    .line 55
    return-void
.end method

.method public setEvValue(F)V
    .locals 0
    .param p1, "evValue"    # F

    .prologue
    .line 40
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->mEvValue:F

    .line 41
    return-void
.end method
