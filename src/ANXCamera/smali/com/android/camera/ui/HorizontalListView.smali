.class public Lcom/android/camera/ui/HorizontalListView;
.super Landroid/widget/AdapterView;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/HorizontalListView$1;,
        Lcom/android/camera/ui/HorizontalListView$2;,
        Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView",
        "<",
        "Landroid/widget/ListAdapter;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mAdapter:Landroid/widget/ListAdapter;

.field private mBlockNotification:Z

.field protected mCurrentX:I

.field private mDataChanged:Z

.field private mDataObserver:Landroid/database/DataSetObserver;

.field private mDisplayOffset:I

.field private mGesture:Landroid/view/GestureDetector;

.field private mIsScrollingPerformed:Z

.field private mItemWidth:I

.field private mLastSelectImageListItem:Landroid/view/View;

.field private mLeftViewIndex:I

.field private mMaxX:I

.field protected mNextX:I

.field private mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

.field private mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

.field private mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

.field private mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

.field private mPaddingWidth:I

.field private mPresetWidth:I

.field private mPreviousSelectViewIndex:I

.field private mRemovedViewQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mRightViewIndex:I

.field protected mScroller:Landroid/widget/Scroller;

.field private mSelectCenter:Z

.field private mSelectViewIndex:I

.field private mTouchDown:Z

.field private mTouchMoveEnable:Z


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/HorizontalListView;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    return p1
.end method

