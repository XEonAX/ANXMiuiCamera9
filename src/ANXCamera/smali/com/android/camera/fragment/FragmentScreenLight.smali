.class public Lcom/android/camera/fragment/FragmentScreenLight;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentScreenLight.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$ScreenLightProtocol;


# instance fields
.field private mRootView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 93
    const/16 v0, 0xff6

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 88
    const v0, 0x7f040017

    return v0
.end method

.method public hideScreenLight()V
    .locals 5

    .prologue
    .line 53
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 54
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    const-string/jumbo v2, "FragmentScreenLight"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "hideScreenLight: baseDelegate = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    if-eqz v0, :cond_0

    .line 57
    const v2, 0x7f0a009d

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    .line 58
    .local v1, "type":I
    const-string/jumbo v2, "FragmentScreenLight"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "hideScreenLight: type = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    const/16 v2, 0xf0

    if-eq v1, v2, :cond_0

    .line 60
    const/16 v2, 0x8

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 63
    .end local v1    # "type":I
    :cond_0
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentScreenLight;->mRootView:Landroid/view/View;

    .line 24
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 4
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 72
    const/4 v1, 0x1

    new-array v1, v1, [I

    .line 73
    const/16 v2, 0xa1

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 72
    invoke-static {v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 74
    .local v0, "animation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x64

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 75
    return-object v0
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 4

    .prologue
    .line 80
    const/4 v1, 0x1

    new-array v1, v1, [I

    .line 81
    const/16 v2, 0xa2

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 80
    invoke-static {v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 82
    .local v0, "animation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 83
    return-object v0
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 28
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 29
    const/16 v0, 0xc4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 30
    return-void
.end method

.method public setScreenLightColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentScreenLight;->mRootView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 68
    return-void
.end method

.method public showScreenLight()V
    .locals 3

    .prologue
    .line 41
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa0

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 43
    .local v0, "baseDelegate":Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;
    if-eqz v0, :cond_0

    .line 44
    const v1, 0x7f0a009d

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xf0

    if-ne v1, v2, :cond_0

    .line 45
    const/16 v1, 0x8

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 48
    :cond_0
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 35
    const/16 v0, 0xc4

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 36
    return-void
.end method
