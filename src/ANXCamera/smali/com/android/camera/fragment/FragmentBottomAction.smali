.class public Lcom/android/camera/fragment/FragmentBottomAction;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentBottomAction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/protocol/ModeProtocol$ModeChangeController;
.implements Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;
.implements Lcom/android/camera/protocol/ModeProtocol$FilterSwitcher;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;
.implements Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;
.implements Lcom/android/camera/ui/CameraSnapView$SnapListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentBottomAction$1;
    }
.end annotation


# instance fields
.field private mBottomAnimator:Landroid/animation/ValueAnimator;

.field private mCameraPickEnable:Z

.field private mCameraPicker:Landroid/view/View;

.field private mCameraPickerRes:Landroid/widget/ImageView;

.field private mCaptureProgressDelay:I

.field private mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

.field private mFilterLayout:Landroid/view/View;

.field private mFilterListHeight:I

.field private mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mInLoading:Z

.field private mIsIntentAction:Z

.field private mIsShowFilter:Z

.field private mLongPressBurst:Z

.field private mModeSelectLayout:Landroid/view/View;

.field private mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

.field private mRecordProgressDelay:I

.field private mRecordingPause:Landroid/widget/ImageView;

.field private mRecordingSnap:Landroid/widget/ImageView;

.field private mShutterButton:Lcom/android/camera/ui/CameraSnapView;

.field private mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

.field private mThumbnailImage:Landroid/widget/ImageView;

.field private mThumbnailImageLayout:Landroid/view/ViewGroup;

.field private mThumbnailProgress:Landroid/widget/ProgressBar;

.field private mV9bottomParentLayout:Landroid/widget/RelativeLayout;

.field private mVideoCaptureEnable:Z

.field private mVideoPauseSupported:Z

