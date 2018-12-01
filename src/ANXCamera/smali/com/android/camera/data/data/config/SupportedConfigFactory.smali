.class public Lcom/android/camera/data/data/config/SupportedConfigFactory;
.super Ljava/lang/Object;
.source "SupportedConfigFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/data/data/config/SupportedConfigFactory$ConfigItem;,
        Lcom/android/camera/data/data/config/SupportedConfigFactory$MutexElement;
    }
.end annotation


# static fields
.field public static final MUTEX_MENU_CONFIGS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 78
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    .line 26
    return-void

    .line 78
    :array_0
    .array-data 4
        0xe5
        0xec
        0xeb
        0xe4
        0xe6
        0xf1
        0xea
        0xc3
        0xee
        0xc7
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getConfigKey(I)Ljava/lang/String;
    .locals 2
    .param p0, "configItem"    # I

    .prologue
    .line 130
    sparse-switch p0, :sswitch_data_0

    .line 154
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "unknown config item"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :sswitch_0
    const-string/jumbo v0, "pref_camera_gradienter_key"

    return-object v0

    .line 134
    :sswitch_1
    const-string/jumbo v0, "pref_camera_magic_mirror_key"

    return-object v0

    .line 136
    :sswitch_2
    const-string/jumbo v0, "pref_camera_groupshot_mode_key"

    return-object v0

    .line 138
    :sswitch_3
    const-string/jumbo v0, "pref_camera_tilt_shift_mode"

    return-object v0

    .line 140
    :sswitch_4
    const-string/jumbo v0, "pref_camera_hand_night_key"

    return-object v0

    .line 142
    :sswitch_5
    const-string/jumbo v0, "pref_camera_super_resolution_key"

    return-object v0

    .line 144
    :sswitch_6
    const-string/jumbo v0, "pref_camera_scenemode_setting_key"

    return-object v0

    .line 146
    :sswitch_7
    const-string/jumbo v0, "pref_camera_portrait_mode_key"

    return-object v0

    .line 148
    :sswitch_8
    const-string/jumbo v0, "pref_camera_show_gender_age_key"

    return-object v0

    .line 150
    :sswitch_9
    const-string/jumbo v0, "pref_camera_peak_key"

    return-object v0

    .line 152
    :sswitch_a
    const-string/jumbo v0, "pref_camera_ai_scene_mode_key"

    return-object v0

    .line 130
    :sswitch_data_0
    .sparse-switch
        0xc3 -> :sswitch_7
        0xc7 -> :sswitch_9
        0xc9 -> :sswitch_a
        0xe4 -> :sswitch_3
        0xe5 -> :sswitch_0
        0xe6 -> :sswitch_4
        0xea -> :sswitch_6
        0xeb -> :sswitch_2
        0xec -> :sswitch_1
        0xee -> :sswitch_8
        0xf1 -> :sswitch_5
    .end sparse-switch
.end method

