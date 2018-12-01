.class public Lcom/android/camera/data/data/global/ComponentModuleList;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentModuleList.java"


# instance fields
.field private mIntentType:I


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/global/DataItemGlobal;)V
    .locals 0
    .param p1, "dataItemGlobal"    # Lcom/android/camera/data/data/global/DataItemGlobal;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 23
    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 7
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
    const v6, 0x7f0f0197

    const/16 v5, 0xa3

    const/4 v4, -0x1

    .line 54
    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-ne v1, v4, :cond_0

    .line 55
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "parse intent first!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v1, :cond_1

    .line 61
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 62
    const/16 v2, 0xa1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f0195

    .line 61
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    :cond_1
    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_2

    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v1, :cond_3

    .line 68
    :cond_2
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 69
    const/16 v2, 0xa2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f0196

    .line 68
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    :cond_3
    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_5

    .line 73
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 74
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 73
    invoke-direct {v1, v4, v4, v6, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    :cond_4
    :goto_0
    return-object v0

    .line 78
    :cond_5
    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_6

    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v1, :cond_4

    .line 80
    :cond_6
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 81
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 80
    invoke-direct {v1, v4, v4, v6, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    invoke-static {}, Lcom/android/camera/Device;->isSupportedPortrait()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 84
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 85
    const/16 v2, 0xab

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f019c

    .line 84
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    :cond_7
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 89
    const/16 v2, 0xa5

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f0199

    .line 88
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v1, :cond_8

    .line 92
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 93
    const/16 v2, 0xa6

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f019a

    .line 92
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_8
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 98
    const/16 v2, 0xa7

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f0f019b

    .line 97
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 37
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

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
    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 43
    invoke-direct {p0}, Lcom/android/camera/data/data/global/ComponentModuleList;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "pref_camera_mode_key_intent_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMode(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 108
    iget-object v1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v1, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 109
    .local v0, "mode":I
    return v0
.end method

.method public reInit()V
    .locals 0

    .prologue
    .line 50
    return-void
.end method

.method public setIntentType(I)V
    .locals 1
    .param p1, "intentType"    # I

    .prologue
    .line 113
    iput p1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    .line 114
    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 117
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/data/data/global/ComponentModuleList;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    .line 118
    return-void
.end method
