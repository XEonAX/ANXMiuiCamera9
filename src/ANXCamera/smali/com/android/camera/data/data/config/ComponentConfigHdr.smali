.class public Lcom/android/camera/data/data/config/ComponentConfigHdr;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigHdr.java"


# instance fields
.field private mAutoSupported:Z

.field private mIsClosed:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 5
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    const v4, 0x7f0200ba

    .line 39
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    .line 41
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 43
    const-string/jumbo v2, "off"

    const v3, 0x7f0f0146

    .line 41
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .prologue
    .line 220
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mIsClosed:Z

    .line 221
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    const-string/jumbo v0, "off"

    return-object v0

    .line 95
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 96
    const-string/jumbo v0, "off"

    return-object v0

    .line 98
    :cond_1
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    const-string/jumbo v0, "off"

    return-object v0

    .line 74
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    const-string/jumbo v0, "off"

    return-object v0

    .line 79
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 80
    const-string/jumbo v0, "off"

    return-object v0

    .line 83
    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    if-eqz v0, :cond_3

    .line 84
    const-string/jumbo v0, "auto"

    return-object v0

    .line 87
    :cond_3
    const-string/jumbo v0, "off"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 48
    const v0, 0x7f0f0105

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
    .line 118
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 53
    packed-switch p1, :pswitch_data_0

    .line 56
    :pswitch_0
    const-string/jumbo v0, "pref_camera_hdr_key"

    return-object v0

    .line 62
    :pswitch_1
    const-string/jumbo v0, "pref_video_hdr_key"

    return-object v0

    .line 65
    :pswitch_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unspecified hdr"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :pswitch_data_0
    .packed-switch 0xa0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 107
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValueSelectedDrawableIgnoreClose(I)I
    .locals 3
    .param p1, "mode"    # I

    .prologue
    const v2, 0x7f0200b9

    .line 203
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 204
    .local v0, "value":Ljava/lang/String;
    const-string/jumbo v1, "off"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    const v1, 0x7f0200ba

    return v1

    .line 206
    :cond_0
    const-string/jumbo v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 207
    const v1, 0x7f0200b7

    return v1

    .line 208
    :cond_1
    const-string/jumbo v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 209
    return v2

    .line 210
    :cond_2
    const-string/jumbo v1, "live"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 211
    const v1, 0x7f0200b8

    return v1

    .line 212
    :cond_3
    const-string/jumbo v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 213
    return v2

    .line 216
    :cond_4
    const/4 v1, -0x1

    return v1
.end method

.method public getValueSelectedStringIdIgnoreClose(I)I
    .locals 3
    .param p1, "mode"    # I

    .prologue
    const v2, 0x7f0f00d2

    .line 229
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "value":Ljava/lang/String;
    const-string/jumbo v1, "off"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 231
    const v1, 0x7f0f00ce

    return v1

    .line 232
    :cond_0
    const-string/jumbo v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 233
    const v1, 0x7f0f00cf

    return v1

    .line 234
    :cond_1
    const-string/jumbo v1, "normal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 235
    return v2

    .line 236
    :cond_2
    const-string/jumbo v1, "live"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 237
    const v1, 0x7f0f00d1

    return v1

    .line 238
    :cond_3
    const-string/jumbo v1, "on"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 239
    return v2

    .line 242
    :cond_4
    const/4 v1, -0x1

    return v1
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mIsClosed:Z

    return v0
.end method

.method public reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;
    .locals 8
    .param p1, "currentMode"    # I
    .param p2, "cameraId"    # I
    .param p3, "p"    # Lcom/android/camera2/CameraCapabilities;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/android/camera2/CameraCapabilities;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    .prologue
    const v7, 0x7f0200ba

    const v6, 0x7f0200b8

    const v5, 0x7f0200b7

    const v4, 0x7f0200b9

    .line 123
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    .line 129
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    .line 131
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportHdr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    return-object v0

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_0

    .line 135
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 193
    :goto_1
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    return-object v0

    .line 139
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 141
    const-string/jumbo v2, "off"

    const v3, 0x7f0f0146

    .line 139
    invoke-direct {v1, v7, v7, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportAutoHdr()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mAutoSupported:Z

    .line 145
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 147
    const-string/jumbo v2, "auto"

    const v3, 0x7f0f0145

    .line 145
    invoke-direct {v1, v5, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    :cond_2
    sget-boolean v0, Lcom/android/camera/Device;->IS_MI2:Z

    if-nez v0, :cond_3

    invoke-static {}, Lcom/android/camera/Device;->isSupportedAoHDR()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    .line 152
    :cond_3
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 154
    const-string/jumbo v2, "normal"

    const v3, 0x7f0f014a

    .line 152
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 156
    :cond_4
    sget-boolean v0, Lcom/android/camera/Device;->IS_MI2A:Z

    if-nez v0, :cond_5

    .line 157
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 159
    const-string/jumbo v2, "normal"

    const v3, 0x7f0f0147

    .line 157
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    :cond_5
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 164
    const-string/jumbo v2, "live"

    const v3, 0x7f0f0148

    .line 162
    invoke-direct {v1, v6, v6, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 135
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setClosed(Z)V
    .locals 0
    .param p1, "close"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigHdr;->mIsClosed:Z

    .line 36
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1
    .param p1, "mode"    # I
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setClosed(Z)V

    .line 113
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 114
    return-void
.end method
