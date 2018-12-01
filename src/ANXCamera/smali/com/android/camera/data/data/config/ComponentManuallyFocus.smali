.class public Lcom/android/camera/data/data/config/ComponentManuallyFocus;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyFocus.java"


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
    const v4, 0x7f0f0047

    const/4 v3, -0x1

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 52
    const-string/jumbo v2, "1000"

    .line 51
    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 55
    const-string/jumbo v2, "manual"

    .line 54
    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 37
    const-string/jumbo v0, "1000"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 27
    const v0, 0x7f0f013a

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
    .line 42
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->mItems:Ljava/util/List;

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 32
    const-string/jumbo v0, "pref_focus_position_key"

    return-object v0
.end method

.method public getValueDisplayString(I)I
    .locals 3
    .param p1, "mode"    # I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "value":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 66
    .local v0, "time":I
    const/16 v2, 0x3e8

    if-ne v0, v2, :cond_0

    .line 67
    const v2, 0x7f0f0047

    return v2

    .line 69
    :cond_0
    const/4 v2, -0x2

    return v2
.end method

.method public getValueSelectedDrawable(I)I
    .locals 6
    .param p1, "mode"    # I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "value":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 78
    .local v0, "focus":I
    const/16 v2, 0x3e8

    if-ne v0, v2, :cond_0

    .line 79
    const/4 v2, -0x1

    return v2

    .line 80
    :cond_0
    int-to-double v2, v0

    const-wide v4, 0x4082c00000000000L    # 600.0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_1

    .line 81
    const v2, 0x7f0200d1

    return v2

    .line 82
    :cond_1
    int-to-double v2, v0

    const-wide/high16 v4, 0x4069000000000000L    # 200.0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_2

    .line 83
    const v2, 0x7f0200d2

    return v2

    .line 85
    :cond_2
    const v2, 0x7f0200d0

    return v2
.end method
