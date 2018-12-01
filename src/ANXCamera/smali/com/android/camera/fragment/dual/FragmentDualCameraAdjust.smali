.class public Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentDualCameraAdjust.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/camera/fragment/manually/ManuallyListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$DualController;
.implements Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$1;,
        Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;
    }
.end annotation


# instance fields
.field private mCurrentState:I

.field private mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mDualParentLayout:Landroid/view/ViewGroup;

.field private mDualZoomButton:Landroid/widget/TextView;

.field private mHandler:Landroid/os/Handler;

.field private mHorizontalSlideLayout:Landroid/view/ViewGroup;

.field private mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

.field private mIsHiding:Z

.field private mIsZoomAnimationEnabled:Z

.field private mIsZoomTo2X:Z

.field private mPassTouchFromZoomButtonToSlide:Z

.field private mSlideLayoutHeight:I

.field private mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

.field private mSnapStyle:Landroid/text/style/TextAppearanceSpan;

.field private mStringBuilder:Landroid/text/SpannableStringBuilder;

.field private mXTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mZoomInAnimator:Landroid/animation/AnimatorSet;

.field private mZoomInOutAnimator:Landroid/animation/AnimatorSet;

.field private mZoomOutAnimator:Landroid/animation/AnimatorSet;

.field private mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

.field private mZoomRatio:F

.field private mZoomRatioTele:I

.field private mZoomRatioWide:I

.field private mZoomRequestAnimator:Landroid/animation/ObjectAnimator;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/widget/TextView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Lcom/android/camera/ui/HorizontalSlideView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    return v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mPassTouchFromZoomButtonToSlide:Z

    return v0
.end method

.method static synthetic -get5(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/animation/AnimatorSet;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/animation/AnimatorSet;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)Landroid/view/View$OnTouchListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mPassTouchFromZoomButtonToSlide:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
    .param p1, "isZoomTo2X"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyZoom2X(Z)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;Z)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
    .param p1, "start"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyZooming(Z)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;FZ)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;
    .param p1, "newRatio"    # F
    .param p2, "sync"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FZ)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->sendHideMessage()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    .line 105
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$1;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    .line 116
    new-instance v0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$2;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    .line 66
    return-void
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "currentMode"    # I

    .prologue
    .line 704
    const v0, 0x7f0d000b

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 705
    return-void
.end method

.method private hideSlideView()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 635
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    .line 636
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    invoke-virtual {v0, v3}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->setEnable(Z)V

    .line 637
    new-instance v0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 638
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 637
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 639
    new-instance v1, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$7;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$7;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    .line 637
    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 648
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 649
    new-instance v0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 650
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 649
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 652
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyTipsMargin(I)V

    .line 654
    return-void
.end method

.method private initSlideZoomView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 4
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;

    .prologue
    .line 610
    new-instance v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {v1, v2, p1, v3, p0}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iput-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    .line 611
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalSlideView;->setOnPositionSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;)V

    .line 612
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalSlideView;->setJustifyEnabled(Z)V

    .line 613
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalSlideView;->setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V

    .line 615
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mapZoomRatioToPosition(F)F

    move-result v0

    .line 616
    .local v0, "currentPosition":F
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    div-float v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(F)V

    .line 617
    return-void
.end method

.method private notifyTipsMargin(I)V
    .locals 3
    .param p1, "margin"    # I

    .prologue
    .line 658
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 659
    const/16 v2, 0xaf

    .line 658
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 660
    .local v0, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->updateTipBottomMargin(IZ)V

    .line 661
    return-void
.end method

.method private notifyZoom2X(Z)V
    .locals 3
    .param p1, "isZoomTo2X"    # Z

    .prologue
    .line 557
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 558
    const/16 v2, 0xae

    .line 557
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 559
    .local v0, "manuallyValueChanged":Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomAnimationEnabled:Z

    if-eqz v1, :cond_0

    .line 560
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualZoomHappened(Z)V

    .line 562
    :cond_0
    return-void
.end method

.method private notifyZooming(Z)V
    .locals 3
    .param p1, "start"    # Z

    .prologue
    .line 566
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 567
    const/16 v2, 0xae

    .line 566
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 568
    .local v0, "manuallyValueChanged":Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;
    if-eqz v0, :cond_0

    .line 569
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualLensZooming(Z)V

    .line 571
    :cond_0
    return-void
.end method

.method private requestZoomRatio(FZ)V
    .locals 3
    .param p1, "newRatio"    # F
    .param p2, "sync"    # Z

    .prologue
    .line 674
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 675
    const/16 v2, 0xae

    .line 674
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 676
    .local v0, "manuallyValueChanged":Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;
    if-eqz v0, :cond_0

    .line 677
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualZoomValueChanged(FZ)V

    .line 679
    :cond_0
    return-void
