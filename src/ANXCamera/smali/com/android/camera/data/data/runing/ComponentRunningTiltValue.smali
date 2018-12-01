.class public Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentRunningTiltValue.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V
    .locals 0
    .param p1, "dataItemRunning"    # Lcom/android/camera/data/data/runing/DataItemRunning;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 22
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
    const v5, 0x7f0200c6

    const v4, 0x7f0200c5

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v0, "itemList":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 52
    const-string/jumbo v2, "circle"

    .line 51
    const v3, 0x7f0f0129

    .line 49
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 56
    const-string/jumbo v2, "parallel"

    .line 55
    const v3, 0x7f0f012a

    .line 53
    invoke-direct {v1, v5, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 36
    const-string/jumbo v0, "circle"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 26
    const v0, 0x7f0f0163

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
    .line 41
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 42
    invoke-direct {p0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->mItems:Ljava/util/List;

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 31
    const-string/jumbo v0, "pref_camera_tilt_shift_key"

    return-object v0
.end method
