.class public Lcom/android/camera/fragment/manually/FragmentManually;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentManually.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;
.implements Lcom/android/camera/fragment/manually/ManuallyListener;


# instance fields
.field private mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

.field private mCurrentAdjustType:I

.field private mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

.field private mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

.field private mIndicatorButton:Landroid/widget/ImageView;

.field private mIsHiding:Z

.field private mManuallyComponents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentData;",
            ">;"
        }
    .end annotation
.end field

.field private mManuallyParent:Landroid/view/ViewGroup;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mRecyclerViewLayout:Landroid/view/ViewGroup;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/manually/FragmentManually;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/manually/FragmentManually;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/manually/FragmentManually;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/manually/FragmentManually;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/manually/FragmentManually;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/manually/FragmentManually;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/manually/FragmentManually;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/manually/FragmentManually;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIsHiding:Z

    return p1
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 67
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 55
    return-void
.end method

.method private adjustViewBackground(I)V
    .locals 3
    .param p1, "currentMode"    # I

    .prologue
    .line 580
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 582
    .local v0, "uiStyle":I
    packed-switch v0, :pswitch_data_0

    .line 592
    :goto_0
    :pswitch_0
    return-void

    .line 584
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerViewLayout:Landroid/view/ViewGroup;

    const v2, 0x7f0d000a

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto :goto_0

    .line 589
    :pswitch_2
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerViewLayout:Landroid/view/ViewGroup;

    const v2, 0x7f0d000b

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    goto :goto_0

    .line 582
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private getExtraFragment()Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 542
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 543
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    return-object v0

    .line 545
    :cond_0
    return-object v1
.end method

.method private hideTips()V
    .locals 3

    .prologue
    .line 235
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 236
    .local v0, "bottomPopupTips":Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;
    if-eqz v0, :cond_0

    .line 237
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    .line 239
    :cond_0
    return-void
.end method

.method private initManually()V
    .locals 5

    .prologue
    .line 496
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->initManuallyDataList()Ljava/util/List;

    .line 497
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 498
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/manually/ManuallyDecoration;->setStyle(I)V

    .line 499
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 501
    new-instance v1, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;

    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    invoke-direct {v1, v2, p0, v3}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;-><init>(ILandroid/view/View$OnClickListener;Ljava/util/List;)V

    .line 502
    .local v1, "manuallyAdapter":Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 503
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090012

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 502
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 505
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getExtraFragment()Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    move-result-object v0

    .line 506
    .local v0, "fragmentManuallyExtra":Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
    if-eqz v0, :cond_0

    .line 507
    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->updateData()V

    .line 508
    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getCurrentTitle()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->setSelectedTitle(I)V

    .line 511
    :cond_0
    iput-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 512
    return-void
.end method

