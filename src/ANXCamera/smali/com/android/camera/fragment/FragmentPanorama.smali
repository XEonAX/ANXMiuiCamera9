.class public Lcom/android/camera/fragment/FragmentPanorama;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentPanorama.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;
.implements Lcom/android/camera/CameraScreenNail$RequestRenderListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;
    }
.end annotation


# instance fields
.field private mArrowMargin:I

.field private mCubicEaseInOutInterpolator:Landroid/view/animation/Interpolator;

.field private mHandler:Landroid/os/Handler;

.field private mIndicator:Landroid/widget/ImageView;

.field private mMoveDirection:I

.field private mMoveReferenceLine:Landroid/view/View;

.field private mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

.field private mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

.field private mPanoramaPreview:Landroid/widget/ImageView;

.field private mPanoramaViewRoot:Landroid/view/View;

.field private mStillPreview:Lcom/android/camera/ui/GLTextureView;

.field private mStillPreviewHintArea:Landroid/view/View;

.field private mStillPreviewTextureHeight:I

.field private mStillPreviewTextureOffsetX:I

.field private mStillPreviewTextureOffsetY:I

.field private mStillPreviewTextureWidth:I

.field private mUseHint:Landroid/widget/TextView;

.field private mWaitingFirstFrame:Z


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentPanorama;)Landroid/os/Handler;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/FragmentPanorama;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/FragmentPanorama;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/FragmentPanorama;)Landroid/view/View;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveReferenceLine:Landroid/view/View;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/FragmentPanorama;)Lcom/android/camera/ui/GLTextureView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/camera/fragment/FragmentPanorama;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureHeight:I

    return v0
.end method

