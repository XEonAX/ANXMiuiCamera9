.class public Lcom/android/camera/ui/ObjectView;
.super Lcom/android/camera/ui/FrameView;
.source "ObjectView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/ObjectView$1;,
        Lcom/android/camera/ui/ObjectView$EndAction;,
        Lcom/android/camera/ui/ObjectView$Filter;,
        Lcom/android/camera/ui/ObjectView$ObjectViewListener;,
        Lcom/android/camera/ui/ObjectView$StartAction;
    }
.end annotation


# static fields
.field private static final NEAR_EDGE:I

.field private static final OBJECT_TRACKING_ICON:[I

.field private static final RECT_EDGE_WIDTH:I

.field private static final TOUCH_TOLERANCE:I

.field private static final VERTEXS_TOUCH_TOLERANCE:I


# instance fields
.field private final mDisplayBounds:Landroid/graphics/RectF;

.field private mEndAction:Ljava/lang/Runnable;

.field protected mFace:Lcom/android/camera2/CameraHardwareFace;

.field private mFace2UIMatrix:Landroid/graphics/Matrix;

.field private mFilter:Lcom/android/camera/ui/ObjectView$Filter;

.field private mHandler:Landroid/os/Handler;

.field private mLastX:F

.field private mLastY:F

.field private mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

.field private mLostTrackThreshold:I

.field private mLostTrackingNum:I

.field private mMovingMode:I

.field protected mObjectRect:Landroid/graphics/RectF;

.field protected mOldObjectRect:Landroid/graphics/RectF;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mStartAction:Ljava/lang/Runnable;

.field protected mTrackIndicator:Landroid/graphics/drawable/Drawable;

.field private mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

.field private mZoomAnimState:I


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$Filter;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/ObjectView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/ui/ObjectView;)Lcom/android/camera/ui/ObjectView$ObjectViewListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/ObjectView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/ui/ObjectView;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/ObjectView;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    return p1
.end method