.method private initManuallyDataList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 309
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    if-nez v1, :cond_2

    .line 310
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    .line 315
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 317
    .local v0, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    new-instance v2, Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-direct {v2, v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    invoke-static {}, Lcom/android/camera/Device;->isSupportedManualFunction()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 319
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    new-instance v2, Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    invoke-direct {v2, v0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    new-instance v2, Lcom/android/camera/data/data/config/ComponentManuallyET;

    invoke-direct {v2, v0}, Lcom/android/camera/data/data/config/ComponentManuallyET;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    new-instance v2, Lcom/android/camera/data/data/config/ComponentManuallyISO;

    invoke-direct {v2, v0}, Lcom/android/camera/data/data/config/ComponentManuallyISO;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 323
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 324
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    new-instance v2, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    invoke-direct {v2, v0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    :cond_1
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    return-object v1

    .line 312
    .end local v0    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    :cond_2
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyComponents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    goto :goto_0
.end method

.method private initRecyclerView(ILcom/android/camera/fragment/manually/ManuallyListener;)I
    .locals 3
    .param p1, "targetType"    # I
    .param p2, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    const/4 v2, 0x0

    .line 431
    iput p1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 433
    packed-switch p1, :pswitch_data_0

    .line 454
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    return v0

    .line 435
    :pswitch_0
    iput v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 436
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 437
    return v2

    .line 440
    :pswitch_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 441
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->initManually()V

    goto :goto_0

    .line 445
    :pswitch_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 446
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/FragmentManually;->initScene(Lcom/android/camera/fragment/manually/ManuallyListener;)V

    goto :goto_0

    .line 450
    :pswitch_3
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 451
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/FragmentManually;->initTilt(Lcom/android/camera/fragment/manually/ManuallyListener;)V

    goto :goto_0

    .line 433
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private initScene(Lcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 5
    .param p1, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 515
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 517
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningSceneValue()Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    move-result-object v1

    .line 519
    .local v1, "componentRunningSceneValue":Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;

    .line 520
    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    .line 522
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v3, v3

    const/high16 v4, 0x40b00000    # 5.5f

    div-float/2addr v3, v4

    float-to-int v3, v3

    .line 519
    invoke-direct {v0, v1, v2, p1, v3}, Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;I)V

    .line 523
    .local v0, "adapter":Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 524
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090013

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 523
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 525
    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 526
    return-void
.end method

.method private initTilt(Lcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 5
    .param p1, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 529
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v1

    .line 530
    .local v1, "tilt":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 531
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/manually/ManuallyDecoration;->setStyle(I)V

    .line 532
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 534
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ManuallySingleAdapter;

    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    .line 535
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getItems()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    div-int/2addr v3, v4

    .line 534
    invoke-direct {v0, v1, v2, p1, v3}, Lcom/android/camera/fragment/manually/adapter/ManuallySingleAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;I)V

    .line 536
    .local v0, "adapter":Lcom/android/camera/fragment/manually/adapter/ManuallySingleAdapter;
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 537
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090012

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 536
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 538
    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 539
    return-void
.end method

.method private reInitManuallyLayout(ILjava/util/List;)V
    .locals 3
    .param p1, "targetType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    const/4 v1, 0x0

    .line 358
    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    if-ne v0, p1, :cond_0

    .line 359
    return-void

    .line 362
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 371
    :goto_0
    if-nez p1, :cond_1

    .line 372
    if-nez p2, :cond_2

    .line 373
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 382
    :cond_1
    :goto_1
    return-void

    .line 364
    :pswitch_0
    const/4 v0, 0x1

    invoke-direct {p0, v0, p0}, Lcom/android/camera/fragment/manually/FragmentManually;->initRecyclerView(ILcom/android/camera/fragment/manually/ManuallyListener;)I

    goto :goto_0

    .line 367
    :pswitch_1
    invoke-direct {p0, v1, p0}, Lcom/android/camera/fragment/manually/FragmentManually;->initRecyclerView(ILcom/android/camera/fragment/manually/ManuallyListener;)I

    goto :goto_0

    .line 375
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_3

    .line 376
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 378
    :cond_3
    new-instance v0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    const/16 v2, 0x50

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 362
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setManuallyLayoutViewVisible(I)V
    .locals 4
    .param p1, "targetVisible"    # I

    .prologue
    const/16 v3, 0x50

    const/4 v2, 0x0

    .line 460
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 461
    const/16 v1, 0xfe

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 459
    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 463
    packed-switch p1, :pswitch_data_0

    .line 493
    :goto_0
    return-void

    .line 465
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 466
    return-void

    .line 468
    :cond_0
    new-instance v0, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-direct {v0, v1, v3}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 474
    :pswitch_1
    iput v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 475
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 476
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 477
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 479
    :cond_1
    new-instance v0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-direct {v0, v1, v3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 485
    :pswitch_2
    iput v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    .line 486
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 487
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_0

    .line 489
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-static {v0, v3}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_0

    .line 463
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 336
    const/16 v0, 0xf7

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 331
    const v0, 0x7f04000f

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 77
    .local v1, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 79
    const v2, 0x7f0a0039

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    .line 80
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    const v2, 0x7f0a003a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    .line 83
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    const v3, 0x7f0a003c

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerViewLayout:Landroid/view/ViewGroup;

    .line 84
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerViewLayout:Landroid/view/ViewGroup;

    const v3, 0x7f0a003d

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    iput-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 86
    new-instance v2, Lcom/android/camera/fragment/manually/ManuallyDecoration;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0009

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3}, Lcom/android/camera/fragment/manually/ManuallyDecoration;-><init>(II)V

    iput-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mDecoration:Lcom/android/camera/fragment/manually/ManuallyDecoration;

    .line 88
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 89
    .local v0, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 90
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 92
    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    invoke-direct {p0, v2}, Lcom/android/camera/fragment/manually/FragmentManually;->adjustViewBackground(I)V

    .line 93
    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v5}, Lcom/android/camera/fragment/manually/FragmentManually;->provideAnimateElement(ILjava/util/List;Z)V

    .line 94
    return-void
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3
    .param p1, "arrivedType"    # I

    .prologue
    .line 569
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 571
    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_0

    .line 572
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 573
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 574
    new-instance v0, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    const/16 v2, 0x50

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 576
    :cond_0
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 3
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 551
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 553
    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/manually/FragmentManually;->adjustViewBackground(I)V

    .line 555
    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v1, :cond_0

    .line 556
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->initManuallyDataList()Ljava/util/List;

    .line 557
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 558
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 561
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getExtraFragment()Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    move-result-object v0

    .line 562
    .local v0, "fragmentManuallyExtra":Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
    if-eqz v0, :cond_1

    .line 563
    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->notifyDataChanged(II)V

    .line 565
    :cond_1
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 8
    .param p1, "callingFrom"    # I

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 121
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 122
    const/4 v1, 0x3

    if-ne p1, v1, :cond_1

    .line 123
    :cond_0
    return v3

    .line 126
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIsHiding:Z

    if-eqz v1, :cond_2

    .line 127
    return v3

    .line 130
    :cond_2
    iput-boolean v5, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIsHiding:Z

    .line 131
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    .line 132
    .local v0, "height":I
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 134
    int-to-float v2, v0

    .line 132
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 135
    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 132
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 136
    new-instance v2, Lcom/android/camera/fragment/manually/FragmentManually$1;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/manually/FragmentManually$1;-><init>(Lcom/android/camera/fragment/manually/FragmentManually;)V

    .line 132
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 145
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 146
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 147
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 148
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 150
    int-to-float v2, v0

    .line 148
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 151
    const-wide/16 v2, 0x12c

    .line 148
    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 152
    new-instance v2, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v2}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 148
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 153
    const/high16 v2, 0x3f800000    # 1.0f

    .line 148
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 156
    return v5
.end method

.method public onClick(Landroid/view/View;)V
    .locals 12
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v10, 0x64

    const/4 v8, 0x0

    const/4 v7, -0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 161
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->isEnableClick()Z

    move-result v3

    if-nez v3, :cond_0

    .line 162
    return-void

    .line 166
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 167
    const/16 v4, 0xa1

    .line 166
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 168
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 169
    return-void

    .line 172
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 196
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentData;

    .line 197
    .local v1, "componentData":Lcom/android/camera/data/data/ComponentData;
    invoke-virtual {v1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v2

    .line 199
    .local v2, "title":I
    packed-switch v2, :pswitch_data_1

    .line 208
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getExtraFragment()Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    .line 210
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    if-nez v3, :cond_2

    .line 211
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->hideTips()V

    .line 212
    new-instance v3, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-direct {v3}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;-><init>()V

    iput-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    .line 213
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    iget v4, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    const/4 v5, 0x1

    invoke-virtual {v3, v1, v4, v5, p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->setComponentData(Lcom/android/camera/data/data/ComponentData;IZLcom/android/camera/fragment/manually/ManuallyListener;)V

    .line 214
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    .line 216
    iget-object v4, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    .line 217
    iget-object v5, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v5}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getFragmentTag()Ljava/lang/String;

    move-result-object v5

    .line 215
    const v6, 0x7f0a003b

    .line 214
    invoke-static {v3, v6, v4, v5}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 218
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;

    invoke-virtual {v3, v2}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->setSelectedTitle(I)V

    .line 231
    .end local v1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    .end local v2    # "title":I
    :goto_0
    return-void

    .line 174
    :pswitch_0
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 175
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    .line 178
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 175
    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 181
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    .line 182
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 181
    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3, v10, v11}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    .line 185
    new-instance v4, Lcom/android/camera/fragment/manually/FragmentManually$2;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/manually/FragmentManually$2;-><init>(Lcom/android/camera/fragment/manually/FragmentManually;)V

    .line 181
    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    .line 201
    .restart local v1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    .restart local v2    # "title":I
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    .line 202
    const/16 v4, 0xfe

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 201
    invoke-static {v3, v4}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 203
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;

    invoke-virtual {v3, v7}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->setSelectedTitle(I)V

    .line 204
    invoke-virtual {p0, v1, v5, v5, v8}, Lcom/android/camera/fragment/manually/FragmentManually;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 219
    :cond_2
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v3}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getCurrentTitle()I

    move-result v3

    if-ne v3, v2, :cond_3

    .line 220
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v3}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->animateOut()V

    .line 221
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;

    invoke-virtual {v3, v7}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->setSelectedTitle(I)V

    goto :goto_0

    .line 223
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->hideTips()V

    .line 224
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v3, v1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->resetData(Lcom/android/camera/data/data/ComponentData;)V

    .line 225
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;

    invoke-virtual {v3, v2}, Lcom/android/camera/fragment/manually/adapter/ManuallyAdapter;->setSelectedTitle(I)V

    goto/16 :goto_0

    .line 172
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0039
        :pswitch_0
    .end packed-switch

    .line 199
    :pswitch_data_1
    .packed-switch 0x7f0f016d
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .locals 1
    .param p1, "transit"    # I
    .param p2, "enter"    # Z
    .param p3, "nextAnim"    # I

    .prologue
    .line 386
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->onCreateAnimation(IZI)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method public onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "oldValue"    # Ljava/lang/String;
    .param p3, "newValue"    # Ljava/lang/String;
    .param p4, "isCustomValue"    # Z

    .prologue
    .line 244
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->isEnableClick()Z

    move-result v3

    if-nez v3, :cond_0

    .line 245
    return-void

    .line 249
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 250
    const/16 v4, 0xa1

    .line 249
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 251
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 252
    return-void

    .line 263
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 264
    const/16 v4, 0xae

    .line 263
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;

    .line 265
    .local v2, "manuallyValueChanged":Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;
    if-nez v2, :cond_2

    .line 266
    return-void

    .line 270
    :cond_2
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 296
    .end local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    :goto_0
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    if-nez v3, :cond_4

    .line 297
    return-void

    .line 272
    .restart local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    :sswitch_0
    const-string/jumbo v3, "manual"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 273
    invoke-direct {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getExtraFragment()Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    move-result-object v1

    .local v1, "fragmentManuallyExtra":Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
    move-object v3, p1

    .line 274
    check-cast v3, Lcom/android/camera/data/data/config/ComponentManuallyWB;

    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->showCustomWB(Lcom/android/camera/data/data/config/ComponentManuallyWB;)V

    .line 276
    .end local v1    # "fragmentManuallyExtra":Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
    :cond_3
    check-cast p1, Lcom/android/camera/data/data/config/ComponentManuallyWB;

    .end local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    invoke-interface {v2, p1, p3, p4}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onWBValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyWB;Ljava/lang/String;Z)V

    goto :goto_0

    .line 280
    .restart local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    :sswitch_1
    check-cast p1, Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    .end local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    invoke-interface {v2, p1, p2, p3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onFocusValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyFocus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 284
    .restart local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    :sswitch_2
    check-cast p1, Lcom/android/camera/data/data/config/ComponentManuallyET;

    .end local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    invoke-interface {v2, p1, p3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onETValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyET;Ljava/lang/String;)V

    goto :goto_0

    .line 288
    .restart local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    :sswitch_3
    check-cast p1, Lcom/android/camera/data/data/config/ComponentManuallyISO;

    .end local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    invoke-interface {v2, p1, p3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onISOValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyISO;Ljava/lang/String;)V

    goto :goto_0

    .line 292
    .restart local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    :sswitch_4
    check-cast p1, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    .end local p1    # "componentData":Lcom/android/camera/data/data/ComponentData;
    iget v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentMode:I

    invoke-interface {v2, p1, v3}, Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;->onDualLensSwitch(Lcom/android/camera/data/data/config/ComponentManuallyDualLens;I)V

    goto :goto_0

    .line 300
    :cond_4
    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v4, Lcom/android/camera/fragment/manually/FragmentManually$3;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/manually/FragmentManually$3;-><init>(Lcom/android/camera/fragment/manually/FragmentManually;)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 306
    return-void

    .line 270
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0f005b -> :sswitch_0
        0x7f0f009d -> :sswitch_3
        0x7f0f010a -> :sswitch_2
        0x7f0f013a -> :sswitch_1
        0x7f0f016d -> :sswitch_4
    .end sparse-switch
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
    .line 342
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 344
    const/4 v0, 0x0

    .line 346
    .local v0, "targetType":I
    packed-switch p1, :pswitch_data_0

    .line 352
    :goto_0
    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/manually/FragmentManually;->reInitManuallyLayout(ILjava/util/List;)V

    .line 353
    return-void

    .line 348
    :pswitch_0
    const/4 v0, 0x1

    .line 349
    goto :goto_0

    .line 346
    nop

    :pswitch_data_0
    .packed-switch 0xa7
        :pswitch_0
    .end packed-switch
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 1
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 391
    const/4 v0, 0x0

    return-object v0
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .prologue
    .line 397
    const/4 v0, 0x0

    return-object v0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 98
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 99
    const/16 v0, 0xb5

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 100
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/manually/FragmentManually;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 101
    return-void
.end method

.method public setManuallyVisible(IILcom/android/camera/fragment/manually/ManuallyListener;)I
    .locals 3
    .param p1, "type"    # I
    .param p2, "targetVisible"    # I
    .param p3, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 405
    invoke-direct {p0, p1, p3}, Lcom/android/camera/fragment/manually/FragmentManually;->initRecyclerView(ILcom/android/camera/fragment/manually/ManuallyListener;)I

    move-result v0

    .line 406
    .local v0, "height":I
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    if-eqz v1, :cond_0

    .line 407
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 409
    :cond_0
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/FragmentManually;->setManuallyLayoutViewVisible(I)V

    .line 410
    return v0
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 105
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 107
    const/16 v1, 0xb5

    invoke-interface {p1, v1, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 108
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/manually/FragmentManually;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 110
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 112
    .local v0, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    if-eqz v1, :cond_0

    .line 113
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mFragmentManuallyExtra:Lcom/android/camera/fragment/manually/FragmentManuallyExtra;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 116
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 117
    return-void
.end method

.method public visibleHeight()I
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 415
    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mCurrentAdjustType:I

    if-nez v0, :cond_0

    .line 416
    return v1

    .line 418
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 419
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mIndicatorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    return v0

    .line 422
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManually;->mManuallyParent:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    .line 423
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManually;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090090

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 422
    add-int/2addr v0, v1

    return v0
.end method