.field private mVideoRecordingStarted:Z


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentBottomAction;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPickEnable:Z

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/View;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -get10(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic -get11(Lcom/android/camera/fragment/FragmentBottomAction;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    return v0
.end method

.method static synthetic -get12(Lcom/android/camera/fragment/FragmentBottomAction;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    return v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/FragmentBottomAction;)Lcom/android/camera/ui/EdgeHorizonScrollView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/View;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/View;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/fragment/FragmentBottomAction;)Lcom/android/camera/ui/ModeSelectView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get8(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get9(Lcom/android/camera/fragment/FragmentBottomAction;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/FragmentBottomAction;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/FragmentBottomAction;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentBottomAction;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->resetBottom()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    .line 119
    new-instance v0, Lcom/android/camera/fragment/FragmentBottomAction$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/FragmentBottomAction$1;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    .line 66
    return-void
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "currentMode"    # I

    .prologue
    const/high16 v2, 0x7f0d0000

    .line 353
    const/16 v1, 0xa5

    if-ne p2, v1, :cond_0

    .line 354
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 355
    return-void

    .line 358
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    .line 359
    .local v0, "uiStyle":I
    packed-switch v0, :pswitch_data_0

    .line 362
    :pswitch_0
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 370
    :goto_0
    return-void

    .line 367
    :pswitch_1
    const v1, 0x7f0d000b

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 359
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private initThumbLayoutByIntent()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 213
    iget-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsIntentAction:Z

    if-nez v2, :cond_2

    .line 214
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    .line 220
    .local v0, "activityBase":Lcom/android/camera/ActivityBase;
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->startFromSecureKeyguard()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isGalleryLocked()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->isGalleryBack()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_1

    .line 222
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v5, v3, v4}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 223
    return-void

    .line 226
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnail()V

    .line 235
    .end local v0    # "activityBase":Lcom/android/camera/ActivityBase;
    :goto_0
    return-void

    .line 229
    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 231
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 232
    .local v1, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {v1, v4, v4, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 233
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v3, 0x7f02013c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method private isThumbLoading()Z
    .locals 1

    .prologue
    .line 432
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mInLoading:Z

    return v0
.end method

.method private prepareRecording()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 763
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 764
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v2, 0xa6

    if-eq v1, v2, :cond_0

    .line 765
    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    .line 770
    :goto_0
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/FragmentBottomAction;->updateBottomInRecording(Z)V

    .line 771
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->prepareRecording()V

    .line 772
    return-void

    .line 767
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideConfigMenu()V

    goto :goto_0
.end method

.method private resetBottom()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 563
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v1, :pswitch_data_0

    .line 579
    :goto_0
    :pswitch_0
    return-void

    .line 571
    :pswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 572
    const/16 v2, 0xac

    .line 571
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 573
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    .line 574
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(IZ)V

    .line 575
    invoke-direct {p0, v3}, Lcom/android/camera/fragment/FragmentBottomAction;->updateBottomInRecording(Z)V

    goto :goto_0

    .line 563
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private updateBottomInRecording(Z)V
    .locals 5
    .param p1, "start"    # Z

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 775
    if-eqz p1, :cond_0

    .line 776
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 777
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-eq v0, v4, :cond_0

    .line 778
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 782
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v0, :pswitch_data_0

    .line 784
    :pswitch_0
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 785
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 809
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    .line 810
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    const v1, 0x7f020003

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 811
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 812
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 813
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-static {v0, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 816
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    .line 817
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v1, 0x7f0200de

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 818
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setSoundEffectsEnabled(Z)V

    .line 819
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 820
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-static {v0, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 823
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 824
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 827
    :cond_3
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    .line 828
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 829
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomAction$6;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/FragmentBottomAction$6;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;Z)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 852
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomAction$7;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/fragment/FragmentBottomAction$7;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;Z)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 894
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mBottomAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 895
    return-void

    .line 792
    :pswitch_1
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 793
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    goto :goto_0

    .line 797
    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v0

    if-nez v0, :cond_4

    .line 798
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoCaptureVisible()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    .line 800
    :cond_4
    invoke-static {}, Lcom/android/camera/Device;->isSupportedVideoPause()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    goto/16 :goto_0

    .line 804
    :pswitch_3
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    .line 805
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    goto/16 :goto_0

    .line 782
    nop

    :pswitch_data_0
    .packed-switch 0xa2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 827
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public canSnap()Z
    .locals 3

    .prologue
    .line 1275
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1276
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public changeMode(II)V
    .locals 6
    .param p1, "newMode"    # I
    .param p2, "forceDelayTime"    # I

    .prologue
    const/4 v5, 0x1

    .line 908
    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    if-eq p1, v3, :cond_0

    iget-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v3, :cond_1

    .line 909
    :cond_0
    return-void

    .line 913
    :cond_1
    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v3, :pswitch_data_0

    .line 928
    :goto_0
    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isThumbLoading()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 929
    return-void

    .line 918
    :pswitch_1
    packed-switch p1, :pswitch_data_1

    :pswitch_2
    goto :goto_0

    .line 923
    :pswitch_3
    return-void

    .line 933
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xa1

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 934
    .local v1, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v1, :cond_3

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 935
    return-void

    .line 944
    :cond_3
    iput p1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    .line 945
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 946
    .local v2, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 948
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 949
    .local v0, "camera":Lcom/android/camera/Camera;
    invoke-static {p1}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/android/camera/module/loader/StartControl;->setStartDelay(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    .line 951
    const/4 v4, 0x3

    .line 949
    invoke-virtual {v3, v4}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    .line 954
    return-void

    .line 913
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

    .line 918
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

.method public filterUiChange()V
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 258
    return-void
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 1020
    const/16 v0, 0xf1

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 1015
    const v0, 0x7f040005

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v6, 0x7f0a0015

    const/4 v5, 0x0

    .line 133
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 134
    .local v1, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 136
    const v2, 0x7f0a0016

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    .line 138
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 140
    .local v0, "bottomParentParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090079

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 141
    sget v3, Lcom/android/camera/Util;->sNavigationBarHeight:I

    .line 140
    add-int/2addr v2, v3

    .line 139
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 143
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getComponentModuleList()Lcom/android/camera/data/data/global/ComponentModuleList;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    .line 145
    const v2, 0x7f0a0012

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    .line 148
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    const v3, 0x7f0a0013

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/EdgeHorizonScrollView;

    .line 147
    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    .line 150
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    const v3, 0x7f0a0014

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/ModeSelectView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    .line 152
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v4, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v2, v3, v4}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 153
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v2, p0}, Lcom/android/camera/ui/ModeSelectView;->setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V

    .line 155
    const v2, 0x7f0a0017

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    .line 156
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v3, 0x7f0a0018

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    .line 158
    const v2, 0x7f0a001a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    .line 159
    const v2, 0x7f0a0019

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    .line 162
    const v2, 0x7f0a001b

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/CameraSnapView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    .line 163
    const v2, 0x7f0a001c

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    .line 164
    const v2, 0x7f0a001d

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPickerRes:Landroid/widget/ImageView;

    .line 165
    const v2, 0x7f0a001e

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    .line 166
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    .line 171
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v2, v3, v5}, Lcom/android/camera/ui/CameraSnapView;->setCurrentMode(IZ)V

    .line 172
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, p0}, Lcom/android/camera/ui/CameraSnapView;->setSnapListener(Lcom/android/camera/ui/CameraSnapView$SnapListener;)V

    .line 173
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v2, v5}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 175
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCaptureProgressDelay:I

    .line 176
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0005

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordProgressDelay:I

    .line 178
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingSnap:Landroid/widget/ImageView;

    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, v2, v3}, Lcom/android/camera/fragment/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 185
    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3, v5}, Lcom/android/camera/fragment/FragmentBottomAction;->provideAnimateElement(ILjava/util/List;Z)V

    .line 187
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsIntentAction:Z

    .line 189
    new-instance v2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 190
    new-instance v2, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 192
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 193
    const v3, 0x7f09002d

    .line 192
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterListHeight:I

    .line 195
    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    .line 196
    new-instance v2, Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {v2}, Lcom/android/camera/fragment/FragmentFilter;-><init>()V

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    .line 197
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 198
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v4}, Lcom/android/camera/fragment/FragmentFilter;->getFragmentTag()Ljava/lang/String;

    move-result-object v4

    .line 197
    invoke-static {v2, v6, v3, v4}, Lcom/android/camera/fragment/FragmentUtils;->addFragmentWithTag(Landroid/support/v4/app/FragmentManager;ILandroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 199
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 200
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {v2, v5}, Lcom/android/camera/Util;->setAccessibilityFocusable(Landroid/view/View;Z)V

    .line 202
    :cond_0
    return-void
.end method

.method public isShowFilter()Z
    .locals 1

    .prologue
    .line 239
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    return v0
.end method

.method public notifyDataChanged(II)V
    .locals 4
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 1259
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 1260
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v0

    .line 1261
    .local v0, "currentIntentAction":Z
    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsIntentAction:Z

    if-eq v0, v1, :cond_0

    .line 1262
    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsIntentAction:Z

    .line 1263
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/ui/ModeSelectView;->init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V

    .line 1264
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 1266
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mInLoading:Z

    .line 1267
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    iget v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-direct {p0, v1, v2}, Lcom/android/camera/fragment/FragmentBottomAction;->adjustViewBackground(Landroid/view/View;I)V

    .line 1269
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/FragmentFilter;->updateFilterData()V

    .line 1270
    return-void
.end method

.method public onBackEvent(I)Z
    .locals 4
    .param p1, "callingFrom"    # I

    .prologue
    const/4 v3, 0x1

    .line 1462
    if-ne p1, v3, :cond_1

    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v1, :cond_1

    .line 1463
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->showOrHideFilter()V

    .line 1464
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1465
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 1466
    const/16 v2, 0xac

    .line 1465
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 1467
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateContentDescription()V

    .line 1469
    .end local v0    # "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    :cond_0
    return v3

    .line 1471
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 19
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 616
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v13

    if-nez v13, :cond_0

    .line 617
    return-void

    .line 620
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v13

    const/16 v14, 0xa1

    invoke-virtual {v13, v14}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 621
    .local v3, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-nez v3, :cond_1

    .line 622
    return-void

    .line 625
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v13

    check-cast v13, Lcom/android/camera/ActivityBase;

    invoke-virtual {v13}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v7

    .line 626
    .local v7, "module":Lcom/android/camera/module/Module;
    invoke-interface {v7}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 627
    const-string/jumbo v13, "FragmentBottomAction"

    const-string/jumbo v14, "onClick: ignore click event, because module isn\'t ready"

    invoke-static {v13, v14}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 628
    return-void

    .line 631
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v13

    packed-switch v13, :pswitch_data_0

    .line 759
    :cond_3
    :goto_0
    :pswitch_0
    return-void

    .line 633
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isThumbLoading()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 634
    return-void

    .line 636
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v13

    invoke-virtual {v13}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v13

    if-nez v13, :cond_5

    .line 637
    const/4 v13, 0x0

    invoke-interface {v3, v13}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onThumbnailClicked(Landroid/view/View;)V

    goto :goto_0

    .line 639
    :cond_5
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onReviewCancelClicked()V

    goto :goto_0

    .line 644
    :pswitch_2
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 645
    return-void

    .line 647
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isThumbLoading()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 648
    return-void

    .line 650
    :cond_7
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v13

    invoke-interface {v13}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v6

    check-cast v6, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 651
    .local v6, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v6}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v4

    .line 652
    .local v4, "currentCamera":I
    if-nez v4, :cond_9

    .line 653
    const/4 v8, 0x1

    .line 656
    .local v8, "newCameraFacing":I
    :goto_1
    invoke-virtual {v6, v8}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    .line 658
    const/4 v13, 0x1

    if-ne v8, v13, :cond_a

    .line 659
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 660
    const/high16 v14, -0x3ccc0000    # -180.0f

    .line 659
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 661
    const-wide/16 v14, 0x12c

    .line 659
    invoke-virtual {v13, v14, v15}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    invoke-virtual {v13}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 671
    :goto_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v13

    const/16 v14, 0xac

    invoke-virtual {v13, v14}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v11

    check-cast v11, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 672
    .local v11, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v13, 0x4

    invoke-interface {v11, v13}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    .line 673
    const-string/jumbo v13, "FragmentBottomAction"

    sget-object v14, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 674
    const-string/jumbo v15, "switch camera from %d to %d, for module 0x%x"

    .line 673
    const/16 v16, 0x3

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    .line 675
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v18, 0x0

    aput-object v17, v16, v18

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v18, 0x1

    aput-object v17, v16, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v18, 0x2

    aput-object v17, v16, v18

    .line 673
    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    const/4 v13, 0x1

    if-ne v4, v13, :cond_b

    const/4 v13, 0x1

    move v14, v13

    .line 677
    :goto_3
    const/4 v13, 0x1

    if-ne v8, v13, :cond_c

    const/4 v13, 0x1

    :goto_4
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    .line 676
    invoke-static {v14, v13, v15}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraStart(ZZI)V

    .line 678
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v13, :pswitch_data_1

    .line 680
    :pswitch_3
    move-object/from16 v0, p0

    iget v9, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    .line 681
    .local v9, "newMode":I
    const/16 v13, 0xa0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    .line 682
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v13}, Lcom/android/camera/fragment/FragmentBottomAction;->changeMode(II)V

    .line 720
    .end local v9    # "newMode":I
    :goto_5
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v13, :cond_8

    .line 721
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->showOrHideFilter()V

    .line 724
    :cond_8
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v13

    if-eqz v13, :cond_3

    .line 725
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v14, 0x7f0f00e6

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/android/camera/fragment/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 726
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v14, 0x8000

    invoke-virtual {v13, v14}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    goto/16 :goto_0

    .line 654
    .end local v8    # "newCameraFacing":I
    .end local v11    # "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    :cond_9
    const/4 v8, 0x0

    .restart local v8    # "newCameraFacing":I
    goto/16 :goto_1

    .line 664
    :cond_a
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 665
    const/high16 v14, 0x43340000    # 180.0f

    .line 664
    invoke-virtual {v13, v14}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotationBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    .line 666
    const-wide/16 v14, 0x12c

    .line 664
    invoke-virtual {v13, v14, v15}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v13

    invoke-virtual {v13}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_2

    .line 676
    .restart local v11    # "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    :cond_b
    const/4 v13, 0x0

    move v14, v13

    goto :goto_3

    .line 677
    :cond_c
    const/4 v13, 0x0

    goto :goto_4

    .line 690
    :pswitch_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v13

    const/16 v14, 0xa2

    invoke-virtual {v13, v14}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 691
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v13

    check-cast v13, Lcom/android/camera/Camera;

    const/16 v14, 0xa2

    invoke-static {v14}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v14

    .line 692
    const/4 v15, 0x1

    .line 691
    invoke-virtual {v14, v15}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v14

    .line 693
    const/4 v15, 0x1

    .line 691
    invoke-virtual {v14, v15}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_5

    .line 698
    :pswitch_5
    const/16 v10, 0xa2

    .line 699
    .local v10, "targetMode":I
    if-nez v8, :cond_d

    .line 700
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v13

    invoke-virtual {v13}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v5

    .line 701
    .local v5, "dataBackUp":Lcom/android/camera/data/backup/DataBackUp;
    invoke-interface {v5}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v13

    if-eqz v13, :cond_f

    .line 702
    const/16 v10, 0xa9

    .line 710
    .end local v5    # "dataBackUp":Lcom/android/camera/data/backup/DataBackUp;
    :cond_d
    :goto_6
    const/16 v13, 0xa2

    if-eq v10, v13, :cond_e

    .line 711
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v13

    invoke-virtual {v13, v10}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    .line 714
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v13

    check-cast v13, Lcom/android/camera/Camera;

    invoke-static {v10}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v14

    .line 715
    const/4 v15, 0x1

    .line 714
    invoke-virtual {v14, v15}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v14

    .line 716
    const/4 v15, 0x1

    .line 714
    invoke-virtual {v14, v15}, Lcom/android/camera/module/loader/StartControl;->setNeedViewAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto/16 :goto_5

    .line 703
    .restart local v5    # "dataBackUp":Lcom/android/camera/data/backup/DataBackUp;
    :cond_f
    invoke-interface {v5}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoSlowMotion()Z

    move-result v13

    if-eqz v13, :cond_10

    .line 704
    const/16 v10, 0xa8

    goto :goto_6

    .line 705
    :cond_10
    invoke-interface {v5}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoHFRMode()Z

    move-result v13

    if-eqz v13, :cond_d

    .line 706
    const/16 v10, 0xaa

    goto :goto_6

    .line 731
    .end local v4    # "currentCamera":I
    .end local v5    # "dataBackUp":Lcom/android/camera/data/backup/DataBackUp;
    .end local v6    # "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    .end local v8    # "newCameraFacing":I
    .end local v10    # "targetMode":I
    .end local v11    # "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    :pswitch_6
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xa9

    if-eq v13, v14, :cond_12

    .line 732
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xa8

    if-eq v13, v14, :cond_12

    .line 733
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xaa

    if-eq v13, v14, :cond_12

    .line 734
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xa2

    if-eq v13, v14, :cond_12

    .line 737
    :cond_11
    return-void

    .line 735
    :cond_12
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoPauseSupported:Z

    xor-int/lit8 v13, v13, 0x1

    .line 731
    if-nez v13, :cond_11

    .line 736
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    xor-int/lit8 v13, v13, 0x1

    .line 731
    if-nez v13, :cond_11

    .line 740
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    .line 741
    .local v2, "activityBase":Lcom/android/camera/ActivityBase;
    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v12

    check-cast v12, Lcom/android/camera/module/VideoModule;

    .line 742
    .local v12, "videoModule":Lcom/android/camera/module/VideoModule;
    invoke-virtual {v12}, Lcom/android/camera/module/VideoModule;->onPauseButtonClick()V

    goto/16 :goto_0

    .line 746
    .end local v2    # "activityBase":Lcom/android/camera/ActivityBase;
    .end local v12    # "videoModule":Lcom/android/camera/module/VideoModule;
    :pswitch_7
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xa9

    if-eq v13, v14, :cond_14

    .line 747
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xa8

    if-eq v13, v14, :cond_14

    .line 748
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xaa

    if-eq v13, v14, :cond_14

    .line 749
    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v14, 0xa2

    if-eq v13, v14, :cond_14

    .line 752
    :cond_13
    return-void

    .line 750
    :cond_14
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoCaptureEnable:Z

    xor-int/lit8 v13, v13, 0x1

    .line 746
    if-nez v13, :cond_13

    .line 751
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    xor-int/lit8 v13, v13, 0x1

    .line 746
    if-nez v13, :cond_13

    .line 754
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    .line 755
    .restart local v2    # "activityBase":Lcom/android/camera/ActivityBase;
    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v12

    check-cast v12, Lcom/android/camera/module/VideoModule;

    .line 756
    .restart local v12    # "videoModule":Lcom/android/camera/module/VideoModule;
    invoke-virtual {v12}, Lcom/android/camera/module/VideoModule;->takeVideoSnapShoot()Z

    goto/16 :goto_0

    .line 631
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0017
        :pswitch_1
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_7
    .end packed-switch

    .line 678
    :pswitch_data_1
    .packed-switch 0xa2
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public onModeClicked(I)V
    .locals 1
    .param p1, "newMode"    # I

    .prologue
    .line 900
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/fragment/FragmentBottomAction;->changeMode(II)V

    .line 901
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 207
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    .line 208
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->initThumbLayoutByIntent()V

    .line 210
    return-void
