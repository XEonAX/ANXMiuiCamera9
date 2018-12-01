.class public Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.super Landroid/support/v4/app/Fragment;
.source "MakeupParamsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;
    }
.end annotation


# static fields
.field private static final synthetic -com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I


# instance fields
.field protected mClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mItemWidth:I

.field mLastSelectedParam:I

.field private mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

.field private mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

.field private mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

.field mSelectedParam:I

.field private mTotalWidth:I


# direct methods
.method private static synthetic -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters$Type;->values()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_a

    :goto_0
    :try_start_1
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_9

    :goto_1
    :try_start_2
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_8

    :goto_2
    :try_start_3
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_7

    :goto_3
    :try_start_4
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_6

    :goto_4
    :try_start_5
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :goto_5
    :try_start_6
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_4

    :goto_6
    :try_start_7
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_3

    :goto_7
    :try_start_8
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_2

    :goto_8
    :try_start_9
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_1

    :goto_9
    :try_start_a
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_0

    :goto_a
    sput-object v0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_a

    :catch_1
    move-exception v1

    goto :goto_9

    :catch_2
    move-exception v1

    goto :goto_8

    :catch_3
    move-exception v1

    goto :goto_7

    :catch_4
    move-exception v1

    goto :goto_6

    :catch_5
    move-exception v1

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_4

    :catch_7
    move-exception v1

    goto :goto_3

    :catch_8
    move-exception v1

    goto :goto_2

    :catch_9
    move-exception v1

    goto :goto_1

    :catch_a
    move-exception v1

    goto :goto_0
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;I)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
    .param p1, "selected"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->scrollIfNeed(I)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;II)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
    .param p1, "oldIndex"    # I
    .param p2, "newIndex"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->notifyItemChanged(II)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 33
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLastSelectedParam:I

    .line 34
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    .line 28
    return-void
.end method

.method private initView(Landroid/view/View;)V
    .locals 12
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const-wide/16 v10, 0x96

    const/4 v9, 0x0

    .line 49
    const v7, 0x7f0a0011

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/RecyclerView;

    iput-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    .line 50
    new-instance v7, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v7, p0, v8}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;-><init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;Landroid/content/Context;)V

    iput-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    .line 51
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v7, v9}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->setOrientation(I)V

    .line 52
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    iget-object v8, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 53
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/RecyclerView;->setFocusable(Z)V

    .line 55
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->initItems()Ljava/util/List;

    move-result-object v3

    .line 56
    .local v3, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;>;"
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->provideItemHorizontalMargin()I

    move-result v2

    .line 58
    .local v2, "itemMargin":I
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 59
    .local v5, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f09005f

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    .line 60
    mul-int/lit8 v8, v2, 0x2

    .line 59
    add-int/2addr v7, v8

    iput v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mItemWidth:I

    .line 61
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mTotalWidth:I

    .line 62
    iget v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mTotalWidth:I

    iget v8, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mItemWidth:I

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    mul-int/2addr v8, v9

    sub-int/2addr v7, v8

    div-int/lit8 v6, v7, 0x2

    .line 63
    .local v6, "marginStart":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v1

    .line 64
    .local v1, "isRTL":Z
    if-lez v6, :cond_0

    move v4, v6

    .line 67
    .local v4, "margin":I
    :goto_0
    new-instance v7, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v7, v8, v3, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    .line 68
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v7

    iput-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 69
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    new-instance v8, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;

    invoke-direct {v8, p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$1;-><init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;)V

    invoke-virtual {v7, v8}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 79
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/camera/effect/BeautyParameters;->getCurrentType()Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->beautyTypetoPosition(Lcom/android/camera/effect/BeautyParameters$Type;)I

    move-result v7

    iput v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    .line 80
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v8, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-virtual {v7, v8}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    .line 81
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    iget-object v8, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 82
    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 83
    .local v0, "animator":Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    invoke-virtual {v0, v10, v11}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 84
    invoke-virtual {v0, v10, v11}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 85
    invoke-virtual {v0, v10, v11}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 86
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 87
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    new-instance v8, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;

    invoke-direct {v8, p0, v1, v4}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$2;-><init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;ZI)V

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 106
    iget-object v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v7}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    .line 107
    iget v7, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mSelectedParam:I

    invoke-direct {p0, v7}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->setItemInCenter(I)V

    .line 108
    return-void

    .line 65
    .end local v0    # "animator":Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    .end local v4    # "margin":I
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f090061

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .restart local v4    # "margin":I
    goto :goto_0
