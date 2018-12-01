.class public Lcom/android/camera/ui/V6PreviewPanel;
.super Lcom/android/camera/ui/V6RelativeLayout;
.source "V6PreviewPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/V6PreviewPanel$1;
    }
.end annotation


# instance fields
.field public mCaptureDelayNumber:Landroid/widget/TextView;

.field public mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

.field public mCropView:Lcom/android/camera/ui/V6EffectCropView;

.field public mFaceView:Lcom/android/camera/ui/FaceView;

.field public mFocusView:Lcom/android/camera/ui/FocusView;

.field private mHidePreviewCover:Ljava/lang/Runnable;

.field private mIsDelayNumInCenter:Z

.field public mObjectView:Lcom/android/camera/ui/ObjectView;

.field private mPreviewCover:Landroid/view/View;

.field public mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

.field public mVideoReviewImage:Landroid/widget/ImageView;

.field public mVideoReviewPlay:Landroid/widget/ImageView;


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/V6PreviewPanel;)Landroid/view/View;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/V6PreviewPanel;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mPreviewCover:Landroid/view/View;

    return-object v0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/V6RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 144
    new-instance v0, Lcom/android/camera/ui/V6PreviewPanel$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/V6PreviewPanel$1;-><init>(Lcom/android/camera/ui/V6PreviewPanel;)V

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mHidePreviewCover:Ljava/lang/Runnable;

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mIsDelayNumInCenter:Z

    .line 40
    return-void
.end method


# virtual methods
.method public hideDelayNumber()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 162
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumber:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_0

    .line 163
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumber:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 165
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 101
    :goto_0
    return-void

    .line 96
    :pswitch_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    .line 97
    const/16 v2, 0xa7

    .line 96
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;

    .line 98
    .local v0, "p":Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PlayVideoProtocol;->playVideo()V

    goto :goto_0

    .line 93
    :pswitch_data_0
    .packed-switch 0x7f0a0091
        :pswitch_0
    .end packed-switch
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 44
    invoke-super {p0}, Lcom/android/camera/ui/V6RelativeLayout;->onFinishInflate()V

    .line 45
    const v0, 0x7f0a008d

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/FaceView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mFaceView:Lcom/android/camera/ui/FaceView;

    .line 46
    const v0, 0x7f0a008e

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/ObjectView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mObjectView:Lcom/android/camera/ui/ObjectView;

    .line 47
    const v0, 0x7f0a008a

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumber:Landroid/widget/TextView;

    .line 48
    const v0, 0x7f0a0089

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

    .line 49
    const v0, 0x7f0a0091

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewPlay:Landroid/widget/ImageView;

    .line 50
    const v0, 0x7f0a008f

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/FocusView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mFocusView:Lcom/android/camera/ui/FocusView;

    .line 51
    const v0, 0x7f0a008b

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6PreviewFrame;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mPreviewFrame:Lcom/android/camera/ui/V6PreviewFrame;

    .line 52
    const v0, 0x7f0a0092

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findChildrenById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/V6EffectCropView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCropView:Lcom/android/camera/ui/V6EffectCropView;

    .line 53
    const v0, 0x7f0a0090

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewImage:Landroid/widget/ImageView;

    .line 54
    const v0, 0x7f0a0088

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewPanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mPreviewCover:Landroid/view/View;

    .line 55
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewImage:Landroid/widget/ImageView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 57
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mVideoReviewPlay:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    return-void
.end method

.method public showDelayNumber(Ljava/lang/String;)V
    .locals 2
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 152
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumberParent:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumber:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    .line 156
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumber:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 158
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewPanel;->mCaptureDelayNumber:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    return-void
.end method
