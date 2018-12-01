.class public Lcom/android/camera/fragment/FragmentBottomPopupTips;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBottomPopupTips.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBottomPopupTips$1;,
        Lcom/android/camera/fragment/FragmentBottomPopupTips$TipImageType;
    }
.end annotation


# instance fields
.field private mBeautyIntroButton:Landroid/view/View;

.field private mBeautyIntroRadius:I

.field private mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

.field private mBeautyIntroText:Landroid/widget/TextView;

.field private mBeautyIntroWidth:I

.field private mCurrentTipMessage:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private mCurrentTipType:I

.field private mHandler:Landroid/os/Handler;

.field private mLastTipMessage:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field private mLastTipType:I

.field private mPortraitSuccessHint:Landroid/view/View;

.field private mQrCodeButton:Landroid/widget/TextView;

.field private mRootView:Landroid/view/View;

.field private mShowBeautyIntro:Z

.field private mTipImage:Landroid/widget/ImageView;

.field private mTipMessage:Landroid/widget/TextView;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/view/View;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/FragmentBottomPopupTips;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/fragment/FragmentBottomPopupTips;)Landroid/widget/TextView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/FragmentBottomPopupTips;I)I
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;
    .param p1, "-value"    # I

    .prologue
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/FragmentBottomPopupTips;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomPopupTips;
    .param p1, "width"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->setBeautyIntroButtonWidth(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 97
    new-instance v0, Lcom/android/camera/fragment/FragmentBottomPopupTips$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$1;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    .line 53
    return-void
.end method

.method private adjustViewBackground(I)V
    .locals 3
    .param p1, "currentMode"    # I

    .prologue
    .line 715
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 716
    .local v0, "uiStyle":I
    packed-switch v0, :pswitch_data_0

    .line 719
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    const v2, 0x7f02000d

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 727
    :goto_0
    return-void

    .line 724
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    const v2, 0x7f02000e

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    goto :goto_0

    .line 716
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private hideTip(Landroid/view/View;)Z
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v1, 0x8

    .line 501
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 502
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 503
    const/4 v0, 0x1

    return v0

    .line 505
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private hideTipBeautyIntro()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 290
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 291
    return-void

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 294
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 295
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->pause()V

    .line 296
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 297
    return-void
.end method

.method private initBeautyIntroAnimator()V
    .locals 12

    .prologue
    const/high16 v11, 0x3e800000    # 0.25f

    const v10, 0x3dcccccd    # 0.1f

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 163
    new-array v3, v9, [I

    iget v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroWidth:I

    aput v4, v3, v7

    iget v4, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroRadius:I

    mul-int/lit8 v4, v4, 0x2

    aput v4, v3, v8

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v1

    .line 164
    .local v1, "shapeAnimator":Landroid/animation/ValueAnimator;
    const-wide/16 v4, 0x12c

    invoke-virtual {v1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 165
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroText:Landroid/widget/TextView;

    const-string/jumbo v4, "alpha"

    new-array v5, v9, [F

    const/high16 v6, 0x3f800000    # 1.0f

    aput v6, v5, v7

    const/4 v6, 0x0

    aput v6, v5, v8

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 166
    .local v0, "alphaAnimator":Landroid/animation/ObjectAnimator;
    const-wide/16 v4, 0xfa

    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 168
    new-instance v2, Lcom/android/camera/fragment/FragmentBottomPopupTips$2;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$2;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    .line 174
    .local v2, "updateListener":Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 176
    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    .line 177
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    new-array v4, v9, [Landroid/animation/Animator;

    aput-object v1, v4, v7

    aput-object v0, v4, v8

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 178
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    new-instance v4, Landroid/view/animation/PathInterpolator;

    invoke-direct {v4, v11, v10, v11, v10}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 179
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    const-wide/16 v4, 0x7d0

    invoke-virtual {v3, v4, v5}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 180
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    new-instance v4, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$3;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 201
    return-void
.end method

.method private reIntTipViewMarginBottom(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const v7, 0x7f090090

    .line 380
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 382
    .local v2, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    const/16 v6, 0xb6

    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 384
    .local v1, "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    const/16 v6, 0xb5

    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    .line 386
    .local v3, "manuallyAdjust":Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;
    const/4 v4, 0x0

    .line 387
    .local v4, "newBottomMargin":I
    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v6, 0xa5

    if-ne v5, v6, :cond_1

    .line 388
    sget v5, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v5, v5

    const/high16 v6, 0x3f400000    # 0.75f

    div-float/2addr v5, v6

    float-to-int v5, v5

    sget v6, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    .line 389
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    .line 388
    add-int v4, v5, v6

    .line 408
    :goto_0
    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v5, v4, :cond_0

    .line 409
    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 410
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 412
    :cond_0
    return-void

    .line 390
    :cond_1
    if-eqz v3, :cond_2

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->visibleHeight()I

    move-result v5

    if-lez v5, :cond_2

    .line 391
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->visibleHeight()I

    move-result v4

    goto :goto_0

    .line 392
    :cond_2
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getVisibility()I

    move-result v5

    if-nez v5, :cond_3

    .line 393
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getHeight()I

    move-result v4

    goto :goto_0

    .line 394
    :cond_3
    if-eqz v1, :cond_4

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isZoomVisible()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 395
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$DualController;->visibleHeight()I

    move-result v4

    goto :goto_0

    .line 398
    :cond_4
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    const/16 v6, 0xa0

    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 400
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-eqz v0, :cond_5

    const v5, 0x7f0a009b

    invoke-interface {v0, v5}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v5

    const/16 v6, 0xfc

    if-ne v5, v6, :cond_5

    .line 401
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f09006b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    goto :goto_0

    .line 403
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    goto :goto_0
.end method

.method private resetBeautyIntro()V
    .locals 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 158
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroWidth:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->setBeautyIntroButtonWidth(I)V

    .line 159
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroText:Landroid/widget/TextView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 160
    return-void
.end method

.method private setBeautyIntroButtonWidth(I)V
    .locals 2
    .param p1, "width"    # I

    .prologue
    .line 525
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 526
    .local v0, "lp":Landroid/view/ViewGroup$LayoutParams;
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 527
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 528
    return-void
.end method

.method private startBeautyIntroShowAnimation()V
    .locals 2

    .prologue
    .line 531
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 532
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->resetBeautyIntro()V

    .line 533
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 534
    invoke-static {}, Lcom/android/camera/CameraSettings;->addPopupTipBeautyIntroShowTimes()V

    .line 535
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 536
    return-void
.end method

.method private updateTipImage(IILjava/util/List;)V
    .locals 11
    .param p1, "newMode"    # I
    .param p2, "lastMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    const/16 v10, 0x96

    const/16 v9, 0xa5

    const/4 v7, 0x0

    .line 539
    const/4 v4, -0x1

    .line 540
    .local v4, "newType":I
    sparse-switch p1, :sswitch_data_0

    .line 542
    const/4 v4, -0x1

    .line 565
    :cond_0
    :goto_0
    const/4 v3, 0x0

    .line 566
    .local v3, "newImageResourceId":I
    const/4 v2, 0x0

    .line 567
    .local v2, "newContentDescriptionStrId":I
    const/4 v1, 0x1

    .line 568
    .local v1, "inOrOut":Z
    packed-switch v4, :pswitch_data_0

    .line 581
    :goto_1
    :pswitch_0
    if-lez v3, :cond_1

    .line 582
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v6, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 584
    :cond_1
    if-lez v2, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 585
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 588
    :cond_2
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 589
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 590
    .local v5, "tag":I
    if-ne v5, v4, :cond_4

    .line 591
    return-void

    .line 552
    .end local v1    # "inOrOut":Z
    .end local v2    # "newContentDescriptionStrId":I
    .end local v3    # "newImageResourceId":I
    .end local v5    # "tag":I
    :sswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 553
    const/4 v4, 0x3

    goto :goto_0

    .line 557
    :sswitch_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 558
    const/4 v4, 0x3

    goto :goto_0

    .line 560
    :cond_3
    const/4 v4, -0x1

    goto :goto_0

    .line 570
    .restart local v1    # "inOrOut":Z
    .restart local v2    # "newContentDescriptionStrId":I
    .restart local v3    # "newImageResourceId":I
    :pswitch_1
    const/4 v1, 0x0

    .line 571
    goto :goto_1

    .line 573
    :pswitch_2
    const v3, 0x7f02009e

    .line 574
    goto :goto_1

    .line 576
    :pswitch_3
    const v3, 0x7f02009c

    .line 577
    const v2, 0x7f0f00e1

    .line 578
    goto :goto_1

    .line 595
    :cond_4
    if-eqz v1, :cond_5

    .line 596
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    iget v8, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mDegree:I

    int-to-float v8, v8

    invoke-static {v6, v8}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 599
    :cond_5
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 602
    iput-boolean v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    .line 603
    if-nez p3, :cond_8

    .line 604
    if-eqz v1, :cond_7

    .line 605
    const/4 v0, 0x0

    .line 631
    .local v0, "animType":I
    :goto_2
    packed-switch v0, :pswitch_data_1

    .line 666
    :cond_6
    :goto_3
    return-void

    .line 607
    .end local v0    # "animType":I
    :cond_7
    const/4 v0, 0x1

    .restart local v0    # "animType":I
    goto :goto_2

    .line 610
    .end local v0    # "animType":I
    :cond_8
    if-eqz v1, :cond_c

    .line 611
    if-ne p2, v9, :cond_a

    .line 613
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 614
    const/4 v0, 0x0

    .line 621
    .restart local v0    # "animType":I
    :goto_4
    const/4 v6, 0x3

    if-ne v4, v6, :cond_b

    invoke-static {}, Lcom/android/camera/CameraSettings;->isPopupTipBeautyIntroEnable()Z

    move-result v6

    :goto_5
    iput-boolean v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    goto :goto_2

    .line 616
    .end local v0    # "animType":I
    :cond_9
    const/4 v0, 0x3

    .restart local v0    # "animType":I
    goto :goto_4

    .line 619
    .end local v0    # "animType":I
    :cond_a
    const/4 v0, 0x2

    .restart local v0    # "animType":I
    goto :goto_4

    :cond_b
    move v6, v7

    .line 621
    goto :goto_5

    .line 623
    .end local v0    # "animType":I
    :cond_c
    if-eq p2, v9, :cond_d

    iget v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    if-ne v6, v9, :cond_e

    .line 624
    :cond_d
    const/4 v0, 0x1

    .line 623
    .restart local v0    # "animType":I
    goto :goto_2

    .line 626
    .end local v0    # "animType":I
    :cond_e
    const/4 v0, 0x4

    .restart local v0    # "animType":I
    goto :goto_2

    .line 633
    :pswitch_4
    iget-boolean v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    if-nez v6, :cond_6

    .line 634
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v6}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 638
    :pswitch_5
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_f

    .line 639
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->pause()V

    .line 640
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-static {v6}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 642
    :cond_f
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-static {v6}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 646
    :pswitch_6
    iget-boolean v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    if-nez v6, :cond_6

    .line 647
    new-instance v6, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {v6, v7}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v6}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v6

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 651
    :pswitch_7
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_10

    .line 652
    iget-object v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroShowAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v6}, Landroid/animation/AnimatorSet;->pause()V

    .line 653
    new-instance v6, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-direct {v6, v7}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v6}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v6

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 655
    :cond_10
    new-instance v6, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {v6, v7}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v6}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v6

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 659
    :pswitch_8
    iget-boolean v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    if-nez v6, :cond_6

    .line 660
    new-instance v6, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v7, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {v6, v7}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v6, v10}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v6

    invoke-static {v6}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v6

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 540
    nop

    :sswitch_data_0
    .sparse-switch
        0xa3 -> :sswitch_0
        0xa5 -> :sswitch_0
        0xab -> :sswitch_1
    .end sparse-switch

    .line 568
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 631
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method