.end method

.method public onSnapClick()V
    .locals 6

    .prologue
    const/16 v5, 0xa

    .line 1326
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1327
    return-void

    .line 1330
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1331
    return-void

    .line 1333
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ActivityBase;

    invoke-virtual {v3}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v2

    .line 1334
    .local v2, "module":Lcom/android/camera/module/Module;
    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1335
    const-string/jumbo v3, "FragmentBottomAction"

    const-string/jumbo v4, "onSnapClick: ignore onSnapClick event, because module isn\'t ready"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1336
    return-void

    .line 1340
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    const/16 v4, 0xa1

    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1341
    .local v1, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-nez v1, :cond_3

    .line 1342
    return-void

    .line 1345
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v3

    .line 1346
    const/16 v4, 0xab

    .line 1345
    invoke-virtual {v3, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1347
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    .line 1348
    const-string/jumbo v3, "FragmentBottomAction"

    const-string/jumbo v4, "onSnapClick"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1349
    iget v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v3, :pswitch_data_0

    .line 1352
    :pswitch_0
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1353
    return-void

    .line 1355
    :cond_4
    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    .line 1375
    :goto_0
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1376
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v4, 0x7f0f00e7

    invoke-virtual {p0, v4}, Lcom/android/camera/fragment/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1377
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    const v4, 0x8000

    invoke-virtual {v3, v4}, Lcom/android/camera/ui/EdgeHorizonScrollView;->sendAccessibilityEvent(I)V

    .line 1379
    :cond_5
    return-void

    .line 1358
    :pswitch_1
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1359
    return-void

    .line 1366
    :cond_6
    :pswitch_2
    iget-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v3, :cond_7

    .line 1367
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->prepareRecording()V

    .line 1368
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 1371
    :cond_7
    invoke-interface {v1, v5}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1349
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public onSnapLongPress()V
    .locals 4

    .prologue
    .line 1383
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1384
    return-void

    .line 1388
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa1

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1389
    .local v1, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-nez v1, :cond_1

    .line 1390
    return-void

    .line 1393
    :cond_1
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1394
    return-void

    .line 1397
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 1398
    const/16 v3, 0xab

    .line 1397
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1399
    .local v0, "backStack":Lcom/android/camera/protocol/ModeProtocol$BackStack;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    .line 1400
    const-string/jumbo v2, "FragmentBottomAction"

    const-string/jumbo v3, "onSnapLongPress"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1402
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClick()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1403
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mLongPressBurst:Z

    .line 1405
    :cond_3
    return-void
.end method

.method public onSnapLongPressCancelIn()V
    .locals 3

    .prologue
    .line 1429
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1430
    return-void

    .line 1434
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1435
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-nez v0, :cond_1

    .line 1436
    return-void

    .line 1439
    :cond_1
    const-string/jumbo v1, "FragmentBottomAction"

    const-string/jumbo v2, "onSnapLongPressCancelIn"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1440
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1442
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v1, :pswitch_data_0

    .line 1458
    :cond_2
    :goto_0
    :pswitch_0
    return-void

    .line 1447
    :pswitch_1
    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v1, :cond_2

    .line 1448
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mLongPressBurst:Z

    goto :goto_0

    .line 1455
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->onSnapClick()V

    goto :goto_0

    .line 1442
    nop

    :pswitch_data_0
    .packed-switch 0xa3
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onSnapLongPressCancelOut()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1409
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1410
    return-void

    .line 1414
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1415
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-nez v0, :cond_1

    .line 1416
    return-void

    .line 1419
    :cond_1
    const-string/jumbo v1, "FragmentBottomAction"

    const-string/jumbo v2, "onSnapLongPressCancelOut"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1420
    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonLongClickCancel(Z)V

    .line 1422
    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mLongPressBurst:Z

    if-eqz v1, :cond_2

    .line 1423
    iput-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mLongPressBurst:Z

    .line 1425
    :cond_2
    return-void
.end method

.method public onSnapPrepare()V
    .locals 3

    .prologue
    .line 1281
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1282
    return-void

    .line 1286
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 1287
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-nez v0, :cond_1

    .line 1288
    return-void

    .line 1290
    :cond_1
    const-string/jumbo v1, "FragmentBottomAction"

    const-string/jumbo v2, "onSnapPrepare"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1291
    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->onShutterButtonFocus(ZI)V

    .line 1292
    return-void
.end method

.method public onTrackSnapMissTaken(J)V
    .locals 5
    .param p1, "time"    # J

    .prologue
    .line 1296
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1297
    return-void

    .line 1300
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xba

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1302
    .local v0, "cameraActionTrack":Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;
    if-nez v0, :cond_1

    .line 1303
    return-void

    .line 1305
    :cond_1
    const-string/jumbo v1, "FragmentBottomAction"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onTrackSnapMissTaken "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1306
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonMissTaken(J)V

    .line 1307
    return-void
.end method

.method public onTrackSnapTaken(J)V
    .locals 5
    .param p1, "time"    # J

    .prologue
    .line 1311
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->isEnableClick()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1312
    return-void

    .line 1315
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xba

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;

    .line 1317
    .local v0, "cameraActionTrack":Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;
    if-nez v0, :cond_1

    .line 1318
    return-void

    .line 1320
    :cond_1
    const-string/jumbo v1, "FragmentBottomAction"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onTrackSnapTaken "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1321
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$CameraActionTrack;->onTrackShutterButtonTaken(J)V

    .line 1322
    return-void
.end method

.method public processingAudioCapture(Z)V
    .locals 1
    .param p1, "start"    # Z

    .prologue
    .line 555
    if-eqz p1, :cond_0

    .line 556
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->startRing()V

    .line 560
    :goto_0
    return-void

    .line 558
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraSnapView;->stopRing()V

    goto :goto_0
.end method

.method public processingFailed()V
    .locals 2

    .prologue
    .line 541
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomAction$5;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomAction$5;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 551
    return-void
.end method

.method public processingFinish()V
    .locals 2

    .prologue
    .line 526
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/fragment/FragmentBottomAction$4;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomAction$4;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 537
    return-void
.end method

.method public processingPause()V
    .locals 3

    .prologue
    .line 490
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v1, :pswitch_data_0

    .line 504
    :goto_0
    :pswitch_0
    return-void

    .line 496
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->pauseRecording()V

    .line 497
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f0200df

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 499
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 500
    const/16 v2, 0xac

    .line 499
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 501
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    .line 490
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
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
.end method

.method public processingResume()V
    .locals 3

    .prologue
    .line 508
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v1, :pswitch_data_0

    .line 522
    :goto_0
    :pswitch_0
    return-void

    .line 514
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v1}, Lcom/android/camera/ui/CameraSnapView;->resumeRecording()V

    .line 515
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    const v2, 0x7f0200de

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 517
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 518
    const/16 v2, 0xac

    .line 517
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 519
    .local v0, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setRecordingTimeState(I)V

    goto :goto_0

    .line 508
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
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
.end method

