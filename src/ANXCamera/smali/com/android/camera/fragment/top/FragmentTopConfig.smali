.class public Lcom/android/camera/fragment/top/FragmentTopConfig;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopConfig.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;
.implements Lcom/android/camera/protocol/ModeProtocol$TopAlert;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# instance fields
.field private mBeforeMode:I

.field private mConfigViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentAiSceneLevel:I

.field private mDisplayRectTopMargin:I

.field private mExpandView:Landroid/support/v7/widget/RecyclerView;

.field private mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

.field private mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

.field private mIsRTL:Z

.field private mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

.field private mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

.field private mTopConfigMenu:Landroid/view/View;

.field private mTopDrawableWidth:I

.field private mTopExtraParent:Landroid/view/ViewGroup;

.field private mTotalWidth:I

.field private mViewPadding:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 92
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    .line 100
    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mBeforeMode:I

    .line 65
    return-void

    .line 92
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V
    .locals 16
    .param p1, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "anchorView"    # Landroid/view/View;
    .param p3, "tag"    # I

    .prologue
    .line 391
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 392
    return-void

    .line 397
    :cond_0
    new-instance v2, Lcom/android/camera/fragment/top/ExpandAdapter;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v2, v0, v1}, Lcom/android/camera/fragment/top/ExpandAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;Lcom/android/camera/fragment/top/ExpandAdapter$ExpandListener;)V

    .line 401
    .local v2, "adapter":Lcom/android/camera/fragment/top/ExpandAdapter;
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    .line 402
    const v14, 0x7f09001a

    .line 401
    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 402
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    .line 401
    mul-int v6, v13, v14

    .line 403
    .local v6, "recyclerViewWidth":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v13}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    iput v6, v13, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 404
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v13, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 405
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 406
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/support/v7/widget/RecyclerView;->setTag(Ljava/lang/Object;)V

    .line 412
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f090020

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 413
    .local v5, "padding":I
    mul-int/lit8 v3, v5, 0x3

    .line 415
    .local v3, "offset":I
    const/4 v12, 0x0

    .line 416
    .local v12, "targetViewLeft":I
    const/4 v8, 0x0

    .line 417
    .local v8, "srcRecyclerViewLeft":I
    const/4 v11, 0x0

    .line 419
    .local v11, "targetRecyclerViewLeft":I
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImagePosition(I)I

    move-result v7

    .line 420
    .local v7, "srcPosition":I
    const/4 v10, 0x0

    .line 421
    .local v10, "targetPosition":I
    const/4 v9, 0x0

    .line 424
    .local v9, "state":I
    if-nez v7, :cond_3

    .line 425
    const/4 v10, 0x0

    .line 426
    const/4 v9, 0x0

    .line 438
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v13, :cond_1

    rsub-int/lit8 v9, v9, 0x4

    .end local v9    # "state":I
    :cond_1
    packed-switch v9, :pswitch_data_0

    .line 470
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    iput-object v14, v13, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 471
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v14

    iput v14, v13, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    .line 472
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    iput v8, v13, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    .line 474
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    move/from16 v0, p3

    invoke-virtual {v13, v0, v14}, Lcom/android/camera/fragment/top/LastAnimationComponent;->hideOtherViews(ILjava/util/List;)V

    .line 476
    if-eq v7, v10, :cond_2

    .line 477
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    move-object/from16 v0, p2

    iput-object v0, v13, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    .line 478
    invoke-static/range {p2 .. p2}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 479
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v14

    sub-int v14, v12, v14

    int-to-float v14, v14

    .line 478
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 480
    const-wide/16 v14, 0x0

    .line 478
    invoke-virtual {v13, v14, v15}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 481
    const-wide/16 v14, 0x12c

    .line 478
    invoke-virtual {v13, v14, v15}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 482
    sget-object v14, Lcom/android/camera/fragment/top/LastAnimationComponent;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 478
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    invoke-virtual {v13}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 486
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 487
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v13, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    sub-int v4, v13, v6

    .line 488
    .local v4, "originalRecyclerViewLeft":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    sub-int v14, v8, v4

    int-to-float v14, v14

    invoke-static {v13, v14}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 489
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v13}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 490
    const/high16 v14, 0x3f800000    # 1.0f

    .line 489
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 491
    sub-int v14, v11, v4

    int-to-float v14, v14

    .line 489
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 492
    const-wide/16 v14, 0x12c

    .line 489
    invoke-virtual {v13, v14, v15}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 493
    sget-object v14, Lcom/android/camera/fragment/top/LastAnimationComponent;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 489
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    invoke-virtual {v13}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 496
    return-void

    .line 427
    .end local v4    # "originalRecyclerViewLeft":I
    .restart local v9    # "state":I
    :cond_3
    const/4 v13, 0x6

    if-ne v7, v13, :cond_4

    .line 428
    const/4 v10, 0x6

    .line 429
    const/4 v9, 0x4

    goto/16 :goto_0

    .line 430
    :cond_4
    const/4 v13, 0x4

    if-eq v7, v13, :cond_5

    const/4 v13, 0x5

    if-ne v7, v13, :cond_6

    .line 431
    :cond_5
    const/4 v10, 0x3

    .line 432
    const/4 v9, 0x2

    .line 430
    goto/16 :goto_0

    .line 434
    :cond_6
    const/4 v10, 0x0

    .line 435
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 440
    .end local v9    # "state":I
    :pswitch_0
    const/4 v12, 0x0

    .line 441
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getRight()I

    move-result v13

    sub-int v8, v13, v3

    .line 442
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v13

    add-int/lit8 v11, v13, 0x0

    .line 443
    goto/16 :goto_1

    .line 445
    :pswitch_1
    const/4 v12, 0x0

    .line 446
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getRight()I

    move-result v13

    add-int v8, v13, v3

    .line 447
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v13

    add-int/lit8 v11, v13, 0x0

    .line 448
    goto/16 :goto_1

    .line 450
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v14

    sub-int v12, v13, v14

    .line 451
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v13

    sub-int/2addr v13, v6

    sub-int v8, v13, v3

    .line 452
    sub-int v11, v12, v6

    .line 453
    goto/16 :goto_1

    .line 455
    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v14

    sub-int v12, v13, v14

    .line 456
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v13

    sub-int/2addr v13, v6

    sub-int v8, v13, v3

    .line 457
    sub-int v11, v12, v6

    .line 458
    goto/16 :goto_1

    .line 460
    :pswitch_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v14

    sub-int v12, v13, v14

    .line 461
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    move-result v13

    sub-int/2addr v13, v6

    add-int v8, v13, v3

    .line 462
    sub-int v11, v12, v6

    .line 463
    goto/16 :goto_1

    .line 487
    :cond_7
    const/4 v4, 0x0

    .restart local v4    # "originalRecyclerViewLeft":I
    goto/16 :goto_2

    .line 438
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 4
    .param p1, "level"    # I

    .prologue
    .line 1203
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1204
    .local v1, "res":Landroid/content/res/Resources;
    const v3, 0x7f0b0001

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 1205
    .local v0, "icons":Landroid/content/res/TypedArray;
    if-ltz p1, :cond_0

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v3

    if-le p1, v3, :cond_1

    .line 1206
    :cond_0
    const/4 v3, 0x0

    return-object v3

    .line 1208
    :cond_1
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 1209
    .local v2, "result":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 1210
    return-object v2
