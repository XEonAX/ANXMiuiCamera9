.class public Lcom/android/camera/data/data/config/ComponentManuallyWB;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyWB.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 25
    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 6
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
    const/4 v4, -0x1

    const/4 v5, -0x2

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .restart local v0    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 58
    const-string/jumbo v2, "1"

    .line 57
    const v3, 0x7f0f005c

    .line 55
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 63
    const-string/jumbo v2, "2"

    .line 60
    const v3, 0x7f02000a

    .line 61
    const v4, 0x7f0200f6

    .line 60
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 68
    const-string/jumbo v2, "5"

    .line 65
    const v3, 0x7f02000c

    .line 66
    const v4, 0x7f0200fc

    .line 65
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 73
    const-string/jumbo v2, "3"

    .line 70
    const v3, 0x7f020009

    .line 71
    const v4, 0x7f0200f3

    .line 70
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 78
    const-string/jumbo v2, "6"

    .line 75
    const v3, 0x7f020008

    .line 76
    const v4, 0x7f0200f0

    .line 75
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-static {}, Lcom/android/camera/Device;->isSupportedManualFunction()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 85
    const-string/jumbo v2, "manual"

    .line 82
    const v3, 0x7f02000b

    .line 83
    const v4, 0x7f0200f9

    .line 82
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getCustomWB()I
    .locals 3

    .prologue
    .line 96
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    const-string/jumbo v1, "pref_qc_manual_whitebalance_k_value_key"

    const/16 v2, 0x10cc

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 39
    const-string/jumbo v0, "1"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 29
    const v0, 0x7f0f005b

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
    .line 44
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 45
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mItems:Ljava/util/List;

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 34
    const-string/jumbo v0, "pref_camera_whitebalance_key"

    return-object v0
.end method

.method public setCustomWB(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyWB;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {v0}, Lcom/android/camera/data/data/DataItemBase;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "pref_qc_manual_whitebalance_k_value_key"

    invoke-interface {v0, v1, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 93
    return-void
.end method