.method public processingStart()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 470
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/EdgeHorizonScrollView;->setEnabled(Z)V

    .line 471
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ModeSelectView;->setEnabled(Z)V

    .line 472
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v0, :pswitch_data_0

    .line 486
    :goto_0
    :pswitch_0
    return-void

    .line 479
    :pswitch_1
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-nez v0, :cond_0

    .line 480
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->prepareRecording()V

    .line 481
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/CameraSnapView;->triggerAnimation(IZ)V

    goto :goto_0

    .line 472
    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 5
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
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1026
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 1028
    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/FragmentBottomAction;->processingAudioCapture(Z)V

    .line 1030
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-eqz v1, :cond_0

    .line 1031
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v1, p2}, Lcom/android/camera/fragment/FragmentFilter;->isShowAnimation(Ljava/util/List;)V

    .line 1034
    :cond_0
    if-eqz p3, :cond_1

    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v1, :cond_1

    .line 1035
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->showOrHideFilter()V

    .line 1039
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 1045
    :goto_0
    iget-object v4, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    if-eqz p2, :cond_2

    move v1, v2

    :goto_1
    invoke-virtual {v4, p1, v1}, Lcom/android/camera/ui/CameraSnapView;->setCurrentMode(IZ)V

    .line 1047
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectView:Lcom/android/camera/ui/ModeSelectView;

    invoke-virtual {v1, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->judgePosition(ILjava/util/List;)V

    .line 1050
    packed-switch p1, :pswitch_data_1

    .line 1052
    :pswitch_0
    const/4 v0, 0x1

    .line 1053
    .local v0, "newState":I
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPickEnable:Z

    .line 1071
    :goto_2
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v0, :cond_4

    .line 1072
    return-void

    .line 1041
    .end local v0    # "newState":I
    :pswitch_1
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mModeSelectLayout:Landroid/view/View;

    const/high16 v4, 0x7f0d0000

    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_2
    move v1, v3

    .line 1045
    goto :goto_1

    .line 1056
    :pswitch_2
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1057
    const/4 v0, 0x1

    .line 1058
    .restart local v0    # "newState":I
    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_2

    .line 1060
    .end local v0    # "newState":I
    :cond_3
    const/4 v0, -0x1

    .line 1061
    .restart local v0    # "newState":I
    iput-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_2

    .line 1066
    .end local v0    # "newState":I
    :pswitch_3
    const/4 v0, -0x1

    .line 1067
    .restart local v0    # "newState":I
    iput-boolean v3, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPickEnable:Z

    goto :goto_2

    .line 1074
    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1076
    if-ne v0, v2, :cond_6

    .line 1077
    if-nez p2, :cond_5

    .line 1078
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 1089
    :goto_3
    return-void

    .line 1080
    :cond_5
    new-instance v1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1083
    :cond_6
    if-nez p2, :cond_7

    .line 1084
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_3

    .line 1086
    :cond_7
    new-instance v1, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1039
    :pswitch_data_0
    .packed-switch 0xa5
        :pswitch_1
    .end packed-switch

    .line 1050
    :pswitch_data_1
    .packed-switch 0xa6
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 4
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 1094
    packed-switch p1, :pswitch_data_0

    .line 1099
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/16 v2, 0xa1

    const/4 v3, 0x0

    aput v2, v1, v3

    invoke-static {v1}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 1100
    .local v0, "animation":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x96

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 1103
    return-object v0

    .line 1096
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :pswitch_0
    const/4 v1, 0x0

    return-object v1

    .line 1094
    nop

    :pswitch_data_0
    .packed-switch 0xf0
        :pswitch_0
    .end packed-switch
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 3

    .prologue
    .line 1108
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/16 v1, 0xa2

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
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
    .line 1248
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 1250
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1251
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1252
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCameraPicker:Landroid/view/View;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1253
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordingPause:Landroid/widget/ImageView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1254
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 585
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 586
    const/16 v0, 0xb3

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 587
    const/16 v0, 0xa2

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 588
    const/16 v0, 0xb7

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 589
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomAction;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 590
    return-void
.end method

.method public selectMode(II)V
    .locals 8
    .param p1, "gravity"    # I
    .param p2, "delayTime"    # I

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x3

    .line 959
    const/4 v5, -0x1

    if-ne p1, v5, :cond_0

    .line 960
    return-void

    .line 962
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 963
    if-ne p1, v6, :cond_6

    .line 964
    const p1, 0x800005

    .line 976
    :cond_1
    :goto_0
    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    .line 979
    .local v1, "mode":I
    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v6, 0xa9

    if-eq v5, v6, :cond_2

    .line 980
    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v6, 0xa8

    if-ne v5, v6, :cond_9

    .line 982
    :cond_2
    :goto_1
    const/16 v1, 0xa2

    .line 985
    :cond_3
    const/4 v3, 0x0

    .line 986
    .local v3, "position":I
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v5}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    .line 987
    .local v4, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v4, :cond_4

    .line 988
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v5, v0}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v5

    if-ne v5, v1, :cond_a

    .line 989
    move v3, v0

    .line 993
    :cond_4
    packed-switch p1, :pswitch_data_0

    .line 1009
    :cond_5
    :goto_3
    :pswitch_0
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mComponentModuleList:Lcom/android/camera/data/data/global/ComponentModuleList;

    invoke-virtual {v5, v3}, Lcom/android/camera/data/data/global/ComponentModuleList;->getMode(I)I

    move-result v2

    .line 1010
    .local v2, "newMode":I
    invoke-virtual {p0, v2, p2}, Lcom/android/camera/fragment/FragmentBottomAction;->changeMode(II)V

    .line 1011
    return-void

    .line 965
    .end local v0    # "i":I
    .end local v1    # "mode":I
    .end local v2    # "newMode":I
    .end local v3    # "position":I
    .end local v4    # "size":I
    :cond_6
    if-ne p1, v7, :cond_1

    .line 966
    const p1, 0x800003

    goto :goto_0

    .line 969
    :cond_7
    if-ne p1, v6, :cond_8

    .line 970
    const p1, 0x800003

    goto :goto_0

    .line 971
    :cond_8
    if-ne p1, v7, :cond_1

    .line 972
    const p1, 0x800005

    goto :goto_0

    .line 981
    .restart local v1    # "mode":I
    :cond_9
    iget v5, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    const/16 v6, 0xaa

    if-ne v5, v6, :cond_3

    goto :goto_1

    .line 987
    .restart local v0    # "i":I
    .restart local v3    # "position":I
    .restart local v4    # "size":I
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 995
    :pswitch_1
    if-lez v3, :cond_5

    .line 996
    add-int/lit8 v3, v3, -0x1

    goto :goto_3

    .line 1001
    :pswitch_2
    add-int/lit8 v5, v4, -0x1

    if-ge v3, v5, :cond_5

    .line 1002
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 993
    nop

    :pswitch_data_0
    .packed-switch 0x800003
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public setClickEnable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 346
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->setClickEnable(Z)V

    .line 349
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraSnapView;->setEnabled(Z)V

    .line 350
    return-void
