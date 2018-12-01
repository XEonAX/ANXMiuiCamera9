.class public Lcom/android/camera/fragment/FragmentMainContent;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentMainContent.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$SnapShotIndicator;
.implements Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;


# instance fields
.field private mActiveIndicator:I

.field private mBottomCover:Landroid/view/View;

.field private mCoverParent:Landroid/view/ViewGroup;

.field private mDisplayRectTopMargin:I

.field private mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

.field private mFaceView:Lcom/android/camera/ui/FaceView;

.field private mFocusView:Lcom/android/camera/ui/FocusView;

.field private mIsIntentAction:Z

.field private mLastCameraId:I

.field private mLastFaceLength:I

.field private mMultiSnapNum:Landroid/widget/TextView;

.field private mObjectView:Lcom/android/camera/ui/ObjectView;

.field private mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

.field private mPreviewPage:Lcom/android/camera/ui/V6RelativeLayout;

.field private mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

.field private mSnapStyle:Landroid/text/style/TextAppearanceSpan;

.field private mStringBuilder:Landroid/text/SpannableStringBuilder;

.field private mTopCover:Landroid/view/View;

.field private mZoomInAnimator:Landroid/animation/AnimatorSet;

.field private mZoomOutAnimator:Landroid/animation/AnimatorSet;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentMainContent;)Lcom/android/camera/ui/V6PreviewFrame;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentMainContent;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    return-object v0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastFaceLength:I

    .line 83
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastCameraId:I

    .line 679
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mActiveIndicator:I

    .line 50
    return-void
.end method

.method private adjustViewHeight(Landroid/view/View;)V
    .locals 5
    .param p1, "parentView"    # Landroid/view/View;

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    .line 127
    .local v0, "displayRect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 129
    .local v1, "parentLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    invoke-virtual {v3}, Lcom/android/camera/ui/V6PreviewPanel;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 131
    .local v2, "previewPanelLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-eq v3, v4, :cond_0

    .line 132
    iget v3, v0, Landroid/graphics/Rect;->top:I

    iput v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mDisplayRectTopMargin:I

    .line 133
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 134
    iget v3, v0, Landroid/graphics/Rect;->top:I

    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 135
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    invoke-virtual {v3, v2}, Lcom/android/camera/ui/V6PreviewPanel;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    iget v4, p0, Lcom/android/camera/fragment/FragmentMainContent;->mDisplayRectTopMargin:I

    add-int/2addr v3, v4

    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 138
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/fragment/FragmentMainContent;->setDisplaySize(II)V

    .line 141
    :cond_0
    return-void
.end method

