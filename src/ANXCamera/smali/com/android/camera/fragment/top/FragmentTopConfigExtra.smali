.class public Lcom/android/camera/fragment/top/FragmentTopConfigExtra;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentTopConfigExtra.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public animateOut()V
    .locals 11

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 176
    new-instance v10, Landroid/view/animation/AnimationSet;

    invoke-direct {v10, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 177
    .local v10, "animationSet":Landroid/view/animation/AnimationSet;
    new-instance v9, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v9, v3, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 179
    .local v9, "alphaAnimation":Landroid/view/animation/AlphaAnimation;
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    .line 183
    const v8, -0x4270a3d7    # -0.07f

    move v3, v1

    move v4, v2

    move v5, v1

    move v6, v2

    move v7, v1

    .line 179
    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 185
    .local v0, "translateAnimation":Landroid/view/animation/TranslateAnimation;
    invoke-virtual {v10, v9}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 186
    invoke-virtual {v10, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 188
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v10, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 189
    const-wide/16 v2, 0xc8

    invoke-virtual {v10, v2, v3}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 190
    new-instance v1, Lcom/android/camera/fragment/top/FragmentTopConfigExtra$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra$1;-><init>(Lcom/android/camera/fragment/top/FragmentTopConfigExtra;)V

    invoke-virtual {v10, v1}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 206
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 208
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 86
    const/16 v0, 0xf5

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 81
    const v0, 0x7f04001d

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 52
    const v8, 0x7f0a0064

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/RecyclerView;

    iput-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 54
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 55
    .local v1, "cameraId":I
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v8

    .line 56
    iget v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mCurrentMode:I

    .line 55
    invoke-virtual {v8, v1, v9}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 57
    .local v0, "cameraCapabilities":Lcom/android/camera2/CameraCapabilities;
    iget v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mCurrentMode:I

    .line 59
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataCloudMgr()Lcom/android/camera/data/cloud/DataCloud$CloudManager;

    move-result-object v9

    invoke-interface {v9}, Lcom/android/camera/data/cloud/DataCloud$CloudManager;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v9

    .line 57
    invoke-static {v8, v1, v9, v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getSupportedExtraConfigs(IILcom/android/camera/data/cloud/DataCloud$CloudFeature;Lcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v7

    .line 62
    .local v7, "supportedConfigs":Lcom/android/camera/data/data/config/SupportedConfigs;
    invoke-virtual {v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v8

    const/4 v9, 0x4

    if-le v8, v9, :cond_0

    const/4 v2, 0x4

    .line 63
    .local v2, "count":I
    :goto_0
    invoke-virtual {v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v2

    div-float/2addr v8, v9

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v5, v8

    .line 64
    .local v5, "lineCount":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090073

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    mul-int v4, v8, v5

    .line 67
    .local v4, "height":I
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 68
    .local v6, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput v4, v6, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 70
    new-instance v3, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v3, v8, v2}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 71
    .local v3, "gridLayoutManager":Landroid/support/v7/widget/GridLayoutManager;
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 72
    new-instance v8, Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-direct {v8, v7, p0}, Lcom/android/camera/fragment/top/ExtraAdapter;-><init>(Lcom/android/camera/data/data/config/SupportedConfigs;Landroid/view/View$OnClickListener;)V

    iput-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    .line 74
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    iget v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mDegree:I

    invoke-virtual {v8, v9}, Lcom/android/camera/fragment/top/ExtraAdapter;->setNewDegree(I)V

    .line 75
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v9, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-virtual {v8, v9}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 76
    iget-object v8, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/support/v7/widget/RecyclerView;->setFocusable(Z)V

    .line 77
    return-void

    .line 62
    .end local v2    # "count":I
    .end local v3    # "gridLayoutManager":Landroid/support/v7/widget/GridLayoutManager;
    .end local v4    # "height":I
    .end local v5    # "lineCount":I
    .end local v6    # "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    invoke-virtual {v7}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v2

    .restart local v2    # "count":I
    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->isEnableClick()Z

    move-result v4

    if-nez v4, :cond_0

    .line 98
    return-void

    .line 101
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 102
    const/16 v5, 0xa4

    .line 101
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 104
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    if-nez v0, :cond_1

    .line 105
    return-void

    .line 109
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 110
    .local v1, "tag":I
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->onConfigChanged(I)V

    .line 111
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 112
    const/16 v5, 0xac

    .line 111
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 113
    .local v2, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 114
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-virtual {v4, v1}, Lcom/android/camera/fragment/top/ExtraAdapter;->setOnClictTag(I)V

    .line 116
    :cond_2
    sparse-switch v1, :sswitch_data_0

    .line 137
    iget-object v4, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 143
    :goto_0
    return-void

    .line 118
    :sswitch_0
    const/4 v4, 0x5

    invoke-interface {v2, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    goto :goto_0

    .line 121
    :sswitch_1
    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideExtraMenu()V

    .line 130
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 131
    const/16 v5, 0xc1

    .line 130
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;

    .line 132
    .local v3, "topConfigProtocol":Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;->startAiLens()V

    .line 134
    const-string/jumbo v4, "counter"

    const-string/jumbo v5, "ai_detect_changed"

    invoke-static {v4, v5}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 116
    :sswitch_data_0
    .sparse-switch
        0xe1 -> :sswitch_0
        0xf2 -> :sswitch_1
    .end sparse-switch
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
    .line 92
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 93
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 11
    .param p1, "lastFragmentInfo"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 152
    new-instance v10, Landroid/view/animation/AnimationSet;

    invoke-direct {v10, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 153
    .local v10, "animationSet":Landroid/view/animation/AnimationSet;
    new-instance v9, Landroid/view/animation/AlphaAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v9, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 155
    .local v9, "alphaAnimation":Landroid/view/animation/AlphaAnimation;
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    .line 158
    const v6, -0x42333333    # -0.1f

    move v3, v1

    move v4, v2

    move v5, v1

    move v7, v1

    move v8, v2

    .line 155
    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 161
    .local v0, "translateAnimation":Landroid/view/animation/TranslateAnimation;
    invoke-virtual {v10, v9}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 162
    invoke-virtual {v10, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 164
    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v10, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 165
    const-wide/16 v2, 0x15e

    invoke-virtual {v10, v2, v3}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 167
    return-object v10
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x0

    return-object v0
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 2
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
    .line 212
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 213
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mExtraAdapter:Lcom/android/camera/fragment/top/ExtraAdapter;

    invoke-virtual {v1, p2}, Lcom/android/camera/fragment/top/ExtraAdapter;->setNewDegree(I)V

    .line 214
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 215
    iget-object v1, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 217
    :cond_0
    return-void
.end method

.method public reFresh()V
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/android/camera/fragment/top/FragmentTopConfigExtra;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 147
    return-void
.end method