.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/high16 v1, 0x420c0000    # 35.0f

    .line 60
    const/high16 v0, 0x41c80000    # 25.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    .line 61
    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    .line 62
    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    .line 65
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    sput v0, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    .line 67
    const v0, 0x7f0200d9

    .line 68
    const v1, 0x7f0200da

    .line 66
    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/FrameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    new-instance v1, Lcom/android/camera/ui/ObjectView$StartAction;

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/ObjectView$StartAction;-><init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$StartAction;)V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mStartAction:Ljava/lang/Runnable;

    .line 41
    new-instance v1, Lcom/android/camera/ui/ObjectView$EndAction;

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/ObjectView$EndAction;-><init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$EndAction;)V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mEndAction:Ljava/lang/Runnable;

    .line 74
    sget-object v1, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    array-length v1, v1

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    .line 75
    iput v4, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 78
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    .line 79
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    .line 80
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    .line 83
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    .line 90
    iput v4, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    .line 93
    new-instance v1, Lcom/android/camera/ui/ObjectView$Filter;

    invoke-direct {v1, p0, v2}, Lcom/android/camera/ui/ObjectView$Filter;-><init>(Lcom/android/camera/ui/ObjectView;Lcom/android/camera/ui/ObjectView$Filter;)V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    .line 104
    new-instance v1, Lcom/android/camera/ui/ObjectView$1;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/ObjectView$1;-><init>(Lcom/android/camera/ui/ObjectView;)V

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    .line 129
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 131
    sget-object v3, Lcom/android/camera/ui/ObjectView;->OBJECT_TRACKING_ICON:[I

    aget v3, v3, v0

    .line 130
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aput-object v2, v1, v0

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object v1, v1, v4

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 134
    return-void
.end method

.method private detectMovingStyle(FFFF)V
    .locals 8
    .param p1, "x0"    # F
    .param p2, "y0"    # F
    .param p3, "x1"    # F
    .param p4, "y1"    # F

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 375
    cmpg-float v6, p3, v7

    if-ltz v6, :cond_0

    cmpg-float v6, p4, v7

    if-gez v6, :cond_8

    .line 376
    :cond_0
    iput v5, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 378
    iget-object v6, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    sub-float v6, p1, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 379
    .local v1, "left":F
    iget-object v6, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    sub-float v6, p1, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 380
    .local v2, "right":F
    sget v6, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float v6, v6

    cmpg-float v6, v1, v6

    if-gtz v6, :cond_4

    cmpg-float v6, v1, v2

    if-gez v6, :cond_4

    .line 381
    iget v6, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 387
    :cond_1
    :goto_0
    iget-object v6, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    sub-float v6, p2, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 388
    .local v3, "top":F
    iget-object v6, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    sub-float v6, p2, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 389
    .local v0, "bottom":F
    sget v6, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float v6, v6

    cmpg-float v6, v3, v6

    if-gtz v6, :cond_5

    move v6, v4

    :goto_1
    cmpg-float v7, v3, v0

    if-gez v7, :cond_6

    :goto_2
    and-int/2addr v4, v6

    if-eqz v4, :cond_7

    .line 390
    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 v4, v4, 0x2

    iput v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 395
    :cond_2
    :goto_3
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v4, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v4

    if-eqz v4, :cond_3

    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-nez v4, :cond_3

    .line 397
    const/16 v4, 0x10

    iput v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 407
    .end local v0    # "bottom":F
    .end local v1    # "left":F
    .end local v2    # "right":F
    .end local v3    # "top":F
    :cond_3
    :goto_4
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 408
    return-void

    .line 382
    .restart local v1    # "left":F
    .restart local v2    # "right":F
    :cond_4
    sget v6, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float v6, v6

    cmpg-float v6, v2, v6

    if-gtz v6, :cond_1

    .line 383
    iget v6, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 v6, v6, 0x4

    iput v6, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    goto :goto_0

    .restart local v0    # "bottom":F
    .restart local v3    # "top":F
    :cond_5
    move v6, v5

    .line 389
    goto :goto_1

    :cond_6
    move v4, v5

    goto :goto_2

    .line 391
    :cond_7
    sget v4, Lcom/android/camera/ui/ObjectView;->TOUCH_TOLERANCE:I

    int-to-float v4, v4

    cmpg-float v4, v0, v4

    if-gtz v4, :cond_2

    .line 392
    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    or-int/lit8 v4, v4, 0x8

    iput v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    goto :goto_3

    .line 400
    .end local v0    # "bottom":F
    .end local v1    # "left":F
    .end local v2    # "right":F
    .end local v3    # "top":F
    :cond_8
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    invoke-static {p1, p3}, Ljava/lang/Math;->min(FF)F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sget v5, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_3

    .line 401
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    invoke-static {p1, p3}, Ljava/lang/Math;->max(FF)F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sget v5, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_3

    .line 402
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    invoke-static {p2, p4}, Ljava/lang/Math;->min(FF)F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sget v5, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_3

    .line 403
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    invoke-static {p2, p4}, Ljava/lang/Math;->max(FF)F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sget v5, Lcom/android/camera/ui/ObjectView;->VERTEXS_TOUCH_TOLERANCE:I

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_3

    .line 404
    const/16 v4, 0x20

    iput v4, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    goto :goto_4
.end method

.method private isInObjectViewArea(FF)Z
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v0, 0x0

    .line 298
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    sget v2, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_0

    .line 299
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    sget v2, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    cmpg-float v1, p1, v1

    if-gez v1, :cond_0

    .line 300
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    sget v2, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    cmpl-float v1, p2, v1

    if-ltz v1, :cond_0

    .line 301
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sget v2, Lcom/android/camera/ui/ObjectView;->RECT_EDGE_WIDTH:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    cmpg-float v1, p2, v1

    if-gez v1, :cond_0

    const/4 v0, 0x1

    .line 298
    :cond_0
    return v0
.end method

.method private mapRect(Landroid/graphics/RectF;Z)Landroid/graphics/RectF;
    .locals 2
    .param p1, "rect"    # Landroid/graphics/RectF;
    .param p2, "uiToDevice"    # Z

    .prologue
    .line 585
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 586
    .local v0, "result":Landroid/graphics/RectF;
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 587
    if-eqz p2, :cond_0

    .line 588
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 592
    :goto_0
    return-object v0

    .line 590
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    goto :goto_0
.end method

.method private moveObjectView(Landroid/view/MotionEvent;)V
    .locals 14
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    const/4 v10, 0x0

    const/high16 v11, 0x43480000    # 200.0f

    .line 411
    iget v8, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    const/16 v9, 0x20

    if-ne v8, v9, :cond_2

    .line 412
    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 413
    .local v4, "x0":F
    invoke-virtual {p1, v10}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 414
    .local v6, "y0":F
    invoke-virtual {p1, v13}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    .line 415
    .local v5, "x1":F
    invoke-virtual {p1, v13}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    .line 416
    .local v7, "y1":F
    sub-float v8, v5, v4

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpg-float v8, v11, v8

    if-gez v8, :cond_0

    .line 417
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->left:F

    .line 418
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->right:F

    .line 420
    :cond_0
    sub-float v8, v7, v6

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpg-float v8, v11, v8

    if-gez v8, :cond_1

    .line 421
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 422
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->bottom:F

    .line 453
    .end local v4    # "x0":F
    .end local v5    # "x1":F
    .end local v6    # "y0":F
    .end local v7    # "y1":F
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 454
    return-void

    .line 425
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    iget v9, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    sub-float v0, v8, v9

    .line 426
    .local v0, "deltaX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iget v9, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    sub-float v1, v8, v9

    .line 427
    .local v1, "deltaY":F
    iget v8, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    const/16 v9, 0x10

    if-ne v8, v9, :cond_5

    .line 429
    cmpl-float v8, v0, v12

    if-lez v8, :cond_3

    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->right:F

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    sub-float/2addr v8, v9

    invoke-static {v8, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 431
    :goto_1
    cmpl-float v8, v1, v12

    if-lez v8, :cond_4

    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->bottom:F

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v8, v9

    invoke-static {v8, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 433
    :goto_2
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v8, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    goto :goto_0

    .line 430
    :cond_3
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    sub-float/2addr v8, v9

    invoke-static {v8, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_1

    .line 432
    :cond_4
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->top:F

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    sub-float/2addr v8, v9

    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_2

    .line 436
    :cond_5
    const/high16 v3, 0x43480000    # 200.0f

    .line 437
    .local v3, "minWidth":F
    const/high16 v2, 0x43480000    # 200.0f

    .line 438
    .local v2, "minHeight":F
    iget v8, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v8, v8, 0x1

    if-eqz v8, :cond_6

    .line 439
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    add-float/2addr v9, v0

    iget-object v10, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    sub-float/2addr v10, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->left:F

    .line 441
    :cond_6
    iget v8, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v8, v8, 0x2

    if-eqz v8, :cond_7

    .line 442
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    add-float/2addr v9, v1

    iget-object v10, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v10, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->top:F

    .line 444
    :cond_7
    iget v8, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v8, v8, 0x4

    if-eqz v8, :cond_8

    .line 445
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    add-float/2addr v9, v0

    iget-object v10, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    add-float/2addr v10, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->right:F

    .line 447
    :cond_8
    iget v8, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    and-int/lit8 v8, v8, 0x8

    if-eqz v8, :cond_9

    .line 448
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v9, v1

    iget-object v10, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->top:F

    add-float/2addr v10, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    iput v9, v8, Landroid/graphics/RectF;->bottom:F

    .line 450
    :cond_9
    iget-object v8, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v8, v9}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    goto/16 :goto_0
.end method

.method private resetView()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 544
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 545
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ObjectView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 546
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 547
    invoke-virtual {p0, v3}, Lcom/android/camera/ui/ObjectView;->setScaleX(F)V

    .line 548
    invoke-virtual {p0, v3}, Lcom/android/camera/ui/ObjectView;->setScaleY(F)V

    .line 549
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 550
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 551
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 552
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 553
    return-void
.end method

.method private setMatrix()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 571
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 573
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 574
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    .line 575
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v2, v3

    .line 574
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 579
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 580
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mFace2UIMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 582
    :cond_0
    return-void
.end method

.method private updateAnimateView()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 458
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 459
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 460
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 461
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    float-to-int v2, v2

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 462
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->requestLayout()V

    .line 463
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 494
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    .line 495
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 496
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 497
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->resetView()V

    .line 498
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 499
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 500
    return-void
.end method

.method public faceExists()Z
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->isAdjusting()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getFocusRect()Landroid/graphics/RectF;
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 206
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    .line 207
    .local v0, "screenNail":Lcom/android/camera/CameraScreenNail;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 208
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    return-object v1

    .line 210
    :cond_0
    return-object v3
.end method

.method public initializeTrackView(Landroid/graphics/RectF;Z)Z
    .locals 5
    .param p1, "rectF"    # Landroid/graphics/RectF;
    .param p2, "up"    # Z

    .prologue
    const/4 v3, 0x0

    const/high16 v2, 0x43480000    # 200.0f

    const/4 v4, 0x1

    .line 276
    if-eqz p1, :cond_3

    .line 277
    const-string/jumbo v0, "counter"

    const-string/jumbo v1, "t2t_times"

    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 279
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    cmpg-float v0, v0, v2

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_1

    .line 280
    :cond_0
    return v3

    .line 282
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 283
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 287
    :goto_0
    invoke-virtual {p0, v3}, Lcom/android/camera/ui/ObjectView;->setVisibility(I)V

    .line 288
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->resume()V

    .line 289
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->requestLayout()V

    .line 290
    if-eqz p2, :cond_2

    .line 291
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 292
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 294
    :cond_2
    return v4

    .line 285
    :cond_3
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    goto :goto_0
.end method

.method public isAdjusting()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 201
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 202
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-nez v2, :cond_1

    .line 201
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 202
    goto :goto_0

    :cond_2
    move v0, v1

    .line 201
    goto :goto_0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 504
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_0

    .line 505
    const-string/jumbo v0, "ObjectView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onDraw(), mZoomAnimState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 506
    const-string/jumbo v2, ", mPause="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 506
    iget-boolean v2, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 506
    const-string/jumbo v2, " mObjectRect="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 506
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 506
    const-string/jumbo v2, " mFace="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 506
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 507
    const-string/jumbo v2, ", mTrackIndicator="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 507
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    const-string/jumbo v2, ", getWidth="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getWidth()I

    move-result v2

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    const-string/jumbo v2, ", getheight="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getHeight()I

    move-result v2

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    const-string/jumbo v2, ", mDisplayBounds="

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    .line 505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    if-eqz v0, :cond_2

    .line 513
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 515
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 517
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 518
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    neg-float v1, v1

    div-float/2addr v1, v6

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 519
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v3

    neg-float v2, v2

    div-float/2addr v2, v6

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 520
    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v4

    div-float/2addr v3, v6

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 521
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 517
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 522
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 523
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 527
    :goto_0
    return-void

    .line 525
    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ui/FrameView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x2

    const/high16 v4, -0x40800000    # -1.0f

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 306
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 307
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 308
    .local v1, "y":F
    iget-boolean v2, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    if-nez v2, :cond_1

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-nez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/ObjectView;->isInObjectViewArea(FF)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_1

    :cond_0
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    if-eqz v2, :cond_2

    .line 309
    :cond_1
    return v6

    .line 311
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 312
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 371
    :cond_3
    :goto_0
    :pswitch_0
    return v7

    .line 314
    :pswitch_1
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v7}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 315
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    if-eqz v2, :cond_6

    .line 316
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    .line 317
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-ne v2, v8, :cond_5

    .line 318
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->clearAnimation()V

    .line 320
    :cond_5
    iput v6, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 321
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {v2, v6}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    .line 323
    :cond_6
    invoke-virtual {p0, v5, v6}, Lcom/android/camera/ui/ObjectView;->initializeTrackView(Landroid/graphics/RectF;Z)Z

    .line 325
    :cond_7
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v7}, Landroid/os/Handler;->removeMessages(I)V

    .line 326
    invoke-direct {p0, v0, v1, v4, v4}, Lcom/android/camera/ui/ObjectView;->detectMovingStyle(FFFF)V

    .line 327
    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    .line 328
    iput v1, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    goto :goto_0

    .line 332
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-ne v2, v8, :cond_3

    .line 333
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/android/camera/ui/ObjectView;->detectMovingStyle(FFFF)V

    .line 335
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    const/16 v3, 0x20

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    if-eqz v2, :cond_3

    .line 336
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_8

    .line 337
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-ne v2, v8, :cond_9

    .line 338
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->clearAnimation()V

    .line 340
    :cond_9
    iput v6, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 341
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {v2, v6}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    .line 342
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ObjectView;->moveObjectView(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 348
    :pswitch_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    if-ge v2, v8, :cond_3

    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    const/16 v3, 0x20

    if-ne v2, v3, :cond_3

    .line 349
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    rsub-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    iput v2, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    .line 350
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    rsub-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iput v2, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    .line 351
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    invoke-direct {p0, v2, v3, v4, v4}, Lcom/android/camera/ui/ObjectView;->detectMovingStyle(FFFF)V

    goto/16 :goto_0

    .line 356
    :pswitch_4
    iget v2, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    if-eqz v2, :cond_a

    .line 357
    invoke-direct {p0, p1}, Lcom/android/camera/ui/ObjectView;->moveObjectView(Landroid/view/MotionEvent;)V

    .line 359
    :cond_a
    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLastX:F

    .line 360
    iput v1, p0, Lcom/android/camera/ui/ObjectView;->mLastY:F

    goto/16 :goto_0

    .line 365
    :pswitch_5
    iput v6, p0, Lcom/android/camera/ui/ObjectView;->mMovingMode:I

    .line 366
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    .line 367
    iget-object v2, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v7, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 312
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public setDisplaySize(II)V
    .locals 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 560
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 561
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->setMatrix()V

    .line 562
    return-void
.end method

.method public setObject(Lcom/android/camera2/CameraHardwareFace;)V
    .locals 11
    .param p1, "face"    # Lcom/android/camera2/CameraHardwareFace;

    .prologue
    const/4 v10, 0x0

    const/4 v5, 0x2

    const-wide v8, 0x3fd51eb851eb851fL    # 0.33

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 137
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_0

    .line 138
    const-string/jumbo v0, "ObjectView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setObject(), mZoomAnimState:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 139
    const-string/jumbo v4, " , face.rect:"

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 139
    iget-object v4, p1, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 139
    const-string/jumbo v4, " , face.score:"

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 139
    iget v4, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 140
    const-string/jumbo v4, " , face.t2tStop:"

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 140
    iget v4, p1, Lcom/android/camera2/CameraHardwareFace;->t2tStop:I

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 140
    const-string/jumbo v4, " , moving="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 140
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    iget v4, v4, Lcom/android/camera/ui/ObjectView$Filter;->mCurrentValue:I

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 141
    const-string/jumbo v4, " , mPause="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 141
    iget-boolean v4, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 141
    const-string/jumbo v4, " , visible="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 141
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getVisibility()I

    move-result v4

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 142
    const-string/jumbo v4, " , getWidth()="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 142
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getWidth()I

    move-result v4

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 142
    const-string/jumbo v4, " ,mDisplayBounds.width()="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 142
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 143
    const-string/jumbo v4, " , getHeight()="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 143
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getHeight()I

    move-result v4

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 143
    const-string/jumbo v4, " ,mDisplayBounds.height()="

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 143
    iget-object v4, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    .line 138
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-gt v0, v5, :cond_1

    .line 146
    return-void

    .line 148
    :cond_1
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_3

    .line 149
    iget v0, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    if-lt v0, v1, :cond_2

    .line 150
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 151
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->showSuccess()V

    .line 198
    :cond_2
    :goto_0
    return-void

    .line 153
    :cond_3
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v3, 0x5

    if-ne v0, v3, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mPause:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 154
    iget v0, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    if-ge v0, v1, :cond_c

    .line 155
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    if-nez v0, :cond_5

    .line 156
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v3

    sget v3, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_4

    .line 157
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v3

    sget v3, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_b

    .line 160
    :cond_4
    const/16 v0, 0x96

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    .line 165
    :cond_5
    :goto_1
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    .line 166
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    rem-int/lit8 v0, v0, 0x5

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    if-ne v0, v3, :cond_7

    .line 167
    :cond_6
    const-string/jumbo v0, "ObjectView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "lost "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " times"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_7
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    iget v3, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    if-gt v0, v3, :cond_8

    .line 170
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {v0, v1}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->stopObjectTracking(Z)V

    .line 178
    :cond_8
    :goto_2
    iget-object v0, p1, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-double v4, v0

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    int-to-double v6, v0

    div-double/2addr v4, v6

    cmpl-double v0, v4, v8

    if-gtz v0, :cond_d

    .line 179
    iget-object v0, p1, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-double v4, v0

    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    int-to-double v6, v0

    div-double/2addr v4, v6

    cmpl-double v0, v4, v8

    if-lez v0, :cond_e

    move v0, v1

    .line 178
    :goto_3
    iput-boolean v0, p0, Lcom/android/camera/ui/ObjectView;->mIsBigEnoughRect:Z

    .line 181
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    cmpl-float v0, v0, v3

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    cmpl-float v0, v0, v3

    if-eqz v0, :cond_f

    .line 182
    :cond_9
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->resetView()V

    .line 196
    :cond_a
    :goto_4
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->invalidate()V

    goto/16 :goto_0

    .line 158
    :cond_b
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, v3

    sget v3, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_4

    .line 159
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mDisplayBounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v3

    sget v3, Lcom/android/camera/ui/ObjectView;->NEAR_EDGE:I

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_4

    .line 162
    const/16 v0, 0x32

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    goto/16 :goto_1

    .line 173
    :cond_c
    iput v2, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackThreshold:I

    .line 174
    iput v2, p0, Lcom/android/camera/ui/ObjectView;->mLostTrackingNum:I

    goto :goto_2

    :cond_d
    move v0, v1

    .line 178
    goto :goto_3

    :cond_e
    move v0, v2

    .line 179
    goto :goto_3

    .line 183
    :cond_f
    if-eqz p1, :cond_10

    iget v0, p1, Lcom/android/camera2/CameraHardwareFace;->score:I

    if-lt v0, v1, :cond_10

    .line 184
    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    .line 185
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 186
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    new-instance v1, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    iget-object v3, v3, Lcom/android/camera2/CameraHardwareFace;->rect:Landroid/graphics/Rect;

    invoke-direct {v1, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-direct {p0, v1, v2}, Lcom/android/camera/ui/ObjectView;->mapRect(Landroid/graphics/RectF;Z)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 187
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mOldObjectRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mObjectRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 190
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mFilter:Lcom/android/camera/ui/ObjectView$Filter;

    iget v1, p1, Lcom/android/camera2/CameraHardwareFace;->t2tStop:I

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ObjectView$Filter;->isBecomeStable(I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 191
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    invoke-interface {v0}, Lcom/android/camera/ui/ObjectView$ObjectViewListener;->onObjectStable()V

    goto :goto_4

    .line 194
    :cond_10
    iput-object v10, p0, Lcom/android/camera/ui/ObjectView;->mFace:Lcom/android/camera2/CameraHardwareFace;

    goto :goto_4
.end method

.method public setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/android/camera/ui/ObjectView;->mListener:Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    .line 272
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 565
    iput p1, p0, Lcom/android/camera/ui/ObjectView;->mPreviewWidth:I

    .line 566
    iput p2, p0, Lcom/android/camera/ui/ObjectView;->mPreviewHeight:I

    .line 567
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->setMatrix()V

    .line 568
    return-void
.end method

.method public showFail()V
    .locals 0

    .prologue
    .line 490
    return-void
.end method

.method public showStart()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    const v4, 0x3f99999a    # 1.2f

    .line 467
    const-string/jumbo v0, "ObjectView"

    const-string/jumbo v1, "showStart()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 468
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    if-eqz v0, :cond_0

    return-void

    .line 469
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 470
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, v2

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 471
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->updateAnimateView()V

    .line 472
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ObjectView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 473
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 474
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mStartAction:Ljava/lang/Runnable;

    .line 473
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 475
    return-void
.end method

.method public showSuccess()V
    .locals 5

    .prologue
    const v4, 0x3f333333    # 0.7f

    .line 479
    const-string/jumbo v0, "ObjectView"

    const-string/jumbo v1, "showSuccess()"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    iget v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    return-void

    .line 481
    :cond_0
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/camera/ui/ObjectView;->mZoomAnimState:I

    .line 482
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackStatusIndicator:[Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    .line 483
    invoke-direct {p0}, Lcom/android/camera/ui/ObjectView;->updateAnimateView()V

    .line 484
    iget-object v0, p0, Lcom/android/camera/ui/ObjectView;->mTrackIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ObjectView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 485
    invoke-virtual {p0}, Lcom/android/camera/ui/ObjectView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v2, 0x50

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 486
    iget-object v1, p0, Lcom/android/camera/ui/ObjectView;->mEndAction:Ljava/lang/Runnable;

    .line 485
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 487
    return-void
.end method
