.class public Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentRunningSceneValue.java"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V
    .locals 0
    .param p1, "dataItemBase"    # Lcom/android/camera/data/data/runing/DataItemRunning;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 20
    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 10
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
    const v9, 0x7f0200e4

    const v8, 0x7f0200e3

    const v7, 0x7f0200e2

    const v6, 0x7f0200e1

    const v4, 0x7f0200e0

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v0, "componentDataItemList":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 51
    const-string/jumbo v2, "0"

    .line 50
    const v3, 0x7f0f008f

    .line 48
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 55
    const-string/jumbo v2, "3"

    .line 52
    const v3, 0x7f0200e8

    .line 53
    const v4, 0x7f0200e8

    .line 54
    const v5, 0x7f0f0090

    .line 52
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 59
    const-string/jumbo v2, "4"

    .line 56
    const v3, 0x7f0200e5

    .line 57
    const v4, 0x7f0200e5

    .line 58
    const v5, 0x7f0f0091

    .line 56
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 63
    const-string/jumbo v2, "13"

    .line 60
    const v3, 0x7f0200ea

    .line 61
    const v4, 0x7f0200ea

    .line 62
    const v5, 0x7f0f0098

    .line 60
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 67
    const-string/jumbo v2, "5"

    .line 64
    const v3, 0x7f0200e6

    .line 65
    const v4, 0x7f0200e6

    .line 66
    const v5, 0x7f0f0092

    .line 64
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 71
    const-string/jumbo v2, "6"

    .line 68
    const v3, 0x7f0200e7

    .line 69
    const v4, 0x7f0200e7

    .line 70
    const v5, 0x7f0f0093

    .line 68
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 75
    const-string/jumbo v2, "8"

    .line 74
    const v3, 0x7f0f0094

    .line 72
    invoke-direct {v1, v7, v7, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 79
    const-string/jumbo v2, "9"

    .line 76
    const v3, 0x7f0200e9

    .line 77
    const v4, 0x7f0200e9

    .line 78
    const v5, 0x7f0f0095

    .line 76
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 83
    const-string/jumbo v2, "10"

    .line 80
    const v3, 0x7f0200eb

    .line 81
    const v4, 0x7f0200eb

    .line 82
    const v5, 0x7f0f0096

    .line 80
    invoke-direct {v1, v3, v4, v5, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 87
    const-string/jumbo v2, "12"

    .line 86
    const v3, 0x7f0f0097

    .line 84
    invoke-direct {v1, v8, v8, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 91
    const-string/jumbo v2, "backlight"

    .line 90
    const v3, 0x7f0f0099

    .line 88
    invoke-direct {v1, v6, v6, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 95
    const-string/jumbo v2, "flowers"

    .line 94
    const v3, 0x7f0f009a

    .line 92
    invoke-direct {v1, v9, v9, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 34
    const-string/jumbo v0, "0"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 24
    const v0, 0x7f0f008e

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
    .line 39
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 40
    invoke-direct {p0}, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->mItems:Ljava/util/List;

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 29
    const-string/jumbo v0, "pref_camera_scenemode_key"

    return-object v0
.end method