# virtual methods
.method public containTips(I)Z
    .locals 2
    .param p1, "tokenResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 432
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 433
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 432
    :cond_0
    return v0
.end method

.method public directlyHideTips()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 416
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 417
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 418
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    return-void

    .line 421
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 423
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isPortraitHintVisible()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 424
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->showTips(III)V

    .line 427
    :cond_1
    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    .line 428
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 210
    const/16 v0, 0xff1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 205
    const v0, 0x7f040007

    return v0
.end method

.method public hideQrCodeTip()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 470
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 471
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 473
    :cond_0
    return-void
.end method

.method public hideTipImage()V
    .locals 2

    .prologue
    .line 281
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 282
    return-void

    .line 284
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 285
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 287
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x0

    .line 125
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    .line 127
    const v5, 0x7f0a0021

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    .line 128
    const v5, 0x7f0a0022

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    .line 129
    const v5, 0x7f0a0023

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroText:Landroid/widget/TextView;

    .line 130
    const v5, 0x7f0a0025

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    .line 131
    const v5, 0x7f0a0024

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    .line 132
    const v5, 0x7f0a0026

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    .line 135
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 136
    .local v1, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v5}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v5

    iput v5, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 138
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroButton:Landroid/view/View;

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, v5}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->adjustViewBackground(I)V

    .line 142
    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6, v7}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->provideAnimateElement(ILjava/util/List;Z)V

    .line 144
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090094

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iput v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroRadius:I

    .line 145
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroText:Landroid/widget/TextView;

    invoke-virtual {v5, v7, v7}, Landroid/widget/TextView;->measure(II)V

    .line 146
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroText:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    .line 147
    .local v4, "textWidth":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090095

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 148
    .local v0, "leftPadding":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090096

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 149
    .local v2, "rightPadding":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090099

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 150
    .local v3, "textMargin":I
    add-int v5, v4, v0

    add-int/2addr v5, v2

    iget v6, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroRadius:I

    sub-int/2addr v6, v0

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    add-int/2addr v5, v3

    iput v5, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mBeautyIntroWidth:I

    .line 152
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->initBeautyIntroAnimator()V

    .line 153
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->resetBeautyIntro()V

    .line 154
    return-void
