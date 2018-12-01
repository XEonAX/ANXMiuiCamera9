.class public Lcom/android/camera/fragment/top/FragmentTopAlert;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopAlert.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/top/FragmentTopAlert$1;,
        Lcom/android/camera/fragment/top/FragmentTopAlert$2;,
        Lcom/android/camera/fragment/top/FragmentTopAlert$AlertImageType;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final HINT_DELAY_TIME:I

.field private mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

.field private mAiSceneSwitchHintText:Landroid/widget/TextView;

.field private mAlertAiSceneSwitchHintTime:J

.field private mAlertAiSceneSwitchHintTopMargin:I

.field private mAlertImageType:I

.field private mAlertImageView:Landroid/widget/ImageView;

.field private mAlertLiearLayout:Landroid/widget/LinearLayout;

.field private mAlertRecordingText:Landroid/widget/TextView;

.field private mAlertStatusValue:Landroid/widget/TextView;

.field private mBlingAnimation:Landroid/view/animation/AlphaAnimation;

.field private mLayoutTransition:Landroid/animation/LayoutTransition;

.field private mSelectorTopMargin:I

.field private mShow:Z

.field private mStateValueText:Ljava/lang/String;

.field public final mViewHideRunnable:Ljava/lang/Runnable;

.field private showAction:Ljava/lang/Runnable;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/top/FragmentTopAlert;)Lcom/android/camera/ui/ToggleSwitch;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/TextView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/top/FragmentTopAlert;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTopMargin:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/top/FragmentTopAlert;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/top/FragmentTopAlert;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mSelectorTopMargin:I

    return v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/top/FragmentTopAlert;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;
    .param p1, "view"    # Landroid/view/View;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getViewBottom(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method static synthetic -wrap2(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;
    .param p1, "view"    # Landroid/view/View;
    .param p2, "topMargin"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/fragment/top/FragmentTopAlert;Landroid/view/View;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/top/FragmentTopAlert;
    .param p1, "view"    # Landroid/view/View;
    .param p2, "margin"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/top/FragmentTopAlert;->TAG:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 106
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 109
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 284
    const/16 v0, 0x7d0

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->HINT_DELAY_TIME:I

    .line 286
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$1;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->showAction:Ljava/lang/Runnable;

    .line 344
    new-instance v0, Lcom/android/camera/fragment/top/FragmentTopAlert$2;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/FragmentTopAlert$2;-><init>(Lcom/android/camera/fragment/top/FragmentTopAlert;)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    .line 50
    return-void
.end method

