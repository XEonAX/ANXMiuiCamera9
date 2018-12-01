.class public Lcom/android/camera/data/data/config/ComponentConfigBokeh;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigBokeh.java"


# instance fields
.field private mIsClosed:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    .line 22
    return-void
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mIsClosed:Z

    .line 121
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    const-string/jumbo v0, "off"

    return-object v0

    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 55
    const-string/jumbo v0, "off"

    return-object v0

    .line 57
    :cond_1
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "currentMode"    # I

    .prologue
    .line 46
    const-string/jumbo v0, "off"

    return-object v0
.end method

.method public getDisplayTitleString()I
    .locals 1

    .prologue
    .line 36
    const v0, 0x7f0f0106

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
    .line 77
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 41
    const-string/jumbo v0, "pref_camera_bokeh_key"

    return-object v0
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mIsClosed:Z

    return v0
.end method

.method public reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;
    .locals 6
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
    const v5, 0x7f0200db

    .line 81
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    .line 87
    :goto_0
    invoke-virtual {p3}, Lcom/android/camera2/CameraCapabilities;->isSupportBokeh()Z

    move-result v0

    if-nez v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    return-object v0

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_0

    .line 91
    :cond_1
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v0

    if-ne p2, v0, :cond_2

    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 97
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 100
    const-string/jumbo v2, "off"

    .line 99
    const v3, 0x7f0f0059

    .line 97
    invoke-direct {v1, v5, v5, v3, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    .line 104
    const-string/jumbo v2, "on"

    .line 102
    const v3, 0x7f0200dc

    .line 103
    const v4, 0x7f0f0058

    .line 101
    invoke-direct {v1, v5, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_2
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public setClosed(Z)V
    .locals 0
    .param p1, "close"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->mIsClosed:Z

    .line 32
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1
    .param p1, "mode"    # I
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->setClosed(Z)V

    .line 72
    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 73
    return-void
.end method

.method public toggle(I)V
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 112
    const-string/jumbo v0, "on"

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    const-string/jumbo v0, "off"

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->setComponentValue(ILjava/lang/String;)V

    .line 117
    :goto_0
    return-void

    .line 115
    :cond_0
    const-string/jumbo v0, "on"

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->setComponentValue(ILjava/lang/String;)V

    goto :goto_0
.end method
