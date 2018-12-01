.class public Lcom/android/camera/fragment/FragmentBeauty;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBeauty.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$FrontBeautyProtocol;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;
    }
.end annotation


# instance fields
.field private mBackButton:Landroid/widget/ImageView;

.field private mBeautyAdvance:Landroid/widget/TextView;

.field private mBeautyLevel:Landroid/widget/TextView;

.field private mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mDotHintDrawable:Landroid/graphics/drawable/Drawable;

.field private mViewPager:Lcom/android/camera/ui/NoScrollViewPager;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentBeauty;)Landroid/widget/TextView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBeauty;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method

.method private animateExpanding(Z)V
    .locals 10
    .param p1, "expand"    # Z

    .prologue
    const-wide/16 v8, 0xc8

    const/4 v6, 0x0

    const-wide/16 v4, 0x12c

    .line 262
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    move-result v2

    div-int/lit8 v1, v2, 0x2

    .line 263
    .local v1, "distanceLevel":I
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 265
    .local v0, "distanceAdvance":I
    if-nez p1, :cond_0

    .line 266
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 267
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 266
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 268
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 269
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    neg-int v3, v0

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 270
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 269
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 271
    new-instance v3, Lcom/android/camera/fragment/FragmentBeauty$4;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/FragmentBeauty$4;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    .line 269
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 310
    :goto_0
    return-void

    .line 288
    :cond_0
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 289
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 290
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 291
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 290
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 292
    new-instance v3, Lcom/android/camera/fragment/FragmentBeauty$5;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/FragmentBeauty$5;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    .line 290
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0
.end method

.method private hideAdvance()V
    .locals 4

    .prologue
    .line 253
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-static {v2}, Lcom/android/camera/Util;->getChildMeasureWidth(Landroid/view/View;)I

    move-result v2

    div-int/lit8 v1, v2, 0x2

    .line 254
    .local v1, "distanceLevel":I
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-static {v2}, Lcom/android/camera/Util;->getChildMeasureWidth(Landroid/view/View;)I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 255
    .local v0, "distanceAdvance":I
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    int-to-float v3, v1

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 256
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    neg-int v3, v0

    int-to-float v3, v3

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 257
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 258
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 259
    return-void
.end method

