.class public Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentManuallyExtra.java"


# instance fields
.field private mCurrentTitle:I

.field private mData:Lcom/android/camera/data/data/ComponentData;

.field private mExtraList:Landroid/support/v7/widget/RecyclerView;

.field private mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

.field private mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mNeedAnimation:Z

.field private mTargetView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 51
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    .line 38
    return-void
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "currentMode"    # I

    .prologue
    .line 244
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 245
    .local v0, "uiStyle":I
    packed-switch v0, :pswitch_data_0

    .line 255
    :goto_0
    :pswitch_0
    return-void

    .line 247
    :pswitch_1
    const v1, 0x7f0d000a

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 252
    :pswitch_2
    const v1, 0x7f0d000b

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 245
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private initAdapter(Lcom/android/camera/data/data/ComponentData;)V
    .locals 1
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;

    .prologue
    .line 118
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 133
    :goto_0
    return-void

    .line 120
    :sswitch_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initWBRecyclerView(Lcom/android/camera/data/data/ComponentData;)V

    goto :goto_0

    .line 124
    :sswitch_1
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initSlideFocusView(Lcom/android/camera/data/data/ComponentData;)V

    goto :goto_0

    .line 130
    :sswitch_2
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initHorizontalListView(Lcom/android/camera/data/data/ComponentData;)V

    goto :goto_0

    .line 118
    :sswitch_data_0
    .sparse-switch
        0x7f0f005b -> :sswitch_0
        0x7f0f009d -> :sswitch_2
        0x7f0f010a -> :sswitch_2
        0x7f0f013a -> :sswitch_1
    .end sparse-switch
.end method

.method private initHorizontalListView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 3
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;

    .prologue
    .line 167
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 168
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 170
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    iput-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    .line 173
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;

    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    invoke-direct {v0, p1, v1, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    .line 174
    .local v0, "adapter":Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 175
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 176
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V

    .line 177
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;->getValuePosition()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalListView;->setSelection(I)V

    .line 178
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalListView;->setVisibility(I)V

    .line 179
    return-void
.end method

.method private initSlideFocusView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 5
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;

    .prologue
    .line 182
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 183
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 186
    :cond_0
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iput-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    .line 189
    new-instance v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iget-object v4, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    invoke-direct {v1, v2, p1, v3, v4}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    .line 190
    .local v1, "slideViewAdapter":Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/HorizontalSlideView;->setOnItemSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;)V

    .line 191
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/HorizontalSlideView;->setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V

    .line 194
    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 193
    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mapFocusToIndex(I)I

    move-result v0

    .line 195
    .local v0, "position":I
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v2, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(I)V

    .line 197
    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/HorizontalSlideView;->setVisibility(I)V

    .line 198
    return-void
.end method

.method private initWBRecyclerView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 8
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;

    .prologue
    const/4 v7, 0x0

    .line 136
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 140
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    .line 142
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    const/high16 v2, 0x40b00000    # 5.5f

    div-float/2addr v1, v2

    float-to-int v5, v1

    .line 143
    .local v5, "itemWidth":I
    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    mul-int/2addr v1, v5

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ge v1, v2, :cond_1

    .line 144
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    div-int v5, v1, v2

    .line 148
    :cond_1
    new-instance v0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;

    iget v3, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iget-object v4, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;-><init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;I)V

    .line 158
    .local v0, "adapter":Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;
    new-instance v6, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v6, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 159
    .local v6, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v6, v7}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 160
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v6}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 161
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 162
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;->getValuePosition()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 163
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v7}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 164
    return-void
.end method


# virtual methods
.method public animateOut()V
    .locals 3

    .prologue
    .line 104
    new-instance v0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x50

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    .line 105
    new-instance v1, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$1;-><init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;)V

    .line 104
    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    .line 114
    return-void
.end method

.method public getCurrentTitle()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 220
    const/16 v0, 0xfe

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 215
    const v0, 0x7f040010

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 63
    const v0, 0x7f0a003e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    .line 64
    const v0, 0x7f0a003f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/HorizontalListView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    .line 65
    const v0, 0x7f0a0040

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/HorizontalSlideView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    .line 67
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    if-nez v0, :cond_0

    .line 68
    return-void

    .line 71
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->adjustViewBackground(Landroid/view/View;I)V

    .line 73
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initAdapter(Lcom/android/camera/data/data/ComponentData;)V

    .line 74
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    .line 75
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 2
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 232
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 234
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getView()Landroid/view/View;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->adjustViewBackground(Landroid/view/View;I)V

    .line 240
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 81
    iget-boolean v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mNeedAnimation:Z

    if-nez v0, :cond_0

    .line 82
    return-void

    .line 85
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mNeedAnimation:Z

    .line 86
    new-instance v0, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    const/16 v1, 0x50

    invoke-direct {v0, p1, v1}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 87
    return-void
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
    .line 226
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 227
    return-void
.end method

.method public resetData(Lcom/android/camera/data/data/ComponentData;)V
    .locals 1
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    .line 91
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initAdapter(Lcom/android/camera/data/data/ComponentData;)V

    .line 92
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-virtual {v0}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    .line 93
    return-void
.end method

.method public setComponentData(Lcom/android/camera/data/data/ComponentData;IZLcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 0
    .param p1, "data"    # Lcom/android/camera/data/data/ComponentData;
    .param p2, "currentMode"    # I
    .param p3, "needAnimation"    # Z
    .param p4, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    .line 56
    iput p2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    .line 57
    iput-boolean p3, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mNeedAnimation:Z

    .line 58
    iput-object p4, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    .line 59
    return-void
.end method

.method public showCustomWB(Lcom/android/camera/data/data/config/ComponentManuallyWB;)V
    .locals 3
    .param p1, "componentManuallyWB"    # Lcom/android/camera/data/data/config/ComponentManuallyWB;

    .prologue
    .line 201
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    iput-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    .line 203
    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    invoke-direct {v0, p1, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;-><init>(Lcom/android/camera/data/data/config/ComponentManuallyWB;Lcom/android/camera/fragment/manually/ManuallyListener;)V

    .line 204
    .local v0, "adapter":Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 205
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 206
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V

    .line 207
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getValuePosition()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalListView;->setSelection(I)V

    .line 208
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/HorizontalListView;->setVisibility(I)V

    .line 210
    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 211
    return-void
.end method

.method public updateData()V
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initAdapter(Lcom/android/camera/data/data/ComponentData;)V

    .line 101
    return-void
.end method
