.class public abstract Landroid/support/v7/widget/RecyclerView$ViewHolder;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ViewHolder"
.end annotation


# static fields
.field static final FLAG_ADAPTER_FULLUPDATE:I = 0x400

.field static final FLAG_ADAPTER_POSITION_UNKNOWN:I = 0x200

.field static final FLAG_BOUND:I = 0x1

.field static final FLAG_CHANGED:I = 0x40

.field static final FLAG_IGNORE:I = 0x80

.field static final FLAG_INVALID:I = 0x4

.field static final FLAG_NOT_RECYCLABLE:I = 0x10

.field static final FLAG_REMOVED:I = 0x8

.field static final FLAG_RETURNED_FROM_SCRAP:I = 0x20

.field static final FLAG_TMP_DETACHED:I = 0x100

.field static final FLAG_UPDATE:I = 0x2

.field private static final FULLUPDATE_PAYLOADS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final itemView:Landroid/view/View;

.field private mFlags:I

.field private mIsRecyclableCount:I

.field mItemId:J

.field mItemViewType:I

.field mOldPosition:I

.field mOwnerRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field mPayloads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field mPosition:I

.field mPreLayoutPosition:I

.field private mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;

.field mShadowedHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

.field mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

.field mUnmodifiedPayloads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mWasImportantForAccessibilityBeforeHidden:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8273
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->FULLUPDATE_PAYLOADS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 7
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 8295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8188
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 8189
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    .line 8190
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mItemId:J

    .line 8191
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mItemViewType:I

    .line 8192
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    .line 8195
    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowedHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 8197
    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 8275
    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    .line 8276
    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mUnmodifiedPayloads:Ljava/util/List;

    .line 8278
    iput v4, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    .line 8282
    iput-object v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;

    .line 8286
    iput v4, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mWasImportantForAccessibilityBeforeHidden:I

    .line 8296
    if-eqz p1, :cond_25

    .line 8299
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 8300
    return-void

    .line 8297
    :cond_25
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "itemView may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$1000(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 8186
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->onEnteredHiddenState()V

    return-void
.end method

