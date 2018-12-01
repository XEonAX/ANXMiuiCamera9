.class public abstract Lcom/android/camera/fragment/BaseFragment;
.super Landroid/support/v4/app/Fragment;
.source "BaseFragment.java"

# interfaces
.implements Lcom/android/camera/animation/AnimationDelegate$AnimationResource;
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# instance fields
.field protected mCurrentMode:I

.field protected mDegree:I

.field private mEnableClick:Z

.field private mInModeChanging:Z

.field private mIsFullScreenNavBarHidden:Z

.field private mLaseFragmentInfo:I

.field private mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

.field private mRegistered:Z

.field private mSilentRemove:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 43
    const/16 v0, 0xf0

    iput v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLaseFragmentInfo:I

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mSilentRemove:Z

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mEnableClick:Z

    .line 32
    return-void
.end method


# virtual methods
.method public canProvide()Z
    .locals 1

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->isAdded()Z

    move-result v0

    return v0
.end method

.method public abstract getFragmentInto()I
.end method

.method public final getFragmentTag()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentInto()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getLayoutResourceId()I
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation
.end method

.method protected abstract initView(Landroid/view/View;)V
.end method

.method public isEnableClick()Z
    .locals 1

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mEnableClick:Z

    return v0
.end method

.method protected isInModeChanging()Z
    .locals 1

    .prologue
    .line 253
    iget-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mInModeChanging:Z

    return v0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 0
    .param p1, "arrivedType"    # I
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 268
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 1
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 260
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mInModeChanging:Z

    .line 261
    iput p2, p0, Lcom/android/camera/fragment/BaseFragment;->mCurrentMode:I

    .line 262
    return-void
.end method

.method public onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .locals 1
    .param p1, "transit"    # I
    .param p2, "enter"    # Z
    .param p3, "nextAnim"    # I

    .prologue
    .line 111
    if-eqz p2, :cond_0

    .line 112
    iget v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLaseFragmentInfo:I

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/BaseFragment;->provideEnterAnimation(I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0

    .line 113
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mSilentRemove:Z

    if-nez v0, :cond_1

    .line 114
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->provideExitAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0

    .line 117
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 82
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 83
    .local v0, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/BaseFragment;->mCurrentMode:I

    .line 85
    sget-boolean v2, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    iput-boolean v2, p0, Lcom/android/camera/fragment/BaseFragment;->mIsFullScreenNavBarHidden:Z

    .line 86
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->getLayoutResourceId()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 87
    .local v1, "v":Landroid/view/View;
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/BaseFragment;->initView(Landroid/view/View;)V

    .line 88
    return-object v1
.end method

.method public onDestroyView()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 135
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 136
    iget-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mRegistered:Z

    if-nez v0, :cond_0

    .line 137
    return-void

    .line 140
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mRegistered:Z

    .line 141
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->unRegisterProtocol()V

    .line 142
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    if-eqz v0, :cond_1

    .line 143
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeDestroy(Ljava/lang/String;)V

    .line 144
    iput-object v2, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .line 146
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 214
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 215
    iget-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mIsFullScreenNavBarHidden:Z

    sget-boolean v1, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    if-eq v0, v1, :cond_0

    .line 216
    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/BaseFragment;->initView(Landroid/view/View;)V

    .line 218
    :cond_0
    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mIsFullScreenNavBarHidden:Z

    .line 219
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 198
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 199
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeStart(Ljava/lang/String;)V

    .line 202
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 206
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 207
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    invoke-virtual {p0}, Lcom/android/camera/fragment/BaseFragment;->getFragmentTag()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;->onLifeStop(Ljava/lang/String;)V

    .line 210
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 130
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 131
    return-void
.end method

.method public pendingGone(Z)V
    .locals 1
    .param p1, "silent"    # Z

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 75
    iput-boolean p1, p0, Lcom/android/camera/fragment/BaseFragment;->mSilentRemove:Z

    .line 76
    return-void
.end method

.method public pendingShow()V
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 71
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 1
    .param p1, "newMode"    # I
    .param p3, "timeOut"    # Z
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

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
    .line 225
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    if-eqz p2, :cond_0

    .line 226
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mInModeChanging:Z

    .line 228
    :cond_0
    iput p1, p0, Lcom/android/camera/fragment/BaseFragment;->mCurrentMode:I

    .line 229
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 1
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 121
    const/4 v0, 0x0

    return-object v0
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return-object v0
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 0
    .param p2, "newDegree"    # I
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

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
    .line 238
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/BaseFragment;->setDegree(I)V

    .line 239
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 171
    return-void
.end method

.method protected final registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;
    .param p2, "handleBackTrace"    # Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;

    .prologue
    .line 181
    const/16 v1, 0xab

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 182
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->addInBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 183
    return-void
.end method

.method public final registerProtocol()V
    .locals 1

    .prologue
    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/BaseFragment;->mRegistered:Z

    .line 160
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 161
    return-void
.end method

.method public setClickEnable(Z)V
    .locals 0
    .param p1, "enable"    # Z
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 244
    iput-boolean p1, p0, Lcom/android/camera/fragment/BaseFragment;->mEnableClick:Z

    .line 245
    return-void
.end method

.method public final setDegree(I)V
    .locals 0
    .param p1, "newDegree"    # I

    .prologue
    .line 232
    iput p1, p0, Lcom/android/camera/fragment/BaseFragment;->mDegree:I

    .line 233
    return-void
.end method

.method public setEnableClickInitValue(Z)V
    .locals 0
    .param p1, "enableClick"    # Z

    .prologue
    .line 58
    iput-boolean p1, p0, Lcom/android/camera/fragment/BaseFragment;->mEnableClick:Z

    .line 59
    return-void
.end method

.method public setLastFragmentInfo(I)V
    .locals 0
    .param p1, "laseFragmentInfo"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/android/camera/fragment/BaseFragment;->mLaseFragmentInfo:I

    .line 67
    return-void
.end method

.method public setLifecycleListener(Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V
    .locals 0
    .param p1, "lifecycleListener"    # Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/android/camera/fragment/BaseFragment;->mLifecycleListener:Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;

    .line 63
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 176
    return-void
.end method

.method protected final unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V
    .locals 2
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;
    .param p2, "handleBackTrace"    # Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;

    .prologue
    .line 188
    const/16 v1, 0xab

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 191
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    if-eqz v0, :cond_0

    .line 192
    invoke-interface {v0, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->removeBackStack(Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 194
    :cond_0
    return-void
.end method

.method public final unRegisterProtocol()V
    .locals 1

    .prologue
    .line 165
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 166
    return-void
.end method
