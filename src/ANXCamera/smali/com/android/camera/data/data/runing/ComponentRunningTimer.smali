.class public Lcom/android/camera/data/data/runing/ComponentRunningTimer;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentRunningTimer.java"


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
    const v5, 0x7f0200c7

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 50
    const-string/jumbo v2, "0"

    const v3, 0x7f0f014b

    .line 49
    invoke-direct {v1, v5, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 52
    const-string/jumbo v2, "3"

    const v3, 0x7f0200c8

    const v4, 0x7f0f014c

    .line 51
    invoke-direct {v1, v5, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 54
    const-string/jumbo v2, "5"

    const v3, 0x7f0200c9

    const v4, 0x7f0f014d

    .line 53
    invoke-direct {v1, v5, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 36
    const-string/jumbo v0, "0"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 26
    const v0, 0x7f0f014b

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
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 42
    invoke-direct {p0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->mItems:Ljava/util/List;

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 31
    const-string/jumbo v0, "pref_delay_capture_mode"

    return-object v0
.end method

.method public getNextValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 71
    const/16 v1, 0xa0

    invoke-virtual {p0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "value":Ljava/lang/String;
    const-string/jumbo v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 73
    const-string/jumbo v1, "3"

    return-object v1

    .line 74
    :cond_0
    const-string/jumbo v1, "3"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 75
    const-string/jumbo v1, "5"

    return-object v1

    .line 76
    :cond_1
    const-string/jumbo v1, "5"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 77
    const-string/jumbo v1, "0"

    return-object v1

    .line 79
    :cond_2
    const-string/jumbo v1, "0"

    return-object v1
.end method

.method public getTimer()I
    .locals 1

    .prologue
    .line 67
    const/16 v0, 0xa0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public isSwitchOn()Z
    .locals 2

    .prologue
    .line 59
    const/16 v0, 0xa0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