.method private removeFragmentBeauty()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 359
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 360
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-nez v0, :cond_0

    .line 361
    return v4

    .line 363
    :cond_0
    const v2, 0x7f0a009c

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v2

    const/16 v3, 0xfb

    if-eq v2, v3, :cond_1

    .line 364
    return v4

    .line 366
    :cond_1
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 369
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xaf

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 370
    .local v1, "tips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    .line 371
    const/4 v2, 0x1

    return v2
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 204
    const/16 v0, 0xfb

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 199
    const v0, 0x7f040002

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 73
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    .line 74
    .local v1, "height":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    iput v1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 75
    new-instance v3, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 77
    const v3, 0x7f0a000f

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBackButton:Landroid/widget/ImageView;

    .line 78
    sget v3, Lcom/android/camera/Util;->sNavigationBarHeight:I

    if-lez v3, :cond_6

    .line 79
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBackButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    sget v4, Lcom/android/camera/Util;->sNavigationBarHeight:I

    iput v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 80
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBackButton:Landroid/widget/ImageView;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 96
    :goto_0
    const v3, 0x7f0a000e

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ui/NoScrollViewPager;

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .local v0, "fragmentList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 99
    new-instance v3, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/LegacyBeautyLevelFragment;-><init>()V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    new-instance v3, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;-><init>()V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    :cond_0
    :goto_1
    new-instance v3, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-direct {v3, p0, v4, v0}, Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;-><init>(Lcom/android/camera/fragment/FragmentBeauty;Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    .line 111
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyPagerAdapter:Lcom/android/camera/fragment/FragmentBeauty$BeautyPagerAdapter;

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/NoScrollViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 112
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v3, v6}, Lcom/android/camera/ui/NoScrollViewPager;->setFocusable(Z)V

    .line 113
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v4, Lcom/android/camera/fragment/FragmentBeauty$2;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentBeauty$2;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/NoScrollViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 119
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    new-instance v4, Lcom/android/camera/fragment/FragmentBeauty$3;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentBeauty$3;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/NoScrollViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 163
    const v3, 0x7f0a000c

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    .line 164
    const v3, 0x7f0a000d

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    .line 165
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 169
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    const v4, 0x7f0f01a7

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 170
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    const v4, 0x7f0f01a8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 172
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isSupport3DFaceBeauty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 173
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200cc

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mDotHintDrawable:Landroid/graphics/drawable/Drawable;

    .line 174
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBeautyRemodelingClicked()Z

    move-result v3

    if-nez v3, :cond_2

    .line 175
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentBeauty;->mDotHintDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v8, v8, v4, v8}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 181
    :cond_2
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 182
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/BeautyParameters;->isFaceBeautyOn()Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    .line 181
    if-nez v3, :cond_a

    .line 183
    :cond_3
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/BeautyParameters;->getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v3

    array-length v3, v3

    if-nez v3, :cond_b

    const/4 v2, 0x1

    .line 184
    .local v2, "hideAdvance":Z
    :goto_2
    const-string/jumbo v3, "pref_camera_face_beauty_key"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautySwitch()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    if-eqz v2, :cond_c

    .line 186
    :cond_4
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v3, v6, v6}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    .line 187
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setActivated(Z)V

    .line 188
    if-eqz v2, :cond_5

    .line 189
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->hideAdvance()V

    .line 195
    :cond_5
    :goto_3
    return-void

    .line 82
    .end local v0    # "fragmentList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    .end local v2    # "hideAdvance":Z
    :cond_6
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 83
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBackButton:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBeauty;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 84
    const v5, 0x7f0f00e0

    .line 83
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 86
    :cond_7
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBackButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/android/camera/fragment/FragmentBeauty$1;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentBeauty$1;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0

    .line 101
    .restart local v0    # "fragmentList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/app/Fragment;>;"
    :cond_8
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 102
    new-instance v3, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;-><init>()V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/BeautyParameters;->getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_0

    .line 104
    new-instance v3, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;-><init>()V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 107
    :cond_9
    new-instance v3, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/BeautyLevelFragment;-><init>()V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v3, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 181
    :cond_a
    const/4 v2, 0x1

    .restart local v2    # "hideAdvance":Z
    goto :goto_2

    .line 183
    .end local v2    # "hideAdvance":Z
    :cond_b
    const/4 v2, 0x0

    .restart local v2    # "hideAdvance":Z
    goto :goto_2

    .line 192
    :cond_c
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v3, v7, v6}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    .line 193
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setActivated(Z)V

    goto :goto_3
.end method

.method public onBackEvent(I)Z
    .locals 1
    .param p1, "callingFrom"    # I

    .prologue
    .line 238
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBeauty;->removeFragmentBeauty()Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 314
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 331
    :cond_0
    :goto_0
    return-void

    .line 316
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setActivated(Z)V

    .line 317
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setActivated(Z)V

    .line 318
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    .line 322
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyLevel:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setActivated(Z)V

    .line 323
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setActivated(Z)V

    .line 324
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mViewPager:Lcom/android/camera/ui/NoScrollViewPager;

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/ui/NoScrollViewPager;->setCurrentItem(IZ)V

    .line 325
    invoke-static {}, Lcom/android/camera/Device;->isSupport3DFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBeautyRemodelingClicked()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 326
    invoke-static {}, Lcom/android/camera/CameraSettings;->setBeautyRemodelingClicked()V

    .line 327
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mDotHintDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 314
    :pswitch_data_0
    .packed-switch 0x7f0a000c
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 354
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 355
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 1
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
    .line 230
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 231
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->onBackEvent(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    return-void

    .line 234
    :cond_0
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 4
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 210
    const/16 v1, 0xa7

    .line 211
    const/16 v2, 0xa1

    .line 209
    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 212
    .local v0, "animation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 213
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 214
    return-object v0
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 4

    .prologue
    .line 220
    const/16 v1, 0xa8

    .line 221
    const/16 v2, 0xa2

    .line 219
    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 222
    .local v0, "animation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 223
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 224
    return-object v0
.end method

.method public refreshBottomBeauty(Z)V
    .locals 2
    .param p1, "isClose"    # Z

    .prologue
    const/4 v1, 0x0

    .line 243
    if-nez p1, :cond_0

    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/BeautyParameters;->getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_1

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 245
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentBeauty;->animateExpanding(Z)V

    .line 250
    :goto_0
    return-void

    .line 247
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBeauty;->mBeautyAdvance:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 248
    xor-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentBeauty;->animateExpanding(Z)V

    goto :goto_0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 59
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 60
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 61
    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 62
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 67
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBeauty;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 68
    const/16 v0, 0xc2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 69
    return-void
.end method