.end method

.method public isPortraitHintVisible()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 448
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 1
    .param p1, "arrivedType"    # I

    .prologue
    .line 706
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 708
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    if-eqz v0, :cond_0

    .line 709
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->startBeautyIntroShowAnimation()V

    .line 711
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mShowBeautyIntro:Z

    .line 712
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 3
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 690
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 692
    packed-switch p1, :pswitch_data_0

    .line 700
    :goto_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    .line 702
    return-void

    .line 694
    :pswitch_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->adjustViewBackground(I)V

    goto :goto_0

    .line 697
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directlyHideTips()V

    goto :goto_0

    .line 692
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onBackEvent(I)Z
    .locals 3
    .param p1, "callingFrom"    # I

    .prologue
    const/4 v2, 0x0

    .line 478
    packed-switch p1, :pswitch_data_0

    .line 486
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 487
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 488
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 489
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 497
    :pswitch_0
    return v2

    .line 480
    :pswitch_1
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    .line 481
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 482
    :cond_1
    return v2

    .line 478
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 230
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->isEnableClick()Z

    move-result v5

    if-nez v5, :cond_0

    .line 231
    return-void

    .line 235
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    const/16 v6, 0xa1

    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 236
    .local v1, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 237
    return-void

    .line 240
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 276
    :cond_2
    :goto_0
    :pswitch_0
    return-void

    .line 242
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideQrCodeTip()V

    .line 243
    const-string/jumbo v5, "counter"

    const-string/jumbo v6, "qrcode_detected"

    invoke-static {v5, v6}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    .line 246
    const/16 v6, 0xc3

    .line 245
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    .line 247
    .local v2, "cameraModuleSpecial":Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showQRCodeResult()V

    goto :goto_0

    .line 252
    .end local v2    # "cameraModuleSpecial":Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 253
    .local v4, "type":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTipImage()V

    .line 254
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTipBeautyIntro()V

    .line 255
    invoke-static {}, Lcom/android/camera/CameraSettings;->setPopupTipBeautyIntroClicked()V

    .line 257
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    .line 258
    const/16 v6, 0xa0

    .line 257
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 259
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    packed-switch v4, :pswitch_data_1

    goto :goto_0

    .line 261
    :pswitch_3
    const/4 v5, 0x4

    invoke-interface {v0, v5}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 265
    :pswitch_4
    const/4 v5, 0x2

    invoke-interface {v0, v5}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 267
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    .line 268
    const/16 v6, 0xa2

    .line 267
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 269
    .local v3, "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-eqz v3, :cond_2

    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilter()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 270
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideFilter()V

    goto :goto_0

    .line 240
    :pswitch_data_0
    .packed-switch 0x7f0a0021
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 259
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 3
    .param p1, "newMode"    # I
    .param p3, "timeOut"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/Completable;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    const/4 v2, 0x0

    .line 513
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    .line 514
    .local v0, "lastMode":I
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 516
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->onBackEvent(I)Z

    .line 519
    invoke-virtual {p0, v2, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 521
    invoke-direct {p0, p1, v0, p2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateTipImage(IILjava/util/List;)V

    .line 522
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 3
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 672
    const/16 v0, 0xf0

    if-eq p1, v0, :cond_0

    .line 673
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getFragmentInto()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 674
    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 676
    :cond_1
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/16 v1, 0xa1

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 1
    .param p2, "degree"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 681
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 682
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 683
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipImage:Landroid/widget/ImageView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 685
    :cond_0
    return-void
.end method

.method public reInitTipImage()V
    .locals 3

    .prologue
    .line 301
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->provideAnimateElement(ILjava/util/List;Z)V

    .line 302
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 215
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 216
    const/16 v0, 0xaf

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 217
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 218
    return-void
.end method

.method public setPortraitHintVisible(I)V
    .locals 1
    .param p1, "visible"    # I

    .prologue
    .line 438
    if-nez p1, :cond_1

    const/4 v0, 0x7

    :goto_0
    iput v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    .line 439
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->directlyHideTips()V

    .line 440
    if-nez p1, :cond_0

    .line 441
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;)V

    .line 443
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mPortraitSuccessHint:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 444
    return-void

    .line 438
    :cond_1
    const/4 v0, 0x4

    goto :goto_0
.end method

.method public showQrCodeTip()V
    .locals 4

    .prologue
    .line 453
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 454
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 455
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;)V

    .line 456
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 457
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 458
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomPopupTips$5;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$5;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    .line 463
    const-wide/16 v2, 0x64

    .line 458
    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 466
    :cond_0
    return-void
