.class public Lcom/android/camera/fragment/beauty/FragmentPopupBeautyLevel;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentPopupBeautyLevel.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 36
    const/16 v0, 0xff2

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 31
    const v0, 0x7f040015

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeautyLevel;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v3, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 22
    .local v3, "screenWidth":I
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/FragmentPopupBeautyLevel;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v2, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 23
    .local v2, "screenHeight":I
    int-to-float v4, v2

    int-to-float v5, v3

    const/high16 v6, 0x3f400000    # 0.75f

    div-float/2addr v5, v6

    sub-float/2addr v4, v5

    float-to-int v0, v4

    .line 25
    .local v0, "bottomMargin":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 26
    .local v1, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 27
    return-void
.end method

.method protected provideEnterAnimation(I)Landroid/view/animation/Animation;
    .locals 2
    .param p1, "lastFragmentInfo"    # I

    .prologue
    .line 42
    const/16 v0, 0xa7

    .line 43
    const/16 v1, 0xa1

    .line 41
    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method protected provideExitAnimation()Landroid/view/animation/Animation;
    .locals 2

    .prologue
    .line 49
    const/16 v0, 0xa8

    .line 50
    const/16 v1, 0xa2

    .line 48
    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation([I)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method
