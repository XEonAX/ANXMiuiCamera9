.class Landroid/support/v7/util/AsyncListUtil$2;
.super Ljava/lang/Object;
.source "AsyncListUtil.java"

# interfaces
.implements Landroid/support/v7/util/ThreadUtil$BackgroundCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/AsyncListUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/support/v7/util/ThreadUtil$BackgroundCallback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mFirstRequiredTileStart:I

.field private mGeneration:I

.field private mItemCount:I

.field private mLastRequiredTileStart:I

.field final mLoadedTiles:Landroid/util/SparseBooleanArray;

.field private mRecycledRoot:Landroid/support/v7/util/TileList$Tile;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/TileList$Tile",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/support/v7/util/AsyncListUtil;


# direct methods
.method constructor <init>(Landroid/support/v7/util/AsyncListUtil;)V
    .registers 3

    .prologue
    .line 290
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    iput-object p1, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method private acquireTile()Landroid/support/v7/util/TileList$Tile;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/util/TileList$Tile",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 388
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mRecycledRoot:Landroid/support/v7/util/TileList$Tile;

    if-nez v1, :cond_12

    .line 393
    new-instance v1, Landroid/support/v7/util/TileList$Tile;

    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v2, v2, Landroid/support/v7/util/AsyncListUtil;->mTClass:Ljava/lang/Class;

    iget-object v3, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget v3, v3, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    invoke-direct {v1, v2, v3}, Landroid/support/v7/util/TileList$Tile;-><init>(Ljava/lang/Class;I)V

    return-object v1

    .line 389
    :cond_12
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mRecycledRoot:Landroid/support/v7/util/TileList$Tile;

    .line 390
    .local v0, "result":Landroid/support/v7/util/TileList$Tile;, "Landroid/support/v7/util/TileList$Tile<TT;>;"
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mRecycledRoot:Landroid/support/v7/util/TileList$Tile;

    iget-object v1, v1, Landroid/support/v7/util/TileList$Tile;->mNext:Landroid/support/v7/util/TileList$Tile;

    iput-object v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mRecycledRoot:Landroid/support/v7/util/TileList$Tile;

    .line 391
    return-object v0
.end method

.method private addTile(Landroid/support/v7/util/TileList$Tile;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/util/TileList$Tile",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 401
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    .local p1, "tile":Landroid/support/v7/util/TileList$Tile;, "Landroid/support/v7/util/TileList$Tile<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    iget v1, p1, Landroid/support/v7/util/TileList$Tile;->mStartPosition:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 402
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v0, v0, Landroid/support/v7/util/AsyncListUtil;->mMainThreadProxy:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    iget v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mGeneration:I

    invoke-interface {v0, v1, p1}, Landroid/support/v7/util/ThreadUtil$MainThreadCallback;->addTile(ILandroid/support/v7/util/TileList$Tile;)V

    .line 406
    return-void
.end method

.method private flushTileCache(I)V
    .registers 10
    .param p1, "scrollHint"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    const/4 v7, 0x0

    .line 417
    iget-object v5, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v5, v5, Landroid/support/v7/util/AsyncListUtil;->mDataCallback:Landroid/support/v7/util/AsyncListUtil$DataCallback;

    invoke-virtual {v5}, Landroid/support/v7/util/AsyncListUtil$DataCallback;->getMaxCachedTiles()I

    move-result v0

    .line 418
    .local v0, "cacheSizeLimit":I
    :goto_9
    iget-object v5, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v5}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    if-ge v5, v0, :cond_12

    .line 434
    return-void

    .line 419
    :cond_12
    iget-object v5, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v5, v7}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    .line 420
    .local v2, "firstLoadedTileStart":I
    iget-object v5, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    iget-object v6, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v6}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    .line 421
    .local v3, "lastLoadedTileStart":I
    iget v5, p0, Landroid/support/v7/util/AsyncListUtil$2;->mFirstRequiredTileStart:I

    sub-int v4, v5, v2

    .line 422
    .local v4, "startMargin":I
    iget v5, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLastRequiredTileStart:I

    sub-int v1, v3, v5

    .line 423
    .local v1, "endMargin":I
    if-gtz v4, :cond_33

    .line 426
    :goto_30
    if-gtz v1, :cond_3d

    .line 431
    :goto_32
    return-void

    .line 423
    :cond_33
    if-lt v4, v1, :cond_39

    .line 425
    :cond_35
    invoke-direct {p0, v2}, Landroid/support/v7/util/AsyncListUtil$2;->removeTile(I)V

    goto :goto_9

    .line 423
    :cond_39
    const/4 v5, 0x2

    if-eq p1, v5, :cond_35

    goto :goto_30

    .line 426
    :cond_3d
    if-ge v4, v1, :cond_43

    .line 428
    :cond_3f
    invoke-direct {p0, v3}, Landroid/support/v7/util/AsyncListUtil$2;->removeTile(I)V

    goto :goto_9

    .line 426
    :cond_43
    const/4 v5, 0x1

    if-eq p1, v5, :cond_3f

    goto :goto_32
