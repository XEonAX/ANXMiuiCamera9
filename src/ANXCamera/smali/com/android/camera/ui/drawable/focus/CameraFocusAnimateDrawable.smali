.class public Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CameraFocusAnimateDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$PendingState;
    }
.end annotation


# static fields
.field public static BIG_RADIUS:I

.field public static CENTER_BASE_RADIUS:I


# instance fields
.field private mEvAdjustVisible:I

.field private mFocusingAnimator:Landroid/animation/ValueAnimator;

.field private mIsTouchFocus:Z

.field private mMiddleX:F

.field private mMiddleY:F

.field private mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

.field private mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

.field private mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

.field private mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

.field private mResetCenterAnimator:Landroid/animation/ValueAnimator;

.field private mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

.field private mSuccessFlag:I

.field private mTouchDownAnimator:Landroid/animation/ValueAnimator;

.field private pendingState:I
    .annotation build Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$PendingState;
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mIsTouchFocus:Z

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)Landroid/animation/ValueAnimator;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->pendingState:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;Landroid/animation/ValueAnimator;)Landroid/animation/ValueAnimator;
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;
    .param p1, "-value"    # Landroid/animation/ValueAnimator;

    .prologue
    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    return-object p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startFocusingAnimation()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v0, -0x40800000    # -1.0f

    const/4 v4, -0x1

    const/high16 v3, 0x3f800000    # 1.0f

    .line 100
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 97
    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mMiddleX:F

    .line 98
    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mMiddleY:F

    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900a1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    .line 102
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900a2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->CENTER_BASE_RADIUS:I

    .line 104
    new-instance v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    .line 105
    new-instance v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    .line 106
    new-instance v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    .line 107
    new-instance v0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    .line 109
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    const/16 v2, 0xcd

    invoke-virtual {v0, v3, v4, v2, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->setTargetValues(FIIF)V

    .line 110
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setTargetValues(FIIF)V

    .line 111
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    invoke-static {v3}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setTargetValues(FIIF)V

    .line 112
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    const v1, 0x3fa66666    # 1.3f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    const/16 v2, 0xf0

    invoke-virtual {v0, v3, v4, v2, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setTargetValues(FIIF)V

    .line 114
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->setResult()V

    .line 115
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setResult()V

    .line 116
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setResult()V

    .line 117
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setResult()V

    .line 118
    return-void
.end method

.method private cancelSuccessAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 621
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 622
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 624
    :cond_0
    iput-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    .line 625
    return-void
.end method

.method private isAnimatorRunning(Landroid/animation/Animator;)Z
    .locals 1
    .param p1, "animator"    # Landroid/animation/Animator;

    .prologue
    .line 676
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private start3ALockSuccessAnimation()V
    .locals 12

    .prologue
    const/high16 v11, 0x3e800000    # 0.25f

    const v10, 0x3dcccccd    # 0.1f

    const-wide/16 v8, 0xc8

    const/4 v7, 0x0

    const/4 v6, 0x2

    .line 468
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    .line 471
    iget-boolean v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mIsTouchFocus:Z

    if-eqz v3, :cond_0

    .line 472
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v3, v7}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setVisible(I)V

    .line 474
    :cond_0
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    const/high16 v4, 0x40200000    # 2.5f

    invoke-static {v4}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setStartOffsetY(F)V

    .line 475
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v3, v7}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v3

    const/16 v4, 0xff

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 479
    new-array v3, v6, [F

    fill-array-data v3, :array_0

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 480
    .local v0, "circleFirstAnimation":Landroid/animation/ValueAnimator;
    invoke-virtual {v0, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 481
    new-instance v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$7;

    invoke-direct {v3, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$7;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 491
    new-instance v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$8;

    invoke-direct {v3, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$8;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 501
    new-array v3, v6, [F

    fill-array-data v3, :array_1

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    .line 502
    .local v1, "circleSecondAnimation":Landroid/animation/ValueAnimator;
    invoke-virtual {v1, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 503
    invoke-virtual {v1, v8, v9}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 504
    new-instance v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$9;

    invoke-direct {v3, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$9;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 515
    new-instance v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$10;

    invoke-direct {v3, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$10;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 526
    new-array v3, v6, [F

    fill-array-data v3, :array_2

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    .line 527
    .local v2, "lockAnimation":Landroid/animation/ValueAnimator;
    const-wide/16 v4, 0x12c

    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 528
    const-wide/16 v4, 0x190

    invoke-virtual {v2, v4, v5}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 529
    new-instance v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$11;

    invoke-direct {v3, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$11;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 539
    new-instance v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$12;

    invoke-direct {v3, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$12;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 551
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/Animator;

    aput-object v0, v4, v7

    const/4 v5, 0x1

    aput-object v1, v4, v5

    aput-object v2, v4, v6

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 552
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v4, Landroid/view/animation/PathInterpolator;

    invoke-direct {v4, v11, v10, v11, v10}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 553
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v4, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$13;

    invoke-direct {v4, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$13;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 568
    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 569
    return-void

    .line 479
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 501
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 526
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private startFocusingAnimation()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 299
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 301
    new-array v0, v4, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    .line 302
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 303
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 304
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 305
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 307
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$3;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$3;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 317
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$4;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$4;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 351
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 352
    return-void

    .line 301
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f733333    # 0.95f
    .end array-data
.end method

.method private startNormalFocusSuccessAnimation()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 393
    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mIsTouchFocus:Z

    if-eqz v1, :cond_0

    .line 394
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setVisible(I)V

    .line 396
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    const/high16 v2, 0x40200000    # 2.5f

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setStartOffsetY(F)V

    .line 397
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v1

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 399
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 400
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    const v2, 0x3f59999a    # 0.85f

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 402
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 403
    .local v0, "successAnimation":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 404
    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$5;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$5;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 416
    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$6;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$6;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 446
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 447
    return-void

    .line 402
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public cancelFocusingAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 614
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 615
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 617
    :cond_0
    iput-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    .line 618
    return-void
.end method

.method public cancelResetCenter()V
    .locals 1

    .prologue
    .line 670
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mResetCenterAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mResetCenterAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 671
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mResetCenterAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 673
    :cond_0
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/high16 v1, -0x40800000    # -1.0f

    .line 186
    if-nez p1, :cond_0

    .line 187
    return-void

    .line 190
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mMiddleX:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mMiddleY:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    .line 191
    :cond_1
    return-void

    .line 194
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 195
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 196
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 198
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 199
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 201
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 203
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mEvAdjustVisible:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_3

    .line 204
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 205
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 206
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 209
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 210
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    .line 211
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    const v1, 0xffcc00

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 212
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    const/16 v1, 0xc0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 216
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 217
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 218
    return-void

    .line 214
    :cond_4
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->resetPaint()V

    goto :goto_0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 692
    const/4 v0, -0x1

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public reset()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 154
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setShowLine(Z)V

    .line 155
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setDistanceY(F)V

    .line 156
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setEvValue(F)V

    .line 157
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setEvValue(F)V

    .line 158
    return-void
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0xffL
        .end annotation
    .end param

    .prologue
    .line 683
    return-void
.end method

.method public setCenter(II)V
    .locals 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 138
    int-to-float v0, p1

    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mMiddleX:F

    .line 139
    int-to-float v0, p2

    iput v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mMiddleY:F

    .line 141
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    int-to-float v1, p1

    int-to-float v2, p2

    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->setMiddle(FFF)V

    .line 143
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    int-to-float v1, p1

    int-to-float v2, p2

    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setMiddle(FFF)V

    .line 144
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setShowLine(Z)V

    .line 145
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setVisible(I)V

    .line 147
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    int-to-float v1, p1

    int-to-float v2, p2

    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->BIG_RADIUS:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setMiddle(FFF)V

    .line 149
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setCenterFlag(I)V

    .line 150
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    int-to-float v1, p1

    int-to-float v2, p2

    sget v3, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->CENTER_BASE_RADIUS:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setMiddle(FFF)V

    .line 151
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 688
    return-void
.end method

.method public setEvAdjustVisible(I)V
    .locals 0
    .param p1, "visible"    # I

    .prologue
    .line 165
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mEvAdjustVisible:I

    .line 166
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->invalidateSelf()V

    .line 167
    return-void
.end method

.method public setEvChanged(FF)V
    .locals 2
    .param p1, "distanceY"    # F
    .param p2, "evValue"    # F

    .prologue
    .line 605
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, p2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setEvValue(F)V

    .line 606
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setShowLine(Z)V

    .line 607
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setDistanceY(F)V

    .line 609
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-virtual {v0, p2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setEvValue(F)V

    .line 610
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->invalidateSelf()V

    .line 611
    return-void
.end method

.method public setEvTextVisible(I)V
    .locals 1
    .param p1, "visible"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvText:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvText;->setVisible(I)V

    .line 162
    return-void
.end method

.method public setIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "indicatorState"    # Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;)V

    .line 122
    return-void
.end method

.method public setLockIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "indicatorState"    # Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;
    .param p2, "head"    # Landroid/graphics/Bitmap;
    .param p3, "body"    # Landroid/graphics/Bitmap;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setAEAFIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 126
    return-void
.end method

.method public setOrientation(I)V
    .locals 1
    .param p1, "orientation"    # I

    .prologue
    .line 133
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setOrientation(I)V

    .line 134
    return-void
.end method

.method public setRtlAndDisplayRect(ZLandroid/graphics/Rect;)V
    .locals 1
    .param p1, "rtl"    # Z
    .param p2, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setRtlAndDisplayRect(ZLandroid/graphics/Rect;)V

    .line 130
    return-void
.end method

.method public start()V
    .locals 0

    .prologue
    .line 172
    return-void
.end method

.method public startFocusFailAnimation()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 572
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 574
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->isAnimatorRunning(Landroid/animation/Animator;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 575
    const/4 v1, 0x3

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->pendingState:I

    .line 576
    return-void

    .line 579
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->isAnimatorRunning(Landroid/animation/Animator;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 580
    const/4 v1, 0x4

    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->pendingState:I

    .line 581
    return-void

    .line 584
    :cond_1
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 585
    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    const v2, 0x3f733333    # 0.95f

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 587
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 588
    .local v0, "failAnimation":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 589
    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$14;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 601
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 602
    return-void

    .line 587
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startFocusSuccessAnimation(IZ)V
    .locals 4
    .param p1, "successFlag"    # I
    .param p2, "isTouchFocus"    # Z

    .prologue
    const/4 v3, 0x5

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 356
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 358
    iput p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    .line 359
    iput-boolean p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mIsTouchFocus:Z

    .line 361
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mIsTouchFocus:Z

    if-nez v0, :cond_0

    .line 362
    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->isAnimatorRunning(Landroid/animation/Animator;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 366
    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->pendingState:I

    .line 367
    return-void

    .line 370
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->isAnimatorRunning(Landroid/animation/Animator;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 371
    iput v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->pendingState:I

    .line 372
    return-void

    .line 376
    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->getVisible()I

    move-result v0

    if-nez v0, :cond_3

    .line 377
    return-void

    .line 380
    :cond_3
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    if-eq v0, v2, :cond_4

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    if-ne v0, v3, :cond_5

    .line 381
    :cond_4
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setCenterFlag(I)V

    .line 384
    :cond_5
    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mSuccessFlag:I

    if-ne v0, v3, :cond_6

    .line 385
    invoke-direct {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->start3ALockSuccessAnimation()V

    .line 389
    :goto_0
    return-void

    .line 387
    :cond_6
    invoke-direct {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->startNormalFocusSuccessAnimation()V

    goto :goto_0
.end method

.method public startTouchDownAnimation()V
    .locals 4

    .prologue
    const/4 v1, -0x1

    .line 222
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelFocusingAnimation()V

    .line 223
    invoke-direct {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelSuccessAnimation()V

    .line 224
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->cancelResetCenter()V

    .line 225
    iput v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->pendingState:I

    .line 227
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->isAnimatorRunning(Landroid/animation/Animator;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 228
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 229
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    .line 232
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintBigCircle:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintBigCircle;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 233
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintCenterIndicator:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 234
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mPaintEvAdjust:Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintEvAdjust;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    .line 236
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    .line 237
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 238
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$1;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$1;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 250
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$2;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable$2;-><init>(Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 295
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusAnimateDrawable;->mTouchDownAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 296
    return-void

    .line 236
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 177
    return-void
.end method