.method static synthetic -set1(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    return p1
.end method

.method static synthetic -set2(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/ui/HorizontalListView;I)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;
    .param p1, "viewIndex"    # I

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/ui/HorizontalListView;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->reset()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/HorizontalListView;->TAG:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 64
    invoke-direct {p0, p1, p2}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 30
    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 33
    const v0, 0x7fffffff

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 34
    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 38
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    .line 43
    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    .line 44
    const/16 v0, 0xb4

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    .line 45
    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    .line 46
    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    .line 48
    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    .line 49
    iput-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    .line 53
    iput-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    .line 126
    new-instance v0, Lcom/android/camera/ui/HorizontalListView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/HorizontalListView$1;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    .line 521
    new-instance v0, Lcom/android/camera/ui/HorizontalListView$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/HorizontalListView$2;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

    .line 65
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    .line 66
    return-void
.end method

.method private addAndMeasureChild(Landroid/view/View;I)V
    .locals 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "viewPos"    # I

    .prologue
    const/4 v1, -0x1

    const/high16 v3, -0x80000000

    .line 224
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 225
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    if-nez v0, :cond_0

    .line 226
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .end local v0    # "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 229
    .restart local v0    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/camera/ui/HorizontalListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 230
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v1

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 231
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getHeight()I

    move-result v2

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 230
    invoke-virtual {p1, v1, v2}, Landroid/view/View;->measure(II)V

    .line 232
    return-void
.end method

.method private cacheChildItem(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 403
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 404
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 406
    :cond_0
    return-void
.end method

.method private fillList(I)V
    .locals 3
    .param p1, "dx"    # I

    .prologue
    .line 304
    const/4 v1, 0x0

    .line 305
    .local v1, "edge":I
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 306
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v1

    .line 309
    :cond_0
    invoke-direct {p0, v1, p1}, Lcom/android/camera/ui/HorizontalListView;->fillListRight(II)V

    .line 311
    const/4 v1, 0x0

    .line 312
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 313
    if-eqz v0, :cond_1

    .line 314
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 316
    :cond_1
    invoke-direct {p0, v1, p1}, Lcom/android/camera/ui/HorizontalListView;->fillListLeft(II)V

    .line 317
    return-void
.end method

.method private fillListLeft(II)V
    .locals 5
    .param p1, "leftEdge"    # I
    .param p2, "dx"    # I

    .prologue
    const/4 v4, 0x0

    .line 358
    :goto_0
    add-int v2, p1, p2

    if-lez v2, :cond_1

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-ltz v2, :cond_1

    .line 359
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    invoke-direct {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v1

    .line 360
    .local v1, "dataIndex":I
    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v3, v1, v2, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 361
    .local v0, "child":Landroid/view/View;
    iget-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-nez v2, :cond_0

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v2, v3, :cond_0

    .line 362
    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 363
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    .line 367
    :goto_1
    invoke-direct {p0, v0, v4}, Lcom/android/camera/ui/HorizontalListView;->addAndMeasureChild(Landroid/view/View;I)V

    .line 368
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v2

    sub-int/2addr p1, v2

    .line 369
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 370
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    goto :goto_0

    .line 365
    :cond_0
    invoke-virtual {v0, v4}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    .line 372
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "dataIndex":I
    :cond_1
    return-void
.end method

.method private fillListRight(II)V
    .locals 6
    .param p1, "rightEdge"    # I
    .param p2, "dx"    # I

    .prologue
    const/4 v5, 0x0

    .line 320
    :goto_0
    add-int v2, p1, p2

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v3

    if-ge v2, v3, :cond_3

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 321
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    invoke-direct {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v1

    .line 322
    .local v1, "dataIndex":I
    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v3, v1, v2, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 323
    .local v0, "child":Landroid/view/View;
    iget-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-nez v2, :cond_2

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v2, v3, :cond_2

    .line 324
    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 325
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    .line 329
    :goto_1
    const/4 v2, -0x1

    invoke-direct {p0, v0, v2}, Lcom/android/camera/ui/HorizontalListView;->addAndMeasureChild(Landroid/view/View;I)V

    .line 330
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v2

    add-int/2addr p1, v2

    .line 332
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_0

    .line 333
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v4}, Landroid/widget/ListAdapter;->getCount()I

    move-result v4

    mul-int/2addr v3, v4

    add-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 336
    :cond_0
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-gez v2, :cond_1

    .line 337
    iput v5, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 339
    :cond_1
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    goto :goto_0

    .line 327
    :cond_2
    invoke-virtual {v0, v5}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    .line 341
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "dataIndex":I
    :cond_3
    return-void
.end method

.method private getChildWidth()I
    .locals 1

    .prologue
    .line 518
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    return v0
.end method

.method private declared-synchronized initView()V
    .locals 5

    .prologue
    monitor-enter p0

    .line 81
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 82
    .local v1, "wm":Landroid/view/WindowManager;
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 83
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 84
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    .line 86
    const/4 v2, -0x1

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 87
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 88
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    .line 89
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 90
    const v2, 0x7fffffff

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 91
    iget-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v2, :cond_1

    .line 92
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    .line 93
    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 97
    :goto_0
    new-instance v2, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    .line 98
    new-instance v2, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView;->mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v2, v3, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mGesture:Landroid/view/GestureDetector;

    .line 99
    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 100
    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setActivated(Z)V

    .line 101
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 103
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ActivityBase;

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Lcom/android/camera/ActivityBase;->loadCameraSound(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 104
    return-void

    .line 95
    :cond_1
    const/4 v2, 0x0

    :try_start_1
    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "dm":Landroid/util/DisplayMetrics;
    .end local v1    # "wm":Landroid/view/WindowManager;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private justify()V
    .locals 6

    .prologue
    .line 200
    const/4 v2, 0x1

    .line 201
    .local v2, "scroll":Z
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le v3, v4, :cond_0

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-ge v3, v4, :cond_0

    .line 202
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v3}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 203
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    const/16 v4, 0xa

    if-le v3, v4, :cond_1

    const/4 v2, 0x1

    .line 206
    .end local v0    # "child":Landroid/view/View;
    :cond_0
    :goto_0
    if-nez v2, :cond_2

    return-void

    .line 203
    .restart local v0    # "child":Landroid/view/View;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 208
    .end local v0    # "child":Landroid/view/View;
    :cond_2
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget v5, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v4, v4, 0x2

    sub-int v1, v3, v4

    .line 209
    .local v1, "distance":I
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    mul-int/lit8 v3, v3, 0x2

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget-object v5, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v5}, Landroid/widget/ListAdapter;->getCount()I

    move-result v5

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 210
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-le v1, v3, :cond_3

    .line 211
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    .line 213
    :cond_3
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    if-eq v1, v3, :cond_4

    .line 214
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isShown()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 215
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->scrollTo(I)V

    .line 221
    :cond_4
    :goto_1
    return-void

    .line 217
    :cond_5
    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 218
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    goto :goto_1
.end method

.method private loadItems()V
    .locals 2

    .prologue
    .line 434
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 435
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    .line 434
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 437
    :cond_0
    return-void
.end method

.method private notifyItemSelect(Landroid/view/View;IJ)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "id"    # J

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 488
    if-nez p1, :cond_0

    .line 489
    return-void

    .line 491
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    if-nez v0, :cond_5

    .line 492
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_1

    .line 493
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 495
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_2

    .line 496
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 499
    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 500
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setActivated(Z)V

    .line 502
    :cond_3
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 503
    invoke-virtual {p1, v7}, Landroid/view/View;->setActivated(Z)V

    .line 515
    :cond_4
    :goto_0
    return-void

    .line 507
    :cond_5
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v0

    if-ne p2, v0, :cond_4

    .line 508
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz v0, :cond_6

    .line 509
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setActivated(Z)V

    .line 511
    :cond_6
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    .line 512
    invoke-virtual {p1, v7}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0
.end method

.method private positionItems(I)V
    .locals 13
    .param p1, "dx"    # I

    .prologue
    const/4 v12, 0x0

    .line 409
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v9

    if-lez v9, :cond_2

    .line 410
    iget v9, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    add-int/2addr v9, p1

    iput v9, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 411
    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 412
    .local v7, "left":I
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v3

    .line 413
    .local v3, "childWidth":I
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getHeight()I

    move-result v2

    .line 414
    .local v2, "childHeight":I
    iget v9, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v0, v9, 0x2

    .line 415
    .local v0, "center":I
    iget v9, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    add-int/lit8 v6, v9, 0x1

    .line 416
    .local v6, "index":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v9

    if-ge v5, v9, :cond_2

    .line 417
    invoke-virtual {p0, v5}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 418
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v9

    if-ge v9, v0, :cond_1

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v9

    if-le v9, v0, :cond_1

    const/4 v8, 0x1

    .line 419
    .local v8, "oldCenter":Z
    :goto_1
    add-int v9, v7, v3

    invoke-virtual {v1, v7, v12, v9, v2}, Landroid/view/View;->layout(IIII)V

    .line 421
    iget-boolean v9, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v9, :cond_0

    .line 422
    if-ge v7, v0, :cond_0

    add-int v9, v7, v3

    if-le v9, v0, :cond_0

    xor-int/lit8 v9, v8, 0x1

    if-eqz v9, :cond_0

    .line 423
    invoke-direct {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v4

    .line 424
    .local v4, "dataIndex":I
    iget-object v9, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v9, v4}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v10

    invoke-direct {p0, v1, v4, v10, v11}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    .line 427
    .end local v4    # "dataIndex":I
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 428
    add-int/2addr v7, v3

    .line 416
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 418
    .end local v8    # "oldCenter":Z
    :cond_1
    const/4 v8, 0x0

    .restart local v8    # "oldCenter":Z
    goto :goto_1

    .line 431
    .end local v0    # "center":I
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childHeight":I
    .end local v3    # "childWidth":I
    .end local v5    # "i":I
    .end local v6    # "index":I
    .end local v7    # "left":I
    .end local v8    # "oldCenter":Z
    :cond_2
    return-void
.end method

.method private removeNonVisibleItems(I)V
    .locals 5
    .param p1, "dx"    # I

    .prologue
    const/4 v3, 0x0

    .line 375
    invoke-virtual {p0, v3}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 376
    .local v0, "child":Landroid/view/View;
    const/4 v2, 0x0

    .local v2, "start":I
    const/4 v1, 0x0

    .line 377
    .local v1, "end":I
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v3

    add-int/2addr v3, p1

    if-gtz v3, :cond_0

    .line 378
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    .line 379
    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->cacheChildItem(Landroid/view/View;)V

    .line 380
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    .line 381
    add-int/lit8 v1, v1, 0x1

    .line 382
    invoke-virtual {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 384
    :cond_0
    if-lez v1, :cond_1

    .line 385
    add-int/lit8 v3, v1, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/ui/HorizontalListView;->removeViewsInLayout(II)V

    .line 388
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 389
    move v2, v1

    .line 390
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v3}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 391
    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int/2addr v3, p1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v4

    if-lt v3, v4, :cond_2

    .line 392
    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->cacheChildItem(Landroid/view/View;)V

    .line 393
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    .line 394
    add-int/lit8 v2, v2, -0x1

    .line 395
    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_1

    .line 397
    :cond_2
    if-le v1, v2, :cond_3

    .line 398
    add-int/lit8 v3, v2, 0x1

    sub-int v4, v1, v2

    invoke-virtual {p0, v3, v4}, Lcom/android/camera/ui/HorizontalListView;->removeViewsInLayout(II)V

    .line 400
    :cond_3
    return-void
.end method

.method private declared-synchronized reset()V
    .locals 1

    .prologue
    monitor-enter p0

    .line 171
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    .line 172
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->removeAllViewsInLayout()V

    .line 173
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 174
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private toDataIndex(I)I
    .locals 1
    .param p1, "viewIndex"    # I

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 345
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int/2addr v0, p1

    return v0

    .line 347
    :cond_0
    return p1
.end method

.method private toViewIndex(I)I
    .locals 1
    .param p1, "dataIndex"    # I

    .prologue
    .line 351
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int/2addr v0, p1

    return v0

    .line 354
    :cond_0
    return p1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x0

    .line 447
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 448
    return v2

    .line 450
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/AdapterView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 451
    .local v0, "handled":Z
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mGesture:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 452
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 466
    :goto_0
    :pswitch_0
    return v0

    .line 454
    :pswitch_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    .line 455
    iput-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    goto :goto_0

    .line 459
    :pswitch_2
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 460
    iput-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    .line 461
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    .line 463
    :cond_1
    iput-boolean v2, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    goto :goto_0

    .line 452
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x0

    return-object v0
.end method

.method public isScrolling()Z
    .locals 1

    .prologue
    .line 484
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    return v0
.end method

.method public isTouchMoveEnable()Z
    .locals 1

    .prologue
    .line 605
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    return v0
.end method

.method protected onDown(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 479
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 480
    return v1
.end method

.method protected onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 9
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 470
    monitor-enter p0

    .line 471
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    neg-float v2, p3

    float-to-int v3, v2

    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 473
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    .line 475
    const/4 v0, 0x1

    return v0

    .line 470
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized onLayout(ZIIII)V
    .locals 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    monitor-enter p0

    .line 236
    :try_start_0
    invoke-super/range {p0 .. p5}, Landroid/widget/AdapterView;->onLayout(ZIIII)V

    .line 238
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_0

    monitor-exit p0

    .line 239
    return-void

    .line 242
    :cond_0
    const/4 v1, 0x0

    .line 243
    .local v1, "dataChanged":Z
    :try_start_1
    iget-boolean v6, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    if-eqz v6, :cond_1

    .line 244
    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    .line 245
    .local v4, "oldCurrentX":I
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    .line 246
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->removeAllViewsInLayout()V

    .line 247
    iput v4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 248
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    .line 249
    const/4 v1, 0x1

    .line 252
    .end local v4    # "oldCurrentX":I
    :cond_1
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 253
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->getCurrX()I

    move-result v5

    .line 254
    .local v5, "scrollx":I
    iput v5, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 257
    .end local v5    # "scrollx":I
    :cond_2
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    if-gtz v6, :cond_3

    .line 258
    const/4 v6, 0x0

    iput v6, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 259
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 261
    :cond_3
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-lt v6, v7, :cond_4

    .line 262
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    iput v6, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    .line 263
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 266
    :cond_4
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    sub-int v3, v6, v7

    .line 267
    .local v3, "dx":I
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iput v6, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    .line 268
    invoke-direct {p0, v3}, Lcom/android/camera/ui/HorizontalListView;->removeNonVisibleItems(I)V

    .line 269
    invoke-direct {p0, v3}, Lcom/android/camera/ui/HorizontalListView;->fillList(I)V

    .line 270
    invoke-direct {p0, v3}, Lcom/android/camera/ui/HorizontalListView;->positionItems(I)V

    .line 272
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->isFinished()Z

    move-result v6

    if-eqz v6, :cond_5

    if-eqz v1, :cond_7

    .line 273
    :cond_5
    new-instance v6, Lcom/android/camera/ui/HorizontalListView$3;

    invoke-direct {v6, p0}, Lcom/android/camera/ui/HorizontalListView$3;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    invoke-virtual {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_6
    :goto_0
    monitor-exit p0

    .line 301
    return-void

    .line 280
    :cond_7
    :try_start_2
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->loadItems()V

    .line 281
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v6}, Landroid/widget/Scroller;->isFinished()Z

    move-result v6

    if-eqz v6, :cond_6

    iget-boolean v6, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    xor-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_6

    .line 282
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    .line 283
    iget-boolean v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v6, :cond_8

    .line 284
    new-instance v6, Lcom/android/camera/ui/HorizontalListView$4;

    invoke-direct {v6, p0}, Lcom/android/camera/ui/HorizontalListView$4;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    invoke-virtual {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->post(Ljava/lang/Runnable;)Z

    .line 291
    :cond_8
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    if-eq v6, v7, :cond_6

    .line 292
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le v6, v7, :cond_9

    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-gt v6, v7, :cond_9

    .line 293
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-direct {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v2

    .line 294
    .local v2, "dataIndex":I
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 295
    .local v0, "child":Landroid/view/View;
    iget-object v6, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v6, v2}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v6

    invoke-direct {p0, v0, v2, v6, v7}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    .line 297
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "dataIndex":I
    :cond_9
    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput v6, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .end local v1    # "dataChanged":Z
    .end local v3    # "dx":I
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6
.end method

.method public declared-synchronized scrollTo(I)V
    .locals 5
    .param p1, "x"    # I

    .prologue
    monitor-enter p0

    .line 440
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    .line 441
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    sub-int v2, p1, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/widget/Scroller;->startScroll(IIII)V

    .line 442
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 443
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .prologue
    .line 157
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 161
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 164
    :cond_0
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 165
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 167
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->reset()V

    .line 168
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    .line 114
    return-void
.end method

.method public setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemLongClickListener;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

    .line 119
    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemSelectedListener;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 109
    return-void
.end method

.method public setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    .line 124
    return-void
.end method

.method public setSelection(I)V
    .locals 6
    .param p1, "position"    # I

    .prologue
    .line 178
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toViewIndex(I)I

    move-result p1

    .line 179
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v3, p1, :cond_0

    return-void

    .line 180
    :cond_0
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    .line 181
    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    .line 182
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isShown()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 183
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/android/camera/ActivityBase;

    const/4 v4, 0x6

    invoke-virtual {v3, v4}, Lcom/android/camera/ActivityBase;->playCameraSound(I)V

    .line 186
    :cond_1
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le p1, v3, :cond_2

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-ge p1, v3, :cond_2

    .line 187
    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int v3, p1, v3

    add-int/lit8 v2, v3, -0x1

    .line 188
    .local v2, "viewIndex":I
    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 189
    .local v0, "child":Landroid/view/View;
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v1

    .line 190
    .local v1, "dataIndex":I
    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3, v1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    invoke-direct {p0, v0, v1, v4, v5}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    .line 193
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "dataIndex":I
    .end local v2    # "viewIndex":I
    :cond_2
    iget-boolean v3, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    if-nez v3, :cond_3

    .line 194
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    .line 196
    :cond_3
    return-void
.end method