.method private initSnapNumAnimator()V
    .locals 2

    .prologue
    .line 281
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x7f060000

    invoke-static {v0, v1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v0

    check-cast v0, Landroid/animation/AnimatorSet;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    .line 282
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 283
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 284
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060002

    invoke-static {v0, v1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v0

    check-cast v0, Landroid/animation/AnimatorSet;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    .line 285
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setTarget(Ljava/lang/Object;)V

    .line 286
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 287
    return-void
.end method

.method private showIndicator(Lcom/android/camera/ui/FocusIndicator;I)V
    .locals 0
    .param p1, "indicator"    # Lcom/android/camera/ui/FocusIndicator;
    .param p2, "showType"    # I

    .prologue
    .line 710
    packed-switch p2, :pswitch_data_0

    .line 723
    :goto_0
    return-void

    .line 712
    :pswitch_0
    invoke-interface {p1}, Lcom/android/camera/ui/FocusIndicator;->showFail()V

    goto :goto_0

    .line 715
    :pswitch_1
    invoke-interface {p1}, Lcom/android/camera/ui/FocusIndicator;->showStart()V

    goto :goto_0

    .line 718
    :pswitch_2
    invoke-interface {p1}, Lcom/android/camera/ui/FocusIndicator;->showSuccess()V

    goto :goto_0

    .line 710
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public clearFocusView(I)V
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 499
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FocusView;->clear(I)V

    .line 500
    return-void
.end method

.method public clearIndicator(I)V
    .locals 2
    .param p1, "indicatorType"    # I

    .prologue
    .line 637
    packed-switch p1, :pswitch_data_0

    .line 650
    :goto_0
    return-void

    .line 639
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->clear()V

    goto :goto_0

    .line 645
    :pswitch_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "not allowed call in this method"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 647
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ObjectView;->clear()V

    goto :goto_0

    .line 637
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public destroyEffectCropView()V
    .locals 1

    .prologue
    .line 378
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->onDestroy()V

    .line 379
    return-void
.end method

.method public getActiveIndicator()I
    .locals 1

    .prologue
    .line 688
    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mActiveIndicator:I

    return v0
.end method

.method public getFaces()[Lcom/android/camera2/CameraHardwareFace;
    .locals 1

    .prologue
    .line 462
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->getFaces()[Lcom/android/camera2/CameraHardwareFace;

    move-result-object v0

    return-object v0
.end method

.method public getFocusRect(I)Landroid/graphics/RectF;
    .locals 3
    .param p1, "indicatorType"    # I

    .prologue
    .line 727
    packed-switch p1, :pswitch_data_0

    .line 733
    :pswitch_0
    const-string/jumbo v0, "FragmentMainContent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getFragmentTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ": unexpected type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    return-object v0

    .line 729
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->getFocusRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 731
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ObjectView;->getFocusRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 727
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 150
    const/16 v0, 0xf3

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 145
    const v0, 0x7f04000e

    return v0
.end method

.method public getPreviewWidth()I
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6PreviewFrame;->getWidth()I

    move-result v0

    return v0
.end method

.method public hideDelayNumber()V
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6PreviewPanel;->hideDelayNumber()V

    .line 277
    return-void
.end method

.method public hideReviewViews()V
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewImage:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/Util;->fadeOut(Landroid/view/View;)V

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewPlay:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/Util;->fadeOut(Landroid/view/View;)V

    .line 262
    return-void
.end method

.method public initEffectCropView()V
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->onCreate()V

    .line 374
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 93
    const v0, 0x7f0a0035

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCoverParent:Landroid/view/ViewGroup;

    .line 94
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCoverParent:Landroid/view/ViewGroup;

    const v1, 0x7f0a0038

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    .line 96
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCoverParent:Landroid/view/ViewGroup;

    const v1, 0x7f0a0036

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    .line 97
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCoverParent:Landroid/view/ViewGroup;

    const v1, 0x7f0a0037

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    .line 99
    const v0, 0x7f0a0034

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPage:Lcom/android/camera/ui/V6RelativeLayout;

    .line 100
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPage:Lcom/android/camera/ui/V6RelativeLayout;

    const v1, 0x7f0a0087

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6PreviewPanel;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    .line 101
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    const v1, 0x7f0a008b

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6PreviewFrame;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    .line 103
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    const v1, 0x7f0a0092

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6EffectCropView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    .line 104
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    const v1, 0x7f0a008d

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/FaceView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    .line 105
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    const v1, 0x7f0a008f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/FocusView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    .line 106
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    const v1, 0x7f0a008e

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ObjectView;

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    .line 109
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentMainContent;->adjustViewHeight(Landroid/view/View;)V

    .line 111
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCoverParent:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->getBottomHeight(Landroid/content/res/Resources;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 112
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v1, v1

    const/high16 v2, 0x3f400000    # 0.75f

    div-float/2addr v1, v2

    float-to-int v1, v1

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 113
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCoverParent:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 114
    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    .line 113
    sub-int/2addr v1, v2

    .line 114
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 113
    sub-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 117
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mIsIntentAction:Z

    .line 119
    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCurrentMode:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/fragment/FragmentMainContent;->provideAnimateElement(ILjava/util/List;Z)V

    .line 120
    return-void
.end method

.method public initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/android/camera/ui/FocusView$ExposureViewListener;

    .prologue
    .line 481
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FocusView;->initialize(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 482
    return-void
.end method

.method public initializeObjectTrack(Landroid/graphics/RectF;Z)Z
    .locals 2
    .param p1, "rectF"    # Landroid/graphics/RectF;
    .param p2, "up"    # Z

    .prologue
    .line 509
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FocusView;->clear()V

    .line 510
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ObjectView;->clear()V

    .line 511
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ObjectView;->setVisibility(I)V

    .line 512
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/ObjectView;->initializeTrackView(Landroid/graphics/RectF;Z)Z

    move-result v0

    return v0
.end method

.method public isEffectViewMoved()Z
    .locals 1

    .prologue
    .line 412
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->isMoved()Z

    move-result v0

    return v0
.end method

.method public isEffectViewVisible()Z
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->isVisible()Z

    move-result v0

    return v0
.end method

.method public isEvAdjusted(Z)Z
    .locals 1
    .param p1, "checkTime"    # Z

    .prologue
    .line 467
    if-eqz p1, :cond_0

    .line 468
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FocusView;->isEvAdjustedTime()Z

    move-result v0

    return v0

    .line 470
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FocusView;->isEvAdjusted()Z

    move-result v0

    return v0
.end method

.method public isFaceExists(I)Z
    .locals 1
    .param p1, "indicatorType"    # I

    .prologue
    .line 558
    packed-switch p1, :pswitch_data_0

    .line 564
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 560
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->faceExists()Z

    move-result v0

    return v0

    .line 562
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ObjectView;->faceExists()Z

    move-result v0

    return v0

    .line 558
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public isIndicatorVisible(I)Z
    .locals 3
    .param p1, "indicatorType"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 582
    packed-switch p1, :pswitch_data_0

    .line 590
    return v1

    .line 584
    :pswitch_0
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v2}, Lcom/android/camera/ui/FaceView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    .line 586
    :pswitch_1
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v2}, Lcom/android/camera/ui/FocusView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    :goto_1
    return v0

    :cond_1
    move v0, v1

    goto :goto_1

    .line 588
    :pswitch_2
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v2}, Lcom/android/camera/ui/ObjectView;->getVisibility()I

    move-result v2

    if-nez v2, :cond_2

    :goto_2
    return v0

    :cond_2
    move v0, v1

    goto :goto_2

    .line 582
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public isNeedExposure(I)Z
    .locals 1
    .param p1, "indicatorType"    # I

    .prologue
    .line 596
    packed-switch p1, :pswitch_data_0

    .line 602
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 598
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->isNeedExposure()Z

    move-result v0

    return v0

    .line 600
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ObjectView;->isNeedExposure()Z

    move-result v0

    return v0

    .line 596
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 1
    .param p1, "arrivedType"    # I

    .prologue
    .line 787
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 791
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6PreviewFrame;->updateReferenceLineAccordSquare()V

    .line 792
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6PreviewFrame;->updatePreviewGrid()V

    .line 795
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FocusView;->reInit()V

    .line 797
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->updateVisible()V

    .line 798
    return-void
.end method

.method public notifyDataChanged(II)V
    .locals 6
    .param p1, "dataChangeType"    # I
    .param p2, "currentMode"    # I

    .prologue
    .line 748
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    .line 750
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isIntentAction()Z

    move-result v0

    .line 751
    .local v0, "currentIntentAction":Z
    iget-boolean v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mIsIntentAction:Z

    if-eq v0, v1, :cond_0

    .line 752
    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mIsIntentAction:Z

    .line 753
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->hideReviewViews()V

    .line 755
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    iget v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastCameraId:I

    if-eq v1, v2, :cond_1

    .line 756
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastCameraId:I

    .line 757
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 758
    iget v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastCameraId:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 759
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    const v2, 0x7f0f00e3

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/FragmentMainContent;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/V6PreviewFrame;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 763
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    new-instance v2, Lcom/android/camera/fragment/FragmentMainContent$1;

    invoke-direct {v2, p0}, Lcom/android/camera/fragment/FragmentMainContent$1;-><init>(Lcom/android/camera/fragment/FragmentMainContent;)V

    .line 770
    const-wide/16 v4, 0x5dc

    .line 763
    invoke-virtual {v1, v2, v4, v5}, Lcom/android/camera/ui/V6PreviewFrame;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 774
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 783
    :goto_1
    return-void

    .line 761
    :cond_2
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    const v2, 0x7f0f00e2

    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/FragmentMainContent;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/V6PreviewFrame;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 777
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getView()Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentMainContent;->adjustViewHeight(Landroid/view/View;)V

    goto :goto_1

    .line 780
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getView()Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentMainContent;->adjustViewHeight(Landroid/view/View;)V

    goto :goto_1

    .line 774
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onBackEvent(I)Z
    .locals 1
    .param p1, "callingFrom"    # I

    .prologue
    .line 802
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 88
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 89
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 741
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onDestroy()V

    .line 742
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->destroyEffectCropView()V

    .line 743
    return-void
.end method

.method public onViewTouchEvent(ILandroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "viewId"    # I
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 361
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FocusView;->getId()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 362
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p2}, Lcom/android/camera/ui/FocusView;->onViewTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->getId()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 364
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0, p2}, Lcom/android/camera/ui/V6EffectCropView;->onViewTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 366
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public performHapticFeedback(I)V
    .locals 1
    .param p1, "feedbackConstant"    # I

    .prologue
    .line 346
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6PreviewFrame;->performHapticFeedback(I)Z

    .line 347
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 8
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
    const/16 v7, 0xc8

    const/16 v6, 0x50

    const/16 v5, 0x30

    .line 156
    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mCurrentMode:I

    .line 157
    .local v0, "lastMode":I
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 159
    const/4 v2, 0x1

    .line 160
    .local v2, "newState":I
    packed-switch p1, :pswitch_data_0

    .line 165
    const/4 v2, -0x1

    .line 168
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/FragmentMainContent;->setSnapNumVisible(Z)V

    .line 169
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    invoke-virtual {v3}, Lcom/android/camera/ui/V6PreviewFrame;->hidePreviewGrid()V

    .line 170
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v3}, Lcom/android/camera/ui/FaceView;->clear()V

    .line 171
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v3}, Lcom/android/camera/ui/FaceView;->clearFaceFlags()V

    .line 172
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v3}, Lcom/android/camera/ui/FocusView;->clear()V

    .line 174
    const/4 v1, 0x1

    .line 175
    .local v1, "needReleaseListener":Z
    sparse-switch v0, :sswitch_data_0

    .line 188
    :goto_1
    if-eqz v1, :cond_0

    .line 189
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v3}, Lcom/android/camera/ui/FocusView;->releaseListener()V

    .line 192
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->destroyEffectCropView()V

    .line 194
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v2, :cond_1

    .line 195
    return-void

    .line 162
    .end local v1    # "needReleaseListener":Z
    :pswitch_0
    const/4 v2, 0x1

    .line 163
    goto :goto_0

    .line 179
    .restart local v1    # "needReleaseListener":Z
    :sswitch_0
    sparse-switch p1, :sswitch_data_1

    goto :goto_1

    .line 183
    :sswitch_1
    const/4 v1, 0x0

    .line 184
    goto :goto_1

    .line 198
    :cond_1
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 200
    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 201
    if-nez p2, :cond_2

    .line 202
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-static {v3, v5}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 203
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    invoke-static {v3, v6}, Lcom/android/camera/animation/type/SlideInOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 221
    :goto_2
    return-void

    .line 206
    :cond_2
    new-instance v3, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-direct {v3, v4, v5}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v3}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v3

    .line 205
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    new-instance v3, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    invoke-direct {v3, v4, v6}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v3}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v3

    .line 207
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 211
    :cond_3
    if-nez p2, :cond_4

    .line 212
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-static {v3, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    .line 213
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    invoke-static {v3, v6}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_2

    .line 216
    :cond_4
    new-instance v3, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentMainContent;->mTopCover:Landroid/view/View;

    invoke-direct {v3, v4, v5}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-virtual {v3, v7}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v3

    invoke-static {v3}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v3

    .line 215
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v3, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentMainContent;->mBottomCover:Landroid/view/View;

    invoke-direct {v3, v4, v6}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-virtual {v3, v7}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v3

    invoke-static {v3}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v3

    .line 217
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 160
    nop

    :pswitch_data_0
    .packed-switch 0xa5
        :pswitch_0
    .end packed-switch

    .line 175
    :sswitch_data_0
    .sparse-switch
        0xa2 -> :sswitch_0
        0xa8 -> :sswitch_0
        0xa9 -> :sswitch_0
    .end sparse-switch

    .line 179
    :sswitch_data_1
    .sparse-switch
        0xa2 -> :sswitch_1
        0xa8 -> :sswitch_1
        0xa9 -> :sswitch_1
    .end sparse-switch
.end method

.method public provideRotateItem(Ljava/util/List;I)V
    .locals 3
    .param p2, "newDegree"    # I
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
    .local p1, "pendingRotateItems":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v2, 0x0

    .line 807
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->provideRotateItem(Ljava/util/List;I)V

    .line 810
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    rsub-int v1, p2, 0x168

    rem-int/lit16 v1, v1, 0x168

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/FaceView;->setOrientation(IZ)V

    .line 812
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p2, v2}, Lcom/android/camera/ui/FocusView;->setOrientation(IZ)V

    .line 813
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 815
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 818
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 820
    return-void