.method static synthetic -get6(Lcom/android/camera/fragment/FragmentPanorama;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureOffsetX:I

    return v0
.end method

.method static synthetic -get7(Lcom/android/camera/fragment/FragmentPanorama;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureOffsetY:I

    return v0
.end method

.method static synthetic -get8(Lcom/android/camera/fragment/FragmentPanorama;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureWidth:I

    return v0
.end method

.method static synthetic -get9(Lcom/android/camera/fragment/FragmentPanorama;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mWaitingFirstFrame:Z

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/FragmentPanorama;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentPanorama;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mWaitingFirstFrame:Z

    return p1
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 55
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mHandler:Landroid/os/Handler;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mWaitingFirstFrame:Z

    .line 57
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    .line 75
    new-instance v0, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mCubicEaseInOutInterpolator:Landroid/view/animation/Interpolator;

    .line 78
    new-instance v0, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    invoke-direct {v0}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;-><init>()V

    .line 77
    iput-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    .line 48
    return-void
.end method

.method private setViewMargin(Landroid/view/View;I)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "topMargin"    # I

    .prologue
    .line 156
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 157
    .local v0, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 158
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 124
    const/16 v0, 0xff0

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 119
    const v0, 0x7f040023

    return v0
.end method

.method public initPreviewLayout(IIII)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "previewWidth"    # I
    .param p4, "previewHeight"    # I

    .prologue
    .line 162
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPanoramaMoveDirection()I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    .line 164
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 165
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 166
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 168
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureWidth:I

    .line 169
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    mul-int/2addr v1, p3

    div-int/2addr v1, p4

    iput v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureHeight:I

    .line 170
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureOffsetX:I

    .line 171
    iget v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureHeight:I

    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    sub-int/2addr v1, v2

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureOffsetY:I

    .line 173
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->requestLayout()V

    .line 174
    return-void
.end method

.method protected initView(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 82
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    .line 83
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0074

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    .line 84
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0076

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mUseHint:Landroid/widget/TextView;

    .line 85
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 86
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentPanorama;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09000e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mArrowMargin:I

    .line 88
    sget-boolean v2, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v2, :cond_0

    .line 89
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    sget v3, Lcom/android/camera/Util;->sStatusBarHeight:I

    invoke-direct {p0, v2, v3}, Lcom/android/camera/fragment/FragmentPanorama;->setViewMargin(Landroid/view/View;I)V

    .line 92
    :cond_0
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0071

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaPreview:Landroid/widget/ImageView;

    .line 93
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0073

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/GLTextureView;

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    .line 95
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0077

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/PanoMovingIndicatorView;

    .line 94
    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    .line 97
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0070

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveReferenceLine:Landroid/view/View;

    .line 98
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a0072

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    .line 100
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    const v3, 0x7f0a006f

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 101
    .local v0, "hintFrame":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v2}, Lcom/android/camera/ui/GLTextureView;->getRenderer()Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v2

    if-nez v2, :cond_1

    .line 104
    new-instance v1, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;

    invoke-direct {v1, p0, v4}, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;-><init>(Lcom/android/camera/fragment/FragmentPanorama;Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;)V

    .line 105
    .local v1, "stillPreviewRender":Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/GLTextureView;->setEGLContextClientVersion(I)V

    .line 106
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    new-instance v3, Lcom/android/camera/fragment/FragmentPanorama$1;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/FragmentPanorama$1;-><init>(Lcom/android/camera/fragment/FragmentPanorama;)V

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/GLTextureView;->setEGLShareContextGetter(Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;)V

    .line 111
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v2, v1}, Lcom/android/camera/ui/GLTextureView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 112
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/GLTextureView;->setRenderMode(I)V

    .line 113
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v2}, Lcom/android/camera/ui/GLTextureView;->onPause()V

    .line 115
    .end local v1    # "stillPreviewRender":Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;
    :cond_1
    return-void
.end method

.method public isShown()Z
    .locals 1

    .prologue
    .line 318
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    return v0
.end method

.method public moveToDirection(I)V
    .locals 13
    .param p1, "direction"    # I

    .prologue
    .line 177
    iput p1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    .line 179
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    invoke-virtual {v8}, Landroid/widget/ImageView;->getTranslationX()F

    move-result v7

    .line 180
    .local v7, "translationX":F
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    invoke-virtual {v8}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->getTransformationRatio()F

    move-result v6

    .line 181
    .local v6, "transformationRatio":F
    iget v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    const/4 v9, 0x4

    if-ne v8, v9, :cond_1

    .line 182
    iget v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureWidth:I

    iget v9, p0, Lcom/android/camera/fragment/FragmentPanorama;->mArrowMargin:I

    add-int/2addr v8, v9

    int-to-float v7, v8

    .line 183
    const/high16 v6, 0x40000000    # 2.0f

    .line 190
    :cond_0
    :goto_0
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    const-string/jumbo v9, "translationX"

    const/4 v10, 0x2

    new-array v10, v10, [F

    .line 191
    iget-object v11, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    invoke-virtual {v11}, Landroid/widget/ImageView;->getTranslationX()F

    move-result v11

    const/4 v12, 0x0

    aput v11, v10, v12

    const/4 v11, 0x1

    aput v7, v10, v11

    .line 190
    invoke-static {v8, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 192
    .local v1, "arrowMoveAnimator":Landroid/animation/ObjectAnimator;
    const-wide/16 v8, 0x1f4

    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 194
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    const-string/jumbo v9, "transformationRatio"

    const/4 v10, 0x2

    new-array v10, v10, [F

    .line 195
    iget-object v11, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    invoke-virtual {v11}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->getTransformationRatio()F

    move-result v11

    const/4 v12, 0x0

    aput v11, v10, v12

    const/4 v11, 0x1

    aput v6, v10, v11

    .line 194
    invoke-static {v8, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 196
    .local v2, "arrowTransformAnimator":Landroid/animation/ObjectAnimator;
    const-wide/16 v8, 0x1f4

    invoke-virtual {v2, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 198
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    const-string/jumbo v9, "alpha"

    const/4 v10, 0x2

    new-array v10, v10, [F

    .line 199
    iget-object v11, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v11}, Lcom/android/camera/ui/GLTextureView;->getAlpha()F

    move-result v11

    const/4 v12, 0x0

    aput v11, v10, v12

    const/4 v11, 0x0

    const/4 v12, 0x1

    aput v11, v10, v12

    .line 198
    invoke-static {v8, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 200
    .local v4, "previewFadeOutAnimator":Landroid/animation/ObjectAnimator;
    const-wide/16 v8, 0xfa

    invoke-virtual {v4, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 201
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    const-string/jumbo v9, "alpha"

    const/4 v10, 0x2

    new-array v10, v10, [F

    const/4 v11, 0x0

    const/4 v12, 0x0

    aput v11, v10, v12

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v12, 0x1

    aput v11, v10, v12

    invoke-static {v8, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 202
    .local v3, "previewFadeInAnimator":Landroid/animation/ObjectAnimator;
    const-wide/16 v8, 0xfa

    invoke-virtual {v3, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 203
    new-instance v8, Lcom/android/camera/fragment/FragmentPanorama$2;

    invoke-direct {v8, p0}, Lcom/android/camera/fragment/FragmentPanorama$2;-><init>(Lcom/android/camera/fragment/FragmentPanorama;)V

    invoke-virtual {v3, v8}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 218
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 219
    .local v5, "previewFadeOutInAnimator":Landroid/animation/AnimatorSet;
    const/4 v8, 0x2

    new-array v8, v8, [Landroid/animation/Animator;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    const/4 v9, 0x1

    aput-object v3, v8, v9

    invoke-virtual {v5, v8}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 221
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 222
    .local v0, "animator":Landroid/animation/AnimatorSet;
    const/4 v8, 0x3

    new-array v8, v8, [Landroid/animation/Animator;

    const/4 v9, 0x0

    aput-object v1, v8, v9

    const/4 v9, 0x1

    aput-object v2, v8, v9

    const/4 v9, 0x2

    aput-object v5, v8, v9

    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 223
    iget-object v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mCubicEaseInOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 224
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 225
    return-void

    .line 184
    .end local v0    # "animator":Landroid/animation/AnimatorSet;
    .end local v1    # "arrowMoveAnimator":Landroid/animation/ObjectAnimator;
    .end local v2    # "arrowTransformAnimator":Landroid/animation/ObjectAnimator;
    .end local v3    # "previewFadeInAnimator":Landroid/animation/ObjectAnimator;
    .end local v4    # "previewFadeOutAnimator":Landroid/animation/ObjectAnimator;
    .end local v5    # "previewFadeOutInAnimator":Landroid/animation/AnimatorSet;
    :cond_1
    iget v8, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    const/4 v9, 0x5

    if-ne v8, v9, :cond_0

    .line 185
    sget v8, Lcom/android/camera/Util;->sWindowWidth:I

    iget v9, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureWidth:I

    sub-int/2addr v8, v9

    .line 186
    iget v9, p0, Lcom/android/camera/fragment/FragmentPanorama;->mArrowMargin:I

    .line 185
    sub-int/2addr v8, v9

    .line 186
    iget-object v9, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    invoke-virtual {v9}, Landroid/widget/ImageView;->getWidth()I

    move-result v9

    .line 185
    sub-int/2addr v8, v9

    int-to-float v7, v8

    .line 187
    const/4 v6, 0x0

    goto/16 :goto_0
.end method

.method public notifyAfterFrameAvailable(I)V
    .locals 2
    .param p1, "arrivedType"    # I

    .prologue
    .line 410
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->notifyAfterFrameAvailable(I)V

    .line 412
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mCurrentMode:I

    const/16 v1, 0xa6

    if-ne v0, v1, :cond_0

    .line 413
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 414
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentPanorama;->showSmallPreview(Z)V

    .line 417
    :cond_0
    return-void
.end method

.method public onCaptureOrientationDecided(III)V
    .locals 3
    .param p1, "direction"    # I
    .param p2, "offsetX"    # I
    .param p3, "offsetY"    # I

    .prologue
    .line 307
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 308
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->onPause()V

    .line 309
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mUseHint:Landroid/widget/TextView;

    const v2, 0x7f0f00bd

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 310
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setVisibility(I)V

    .line 312
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveReferenceLine:Landroid/view/View;

    invoke-static {v1, v2}, Lcom/android/camera/Util;->getRelativeLocation(Landroid/view/View;Landroid/view/View;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v0, v1, v2

    .line 313
    .local v0, "y":I
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveReferenceLine:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setDisplayCenterY(I)V

    .line 314
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setMovingAttribute(III)V

    .line 315
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x5

    const/4 v1, 0x4

    .line 141
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentPanorama;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    .line 142
    return-void

    .line 144
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    if-ne v0, v2, :cond_2

    .line 145
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->trackDirectionChanged(I)V

    .line 146
    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/FragmentPanorama;->moveToDirection(I)V

    .line 151
    :cond_1
    :goto_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setPanoramaMoveDirection(I)V

    .line 152
    return-void

    .line 147
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    if-ne v0, v1, :cond_1

    .line 148
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackDirectionChanged(I)V

    .line 149
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/FragmentPanorama;->moveToDirection(I)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 323
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onPause()V

    .line 324
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->onPause()V

    .line 325
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaPreview:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 326
    return-void
.end method

.method public onPreviewMoving()V
    .locals 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->isTooFast()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 297
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mUseHint:Landroid/widget/TextView;

    const v1, 0x7f0f0166

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 304
    :cond_0
    :goto_0
    return-void

    .line 298
    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0}, Lcom/android/camera/ui/PanoMovingIndicatorView;->isFar()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 299
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mUseHint:Landroid/widget/TextView;

    const v1, 0x7f0f0165

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 301
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mUseHint:Landroid/widget/TextView;

    const v1, 0x7f0f00bd

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 330
    invoke-super {p0}, Lcom/android/camera/fragment/BaseFragment;->onResume()V

    .line 331
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 332
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveReferenceLine:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 333
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 334
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 2
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
    .line 390
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 392
    packed-switch p1, :pswitch_data_0

    .line 396
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 397
    if-nez p2, :cond_1

    .line 398
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-static {v0}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->directSetResult(Landroid/view/View;)V

    .line 406
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 401
    :cond_1
    new-instance v0, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v1, 0x96

    invoke-virtual {v0, v1}, Lcom/android/camera/animation/type/AlphaOutOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v0

    .line 400
    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 392
    nop

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_0
    .end packed-switch
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 130
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 131
    const/16 v0, 0xb0

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 132
    return-void
.end method

.method public requestRender()V
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->requestRender()V

    .line 231
    :cond_0
    return-void
.end method

.method public resetShootUI()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 240
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentPanorama;->setClickEnable(Z)V

    .line 241
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 242
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->onPause()V

    .line 243
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setVisibility(I)V

    .line 244
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mUseHint:Landroid/widget/TextView;

    const v1, 0x7f0f00be

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 245
    return-void
.end method

.method public setDirectionPosition(Landroid/graphics/Point;I)V
    .locals 1
    .param p1, "attachedPos"    # Landroid/graphics/Point;
    .param p2, "previewRefY"    # I

    .prologue
    .line 291
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setPosition(Landroid/graphics/Point;I)V

    .line 292
    return-void
.end method

.method public setDirectionTooFast(ZI)V
    .locals 1
    .param p1, "tooFast"    # Z
    .param p2, "moveSpeed"    # I

    .prologue
    .line 287
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setTooFast(ZI)V

    .line 288
    return-void
.end method

.method public setDisplayPreviewBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 283
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaPreview:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 284
    return-void
.end method

.method public setShootUI()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 234
    invoke-virtual {p0, v2}, Lcom/android/camera/fragment/FragmentPanorama;->setClickEnable(Z)V

    .line 235
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setVisibility(I)V

    .line 236
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 237
    return-void
.end method

.method public showSmallPreview(Z)V
    .locals 5
    .param p1, "animation"    # Z

    .prologue
    const/16 v4, 0xb

    const/16 v3, 0x9

    .line 249
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMovingDirectionView:Lcom/android/camera/ui/PanoMovingIndicatorView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/PanoMovingIndicatorView;->setVisibility(I)V

    .line 251
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 252
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_1

    .line 253
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 254
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 255
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    iget v3, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureWidth:I

    sub-int/2addr v2, v3

    .line 256
    iget v3, p0, Lcom/android/camera/fragment/FragmentPanorama;->mArrowMargin:I

    .line 255
    sub-int/2addr v2, v3

    .line 256
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    .line 255
    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 257
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    .line 258
    const/4 v2, 0x0

    .line 257
    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->setTransformationRatio(F)V

    .line 266
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->requestLayout()V

    .line 269
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->onResume()V

    .line 270
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreview:Lcom/android/camera/ui/GLTextureView;

    invoke-virtual {v1}, Lcom/android/camera/ui/GLTextureView;->requestRender()V

    .line 271
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewHintArea:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 272
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mWaitingFirstFrame:Z

    .line 274
    if-eqz p1, :cond_2

    .line 275
    new-instance v1, Lcom/android/camera/animation/type/AlphaInOnSubscribe;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-direct {v1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;-><init>(Landroid/view/View;)V

    const/16 v2, 0x258

    invoke-virtual {v1, v2}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-virtual {v1}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 280
    :goto_1
    return-void

    .line 259
    :cond_1
    iget v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mMoveDirection:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 260
    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 261
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 262
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mIndicator:Landroid/widget/ImageView;

    iget v2, p0, Lcom/android/camera/fragment/FragmentPanorama;->mStillPreviewTextureWidth:I

    iget v3, p0, Lcom/android/camera/fragment/FragmentPanorama;->mArrowMargin:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 263
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaArrowAnimateDrawable:Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;

    .line 264
    const/high16 v2, 0x40000000    # 2.0f

    .line 263
    invoke-virtual {v1, v2}, Lcom/android/camera/ui/drawable/PanoramaArrowAnimateDrawable;->setTransformationRatio(F)V

    goto :goto_0

    .line 278
    :cond_2
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama;->mPanoramaViewRoot:Landroid/view/View;

    invoke-static {v1}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    goto :goto_1
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 1
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 136
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 137
    const/16 v0, 0xb0

    invoke-interface {p1, v0, p0}, Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 138
    return-void
.end method
