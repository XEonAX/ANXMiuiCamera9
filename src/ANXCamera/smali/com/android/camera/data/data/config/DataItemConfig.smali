.class public Lcom/android/camera/data/data/config/DataItemConfig;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemConfig.java"


# instance fields
.field private mCameraId:I

.field private mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

.field private mComponentConfigBeauty:Lcom/android/camera/data/data/config/ComponentConfigBeauty;

.field private mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

.field private mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

.field private mIntentType:I

.field private mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

.field private mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "cameraId"    # I
    .param p2, "intentType"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    .line 50
    iput p1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    .line 51
    iput p2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mIntentType:I

    .line 53
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigFlash;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    .line 54
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigHdr;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    .line 55
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    .line 56
    new-instance v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigBeauty:Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    .line 57
    return-void
.end method

.method public static provideLocalId(II)I
    .locals 1
    .param p0, "cameraId"    # I
    .param p1, "intentType"    # I

    .prologue
    .line 60
    if-nez p1, :cond_0

    .line 61
    return p0

    .line 63
    :cond_0
    add-int/lit8 v0, p0, 0x64

    return v0
.end method


# virtual methods
.method public getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    return-object v0
.end method

.method public getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentConfigBeauty:Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    return-object v0
.end method

.method public getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    return-object v0
.end method

.method public getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    return-object v0
.end method

.method public getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyDualLens:Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    return-object v0
.end method

