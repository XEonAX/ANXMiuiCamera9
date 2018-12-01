.class public Lcom/miui/internal/view/menu/PhoneActionMenuView;
.super Lcom/miui/internal/view/menu/ActionMenuView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;,
        Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;
    }
.end annotation


# static fields
.field private static final PW:[I


# instance fields
.field private PX:I

.field private PY:Landroid/graphics/Rect;

.field private PZ:Landroid/view/View;

.field private Qa:Landroid/graphics/drawable/Drawable;

.field private Qb:Landroid/graphics/drawable/Drawable;

.field private Qc:I

.field private Qd:I

.field private Qe:I

.field private Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

.field private Qg:Landroid/view/View;

.field private Qh:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

.field private Qi:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 34
    const/4 v0, 0x3

    new-array v0, v0, [I

    .line 35
    const v1, 0x10100d4

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 36
    sget v1, Lcom/miui/internal/R$attr;->expandBackground:I

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 37
    sget v1, Lcom/miui/internal/R$attr;->splitActionBarOverlayHeight:I

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 34
    sput-object v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PW:[I

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/miui/internal/view/menu/ActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 53
    sget-object v0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 67
    iput v2, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qc:I

    .line 69
    iput v2, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    .line 78
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/miui/internal/view/menu/ActionMenuView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    sget-object v0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PW:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 81
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qa:Landroid/graphics/drawable/Drawable;

    .line 82
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qb:Landroid/graphics/drawable/Drawable;

    .line 83
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qi:I

    .line 84
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 86
    invoke-direct {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tr()V

    .line 87
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    .line 88
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->addView(Landroid/view/View;)V

    .line 90
    invoke-virtual {p0, v3}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setChildrenDrawingOrderEnabled(Z)V

    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 93
    sget v1, Lcom/miui/internal/R$dimen;->action_button_max_width:I

    .line 92
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qc:I

    .line 94
    return-void
.end method

.method private tr()V
    .registers 3

    .prologue
    .line 339
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    if-nez v0, :cond_b

    .line 340
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    .line 343
    :cond_b
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qa:Landroid/graphics/drawable/Drawable;

    .line 344
    :goto_11
    if-nez v0, :cond_1c

    .line 345
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 346
    return-void

    .line 343
    :cond_19
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qb:Landroid/graphics/drawable/Drawable;

    goto :goto_11

    .line 349
    :cond_1c
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 350
    return-void
.end method

.method private ts()Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 178
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qh:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    if-nez v0, :cond_c

    .line 179
    new-instance v0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    invoke-direct {v0, p0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;-><init>(Lcom/miui/internal/view/menu/PhoneActionMenuView;Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;)V

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qh:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    .line 181
    :cond_c
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qh:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    return-object v0
.end method

.method static synthetic tt(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    return-object v0
.end method

.method static synthetic tu(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qa:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic tv(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    return-object v0
.end method

.method static synthetic tw(Lcom/miui/internal/view/menu/PhoneActionMenuView;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    return-object v0
.end method

.method static synthetic tx(Lcom/miui/internal/view/menu/PhoneActionMenuView;Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;)Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;
    .registers 2

    iput-object p1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    return-object p1
.end method


# virtual methods
.method public filterLeftoverView(I)Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 107
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 108
    iget-object v2, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eq v0, v2, :cond_d

    iget-object v2, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    if-ne v0, v2, :cond_15

    :cond_d
    move v0, v1

    .line 114
    :goto_e
    if-eqz v0, :cond_24

    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->filterLeftoverView(I)Z

    move-result v0

    :goto_14
    return v0

    .line 111
    :cond_15
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;

    .line 112
    if-eqz v0, :cond_22

    iget-boolean v0, v0, Lcom/miui/internal/view/menu/ActionMenuView$LayoutParams;->isOverflowButton:Z

    xor-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_22
    const/4 v0, 0x1

    goto :goto_e

    :cond_24
    move v0, v1

    .line 114
    goto :goto_14
.end method

.method protected getChildDrawingOrder(II)I
    .registers 8

    .prologue
    const/4 v1, 0x0

    const/4 v4, -0x1

    .line 365
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v2

    .line 366
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 368
    if-nez p2, :cond_16

    .line 369
    if-eq v2, v4, :cond_13

    .line 370
    return v2

    .line 371
    :cond_13
    if-eq v3, v4, :cond_1e

    .line 372
    return v3

    .line 374
    :cond_16
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1e

    .line 375
    if-eq v2, v4, :cond_1e

    if-eq v3, v4, :cond_1e

    .line 376
    return v3

    .line 380
    :cond_1e
    :goto_1e
    if-ge v1, p1, :cond_32

    .line 381
    if-eq v1, v2, :cond_24

    if-ne v1, v3, :cond_27

    .line 380
    :cond_24
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 386
    :cond_27
    if-ge v1, v2, :cond_37

    .line 387
    add-int/lit8 v0, v1, 0x1

    .line 389
    :goto_2b
    if-ge v1, v3, :cond_2f

    .line 390
    add-int/lit8 v0, v0, 0x1

    .line 392
    :cond_2f
    if-ne v0, p2, :cond_24

    .line 393
    return v1

    .line 397
    :cond_32
    invoke-super {p0, p1, p2}, Lcom/miui/internal/view/menu/ActionMenuView;->getChildDrawingOrder(II)I

    move-result v0

    return v0

    :cond_37
    move v0, v1

    goto :goto_2b
.end method

.method public getCollapsedHeight()I
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 186
    iget v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qd:I

    if-nez v0, :cond_6

    .line 187
    return v1

    .line 189
    :cond_6
    iget v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qd:I

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qi:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public hasBackgroundView()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 402
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    if-ne v1, v2, :cond_a

    const/4 v0, 0x1

    :cond_a
    return v0
.end method

.method public hideOverflowMenu()Z
    .registers 4

    .prologue
    .line 162
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 163
    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qk:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_a

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_c

    .line 164
    :cond_a
    const/4 v0, 0x0

    return v0

    .line 167
    :cond_c
    invoke-direct {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->ts()Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    move-result-object v1

    .line 168
    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_1d

    .line 169
    sget-object v0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qk:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 170
    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->hide()V

    .line 174
    :cond_1b
    :goto_1b
    const/4 v0, 0x1

    return v0

    .line 171
    :cond_1d
    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qm:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_1b

    .line 172
    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->tz()V

    goto :goto_1b
.end method

.method public isOverflowMenuShowing()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 158
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qm:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v1, v2, :cond_d

    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v1, v2, :cond_e

    :cond_d
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected onLayout(ZIIII)V
    .registers 17

    .prologue
    .line 256
    sub-int v4, p4, p2

    .line 257
    sub-int v8, p5, p3

    .line 260
    const/4 v3, 0x0

    .line 261
    const/4 v0, 0x0

    .line 264
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eqz v1, :cond_9e

    .line 265
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 266
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    const/4 v2, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    .line 267
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    sub-int v3, v5, v0

    .line 271
    :goto_1d
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    const/4 v2, 0x0

    move-object v0, p0

    move v5, v8

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    .line 273
    const/4 v6, 0x0

    .line 274
    const/4 v1, 0x0

    .line 275
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result v9

    .line 277
    const/4 v0, 0x0

    move v2, v0

    :goto_2d
    if-ge v2, v9, :cond_4f

    .line 278
    invoke-virtual {p0, v2}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 279
    iget-object v5, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eq v0, v5, :cond_3b

    iget-object v5, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    if-ne v0, v5, :cond_41

    :cond_3b
    move v0, v1

    .line 277
    :goto_3c
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move v1, v0

    goto :goto_2d

    .line 282
    :cond_41
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    iget v5, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    if-lt v0, v5, :cond_9c

    .line 283
    const/4 v0, 0x1

    .line 285
    :goto_4a
    add-int/lit8 v1, v1, 0x1

    move v6, v0

    move v0, v1

    goto :goto_3c

    .line 289
    :cond_4f
    if-eqz v6, :cond_6d

    .line 290
    iget v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    mul-int/2addr v0, v1

    sub-int v0, v4, v0

    shr-int/lit8 v0, v0, 0x1

    .line 295
    :goto_58
    const/4 v1, 0x0

    move v7, v1

    move v2, v0

    :goto_5b
    if-ge v7, v9, :cond_9b

    .line 296
    invoke-virtual {p0, v7}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 297
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eq v1, v0, :cond_69

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    if-ne v1, v0, :cond_74

    .line 295
    :cond_69
    :goto_69
    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_5b

    .line 292
    :cond_6d
    iget v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qe:I

    sub-int v0, v4, v0

    shr-int/lit8 v0, v0, 0x1

    goto :goto_58

    .line 300
    :cond_74
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 301
    if-eqz v6, :cond_8e

    .line 302
    iget v4, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    sub-int/2addr v4, v0

    shr-int/lit8 v10, v4, 0x1

    .line 303
    add-int/2addr v2, v10

    .line 304
    add-int v4, v2, v0

    move-object v0, p0

    move v5, v8

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    .line 305
    sub-int v0, v2, v10

    .line 306
    iget v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    add-int v2, v0, v1

    goto :goto_69

    .line 308
    :cond_8e
    add-int v4, v2, v0

    move-object v0, p0

    move v5, v8

    invoke-static/range {v0 .. v5}, Lmiui/util/ViewUtils;->layoutChildView(Landroid/view/ViewGroup;Landroid/view/View;IIII)V

    .line 309
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int/2addr v2, v0

    goto :goto_69

    .line 313
    :cond_9b
    return-void

    :cond_9c
    move v0, v6

    goto :goto_4a

    :cond_9e
    move v3, v0

    goto/16 :goto_1d
.end method

.method protected onMeasure(II)V
    .registers 13

    .prologue
    const/4 v2, -0x1

    const/4 v3, 0x0

    .line 198
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result v9

    .line 200
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result v0

    .line 201
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    if-eq v1, v2, :cond_14

    .line 202
    add-int/lit8 v0, v0, -0x1

    .line 204
    :cond_14
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    if-eq v1, v2, :cond_1e

    .line 205
    add-int/lit8 v0, v0, -0x1

    .line 208
    :cond_1e
    if-eqz v9, :cond_22

    if-nez v0, :cond_28

    .line 209
    :cond_22
    iput v3, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qd:I

    .line 210
    invoke-virtual {p0, v3, v3}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setMeasuredDimension(II)V

    .line 211
    return-void

    .line 214
    :cond_28
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    div-int v0, v1, v0

    .line 215
    iget v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qc:I

    .line 214
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    .line 217
    iget v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PX:I

    const/high16 v1, -0x80000000

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    move v8, v3

    move v6, v3

    move v7, v3

    .line 219
    :goto_41
    if-ge v8, v9, :cond_6d

    .line 220
    invoke-virtual {p0, v8}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 221
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eq v1, v0, :cond_4f

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    if-ne v1, v0, :cond_57

    :cond_4f
    move v0, v6

    move v1, v7

    .line 219
    :goto_51
    add-int/lit8 v4, v8, 0x1

    move v8, v4

    move v6, v0

    move v7, v1

    goto :goto_41

    :cond_57
    move-object v0, p0

    move v4, p2

    move v5, v3

    .line 225
    invoke-virtual/range {v0 .. v5}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 226
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int v4, v7, v0

    .line 227
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    move v1, v4

    goto :goto_51

    .line 229
    :cond_6d
    iput v7, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qe:I

    .line 230
    iput v6, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qd:I

    .line 232
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eqz v0, :cond_9b

    .line 233
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    move-object v0, p0

    move v2, p1

    move v4, p2

    move v5, v3

    invoke-virtual/range {v0 .. v5}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 234
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 235
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v6, v0

    .line 237
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_bd

    .line 238
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 244
    :cond_9b
    :goto_9b
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-nez v0, :cond_a4

    .line 245
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PY:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v0

    .line 247
    :cond_a4
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_ca

    .line 248
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qa:Landroid/graphics/drawable/Drawable;

    .line 247
    :goto_ae
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 250
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 251
    invoke-virtual {p0, v0, v6}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setMeasuredDimension(II)V

    .line 252
    return-void

    .line 239
    :cond_bd
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_9b

    .line 240
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    int-to-float v1, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_9b

    .line 248
    :cond_ca
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qb:Landroid/graphics/drawable/Drawable;

    goto :goto_ae
.end method

.method public onPageScrolled(IFZZ)V
    .registers 9

    .prologue
    .line 324
    sget-boolean v0, Lcom/miui/internal/util/DeviceHelper;->FEATURE_WHOLE_ANIM:Z

    if-eqz v0, :cond_b

    .line 325
    invoke-virtual {p0, p2, p3, p4}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->computeAlpha(FZZ)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setAlpha(F)V

    .line 328
    :cond_b
    invoke-virtual {p0, p2, p3, p4}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->computeTranslationY(FZZ)F

    move-result v1

    .line 329
    const/4 v0, 0x0

    :goto_10
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_29

    .line 330
    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 331
    iget-object v3, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eq v2, v3, :cond_22

    iget-object v3, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    if-ne v2, v3, :cond_25

    .line 329
    :cond_22
    :goto_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 334
    :cond_25
    invoke-virtual {v2, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_22

    .line 336
    :cond_29
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    .prologue
    .line 318
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-nez v0, :cond_12

    const/4 v0, 0x0

    :goto_9
    cmpl-float v0, v1, v0

    if-gtz v0, :cond_19

    .line 319
    invoke-super {p0, p1}, Lcom/miui/internal/view/menu/ActionMenuView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 318
    :goto_11
    return v0

    .line 319
    :cond_12
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    goto :goto_9

    .line 318
    :cond_19
    const/4 v0, 0x1

    goto :goto_11
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .prologue
    .line 98
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qa:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_9

    .line 99
    iput-object p1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qa:Landroid/graphics/drawable/Drawable;

    .line 100
    invoke-direct {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tr()V

    .line 102
    :cond_9
    return-void
.end method

.method public setOverflowMenuView(Landroid/view/View;)V
    .registers 3

    .prologue
    .line 118
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eq v0, p1, :cond_24

    .line 119
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eqz v0, :cond_1a

    .line 120
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 121
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 123
    :cond_15
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->removeView(Landroid/view/View;)V

    .line 126
    :cond_1a
    if-eqz p1, :cond_1f

    .line 127
    invoke-virtual {p0, p1}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->addView(Landroid/view/View;)V

    .line 129
    :cond_1f
    iput-object p1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    .line 130
    invoke-direct {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->tr()V

    .line 132
    :cond_24
    return-void
.end method

.method public setValue(F)V
    .registers 4

    .prologue
    .line 353
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-nez v0, :cond_5

    .line 354
    return-void

    .line 356
    :cond_5
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->getMeasuredHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 357
    return-void
.end method

.method public showOverflowMenu()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 135
    iget-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 136
    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qm:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq v0, v1, :cond_b

    sget-object v1, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Ql:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v1, :cond_d

    .line 137
    :cond_b
    const/4 v0, 0x0

    return v0

    .line 136
    :cond_d
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qg:Landroid/view/View;

    if-eqz v1, :cond_b

    .line 139
    iget-object v1, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->PZ:Landroid/view/View;

    iget-object v2, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qb:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 141
    invoke-direct {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->ts()Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;

    move-result-object v1

    .line 142
    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qj:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_34

    .line 143
    sget-object v0, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qm:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    iput-object v0, p0, Lcom/miui/internal/view/menu/PhoneActionMenuView;->Qf:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    .line 144
    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->show()V

    .line 149
    :cond_27
    :goto_27
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->postInvalidateOnAnimation()V

    .line 151
    invoke-virtual {p0, v3}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setFocusable(Z)V

    .line 152
    invoke-virtual {p0, v3}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->setFocusableInTouchMode(Z)V

    .line 153
    invoke-virtual {p0}, Lcom/miui/internal/view/menu/PhoneActionMenuView;->requestFocus()Z

    .line 154
    return v3

    .line 145
    :cond_34
    sget-object v2, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;->Qk:Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne v0, v2, :cond_27

    .line 146
    invoke-virtual {v1}, Lcom/miui/internal/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->tz()V

    goto :goto_27
.end method