.end method

.method public reShowFaceRect()V
    .locals 1

    .prologue
    .line 504
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->reShowFaceRect()V

    .line 505
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 225
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 226
    const/16 v0, 0xa6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 228
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentMainContent;->registerBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 230
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_0

    .line 231
    const/16 v0, 0xb8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 233
    :cond_0
    return-void
.end method

.method public removeTiltShiftMask()V
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->removeTiltShiftMask()V

    .line 384
    return-void
.end method

.method public setActiveIndicator(I)V
    .locals 0
    .param p1, "indicatorType"    # I

    .prologue
    .line 683
    iput p1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mActiveIndicator:I

    .line 684
    return-void
.end method

.method public setCameraDisplayOrientation(I)V
    .locals 1
    .param p1, "cameraDisplayOrientation"    # I

    .prologue
    .line 424
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FaceView;->setCameraDisplayOrientation(I)V

    .line 425
    return-void
.end method

.method public setDisplaySize(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 538
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/ObjectView;->setDisplaySize(II)V

    .line 539
    return-void
.end method

.method public setEffectViewVisible(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 388
    if-eqz p1, :cond_0

    .line 389
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->show()V

    .line 393
    :goto_0
    return-void

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->hide()V

    goto :goto_0
.end method

.method public setEvAdjustable(Z)V
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 476
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FocusView;->setEvAdjustable(Z)V

    .line 477
    return-void
.end method

.method public setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z
    .locals 6
    .param p1, "indicatorType"    # I
    .param p2, "faces"    # [Lcom/android/camera2/CameraHardwareFace;
    .param p3, "cropRegion"    # Landroid/graphics/Rect;
    .param p4, "zoomValue"    # F

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 609
    packed-switch p1, :pswitch_data_0

    .line 630
    :pswitch_0
    return v5

    .line 611
    :pswitch_1
    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastFaceLength:I

    array-length v1, p2

    if-eq v0, v1, :cond_0

    .line 612
    array-length v0, p2

    iput v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastFaceLength:I

    .line 613
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 614
    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastFaceLength:I

    if-lez v0, :cond_1

    .line 615
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 616
    iget v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastFaceLength:I

    .line 615
    new-array v3, v3, [Ljava/lang/Object;

    .line 616
    iget v4, p0, Lcom/android/camera/fragment/FragmentMainContent;->mLastFaceLength:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    const/high16 v4, 0x7f100000

    .line 615
    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/FaceView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 617
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/FaceView;->sendAccessibilityEvent(I)V

    .line 623
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p2, p3, p4}, Lcom/android/camera/ui/FaceView;->setFaces([Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result v0

    return v0

    .line 619
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/FaceView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 625
    :pswitch_2
    if-eqz p2, :cond_2

    array-length v0, p2

    if-lez v0, :cond_2

    .line 626
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    aget-object v1, p2, v5

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ObjectView;->setObject(Lcom/android/camera2/CameraHardwareFace;)V

    .line 628
    :cond_2
    return v3

    .line 609
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public setFocusViewPosition(III)V
    .locals 1
    .param p1, "type"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 492
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/ui/FocusView;->setPosition(III)V

    .line 494
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->forceHideRect()V

    .line 495
    return-void
.end method

.method public setFocusViewType(Z)V
    .locals 1
    .param p1, "isTouchFocus"    # Z

    .prologue
    .line 486
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FocusView;->setFocusType(Z)V

    .line 487
    return-void
.end method

.method public setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/android/camera/ui/ObjectView$ObjectViewListener;

    .prologue
    .line 548
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/ObjectView;->setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V

    .line 549
    return-void
.end method

.method public setPreviewAspectRatio(F)V
    .locals 1
    .param p1, "aspectRatio"    # F

    .prologue
    .line 341
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6PreviewFrame;->setAspectRatio(F)V

    .line 342
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 543
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/ObjectView;->setPreviewSize(II)V

    .line 544
    return-void
.end method

.method public setShowGenderAndAge(Z)V
    .locals 1
    .param p1, "show"    # Z

    .prologue
    .line 429
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FaceView;->setShowGenderAndAge(Z)V

    .line 430
    return-void
.end method

.method public setShowMagicMirror(Z)V
    .locals 1
    .param p1, "show"    # Z

    .prologue
    .line 434
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FaceView;->setShowMagicMirror(Z)V

    .line 435
    return-void
.end method

.method public setSkipDrawFace(Z)V
    .locals 1
    .param p1, "skipDraw"    # Z

    .prologue
    .line 439
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/FaceView;->setSkipDraw(Z)V

    .line 440
    return-void
.end method

.method public setSnapNumValue(I)V
    .locals 5
    .param p1, "number"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 311
    invoke-virtual {p0, v3}, Lcom/android/camera/fragment/FragmentMainContent;->setSnapNumVisible(Z)V

    .line 312
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mSnapStyle:Landroid/text/style/TextAppearanceSpan;

    if-nez v0, :cond_0

    .line 313
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentMainContent;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f110012

    invoke-direct {v0, v1, v2}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mSnapStyle:Landroid/text/style/TextAppearanceSpan;

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    if-nez v0, :cond_1

    .line 316
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 320
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    const-string/jumbo v1, "%02d"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentMainContent;->mSnapStyle:Landroid/text/style/TextAppearanceSpan;

    const/16 v3, 0x21

    invoke-virtual {v0, v1, v2, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 321
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    return-void

    .line 318
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    goto :goto_0
.end method

.method public setSnapNumVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    const/4 v1, 0x0

    .line 291
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    if-ne p1, v0, :cond_1

    .line 292
    return-void

    :cond_0
    move v0, v1

    .line 291
    goto :goto_0

    .line 295
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_2

    .line 296
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentMainContent;->initSnapNumAnimator()V

    .line 298
    :cond_2
    if-eqz p1, :cond_3

    .line 299
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 300
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentMainContent;->setSnapNumValue(I)V

    .line 301
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomInAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 306
    :goto_1
    return-void

    .line 303
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mZoomOutAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 304
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mMultiSnapNum:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setStartDelayTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    goto :goto_1
.end method

.method public showDelayNumber(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 266
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mDegree:I

    if-lez v0, :cond_0

    .line 268
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

    iget v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mDegree:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setRotation(Landroid/view/View;F)V

    .line 271
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6PreviewPanel;->showDelayNumber(Ljava/lang/String;)V

    .line 272
    return-void
.end method

.method public showIndicator(II)V
    .locals 1
    .param p1, "indicatorType"    # I
    .param p2, "showType"    # I

    .prologue
    .line 694
    packed-switch p1, :pswitch_data_0

    .line 707
    :goto_0
    return-void

    .line 696
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/FragmentMainContent;->showIndicator(Lcom/android/camera/ui/FocusIndicator;I)V

    goto :goto_0

    .line 699
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFocusView:Lcom/android/camera/ui/FocusView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/FragmentMainContent;->showIndicator(Lcom/android/camera/ui/FocusIndicator;I)V

    goto :goto_0

    .line 702
    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mObjectView:Lcom/android/camera/ui/ObjectView;

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/FragmentMainContent;->showIndicator(Lcom/android/camera/ui/FocusIndicator;I)V

    goto :goto_0

    .line 694
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public showReviewViews(Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 249
    if-eqz p1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 251
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 253
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mPreviewPanel:Lcom/android/camera/ui/V6PreviewPanel;

    iget-object v0, v0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewPlay:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/android/camera/Util;->fadeIn(Landroid/view/View;)V

    .line 254
    return-void
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 237
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 238
    const/16 v0, 0xa6

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 240
    invoke-virtual {p0, p1, p0}, Lcom/android/camera/fragment/FragmentMainContent;->unRegisterBackStack(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;Lcom/android/camera/protocol/ModeProtocol$HandleBackTrace;)V

    .line 242
    invoke-static {}, Lcom/android/camera/Device;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_0

    .line 243
    const/16 v0, 0xb8

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 245
    :cond_0
    return-void
.end method

.method public updateEffectViewVisible()V
    .locals 1

    .prologue
    .line 397
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mEffectCropView:Lcom/android/camera/ui/V6EffectCropView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6EffectCropView;->updateVisible()V

    .line 398
    return-void
.end method

.method public updateFaceView(ZZZZI)V
    .locals 2
    .param p1, "visible"    # Z
    .param p2, "clearFaces"    # Z
    .param p3, "mirror"    # Z
    .param p4, "resume"    # Z
    .param p5, "cameraDisplayOrientation"    # I

    .prologue
    const/4 v0, 0x0

    .line 445
    if-eqz p2, :cond_0

    .line 446
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v1}, Lcom/android/camera/ui/FaceView;->clear()V

    .line 448
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    if-eqz p1, :cond_3

    :goto_0
    invoke-virtual {v1, v0}, Lcom/android/camera/ui/FaceView;->setVisibility(I)V

    .line 450
    if-lez p5, :cond_1

    .line 451
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p5}, Lcom/android/camera/ui/FaceView;->setCameraDisplayOrientation(I)V

    .line 454
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0, p3}, Lcom/android/camera/ui/FaceView;->setMirror(Z)V

    .line 455
    if-eqz p4, :cond_2

    .line 456
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentMainContent;->mFaceView:Lcom/android/camera/ui/FaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/FaceView;->resume()V

    .line 458
    :cond_2
    return-void

    .line 448
    :cond_3
    const/16 v0, 0x8

    goto :goto_0
.end method
