.class public Lcom/android/camera/fragment/sticker/download/DownloadView;
.super Landroid/widget/RelativeLayout;
.source "DownloadView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/sticker/download/DownloadView$MyAnimalListener;
    }
.end annotation


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mRotationAnimal:Landroid/animation/ObjectAnimator;


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/sticker/download/DownloadView;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/download/DownloadView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/download/DownloadView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->doDownloading()V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/camera/fragment/sticker/download/DownloadView;Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/download/DownloadView;
    .param p1, "view"    # Landroid/view/View;
    .param p2, "listener"    # Landroid/animation/Animator$AnimatorListener;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/sticker/download/DownloadView;->hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/download/DownloadView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->rotation()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/camera/fragment/sticker/download/DownloadView;Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/sticker/download/DownloadView;
    .param p1, "view"    # Landroid/view/View;
    .param p2, "listener"    # Landroid/animation/Animator$AnimatorListener;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/sticker/download/DownloadView;->show(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 38
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->initView()V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->initView()V

    .line 44
    return-void
.end method

.method private doDownloading()V
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    const v1, 0x7f02010f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 66
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$2;

    invoke-direct {v1, p0, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$2;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->show(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 72
    return-void
.end method

.method private hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "listener"    # Landroid/animation/Animator$AnimatorListener;

    .prologue
    const/4 v6, 0x2

    .line 141
    const-string/jumbo v4, "alpha"

    new-array v5, v6, [F

    fill-array-data v5, :array_0

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    .line 142
    .local v1, "valuesHolder1":Landroid/animation/PropertyValuesHolder;
    const-string/jumbo v4, "scaleX"

    new-array v5, v6, [F

    fill-array-data v5, :array_1

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 143
    .local v2, "valuesHolder2":Landroid/animation/PropertyValuesHolder;
    const-string/jumbo v4, "scaleY"

    new-array v5, v6, [F

    fill-array-data v5, :array_2

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 144
    .local v3, "valuesHolder3":Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v5, 0x1

    aput-object v2, v4, v5

    aput-object v3, v4, v6

    invoke-static {p1, v4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 145
    .local v0, "objectAnimator":Landroid/animation/ObjectAnimator;
    if-eqz p2, :cond_0

    .line 146
    invoke-virtual {v0, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 148
    :cond_0
    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 149
    const-wide/16 v4, 0xfa

    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 150
    return-void

    .line 141
    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 142
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f19999a    # 0.6f
    .end array-data

    .line 143
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f19999a    # 0.6f
    .end array-data
.end method

.method private initView()V
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 47
    new-instance v1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    .line 48
    iget-object v1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v3, v3}, Lcom/android/camera/fragment/sticker/download/DownloadView;->addView(Landroid/view/View;II)V

    .line 49
    iget-object v1, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 50
    .local v0, "lps":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 51
    return-void
.end method

.method private rotation()V
    .locals 4

    .prologue
    .line 153
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    if-nez v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    const-string/jumbo v1, "rotation"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    .line 155
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 156
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 157
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 160
    return-void

    .line 154
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method private show(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "listener"    # Landroid/animation/Animator$AnimatorListener;

    .prologue
    const/4 v6, 0x2

    .line 128
    const-string/jumbo v4, "alpha"

    new-array v5, v6, [F

    fill-array-data v5, :array_0

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    .line 129
    .local v1, "valuesHolder1":Landroid/animation/PropertyValuesHolder;
    const-string/jumbo v4, "scaleX"

    new-array v5, v6, [F

    fill-array-data v5, :array_1

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 130
    .local v2, "valuesHolder2":Landroid/animation/PropertyValuesHolder;
    const-string/jumbo v4, "scaleY"

    new-array v5, v6, [F

    fill-array-data v5, :array_2

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 132
    .local v3, "valuesHolder3":Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x3

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v5, 0x1

    aput-object v2, v4, v5

    aput-object v3, v4, v6

    invoke-static {p1, v4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 133
    .local v0, "objectAnimator":Landroid/animation/ObjectAnimator;
    if-eqz p2, :cond_0

    .line 134
    invoke-virtual {v0, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 136
    :cond_0
    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 137
    const-wide/16 v4, 0x15e

    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 138
    return-void

    .line 128
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 129
    :array_1
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data

    .line 130
    :array_2
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public clearAnimation()V
    .locals 1

    .prologue
    .line 92
    invoke-super {p0}, Landroid/widget/RelativeLayout;->clearAnimation()V

    .line 93
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 94
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    .line 97
    :cond_0
    return-void
.end method

.method public endDownloading()V
    .locals 2

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 76
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$3;

    invoke-direct {v1, p0, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$3;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    return-void
.end method

.method public setStateImage(I)V
    .locals 2
    .param p1, "downloadState"    # I

    .prologue
    const v1, 0x7f02010d

    const/4 v0, 0x0

    .line 100
    packed-switch p1, :pswitch_data_0

    .line 125
    :goto_0
    return-void

    .line 102
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 103
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    goto :goto_0

    .line 106
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 107
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 108
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 111
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 112
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 113
    invoke-direct {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->doDownloading()V

    goto :goto_0

    .line 116
    :pswitch_3
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 117
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->endDownloading()V

    goto :goto_0

    .line 120
    :pswitch_4
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 121
    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->setVisibility(I)V

    .line 122
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 100
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public startDownload()V
    .locals 2

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/android/camera/fragment/sticker/download/DownloadView;->clearAnimation()V

    .line 56
    iget-object v0, p0, Lcom/android/camera/fragment/sticker/download/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/camera/fragment/sticker/download/DownloadView$1;

    invoke-direct {v1, p0, p0}, Lcom/android/camera/fragment/sticker/download/DownloadView$1;-><init>(Lcom/android/camera/fragment/sticker/download/DownloadView;Lcom/android/camera/fragment/sticker/download/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/sticker/download/DownloadView;->hide(Landroid/view/View;Landroid/animation/Animator$AnimatorListener;)V

    .line 62
    return-void
.end method
