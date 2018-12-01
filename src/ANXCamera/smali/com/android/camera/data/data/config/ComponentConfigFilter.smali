.class public Lcom/android/camera/data/data/config/ComponentConfigFilter;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigFilter.java"


# instance fields
.field private mIsClosed:Landroid/util/SparseBooleanArray;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V
    .locals 0
    .param p1, "dataItemRunning"    # Lcom/android/camera/data/data/runing/DataItemRunning;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 24
    return-void
.end method


# virtual methods
.method public getComponentValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->isClosed(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 68
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 55
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 45
    const v0, 0x7f0f005e

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 50
    const-string/jumbo v0, "pref_camera_shader_coloreffect_key"

    return-object v0
.end method

.method public isClosed(I)Z
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 30
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 31
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mIsClosed:Landroid/util/SparseBooleanArray;

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    return v0
.end method

.method public mapToItems(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "filterInfoArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mItems:Ljava/util/List;

    .line 75
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "filterInfo$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/FilterInfo;

    .line 76
    .local v0, "filterInfo":Lcom/android/camera/effect/FilterInfo;
    iget-object v2, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mItems:Ljava/util/List;

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    .line 77
    invoke-virtual {v0}, Lcom/android/camera/effect/FilterInfo;->getIconResId()I

    move-result v4

    .line 78
    invoke-virtual {v0}, Lcom/android/camera/effect/FilterInfo;->getIconResId()I

    move-result v5

    .line 79
    invoke-virtual {v0}, Lcom/android/camera/effect/FilterInfo;->getNameResId()I

    move-result v6

    .line 80
    invoke-virtual {v0}, Lcom/android/camera/effect/FilterInfo;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .line 76
    invoke-direct {v3, v4, v5, v6, v7}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 82
    .end local v0    # "filterInfo":Lcom/android/camera/effect/FilterInfo;
    :cond_0
    return-void
.end method

.method public setClosed(ZI)V
    .locals 1
    .param p1, "close"    # Z
    .param p2, "mode"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mIsClosed:Landroid/util/SparseBooleanArray;

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFilter;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 41
    return-void
.end method
