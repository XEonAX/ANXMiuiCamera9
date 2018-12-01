.class public Lcom/android/camera/fragment/sticker/FragmentSticker;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentSticker.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;,
        Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;
    }
.end annotation


# instance fields
.field private mBackButton:Landroid/widget/ImageView;

.field private mOnRadioButtonChangedListener:Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

.field private mRadioGroup:Landroid/widget/RadioGroup;

.field private mViewPager:Lcom/android/camera/ui/NoScrollViewPager;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/sticker/FragmentSticker;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/FragmentSticker;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mCurrentMode:I

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/FragmentSticker;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mOnRadioButtonChangedListener:Lcom/android/camera/fragment/sticker/FragmentSticker$OnRadioButtonChangedListener;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/sticker/FragmentSticker;)Landroid/widget/RadioGroup;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/FragmentSticker;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/sticker/FragmentSticker;)Lcom/android/camera/ui/NoScrollViewPager;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/FragmentSticker;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 141
    const/16 v0, 0xff

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 136
    const v0, 0x7f040018

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v3, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 43
    .local v3, "screenWidth":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v2, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 45
    .local v2, "screenHeight":I
    int-to-float v5, v2

    int-to-float v6, v3

    const/high16 v7, 0x3f400000    # 0.75f

    div-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-int v1, v5

    .line 46
    .local v1, "height":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iput v1, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 48
    const v5, 0x7f0a000e

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/android/camera/ui/NoScrollViewPager;

    iput-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v0, "fragmentList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    new-instance v5, Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-direct {v5}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;-><init>()V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v5, Lcom/android/camera/fragment/sticker/FragmentStickerPager;

    invoke-direct {v5}, Lcom/android/camera/fragment/sticker/FragmentStickerPager;-><init>()V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v4, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-direct {v4, p0, v5, v0}, Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    .line 53
    .local v4, "stickerPagerAdapter":Lcom/android/camera/fragment/sticker/FragmentSticker$StickerPagerAdapter;
    iget-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v5, v4}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 54
    iget-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v6, Lcom/android/camera/fragment/sticker/FragmentSticker$1;

    invoke-direct {v6, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker$1;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/NoScrollViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 76
    const v5, 0x7f0a004b

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RadioGroup;

    iput-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    .line 77
    iget-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    new-instance v6, Lcom/android/camera/fragment/sticker/FragmentSticker$2;

    invoke-direct {v6, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker$2;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V

    invoke-virtual {v5, v6}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 95
    iget-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mRadioGroup:Landroid/widget/RadioGroup;

    const v6, 0x7f0a004c

    invoke-virtual {v5, v6}, Landroid/widget/RadioGroup;->check(I)V

    .line 97
    const v5, 0x7f0a000f

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mBackButton:Landroid/widget/ImageView;

    .line 98
    iget-object v5, p0, Lcom/android/camera/fragment/sticker/FragmentSticker;->mBackButton:Landroid/widget/ImageView;

    new-instance v6, Lcom/android/camera/fragment/sticker/FragmentSticker$3;

    invoke-direct {v6, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker$3;-><init>(Lcom/android/camera/fragment/sticker/FragmentSticker;)V

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v5

    invoke-static {v5}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;)Z

    .line 118
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 4
    .param p1, "callingFrom"    # I

    .prologue
    const/4 v3, 0x0

    .line 193
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa0

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 194
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-nez v0, :cond_0

    .line 195
    return v3

    .line 197
    :cond_0
    const v1, 0x7f0a009c

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xff

    if-eq v1, v2, :cond_1

    .line 198
    return v3

    .line 201
    :cond_1
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 202
    const/4 v1, 0x1

    return v1
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 0
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
    .line 146
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 147
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 179
    const/16 v0, 0xa7

    .line 180
    const/16 v1, 0xa1

    .line 178
    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 2

    .prologue
    .line 186
    const/16 v0, 0xa8

    .line 187
    const/16 v1, 0xa2

    .line 185
    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 122
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 123
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 125
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 129
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 130
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/sticker/FragmentSticker;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 132
    return-void
.end method