.end method

.method private resetZoomIcon()V
    .locals 2

    .prologue
    .line 282
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 283
    const-string/jumbo v0, "wide"

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 284
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    .line 291
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->setZoomText()V

    .line 292
    return-void

    .line 286
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    .line 289
    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0
.end method

.method private sendHideMessage()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 276
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 277
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 278
    return-void
.end method

.method private setZoomText()V
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v6, 0x21

    .line 315
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 316
    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    float-to-int v1, v2

    .line 317
    .local v1, "zoomSig":I
    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    int-to-float v3, v1

    sub-float/2addr v2, v3

    const/high16 v3, 0x41200000    # 10.0f

    mul-float/2addr v2, v3

    float-to-int v0, v2

    .line 318
    .local v0, "zoomFraction":I
    if-nez v0, :cond_1

    .line 319
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v2, v3, v4, v6}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 323
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 324
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    aput-object v4, v3, v5

    const v4, 0x7f0f00e4

    invoke-virtual {p0, v4, v3}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 325
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    new-instance v3, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$6;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    .line 332
    const-wide/16 v4, 0xbb8

    .line 325
    invoke-virtual {v2, v3, v4, v5}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 334
    :cond_0
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    const-string/jumbo v3, "X"

    iget-object v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v2, v3, v4, v6}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 335
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 337
    return-void

    .line 321
    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v2, v3, v4, v6}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    goto :goto_0
.end method

.method private showSlideView()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 620
    iput-boolean v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    .line 621
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlidingAdapter:Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->setEnable(Z)V

    .line 622
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 623
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 624
    new-instance v0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 625
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 624
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 627
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 628
    new-instance v0, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 629
    new-instance v1, Lmiui/view/animation/BackEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/BackEaseOutInterpolator;-><init>()V

    .line 628
    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setInterpolator(Landroid/view/animation/Interpolator;)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 631
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->notifyTipsMargin(I)V

    .line 632
    return-void
.end method

