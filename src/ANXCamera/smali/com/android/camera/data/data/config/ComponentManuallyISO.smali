.class public Lcom/android/camera/data/data/config/ComponentManuallyISO;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyISO.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# instance fields
.field private mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 31
    return-void
.end method

.method private getFullItems()[Lcom/android/camera/data/data/ComponentDataItem;
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 116
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    return-object v0

    .line 120
    :cond_0
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/android/camera/data/data/ComponentDataItem;

    .line 121
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 124
    const-string/jumbo v2, "0"

    .line 123
    const v3, 0x7f0f009e

    .line 121
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 125
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 128
    const-string/jumbo v2, "100"

    .line 127
    const v3, 0x7f0f009f

    .line 125
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 129
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 132
    const-string/jumbo v2, "200"

    .line 131
    const v3, 0x7f0f00a0

    .line 129
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 133
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 136
    const-string/jumbo v2, "400"

    .line 135
    const v3, 0x7f0f00a1

    .line 133
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 137
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 140
    const-string/jumbo v2, "800"

    .line 139
    const v3, 0x7f0f00a2

    .line 137
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 141
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 144
    const-string/jumbo v2, "1600"

    .line 143
    const v3, 0x7f0f00a3

    .line 141
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 145
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 148
    const-string/jumbo v2, "3200"

    .line 147
    const v3, 0x7f0f00a4

    .line 145
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 120
    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    .line 151
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    return-object v0
.end method

.method private initItems()Ljava/util/List;
    .locals 11
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
    const/4 v10, 0x0

    .line 89
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 91
    .local v0, "cc":Lcom/android/camera2/CameraCapabilities;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .local v8, "resultItems":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyISO;->getFullItems()[Lcom/android/camera/data/data/ComponentDataItem;

    move-result-object v3

    .line 94
    .local v3, "fullItems":[Lcom/android/camera/data/data/ComponentDataItem;
    aget-object v9, v3, v10

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getIsoRange()Landroid/util/Range;

    move-result-object v7

    .line 98
    .local v7, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz v7, :cond_2

    .line 99
    invoke-virtual {v7}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 100
    .local v6, "minIso":I
    invoke-virtual {v7}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 101
    .local v5, "maxIso":I
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    array-length v9, v3

    if-ge v4, v9, :cond_2

    .line 102
    aget-object v1, v3, v4

    .line 103
    .local v1, "componentDataItem":Lcom/android/camera/data/data/ComponentDataItem;
    iget-object v9, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 104
    .local v2, "entryValue":I
    if-eqz v4, :cond_0

    if-gt v6, v2, :cond_1

    if-gt v2, v5, :cond_1

    .line 105
    :cond_0
    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 110
    .end local v1    # "componentDataItem":Lcom/android/camera/data/data/ComponentDataItem;
    .end local v2    # "entryValue":I
    .end local v4    # "i":I
    .end local v5    # "maxIso":I
    .end local v6    # "minIso":I
    :cond_2
    return-object v8
.end method


# virtual methods
.method protected checkValueValid(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 58
    const v0, 0x7f0b0018

    invoke-static {p1, v0}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 5
    .param p1, "mode"    # I

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentManuallyISO;->getItems()Ljava/util/List;

    move-result-object v0

    .line 70
    .local v0, "currentItems":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 71
    return-object v2

    .line 73
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v1, v3, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    .line 74
    .local v1, "maxValue":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-le v3, v4, :cond_1

    .line 75
    return-object v1

    .line 77
    :cond_1
    return-object v2
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 45
    const-string/jumbo v0, "0"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 35
    const v0, 0x7f0f009d

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
    .line 50
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 51
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyISO;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mItems:Ljava/util/List;

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyISO;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 40
    const-string/jumbo v0, "pref_qc_camera_iso_key"

    return-object v0
.end method

.method protected resetComponentValue(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyISO;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyISO;->setComponentValue(ILjava/lang/String;)V

    .line 64
    return-void
.end method
