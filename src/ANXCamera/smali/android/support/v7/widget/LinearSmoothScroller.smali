.class public abstract Landroid/support/v7/widget/LinearSmoothScroller;
.super Landroid/support/v7/widget/RecyclerView$SmoothScroller;
.source "LinearSmoothScroller.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final MILLISECONDS_PER_INCH:F = 25.0f

.field public static final SNAP_TO_ANY:I = 0x0

.field public static final SNAP_TO_END:I = 0x1

.field public static final SNAP_TO_START:I = -0x1

.field private static final TAG:Ljava/lang/String; = "LinearSmoothScroller"

.field private static final TARGET_SEEK_EXTRA_SCROLL_RATIO:F = 1.2f

.field private static final TARGET_SEEK_SCROLL_DISTANCE_PX:I = 0x2710


# instance fields
.field private final MILLISECONDS_PER_PX:F

.field protected final mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field protected mInterimTargetDx:I

.field protected mInterimTargetDy:I

.field protected final mLinearInterpolator:Landroid/view/animation/LinearInterpolator;

.field protected mTargetVector:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 90
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;-><init>()V

    .line 78
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mLinearInterpolator:Landroid/view/animation/LinearInterpolator;

    .line 80
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 88
    iput v1, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    iput v1, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    .line 91
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->MILLISECONDS_PER_PX:F

    .line 92
    return-void
.end method

.method private clampApplyScroll(II)I
    .registers 7
    .param p1, "tmpDt"    # I
    .param p2, "dt"    # I

    .prologue
    const/4 v3, 0x0

    .line 251
    move v0, p1

    .line 252
    .local v0, "before":I
    sub-int v1, p1, p2

    .line 253
    .end local p1    # "tmpDt":I
    .local v1, "tmpDt":I
    mul-int v2, p1, v1

    if-lez v2, :cond_9

    .line 256
    return v1

    .line 254
    :cond_9
    return v3
.end method


# virtual methods
.method public calculateDtToFit(IIIII)I
    .registers 10
    .param p1, "viewStart"    # I
    .param p2, "viewEnd"    # I
    .param p3, "boxStart"    # I
    .param p4, "boxEnd"    # I
    .param p5, "snapPreference"    # I

    .prologue
    const/4 v2, 0x0

    .line 265
    packed-switch p5, :pswitch_data_1e

    .line 281
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "snap preference should be one of the constants defined in SmoothScroller, starting with SNAP_"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 267
    :pswitch_d
    sub-int v2, p3, p1

    return v2

    .line 269
    :pswitch_10
    sub-int v2, p4, p2

    return v2

    .line 271
    :pswitch_13
    sub-int v1, p3, p1

    .line 272
    .local v1, "dtStart":I
    if-gtz v1, :cond_1c

    .line 275
    sub-int v0, p4, p2

    .line 276
    .local v0, "dtEnd":I
    if-ltz v0, :cond_1d

    .line 284
    return v2

    .line 273
    .end local v0    # "dtEnd":I
    :cond_1c
    return v1

    .line 277
    .restart local v0    # "dtEnd":I
    :cond_1d
    return v0

    .line 265
    :pswitch_data_1e
    .packed-switch -0x1
        :pswitch_d
        :pswitch_13
        :pswitch_10
    .end packed-switch
.end method