.method public getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    if-nez v0, :cond_0

    .line 103
    new-instance v0, Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    invoke-direct {v0, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;-><init>(Lcom/android/camera/data/data/config/DataItemConfig;)V

    iput-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mManuallyFocus:Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    return-object v0
.end method

.method public isTransient()Z
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 3

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "camera_settings_simple_mode_local_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    iget v2, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mIntentType:I

    invoke-static {v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->provideLocalId(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public reConfigBokehIfHdrChanged(ILjava/lang/String;)Z
    .locals 2
    .param p1, "currentMode"    # I
    .param p2, "newHdrValue"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 228
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportBokeh()Z

    move-result v0

    if-nez v0, :cond_0

    .line 229
    return v1

    .line 232
    :cond_0
    const-string/jumbo v0, "on"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 236
    :cond_1
    const-string/jumbo v0, "on"

    iget-object v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    invoke-virtual {v1, p1}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 237
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    const-string/jumbo v1, "off"

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->setComponentValue(ILjava/lang/String;)V

    .line 240
    :cond_2
    const/4 v0, 0x1

    return v0

    .line 232
    :cond_3
    const-string/jumbo v0, "normal"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "live"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 243
    return v1
.end method

.method public reConfigFlashIfHdrChanged(ILjava/lang/String;)Z
    .locals 4
    .param p1, "currentMode"    # I
    .param p2, "newHdrValue"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 137
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "currentFlash":Ljava/lang/String;
    const/4 v1, 0x0

    .line 139
    .local v1, "newFlashValue":Ljava/lang/String;
    const-string/jumbo v2, "auto"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 141
    const-string/jumbo v2, "1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 142
    const-string/jumbo v2, "2"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 141
    if-eqz v2, :cond_7

    .line 143
    :cond_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAsdFlash()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 144
    const-string/jumbo v1, "3"

    .line 161
    .end local v1    # "newFlashValue":Ljava/lang/String;
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 162
    :cond_2
    return v3

    .line 139
    .restart local v1    # "newFlashValue":Ljava/lang/String;
    :cond_3
    const-string/jumbo v2, "on"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 152
    :cond_4
    const-string/jumbo v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 153
    const-string/jumbo v1, "0"

    .local v1, "newFlashValue":Ljava/lang/String;
    goto :goto_0

    .line 139
    .local v1, "newFlashValue":Ljava/lang/String;
    :cond_5
    const-string/jumbo v2, "normal"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string/jumbo v2, "live"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string/jumbo v2, "off"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 144
    :cond_6
    const-string/jumbo v1, "0"

    .local v1, "newFlashValue":Ljava/lang/String;
    goto :goto_0

    .line 145
    .local v1, "newFlashValue":Ljava/lang/String;
    :cond_7
    const-string/jumbo v2, "101"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 146
    const-string/jumbo v1, "3"

    .local v1, "newFlashValue":Ljava/lang/String;
    goto :goto_0

    .line 164
    .end local v1    # "newFlashValue":Ljava/lang/String;
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setComponentValue(ILjava/lang/String;)V

    .line 165
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 166
    return v3

    .line 168
    :cond_9
    const/4 v2, 0x1

    return v2
.end method

.method public reConfigHdrIfBokehChanged(ILjava/lang/String;)Z
    .locals 3
    .param p1, "currentMode"    # I
    .param p2, "newBokehValue"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 212
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v0

    if-nez v0, :cond_0

    .line 213
    return v2

    .line 216
    :cond_0
    const-string/jumbo v0, "on"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 217
    const-string/jumbo v0, "off"

    iget-object v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    invoke-virtual {v1, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 218
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    const-string/jumbo v1, "off"

    invoke-virtual {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setComponentValue(ILjava/lang/String;)V

    .line 219
    const/4 v0, 0x1

    return v0

    .line 222
    :cond_1
    return v2
.end method

.method public reConfigHhrIfFlashChanged(ILjava/lang/String;)Z
    .locals 4
    .param p1, "currentMode"    # I
    .param p2, "newFlashValue"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 175
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "currentHdr":Ljava/lang/String;
    const/4 v1, 0x0

    .line 177
    .local v1, "newHdrValue":Ljava/lang/String;
    const-string/jumbo v2, "3"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 178
    const-string/jumbo v2, "103"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 177
    if-eqz v2, :cond_5

    .line 179
    :cond_0
    const-string/jumbo v2, "normal"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 180
    const-string/jumbo v2, "live"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 179
    if-eqz v2, :cond_2

    .line 181
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAsdHdr()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 182
    const-string/jumbo v1, "auto"

    .line 196
    .end local v1    # "newHdrValue":Ljava/lang/String;
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 197
    :cond_3
    return v3

    .line 182
    .restart local v1    # "newHdrValue":Ljava/lang/String;
    :cond_4
    const-string/jumbo v1, "off"

    .local v1, "newHdrValue":Ljava/lang/String;
    goto :goto_0

    .line 184
    .local v1, "newHdrValue":Ljava/lang/String;
    :cond_5
    const-string/jumbo v2, "1"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 185
    const-string/jumbo v2, "101"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 184
    if-eqz v2, :cond_7

    .line 186
    :cond_6
    const-string/jumbo v2, "off"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 187
    const-string/jumbo v1, "off"

    .local v1, "newHdrValue":Ljava/lang/String;
    goto :goto_0

    .line 189
    .local v1, "newHdrValue":Ljava/lang/String;
    :cond_7
    const-string/jumbo v2, "2"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 190
    const-string/jumbo v2, "live"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 191
    const-string/jumbo v2, "off"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 190
    if-eqz v2, :cond_2

    .line 192
    const-string/jumbo v1, "off"

    .local v1, "newHdrValue":Ljava/lang/String;
    goto :goto_0

    .line 199
    .end local v1    # "newHdrValue":Ljava/lang/String;
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setComponentValue(ILjava/lang/String;)V

    .line 201
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 202
    return v3

    .line 204
    :cond_9
    const/4 v2, 0x1

    return v2
.end method

.method public reInitComponent(ILcom/android/camera2/CameraCapabilities;)V
    .locals 2
    .param p1, "currentMode"    # I
    .param p2, "p"    # Lcom/android/camera2/CameraCapabilities;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;

    .line 81
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;

    .line 82
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    iget v1, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mCameraId:I

    invoke-virtual {v0, p1, v1, p2}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;

    .line 83
    return-void
.end method

.method public resetAll()V
    .locals 1

    .prologue
    .line 247
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 248
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->clearClosed()V

    .line 249
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->clearClosed()V

    .line 250
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->clearClosed()V

    .line 251
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->clearClosed()V

    .line 253
    return-void
.end method

.method public supportBokeh()Z
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentBokeh:Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public supportFlash()Z
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentFlash:Lcom/android/camera/data/data/config/ComponentConfigFlash;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public supportHdr()Z
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/camera/data/data/config/DataItemConfig;->mComponentHdr:Lcom/android/camera/data/data/config/ComponentConfigHdr;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