.end method

.method private getAlertTopMargin()I
    .locals 5

    .prologue
    const v4, 0x7f090020

    .line 1102
    const/4 v1, 0x0

    .line 1104
    .local v1, "topMargin":I
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v3, 0xa5

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    if-nez v2, :cond_0

    .line 1105
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 1106
    .local v0, "screenWidth":I
    int-to-float v2, v0

    const/high16 v3, 0x3f400000    # 0.75f

    div-float/2addr v2, v3

    int-to-float v3, v0

    sub-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    float-to-int v2, v2

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    sub-int/2addr v2, v3

    .line 1107
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 1106
    add-int v1, v2, v3

    .line 1121
    .end local v0    # "screenWidth":I
    :goto_0
    return v1

    .line 1109
    :cond_0
    sget-boolean v2, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    sget v3, Lcom/android/camera/Util;->sStatusBarHeight:I

    if-ne v2, v3, :cond_1

    .line 1110
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int v1, v2, v3

    .line 1109
    goto :goto_0

    .line 1111
    :cond_1
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    if-lez v2, :cond_2

    .line 1112
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    .line 1113
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 1112
    add-int v1, v2, v3

    goto :goto_0

    .line 1115
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 1116
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 1115
    add-int v1, v2, v3

    goto :goto_0
.end method

.method private getFocusPeakImageResource()I
    .locals 3
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 360
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 361
    const-string/jumbo v2, "pref_camera_peak_key"

    .line 360
    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 362
    .local v0, "switchOn":Z
    const-string/jumbo v1, "zh"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 363
    if-eqz v0, :cond_0

    .line 364
    const v1, 0x7f0200b1

    return v1

    .line 366
    :cond_0
    const v1, 0x7f0200b4

    return v1

    .line 370
    :cond_1
    if-eqz v0, :cond_2

    .line 371
    const v1, 0x7f0200b3

    return v1

    .line 373
    :cond_2
    const v1, 0x7f0200b2

    return v1
.end method

.method private getHFRImageResource(I)I
    .locals 2
    .param p1, "mode"    # I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 380
    const/16 v1, 0xaa

    if-ne p1, v1, :cond_0

    const/4 v0, 0x1

    .line 381
    .local v0, "switchOn":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 382
    const v1, 0x7f0200ca

    return v1

    .line 380
    .end local v0    # "switchOn":Z
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "switchOn":Z
    goto :goto_0

    .line 384
    :cond_1
    const v1, 0x7f0200cb

    return v1
.end method