.end method

.method public showOrHideFilter()V
    .locals 10

    .prologue
    const/high16 v9, 0x42480000    # 50.0f

    const v8, 0x3f666666    # 0.9f

    const-wide/16 v6, 0x12c

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 262
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v0, :cond_1

    .line 263
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentFilter;->delayShowSelected(Z)V

    .line 264
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 265
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 266
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 265
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 267
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 268
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 269
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 268
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 270
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {v0, v9}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 271
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 272
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 271
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 273
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {v0, v8}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 274
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {v0, v8}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 275
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 276
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 275
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 277
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    invoke-static {v0, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 278
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 279
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mSineEaseOut:Lmiui/view/animation/SineEaseOutInterpolator;

    .line 278
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 280
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 281
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterListHeight:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 282
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 281
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 283
    new-instance v1, Lcom/android/camera/fragment/FragmentBottomAction$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomAction$2;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;)V

    .line 281
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 300
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    const v1, 0x7f0f00e5

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentBottomAction;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 302
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 340
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    .line 341
    return-void

    .line 305
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentFilter;->delayShowSelected(Z)V

    .line 306
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 307
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 308
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 307
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 309
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 310
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mEdgeHorizonScrollView:Lcom/android/camera/ui/EdgeHorizonScrollView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterListHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 311
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 310
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 312
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 313
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mV9bottomParentLayout:Landroid/widget/RelativeLayout;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 314
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 313
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 315
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {v0, v5}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 316
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {v0, v5}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 317
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mShutterButton:Lcom/android/camera/ui/CameraSnapView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 318
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 317
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 319
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterListHeight:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setTranslationY(Landroid/view/View;F)V

    .line 320
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 321
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFilterLayout:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 322
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 321
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    .line 323
    new-instance v1, Lcom/android/camera/fragment/FragmentBottomAction$3;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentBottomAction$3;-><init>(Lcom/android/camera/fragment/FragmentBottomAction;)V

    .line 321
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto/16 :goto_0
.end method

