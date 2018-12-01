.class public Landroid/support/v4/view/PagerTitleStrip;
.super Landroid/view/ViewGroup;
.source "PagerTitleStrip.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$Decor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/PagerTitleStrip$1;,
        Landroid/support/v4/view/PagerTitleStrip$PageListener;,
        Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImpl;,
        Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImplBase;,
        Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImplIcs;
    }
.end annotation


# static fields
.field private static final ATTRS:[I

.field private static final IMPL:Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImpl;

.field private static final SIDE_ALPHA:F = 0.6f

.field private static final TAG:Ljava/lang/String; = "PagerTitleStrip"

.field private static final TEXT_ATTRS:[I

.field private static final TEXT_SPACING:I = 0x10


# instance fields
.field mCurrText:Landroid/widget/TextView;

.field private mGravity:I

.field private mLastKnownCurrentPage:I

.field private mLastKnownPositionOffset:F

.field mNextText:Landroid/widget/TextView;

.field private mNonPrimaryAlpha:I

.field private final mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

.field mPager:Landroid/support/v4/view/ViewPager;

.field mPrevText:Landroid/widget/TextView;

.field private mScaledTextSpacing:I

.field mTextColor:I

.field private mUpdatingPositions:Z

.field private mUpdatingText:Z

.field private mWatchingAdapter:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v4/view/PagerAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 67
    const/4 v0, 0x4

    new-array v0, v0, [I

    const v1, 0x1010034

    aput v1, v0, v3

    const v1, 0x1010095

    aput v1, v0, v4

    const v1, 0x1010098

    const/4 v2, 0x2

    aput v1, v0, v2

    const v1, 0x10100af

    const/4 v2, 0x3

    aput v1, v0, v2

    sput-object v0, Landroid/support/v4/view/PagerTitleStrip;->ATTRS:[I

    .line 74
    new-array v0, v4, [I

    const v1, 0x101038c

    aput v1, v0, v3

    sput-object v0, Landroid/support/v4/view/PagerTitleStrip;->TEXT_ATTRS:[I

    .line 102
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_34

    .line 105
    new-instance v0, Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImplBase;

    invoke-direct {v0}, Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImplBase;-><init>()V

    sput-object v0, Landroid/support/v4/view/PagerTitleStrip;->IMPL:Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImpl;

    .line 107
    :goto_33
    return-void

    .line 103
    :cond_34
    new-instance v0, Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImplIcs;

    invoke-direct {v0}, Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImplIcs;-><init>()V

    sput-object v0, Landroid/support/v4/view/PagerTitleStrip;->IMPL:Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImpl;

    goto :goto_33
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/view/PagerTitleStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    .line 118
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    const/4 v7, -0x1

    iput v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    .line 56
    const/high16 v7, -0x40800000    # -1.0f

    iput v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    .line 63
    new-instance v7, Landroid/support/v4/view/PagerTitleStrip$PageListener;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Landroid/support/v4/view/PagerTitleStrip$PageListener;-><init>(Landroid/support/v4/view/PagerTitleStrip;Landroid/support/v4/view/PagerTitleStrip$1;)V

    iput-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    .line 120
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 121
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 122
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {p0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 124
    sget-object v7, Landroid/support/v4/view/PagerTitleStrip;->ATTRS:[I

    invoke-virtual {p1, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 125
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v9, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .line 126
    .local v4, "textAppearance":I
    if-nez v4, :cond_a3

    .line 131
    :goto_3e
    const/4 v7, 0x1

    invoke-virtual {v0, v7, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    .line 132
    .local v6, "textSize":I
    if-nez v6, :cond_b3

    .line 135
    :goto_45
    invoke-virtual {v0, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v7

    if-nez v7, :cond_b8

    .line 141
    :goto_4b
    const/4 v7, 0x3

    const/16 v8, 0x50

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v7

    iput v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mGravity:I

    .line 142
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 144
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v7

    iput v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    .line 145
    const v7, 0x3f19999a    # 0.6f

    invoke-virtual {p0, v7}, Landroid/support/v4/view/PagerTitleStrip;->setNonPrimaryAlpha(F)V

    .line 147
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 148
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 149
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 151
    const/4 v1, 0x0

    .line 152
    .local v1, "allCaps":Z
    if-nez v4, :cond_cc

    .line 158
    :goto_81
    if-nez v1, :cond_da

    .line 163
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->setSingleLine()V

    .line 164
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->setSingleLine()V

    .line 165
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->setSingleLine()V

    .line 168
    :goto_92
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v2, v7, Landroid/util/DisplayMetrics;->density:F

    .line 169
    .local v2, "density":F
    const/high16 v7, 0x41800000    # 16.0f

    mul-float/2addr v7, v2

    float-to-int v7, v7

    iput v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    .line 170
    return-void

    .line 127
    .end local v1    # "allCaps":Z
    .end local v2    # "density":F
    .end local v6    # "textSize":I
    :cond_a3
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v7, p1, v4}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 128
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v7, p1, v4}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 129
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v7, p1, v4}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_3e

    .line 133
    .restart local v6    # "textSize":I
    :cond_b3
    int-to-float v7, v6

    invoke-virtual {p0, v9, v7}, Landroid/support/v4/view/PagerTitleStrip;->setTextSize(IF)V

    goto :goto_45

    .line 136
    :cond_b8
    invoke-virtual {v0, v10, v9}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    .line 137
    .local v5, "textColor":I
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_4b

    .line 153
    .end local v5    # "textColor":I
    .restart local v1    # "allCaps":Z
    :cond_cc
    sget-object v7, Landroid/support/v4/view/PagerTitleStrip;->TEXT_ATTRS:[I

    invoke-virtual {p1, v4, v7}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 154
    .local v3, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v3, v9, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 155
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_81

    .line 159
    .end local v3    # "ta":Landroid/content/res/TypedArray;
    :cond_da
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-static {v7}, Landroid/support/v4/view/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    .line 160
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-static {v7}, Landroid/support/v4/view/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    .line 161
    iget-object v7, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-static {v7}, Landroid/support/v4/view/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    goto :goto_92
.end method

.method static synthetic access$100(Landroid/support/v4/view/PagerTitleStrip;)F
    .registers 2
    .param p0, "x0"    # Landroid/support/v4/view/PagerTitleStrip;

    .prologue
    .line 47
    iget v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    return v0
.end method

.method private static setSingleLineAllCaps(Landroid/widget/TextView;)V
    .registers 2
    .param p0, "text"    # Landroid/widget/TextView;

    .prologue
    .line 110
    sget-object v0, Landroid/support/v4/view/PagerTitleStrip;->IMPL:Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImpl;

    invoke-interface {v0, p0}, Landroid/support/v4/view/PagerTitleStrip$PagerTitleStripImpl;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    .line 111
    return-void
.end method


# virtual methods
.method getMinHeight()I
    .registers 3

    .prologue
    .line 466
    const/4 v1, 0x0

    .line 467
    .local v1, "minHeight":I
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 468
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_8

    .line 471
    :goto_7
    return v1

    .line 469
    :cond_8
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    goto :goto_7
.end method

.method public getTextSpacing()I
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 244
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 246
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 247
    .local v2, "parent":Landroid/view/ViewParent;
    instance-of v4, v2, Landroid/support/v4/view/ViewPager;

    if-eqz v4, :cond_27

    move-object v1, v2

    .line 252
    nop

    nop

    .line 253
    .local v1, "pager":Landroid/support/v4/view/ViewPager;
    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 255
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    iget-object v4, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {v1, v4}, Landroid/support/v4/view/ViewPager;->setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 256
    iget-object v4, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {v1, v4}, Landroid/support/v4/view/ViewPager;->setOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V

    .line 257
    iput-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    .line 258
    iget-object v4, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    if-nez v4, :cond_30

    :goto_23
    invoke-virtual {p0, v3, v0}, Landroid/support/v4/view/PagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 259
    return-void

    .line 248
    .end local v0    # "adapter":Landroid/support/v4/view/PagerAdapter;
    .end local v1    # "pager":Landroid/support/v4/view/ViewPager;
    :cond_27
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "PagerTitleStrip must be a direct child of a ViewPager."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 258
    .restart local v0    # "adapter":Landroid/support/v4/view/PagerAdapter;
    .restart local v1    # "pager":Landroid/support/v4/view/ViewPager;
    :cond_30
    iget-object v3, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/PagerAdapter;

    goto :goto_23
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 263
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 264
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-nez v0, :cond_9

    .line 270
    :goto_8
    return-void

    .line 265
    :cond_9
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/PagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 266
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 267
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V

    .line 268
    iput-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    goto :goto_8
.end method

.method protected onLayout(ZIIII)V
    .registers 9
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v0, 0x0

    .line 459
    iget-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-nez v1, :cond_6

    .line 463
    :goto_5
    return-void

    .line 460
    :cond_6
    iget v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    cmpl-float v1, v1, v0

    if-ltz v1, :cond_e

    iget v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    .line 461
    .local v0, "offset":F
    :cond_e
    iget v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Landroid/support/v4/view/PagerTitleStrip;->updateTextPositions(IFZ)V

    goto :goto_5
.end method

.method protected onMeasure(II)V
    .registers 17
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 425
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    .line 426
    .local v10, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 427
    .local v3, "heightMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v11

    .line 428
    .local v11, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 430
    .local v4, "heightSize":I
    const/high16 v12, 0x40000000    # 2.0f

    if-ne v10, v12, :cond_65

    .line 434
    move v0, v4

    .line 435
    .local v0, "childHeight":I
    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getMinHeight()I

    move-result v7

    .line 436
    .local v7, "minHeight":I
    const/4 v8, 0x0

    .line 437
    .local v8, "padding":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v12

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v13

    add-int v8, v12, v13

    .line 438
    sub-int v0, v4, v8

    .line 440
    int-to-float v12, v11

    const v13, 0x3f4ccccd    # 0.8f

    mul-float/2addr v12, v13

    float-to-int v12, v12

    const/4 v13, 0x0

    invoke-static {v13, v12}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 441
    .local v6, "maxWidth":I
    const/high16 v12, -0x80000000

    invoke-static {v6, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 442
    .local v2, "childWidthSpec":I
    const/4 v12, 0x0

    invoke-static {v12, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 443
    .local v5, "maxHeight":I
    const/high16 v12, -0x80000000

    invoke-static {v5, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 445
    .local v1, "childHeightSpec":I
    iget-object v12, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v12, v2, v1}, Landroid/view/View;->measure(II)V

    .line 446
    iget-object v12, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v12, v2, v1}, Landroid/view/View;->measure(II)V

    .line 447
    iget-object v12, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v12, v2, v1}, Landroid/view/View;->measure(II)V

    .line 449
    const/high16 v12, 0x40000000    # 2.0f

    if-eq v3, v12, :cond_6e

    .line 452
    iget-object v12, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    .line 453
    .local v9, "textHeight":I
    add-int v12, v9, v8

    invoke-static {v7, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {p0, v11, v12}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 455
    .end local v9    # "textHeight":I
    :goto_64
    return-void

    .line 431
    .end local v0    # "childHeight":I
    .end local v1    # "childHeightSpec":I
    .end local v2    # "childWidthSpec":I
    .end local v5    # "maxHeight":I
    .end local v6    # "maxWidth":I
    .end local v7    # "minHeight":I
    .end local v8    # "padding":I
    :cond_65
    new-instance v12, Ljava/lang/IllegalStateException;

    const-string/jumbo v13, "Must measure with an exact width"

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 450
    .restart local v0    # "childHeight":I
    .restart local v1    # "childHeightSpec":I
    .restart local v2    # "childWidthSpec":I
    .restart local v5    # "maxHeight":I
    .restart local v6    # "maxWidth":I
    .restart local v7    # "minHeight":I
    .restart local v8    # "padding":I
    :cond_6e
    invoke-virtual {p0, v11, v4}, Landroid/view/View;->setMeasuredDimension(II)V

    goto :goto_64
.end method

.method public requestLayout()V
    .registers 2

    .prologue
    .line 313
    iget-boolean v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingText:Z

    if-eqz v0, :cond_5

    .line 316
    :goto_4
    return-void

    .line 314
    :cond_5
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    goto :goto_4
.end method

.method public setGravity(I)V
    .registers 2
    .param p1, "gravity"    # I

    .prologue
    .line 238
    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mGravity:I

    .line 239
    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->requestLayout()V

    .line 240
    return-void
.end method

.method public setNonPrimaryAlpha(F)V
    .registers 6
    .param p1, "alpha"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .prologue
    .line 195
    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr v1, p1

    float-to-int v1, v1

    and-int/lit16 v1, v1, 0xff

    iput v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNonPrimaryAlpha:I

    .line 196
    iget v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNonPrimaryAlpha:I

    shl-int/lit8 v1, v1, 0x18

    iget v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    or-int v0, v1, v2

    .line 197
    .local v0, "transparentColor":I
    iget-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 198
    iget-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 199
    return-void
.end method

.method public setTextColor(I)V
    .registers 6
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 208
    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    .line 209
    iget-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 210
    iget v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNonPrimaryAlpha:I

    shl-int/lit8 v1, v1, 0x18

    iget v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    or-int v0, v1, v2

    .line 211
    .local v0, "transparentColor":I
    iget-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 212
    iget-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    return-void
.end method

.method public setTextSize(IF)V
    .registers 4
    .param p1, "unit"    # I
    .param p2, "size"    # F

    .prologue
    .line 226
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 227
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 228
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 229
    return-void
.end method

.method public setTextSpacing(I)V
    .registers 2
    .param p1, "spacingPixels"    # I

    .prologue
    .line 178
    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    .line 179
    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->requestLayout()V

    .line 180
    return-void
.end method

.method updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V
    .registers 5
    .param p1, "oldAdapter"    # Landroid/support/v4/view/PagerAdapter;
    .param p2, "newAdapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    const/4 v1, 0x0

    .line 319
    if-nez p1, :cond_a

    .line 323
    :goto_3
    if-nez p2, :cond_12

    .line 327
    :goto_5
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-nez v0, :cond_1f

    .line 333
    :goto_9
    return-void

    .line 320
    :cond_a
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 321
    iput-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    goto :goto_3

    .line 324
    :cond_12
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {p2, v0}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 325
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    goto :goto_5

    .line 328
    :cond_1f
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    .line 329
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    .line 330
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/view/PagerTitleStrip;->updateText(ILandroid/support/v4/view/PagerAdapter;)V

    .line 331
    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->requestLayout()V

    goto :goto_9
.end method

.method updateText(ILandroid/support/v4/view/PagerAdapter;)V
    .registers 15
    .param p1, "currentItem"    # I
    .param p2, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    const/4 v10, 0x1

    const/high16 v11, -0x80000000

    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 273
    if-nez p2, :cond_6f

    move v3, v8

    .line 274
    .local v3, "itemCount":I
    :goto_8
    iput-boolean v10, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingText:Z

    .line 276
    const/4 v6, 0x0

    .line 277
    .local v6, "text":Ljava/lang/CharSequence;
    if-ge p1, v10, :cond_74

    .line 280
    .end local v6    # "text":Ljava/lang/CharSequence;
    :cond_d
    :goto_d
    iget-object v10, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    iget-object v10, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    if-nez p2, :cond_7d

    :cond_16
    :goto_16
    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    const/4 v6, 0x0

    .line 286
    .restart local v6    # "text":Ljava/lang/CharSequence;
    add-int/lit8 v9, p1, 0x1

    if-lt v9, v3, :cond_84

    .line 289
    .end local v6    # "text":Ljava/lang/CharSequence;
    :cond_1e
    :goto_1e
    iget-object v9, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v9, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v10

    sub-int/2addr v9, v10

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v10

    sub-int v7, v9, v10

    .line 293
    .local v7, "width":I
    int-to-float v9, v7

    const v10, 0x3f4ccccd    # 0.8f

    mul-float/2addr v9, v10

    float-to-int v9, v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 294
    .local v5, "maxWidth":I
    invoke-static {v5, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 295
    .local v2, "childWidthSpec":I
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v10

    sub-int/2addr v9, v10

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v10

    sub-int v0, v9, v10

    .line 296
    .local v0, "childHeight":I
    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 297
    .local v4, "maxHeight":I
    invoke-static {v4, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 298
    .local v1, "childHeightSpec":I
    iget-object v9, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v9, v2, v1}, Landroid/view/View;->measure(II)V

    .line 299
    iget-object v9, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v9, v2, v1}, Landroid/view/View;->measure(II)V

    .line 300
    iget-object v9, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v9, v2, v1}, Landroid/view/View;->measure(II)V

    .line 302
    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    .line 304
    iget-boolean v9, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingPositions:Z

    if-eqz v9, :cond_8d

    .line 308
    :goto_6c
    iput-boolean v8, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingText:Z

    .line 309
    return-void

    .line 273
    .end local v0    # "childHeight":I
    .end local v1    # "childHeightSpec":I
    .end local v2    # "childWidthSpec":I
    .end local v3    # "itemCount":I
    .end local v4    # "maxHeight":I
    .end local v5    # "maxWidth":I
    .end local v7    # "width":I
    :cond_6f
    invoke-virtual {p2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v3

    goto :goto_8

    .line 277
    .restart local v3    # "itemCount":I
    .restart local v6    # "text":Ljava/lang/CharSequence;
    :cond_74
    if-eqz p2, :cond_d

    .line 278
    add-int/lit8 v10, p1, -0x1

    invoke-virtual {p2, v10}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v6

    goto :goto_d

    .line 282
    .end local v6    # "text":Ljava/lang/CharSequence;
    :cond_7d
    if-ge p1, v3, :cond_16

    invoke-virtual {p2, p1}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v9

    goto :goto_16

    .line 286
    .restart local v6    # "text":Ljava/lang/CharSequence;
    :cond_84
    if-eqz p2, :cond_1e

    .line 287
    add-int/lit8 v9, p1, 0x1

    invoke-virtual {p2, v9}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v6

    goto :goto_1e

    .line 305
    .end local v6    # "text":Ljava/lang/CharSequence;
    .restart local v0    # "childHeight":I
    .restart local v1    # "childHeightSpec":I
    .restart local v2    # "childWidthSpec":I
    .restart local v4    # "maxHeight":I
    .restart local v5    # "maxWidth":I
    .restart local v7    # "width":I
    :cond_8d
    iget v9, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    invoke-virtual {p0, p1, v9, v8}, Landroid/support/v4/view/PagerTitleStrip;->updateTextPositions(IFZ)V

    goto :goto_6c
.end method

.method updateTextPositions(IFZ)V
    .registers 49
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "force"    # Z

    .prologue
    .line 336
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    move/from16 v42, v0

    move/from16 v0, p1

    move/from16 v1, v42

    if-ne v0, v1, :cond_177

    .line 338
    if-eqz p3, :cond_18c

    .line 342
    :cond_e
    :goto_e
    const/16 v42, 0x1

    move/from16 v0, v42

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingPositions:Z

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/view/View;->getMeasuredWidth()I

    move-result v36

    .line 345
    .local v36, "prevWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/view/View;->getMeasuredWidth()I

    move-result v18

    .line 346
    .local v18, "currWidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/view/View;->getMeasuredWidth()I

    move-result v26

    .line 347
    .local v26, "nextWidth":I
    div-int/lit8 v19, v18, 0x2

    .line 349
    .local v19, "halfCurrWidth":I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v38

    .line 350
    .local v38, "stripWidth":I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v37

    .line 351
    .local v37, "stripHeight":I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v29

    .line 352
    .local v29, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingRight()I

    move-result v30

    .line 353
    .local v30, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    move-result v31

    .line 354
    .local v31, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v28

    .line 355
    .local v28, "paddingBottom":I
    add-int v39, v29, v19

    .line 356
    .local v39, "textPaddedLeft":I
    add-int v40, v30, v19

    .line 357
    .local v40, "textPaddedRight":I
    sub-int v42, v38, v39

    sub-int v10, v42, v40

    .line 359
    .local v10, "contentWidth":I
    const/high16 v42, 0x3f000000    # 0.5f

    add-float v14, p2, v42

    .line 360
    .local v14, "currOffset":F
    const/high16 v42, 0x3f800000    # 1.0f

    cmpl-float v42, v14, v42

    if-lez v42, :cond_64

    .line 361
    const/high16 v42, 0x3f800000    # 1.0f

    sub-float v14, v14, v42

    .line 363
    :cond_64
    sub-int v42, v38, v40

    int-to-float v0, v10

    move/from16 v43, v0

    mul-float v43, v43, v14

    move/from16 v0, v43

    float-to-int v0, v0

    move/from16 v43, v0

    sub-int v12, v42, v43

    .line 364
    .local v12, "currCenter":I
    div-int/lit8 v42, v18, 0x2

    sub-int v13, v12, v42

    .line 365
    .local v13, "currLeft":I
    add-int v15, v13, v18

    .line 367
    .local v15, "currRight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/widget/TextView;->getBaseline()I

    move-result v32

    .line 368
    .local v32, "prevBaseline":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/widget/TextView;->getBaseline()I

    move-result v11

    .line 369
    .local v11, "currBaseline":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/widget/TextView;->getBaseline()I

    move-result v22

    .line 370
    .local v22, "nextBaseline":I
    move/from16 v0, v32

    invoke-static {v0, v11}, Ljava/lang/Math;->max(II)I

    move-result v42

    move/from16 v0, v42

    move/from16 v1, v22

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 371
    .local v20, "maxBaseline":I
    sub-int v35, v20, v32

    .line 372
    .local v35, "prevTopOffset":I
    sub-int v17, v20, v11

    .line 373
    .local v17, "currTopOffset":I
    sub-int v25, v20, v22

    .line 374
    .local v25, "nextTopOffset":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/view/View;->getMeasuredHeight()I

    move-result v42

    add-int v7, v35, v42

    .line 375
    .local v7, "alignedPrevHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/view/View;->getMeasuredHeight()I

    move-result v42

    add-int v5, v17, v42

    .line 376
    .local v5, "alignedCurrHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/view/View;->getMeasuredHeight()I

    move-result v42

    add-int v6, v25, v42

    .line 377
    .local v6, "alignedNextHeight":I
    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    move-result v42

    move/from16 v0, v42

    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    move-result v21

    .line 380
    .local v21, "maxTextHeight":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mGravity:I

    move/from16 v42, v0

    and-int/lit8 v41, v42, 0x70

    .line 385
    .local v41, "vgrav":I
    sparse-switch v41, :sswitch_data_1b4

    .line 388
    :sswitch_e3
    add-int v34, v31, v35

    .line 389
    .local v34, "prevTop":I
    add-int v16, v31, v17

    .line 390
    .local v16, "currTop":I
    add-int v24, v31, v25

    .line 407
    .local v24, "nextTop":I
    :goto_e9
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    move-object/from16 v43, v0

    invoke-virtual/range {v43 .. v43}, Landroid/view/View;->getMeasuredHeight()I

    move-result v43

    add-int v43, v43, v16

    move-object/from16 v0, v42

    move/from16 v1, v16

    move/from16 v2, v43

    invoke-virtual {v0, v13, v1, v15, v2}, Landroid/view/View;->layout(IIII)V

    .line 410
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    move/from16 v42, v0

    sub-int v42, v13, v42

    sub-int v42, v42, v36

    move/from16 v0, v29

    move/from16 v1, v42

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v33

    .line 411
    .local v33, "prevLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    add-int v43, v33, v36

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    move-object/from16 v44, v0

    invoke-virtual/range {v44 .. v44}, Landroid/view/View;->getMeasuredHeight()I

    move-result v44

    add-int v44, v44, v34

    move-object/from16 v0, v42

    move/from16 v1, v33

    move/from16 v2, v34

    move/from16 v3, v43

    move/from16 v4, v44

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 414
    sub-int v42, v38, v30

    sub-int v42, v42, v26

    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    move/from16 v43, v0

    add-int v43, v43, v15

    invoke-static/range {v42 .. v43}, Ljava/lang/Math;->max(II)I

    move-result v23

    .line 416
    .local v23, "nextLeft":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    move-object/from16 v42, v0

    add-int v43, v23, v26

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    move-object/from16 v44, v0

    invoke-virtual/range {v44 .. v44}, Landroid/view/View;->getMeasuredHeight()I

    move-result v44

    add-int v44, v44, v24

    move-object/from16 v0, v42

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v43

    move/from16 v4, v44

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 419
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    .line 420
    const/16 v42, 0x0

    move/from16 v0, v42

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingPositions:Z

    .line 421
    return-void

    .line 337
    .end local v5    # "alignedCurrHeight":I
    .end local v6    # "alignedNextHeight":I
    .end local v7    # "alignedPrevHeight":I
    .end local v10    # "contentWidth":I
    .end local v11    # "currBaseline":I
    .end local v12    # "currCenter":I
    .end local v13    # "currLeft":I
    .end local v14    # "currOffset":F
    .end local v15    # "currRight":I
    .end local v16    # "currTop":I
    .end local v17    # "currTopOffset":I
    .end local v18    # "currWidth":I
    .end local v19    # "halfCurrWidth":I
    .end local v20    # "maxBaseline":I
    .end local v21    # "maxTextHeight":I
    .end local v22    # "nextBaseline":I
    .end local v23    # "nextLeft":I
    .end local v24    # "nextTop":I
    .end local v25    # "nextTopOffset":I
    .end local v26    # "nextWidth":I
    .end local v28    # "paddingBottom":I
    .end local v29    # "paddingLeft":I
    .end local v30    # "paddingRight":I
    .end local v31    # "paddingTop":I
    .end local v32    # "prevBaseline":I
    .end local v33    # "prevLeft":I
    .end local v34    # "prevTop":I
    .end local v35    # "prevTopOffset":I
    .end local v36    # "prevWidth":I
    .end local v37    # "stripHeight":I
    .end local v38    # "stripWidth":I
    .end local v39    # "textPaddedLeft":I
    .end local v40    # "textPaddedRight":I
    .end local v41    # "vgrav":I
    :cond_177
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v42, v0

    invoke-virtual/range {v42 .. v42}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v42

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/PagerTitleStrip;->updateText(ILandroid/support/v4/view/PagerAdapter;)V

    goto/16 :goto_e

    .line 338
    :cond_18c
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    move/from16 v42, v0

    cmpl-float v42, p2, v42

    if-nez v42, :cond_e

    .line 339
    return-void

    .line 393
    .restart local v5    # "alignedCurrHeight":I
    .restart local v6    # "alignedNextHeight":I
    .restart local v7    # "alignedPrevHeight":I
    .restart local v10    # "contentWidth":I
    .restart local v11    # "currBaseline":I
    .restart local v12    # "currCenter":I
    .restart local v13    # "currLeft":I
    .restart local v14    # "currOffset":F
    .restart local v15    # "currRight":I
    .restart local v17    # "currTopOffset":I
    .restart local v18    # "currWidth":I
    .restart local v19    # "halfCurrWidth":I
    .restart local v20    # "maxBaseline":I
    .restart local v21    # "maxTextHeight":I
    .restart local v22    # "nextBaseline":I
    .restart local v25    # "nextTopOffset":I
    .restart local v26    # "nextWidth":I
    .restart local v28    # "paddingBottom":I
    .restart local v29    # "paddingLeft":I
    .restart local v30    # "paddingRight":I
    .restart local v31    # "paddingTop":I
    .restart local v32    # "prevBaseline":I
    .restart local v35    # "prevTopOffset":I
    .restart local v36    # "prevWidth":I
    .restart local v37    # "stripHeight":I
    .restart local v38    # "stripWidth":I
    .restart local v39    # "textPaddedLeft":I
    .restart local v40    # "textPaddedRight":I
    .restart local v41    # "vgrav":I
    :sswitch_197
    sub-int v42, v37, v31

    sub-int v27, v42, v28

    .line 394
    .local v27, "paddedHeight":I
    sub-int v42, v27, v21

    div-int/lit8 v9, v42, 0x2

    .line 395
    .local v9, "centeredTop":I
    add-int v34, v9, v35

    .line 396
    .restart local v34    # "prevTop":I
    add-int v16, v9, v17

    .line 397
    .restart local v16    # "currTop":I
    add-int v24, v9, v25

    .restart local v24    # "nextTop":I
    goto/16 :goto_e9

    .line 400
    .end local v9    # "centeredTop":I
    .end local v16    # "currTop":I
    .end local v24    # "nextTop":I
    .end local v27    # "paddedHeight":I
    .end local v34    # "prevTop":I
    :sswitch_1a7
    sub-int v42, v37, v28

    sub-int v8, v42, v21

    .line 401
    .local v8, "bottomGravTop":I
    add-int v34, v8, v35

    .line 402
    .restart local v34    # "prevTop":I
    add-int v16, v8, v17

    .line 403
    .restart local v16    # "currTop":I
    add-int v24, v8, v25

    .restart local v24    # "nextTop":I
    goto/16 :goto_e9

    .line 385
    nop

    :sswitch_data_1b4
    .sparse-switch
        0x10 -> :sswitch_197
        0x30 -> :sswitch_e3
        0x50 -> :sswitch_1a7
    .end sparse-switch
.end method
