.class public Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentPopupBeauty.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private mIconBeauty:Landroid/view/View;

.field private mIconSticker:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 61
    const/16 v0, 0xf9

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 56
    const v0, 0x7f040014

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 44
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 46
    const v1, 0x7f0a0047

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    .line 47
    const v1, 0x7f0a0048

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    .line 48
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    iget v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mCurrentMode:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->provideAnimateElement(ILjava/util/List;Z)V

    .line 52
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/16 v2, 0xa0

    .line 113
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 114
    return-void

    .line 116
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 138
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->getView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 139
    return-void

    .line 119
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 121
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-nez v0, :cond_1

    .line 122
    return-void

    .line 124
    :cond_1
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 129
    .end local v0    # "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 131
    .restart local v0    # "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-nez v0, :cond_2

    .line 132
    return-void

    .line 134
    :cond_2
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    goto :goto_0

    .line 116
    :pswitch_data_0
    .packed-switch 0x7f0a0047
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 6
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
    const/4 v5, 0x5

    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 67
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 69
    const/4 v0, 0x1

    .line 70
    .local v0, "newState":I
    packed-switch p1, :pswitch_data_0

    .line 76
    :pswitch_0
    const/4 v0, -0x1

    .line 80
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 81
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 82
    return-void

    .line 73
    :pswitch_1
    const/4 v0, 0x1

    .line 74
    goto :goto_0

    .line 86
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 88
    if-nez p2, :cond_2

    .line 89
    if-ne v0, v3, :cond_1

    .line 90
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 91
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 109
    :goto_1
    return-void

    .line 93
    :cond_1
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 94
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1

    .line 97
    :cond_2
    if-ne v0, v3, :cond_3

    .line 99
    new-instance v1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-direct {v1, v2, v4}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    .line 98
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance v1, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-direct {v1, v2, v5}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    .line 100
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 104
    :cond_3
    new-instance v1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconSticker:Landroid/view/View;

    invoke-direct {v1, v2, v4}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    .line 103
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/FragmentPopupBeauty;->mIconBeauty:Landroid/view/View;

    invoke-direct {v1, v2, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    .line 105
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 70
    nop

    :pswitch_data_0
    .packed-switch 0xa3
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 4
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 169
    packed-switch p1, :pswitch_data_0

    .line 173
    const/4 v1, 0x1

    new-array v1, v1, [I

    .line 174
    const/16 v2, 0xa1

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 173
    invoke-static {v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 176
    .local v0, "animation":Landroid/view/animation/Animation;
    return-object v0

    .line 171
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :pswitch_0
    const/4 v1, 0x0

    return-object v1

    .line 169
    :pswitch_data_0
    .packed-switch 0xf0
        :pswitch_0
    .end packed-switch
.end method