.method public static final getSupportedExtraConfigs(IILcom/android/camera/data/cloud/DataCloud$CloudFeature;Lcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 7
    .param p0, "currentMode"    # I
    .param p1, "cameraId"    # I
    .param p2, "cloudFeature"    # Lcom/android/camera/data/cloud/DataCloud$CloudFeature;
    .param p3, "p"    # Lcom/android/camera2/CameraCapabilities;

    .prologue
    const/16 v6, 0xa3

    const/4 v5, 0x1

    const/16 v4, 0xe2

    const/16 v2, 0xe1

    const/16 v3, 0xa5

    .line 308
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v0}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 311
    .local v0, "configs":Lcom/android/camera/data/data/config/SupportedConfigs;
    const/4 v1, 0x0

    .line 313
    .local v1, "isImageCaptureIntent":Z
    packed-switch p0, :pswitch_data_0

    .line 318
    :pswitch_0
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 320
    packed-switch p1, :pswitch_data_1

    .line 416
    :cond_0
    :goto_0
    invoke-interface {p2, v0}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v2

    return-object v2

    .line 322
    :pswitch_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportedTiltShift()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 323
    const/16 v2, 0xe4

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 326
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportGradienter()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 327
    const/16 v2, 0xe5

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 330
    :cond_2
    sget-boolean v2, Lcom/android/camera/Device;->IS_HONGMI:Z

    if-eqz v2, :cond_3

    .line 331
    const/16 v2, 0xea

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 334
    :cond_3
    if-eq p0, v3, :cond_4

    .line 335
    invoke-static {}, Lcom/android/camera/Device;->isSupportGroupShot()Z

    move-result v2

    .line 334
    if-eqz v2, :cond_4

    .line 336
    const/16 v2, 0xeb

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 342
    :cond_4
    if-eq p0, v3, :cond_5

    if-ne p0, v6, :cond_6

    .line 343
    :cond_5
    invoke-static {}, Lcom/android/camera/Device;->isSupportedSkinBeautify()Z

    move-result v2

    .line 342
    if-eqz v2, :cond_6

    .line 344
    const/16 v2, 0xef

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 356
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->checkLensAvailability(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 357
    const/16 v2, 0xf2

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_0

    .line 362
    :pswitch_2
    invoke-static {}, Lcom/android/camera/Device;->isSupportGroupShot()Z

    move-result v2

    if-eqz v2, :cond_7

    if-eq p0, v3, :cond_7

    .line 363
    const/16 v2, 0xeb

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 365
    :cond_7
    if-eq p0, v3, :cond_8

    if-ne p0, v6, :cond_0

    .line 366
    :cond_8
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAgeDetection()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-static {}, Lcom/android/camera/Device;->isSupportedSkinBeautify()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 367
    const/16 v2, 0xee

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 370
    :cond_9
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMagicMirror()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 371
    const/16 v2, 0xec

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto :goto_0

    .line 380
    :pswitch_3
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 381
    if-ne p1, v5, :cond_0

    invoke-static {}, Lcom/android/camera/Device;->isSupportedFrontPortrait()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 382
    invoke-static {}, Lcom/android/camera/Device;->isSupportedAgeDetection()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-static {}, Lcom/android/camera/Device;->isSupportedSkinBeautify()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 383
    const/16 v2, 0xee

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 386
    :cond_a
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMagicMirror()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 387
    const/16 v2, 0xec

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_0

    .line 392
    :pswitch_4
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_0

    .line 404
    :pswitch_5
    packed-switch p1, :pswitch_data_2

    goto/16 :goto_0

    .line 406
    :pswitch_6
    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    move-result-object v2

    const/16 v3, 0xe9

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 407
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 408
    const/16 v2, 0xe8

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    goto/16 :goto_0

    .line 313
    nop

    :pswitch_data_0
    .packed-switch 0xa2
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_3
    .end packed-switch

    .line 320
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 404
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public static final getSupportedTopConfigs(ILcom/android/camera/data/data/config/DataItemConfig;ILcom/android/camera2/CameraCapabilities;)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 10
    .param p0, "currentMode"    # I
    .param p1, "dataItemConfig"    # Lcom/android/camera/data/data/config/DataItemConfig;
    .param p2, "cameraId"    # I
    .param p3, "p"    # Lcom/android/camera2/CameraCapabilities;

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v5, 0x0

    const/16 v6, 0xc6

    .line 164
    invoke-virtual {p1, p0, p3}, Lcom/android/camera/data/data/config/DataItemConfig;->reInitComponent(ILcom/android/camera2/CameraCapabilities;)V

    .line 166
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .local v2, "supports":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportFlash()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 169
    const/16 v3, 0xc1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    :cond_0
    packed-switch p0, :pswitch_data_0

    .line 175
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 176
    const/16 v3, 0xc2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_1
    invoke-static {}, Lcom/android/camera/Device;->isSupportAiScene()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 180
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v3

    if-ne p2, v3, :cond_2

    .line 181
    const/16 v3, 0xc9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    :cond_2
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportBokeh()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 186
    const/16 v3, 0xc8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_3
    const/16 v3, 0xc4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    const/16 v3, 0xc5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    :goto_0
    new-instance v0, Lcom/android/camera/data/data/config/SupportedConfigs;

    const/4 v3, 0x7

    invoke-direct {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>(I)V

    .line 266
    .local v0, "configs":Lcom/android/camera/data/data/config/SupportedConfigs;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    packed-switch v3, :pswitch_data_1

    .line 301
    :goto_1
    return-object v0

    .line 195
    .end local v0    # "configs":Lcom/android/camera/data/data/config/SupportedConfigs;
    :pswitch_1
    const/16 v3, 0xc4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    const/16 v3, 0xc5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 203
    :pswitch_2
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v3

    if-ne p2, v3, :cond_6

    .line 204
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 205
    const/16 v3, 0xc2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    :cond_4
    invoke-static {}, Lcom/android/camera/Device;->isSupportedHFR()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-static {}, Lcom/android/camera/Device;->isSupportVideoHFRMode()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 208
    const/16 v3, 0xca

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    :cond_5
    const/16 v3, 0xc5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 212
    :cond_6
    const/16 v3, 0xe1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 218
    :pswitch_3
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object v1

    .line 219
    .local v1, "manuallyFocus":Lcom/android/camera/data/data/config/ComponentManuallyFocus;
    invoke-static {}, Lcom/android/camera/Device;->isSupportedPeakingMF()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 220
    invoke-virtual {v1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p0}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    .line 219
    if-eqz v3, :cond_7

    .line 221
    const/16 v3, 0xc7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    :cond_7
    const/16 v3, 0xc4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    const/16 v3, 0xc5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 229
    .end local v1    # "manuallyFocus":Lcom/android/camera/data/data/config/ComponentManuallyFocus;
    :pswitch_4
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportHdr()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 230
    const/16 v3, 0xc2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    :cond_8
    invoke-static {}, Lcom/android/camera/Device;->isSupportAiScene()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 234
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v3

    if-ne p2, v3, :cond_9

    .line 235
    const/16 v3, 0xc9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    :cond_9
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->supportBokeh()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 241
    const/16 v3, 0xc8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    :cond_a
    const/16 v3, 0xc4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    const/16 v3, 0xc5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 250
    :pswitch_5
    const/16 v3, 0xc4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    const/16 v3, 0xe1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 255
    :pswitch_6
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 256
    const/16 v3, 0xe1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 268
    .restart local v0    # "configs":Lcom/android/camera/data/data/config/SupportedConfigs;
    :pswitch_7
    const/4 v3, 0x7

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 273
    :pswitch_8
    const/4 v3, 0x7

    new-array v4, v3, [I

    aput v6, v4, v5

    aput v6, v4, v7

    aput v6, v4, v8

    aput v6, v4, v9

    const/4 v3, 0x4

    aput v6, v4, v3

    const/4 v3, 0x5

    aput v6, v4, v3

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x6

    aput v3, v4, v5

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 278
    :pswitch_9
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xc4

    if-ne v3, v4, :cond_b

    .line 279
    const/4 v3, 0x7

    new-array v4, v3, [I

    aput v6, v4, v5

    aput v6, v4, v7

    aput v6, v4, v8

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v9

    const/4 v3, 0x4

    aput v6, v4, v3

    const/4 v3, 0x5

    aput v6, v4, v3

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x6

    aput v3, v4, v5

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 281
    :cond_b
    const/4 v3, 0x7

    new-array v4, v3, [I

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v5

    aput v6, v4, v7

    aput v6, v4, v8

    aput v6, v4, v9

    const/4 v3, 0x4

    aput v6, v4, v3

    const/4 v3, 0x5

    aput v6, v4, v3

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x6

    aput v3, v4, v5

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 287
    :pswitch_a
    const/4 v3, 0x7

    new-array v4, v3, [I

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v5

    aput v6, v4, v7

    aput v6, v4, v8

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v9

    const/4 v3, 0x4

    aput v6, v4, v3

    const/4 v3, 0x5

    aput v6, v4, v3

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x6

    aput v3, v4, v5

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 292
    :pswitch_b
    const/4 v3, 0x7

    new-array v4, v3, [I

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v5

    aput v6, v4, v7

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v8

    aput v6, v4, v9

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x4

    aput v3, v4, v5

    const/4 v3, 0x5

    aput v6, v4, v3

    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x6

    aput v3, v4, v5

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 297
    :pswitch_c
    const/4 v3, 0x7

    new-array v4, v3, [I

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v5

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v7

    aput v6, v4, v8

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v4, v9

    const/4 v3, 0x4

    aput v6, v4, v3

    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x5

    aput v3, v4, v5

    const/4 v3, 0x4

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v5, 0x6

    aput v3, v4, v5

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->add([I)V

    goto/16 :goto_1

    .line 172
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_5
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 266
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch

    .line 268
    :array_0
    .array-data 4
        0xc6
        0xc6
        0xc6
        0xc6
        0xc6
        0xc6
        0xc6
    .end array-data
.end method

.method public static isMutexConfig(I)Z
    .locals 5
    .param p0, "selectedItem"    # I

    .prologue
    const/4 v2, 0x0

    .line 121
    sget-object v3, Lcom/android/camera/data/data/config/SupportedConfigFactory;->MUTEX_MENU_CONFIGS:[I

    array-length v4, v3

    move v1, v2

    :goto_0
    if-ge v1, v4, :cond_1

    aget v0, v3, v1

    .line 122
    .local v0, "item":I
    if-ne v0, p0, :cond_0

    .line 123
    const/4 v1, 0x1

    return v1

    .line 121
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 126
    .end local v0    # "item":I
    :cond_1
    return v2
.end method