.end method

.method private getTileStart(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 346
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget v0, v0, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    rem-int v0, p1, v0

    sub-int v0, p1, v0

    return v0
.end method

.method private isTileLoaded(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 397
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    return v0
.end method

.method private varargs log(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 437
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[BKGR] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "AsyncListUtil"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    return-void
.end method

.method private removeTile(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 409
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    .line 410
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v0, v0, Landroid/support/v7/util/AsyncListUtil;->mMainThreadProxy:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    iget v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mGeneration:I

    invoke-interface {v0, v1, p1}, Landroid/support/v7/util/ThreadUtil$MainThreadCallback;->removeTile(II)V

    .line 414
    return-void
.end method

.method private requestTiles(IIIZ)V
    .registers 8
    .param p1, "firstTileStart"    # I
    .param p2, "lastTileStart"    # I
    .param p3, "scrollHint"    # I
    .param p4, "backwards"    # Z

    .prologue
    .line 351
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-le v0, p2, :cond_4

    .line 358
    return-void

    .line 352
    :cond_4
    if-nez p4, :cond_14

    move v1, v0

    .line 356
    .local v1, "tileStart":I
    :goto_7
    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v2, v2, Landroid/support/v7/util/AsyncListUtil;->mBackgroundProxy:Landroid/support/v7/util/ThreadUtil$BackgroundCallback;

    invoke-interface {v2, v1, p3}, Landroid/support/v7/util/ThreadUtil$BackgroundCallback;->loadTile(II)V

    .line 351
    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget v2, v2, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    add-int/2addr v0, v2

    goto :goto_1

    .line 352
    .end local v1    # "tileStart":I
    :cond_14
    add-int v2, p2, p1

    sub-int v1, v2, v0

    goto :goto_7
.end method


# virtual methods
.method public loadTile(II)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "scrollHint"    # I

    .prologue
    .line 362
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    invoke-direct {p0, p1}, Landroid/support/v7/util/AsyncListUtil$2;->isTileLoaded(I)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 368
    invoke-direct {p0}, Landroid/support/v7/util/AsyncListUtil$2;->acquireTile()Landroid/support/v7/util/TileList$Tile;

    move-result-object v0

    .line 369
    .local v0, "tile":Landroid/support/v7/util/TileList$Tile;, "Landroid/support/v7/util/TileList$Tile<TT;>;"
    iput p1, v0, Landroid/support/v7/util/TileList$Tile;->mStartPosition:I

    .line 370
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget v1, v1, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    iget v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mItemCount:I

    iget v3, v0, Landroid/support/v7/util/TileList$Tile;->mStartPosition:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Landroid/support/v7/util/TileList$Tile;->mItemCount:I

    .line 371
    iget-object v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v1, v1, Landroid/support/v7/util/AsyncListUtil;->mDataCallback:Landroid/support/v7/util/AsyncListUtil$DataCallback;

    iget-object v2, v0, Landroid/support/v7/util/TileList$Tile;->mItems:[Ljava/lang/Object;

    iget v3, v0, Landroid/support/v7/util/TileList$Tile;->mStartPosition:I

    iget v4, v0, Landroid/support/v7/util/TileList$Tile;->mItemCount:I

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v7/util/AsyncListUtil$DataCallback;->fillData([Ljava/lang/Object;II)V

    .line 372
    invoke-direct {p0, p2}, Landroid/support/v7/util/AsyncListUtil$2;->flushTileCache(I)V

    .line 373
    invoke-direct {p0, v0}, Landroid/support/v7/util/AsyncListUtil$2;->addTile(Landroid/support/v7/util/TileList$Tile;)V

    .line 374
    return-void

    .line 366
    .end local v0    # "tile":Landroid/support/v7/util/TileList$Tile;, "Landroid/support/v7/util/TileList$Tile<TT;>;"
    :cond_2f
    return-void
.end method

.method public recycleTile(Landroid/support/v7/util/TileList$Tile;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/util/TileList$Tile",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 381
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    .local p1, "tile":Landroid/support/v7/util/TileList$Tile;, "Landroid/support/v7/util/TileList$Tile<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v0, v0, Landroid/support/v7/util/AsyncListUtil;->mDataCallback:Landroid/support/v7/util/AsyncListUtil$DataCallback;

    iget-object v1, p1, Landroid/support/v7/util/TileList$Tile;->mItems:[Ljava/lang/Object;

    iget v2, p1, Landroid/support/v7/util/TileList$Tile;->mItemCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/AsyncListUtil$DataCallback;->recycleData([Ljava/lang/Object;I)V

    .line 383
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mRecycledRoot:Landroid/support/v7/util/TileList$Tile;

    iput-object v0, p1, Landroid/support/v7/util/TileList$Tile;->mNext:Landroid/support/v7/util/TileList$Tile;

    .line 384
    iput-object p1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mRecycledRoot:Landroid/support/v7/util/TileList$Tile;

    .line 385
    return-void
.end method

.method public refresh(I)V
    .registers 5
    .param p1, "generation"    # I

    .prologue
    .line 304
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    iput p1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mGeneration:I

    .line 305
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLoadedTiles:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    .line 306
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v0, v0, Landroid/support/v7/util/AsyncListUtil;->mDataCallback:Landroid/support/v7/util/AsyncListUtil$DataCallback;

    invoke-virtual {v0}, Landroid/support/v7/util/AsyncListUtil$DataCallback;->refreshData()I

    move-result v0

    iput v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->mItemCount:I

    .line 307
    iget-object v0, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget-object v0, v0, Landroid/support/v7/util/AsyncListUtil;->mMainThreadProxy:Landroid/support/v7/util/ThreadUtil$MainThreadCallback;

    iget v1, p0, Landroid/support/v7/util/AsyncListUtil$2;->mGeneration:I

    iget v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mItemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/util/ThreadUtil$MainThreadCallback;->updateItemCount(II)V

    .line 308
    return-void
.end method

.method public updateRange(IIIII)V
    .registers 12
    .param p1, "rangeStart"    # I
    .param p2, "rangeEnd"    # I
    .param p3, "extRangeStart"    # I
    .param p4, "extRangeEnd"    # I
    .param p5, "scrollHint"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/AsyncListUtil$2;, "Landroid/support/v7/util/AsyncListUtil.2;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 318
    if-gt p1, p2, :cond_2b

    .line 322
    invoke-direct {p0, p1}, Landroid/support/v7/util/AsyncListUtil$2;->getTileStart(I)I

    move-result v0

    .line 323
    .local v0, "firstVisibleTileStart":I
    invoke-direct {p0, p2}, Landroid/support/v7/util/AsyncListUtil$2;->getTileStart(I)I

    move-result v1

    .line 325
    .local v1, "lastVisibleTileStart":I
    invoke-direct {p0, p3}, Landroid/support/v7/util/AsyncListUtil$2;->getTileStart(I)I

    move-result v2

    iput v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mFirstRequiredTileStart:I

    .line 326
    invoke-direct {p0, p4}, Landroid/support/v7/util/AsyncListUtil$2;->getTileStart(I)I

    move-result v2

    iput v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLastRequiredTileStart:I

    .line 334
    if-eq p5, v4, :cond_2c

    .line 339
    iget v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLastRequiredTileStart:I

    invoke-direct {p0, v0, v2, p5, v5}, Landroid/support/v7/util/AsyncListUtil$2;->requestTiles(IIIZ)V

    .line 340
    iget v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mFirstRequiredTileStart:I

    iget-object v3, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget v3, v3, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    sub-int v3, v0, v3

    invoke-direct {p0, v2, v3, p5, v4}, Landroid/support/v7/util/AsyncListUtil$2;->requestTiles(IIIZ)V

    .line 343
    :goto_2a
    return-void

    .line 319
    .end local v0    # "firstVisibleTileStart":I
    .end local v1    # "lastVisibleTileStart":I
    :cond_2b
    return-void

    .line 335
    .restart local v0    # "firstVisibleTileStart":I
    .restart local v1    # "lastVisibleTileStart":I
    :cond_2c
    iget v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->mFirstRequiredTileStart:I

    invoke-direct {p0, v2, v1, p5, v4}, Landroid/support/v7/util/AsyncListUtil$2;->requestTiles(IIIZ)V

    .line 336
    iget-object v2, p0, Landroid/support/v7/util/AsyncListUtil$2;->this$0:Landroid/support/v7/util/AsyncListUtil;

    iget v2, v2, Landroid/support/v7/util/AsyncListUtil;->mTileSize:I

    add-int/2addr v2, v1

    iget v3, p0, Landroid/support/v7/util/AsyncListUtil$2;->mLastRequiredTileStart:I

    invoke-direct {p0, v2, v3, p5, v5}, Landroid/support/v7/util/AsyncListUtil$2;->requestTiles(IIIZ)V

    goto :goto_2a
.end method
