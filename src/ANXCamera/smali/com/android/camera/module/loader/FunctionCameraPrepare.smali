.class public Lcom/android/camera/module/loader/FunctionCameraPrepare;
.super Lcom/android/camera/module/loader/Func1Base;
.source "FunctionCameraPrepare.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/module/loader/Func1Base",
        "<",
        "Lcom/android/camera/Camera;",
        "Lcom/android/camera/module/BaseModule;",
        ">;"
    }
.end annotation


# instance fields
.field private baseModule:Lcom/android/camera/module/BaseModule;

.field private mResetType:I


# direct methods
.method public constructor <init>(IILcom/android/camera/module/BaseModule;)V
    .locals 0
    .param p1, "currentMode"    # I
    .param p2, "resetType"    # I
    .param p3, "baseModule"    # Lcom/android/camera/module/BaseModule;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/Func1Base;-><init>(I)V

    .line 43
    iput p2, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mResetType:I

    .line 44
    iput-object p3, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->baseModule:Lcom/android/camera/module/BaseModule;

    .line 46
    return-void
.end method

.method private reconfigureData()V
    .locals 15

    .prologue
    .line 83
    invoke-static {}, Lcom/android/camera/CameraSettings;->upgradeGlobalPreferences()V

    .line 86
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v7

    .line 87
    .local v7, "dataItemGlobal":Lcom/android/camera/data/data/global/DataItemGlobal;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v8

    .line 88
    .local v8, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    .line 90
    .local v6, "dataItemConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLastCameraId()I

    move-result v11

    .line 92
    .local v11, "lastCameraId":I
    invoke-virtual {v6}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v3

    .line 96
    .local v3, "componentConfigFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    invoke-virtual {v6}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v4

    .line 97
    .local v4, "configEditor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v5

    .line 100
    .local v5, "dataBackUp":Lcom/android/camera/data/backup/DataBackUp;
    const-string/jumbo v12, "pref_camera_zoom_key"

    invoke-interface {v4, v12}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v12

    const-string/jumbo v13, "pref_camera_exposure_key"

    invoke-interface {v12, v13}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 102
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v12}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getPersistValue(I)Ljava/lang/String;

    move-result-object v10

    .line 104
    .local v10, "flashValue":Ljava/lang/String;
    invoke-virtual {v3, v10}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->isValidFlashValue(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 105
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v12}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getKey(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v4, v12}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 112
    :cond_0
    :goto_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportedManualFunction()Z

    move-result v12

    if-nez v12, :cond_1

    .line 113
    const-string/jumbo v12, "pref_focus_position_key"

    invoke-interface {v4, v12}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 114
    const-string/jumbo v12, "pref_qc_camera_exposuretime_key"

    invoke-interface {v4, v12}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 118
    :cond_1
    const-string/jumbo v12, "pref_camera_lab_option_key_visible"

    const/4 v13, 0x0

    invoke-virtual {v7, v12, v13}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-nez v12, :cond_2

    .line 119
    const-string/jumbo v12, "pref_camera_facedetection_key"

    const/4 v13, 0x1

    invoke-virtual {v7, v12, v13}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    xor-int/lit8 v12, v12, 0x1

    .line 118
    if-eqz v12, :cond_2

    .line 120
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v12

    const-string/jumbo v13, "pref_camera_facedetection_key"

    invoke-interface {v12, v13}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v12

    invoke-interface {v12}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 123
    :cond_2
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mResetType:I

    packed-switch v12, :pswitch_data_0

    .line 233
    :cond_3
    :goto_1
    :pswitch_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportLensDirtyDetect()Z

    move-result v9

    .line 234
    .local v9, "enableLensDirtyDetect":Z
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mResetType:I

    const/4 v13, 0x3

    if-ne v12, v13, :cond_4

    .line 235
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v12

    if-ne v11, v12, :cond_4

    .line 236
    const/4 v9, 0x0

    .line 239
    .end local v9    # "enableLensDirtyDetect":Z
    :cond_4
    if-eqz v9, :cond_5

    .line 240
    const-string/jumbo v12, "pref_lens_dirty_detect_enabled_key"

    const/4 v13, 0x1

    invoke-interface {v4, v12, v13}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 244
    :cond_5
    invoke-interface {v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 246
    return-void

    .line 106
    :cond_6
    const-string/jumbo v12, "2"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 107
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v12}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getKey(I)Ljava/lang/String;

    move-result-object v12

    .line 108
    iget v13, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v13}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v13

    .line 107
    invoke-interface {v4, v12, v13}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 131
    :pswitch_1
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    packed-switch v12, :pswitch_data_1

    .line 159
    :pswitch_2
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    .line 160
    .local v2, "cameraId":I
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v12

    iget v13, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v12, v2, v13, v4}, Lcom/android/camera/effect/BeautyParameters;->initBeauty(IILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 164
    :goto_2
    invoke-virtual {v7, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraIdTransient(I)V

    .line 167
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v7, v12}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v12

    invoke-interface {v5, v8, v12, v2}, Lcom/android/camera/data/backup/DataBackUp;->revertRunning(Lcom/android/camera/data/data/runing/DataItemRunning;II)V

    goto :goto_1

    .line 133
    .end local v2    # "cameraId":I
    :pswitch_3
    const/4 v2, 0x0

    .line 134
    .restart local v2    # "cameraId":I
    goto :goto_2

    .line 136
    .end local v2    # "cameraId":I
    :pswitch_4
    const/4 v2, 0x0

    .line 137
    .restart local v2    # "cameraId":I
    goto :goto_2

    .line 139
    .end local v2    # "cameraId":I
    :pswitch_5
    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 140
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    .line 144
    .restart local v2    # "cameraId":I
    :goto_3
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v12

    iget v13, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v12, v2, v13, v4}, Lcom/android/camera/effect/BeautyParameters;->initBeauty(IILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    goto :goto_2

    .line 142
    .end local v2    # "cameraId":I
    :cond_7
    const/4 v2, 0x0

    .restart local v2    # "cameraId":I
    goto :goto_3

    .line 148
    .end local v2    # "cameraId":I
    :pswitch_6
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    .restart local v2    # "cameraId":I
    goto :goto_2

    .line 155
    .end local v2    # "cameraId":I
    :pswitch_7
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v2

    .restart local v2    # "cameraId":I
    goto :goto_2

    .line 175
    .end local v2    # "cameraId":I
    :pswitch_8
    invoke-direct {p0, v3, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetFlash(Lcom/android/camera/data/data/config/ComponentConfigFlash;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 176
    invoke-virtual {v6}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v12

    invoke-direct {p0, v12, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetHdr(Lcom/android/camera/data/data/config/ComponentConfigHdr;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 177
    invoke-virtual {v6}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v12

    invoke-direct {p0, v12, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetBokeh(Lcom/android/camera/data/data/config/ComponentConfigBokeh;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 181
    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v12

    if-nez v12, :cond_8

    .line 184
    invoke-virtual {v6}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v12

    invoke-direct {p0, v12, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetBeauty(Lcom/android/camera/data/data/config/ComponentConfigBeauty;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 185
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v12

    const/4 v13, 0x1

    invoke-interface {v12, v13}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(I)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .line 190
    .local v0, "anotherConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    :goto_4
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    .line 191
    .local v1, "anotherEditor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v12

    invoke-direct {p0, v12, v1}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetFlash(Lcom/android/camera/data/data/config/ComponentConfigFlash;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 192
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v12

    invoke-direct {p0, v12, v1}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetHdr(Lcom/android/camera/data/data/config/ComponentConfigHdr;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 193
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentBokeh()Lcom/android/camera/data/data/config/ComponentConfigBokeh;

    move-result-object v12

    invoke-direct {p0, v12, v1}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->resetBokeh(Lcom/android/camera/data/data/config/ComponentConfigBokeh;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 194
    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 201
    invoke-virtual {v8}, Lcom/android/camera/data/data/runing/DataItemRunning;->resetAll()V

    .line 202
    invoke-interface {v5}, Lcom/android/camera/data/backup/DataBackUp;->clearBackUp()V

    .line 204
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    sparse-switch v12, :sswitch_data_0

    goto/16 :goto_1

    .line 208
    :sswitch_0
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v12

    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v13

    iget v14, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v12, v13, v14, v4}, Lcom/android/camera/effect/BeautyParameters;->initBeauty(IILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    goto/16 :goto_1

    .line 187
    .end local v0    # "anotherConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    .end local v1    # "anotherEditor":Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    :cond_8
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v12

    const/4 v13, 0x0

    invoke-interface {v12, v13}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(I)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/config/DataItemConfig;

    .restart local v0    # "anotherConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    goto :goto_4

    .line 219
    .end local v0    # "anotherConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    :pswitch_9
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v7, v12}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v12

    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v13

    invoke-interface {v5, v8, v12, v13}, Lcom/android/camera/data/backup/DataBackUp;->revertRunning(Lcom/android/camera/data/data/runing/DataItemRunning;II)V

    .line 221
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v12}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getPersistValue(I)Ljava/lang/String;

    move-result-object v12

    const-string/jumbo v13, "2"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 222
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v12}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getKey(I)Ljava/lang/String;

    move-result-object v12

    .line 223
    iget v13, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v3, v13}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v13

    .line 222
    invoke-interface {v4, v12, v13}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 225
    :cond_9
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    const/16 v13, 0xa3

    if-eq v12, v13, :cond_a

    .line 226
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    const/16 v13, 0xa5

    if-ne v12, v13, :cond_b

    .line 228
    :cond_a
    :goto_5
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v12

    invoke-virtual {v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v13

    iget v14, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {v12, v13, v14, v4}, Lcom/android/camera/effect/BeautyParameters;->initBeauty(IILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    goto/16 :goto_1

    .line 227
    :cond_b
    iget v12, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    const/16 v13, 0xab

    if-ne v12, v13, :cond_3

    goto :goto_5

    .line 123
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_8
    .end packed-switch

    .line 131
    :pswitch_data_1
    .packed-switch 0xa1
        :pswitch_6
        :pswitch_7
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_5
    .end packed-switch

    .line 204
    :sswitch_data_0
    .sparse-switch
        0xa3 -> :sswitch_0
        0xa5 -> :sswitch_0
        0xab -> :sswitch_0
    .end sparse-switch
.end method

.method private resetBeauty(Lcom/android/camera/data/data/config/ComponentConfigBeauty;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 2
    .param p1, "componentConfigBeauty"    # Lcom/android/camera/data/data/config/ComponentConfigBeauty;
    .param p2, "configEditor"    # Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .prologue
    .line 278
    iget v0, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->BEAUTY_CLOSE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 279
    iget v0, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getKey(I)Ljava/lang/String;

    move-result-object v0

    .line 280
    iget v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v1

    .line 279
    invoke-interface {p2, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 283
    :cond_0
    return-void
.end method

.method private resetBokeh(Lcom/android/camera/data/data/config/ComponentConfigBokeh;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 2
    .param p1, "componentConfigBokeh"    # Lcom/android/camera/data/data/config/ComponentConfigBokeh;
    .param p2, "configEditor"    # Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .prologue
    .line 271
    iget v0, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "on"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 272
    iget v0, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getKey(I)Ljava/lang/String;

    move-result-object v0

    .line 273
    iget v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigBokeh;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v1

    .line 272
    invoke-interface {p2, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 275
    :cond_0
    return-void
.end method

.method private resetFlash(Lcom/android/camera/data/data/config/ComponentConfigFlash;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 2
    .param p1, "componentConfigFlash"    # Lcom/android/camera/data/data/config/ComponentConfigFlash;
    .param p2, "configEditor"    # Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .prologue
    .line 250
    iget v0, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 251
    iget v0, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getKey(I)Ljava/lang/String;

    move-result-object v0

    .line 252
    iget v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v1

    .line 251
    invoke-interface {p2, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 255
    :cond_0
    return-void
.end method

.method private resetHdr(Lcom/android/camera/data/data/config/ComponentConfigHdr;Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 3
    .param p1, "componentConfigHdr"    # Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .param p2, "configEditor"    # Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .prologue
    .line 259
    iget v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getPersistValue(I)Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "hdrValue":Ljava/lang/String;
    const-string/jumbo v1, "auto"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 261
    const-string/jumbo v1, "off"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 260
    if-eqz v1, :cond_0

    .line 262
    iget v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getKey(I)Ljava/lang/String;

    move-result-object v1

    .line 263
    iget v2, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->mTargetMode:I

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v2

    .line 262
    invoke-interface {p2, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 267
    :cond_0
    return-void
.end method


# virtual methods
.method public apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;
    .locals 3
    .param p1    # Lcom/android/camera/module/loader/NullHolder;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/Camera;",
            ">;)",
            "Lcom/android/camera/module/loader/NullHolder",
            "<",
            "Lcom/android/camera/module/BaseModule;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "cameraNullHolder":Lcom/android/camera/module/loader/NullHolder;, "Lcom/android/camera/module/loader/NullHolder<Lcom/android/camera/Camera;>;"
    const/4 v2, 0x0

    .line 56
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->isPresent()Z

    move-result v1

    if-nez v1, :cond_0

    .line 57
    const/16 v1, 0xea

    invoke-static {v2, v1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v1

    return-object v1

    .line 60
    :cond_0
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v1

    if-nez v1, :cond_1

    .line 61
    const/16 v1, 0xe5

    invoke-static {v2, v1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v1

    return-object v1

    .line 64
    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/module/loader/NullHolder;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/Camera;

    .line 65
    .local v0, "cameraActivity":Lcom/android/camera/Camera;
    invoke-virtual {v0}, Lcom/android/camera/Camera;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 66
    const/16 v1, 0xeb

    invoke-static {v2, v1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v1

    return-object v1

    .line 69
    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/Camera;->changeRequestOrientation()V

    .line 72
    iget-object v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->baseModule:Lcom/android/camera/module/BaseModule;

    invoke-virtual {v1}, Lcom/android/camera/module/BaseModule;->isDeparted()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 73
    iget-object v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->baseModule:Lcom/android/camera/module/BaseModule;

    const/16 v2, 0xe1

    invoke-static {v1, v2}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;I)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v1

    return-object v1

    .line 77
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->reconfigureData()V

    .line 79
    iget-object v1, p0, Lcom/android/camera/module/loader/FunctionCameraPrepare;->baseModule:Lcom/android/camera/module/BaseModule;

    invoke-static {v1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v1

    return-object v1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 53
    check-cast p1, Lcom/android/camera/module/loader/NullHolder;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/FunctionCameraPrepare;->apply(Lcom/android/camera/module/loader/NullHolder;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object v0

    return-object v0
.end method
