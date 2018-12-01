.class public Lcom/android/camera/data/data/config/ComponentConfigFlash;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigFlash.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# instance fields
.field private mIsClosed:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 5
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    const v4, 0x7f0200ae

    .line 45
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    .line 47
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 50
    const-string/jumbo v2, "0"

    .line 49
    const v3, 0x7f0f0056

    .line 47
    invoke-direct {v1, v4, v4, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsClosed:Z

    .line 231
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    const-string/jumbo v0, "0"

    return-object v0

    .line 88
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    const-string/jumbo v0, "0"

    return-object v0

    .line 91
    :cond_1
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 80
    const-string/jumbo v0, "0"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 55
    const v0, 0x7f0f0053

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
    .line 111
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 60
    packed-switch p1, :pswitch_data_0

    .line 63
    :pswitch_0
    const-string/jumbo v0, "pref_camera_flashmode_key"

    return-object v0

    .line 70
    :pswitch_1
    const-string/jumbo v0, "pref_camera_video_flashmode_key"

    return-object v0

    .line 73
    :pswitch_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unspecified flash"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :pswitch_data_0
    .packed-switch 0xa0
        :pswitch_2
        :pswitch_1
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
    .line 100
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValueSelectedDrawableIgnoreClose(I)I
    .locals 4
    .param p1, "mode"    # I

    .prologue
    const v3, 0x7f0200ad

    const v1, 0x7f0200af

    .line 211
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "value":Ljava/lang/String;
    const-string/jumbo v2, "1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 213
    return v1

    .line 214
    :cond_0
    const-string/jumbo v2, "3"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 215
    return v3

    .line 216
    :cond_1
    const-string/jumbo v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 217
    const v1, 0x7f0200ae

    return v1

    .line 218
    :cond_2
    const-string/jumbo v2, "2"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 219
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_0
    return v1

    :cond_3
    const v1, 0x7f0200b0

    goto :goto_0

    .line 220
    :cond_4
    const-string/jumbo v2, "103"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 221
    return v3

    .line 222
    :cond_5
    const-string/jumbo v2, "101"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 223
    return v1

    .line 226
    :cond_6
    const/4 v1, -0x1

    return v1
.end method

.method public getValueSelectedStringIdIgnoreClose(I)I
    .locals 4
    .param p1, "mode"    # I

    .prologue
    const v3, 0x7f0f00cb

    const v1, 0x7f0f00ca

    .line 239
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, "value":Ljava/lang/String;
    const-string/jumbo v2, "1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 241
    return v1

    .line 242
    :cond_0
    const-string/jumbo v2, "3"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 243
    return v3

    .line 244
    :cond_1
    const-string/jumbo v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 245
    const v1, 0x7f0f00cc

    return v1

    .line 246
    :cond_2
    const-string/jumbo v2, "2"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 247
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_0
    return v1

    :cond_3
    const v1, 0x7f0f00cd

    goto :goto_0

    .line 248
    :cond_4
    const-string/jumbo v2, "103"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 249
    return v3

    .line 250
    :cond_5
    const-string/jumbo v2, "101"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 251
    return v1

    .line 253
    :cond_6
    const/4 v1, -0x1

    return v1
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsClosed:Z

    return v0
.end method

.method public isValidFlashValue(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 262
    const-string/jumbo v0, "^[0-9]+$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;
    .locals 9
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
    const v8, 0x7f0f0055

    const v7, 0x7f0200b0

    const v6, 0x7f0200ae

    const v5, 0x7f0200ad

    const v4, 0x7f0200af

    .line 116
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    if-nez v0, :cond_3

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    .line 124
    :goto_0
    sparse-switch p1, :sswitch_data_0

    .line 134
    :cond_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isFlashSupported()Z

    move-result v0

    if-nez v0, :cond_5

    .line 135
    const/4 v0, 0x1

    if-ne p2, v0, :cond_2

    .line 136
    invoke-static {}, Lcom/android/camera/Device;->isSupportScreenLight()Z

    move-result v0

    .line 135
    if-eqz v0, :cond_2

    .line 137
    const/16 v0, 0xa3

    if-eq p1, v0, :cond_1

    .line 138
    const/16 v0, 0xa5

    if-ne p1, v0, :cond_4

    .line 140
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 143
    const-string/jumbo v2, "0"

    .line 142
    const v3, 0x7f0f0056

    .line 140
    invoke-direct {v1, v6, v6, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 147
    const-string/jumbo v2, "103"

    .line 146
    const v3, 0x7f0f0054

    .line 144
    invoke-direct {v1, v5, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 151
    const-string/jumbo v2, "101"

    .line 148
    invoke-direct {v1, v4, v4, v8, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    :cond_2
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object v0

    .line 119
    :cond_3
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_0

    .line 127
    :sswitch_0
    if-nez p2, :cond_0

    .line 128
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object v0

    .line 139
    :cond_4
    const/16 v0, 0xab

    if-ne p1, v0, :cond_2

    goto :goto_1

    .line 157
    :cond_5
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 160
    const-string/jumbo v2, "0"

    .line 159
    const v3, 0x7f0f0056

    .line 157
    invoke-direct {v1, v6, v6, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    packed-switch p1, :pswitch_data_0

    .line 166
    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 169
    const-string/jumbo v2, "3"

    .line 168
    const v3, 0x7f0f0054

    .line 166
    invoke-direct {v1, v5, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 171
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 174
    const-string/jumbo v2, "1"

    .line 171
    invoke-direct {v1, v4, v4, v8, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Lcom/android/camera/Device;->isSupportFrontFlash()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 177
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 180
    const-string/jumbo v2, "2"

    .line 177
    invoke-direct {v1, v4, v4, v8, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    return-object v0

    .line 181
    :cond_8
    invoke-static {}, Lcom/android/camera/Device;->isSupportedTorchCapture()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 182
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 185
    const-string/jumbo v2, "2"

    .line 184
    const v3, 0x7f0f0057

    .line 182
    invoke-direct {v1, v7, v7, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 194
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 197
    const-string/jumbo v2, "2"

    .line 196
    const v3, 0x7f0f0057

    .line 194
    invoke-direct {v1, v7, v7, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 124
    :sswitch_data_0
    .sparse-switch
        0xa6 -> :sswitch_0
        0xab -> :sswitch_0
    .end sparse-switch

    .line 162
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
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

.method public setClosed(Z)V
    .locals 0
    .param p1, "close"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigFlash;->mIsClosed:Z

    .line 42
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1
    .param p1, "mode"    # I
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setClosed(Z)V

    .line 106
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 107
    return-void
.end method