.method private customTransition()Landroid/animation/LayoutTransition;
    .locals 9

    .prologue
    const/4 v2, 0x2

    const/4 v8, 0x0

    const/4 v3, 0x1

    const-wide/16 v6, 0xc8

    const-wide/16 v4, 0x0

    .line 206
    new-instance v0, Landroid/animation/LayoutTransition;

    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 208
    .local v0, "transition":Landroid/animation/LayoutTransition;
    new-instance v1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 209
    invoke-virtual {v0, v2, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 210
    invoke-virtual {v0, v2, v6, v7}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 213
    new-instance v1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 214
    const/4 v1, 0x3

    invoke-virtual {v0, v1, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 215
    const/4 v1, 0x3

    invoke-virtual {v0, v1, v6, v7}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 218
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 219
    const/4 v1, 0x4

    invoke-virtual {v0, v1, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 220
    const/4 v1, 0x4

    invoke-virtual {v0, v1, v6, v7}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 223
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v8, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 224
    invoke-virtual {v0, v8, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 225
    invoke-virtual {v0, v8, v6, v7}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 228
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v3, v1}, Landroid/animation/LayoutTransition;->setInterpolator(ILandroid/animation/TimeInterpolator;)V

    .line 229
    invoke-virtual {v0, v3, v4, v5}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 230
    invoke-virtual {v0, v3, v6, v7}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 232
    invoke-virtual {v0, v3}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    .line 233
    return-object v0
.end method

.method private getAlertImageBottom()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 452
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    .line 453
    return v2

    .line 456
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 457
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 458
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    .line 457
    add-int/2addr v1, v2

    .line 459
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090020

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 457
    add-int/2addr v1, v2

    .line 460
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09009c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 457
    sub-int/2addr v1, v2

    return v1
.end method

.method private getUpdateZoom()Ljava/lang/String;
    .locals 6

    .prologue
    .line 488
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v2

    .line 489
    .local v2, "zoomRatio":F
    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, v2, v4

    if-nez v4, :cond_0

    .line 490
    const/4 v4, 0x0

    return-object v4

    .line 493
    :cond_0
    float-to-int v3, v2

    .line 494
    .local v3, "zoomSig":I
    int-to-float v4, v3

    sub-float v4, v2, v4

    const/high16 v5, 0x41200000    # 10.0f

    mul-float/2addr v4, v5

    float-to-int v1, v4

    .line 496
    .local v1, "zoomFraction":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "x "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 497
    .local v0, "text":Ljava/lang/String;
    return-object v0
.end method

.method private getViewBottom(Landroid/view/View;)I
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 464
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    .line 465
    return v2

    .line 468
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 469
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 470
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 469
    add-int/2addr v1, v2

    .line 471
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090020

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 469
    add-int/2addr v1, v2

    .line 472
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09009c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 469
    sub-int/2addr v1, v2

    return v1
.end method

.method private setAlertImageVisible(II)V
    .locals 2
    .param p1, "visible"    # I
    .param p2, "topMargin"    # I

    .prologue
    const/4 v1, 0x0

    .line 414
    if-nez p1, :cond_1

    .line 415
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 416
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 417
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 418
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 430
    :cond_0
    :goto_0
    return-void

    .line 422
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 423
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 425
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    .line 426
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 427
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->transViewAnim(Landroid/view/View;I)V

    goto :goto_0
.end method

.method private setViewMargin(Landroid/view/View;I)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "topMargin"    # I

    .prologue
    .line 445
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 446
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 447
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 448
    const/4 v1, 0x0

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 449
    return-void
.end method

.method private transViewAnim(Landroid/view/View;I)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "margin"    # I

    .prologue
    .line 433
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    .line 435
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 436
    .local v0, "params":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int v1, p2, v2

    .line 437
    .local v1, "translateY":I
    new-instance v2, Lcom/android/camera/animation/type/TranslateYOnSubscribe;

    invoke-direct {v2, p1, v1}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;-><init>(Landroid/view/View;I)V

    .line 438
    const/16 v3, 0x64

    .line 437
    invoke-virtual {v2, v3}, Lcom/android/camera/animation/type/TranslateYOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 441
    .end local v0    # "params":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v1    # "translateY":I
    :cond_0
    return-void
.end method


# virtual methods
.method public alertAiSceneSelector(IILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V
    .locals 9
    .param p1, "visible"    # I
    .param p2, "topMargin"    # I
    .param p3, "listener"    # Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;

    .prologue
    const-wide/16 v2, 0x0

    const/4 v8, 0x0

    .line 312
    if-nez p1, :cond_2

    .line 313
    iput p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mSelectorTopMargin:I

    .line 314
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x7d0

    sub-long v0, v6, v4

    .line 315
    .local v0, "delayTime":J
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->showAction:Ljava/lang/Runnable;

    cmp-long v6, v0, v2

    if-gez v6, :cond_0

    move-wide v0, v2

    .end local v0    # "delayTime":J
    :cond_0
    invoke-virtual {v4, v5, v0, v1}, Lcom/android/camera/ui/ToggleSwitch;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 326
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v2, v8}, Lcom/android/camera/ui/ToggleSwitch;->setChecked(Z)V

    .line 327
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v2, p3}, Lcom/android/camera/ui/ToggleSwitch;->setOnCheckedChangeListener(Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 328
    return-void

    .line 317
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->showAction:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ToggleSwitch;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 318
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v2}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    .line 319
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 320
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 321
    new-instance v3, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    .line 320
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 322
    const/4 v3, 0x0

    .line 320
    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    .line 322
    const-wide/16 v4, 0x190

    .line 320
    invoke-virtual {v2, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 323
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ToggleSwitch;->setVisibility(I)V

    goto :goto_0
.end method

.method public alertAiSceneSwitchHint(II)V
    .locals 4
    .param p1, "visible"    # I
    .param p2, "topMargin"    # I

    .prologue
    const/4 v2, 0x0

    .line 331
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 332
    iput p2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTopMargin:I

    .line 333
    if-nez p1, :cond_0

    .line 334
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    const v1, 0x7f0f01cc

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 338
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 339
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertAiSceneSwitchHintTime:J

    .line 340
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 341
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mViewHideRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 342
    return-void

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    const v1, 0x7f0f01cd

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method public alertFlash(IIZ)V
    .locals 3
    .param p1, "visible"    # I
    .param p2, "topMargin"    # I
    .param p3, "torch"    # Z

    .prologue
    .line 260
    if-nez p1, :cond_4

    .line 261
    if-eqz p3, :cond_0

    const/4 v0, 0x2

    .line 262
    .local v0, "newType":I
    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-ne v1, v0, :cond_1

    .line 263
    return-void

    .line 261
    .end local v0    # "newType":I
    :cond_0
    const/4 v0, 0x1

    .restart local v0    # "newType":I
    goto :goto_0

    .line 265
    :cond_1
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 266
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/android/camera/Device;->isSupportFrontFlash()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 268
    const/4 p3, 0x0

    .line 270
    .end local p3    # "torch":Z
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    if-eqz p3, :cond_3

    .line 271
    const v1, 0x7f020099

    .line 270
    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 279
    .end local v0    # "newType":I
    :goto_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setAlertImageVisible(II)V

    .line 280
    return-void

    .line 271
    .restart local v0    # "newType":I
    :cond_3
    const v1, 0x7f020098

    goto :goto_1

    .line 273
    .end local v0    # "newType":I
    .restart local p3    # "torch":Z
    :cond_4
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_5

    .line 274
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_5

    .line 275
    return-void

    .line 277
    :cond_5
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    goto :goto_2
.end method

.method public alertHDR(IIZ)V
    .locals 3
    .param p1, "visible"    # I
    .param p2, "topMargin"    # I
    .param p3, "live"    # Z

    .prologue
    .line 241
    if-nez p1, :cond_3

    .line 242
    if-eqz p3, :cond_0

    const/4 v0, 0x4

    .line 243
    .local v0, "newType":I
    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    if-ne v1, v0, :cond_1

    .line 244
    return-void

    .line 242
    .end local v0    # "newType":I
    :cond_0
    const/4 v0, 0x3

    .restart local v0    # "newType":I
    goto :goto_0

    .line 246
    :cond_1
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 247
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    if-eqz p3, :cond_2

    .line 248
    const v1, 0x7f02009b

    .line 247
    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 256
    .end local v0    # "newType":I
    :goto_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setAlertImageVisible(II)V

    .line 257
    return-void

    .line 248
    .restart local v0    # "newType":I
    :cond_2
    const v1, 0x7f02009a

    goto :goto_1

    .line 250
    .end local v0    # "newType":I
    :cond_3
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_4

    .line 251
    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_4

    .line 252
    return-void

    .line 254
    :cond_4
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    goto :goto_2
.end method

.method public alertUpdateValue(II)V
    .locals 5
    .param p1, "type"    # I
    .param p2, "topMargin"    # I

    .prologue
    const/4 v4, 0x0

    .line 355
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 359
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 360
    const/16 v3, 0xb6

    .line 359
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 361
    .local v0, "dualController":Lcom/android/camera/protocol/ModeProtocol$DualController;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->isZoomVisible()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 362
    return-void

    .line 365
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getUpdateZoom()Ljava/lang/String;

    move-result-object v1

    .line 366
    .local v1, "zoomValue":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 367
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 370
    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 371
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_2

    .line 372
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_3

    .line 373
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getAlertImageBottom()I

    move-result v3

    invoke-direct {p0, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 377
    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 380
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 384
    :goto_1
    return-void

    .line 375
    :cond_3
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-direct {p0, v2, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    goto :goto_0

    .line 382
    :cond_4
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method public clear()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 395
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mStateValueText:Ljava/lang/String;

    .line 396
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageType:I

    .line 397
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 398
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 400
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_1

    .line 401
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 403
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0}, Lcom/android/camera/ui/ToggleSwitch;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_2

    .line 404
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ToggleSwitch;->setVisibility(I)V

    .line 406
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_3

    .line 407
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 409
    :cond_3
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 137
    const/16 v0, 0xfd

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 132
    const v0, 0x7f04001b

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 115
    const v0, 0x7f0a0055

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertImageView:Landroid/widget/ImageView;

    .line 116
    const v0, 0x7f0a0053

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    .line 117
    const v0, 0x7f0a0057

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertStatusValue:Landroid/widget/TextView;

    .line 118
    const v0, 0x7f0a0058

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ToggleSwitch;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSelectView:Lcom/android/camera/ui/ToggleSwitch;

    .line 119
    const v0, 0x7f0a0056

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAiSceneSwitchHintText:Landroid/widget/TextView;

    .line 120
    const v0, 0x7f0a0054

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertLiearLayout:Landroid/widget/LinearLayout;

    .line 121
    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    sget v1, Lcom/android/camera/Util;->sStatusBarHeight:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setViewMargin(Landroid/view/View;I)V

    .line 124
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->customTransition()Landroid/animation/LayoutTransition;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLayoutTransition:Landroid/animation/LayoutTransition;

    .line 125
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertLiearLayout:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 127
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 128
    return-void
.end method

.method public isShow()Z
    .locals 1

    .prologue
    .line 391
    iget-boolean v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShow:Z

    return v0
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
    .line 157
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 160
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clear()V

    .line 161
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 162
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 142
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 143
    return-void
.end method

.method public setRecordingTimeState(I)V
    .locals 4
    .param p1, "state"    # I

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 166
    packed-switch p1, :pswitch_data_0

    .line 203
    :goto_0
    return-void

    .line 168
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    .line 180
    :goto_1
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 173
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    const-string/jumbo v1, "00:00"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 177
    :pswitch_3
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    const-string/jumbo v1, "00:10"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 183
    :pswitch_4
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0}, Landroid/view/animation/AlphaAnimation;->cancel()V

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 189
    :pswitch_5
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    if-nez v0, :cond_1

    .line 190
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v2, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    .line 191
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 192
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/AlphaAnimation;->setStartOffset(J)V

    .line 193
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 194
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 195
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 197
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 200
    :pswitch_6
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0}, Landroid/view/animation/AlphaAnimation;->cancel()V

    goto :goto_0

    .line 166
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 168
    :pswitch_data_1
    .packed-switch 0xa1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public setShow(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 387
    iput-boolean p1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mShow:Z

    .line 388
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    const/4 v1, 0x0

    .line 147
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 148
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0}, Landroid/view/animation/AlphaAnimation;->cancel()V

    .line 150
    iput-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mBlingAnimation:Landroid/view/animation/AlphaAnimation;

    .line 152
    :cond_0
    return-void
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopAlert;->mAlertRecordingText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    return-void
.end method