.method private getInitialMargin(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 186
    packed-switch p1, :pswitch_data_0

    .line 196
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 188
    :pswitch_1
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x3

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr v0, v1

    return v0

    .line 190
    :pswitch_2
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr v0, v1

    return v0

    .line 192
    :pswitch_3
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    return v0

    .line 194
    :pswitch_4
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    return v0

    .line 186
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method

.method private getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1090
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1091
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    return-object v0

    .line 1093
    :cond_0
    return-object v1
.end method

.method private getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
    .locals 2

    .prologue
    .line 1097
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 1098
    const/16 v1, 0xf5

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 1097
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    return-object v0
.end method

.method private reConfigTipImage()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1166
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    .line 1167
    .local v2, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    .line 1168
    .local v0, "componentConfigFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isClosed()Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_1

    .line 1169
    iget v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v3

    .line 1170
    .local v3, "flashValue":Ljava/lang/String;
    const-string/jumbo v5, "1"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1171
    invoke-virtual {p0, v6, v6, v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    .line 1172
    return-void

    .line 1173
    :cond_0
    const-string/jumbo v5, "2"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1174
    invoke-virtual {p0, v6, v7, v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    .line 1175
    return-void

    .line 1179
    .end local v3    # "flashValue":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v1

    .line 1180
    .local v1, "componentConfigHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_4

    .line 1181
    iget v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v5}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v4

    .line 1182
    .local v4, "hdrValue":Ljava/lang/String;
    const-string/jumbo v5, "on"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1183
    const-string/jumbo v5, "normal"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 1182
    if-eqz v5, :cond_3

    .line 1184
    :cond_2
    invoke-virtual {p0, v6, v6, v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    .line 1185
    return-void

    .line 1186
    :cond_3
    const-string/jumbo v5, "live"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1187
    invoke-virtual {p0, v6, v7, v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    .line 1188
    return-void

    .line 1191
    .end local v4    # "hdrValue":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method private resetImages()V
    .locals 9

    .prologue
    .line 816
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    .line 817
    .local v4, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v8

    .line 818
    .local v8, "cameraId":I
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v0, v8, v3}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v7

    .line 820
    .local v7, "cameraCapabilities":Lcom/android/camera2/CameraCapabilities;
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v0, v4, v8, v7}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 825
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v5, v0, :cond_0

    .line 826
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 827
    .local v2, "imageView":Landroid/widget/ImageView;
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfig(I)I

    move-result v1

    .line 828
    .local v1, "newType":I
    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z

    .line 829
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 825
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 831
    .end local v1    # "newType":I
    .end local v2    # "imageView":Landroid/widget/ImageView;
    :cond_0
    return-void
.end method

.method private setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z
    .locals 21
    .param p1, "newType"    # I
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "newMode"    # I
    .param p4, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;
    .param p5, "position"    # I
    .param p6, "isSwitchingMode"    # Z

    .prologue
    .line 589
    const/4 v15, 0x0

    .line 590
    .local v15, "newImageResourceId":I
    const/4 v7, 0x0

    .line 591
    .local v7, "contentDescriptionStringId":I
    sparse-switch p1, :sswitch_data_0

    .line 691
    :cond_0
    :goto_0
    if-lez v15, :cond_2

    .line 692
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 693
    .local v9, "drawable":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    move/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getInitialMargin(I)I

    move-result v13

    .line 694
    .local v13, "initialMargin":I
    if-lez v13, :cond_1

    .line 696
    invoke-virtual/range {p2 .. p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 699
    .local v14, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    move/from16 v18, v0

    if-eqz v18, :cond_f

    .line 700
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v18

    div-int/lit8 v18, v18, 0x2

    sub-int v18, v13, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    move/from16 v19, v0

    sub-int v18, v18, v19

    move/from16 v0, v18

    iput v0, v14, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 705
    .end local v14    # "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_1
    :goto_1
    if-nez p2, :cond_10

    .line 706
    const-string/jumbo v18, "FragmentTopConfig"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "newMode = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string/jumbo v20, ", newType = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    .end local v9    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v13    # "initialMargin":I
    :cond_2
    :goto_2
    const/16 v18, 0x1

    return v18

    .line 593
    :sswitch_0
    const/16 v18, 0x0

    return v18

    .line 596
    :sswitch_1
    invoke-virtual/range {p4 .. p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v5

    .line 597
    .local v5, "componentFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    invoke-virtual {v5}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_0

    .line 598
    move/from16 v0, p3

    invoke-virtual {v5, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v15

    .line 599
    move/from16 v0, p3

    invoke-virtual {v5, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v7

    .line 600
    if-nez p6, :cond_0

    .line 601
    move/from16 v0, p3

    invoke-virtual {v5, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v11

    .line 602
    .local v11, "flashValue":Ljava/lang/String;
    const-string/jumbo v18, "1"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 603
    const-string/jumbo v18, "101"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    .line 602
    if-eqz v18, :cond_4

    .line 604
    :cond_3
    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    goto/16 :goto_0

    .line 605
    :cond_4
    const-string/jumbo v18, "2"

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 606
    const/16 v18, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    goto/16 :goto_0

    .line 608
    :cond_5
    const/16 v18, 0x8

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertFlash(IZZ)V

    goto/16 :goto_0

    .line 614
    .end local v5    # "componentFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    .end local v11    # "flashValue":Ljava/lang/String;
    :sswitch_2
    invoke-virtual/range {p4 .. p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v6

    .line 615
    .local v6, "componentHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    invoke-virtual {v6}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_0

    .line 616
    move/from16 v0, p3

    invoke-virtual {v6, v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedDrawableIgnoreClose(I)I

    move-result v15

    .line 617
    move/from16 v0, p3

    invoke-virtual {v6, v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getValueSelectedStringIdIgnoreClose(I)I

    move-result v7

    .line 618
    if-nez p6, :cond_0

    .line 619
    move/from16 v0, p3

    invoke-virtual {v6, v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v12

    .line 620
    .local v12, "hdrValue":Ljava/lang/String;
    const-string/jumbo v18, "on"

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_6

    .line 621
    const-string/jumbo v18, "normal"

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    .line 620
    if-eqz v18, :cond_7

    .line 622
    :cond_6
    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    goto/16 :goto_0

    .line 623
    :cond_7
    const-string/jumbo v18, "live"

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 624
    const/16 v18, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    goto/16 :goto_0

    .line 626
    :cond_8
    const/16 v18, 0x8

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertHDR(IZZ)V

    goto/16 :goto_0

    .line 633
    .end local v6    # "componentHdr":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .end local v12    # "hdrValue":Ljava/lang/String;
    :sswitch_3
    if-eqz p6, :cond_a

    .line 634
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v18

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v19

    move-object/from16 v0, v18

    move/from16 v1, p3

    move/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/backup/DataBackUp;->getBackupFilter(II)Ljava/lang/String;

    move-result-object v10

    .line 640
    .local v10, "filter":Ljava/lang/String;
    :goto_3
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 641
    .local v8, "currentFilterIndex":I
    sget v18, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    move/from16 v0, v18

    if-eq v8, v0, :cond_9

    if-gtz v8, :cond_b

    .line 642
    :cond_9
    const v15, 0x7f0200cd

    .line 647
    :goto_4
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v18

    .line 648
    const/16 v19, 0xa2

    .line 647
    invoke-virtual/range {v18 .. v19}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v16

    check-cast v16, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 649
    .local v16, "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    if-eqz v16, :cond_0

    .line 650
    invoke-interface/range {v16 .. v16}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->isShowFilter()Z

    move-result v18

    if-eqz v18, :cond_c

    .line 651
    const v7, 0x7f0f00d4

    goto/16 :goto_0

    .line 636
    .end local v8    # "currentFilterIndex":I
    .end local v10    # "filter":Ljava/lang/String;
    .end local v16    # "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_a
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "filter":Ljava/lang/String;
    goto :goto_3

    .line 644
    .restart local v8    # "currentFilterIndex":I
    :cond_b
    const v15, 0x7f0200cf

    goto :goto_4

    .line 653
    .restart local v16    # "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :cond_c
    const v7, 0x7f0f00d3

    goto/16 :goto_0

    .line 659
    .end local v8    # "currentFilterIndex":I
    .end local v10    # "filter":Ljava/lang/String;
    .end local v16    # "processing":Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
    :sswitch_4
    invoke-virtual/range {p4 .. p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getValueSelectedDrawable(I)I

    move-result v15

    .line 661
    invoke-virtual/range {p4 .. p4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v4

    .line 662
    .local v4, "componentBokeh":Lcom/android/camera/data/data/config/ComponentConfigBokeh;
    move/from16 v0, p3

    invoke-virtual {v4, v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object v17

    .line 663
    .local v17, "value":Ljava/lang/String;
    const-string/jumbo v18, "on"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_d

    .line 664
    const v7, 0x7f0f00d6

    goto/16 :goto_0

    :cond_d
    const v7, 0x7f0f00d5

    goto/16 :goto_0

    .line 667
    .end local v4    # "componentBokeh":Lcom/android/camera/data/data/config/ComponentConfigBokeh;
    .end local v17    # "value":Ljava/lang/String;
    :sswitch_5
    const v15, 0x7f0200d8

    .line 668
    const v7, 0x7f0f00d7

    .line 669
    goto/16 :goto_0

    .line 671
    :sswitch_6
    const v15, 0x7f0200c0

    .line 672
    const v7, 0x7f0f00d8

    .line 673
    goto/16 :goto_0

    .line 675
    :sswitch_7
    const v15, 0x7f0200db

    .line 676
    const v7, 0x7f0f00d9

    .line 677
    goto/16 :goto_0

    .line 679
    :sswitch_8
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v15

    .line 680
    const v7, 0x7f0f00da

    .line 681
    goto/16 :goto_0

    .line 683
    :sswitch_9
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v18

    if-eqz v18, :cond_e

    .line 684
    const v15, 0x7f02008e

    goto/16 :goto_0

    :cond_e
    const v15, 0x7f02008d

    goto/16 :goto_0

    .line 687
    :sswitch_a
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getHFRImageResource(I)I

    move-result v15

    goto/16 :goto_0

    .line 702
    .restart local v9    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v13    # "initialMargin":I
    .restart local v14    # "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_f
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v18

    div-int/lit8 v18, v18, 0x2

    sub-int v18, v13, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    move/from16 v19, v0

    sub-int v18, v18, v19

    move/from16 v0, v18

    iput v0, v14, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    goto/16 :goto_1

    .line 708
    .end local v14    # "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_10
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 709
    if-lez v7, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v18

    if-eqz v18, :cond_2

    .line 710
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 591
    :sswitch_data_0
    .sparse-switch
        0xc1 -> :sswitch_1
        0xc2 -> :sswitch_2
        0xc3 -> :sswitch_7
        0xc4 -> :sswitch_3
        0xc5 -> :sswitch_5
        0xc6 -> :sswitch_0
        0xc7 -> :sswitch_8
        0xc8 -> :sswitch_4
        0xc9 -> :sswitch_9
        0xca -> :sswitch_a
        0xe1 -> :sswitch_6
    .end sparse-switch
.end method

.method private showMenu()V
    .locals 6

    .prologue
    .line 499
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 500
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v1

    .line 501
    .local v1, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v1, :cond_0

    .line 502
    invoke-virtual {v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->clear()V

    .line 503
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 506
    :cond_0
    new-instance v2, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-direct {v2}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    .line 507
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDegree:I

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->setDegree(I)V

    .line 510
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 511
    .local v0, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 513
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 514
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    .line 515
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v4}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getFragmentTag()Ljava/lang/String;

    move-result-object v4

    .line 513
    const v5, 0x7f0a0062

    invoke-static {v2, v5, v3, v4}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 516
    return-void
.end method


# virtual methods
.method public alertAiSceneSelector(ILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V
    .locals 2
    .param p1, "visible"    # I
    .param p2, "listener"    # Lcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;

    .prologue
    .line 1036
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1037
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 1038
    :cond_0
    return-void

    .line 1041
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSelector(IILcom/android/camera/ui/ToggleSwitch$OnCheckedChangeListener;)V

    .line 1042
    return-void
.end method

.method public alertAiSceneSwitchHint(I)V
    .locals 2
    .param p1, "visible"    # I

    .prologue
    .line 1081
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1082
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 1083
    :cond_0
    return-void

    .line 1086
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertAiSceneSwitchHint(II)V

    .line 1087
    return-void
.end method

.method public alertFlash(IZZ)V
    .locals 3
    .param p1, "visible"    # I
    .param p2, "torch"    # Z
    .param p3, "showSelector"    # Z

    .prologue
    .line 1005
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1006
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 1007
    :cond_0
    return-void

    .line 1010
    :cond_1
    if-nez p1, :cond_3

    .line 1011
    if-eqz p3, :cond_2

    .line 1012
    const/16 v1, 0xc1

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->performClick()Z

    .line 1017
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertFlash(IIZ)V

    .line 1018
    return-void

    .line 1015
    :cond_3
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    goto :goto_0
.end method

.method public alertHDR(IZZ)V
    .locals 3
    .param p1, "visible"    # I
    .param p2, "live"    # Z
    .param p3, "showSelector"    # Z

    .prologue
    .line 987
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 988
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 989
    :cond_0
    return-void

    .line 992
    :cond_1
    if-nez p1, :cond_3

    .line 993
    if-eqz p3, :cond_2

    .line 994
    const/16 v1, 0xc2

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->performClick()Z

    .line 1000
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertHDR(IIZ)V

    .line 1001
    return-void

    .line 997
    :cond_3
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    goto :goto_0
.end method

.method public alertUpdateValue(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 1022
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 1023
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopAlert;->isShow()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 1024
    :cond_0
    return-void

    .line 1027
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAlertTopMargin()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->alertUpdateValue(II)V

    .line 1028
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 207
    const/16 v0, 0xf4

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 202
    const v0, 0x7f04001c

    return v0
.end method

.method public getTopImage(I)Landroid/widget/ImageView;
    .locals 4
    .param p1, "config"    # I

    .prologue
    .line 338
    iget-object v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "imageView$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 339
    .local v0, "imageView":Landroid/widget/ImageView;
    invoke-virtual {v0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 340
    .local v2, "tag":I
    if-ne v2, p1, :cond_0

    .line 341
    return-object v0

    .line 345
    .end local v0    # "imageView":Landroid/widget/ImageView;
    .end local v2    # "tag":I
    :cond_1
    const/4 v3, 0x0

    return-object v3
.end method

.method public getTopImagePosition(I)I
    .locals 3
    .param p1, "config"    # I

    .prologue
    .line 349
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 350
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 351
    .local v1, "tag":I
    if-ne v1, p1, :cond_0

    .line 352
    return v0

    .line 349
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 355
    .end local v1    # "tag":I
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public hideConfigMenu()V
    .locals 2

    .prologue
    .line 960
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 961
    return-void
.end method

.method public hideExtraMenu()V
    .locals 1

    .prologue
    .line 947
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 948
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 13
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v11, 0x0

    .line 104
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v9

    iput-boolean v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    .line 105
    new-instance v9, Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-direct {v9}, Lcom/android/camera/fragment/top/LastAnimationComponent;-><init>()V

    iput-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    .line 107
    const v9, 0x7f0a0062

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup;

    iput-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopExtraParent:Landroid/view/ViewGroup;

    .line 108
    const v9, 0x7f0a0059

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    iput-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    .line 110
    sget-boolean v9, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v9, :cond_0

    .line 112
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 113
    .local v8, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    sget v9, Lcom/android/camera/Util;->sStatusBarHeight:I

    iput v9, v8, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 116
    .end local v8    # "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a005a

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 117
    .local v0, "config00":Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a005b

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 118
    .local v1, "config01":Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a005c

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 119
    .local v2, "config02":Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a005d

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 120
    .local v3, "config03":Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a005e

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 121
    .local v4, "config04":Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a005f

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 122
    .local v5, "config05":Landroid/widget/ImageView;
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    const v10, 0x7f0a0060

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 124
    .local v6, "config06":Landroid/widget/ImageView;
    new-instance v9, Ljava/util/ArrayList;

    const/4 v10, 0x7

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    .line 125
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v9, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    const v9, 0x7f0a0061

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/support/v7/widget/RecyclerView;

    iput-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    .line 134
    new-instance v7, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v7, v9}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 135
    .local v7, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v7, v11}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 136
    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mExpandView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v9, v7}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 139
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f090020

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 138
    iput v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mViewPadding:I

    .line 142
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0200ae

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    iput v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopDrawableWidth:I

    .line 144
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTotalWidth:I

    .line 168
    iget v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v10, 0x0

    invoke-virtual {p0, v9, v10, v11}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;Z)V

    .line 170
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    invoke-virtual {v4, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    invoke-virtual {v6, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    new-instance v9, Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-direct {v9}, Lcom/android/camera/fragment/top/FragmentTopAlert;-><init>()V

    iput-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    .line 179
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v9

    .line 180
    iget-object v10, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    iget-object v11, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v11}, Lcom/android/camera/fragment/top/FragmentTopAlert;->getFragmentTag()Ljava/lang/String;

    move-result-object v11

    const v12, 0x7f0a0063

    .line 179
    invoke-static {v9, v12, v10, v11}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public insertConfigItem(I)V
    .locals 10
    .param p1, "newConfigItem"    # I

    .prologue
    const/16 v9, 0xc4

    .line 850
    iget-object v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v7, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->hasConfig(I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 851
    return-void

    .line 854
    :cond_0
    invoke-virtual {p0, v9}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v6

    .line 856
    .local v6, "oldFilterView":Landroid/view/View;
    iget-boolean v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v7, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v8

    sub-int v2, v7, v8

    .line 858
    .local v2, "filterSrcStart":I
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    .line 861
    invoke-virtual {p0, v9}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v5

    .line 862
    .local v5, "newFilterView":Landroid/view/View;
    const/4 v7, 0x4

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 865
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 866
    .local v3, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {v3}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v1

    .line 868
    .local v1, "filterCurrentStart":I
    sub-int v0, v1, v2

    .line 869
    .local v0, "distance":I
    iget-boolean v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v7, :cond_1

    neg-int v0, v0

    .line 872
    :cond_1
    new-instance v7, Lcom/android/camera/animation/type/TranslateXOnSubscribe;

    invoke-direct {v7, v6, v0}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v7}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v7

    .line 873
    new-instance v8, Lcom/android/camera/fragment/top/FragmentTopConfig$1;

    invoke-direct {v8, p0, v6, v5}, Lcom/android/camera/fragment/top/FragmentTopConfig$1;-><init>(Lcom/android/camera/fragment/top/FragmentTopConfig;Landroid/view/View;Landroid/view/View;)V

    .line 872
    invoke-virtual {v7, v8}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 888
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v4

    .line 889
    .local v4, "newConfigView":Landroid/view/View;
    new-instance v7, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {v7, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v7}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v7

    invoke-virtual {v7}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 890
    return-void

    .line 856
    .end local v0    # "distance":I
    .end local v1    # "filterCurrentStart":I
    .end local v2    # "filterSrcStart":I
    .end local v3    # "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v4    # "newConfigView":Landroid/view/View;
    .end local v5    # "newFilterView":Landroid/view/View;
    :cond_2
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v2

    .restart local v2    # "filterSrcStart":I
    goto :goto_0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 3
    .param p1, "arrivedType"    # I

    .prologue
    .line 1155
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 1157
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1158
    const/16 v2, 0xa4

    .line 1157
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 1159
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    if-eqz v0, :cond_0

    .line 1160
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->reCheckMutexConfigs()V

    .line 1162
    :cond_0
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 3
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 1147
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1149
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mDisplayRectTopMargin:I

    .line 1150
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->provideAnimateElement(ILjava/util/List;Z)V

    .line 1151
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 8
    .param p1, "callingFrom"    # I

    .prologue
    const/16 v7, 0xc8

    const/4 v6, 0x4

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 543
    iget-object v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    if-eq p1, v6, :cond_0

    move v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 544
    return v3

    :cond_0
    move v2, v4

    .line 543
    goto :goto_0

    .line 547
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    .line 548
    .local v0, "fragmentTopConfigExtra":Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
    if-eqz v0, :cond_3

    .line 549
    packed-switch p1, :pswitch_data_0

    .line 563
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 564
    const/16 v5, 0xf5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    .line 563
    invoke-static {v2, v5}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    .line 565
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 569
    :goto_1
    if-eq p1, v6, :cond_2

    .line 570
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v1

    .line 571
    .local v1, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v1, :cond_2

    .line 572
    invoke-virtual {v1, v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setShow(Z)V

    .line 573
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->reConfigTipImage()V

    .line 574
    invoke-virtual {p0, v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->alertUpdateValue(I)V

    .line 578
    .end local v1    # "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    :cond_2
    return v3

    .line 552
    :pswitch_1
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    .line 553
    new-instance v2, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v2, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v7}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 558
    :pswitch_2
    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->animateOut()V

    .line 559
    new-instance v2, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v2, v4}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v7}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v2

    invoke-static {v2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v2

    invoke-virtual {v2}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1

    .line 580
    :cond_3
    return v4

    .line 549
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/16 v9, 0xc4

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 221
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v5

    if-nez v5, :cond_0

    .line 222
    return-void

    .line 226
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    .line 227
    const/16 v6, 0xa4

    .line 226
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 228
    .local v1, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    if-nez v1, :cond_1

    .line 229
    return-void

    .line 233
    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v5

    .line 234
    const/16 v6, 0xa1

    .line 233
    invoke-virtual {v5, v6}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 235
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 236
    return-void

    .line 239
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 240
    .local v4, "tag":I
    sparse-switch v4, :sswitch_data_0

    .line 295
    .end local p1    # "v":Landroid/view/View;
    :goto_0
    return-void

    .line 242
    .restart local p1    # "v":Landroid/view/View;
    :sswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 243
    .local v2, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v5

    invoke-direct {p0, v5, p1, v4}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    goto :goto_0

    .line 247
    .end local v2    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    :sswitch_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 248
    .restart local v2    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v5

    invoke-direct {p0, v5, p1, v4}, Lcom/android/camera/fragment/top/FragmentTopConfig;->expandExtra(Lcom/android/camera/data/data/ComponentData;Landroid/view/View;I)V

    goto :goto_0

    .line 252
    .end local v2    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    :sswitch_2
    const/16 v5, 0xc9

    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto :goto_0

    .line 256
    :sswitch_3
    invoke-interface {v1, v9}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 257
    new-array v5, v8, [I

    aput v9, v5, v7

    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    goto :goto_0

    .line 261
    :sswitch_4
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->showMenu()V

    goto :goto_0

    .line 265
    :sswitch_5
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->showSetting()V

    goto :goto_0

    .line 269
    :sswitch_6
    const/16 v5, 0xc3

    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto :goto_0

    .line 273
    :sswitch_7
    const/16 v5, 0xc7

    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 274
    check-cast p1, Landroid/widget/ImageView;

    .end local p1    # "v":Landroid/view/View;
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getFocusPeakImageResource()I

    move-result v5

    invoke-virtual {p1, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 277
    .restart local p1    # "v":Landroid/view/View;
    :sswitch_8
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/camera/data/provider/DataProvider;->dataConfig()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 279
    .restart local v2    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v5

    iget v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v5, v6}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->toggle(I)V

    .line 280
    invoke-virtual {v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v5

    iget v6, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v5, v6}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object v3

    .line 281
    .local v3, "newValue":Ljava/lang/String;
    iget v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v5, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackBokehChanged(ILjava/lang/String;)V

    .line 282
    new-array v5, v8, [I

    const/16 v6, 0xc8

    aput v6, v5, v7

    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 284
    iget v5, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v2, v5, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigHdrIfBokehChanged(ILjava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 285
    new-array v5, v8, [I

    const/16 v6, 0xc2

    aput v6, v5, v7

    invoke-virtual {p0, v5}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 288
    :cond_3
    invoke-interface {v1, v3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configBokeh(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 292
    .end local v2    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    .end local v3    # "newValue":Ljava/lang/String;
    :sswitch_9
    const/16 v5, 0xca

    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    goto/16 :goto_0

    .line 240
    nop

    :sswitch_data_0
    .sparse-switch
        0xc1 -> :sswitch_0
        0xc2 -> :sswitch_1
        0xc3 -> :sswitch_6
        0xc4 -> :sswitch_3
        0xc5 -> :sswitch_4
        0xc7 -> :sswitch_7
        0xc8 -> :sswitch_8
        0xc9 -> :sswitch_2
        0xca -> :sswitch_9
        0xe1 -> :sswitch_5
    .end sparse-switch
.end method

.method public onExpandValueChange(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;)V
    .locals 8
    .param p1, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0xc2

    const/16 v6, 0xc1

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 299
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->isEnableClick()Z

    move-result v2

    if-nez v2, :cond_0

    .line 300
    return-void

    .line 303
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 305
    .local v1, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 306
    const/16 v3, 0xa4

    .line 305
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 307
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 333
    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mLastAnimationComponent:Lcom/android/camera/fragment/top/LastAnimationComponent;

    invoke-virtual {v2, v4}, Lcom/android/camera/fragment/top/LastAnimationComponent;->reverse(Z)Z

    .line 334
    return-void

    .line 309
    :sswitch_0
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v2, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackFlashChanged(ILjava/lang/String;)V

    .line 310
    new-array v2, v4, [I

    aput v6, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 311
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v2, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigHhrIfFlashChanged(ILjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 312
    new-array v2, v4, [I

    aput v7, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 315
    :cond_1
    invoke-interface {v0, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configFlash(Ljava/lang/String;)V

    goto :goto_0

    .line 319
    :sswitch_1
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v2, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackHdrChanged(ILjava/lang/String;)V

    .line 320
    new-array v2, v4, [I

    aput v7, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 321
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v2, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigFlashIfHdrChanged(ILjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 322
    new-array v2, v4, [I

    aput v6, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 325
    :cond_2
    iget v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v1, v2, p2}, Lcom/android/camera/data/data/config/DataItemConfig;->reConfigBokehIfHdrChanged(ILjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 326
    new-array v2, v4, [I

    const/16 v3, 0xc8

    aput v3, v2, v5

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->updateConfigItem([I)V

    .line 329
    :cond_3
    invoke-interface {v0, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configHdr(Ljava/lang/String;)V

    goto :goto_0

    .line 307
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0f0053 -> :sswitch_0
        0x7f0f0105 -> :sswitch_1
    .end sparse-switch
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 18
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
    .line 725
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    move/from16 v0, p1

    if-eq v3, v0, :cond_0

    .line 726
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mBeforeMode:I

    .line 728
    :cond_0
    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 729
    .local v14, "lastMode":I
    invoke-super/range {p0 .. p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 731
    const/4 v15, 0x1

    .line 732
    .local v15, "needBack":Z
    packed-switch v14, :pswitch_data_0

    .line 748
    :goto_0
    :pswitch_0
    if-eqz v15, :cond_1

    .line 749
    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 752
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v17

    .line 753
    .local v17, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v17, :cond_2

    .line 754
    const/4 v3, 0x0

    move-object/from16 v0, v17

    move/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/fragment/top/FragmentTopAlert;->provideAnimateElement(ILjava/util/List;Z)V

    .line 757
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v7

    .line 758
    .local v7, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v12

    .line 759
    .local v12, "cameraId":I
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v3

    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-virtual {v3, v12, v6}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v11

    .line 761
    .local v11, "cameraCapabilities":Lcom/android/camera2/CameraCapabilities;
    if-nez v11, :cond_3

    .line 762
    return-void

    .line 737
    .end local v7    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    .end local v11    # "cameraCapabilities":Lcom/android/camera2/CameraCapabilities;
    .end local v12    # "cameraId":I
    .end local v17    # "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    :pswitch_1
    packed-switch p1, :pswitch_data_1

    :pswitch_2
    goto :goto_0

    .line 742
    :pswitch_3
    const/4 v15, 0x0

    .line 743
    goto :goto_0

    .line 765
    .restart local v7    # "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    .restart local v11    # "cameraCapabilities":Lcom/android/camera2/CameraCapabilities;
    .restart local v12    # "cameraId":I
    .restart local v17    # "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    :cond_3
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    invoke-static {v3, v7, v12, v11}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 770
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v8, v3, :cond_b

    .line 771
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mConfigViews:Ljava/util/List;

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 772
    .local v5, "imageView":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v3, v8}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfig(I)I

    move-result v4

    .line 775
    .local v4, "newType":I
    if-eqz p2, :cond_4

    const/4 v9, 0x1

    :goto_2
    move-object/from16 v3, p0

    move/from16 v6, p1

    .line 774
    invoke-direct/range {v3 .. v9}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z

    move-result v13

    .line 779
    .local v13, "inOrOut":Z
    invoke-virtual {v5}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 780
    invoke-virtual {v5}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v16

    .line 781
    .local v16, "tag":I
    move/from16 v0, v16

    if-ne v0, v4, :cond_5

    .line 770
    .end local v16    # "tag":I
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 775
    .end local v13    # "inOrOut":Z
    :cond_4
    const/4 v9, 0x0

    goto :goto_2

    .line 786
    .restart local v13    # "inOrOut":Z
    :cond_5
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 789
    if-nez p2, :cond_7

    .line 790
    if-eqz v13, :cond_6

    .line 791
    invoke-static {v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 793
    :cond_6
    invoke-static {v5}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 796
    :cond_7
    if-eqz v13, :cond_8

    .line 797
    new-instance v10, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    invoke-direct {v10, v5}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    .line 799
    .local v10, "alphaInOnSubscribe":Lcom/android/camera/animation/type/AlphaInOnSubscribe;
    const/16 v3, 0x96

    .line 798
    invoke-virtual {v10, v3}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v3

    .line 800
    const/16 v6, 0x96

    .line 798
    invoke-virtual {v3, v6}, Lcom/android/camera/animation/type/BaseOnSubScribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    .line 801
    invoke-static {v10}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 803
    .end local v10    # "alphaInOnSubscribe":Lcom/android/camera/animation/type/AlphaInOnSubscribe;
    :cond_8
    const/16 v3, 0xa5

    if-eq v14, v3, :cond_9

    .line 804
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    const/16 v6, 0xa5

    if-ne v3, v6, :cond_a

    .line 805
    :cond_9
    invoke-static {v5}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 808
    :cond_a
    new-instance v3, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {v3, v5}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v6, 0x96

    invoke-virtual {v3, v6}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v3

    .line 807
    invoke-static {v3}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 813
    .end local v4    # "newType":I
    .end local v5    # "imageView":Landroid/widget/ImageView;
    .end local v13    # "inOrOut":Z
    :cond_b
    return-void

    .line 732
    :pswitch_data_0
    .packed-switch 0xa2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 737
    :pswitch_data_1
    .packed-switch 0xa2
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
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
    .line 1195
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1196
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopExtra()Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    move-result-object v0

    .line 1197
    .local v0, "fragmentTopConfigExtra":Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
    if-eqz v0, :cond_0

    .line 1198
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->provideRotateItem(Ljava/util/List;I)V

    .line 1200
    :cond_0
    return-void
.end method

.method public refreshExtraMenu()V
    .locals 1

    .prologue
    .line 953
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 954
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->reFresh()V

    .line 956
    :cond_0
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 520
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 521
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 522
    const/16 v0, 0xac

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 523
    return-void
.end method

.method public removeConfigItem(I)V
    .locals 9
    .param p1, "departedConfigItem"    # I

    .prologue
    const/16 v8, 0xc4

    .line 894
    iget-object v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mSupportedConfigs:Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-virtual {v7, p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->hasConfig(I)Z

    move-result v7

    if-nez v7, :cond_0

    .line 895
    return-void

    .line 899
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    .line 901
    .local v0, "departedView":Landroid/view/View;
    invoke-virtual {p0, v8}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v6

    .line 904
    .local v6, "oldFilterView":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 906
    .local v4, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {v4}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v3

    .line 908
    .local v3, "filterSrcStart":I
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->resetImages()V

    .line 911
    invoke-virtual {p0, v8}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v5

    .line 912
    .local v5, "newFilterView":Landroid/view/View;
    const/4 v7, 0x4

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 914
    iget-boolean v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v7, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getView()Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v8

    sub-int v2, v7, v8

    .line 916
    .local v2, "filterCurrentStart":I
    :goto_0
    sub-int v1, v2, v3

    .line 917
    .local v1, "distance":I
    iget-boolean v7, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mIsRTL:Z

    if-eqz v7, :cond_1

    neg-int v1, v1

    .line 920
    :cond_1
    new-instance v7, Lcom/android/camera/animation/type/TranslateXOnSubscribe;

    invoke-direct {v7, v6, v1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v7}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v7

    .line 921
    new-instance v8, Lcom/android/camera/fragment/top/FragmentTopConfig$2;

    invoke-direct {v8, p0, v6, v5}, Lcom/android/camera/fragment/top/FragmentTopConfig$2;-><init>(Lcom/android/camera/fragment/top/FragmentTopConfig;Landroid/view/View;Landroid/view/View;)V

    .line 920
    invoke-virtual {v7, v8}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 937
    new-instance v7, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    invoke-direct {v7, v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v7}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v7

    invoke-virtual {v7}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 938
    return-void

    .line 914
    .end local v1    # "distance":I
    .end local v2    # "filterCurrentStart":I
    :cond_2
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v2

    .restart local v2    # "filterCurrentStart":I
    goto :goto_0
.end method

.method public removeExtraMenu(I)V
    .locals 0
    .param p1, "callFrom"    # I

    .prologue
    .line 942
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->onBackEvent(I)Z

    .line 943
    return-void
.end method

.method public setAiSceneImageLevel(I)V
    .locals 3
    .param p1, "modeIndex"    # I

    .prologue
    .line 1046
    move v0, p1

    .line 1047
    .local v0, "aiSceneLevel":I
    const/16 v2, 0x19

    if-ne p1, v2, :cond_0

    .line 1048
    const/16 v0, 0x17

    .line 1051
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getAiSceneDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1052
    .local v1, "imgDrawable":Landroid/graphics/drawable/Drawable;
    if-nez v1, :cond_1

    .line 1053
    return-void

    .line 1055
    :cond_1
    const/16 v2, 0xc9

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1071
    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentAiSceneLevel:I

    .line 1072
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 212
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 213
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 214
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    if-eqz v0, :cond_0

    .line 215
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setClickEnable(Z)V

    .line 217
    :cond_0
    return-void
.end method

.method public setRecordingTimeState(I)V
    .locals 3
    .param p1, "state"    # I

    .prologue
    .line 966
    packed-switch p1, :pswitch_data_0

    .line 975
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 976
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->setRecordingTimeState(I)V

    .line 977
    return-void

    .line 968
    .end local v0    # "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    :pswitch_0
    new-instance v1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 971
    :pswitch_1
    new-instance v1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mTopConfigMenu:Landroid/view/View;

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_0

    .line 966
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 527
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 528
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 529
    const/16 v1, 0xac

    invoke-interface {p1, v1, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 531
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 532
    .local v0, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    if-eqz v1, :cond_0

    .line 533
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopAlert:Lcom/android/camera/fragment/top/FragmentTopAlert;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 535
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    if-eqz v1, :cond_1

    .line 536
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mFragmentTopConfigExtra:Lcom/android/camera/fragment/top/FragmentTopConfigExtra;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 538
    :cond_1
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 539
    return-void
.end method

.method public varargs updateConfigItem([I)V
    .locals 9
    .param p1, "configItems"    # [I

    .prologue
    const/4 v6, 0x0

    .line 835
    iget v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    iput v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mBeforeMode:I

    .line 836
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    .line 837
    .local v4, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    array-length v8, p1

    move v7, v6

    :goto_0
    if-ge v7, v8, :cond_0

    aget v1, p1, v7

    .line 840
    .local v1, "configItem":I
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v2

    .line 841
    iget v3, p0, Lcom/android/camera/fragment/top/FragmentTopConfig;->mCurrentMode:I

    .line 843
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImagePosition(I)I

    move-result v5

    move-object v0, p0

    .line 838
    invoke-direct/range {v0 .. v6}, Lcom/android/camera/fragment/top/FragmentTopConfig;->setTopImageResource(ILandroid/widget/ImageView;ILcom/android/camera/data/data/config/DataItemConfig;IZ)Z

    .line 837
    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_0

    .line 846
    .end local v1    # "configItem":I
    :cond_0
    return-void
.end method

.method public updateContentDescription()V
    .locals 2

    .prologue
    .line 1215
    const/16 v1, 0xc4

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopImage(I)Landroid/widget/ImageView;

    move-result-object v0

    .line 1216
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_0

    .line 1217
    const v1, 0x7f0f00d3

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1219
    :cond_0
    return-void
.end method

.method public updateRecordingTime(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 981
    invoke-direct {p0}, Lcom/android/camera/fragment/top/FragmentTopConfig;->getTopAlert()Lcom/android/camera/fragment/top/FragmentTopAlert;

    move-result-object v0

    .line 982
    .local v0, "topAlert":Lcom/android/camera/fragment/top/FragmentTopAlert;
    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/top/FragmentTopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 983
    return-void
.end method