.end method

.method private notifyItemChanged(II)V
    .locals 2
    .param p1, "oldIndex"    # I
    .param p2, "newIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 189
    if-le p1, v1, :cond_0

    .line 190
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyItemChanged(I)V

    .line 192
    :cond_0
    if-le p2, v1, :cond_1

    .line 193
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyItemChanged(I)V

    .line 195
    :cond_1
    return-void
.end method

.method private scrollIfNeed(I)Z
    .locals 4
    .param p1, "selected"    # I

    .prologue
    const/4 v3, 0x0

    .line 198
    move v0, p1

    .line 199
    .local v0, "destination":I
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    if-eq p1, v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v1

    if-ne p1, v1, :cond_2

    .line 201
    :cond_0
    add-int/lit8 v1, p1, -0x1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 206
    :cond_1
    :goto_0
    if-eq v0, p1, :cond_4

    .line 207
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->scrollToPosition(I)V

    .line 208
    const/4 v1, 0x1

    return v1

    .line 202
    :cond_2
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    if-eq p1, v1, :cond_3

    .line 203
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v1

    if-ne p1, v1, :cond_1

    .line 204
    :cond_3
    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v2}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    .line 210
    :cond_4
    return v3
.end method

.method private setItemInCenter(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 184
    iget v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mTotalWidth:I

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mItemWidth:I

    div-int/lit8 v2, v2, 0x2

    sub-int v0, v1, v2

    .line 185
    .local v0, "offset":I
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;

    invoke-virtual {v1, p1, v0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$MyLayoutManager;->scrollToPositionWithOffset(II)V

    .line 186
    return-void
.end method


# virtual methods
.method protected beautyTypetoPosition(Lcom/android/camera/effect/BeautyParameters$Type;)I
    .locals 3
    .param p1, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;

    .prologue
    const/4 v2, 0x0

    .line 157
    invoke-static {}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->-getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 167
    return v2

    .line 159
    :pswitch_0
    return v2

    .line 161
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 163
    :pswitch_2
    const/4 v0, 0x2

    return v0

    .line 165
    :pswitch_3
    const/4 v0, 0x3

    return v0

    .line 157
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method protected initItems()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;>;"
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f020103

    const v3, 0x7f0f01ac

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f020102

    const v3, 0x7f0f01ab

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f020108

    const v3, 0x7f0f01a9

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    const v2, 0x7f02010a

    const v3, 0x7f0f01aa

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    return-object v0
.end method

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    .prologue
    .line 125
    new-instance v0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$3;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment$3;-><init>(Lcom/android/camera/fragment/beauty/MakeupParamsFragment;)V

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 43
    const v1, 0x7f040004

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 44
    .local v0, "v":Landroid/view/View;
    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->initView(Landroid/view/View;)V

    .line 45
    return-object v0
.end method

.method protected provideItemHorizontalMargin()I
    .locals 2

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 121
    const v1, 0x7f090062

    .line 120
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 4
    .param p1, "isVisibleToUser"    # Z

    .prologue
    .line 173
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->setUserVisibleHint(Z)V

    .line 174
    if-eqz p1, :cond_0

    .line 175
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    if-eqz v1, :cond_0

    .line 176
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 177
    .local v0, "alphaAnimation":Landroid/view/animation/AlphaAnimation;
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 178
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->mMakeupItemList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 181
    .end local v0    # "alphaAnimation":Landroid/view/animation/AlphaAnimation;
    :cond_0
    return-void
.end method