.method public switchFilter(I)Z
    .locals 4
    .param p1, "gravity"    # I

    .prologue
    const/4 v1, 0x0

    .line 244
    iget-boolean v2, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsShowFilter:Z

    if-eqz v2, :cond_2

    .line 245
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 246
    const/16 v3, 0xa1

    .line 245
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 247
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v1

    :cond_0
    if-nez v1, :cond_1

    .line 248
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/FragmentFilter;->switchFilter(I)V

    .line 250
    :cond_1
    const/4 v1, 0x1

    return v1

    .line 252
    .end local v0    # "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    :cond_2
    return v1
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 3
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    const/4 v2, 0x0

    .line 594
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 596
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 597
    const/16 v1, 0xb3

    invoke-interface {p1, v1, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 598
    const/16 v1, 0xa2

    invoke-interface {p1, v1, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 599
    const/16 v1, 0xb7

    invoke-interface {p1, v1, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 600
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentBottomAction;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 601
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 603
    .local v0, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    if-eqz v1, :cond_0

    .line 604
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mFragmentFilter:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 606
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 607
    return-void
.end method

.method public updateLoading(Z)V
    .locals 5
    .param p1, "hideOrShowThumbProgress"    # Z

    .prologue
    const/4 v4, 0x1

    .line 444
    if-nez p1, :cond_1

    .line 445
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz v0, :cond_0

    .line 446
    return-void

    .line 448
    :cond_0
    iput-boolean v4, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mInLoading:Z

    .line 449
    iget v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCurrentMode:I

    packed-switch v0, :pswitch_data_0

    .line 451
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mCaptureProgressDelay:I

    int-to-long v2, v1

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 466
    :goto_0
    return-void

    .line 456
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mRecordProgressDelay:I

    int-to-long v2, v1

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 462
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mInLoading:Z

    .line 463
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 464
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 449
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public updateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 7
    .param p1, "thumbnail"    # Lcom/android/camera/Thumbnail;
    .param p2, "animation"    # Z

    .prologue
    const/4 v6, 0x0

    const/16 v2, 0x8

    const/4 v5, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/high16 v3, 0x3f800000    # 1.0f

    .line 376
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v6}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 377
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mInLoading:Z

    .line 378
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v1

    if-eq v1, v2, :cond_0

    .line 379
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 382
    :cond_0
    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mIsIntentAction:Z

    if-eqz v1, :cond_1

    .line 383
    return-void

    .line 386
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mVideoRecordingStarted:Z

    if-eqz v1, :cond_2

    .line 387
    return-void

    .line 390
    :cond_2
    if-nez p1, :cond_3

    .line 391
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    const v2, 0x7f0200ef

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 392
    return-void

    .line 397
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentBottomAction;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawableFactory;->create(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;

    move-result-object v0

    .line 398
    .local v0, "roundedBitmapDrawable":Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;
    invoke-virtual {v0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 399
    invoke-virtual {v0, v5}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCircular(Z)V

    .line 400
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 402
    if-nez p2, :cond_4

    .line 403
    return-void

    .line 422
    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    const v2, 0x3e99999a    # 0.3f

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 423
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 424
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {v1, v4}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    .line 425
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBottomAction;->mThumbnailImageLayout:Landroid/view/ViewGroup;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->scaleY(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    .line 426
    const-wide/16 v2, 0x50

    .line 425
    invoke-virtual {v1, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 429
    return-void
.end method
