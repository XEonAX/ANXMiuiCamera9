.class public Lcom/android/camera/data/data/config/ComponentManuallyET;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentManuallyET.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/android/camera/data/data/config/ComponentManuallyET;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentManuallyET;->TAG:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 28
    return-void
.end method

.method private getFullItems()[Lcom/android/camera/data/data/ComponentDataItem;
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 110
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    return-object v0

    .line 115
    :cond_0
    const/16 v0, 0x11

    new-array v0, v0, [Lcom/android/camera/data/data/ComponentDataItem;

    .line 117
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 120
    const-string/jumbo v2, "0"

    .line 119
    const v3, 0x7f0f010c

    .line 117
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 122
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 125
    const-string/jumbo v2, "1000000"

    .line 124
    const v3, 0x7f0f011c

    .line 122
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 126
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 129
    const-string/jumbo v2, "2000000"

    .line 128
    const v3, 0x7f0f011b

    .line 126
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 130
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 133
    const-string/jumbo v2, "4000000"

    .line 132
    const v3, 0x7f0f011a

    .line 130
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 134
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 137
    const-string/jumbo v2, "8000000"

    .line 136
    const v3, 0x7f0f0119

    .line 134
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 138
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 141
    const-string/jumbo v2, "16667000"

    .line 140
    const v3, 0x7f0f0118

    .line 138
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 142
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 145
    const-string/jumbo v2, "33333000"

    .line 144
    const v3, 0x7f0f0117

    .line 142
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 146
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 149
    const-string/jumbo v2, "66667000"

    .line 148
    const v3, 0x7f0f0116

    .line 146
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 150
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 153
    const-string/jumbo v2, "125000000"

    .line 152
    const v3, 0x7f0f0115

    .line 150
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    .line 154
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 157
    const-string/jumbo v2, "250000000"

    .line 156
    const v3, 0x7f0f0114

    .line 154
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 158
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 161
    const-string/jumbo v2, "500000000"

    .line 160
    const v3, 0x7f0f0113

    .line 158
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    .line 162
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 165
    const-string/jumbo v2, "1000000000"

    .line 164
    const v3, 0x7f0f0112

    .line 162
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    .line 166
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 169
    const-string/jumbo v2, "2000000000"

    .line 168
    const v3, 0x7f0f0111

    .line 166
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    .line 170
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 173
    const-string/jumbo v2, "4000000000"

    .line 172
    const v3, 0x7f0f0110

    .line 170
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    .line 174
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 177
    const-string/jumbo v2, "8000000000"

    .line 176
    const v3, 0x7f0f010f

    .line 174
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    .line 178
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 181
    const-string/jumbo v2, "16000000000"

    .line 180
    const v3, 0x7f0f010e

    .line 178
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    .line 182
    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 185
    const-string/jumbo v2, "32000000000"

    .line 184
    const v3, 0x7f0f010d

    .line 182
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    const/16 v2, 0x10

    aput-object v1, v0, v2

    .line 115
    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    .line 188
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mFullItems:[Lcom/android/camera/data/data/ComponentDataItem;

    return-object v0
.end method

.method private initItems()Ljava/util/List;
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

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
    .line 84
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v10, "resultItems":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 87
    .local v0, "cc":Lcom/android/camera2/CameraCapabilities;
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getExposureTimeRange()Landroid/util/Range;

    move-result-object v11

    .line 88
    .local v11, "timeRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyET;->getFullItems()[Lcom/android/camera/data/data/ComponentDataItem;

    move-result-object v4

    .line 90
    .local v4, "fullItems":[Lcom/android/camera/data/data/ComponentDataItem;
    const/4 v12, 0x0

    aget-object v12, v4, v12

    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    if-eqz v11, :cond_1

    .line 93
    invoke-virtual {v11}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v12

    check-cast v12, Ljava/lang/Long;

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 94
    .local v8, "minExposure":J
    invoke-virtual {v11}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v12

    check-cast v12, Ljava/lang/Long;

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 95
    .local v6, "maxExposure":J
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    array-length v12, v4

    if-ge v5, v12, :cond_1

    .line 96
    aget-object v1, v4, v5

    .line 97
    .local v1, "componentDataItem":Lcom/android/camera/data/data/ComponentDataItem;
    iget-object v12, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 98
    .local v2, "entryValue":J
    cmp-long v12, v8, v2

    if-gtz v12, :cond_0

    cmp-long v12, v2, v6

    if-gtz v12, :cond_0

    .line 99
    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 104
    .end local v1    # "componentDataItem":Lcom/android/camera/data/data/ComponentDataItem;
    .end local v2    # "entryValue":J
    .end local v5    # "i":I
    .end local v6    # "maxExposure":J
    .end local v8    # "minExposure":J
    :cond_1
    return-object v10
.end method


# virtual methods
.method public getComponentValue(I)Ljava/lang/String;
    .locals 8
    .param p1, "mode"    # I

    .prologue
    .line 69
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentManuallyET;->getItems()Ljava/util/List;

    move-result-object v0

    .line 71
    .local v0, "currentItems":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/data/data/ComponentDataItem;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 72
    return-object v2

    .line 74
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v1, v3, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    .line 75
    .local v1, "maxValue":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_1

    .line 76
    invoke-virtual {p0, p1, v1}, Lcom/android/camera/data/data/config/ComponentManuallyET;->setComponentValue(ILjava/lang/String;)V

    .line 77
    return-object v1

    .line 79
    :cond_1
    return-object v2
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 42
    const-string/jumbo v0, "0"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 32
    const v0, 0x7f0f010a

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
    .line 47
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 48
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyET;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mItems:Ljava/util/List;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentManuallyET;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 37
    const-string/jumbo v0, "pref_qc_camera_exposuretime_key"

    return-object v0
.end method

.method public getValueDisplayString(I)I
    .locals 6
    .param p1, "mode"    # I

    .prologue
    .line 55
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentManuallyET;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    .line 57
    .local v2, "value":Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentManuallyET;->getFullItems()[Lcom/android/camera/data/data/ComponentDataItem;

    move-result-object v1

    .line 58
    .local v1, "fullItems":[Lcom/android/camera/data/data/ComponentDataItem;
    const/4 v3, 0x0

    array-length v4, v1

    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v0, v1, v3

    .line 59
    .local v0, "dataItem":Lcom/android/camera/data/data/ComponentDataItem;
    iget-object v5, v0, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 60
    iget v3, v0, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    return v3

    .line 58
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 64
    .end local v0    # "dataItem":Lcom/android/camera/data/data/ComponentDataItem;
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "invalid value"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