.end method

.method public showTips(III)V
    .locals 6
    .param p1, "tipType"    # I
    .param p2, "tipsResId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "tipDuration"    # I

    .prologue
    .line 327
    const/4 v1, 0x6

    if-ne p1, v1, :cond_0

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentMode:I

    const/16 v2, 0xab

    if-eq v1, v2, :cond_0

    .line 328
    return-void

    .line 330
    :cond_0
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    iput v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipType:I

    .line 331
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    iput v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mLastTipMessage:I

    .line 333
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipType:I

    .line 334
    iput p2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    .line 336
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mQrCodeButton:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->hideTip(Landroid/view/View;)Z

    .line 338
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->reIntTipViewMarginBottom(Landroid/view/View;)V

    .line 339
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 340
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 341
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 342
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mCurrentTipMessage:I

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 343
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mTipMessage:Landroid/widget/TextView;

    new-instance v2, Lcom/android/camera/fragment/FragmentBottomPopupTips$4;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips$4;-><init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    .line 350
    const-wide/16 v4, 0xbb8

    .line 343
    invoke-virtual {v1, v2, v4, v5}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 352
    :cond_1
    const/4 v0, 0x0

    .line 353
    .local v0, "duration":I
    packed-switch p3, :pswitch_data_0

    .line 367
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 368
    if-lez v0, :cond_2

    .line 369
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    int-to-long v2, v0

    const/4 v4, 0x1

    invoke-virtual {v1, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 372
    :cond_2
    return-void

    .line 355
    :pswitch_1
    const/16 v0, 0x3e8

    .line 356
    goto :goto_0

    .line 358
    :pswitch_2
    const/16 v0, 0x1388

    .line 359
    goto :goto_0

    .line 361
    :pswitch_3
    const/16 v0, 0x3a98

    .line 362
    goto :goto_0

    .line 353
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 222
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 223
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 224
    const/16 v0, 0xaf

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 225
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 226
    return-void
.end method

.method public updateTipBottomMargin(IZ)V
    .locals 5
    .param p1, "margin"    # I
    .param p2, "animation"    # Z

    .prologue
    const/4 v4, 0x0

    .line 306
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    .line 307
    .local v0, "currentPaddingTop":I
    if-ge v0, p1, :cond_0

    .line 308
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    int-to-float v2, p1

    const v3, 0x3f99999a    # 1.2f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {v1, v4, v2, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 310
    :cond_0
    if-eqz p2, :cond_2

    .line 311
    int-to-float v1, p1

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 312
    new-instance v1, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int v3, p1

    invoke-direct {v1, v2, v3}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 313
    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 312
    invoke-virtual {v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 321
    :goto_0
    return-void

    .line 315
    :cond_1
    new-instance v1, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int v3, p1

    invoke-direct {v1, v2, v3}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 316
    new-instance v2, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 315
    invoke-virtual {v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 319
    :cond_2
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips;->mRootView:Landroid/view/View;

    neg-int v2, p1

    invoke-static {v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_0
.end method
