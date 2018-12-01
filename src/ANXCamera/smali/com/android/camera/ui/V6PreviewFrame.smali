.class public Lcom/android/camera/ui/V6PreviewFrame;
.super Lcom/android/camera/ui/V6RelativeLayout;
.source "V6PreviewFrame.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field private mAspectRatio:F

.field public mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/V6RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    const v0, 0x3fe38e39

    iput v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mAspectRatio:F

    .line 23
    return-void
.end method

.method private isReferenceLineEnabled()Z
    .locals 3

    .prologue
    .line 105
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "pref_camera_referenceline_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private needReferenceLineMode()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 97
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 98
    .local v0, "mode":I
    const/16 v2, 0xa3

    if-eq v0, v2, :cond_0

    .line 99
    const/16 v2, 0xa7

    if-ne v0, v2, :cond_1

    .line 98
    :cond_0
    :goto_0
    return v1

    .line 100
    :cond_1
    const/16 v2, 0xab

    if-eq v0, v2, :cond_0

    .line 101
    const/16 v2, 0xa5

    if-eq v0, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public hidePreviewGrid()V
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0}, Lcom/android/camera/ui/SplitLineDrawer;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    .line 94
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x0

    .line 42
    invoke-super {p0}, Lcom/android/camera/ui/V6RelativeLayout;->onFinishInflate()V

    .line 43
    const v0, 0x7f0a008c

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6PreviewFrame;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/SplitLineDrawer;

    iput-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    .line 44
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0, v2, v2}, Lcom/android/camera/ui/SplitLineDrawer;->initialize(II)V

    .line 45
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v0, v1, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setBorderVisible(ZZ)V

    .line 46
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const v1, -0x7f000001

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setLineColor(I)V

    .line 47
    invoke-virtual {p0, p0}, Lcom/android/camera/ui/V6PreviewFrame;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 48
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 117
    sub-int v0, p4, p2

    sub-int v1, p5, p3

    if-le v0, v1, :cond_0

    .line 118
    return-void

    .line 121
    :cond_0
    sub-int v0, p5, p3

    sub-int v1, p4, p2

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mAspectRatio:F

    .line 122
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldW"    # I
    .param p4, "oldH"    # I

    .prologue
    .line 127
    return-void
.end method

.method public setAspectRatio(F)V
    .locals 4
    .param p1, "ratio"    # F

    .prologue
    .line 51
    float-to-double v0, p1

    const-wide/16 v2, 0x0

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_0

    .line 52
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 54
    :cond_0
    iget v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mAspectRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    cmpl-double v0, v0, v2

    if-lez v0, :cond_1

    .line 55
    iput p1, p0, Lcom/android/camera/ui/V6PreviewFrame;->mAspectRatio:F

    .line 58
    :cond_1
    return-void
.end method

.method public updatePreviewGrid()V
    .locals 2

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/android/camera/ui/V6PreviewFrame;->isReferenceLineEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/android/camera/ui/V6PreviewFrame;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isScanQRCodeIntent()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 81
    if-eqz v0, :cond_0

    .line 83
    invoke-direct {p0}, Lcom/android/camera/ui/V6PreviewFrame;->needReferenceLineMode()Z

    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/SplitLineDrawer;->setVisibility(I)V

    goto :goto_0
.end method

.method public updateReferenceLineAccordSquare()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 61
    iget-object v2, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v2}, Lcom/android/camera/ui/SplitLineDrawer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 62
    .local v0, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 63
    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/lit8 v1, v2, 0x6

    .line 64
    .local v1, "margin":I
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 65
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 70
    .end local v1    # "margin":I
    :goto_0
    iget-object v2, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v2}, Lcom/android/camera/ui/SplitLineDrawer;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    .line 71
    iget-object v2, p0, Lcom/android/camera/ui/V6PreviewFrame;->mReferenceGrid:Lcom/android/camera/ui/SplitLineDrawer;

    invoke-virtual {v2}, Lcom/android/camera/ui/SplitLineDrawer;->requestLayout()V

    .line 73
    :cond_0
    return-void

    .line 67
    :cond_1
    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 68
    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    goto :goto_0
.end method
