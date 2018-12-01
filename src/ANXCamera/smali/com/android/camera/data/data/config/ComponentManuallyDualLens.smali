.class public Lcom/android/camera/data/data/config/ComponentManuallyDualLens;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyDualLens.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 23
    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 5
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

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 64
    const-string/jumbo v2, "wide"

    .line 63
    const v3, 0x7f0f016e

    .line 61
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 69
    const-string/jumbo v2, "tele"

    .line 68
    const v3, 0x7f0f016f

    .line 66
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 46
    const-string/jumbo v0, "wide"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 27
    const v0, 0x7f0f016d

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
    .line 52
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 53
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 32
    packed-switch p1, :pswitch_data_0

    .line 35
    :pswitch_0
    const-string/jumbo v0, "pref_camera_zoom_mode_key"

    return-object v0

    .line 39
    :pswitch_1
    const-string/jumbo v0, "pref_camera_manually_lens"

    return-object v0

    .line 32
    nop

    :pswitch_data_0
    .packed-switch 0xa6
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