.method public calculateDxToMakeVisible(Landroid/view/View;I)I
    .registers 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "snapPreference"    # I

    .prologue
    const/4 v5, 0x0

    .line 324
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v6

    .line 325
    .local v6, "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 328
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 330
    .local v7, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {v6, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedLeft(Landroid/view/View;)I

    move-result v0

    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int v1, v0, v5

    .line 331
    .local v1, "left":I
    invoke-virtual {v6, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedRight(Landroid/view/View;)I

    move-result v0

    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int v2, v0, v5

    .line 332
    .local v2, "right":I
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getPaddingLeft()I

    move-result v3

    .line 333
    .local v3, "start":I
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getPaddingRight()I

    move-result v5

    sub-int v4, v0, v5

    .local v4, "end":I
    move-object v0, p0

    move v5, p2

    .line 334
    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateDtToFit(IIIII)I

    move-result v0

    return v0

    .line 326
    .end local v1    # "left":I
    .end local v2    # "right":I
    .end local v3    # "start":I
    .end local v4    # "end":I
    .end local v7    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_36
    return v5
.end method

.method public calculateDyToMakeVisible(Landroid/view/View;I)I
    .registers 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "snapPreference"    # I

    .prologue
    const/4 v5, 0x0

    .line 299
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v6

    .line 300
    .local v6, "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 303
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 305
    .local v7, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {v6, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int v1, v0, v5

    .line 306
    .local v1, "top":I
    invoke-virtual {v6, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    iget v5, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int v2, v0, v5

    .line 307
    .local v2, "bottom":I
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getPaddingTop()I

    move-result v3

    .line 308
    .local v3, "start":I
    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getHeight()I

    move-result v0

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getPaddingBottom()I

    move-result v5

    sub-int v4, v0, v5

    .local v4, "end":I
    move-object v0, p0

    move v5, p2

    .line 309
    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateDtToFit(IIIII)I

    move-result v0

    return v0

    .line 301
    .end local v1    # "top":I
    .end local v2    # "bottom":I
    .end local v3    # "start":I
    .end local v4    # "end":I
    .end local v7    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_36
    return v5
.end method

.method protected calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .registers 4
    .param p1, "displayMetrics"    # Landroid/util/DisplayMetrics;

    .prologue
    .line 156
    iget v0, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v0, v0

    const/high16 v1, 0x41c80000    # 25.0f

    div-float v0, v1, v0

    return v0
.end method

.method protected calculateTimeForDeceleration(I)I
    .registers 6
    .param p1, "dx"    # I

    .prologue
    .line 173
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateTimeForScrolling(I)I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x3fd57a786c22680aL    # 0.3356

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method

.method protected calculateTimeForScrolling(I)I
    .registers 4
    .param p1, "dx"    # I

    .prologue
    .line 187
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Landroid/support/v7/widget/LinearSmoothScroller;->MILLISECONDS_PER_PX:F

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method

.method public abstract computeScrollVectorForPosition(I)Landroid/graphics/PointF;
.end method

.method protected getHorizontalSnapPreference()I
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 200
    iget-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    :cond_5
    const/4 v0, 0x0

    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_19

    const/4 v0, 0x1

    goto :goto_6

    :cond_19
    const/4 v0, -0x1

    goto :goto_6
.end method

.method protected getVerticalSnapPreference()I
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 214
    iget-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    :cond_5
    const/4 v0, 0x0

    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_19

    const/4 v0, 0x1

    goto :goto_6

    :cond_19
    const/4 v0, -0x1

    goto :goto_6
.end method

.method protected onSeekTargetStep(IILandroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V
    .registers 6
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p4, "action"    # Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    .prologue
    .line 121
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_1b

    .line 130
    iget v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    invoke-direct {p0, v0, p1}, Landroid/support/v7/widget/LinearSmoothScroller;->clampApplyScroll(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    .line 131
    iget v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    invoke-direct {p0, v0, p2}, Landroid/support/v7/widget/LinearSmoothScroller;->clampApplyScroll(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    .line 133
    iget v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    if-eqz v0, :cond_1f

    .line 137
    :cond_1a
    :goto_1a
    return-void

    .line 122
    :cond_1b
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    .line 123
    return-void

    .line 133
    :cond_1f
    iget v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    if-nez v0, :cond_1a

    .line 134
    invoke-virtual {p0, p4}, Landroid/support/v7/widget/LinearSmoothScroller;->updateActionForInterimTarget(Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V

    goto :goto_1a
.end method

.method protected onStart()V
    .registers 1

    .prologue
    .line 100
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 144
    iput v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    iput v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    .line 145
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    .line 146
    return-void
.end method

.method protected onTargetFound(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V
    .registers 11
    .param p1, "targetView"    # Landroid/view/View;
    .param p2, "state"    # Landroid/support/v7/widget/RecyclerView$State;
    .param p3, "action"    # Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    .prologue
    .line 107
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearSmoothScroller;->getHorizontalSnapPreference()I

    move-result v4

    invoke-virtual {p0, p1, v4}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateDxToMakeVisible(Landroid/view/View;I)I

    move-result v1

    .line 108
    .local v1, "dx":I
    invoke-virtual {p0}, Landroid/support/v7/widget/LinearSmoothScroller;->getVerticalSnapPreference()I

    move-result v4

    invoke-virtual {p0, p1, v4}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateDyToMakeVisible(Landroid/view/View;I)I

    move-result v2

    .line 109
    .local v2, "dy":I
    mul-int v4, v1, v1

    mul-int v5, v2, v2

    add-int/2addr v4, v5

    int-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-int v0, v4

    .line 110
    .local v0, "distance":I
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateTimeForDeceleration(I)I

    move-result v3

    .line 111
    .local v3, "time":I
    if-gtz v3, :cond_22

    .line 114
    :goto_21
    return-void

    .line 112
    :cond_22
    neg-int v4, v1

    neg-int v5, v2

    iget-object v6, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, v4, v5, v3, v6}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->update(IIILandroid/view/animation/Interpolator;)V

    goto :goto_21
.end method

.method protected updateActionForInterimTarget(Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;)V
    .registers 9
    .param p1, "action"    # Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;

    .prologue
    const v5, 0x461c4000    # 10000.0f

    const/4 v4, 0x0

    const v6, 0x3f99999a    # 1.2f

    .line 226
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getTargetPosition()I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/LinearSmoothScroller;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    move-result-object v0

    .line 227
    .local v0, "scrollVector":Landroid/graphics/PointF;
    if-nez v0, :cond_25

    .line 228
    :cond_11
    const-string/jumbo v3, "LinearSmoothScroller"

    const-string/jumbo v4, "To support smooth scrolling, you should override \nLayoutManager#computeScrollVectorForPosition.\nFalling back to instant scroll"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getTargetPosition()I

    move-result v1

    .line 232
    .local v1, "target":I
    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->jumpTo(I)V

    .line 233
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    .line 234
    return-void

    .line 227
    .end local v1    # "target":I
    :cond_25
    iget v3, v0, Landroid/graphics/PointF;->x:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_31

    iget v3, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_11

    .line 236
    :cond_31
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->normalize(Landroid/graphics/PointF;)V

    .line 237
    iput-object v0, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mTargetVector:Landroid/graphics/PointF;

    .line 239
    iget v3, v0, Landroid/graphics/PointF;->x:F

    mul-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    .line 240
    iget v3, v0, Landroid/graphics/PointF;->y:F

    mul-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    .line 241
    const/16 v3, 0x2710

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/LinearSmoothScroller;->calculateTimeForScrolling(I)I

    move-result v2

    .line 245
    .local v2, "time":I
    iget v3, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDx:I

    int-to-float v3, v3

    mul-float/2addr v3, v6

    float-to-int v3, v3

    iget v4, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mInterimTargetDy:I

    int-to-float v4, v4

    mul-float/2addr v4, v6

    float-to-int v4, v4

    int-to-float v5, v2

    mul-float/2addr v5, v6

    float-to-int v5, v5

    iget-object v6, p0, Landroid/support/v7/widget/LinearSmoothScroller;->mLinearInterpolator:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->update(IIILandroid/view/animation/Interpolator;)V

    .line 248
    return-void
.end method
