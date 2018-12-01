.class public Lcom/android/camera/fragment/FragmentFilter;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;,
        Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;,
        Lcom/android/camera/fragment/FragmentFilter$EffectItemPadding;,
        Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isAnimation:Z

.field private mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mCurrentIndex:I

.field private mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

.field private mEffectItemHolderList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mHolderWidth:I

.field private mIgnoreSameItemClick:Z

.field private mIsShowIndex:I

.field private mLastIndex:I

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I


# direct methods
.method static synthetic -get0(Lcom/android/camera/fragment/FragmentFilter;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;

    .prologue
    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    return v0
.end method

.method static synthetic -get1(Lcom/android/camera/fragment/FragmentFilter;)Lmiui/view/animation/CubicEaseOutInterpolator;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/fragment/FragmentFilter;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    return v0
.end method

.method static synthetic -get3(Lcom/android/camera/fragment/FragmentFilter;)Ljava/util/List;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;

    .prologue
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemHolderList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/camera/fragment/FragmentFilter;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;

    .prologue
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLastIndex:I

    return v0
.end method

.method static synthetic -set0(Lcom/android/camera/fragment/FragmentFilter;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    return p1
.end method

.method static synthetic -wrap0(Lcom/android/camera/fragment/FragmentFilter;Landroid/widget/ImageView;I)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/fragment/FragmentFilter;
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "resourceId"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentFilter;->showSelected(Landroid/widget/ImageView;I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    const-class v0, Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/FragmentFilter;->TAG:Ljava/lang/String;

    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 52
    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    .line 64
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemHolderList:Ljava/util/List;

    .line 66
    iput v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mLastIndex:I

    .line 67
    iput v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mIgnoreSameItemClick:Z

    .line 70
    iput v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mIsShowIndex:I

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    .line 52
    return-void
.end method

.method private getFilterInfo()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    .line 126
    .local v1, "config":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v3

    .line 127
    .local v3, "mode":I
    sparse-switch v3, :sswitch_data_0

    .line 129
    const/4 v0, 0x1

    .line 149
    .local v0, "category":I
    :goto_0
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/android/camera/effect/EffectController;->getFilterInfo(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 150
    .local v2, "filterInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    return-object v2

    .line 133
    .end local v0    # "category":I
    .end local v2    # "filterInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    :sswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 134
    const/4 v0, 0x2

    .restart local v0    # "category":I
    goto :goto_0

    .line 136
    .end local v0    # "category":I
    :cond_0
    const/4 v0, 0x1

    .restart local v0    # "category":I
    goto :goto_0

    .line 142
    .end local v0    # "category":I
    :sswitch_1
    const/4 v0, 0x2

    .line 143
    .restart local v0    # "category":I
    goto :goto_0

    .line 145
    .end local v0    # "category":I
    :sswitch_2
    const/4 v0, 0x3

    .line 146
    .restart local v0    # "category":I
    goto :goto_0

    .line 127
    nop

    :sswitch_data_0
    .sparse-switch
        0xa1 -> :sswitch_2
        0xa3 -> :sswitch_0
        0xa5 -> :sswitch_0
        0xab -> :sswitch_1
    .end sparse-switch
.end method

.method private notifyItemChanged(II)V
    .locals 2
    .param p1, "oldIndex"    # I
    .param p2, "newIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 220
    if-le p1, v1, :cond_0

    .line 221
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->notifyItemChanged(I)V

    .line 223
    :cond_0
    if-le p2, v1, :cond_1

    .line 224
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    invoke-virtual {v0, p2}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->notifyItemChanged(I)V

    .line 226
    :cond_1
    return-void
.end method

.method private onFilterChanged(I)V
    .locals 7
    .param p1, "filterId"    # I

    .prologue
    const/4 v6, 0x0

    .line 279
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/android/camera/effect/EffectController;->getEffect(Z)I

    move-result v1

    .line 280
    .local v1, "oldFilterId":I
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/android/camera/effect/EffectController;->setInvertFlag(I)V

    .line 283
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    const/16 v5, 0xac

    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v3

    check-cast v3, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 285
    .local v3, "topAlert":Lcom/android/camera/protocol/ModeProtocol$TopAlert;
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 287
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 288
    const/16 v5, 0xa4

    .line 287
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 290
    .local v0, "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    const/4 v4, 0x4

    invoke-interface {v0, v4}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->configGroupSwitch(I)V

    .line 291
    invoke-interface {v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->refreshExtraMenu()V

    .line 295
    .end local v0    # "configChanges":Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v4

    .line 296
    const/16 v5, 0xa5

    .line 295
    invoke-virtual {v4, v5}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;

    .line 297
    .local v2, "p":Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;
    if-eqz v2, :cond_1

    .line 298
    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v4

    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getIndex(I)I

    move-result v5

    invoke-interface {v2, v4, v5}, Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;->onFilterChanged(II)V

    .line 302
    :cond_1
    const/4 v4, 0x1

    new-array v4, v4, [I

    const/16 v5, 0xc4

    aput v5, v4, v6

    invoke-interface {v3, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 304
    return-void
.end method

.method private onFilterSelected(IZ)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "fromClick"    # Z

    .prologue
    .line 262
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v2, v3, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    .line 263
    .local v2, "filterValue":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    iget v4, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentMode:I

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->setClosed(ZI)V

    .line 264
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 265
    .local v1, "filterId":I
    iget v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentMode:I

    invoke-static {v3, v1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackFilterChanged(IIZ)V

    .line 266
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentFilter;->persistFilter(I)V

    .line 267
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentFilter;->selectItem(I)V

    .line 268
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentFilter;->onFilterChanged(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    .end local v1    # "filterId":I
    .end local v2    # "filterValue":Ljava/lang/String;
    :goto_0
    return-void

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v3, Lcom/android/camera/fragment/FragmentFilter;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "invalid filter id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private persistFilter(I)V
    .locals 0
    .param p1, "filterId"    # I

    .prologue
    .line 275
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setShaderEffect(I)V

    .line 276
    return-void
.end method

.method private scrollIfNeed(I)V
    .locals 3
    .param p1, "selected"    # I

    .prologue
    .line 229
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_2

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 v1, p1, -0x1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 237
    :cond_1
    :goto_0
    return-void

    .line 232
    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_3

    .line 233
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 234
    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 235
    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    invoke-virtual {v2}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 234
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_0
.end method

.method private selectItem(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 210
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 211
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLastIndex:I

    .line 212
    iput p1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    .line 214
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentFilter;->scrollIfNeed(I)V

    .line 215
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mLastIndex:I

    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/fragment/FragmentFilter;->notifyItemChanged(II)V

    .line 217
    :cond_0
    return-void
.end method

.method private setItemInCenter(I)V
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 203
    iput p1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    .line 204
    iput p1, p0, Lcom/android/camera/fragment/FragmentFilter;->mIsShowIndex:I

    .line 205
    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mTotalWidth:I

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mHolderWidth:I

    div-int/lit8 v2, v2, 0x2

    sub-int v0, v1, v2

    .line 206
    .local v0, "offset":I
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, p1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 207
    return-void
.end method

.method private showSelected(Landroid/widget/ImageView;I)V
    .locals 9
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "resourceId"    # I

    .prologue
    const/4 v8, 0x0

    .line 459
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    .line 460
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020029

    invoke-static {v5, v6}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 461
    .local v1, "mainImage":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFilter;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v5, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 462
    .local v2, "maskImage":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 463
    .local v4, "result":Landroid/graphics/Bitmap;
    invoke-virtual {v0, v4}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 464
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 465
    .local v3, "paint":Landroid/graphics/Paint;
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 467
    invoke-virtual {v0, v1, v8, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 468
    new-instance v5, Landroid/graphics/PorterDuffXfermode;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v6}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 469
    invoke-virtual {v0, v2, v8, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 470
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 471
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 472
    return-void
.end method

.method private updateCurrentIndex()V
    .locals 6

    .prologue
    .line 170
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    .line 171
    .local v2, "mode":I
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v3, v2}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 172
    .local v0, "currentValue":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v3, v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->findIndexOfValue(Ljava/lang/String;)I

    move-result v1

    .line 173
    .local v1, "index":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    .line 174
    sget-object v3, Lcom/android/camera/fragment/FragmentFilter;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "invalid filter "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    const/4 v1, 0x0

    .line 177
    :cond_0
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/FragmentFilter;->setItemInCenter(I)V

    .line 178
    return-void
.end method


# virtual methods
.method public delayShowSelected(Z)V
    .locals 2
    .param p1, "isShow"    # Z

    .prologue
    .line 181
    if-eqz p1, :cond_0

    .line 182
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mIsShowIndex:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    .line 189
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mIsShowIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->notifyItemChanged(I)V

    .line 190
    return-void

    .line 185
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mIsShowIndex:I

    .line 186
    iget v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mIsShowIndex:I

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentFilter;->setItemInCenter(I)V

    .line 187
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    goto :goto_0
.end method

.method public getFragmentInto()I
    .locals 1

    .prologue
    .line 519
    const/16 v0, 0xfa

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    .prologue
    .line 514
    const v0, 0x7f04000d

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x0

    const-wide/16 v6, 0x96

    .line 81
    const v3, 0x7f0a0033

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 83
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFilter;->getFilterInfo()Ljava/util/ArrayList;

    move-result-object v2

    .line 84
    .local v2, "filterInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    .line 85
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v3, v2}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mapToItems(Ljava/util/ArrayList;)V

    .line 87
    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 88
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mTotalWidth:I

    .line 89
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090024

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mHolderWidth:I

    .line 91
    new-instance v3, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-direct {v3, p0, v1, v4}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;-><init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/content/Context;Lcom/android/camera/data/data/config/ComponentConfigFilter;)V

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    .line 92
    new-instance v3, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v3, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 93
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3, v8}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 94
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v3

    .line 95
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/camera/effect/EffectController;->getEffectCount(I)I

    move-result v4

    .line 94
    invoke-virtual {v3, v8, v4}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 96
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentFilter;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 97
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v4, Lcom/android/camera/fragment/FragmentFilter$EffectItemPadding;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentFilter$EffectItemPadding;-><init>(Lcom/android/camera/fragment/FragmentFilter;)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 98
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 99
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v4, Lcom/android/camera/fragment/FragmentFilter$1;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/FragmentFilter$1;-><init>(Lcom/android/camera/fragment/FragmentFilter;)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 107
    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    .line 108
    .local v0, "animator":Landroid/support/v7/widget/RecyclerView$ItemAnimator;
    invoke-virtual {v0, v6, v7}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 109
    invoke-virtual {v0, v6, v7}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 110
    invoke-virtual {v0, v6, v7}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 111
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 113
    new-instance v3, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v3, p0, Lcom/android/camera/fragment/FragmentFilter;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    .line 114
    return-void
.end method

.method public isShowAnimation(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 154
    .local p1, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    if-nez p1, :cond_0

    .line 155
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    .line 159
    :goto_0
    return-void

    .line 157
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 241
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 242
    return-void

    .line 245
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 246
    const/16 v3, 0xa1

    .line 245
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    .line 247
    .local v0, "cameraAction":Lcom/android/camera/protocol/ModeProtocol$CameraAction;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 248
    return-void

    .line 251
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 252
    .local v1, "index":I
    iget v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    if-ne v2, v1, :cond_2

    iget-boolean v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mIgnoreSameItemClick:Z

    if-eqz v2, :cond_2

    .line 253
    return-void

    .line 256
    :cond_2
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/camera/fragment/FragmentFilter;->isAnimation:Z

    .line 257
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/android/camera/fragment/FragmentFilter;->onFilterSelected(IZ)V

    .line 258
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 118
    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 120
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFilter;->updateCurrentIndex()V

    .line 121
    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;Z)V
    .locals 0
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
    .line 525
    .local p2, "animateInElements":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/Completable;>;"
    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;Z)V

    .line 526
    return-void
.end method

.method protected register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 194
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->register(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 195
    return-void
.end method

.method public switchFilter(I)V
    .locals 5
    .param p1, "gravity"    # I

    .prologue
    const/4 v4, 0x0

    .line 307
    const/4 v0, -0x1

    .line 308
    .local v0, "index":I
    packed-switch p1, :pswitch_data_0

    .line 322
    :pswitch_0
    sget-object v1, Lcom/android/camera/fragment/FragmentFilter;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unexpected gravity "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    :cond_0
    :goto_0
    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    .line 327
    invoke-direct {p0, v0, v4}, Lcom/android/camera/fragment/FragmentFilter;->onFilterSelected(IZ)V

    .line 329
    :cond_1
    return-void

    .line 310
    :pswitch_1
    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    if-lez v1, :cond_0

    .line 311
    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    add-int/lit8 v0, v1, -0x1

    goto :goto_0

    .line 316
    :pswitch_2
    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getItems()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 317
    iget v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mCurrentIndex:I

    add-int/lit8 v0, v1, 0x1

    goto :goto_0

    .line 308
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V
    .locals 0
    .param p1, "modeCoordinator"    # Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;

    .prologue
    .line 199
    invoke-super {p0, p1}, Lcom/android/camera/fragment/BaseFragment;->unRegister(Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;)V

    .line 200
    return-void
.end method

.method public updateFilterData()V
    .locals 3

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFilter;->getFilterInfo()Ljava/util/ArrayList;

    move-result-object v0

    .line 163
    .local v0, "filterInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    .line 164
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mapToItems(Ljava/util/ArrayList;)V

    .line 165
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentFilter;->mEffectItemAdapter:Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentFilter;->mComponentConfigFilter:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->updateData(Lcom/android/camera/data/data/config/ComponentConfigFilter;)V

    .line 166
    invoke-direct {p0}, Lcom/android/camera/fragment/FragmentFilter;->updateCurrentIndex()V

    .line 167
    return-void
.end method