.method private toggle()V
    .locals 5

    .prologue
    .line 576
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    move-result-object v0

    .line 578
    .local v0, "dualLens":Lcom/android/camera/data/data/config/ComponentManuallyDualLens;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 579
    const/16 v4, 0xae

    .line 578
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 580
    .local v1, "manuallyValueChanged":Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;
    if-eqz v1, :cond_0

    .line 581
    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-interface {v1, v0, v3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualLensSwitch(Lcom/android/camera/data/data/config/ComponentManuallyDualLens;I)V

    .line 582
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomValue()V

    .line 585
    :cond_0
    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 586
    .local v2, "newValue":Ljava/lang/String;
    iget v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    .line 587
    const-string/jumbo v3, "wide"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 588
    const-string/jumbo v3, "1x"

    .line 586
    :goto_0
    invoke-static {v4, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    .line 589
    return-void

    .line 588
    :cond_1
    const-string/jumbo v3, "2x"

    goto :goto_0
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 408
    const/16 v0, 0xff4

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 403
    const v0, 0x7f04000c

    return v0
.end method

.method public hideZoomButton()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 359
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    if-ne v0, v1, :cond_0

    .line 360
    return-void

    .line 362
    :cond_0
    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    .line 363
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 364
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 140
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 143
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 144
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v2

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 146
    const v2, 0x7f0a002f

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    .line 148
    const v2, 0x7f0a0030

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    .line 149
    const v2, 0x7f0a0031

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    .line 151
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const v3, 0x7f0a0032

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/HorizontalSlideView;

    .line 150
    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    .line 152
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomPopupTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/HorizontalSlideView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 154
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    new-instance v2, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f110013

    invoke-direct {v2, v3, v4}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 157
    new-instance v2, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f110014

    invoke-direct {v2, v3, v4}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 158
    const/4 v2, 0x1

    iput v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    .line 159
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    .line 161
    invoke-static {}, Lcom/android/camera/Util;->isZoomAnimationEnabled()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomAnimationEnabled:Z

    .line 164
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f060003

    invoke-static {v2, v3}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v2

    .line 163
    check-cast v2, Landroid/animation/ObjectAnimator;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    .line 165
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 166
    iget-boolean v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomAnimationEnabled:Z

    if-nez v2, :cond_0

    .line 167
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 170
    :cond_0
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    new-instance v3, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$3;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$3;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 179
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    new-instance v3, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$4;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 214
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f060001

    invoke-static {v2, v3}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v2

    .line 213
    check-cast v2, Landroid/animation/AnimatorSet;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    .line 215
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 216
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v3, Lmiui/view/animation/QuadraticEaseOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuadraticEaseOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 218
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x7f060000

    invoke-static {v2, v3}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v2

    .line 217
    check-cast v2, Landroid/animation/AnimatorSet;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    .line 219
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 220
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    new-instance v3, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 222
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f060002

    invoke-static {v2, v3}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v2

    .line 221
    check-cast v2, Landroid/animation/AnimatorSet;

    iput-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    .line 223
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 224
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v3, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 227
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 228
    .local v1, "screenWidth":I
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 229
    int-to-float v3, v1

    const/high16 v4, 0x3f400000    # 0.75f

    div-float/2addr v3, v4

    int-to-float v4, v1

    sub-float/2addr v3, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    float-to-int v3, v3

    .line 228
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 230
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    .line 232
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {p0, v2, v3}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->adjustViewBackground(Landroid/view/View;I)V

    .line 233
    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, v4}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->provideAnimateElement(ILjava/util/List;Z)V

    .line 235
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    new-instance v3, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust$5;-><init>(Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 273
    return-void
.end method

.method public isZoomVisible()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 341
    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    if-ne v2, v0, :cond_0

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public notifyDataChanged(II)V
    .locals 3
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 692
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 693
    packed-switch p1, :pswitch_data_0

    .line 699
    :goto_0
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->provideAnimateElement(ILjava/util/List;Z)V

    .line 700
    return-void

    .line 695
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->adjustViewBackground(Landroid/view/View;I)V

    goto :goto_0

    .line 693
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public onBackEvent(I)Z
    .locals 2
    .param p1, "callingFrom"    # I

    .prologue
    const/4 v1, 0x0

    .line 494
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 495
    return v1

    .line 498
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    .line 499
    return v1

    .line 502
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsHiding:Z

    if-eqz v0, :cond_2

    .line 503
    return v1

    .line 506
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->hideSlideView()V

    .line 508
    const/4 v0, 0x1

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 515
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 516
    return-void

    .line 519
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 520
    const/16 v2, 0xa1

    .line 519
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 521
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 522
    return-void

    .line 525
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 553
    :goto_0
    return-void

    .line 527
    :pswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 528
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->toggle()V

    .line 549
    :goto_1
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInOutAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 550
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->onBackEvent(I)Z

    goto :goto_0

    .line 530
    :cond_2
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-nez v1, :cond_3

    .line 531
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string/jumbo v2, "2x"

    invoke-static {v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    .line 532
    iput-boolean v5, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    .line 533
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    new-array v2, v3, [F

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    aput v3, v2, v4

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    int-to-float v3, v3

    aput v3, v2, v5

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 534
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_1

    .line 537
    :cond_3
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_4

    .line 538
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string/jumbo v2, "1x"

    invoke-static {v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    .line 539
    iput-boolean v4, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mIsZoomTo2X:Z

    .line 540
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    new-array v2, v3, [F

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    aput v3, v2, v4

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v3, v3

    aput v3, v2, v5

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    .line 541
    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_1

    .line 543
    :cond_4
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    const-string/jumbo v2, "1x"

    invoke-static {v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackDualZoomChanged(ILjava/lang/String;)V

    .line 544
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    int-to-float v1, v1

    invoke-direct {p0, v1, v5}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FZ)V

    .line 545
    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v1, v1

    invoke-direct {p0, v1, v4}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FZ)V

    goto :goto_1

    .line 525
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0030
        :pswitch_0
    .end packed-switch
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 593
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 594
    return v2

    .line 596
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 606
    return v2

    .line 599
    :pswitch_0
    new-instance v0, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;-><init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V

    .line 600
    .local v0, "componentManuallyDualZoom":Lcom/android/camera/data/data/config/ComponentManuallyDualZoom;
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->initSlideZoomView(Lcom/android/camera/data/data/ComponentData;)V

    .line 601
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->showSlideView()V

    .line 602
    iput-boolean v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mPassTouchFromZoomButtonToSlide:Z

    .line 603
    return v3

    .line 596
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0030
        :pswitch_0
    .end packed-switch
.end method

.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "oldValue"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;
    .param p4, "isCustomValue"    # Z

    .prologue
    .line 666
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->isInModeChanging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 667
    return-void

    .line 669
    :cond_0
    invoke-static {p3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->requestZoomRatio(FZ)V

    .line 670
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 7
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
    const/16 v6, 0xa5

    const/16 v5, 0x50

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 414
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    .line 415
    .local v0, "lastMode":I
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 417
    const/4 v1, -0x1

    .line 418
    .local v1, "newState":I
    packed-switch p1, :pswitch_data_0

    .line 431
    :goto_0
    :pswitch_0
    if-ne v1, v4, :cond_0

    .line 432
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->onBackEvent(I)Z

    .line 434
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    if-ne v2, v4, :cond_0

    .line 436
    const/4 v1, -0x1

    .line 440
    :cond_0
    iget v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    if-ne v2, v1, :cond_2

    .line 441
    if-ne v1, v4, :cond_1

    .line 442
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->resetZoomIcon()V

    .line 444
    :cond_1
    return-void

    .line 421
    :pswitch_1
    const/4 v1, 0x1

    .line 422
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDegree:I

    int-to-float v3, v3

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 423
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_0

    .line 426
    :pswitch_2
    const/4 v1, 0x1

    .line 427
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_0

    .line 446
    :cond_2
    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    .line 448
    packed-switch v1, :pswitch_data_1

    .line 490
    :goto_1
    :pswitch_3
    return-void

    .line 450
    :pswitch_4
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_3

    .line 451
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-static {v2, v5}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 453
    :cond_3
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-static {v2, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 454
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    iget v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    int-to-float v3, v3

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 455
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->resetZoomIcon()V

    .line 456
    if-eqz p2, :cond_4

    .line 457
    if-ne p1, v6, :cond_5

    .line 458
    const/16 v2, 0xa7

    if-eq v0, v2, :cond_5

    .line 459
    :cond_4
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 461
    :cond_5
    const/16 v2, 0xa7

    if-ne v0, v2, :cond_6

    .line 463
    new-instance v2, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-direct {v2, v3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v3, 0x96

    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    .line 462
    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 466
    :cond_6
    new-instance v2, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-direct {v2, v3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    .line 465
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 472
    :pswitch_5
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v2

    if-nez v2, :cond_8

    .line 473
    if-nez p2, :cond_7

    .line 474
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_1

    .line 478
    :cond_7
    new-instance v2, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualParentLayout:Landroid/view/ViewGroup;

    invoke-direct {v2, v3, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 477
    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    .line 476
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 481
    :cond_8
    if-eqz p2, :cond_9

    if-ne v0, v6, :cond_a

    .line 482
    :cond_9
    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-static {v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 485
    :cond_a
    new-instance v2, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v3, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-direct {v2, v3}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    .line 484
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 418
    :pswitch_data_0
    .packed-switch 0xa3
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 448
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_5
        :pswitch_3
        :pswitch_4
    .end packed-switch
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
    .line 683
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 684
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 685
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 687
    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 377
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 379
    const/16 v0, 0xb6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 381
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 383
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 384
    const/16 v0, 0xb8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 386
    :cond_0
    return-void
.end method

.method public setSnapNumValue(I)V
    .locals 5
    .param p1, "number"    # I

    .prologue
    .line 722
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSnapStyle:Landroid/text/style/TextAppearanceSpan;

    if-nez v0, :cond_0

    .line 723
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f110012

    invoke-direct {v0, v1, v2}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSnapStyle:Landroid/text/style/TextAppearanceSpan;

    .line 725
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 726
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    const-string/jumbo v1, "%02d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSnapStyle:Landroid/text/style/TextAppearanceSpan;

    const/16 v3, 0x21

    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 727
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 728
    return-void
.end method

.method public setSnapNumVisible(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 709
    if-eqz p1, :cond_1

    .line 710
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 711
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->hideSlideView()V

    .line 713
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 718
    :goto_0
    return-void

    .line 715
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 716
    invoke-virtual {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->updateZoomValue()V

    goto :goto_0
.end method

.method public showZoomButton()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 368
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    if-ne v0, v1, :cond_0

    .line 369
    return-void

    .line 371
    :cond_0
    iput v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    .line 372
    new-instance v0, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 373
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 390
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 391
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 392
    const/16 v0, 0xb6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 394
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 396
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 397
    const/16 v0, 0xb8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 399
    :cond_0
    return-void
.end method

.method public updateZoomValue()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 297
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 298
    const-string/jumbo v0, "wide"

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentMode:I

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 299
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    .line 307
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRequestAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioWide:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_4

    .line 309
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->setZoomText()V

    .line 311
    :cond_1
    return-void

    .line 301
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    int-to-float v0, v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    .line 304
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    goto :goto_0

    .line 308
    :cond_4
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatio:F

    iget v1, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mZoomRatioTele:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    goto :goto_1
.end method

.method public visibleHeight()I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 346
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mCurrentState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 347
    return v2

    .line 350
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mHorizontalSlideLayout:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 351
    iget v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mSlideLayoutHeight:I

    return v0

    .line 354
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/dual/FragmentDualCameraAdjust;->mDualZoomButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getHeight()I

    move-result v0

    return v0
.end method