.method static synthetic access$1100(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 8186
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->onLeftHiddenState()V

    return-void
.end method

.method static synthetic access$4100(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 8186
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->doesTransientStatePreventRecycling()Z

    move-result v0

    return v0
.end method

.method static synthetic access$4202(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/support/v7/widget/RecyclerView$Recycler;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p1, "x1"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 8186
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;

    return-object p1
.end method

.method static synthetic access$5400(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 8186
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldBeKeptAsChild()Z

    move-result v0

    return v0
.end method

.method static synthetic access$5500(Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 8186
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    return v0
.end method

.method private createPayloadsIfNeeded()V
    .registers 2

    .prologue
    .line 8517
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    if-eqz v0, :cond_5

    .line 8521
    :goto_4
    return-void

    .line 8518
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    .line 8519
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mUnmodifiedPayloads:Ljava/util/List;

    goto :goto_4
.end method

.method private doesTransientStatePreventRecycling()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8652
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->hasTransientState(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method private onEnteredHiddenState()V
    .registers 3

    .prologue
    .line 8562
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mWasImportantForAccessibilityBeforeHidden:I

    .line 8564
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 8566
    return-void
.end method

.method private onLeftHiddenState()V
    .registers 3

    .prologue
    .line 8572
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mWasImportantForAccessibilityBeforeHidden:I

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 8574
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mWasImportantForAccessibilityBeforeHidden:I

    .line 8575
    return-void
.end method

.method private shouldBeKeptAsChild()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8644
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x10

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method


# virtual methods
.method addChangePayload(Ljava/lang/Object;)V
    .registers 3
    .param p1, "payload"    # Ljava/lang/Object;

    .prologue
    .line 8508
    if-eqz p1, :cond_9

    .line 8510
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_f

    .line 8514
    :goto_8
    return-void

    .line 8509
    :cond_9
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto :goto_8

    .line 8511
    :cond_f
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->createPayloadsIfNeeded()V

    .line 8512
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method addFlags(I)V
    .registers 3
    .param p1, "flags"    # I

    .prologue
    .line 8504
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    or-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8505
    return-void
.end method

.method clearOldPosition()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 8325
    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    .line 8326
    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    .line 8327
    return-void
.end method

.method clearPayload()V
    .registers 2

    .prologue
    .line 8524
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    if-nez v0, :cond_b

    .line 8527
    :goto_4
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v0, v0, -0x401

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8528
    return-void

    .line 8525
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_4
.end method

.method clearReturnedFromScrapFlag()V
    .registers 2

    .prologue
    .line 8452
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8453
    return-void
.end method

.method clearTmpDetachFlag()V
    .registers 2

    .prologue
    .line 8456
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v0, v0, -0x101

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8457
    return-void
.end method

.method flagRemovedAndOffsetPosition(IIZ)V
    .registers 5
    .param p1, "mNewPosition"    # I
    .param p2, "offset"    # I
    .param p3, "applyToPreLayout"    # Z

    .prologue
    .line 8303
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 8304
    invoke-virtual {p0, p2, p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    .line 8305
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 8306
    return-void
.end method

.method public final getAdapterPosition()I
    .registers 2

    .prologue
    .line 8401
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_b

    .line 8404
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v0, p0}, Landroid/support/v7/widget/RecyclerView;->access$4700(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v0

    return v0

    .line 8402
    :cond_b
    const/4 v0, -0x1

    return v0
.end method

.method public final getItemId()J
    .registers 3

    .prologue
    .line 8429
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mItemId:J

    return-wide v0
.end method

.method public final getItemViewType()I
    .registers 2

    .prologue
    .line 8436
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mItemViewType:I

    return v0
.end method

.method public final getLayoutPosition()I
    .registers 3

    .prologue
    .line 8375
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    :goto_7
    return v0

    :cond_8
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    goto :goto_7
.end method

.method public final getOldPosition()I
    .registers 2

    .prologue
    .line 8419
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    return v0
.end method

.method public final getPosition()I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 8349
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    :goto_7
    return v0

    :cond_8
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    goto :goto_7
.end method

.method getUnmodifiedPayloads()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 8531
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_9

    .line 8540
    sget-object v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->FULLUPDATE_PAYLOADS:Ljava/util/List;

    return-object v0

    .line 8532
    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    if-nez v0, :cond_10

    .line 8534
    :cond_d
    sget-object v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->FULLUPDATE_PAYLOADS:Ljava/util/List;

    return-object v0

    .line 8532
    :cond_10
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPayloads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_d

    .line 8537
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mUnmodifiedPayloads:Ljava/util/List;

    return-object v0
.end method

.method hasAnyOfTheFlags(I)Z
    .registers 4
    .param p1, "flags"    # I

    .prologue
    const/4 v0, 0x0

    .line 8488
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/2addr v1, p1

    if-nez v1, :cond_7

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x1

    goto :goto_6
.end method

.method isAdapterPositionUnknown()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8496
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v1, v1, 0x200

    if-eqz v1, :cond_9

    :cond_7
    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_8
.end method

.method isBound()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8480
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method isChanged()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8476
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x40

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method isInvalid()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8468
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public final isRecyclable()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8635
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->hasTransientState(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method isRemoved()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8484
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method isScrap()Z
    .registers 2

    .prologue
    .line 8440
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x1

    goto :goto_5
.end method

.method isTmpDetached()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8492
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v1, v1, 0x100

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method needsUpdate()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8472
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method offsetPosition(IZ)V
    .registers 5
    .param p1, "offset"    # I
    .param p2, "applyToPreLayout"    # Z

    .prologue
    const/4 v1, -0x1

    .line 8309
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    if-eq v0, v1, :cond_19

    .line 8312
    :goto_5
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    if-eq v0, v1, :cond_1e

    .line 8315
    :goto_9
    if-nez p2, :cond_23

    .line 8318
    :goto_b
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 8319
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_29

    .line 8322
    :goto_18
    return-void

    .line 8310
    :cond_19
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    goto :goto_5

    .line 8313
    :cond_1e
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    goto :goto_9

    .line 8316
    :cond_23
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    goto :goto_b

    .line 8320
    :cond_29
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    goto :goto_18
.end method

.method resetInternal()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 8545
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8546
    iput v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 8547
    iput v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    .line 8548
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mItemId:J

    .line 8549
    iput v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    .line 8550
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    .line 8551
    iput-object v4, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowedHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 8552
    iput-object v4, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 8553
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearPayload()V

    .line 8554
    iput v3, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mWasImportantForAccessibilityBeforeHidden:I

    .line 8555
    return-void
.end method

.method saveOldPosition()V
    .registers 3

    .prologue
    .line 8330
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    .line 8333
    :goto_5
    return-void

    .line 8331
    :cond_6
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    goto :goto_5
.end method

.method setFlags(II)V
    .registers 5
    .param p1, "flags"    # I
    .param p2, "mask"    # I

    .prologue
    .line 8500
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    xor-int/lit8 v1, p2, -0x1

    and-int/2addr v0, v1

    and-int v1, p1, p2

    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8501
    return-void
.end method

.method public final setIsRecyclable(Z)V
    .registers 4
    .param p1, "recyclable"    # Z

    .prologue
    const/4 v1, 0x0

    .line 8610
    if-nez p1, :cond_12

    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    add-int/lit8 v0, v0, 0x1

    :goto_7
    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    .line 8611
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    if-ltz v0, :cond_17

    .line 8619
    if-eqz p1, :cond_34

    .line 8621
    :cond_f
    if-nez p1, :cond_40

    .line 8627
    :cond_11
    :goto_11
    return-void

    .line 8610
    :cond_12
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    .line 8612
    :cond_17
    iput v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    .line 8617
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "isRecyclable decremented below 0: unmatched pair of setIsRecyable() calls for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "View"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11

    .line 8619
    :cond_34
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    .line 8620
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    goto :goto_11

    .line 8621
    :cond_40
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    if-nez v0, :cond_11

    .line 8622
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    goto :goto_11
.end method

.method setScrapContainer(Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 2
    .param p1, "recycler"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 8464
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;

    .line 8465
    return-void
.end method

.method shouldIgnore()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8336
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method stopIgnoring()V
    .registers 2

    .prologue
    .line 8460
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit16 v0, v0, -0x81

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    .line 8461
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 8579
    new-instance v0, Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ViewHolder{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " position="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mItemId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", oldPos="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOldPosition:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", pLpos:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8582
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v1

    if-nez v1, :cond_a4

    .line 8583
    :goto_5b
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v1

    if-nez v1, :cond_ab

    .line 8584
    :goto_61
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isBound()Z

    move-result v1

    if-eqz v1, :cond_b2

    .line 8585
    :goto_67
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->needsUpdate()Z

    move-result v1

    if-nez v1, :cond_b9

    .line 8586
    :goto_6d
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v1

    if-nez v1, :cond_c0

    .line 8587
    :goto_73
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v1

    if-nez v1, :cond_c7

    .line 8588
    :goto_79
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isChanged()Z

    move-result v1

    if-nez v1, :cond_ce

    .line 8589
    :goto_7f
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v1

    if-nez v1, :cond_d5

    .line 8590
    :goto_85
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRecyclable()Z

    move-result v1

    if-eqz v1, :cond_dc

    .line 8591
    :goto_8b
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isAdapterPositionUnknown()Z

    move-result v1

    if-nez v1, :cond_fd

    .line 8593
    :goto_91
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_104

    .line 8594
    :goto_99
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8595
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 8582
    :cond_a4
    const-string/jumbo v1, " scrap"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5b

    .line 8583
    :cond_ab
    const-string/jumbo v1, " invalid"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_61

    .line 8584
    :cond_b2
    const-string/jumbo v1, " unbound"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_67

    .line 8585
    :cond_b9
    const-string/jumbo v1, " update"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6d

    .line 8586
    :cond_c0
    const-string/jumbo v1, " removed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_73

    .line 8587
    :cond_c7
    const-string/jumbo v1, " ignored"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_79

    .line 8588
    :cond_ce
    const-string/jumbo v1, " changed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7f

    .line 8589
    :cond_d5
    const-string/jumbo v1, " tmpDetached"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_85

    .line 8590
    :cond_dc
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, " not recyclable("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mIsRecyclableCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8b

    .line 8591
    :cond_fd
    const-string/jumbo v1, "undefined adapter position"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_91

    .line 8593
    :cond_104
    const-string/jumbo v1, " no parent"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_99
.end method

.method unScrap()V
    .registers 2

    .prologue
    .line 8444
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->unscrapView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 8445
    return-void
.end method

.method wasReturnedFromScrap()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 8448
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mFlags:I

    and-int/lit8 v1, v1, 0x20

    if-nez v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method
