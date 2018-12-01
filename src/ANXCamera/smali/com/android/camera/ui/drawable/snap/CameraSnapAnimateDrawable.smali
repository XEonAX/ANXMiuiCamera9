.class public Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CameraSnapAnimateDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$1;,
        Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$LongPressIncreaseListener;
    }
.end annotation


# static fields
.field private static final mCameraDownConfig:Lcom/facebook/rebound/SpringConfig;

.field public static final mCameraUpConfig:Lcom/facebook/rebound/SpringConfig;

.field public static final mCameraUpSplashConfig:Lcom/facebook/rebound/SpringConfig;

.field public static final mRecordScaleConfig:Lcom/facebook/rebound/SpringConfig;


# instance fields
.field private mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

.field private mLongPressIncreaseListener:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$LongPressIncreaseListener;

.field private mModeChangeAnimator:Landroid/animation/ValueAnimator;

.field private mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

.field private mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

.field private mRingAnimator:Landroid/animation/ValueAnimator;

.field private mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

.field private mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

.field private mTimeAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 8

    .prologue
    const-wide v6, 0x4066800000000000L    # 180.0

    const-wide/high16 v4, 0x403e000000000000L    # 30.0

    .line 543
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    const-wide/high16 v2, 0x402e000000000000L    # 15.0

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/rebound/SpringConfig;->fromOrigamiTensionAndFriction(DD)Lcom/facebook/rebound/SpringConfig;

    move-result-object v0

    .line 542
    sput-object v0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCameraDownConfig:Lcom/facebook/rebound/SpringConfig;

    .line 548
    const-wide/high16 v0, 0x405e000000000000L    # 120.0

    invoke-static {v0, v1, v4, v5}, Lcom/facebook/rebound/SpringConfig;->fromOrigamiTensionAndFriction(DD)Lcom/facebook/rebound/SpringConfig;

    move-result-object v0

    .line 547
    sput-object v0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCameraUpConfig:Lcom/facebook/rebound/SpringConfig;

    .line 550
    invoke-static {v6, v7, v4, v5}, Lcom/facebook/rebound/SpringConfig;->fromOrigamiTensionAndFriction(DD)Lcom/facebook/rebound/SpringConfig;

    move-result-object v0

    .line 549
    sput-object v0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordScaleConfig:Lcom/facebook/rebound/SpringConfig;

    .line 552
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    invoke-static {v6, v7, v0, v1}, Lcom/facebook/rebound/SpringConfig;->fromOrigamiTensionAndFriction(DD)Lcom/facebook/rebound/SpringConfig;

    move-result-object v0

    .line 551
    sput-object v0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCameraUpSplashConfig:Lcom/facebook/rebound/SpringConfig;

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 612
    new-instance v0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$1;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mLongPressIncreaseListener:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$LongPressIncreaseListener;

    .line 43
    new-instance v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    .line 44
    new-instance v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    .line 45
    new-instance v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    .line 46
    new-instance v0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-direct {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    .line 47
    return-void
.end method


# virtual methods
.method public cancelAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 712
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 713
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 714
    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    .line 716
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 717
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 718
    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    .line 720
    :cond_1
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 70
    if-nez p1, :cond_0

    .line 71
    return-void

    .line 74
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 75
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 76
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 78
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 79
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 80
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 82
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 83
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 84
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 86
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 87
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->drawCanvas(Landroid/graphics/Canvas;)V

    .line 88
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 89
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 103
    const/4 v0, -0x1

    return v0
.end method

.method public initMode(I)V
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->initTargetValues(I)V

    .line 51
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setResult()V

    .line 52
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setResult()V

    .line 53
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setResult()V

    .line 54
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setResult()V

    .line 55
    return-void
.end method

.method public initTargetValues(I)V
    .locals 9
    .param p1, "newMode"    # I

    .prologue
    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v8, 0x0

    const/high16 v7, 0x40400000    # 3.0f

    const v6, 0x3f553f7d    # 0.833f

    const/4 v5, -0x1

    .line 482
    packed-switch p1, :pswitch_data_0

    .line 484
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v3, v5, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 485
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x41700000    # 15.0f

    const v3, 0x3f3020c5    # 0.688f

    invoke-virtual {v0, v3, v5, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setTargetValues(FIIF)V

    .line 486
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setTargetValues(FIIF)V

    .line 487
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setTargetValues(FIIF)V

    .line 521
    :goto_0
    return-void

    .line 492
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v3, v5, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 493
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x41700000    # 15.0f

    const v3, 0x3f3020c5    # 0.688f

    const v4, -0x1abd1

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setTargetValues(FIIF)V

    .line 494
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setTargetValues(FIIF)V

    .line 495
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setTargetValues(FIIF)V

    goto :goto_0

    .line 499
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v3, v5, v8, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 500
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x41700000    # 15.0f

    const v3, 0x3f181062    # 0.594f

    const v4, -0x1abd1

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setTargetValues(FIIF)V

    .line 501
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    .line 502
    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    .line 501
    invoke-virtual {v0, v6, v5, v1, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setTargetValues(FIIF)V

    .line 503
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setTargetValues(FIIF)V

    goto :goto_0

    .line 507
    :pswitch_3
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v3, v5, v8, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 508
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x41700000    # 15.0f

    const v3, 0x3f181062    # 0.594f

    const v4, -0x1abd1

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setTargetValues(FIIF)V

    .line 509
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setTargetValues(FIIF)V

    .line 510
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    .line 511
    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    .line 510
    invoke-virtual {v0, v6, v5, v1, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setTargetValues(FIIF)V

    goto :goto_0

    .line 515
    :pswitch_4
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v3, v5, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 516
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    sget v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    const/high16 v2, 0x41700000    # 15.0f

    const v3, 0x3f3020c5    # 0.688f

    const v4, -0x1abd1

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setTargetValues(FIIF)V

    .line 517
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setTargetValues(FIIF)V

    .line 518
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v0, v6, v5, v8, v7}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setTargetValues(FIIF)V

    goto/16 :goto_0

    .line 482
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 537
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    .line 538
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    .line 537
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 538
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 113
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 114
    return-void
.end method

.method public pauseRecording()V
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 382
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->pause()V

    .line 384
    :cond_0
    return-void
.end method

.method public prepareRecording(I)V
    .locals 6
    .param p1, "currentMode"    # I

    .prologue
    .line 261
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->cancelAnimation()V

    .line 262
    packed-switch p1, :pswitch_data_0

    .line 304
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    invoke-virtual {v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->prepareRecord()V

    .line 305
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->isRecording:Z

    .line 307
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 308
    .local v0, "valueAnimator":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 309
    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$7;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$7;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 320
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 321
    return-void

    .line 265
    .end local v0    # "valueAnimator":Landroid/animation/ValueAnimator;
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    iget v2, v2, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->mCurrentWidthPercent:F

    .line 266
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    iget v3, v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->mCurrentColor:I

    .line 267
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    .line 268
    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    iget v5, v5, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->mCurrentStrokeWidth:F

    .line 265
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setTargetValues(FIIF)V

    .line 270
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    goto :goto_0

    .line 275
    :pswitch_2
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    iget v2, v2, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentWidthPercent:F

    .line 276
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    iget v3, v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentColor:I

    .line 277
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    .line 278
    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    iget v5, v5, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentStrokeWidth:F

    .line 275
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setTargetValues(FIIF)V

    .line 280
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    goto :goto_0

    .line 287
    :pswitch_3
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setNeedSplit(Z)V

    .line 288
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iget v2, v2, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    .line 289
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iget v3, v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentColor:I

    .line 290
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    .line 291
    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v5

    int-to-float v5, v5

    .line 288
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 292
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    goto :goto_0

    .line 296
    :pswitch_4
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iget v2, v2, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    .line 297
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iget v3, v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentColor:I

    .line 298
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    .line 299
    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v5}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v5

    int-to-float v5, v5

    .line 296
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setTargetValues(FIIF)V

    .line 300
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    goto/16 :goto_0

    .line 262
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 307
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public resumeRecording()V
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 388
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->resume()V

    .line 390
    :cond_0
    return-void
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    .line 94
    return-void
.end method

.method public setBounds(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 108
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 109
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 99
    return-void
.end method

.method public setWidthHeight(FF)V
    .locals 5
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 58
    div-float v1, p1, v4

    .line 59
    .local v1, "middleX":F
    div-float v2, p1, v4

    .line 60
    .local v2, "middleY":F
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    div-float v0, v3, v4

    .line 62
    .local v0, "baseRadius":F
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    invoke-virtual {v3, v1, v2, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setMiddle(FFF)V

    .line 63
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    invoke-virtual {v3, v1, v2, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setMiddle(FFF)V

    .line 64
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mSecondPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;

    invoke-virtual {v3, v1, v2, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintSecond;->setMiddle(FFF)V

    .line 65
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mMotionPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;

    invoke-virtual {v3, v1, v2, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->setMiddle(FFF)V

    .line 66
    return-void
.end method

.method public start()V
    .locals 0

    .prologue
    .line 528
    return-void
.end method

.method public startModeChangeAnimation()V
    .locals 4

    .prologue
    .line 117
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    .line 118
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 119
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$2;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$2;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 133
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->setupEndValues()V

    .line 134
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mModeChangeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 135
    return-void

    .line 117
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startRecord(I)V
    .locals 4
    .param p1, "currentMode"    # I

    .prologue
    .line 330
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->cancelAnimation()V

    .line 332
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    .line 333
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 334
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$8;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$8;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 346
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 348
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$9;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$9;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 372
    const/16 v0, 0xa1

    if-eq p1, v0, :cond_0

    .line 373
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 374
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 377
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 378
    return-void

    .line 332
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startRecordAnimation(ZI)V
    .locals 0
    .param p1, "startOrStop"    # Z
    .param p2, "currentMode"    # I

    .prologue
    .line 246
    if-eqz p1, :cond_0

    .line 247
    invoke-virtual {p0, p2}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startRecord(I)V

    .line 251
    :goto_0
    return-void

    .line 249
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->stopRecord(I)V

    goto :goto_0
.end method

.method public startRingAnimation()V
    .locals 4

    .prologue
    .line 208
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->cancelAnimation()V

    .line 209
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setRingVisible(I)V

    .line 210
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setVisible(I)V

    .line 212
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    .line 213
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 214
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 215
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 216
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$6;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$6;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 226
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 227
    return-void

    .line 212
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startScaleDownAnimation()V
    .locals 6

    .prologue
    .line 138
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    .line 140
    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    iget v2, v2, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentColor:I

    .line 141
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    iget v3, v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentAlpha:I

    .line 142
    iget-object v4, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    iget v4, v4, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->mCurrentStrokeWidth:F

    .line 139
    const v5, 0x3f2209ab

    .line 138
    invoke-virtual {v1, v5, v2, v3, v4}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setTargetValues(FIIF)V

    .line 144
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 145
    .local v0, "mScaleAnimator":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 146
    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$3;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$3;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 155
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->setupEndValues()V

    .line 156
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 157
    return-void

    .line 144
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startScaleUpAnimation(JLandroid/animation/Animator$AnimatorListener;)V
    .locals 5
    .param p1, "delayTime"    # J
    .param p3, "resultListener"    # Landroid/animation/Animator$AnimatorListener;

    .prologue
    .line 160
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 161
    .local v0, "mScaleAnimator":Landroid/animation/ValueAnimator;
    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 162
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 163
    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$4;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$4;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 172
    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$5;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$5;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 197
    if-eqz p3, :cond_0

    .line 198
    invoke-virtual {v0, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 201
    :cond_0
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->setupEndValues()V

    .line 202
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 203
    return-void

    .line 160
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 533
    return-void
.end method

.method public stopRecord(I)V
    .locals 7
    .param p1, "currentMode"    # I

    .prologue
    const/4 v6, 0x2

    const/high16 v5, 0x3f800000    # 1.0f

    .line 393
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    if-nez v1, :cond_0

    .line 394
    return-void

    .line 397
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->isRecording:Z

    .line 399
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->cancelAnimation()V

    .line 401
    packed-switch p1, :pswitch_data_0

    .line 417
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v2, v2, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    .line 418
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v3, v3, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    .line 419
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    .line 420
    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v5, v5, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    .line 417
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetValues(FIIF)V

    .line 424
    :goto_0
    new-array v1, v6, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    .line 425
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x12c

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 426
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$10;

    invoke-direct {v2, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$10;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 436
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    .line 437
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$11;

    invoke-direct {v2, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$11;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 461
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mTimeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 463
    new-array v1, v6, [F

    fill-array-data v1, :array_1

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 464
    .local v0, "valueAnimator":Landroid/animation/ValueAnimator;
    const-wide/16 v2, 0x190

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 465
    new-instance v1, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$12;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable$12;-><init>(Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 475
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 476
    return-void

    .line 403
    .end local v0    # "valueAnimator":Landroid/animation/ValueAnimator;
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v2, v2, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    .line 404
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v3, v3, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    .line 405
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    .line 406
    invoke-static {v5}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v5

    int-to-float v5, v5

    .line 403
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetValues(FIIF)V

    goto :goto_0

    .line 410
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v2, v2, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    .line 411
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRecordingPaint:Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget v3, v3, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    .line 412
    sget v4, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    .line 413
    invoke-static {v5}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v5

    int-to-float v5, v5

    .line 410
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetValues(FIIF)V

    goto :goto_0

    .line 401
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 424
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 463
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public stopRingAnimation()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    if-nez v0, :cond_0

    .line 231
    return-void

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 234
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mCirclePaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setRingVisible(I)V

    .line 235
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->mRoundPaintItem:Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintRound;->setVisible(I)V

    .line 236
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->invalidateSelf()V

    .line 237
    return-void
.end method
