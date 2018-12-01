.class public Lcom/android/camera/ui/PanoMovingIndicatorView;
.super Landroid/view/View;
.source "PanoMovingIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/PanoMovingIndicatorView$1;,
        Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;
    }
.end annotation


# static fields
.field private static final MAX_GAP:I

.field private static final SPEED_DEVIATION:I

.field private static final STONE_WIDTH:I

.field public static final TAG:Ljava/lang/String;

.field private static sBlockWidth:[I

.field private static sGapWidth:[I

.field private static sTimesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mArrowMargin:I

.field private mCurrentFramePos:Landroid/graphics/Point;

.field private mDirection:I

.field private mDisplayCenterY:I

.field private mFast:Z

.field private mFilterMoveSpeed:I

.field private mHalfStoneHeight:I

.field private mHandler:Landroid/os/Handler;

.field private mLatestSpeed:I

.field private mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

.field private mOffsetX:I

.field private mPointGap:F

.field private mPreviewCenterY:I

.field private mStateChangeTrigger:Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mTailPaint:Landroid/graphics/Paint;


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/PanoMovingIndicatorView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/PanoMovingIndicatorView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mLatestSpeed:I

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/ui/PanoMovingIndicatorView;)F
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/PanoMovingIndicatorView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    return v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/ui/PanoMovingIndicatorView;I)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/PanoMovingIndicatorView;
    .param p1, "speed"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->getPointGap(I)I

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/ui/PanoMovingIndicatorView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/PanoMovingIndicatorView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->applyNewGap()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/ui/PanoMovingIndicatorView;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/PanoMovingIndicatorView;
    .param p1, "moveSpeed"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->filterSpeed(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 27
    const-class v0, Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    .line 28
    const/high16 v0, 0x40c00000    # 6.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->MAX_GAP:I

    .line 29
    const v0, 0x412ab852    # 10.67f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->STONE_WIDTH:I

    .line 36
    sget v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->MAX_GAP:I

    const/16 v1, 0xb58

    div-int v0, v1, v0

    .line 35
    sput v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->SPEED_DEVIATION:I

    .line 56
    new-array v0, v6, [I

    .line 57
    const v1, 0x3f2b851f    # 0.67f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v3

    invoke-static {v5}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v2

    const v1, 0x4055c28f    # 3.34f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v4

    .line 56
    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sBlockWidth:[I

    .line 59
    new-array v0, v6, [I

    .line 60
    const v1, 0x402ae148    # 2.67f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v3

    invoke-static {v5}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v2

    const v1, 0x3fab851f    # 1.34f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    aput v1, v0, v4

    .line 59
    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sGapWidth:[I

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    .line 65
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    .line 47
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 48
    const v1, 0x7f09000e

    .line 47
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 46
    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mArrowMargin:I

    .line 50
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    .line 70
    new-instance v0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sget-object v2, Lcom/android/camera/ui/PanoMovingIndicatorView;->sTimesMap:Ljava/util/HashMap;

    invoke-direct {v0, p0, v1, v2}, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;-><init>(Lcom/android/camera/ui/PanoMovingIndicatorView;Ljava/lang/Object;Ljava/util/HashMap;)V

    .line 69
    iput-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mStateChangeTrigger:Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;

    .line 71
    new-instance v0, Lcom/android/camera/ui/PanoMovingIndicatorView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/PanoMovingIndicatorView$1;-><init>(Lcom/android/camera/ui/PanoMovingIndicatorView;)V

    iput-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHandler:Landroid/os/Handler;

    .line 87
    new-instance v0, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    invoke-direct {v0}, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    .line 88
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 89
    const v2, 0x7f09000f

    .line 88
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->setWidth(I)V

    .line 90
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 91
    const v2, 0x7f090010

    .line 90
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;->setHeight(I)V

    .line 93
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    .line 94
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090011

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    .line 96
    return-void
.end method

.method private applyNewGap()V
    .locals 1

    .prologue
    .line 191
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->getPointGap(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    .line 192
    invoke-virtual {p0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->invalidate()V

    .line 193
    return-void
.end method

.method private filterSpeed(I)V
    .locals 3
    .param p1, "moveSpeed"    # I

    .prologue
    .line 200
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    int-to-float v0, v0

    const v1, 0x3f666666    # 0.9f

    mul-float/2addr v0, v1

    .line 201
    int-to-float v1, p1

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v1, v2

    .line 200
    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    .line 202
    return-void
.end method

.method private getPointGap(I)I
    .locals 4
    .param p1, "speed"    # I

    .prologue
    .line 182
    const/4 v0, -0x1

    .line 183
    .local v0, "pointGap":I
    const/16 v1, 0x1000

    if-le p1, v1, :cond_0

    .line 184
    sget v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->MAX_GAP:I

    add-int/lit16 v2, p1, -0x1000

    sget v3, Lcom/android/camera/ui/PanoMovingIndicatorView;->SPEED_DEVIATION:I

    add-int/2addr v2, v3

    mul-int/2addr v1, v2

    div-int/lit16 v0, v1, 0xb58

    .line 187
    :cond_0
    return v0
.end method


# virtual methods
.method public isFar()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 205
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    if-nez v0, :cond_1

    .line 206
    :cond_0
    return v3

    .line 208
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    iget v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    int-to-float v1, v1

    const/high16 v2, 0x3e800000    # 0.25f

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_2

    .line 209
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "too far current relative y is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " refy is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    const/4 v0, 0x1

    return v0

    .line 212
    :cond_2
    return v3
.end method

.method public isTooFast()Z
    .locals 2

    .prologue
    .line 196
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v4, -0x80000000

    const/4 v13, 0x1

    const/4 v3, 0x0

    .line 100
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onDraw mPointGap="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    if-eq v0, v4, :cond_0

    .line 102
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    if-ne v0, v4, :cond_1

    :cond_0
    return-void

    .line 104
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v12, v0, Landroid/graphics/Point;->x:I

    .line 105
    .local v12, "narrowStartX":I
    iget v11, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mArrowMargin:I

    .line 106
    .local v11, "margin":I
    iget-object v7, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mMovingDirectionIc:Lcom/android/camera/ui/drawable/TriangleIndicatorDrawable;

    .line 107
    .local v7, "drawable":Landroid/graphics/drawable/Drawable;
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-nez v0, :cond_4

    .line 108
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mOffsetX:I

    add-int/2addr v0, v11

    add-int/2addr v12, v0

    .line 113
    :cond_2
    :goto_0
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDisplayCenterY:I

    iget-object v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    sub-int v6, v0, v1

    .line 115
    .local v6, "centerY":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 116
    int-to-float v0, v12

    int-to-float v1, v6

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 117
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-ne v13, v0, :cond_3

    .line 118
    const/high16 v0, 0x43340000    # 180.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 120
    :cond_3
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    neg-int v10, v0

    .line 122
    .local v10, "left":I
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    .line 123
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 122
    invoke-virtual {v7, v10, v0, v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 124
    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 126
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 128
    int-to-float v0, v10

    sget v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->STONE_WIDTH:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    add-float/2addr v1, v2

    sub-float/2addr v0, v1

    float-to-int v10, v0

    .line 129
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    float-to-int v8, v0

    .line 130
    .local v8, "gap":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sGapWidth:[I

    array-length v0, v0

    if-ge v9, v0, :cond_6

    if-lez v8, :cond_6

    .line 131
    int-to-float v1, v10

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    neg-int v0, v0

    int-to-float v2, v0

    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sBlockWidth:[I

    aget v0, v0, v9

    add-int/2addr v0, v10

    int-to-float v3, v0

    .line 132
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 131
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 133
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sBlockWidth:[I

    aget v0, v0, v9

    add-int/2addr v10, v0

    .line 134
    sget-object v0, Lcom/android/camera/ui/PanoMovingIndicatorView;->sGapWidth:[I

    aget v0, v0, v9

    if-lt v8, v0, :cond_5

    .line 135
    add-int/lit8 v10, v10, 0x8

    .line 136
    add-int/lit8 v8, v8, -0x8

    .line 130
    :goto_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 109
    .end local v6    # "centerY":I
    .end local v8    # "gap":I
    .end local v9    # "i":I
    .end local v10    # "left":I
    :cond_4
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-ne v13, v0, :cond_2

    .line 110
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mOffsetX:I

    add-int/2addr v0, v11

    sub-int/2addr v12, v0

    goto :goto_0

    .line 138
    .restart local v6    # "centerY":I
    .restart local v8    # "gap":I
    .restart local v9    # "i":I
    .restart local v10    # "left":I
    :cond_5
    add-int/2addr v10, v8

    .line 139
    const/4 v8, 0x0

    goto :goto_2

    .line 142
    :cond_6
    int-to-float v1, v10

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    neg-int v0, v0

    int-to-float v2, v0

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    neg-int v0, v0

    int-to-float v3, v0

    .line 143
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHalfStoneHeight:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mTailPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 142
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 145
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    if-ne v13, v0, :cond_7

    .line 146
    const/high16 v0, -0x3ccc0000    # -180.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 147
    :cond_7
    neg-int v0, v12

    int-to-float v0, v0

    neg-int v1, v6

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 148
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 149
    return-void
.end method

.method public setDisplayCenterY(I)V
    .locals 0
    .param p1, "centerY"    # I

    .prologue
    .line 178
    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDisplayCenterY:I

    .line 179
    return-void
.end method

.method public setMovingAttribute(III)V
    .locals 3
    .param p1, "direction"    # I
    .param p2, "offsetX"    # I
    .param p3, "offsetY"    # I

    .prologue
    const/high16 v2, -0x80000000

    .line 158
    and-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mDirection:I

    .line 159
    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mOffsetX:I

    .line 160
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFast:Z

    .line 161
    const/16 v0, 0x1000

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFilterMoveSpeed:I

    .line 162
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mStateChangeTrigger:Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;

    iget-boolean v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mFast:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->setCurrentState(Ljava/lang/Object;)V

    .line 163
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    invoke-virtual {v0, v2, v2}, Landroid/graphics/Point;->set(II)V

    .line 164
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    .line 165
    return-void
.end method

.method public setPosition(Landroid/graphics/Point;I)V
    .locals 3
    .param p1, "attachedPos"    # Landroid/graphics/Point;
    .param p2, "previewRefY"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mCurrentFramePos:Landroid/graphics/Point;

    iget v1, p1, Landroid/graphics/Point;->x:I

    iget v2, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Point;->set(II)V

    .line 153
    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPreviewCenterY:I

    .line 154
    invoke-virtual {p0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->invalidate()V

    .line 155
    return-void
.end method

.method public setTooFast(ZI)V
    .locals 5
    .param p1, "tooFast"    # Z
    .param p2, "moveSpeed"    # I

    .prologue
    const/16 v0, 0x1b58

    const/4 v4, 0x1

    .line 168
    sget-object v1, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setTooFast moveSpeed="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " fastFlag:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    if-le p2, v0, :cond_0

    move p2, v0

    .end local p2    # "moveSpeed":I
    :cond_0
    iput p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mLatestSpeed:I

    .line 171
    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mLatestSpeed:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->getPointGap(I)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mPointGap:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    .line 172
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 171
    if-eqz v0, :cond_1

    .line 173
    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 175
    :cond_1
    return-void
.end method
