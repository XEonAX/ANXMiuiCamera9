.class public Lcom/android/camera/data/cloud/DataCloudMgr;
.super Ljava/lang/Object;
.source "DataCloudMgr.java"

# interfaces
.implements Lcom/android/camera/data/cloud/DataCloud$CloudManager;


# instance fields
.field private mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

.field private mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

.field private mDataCloudItemConfigs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/camera/data/cloud/DataCloudItemConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -wrap0(Lcom/android/camera/data/cloud/DataCloudMgr;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/data/cloud/DataCloudMgr;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->fillPreference()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    .line 44
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    .line 45
    return-void
.end method

.method private static checkLastUpdateTimeFormat()V
    .locals 8

    .prologue
    .line 75
    :try_start_0
    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataLastUpdateTime()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    .local v2, "lastUpdate":J
    .local v4, "strValue":Ljava/lang/String;
    :goto_0
    return-void

    .line 76
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "lastUpdate":J
    .end local v4    # "strValue":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 77
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string/jumbo v5, "DataCloudMgr"

    const-string/jumbo v6, "get cloud_data_last_update long value failed, try String type"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :try_start_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v5

    const-string/jumbo v6, "cloud_data_last_update"

    const-string/jumbo v7, "0"

    invoke-virtual {v5, v6, v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 85
    .restart local v4    # "strValue":Ljava/lang/String;
    const-string/jumbo v5, "DataCloudMgr"

    const-string/jumbo v6, "try to convert the string value type to long for field [cloud_data_last_update]"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-wide/16 v2, 0x0

    .line 87
    .restart local v2    # "lastUpdate":J
    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v5

    .line 88
    const-string/jumbo v6, "cloud_data_last_update"

    .line 87
    invoke-interface {v5, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v5

    .line 89
    const-string/jumbo v6, "cloud_data_last_update"

    .line 87
    invoke-interface {v5, v6, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->commit()Z

    goto :goto_0

    .line 81
    .end local v2    # "lastUpdate":J
    .end local v4    # "strValue":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 82
    .local v1, "e1":Ljava/lang/Exception;
    const-string/jumbo v5, "DataCloudMgr"

    const-string/jumbo v6, "get cloud_data_last_update string value failed"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    return-void

    .line 86
    .end local v1    # "e1":Ljava/lang/Exception;
    .restart local v4    # "strValue":Ljava/lang/String;
    :cond_0
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .restart local v2    # "lastUpdate":J
    goto :goto_1
.end method

.method private fillPreference()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 121
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v3

    .line 123
    .local v3, "frontCloud":Lcom/android/camera/data/cloud/DataCloud$CloudItem;
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v0

    .line 125
    .local v0, "backCloud":Lcom/android/camera/data/cloud/DataCloud$CloudItem;
    const-string/jumbo v6, "camera_settings_v3"

    const-string/jumbo v7, "version"

    invoke-static {v6, v7, v10}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, "commonVersion":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataCommonVersion()Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "nowCommonVersion":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "camera_settings_v3_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "version"

    invoke-static {v6, v7, v10}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 129
    .local v2, "deviceVersion":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataDeviceVersion()Ljava/lang/String;

    move-result-object v5

    .line 131
    .local v5, "nowDeviceVersion":Ljava/lang/String;
    iget-object v6, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v6, v8}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->setReady(Z)V

    .line 132
    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v6

    invoke-interface {v6, v8}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->setReady(Z)V

    .line 133
    invoke-interface {v3, v8}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    .line 134
    invoke-interface {v0, v8}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    .line 136
    if-eqz v1, :cond_0

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    if-nez v6, :cond_1

    .line 137
    :cond_0
    if-eqz v2, :cond_2

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    .line 136
    if-eqz v6, :cond_2

    .line 138
    :cond_1
    iget-object v6, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v6}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 139
    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 140
    invoke-interface {v3}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 141
    invoke-interface {v0}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 143
    const-string/jumbo v6, "DataCloudMgr"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "updateSettingsFromCloudData common version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 144
    const-string/jumbo v8, " -> "

    .line 143
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-static {v1}, Lcom/android/camera/data/cloud/DataCloudMgr;->setCloudDataCommonVersion(Ljava/lang/String;)V

    .line 146
    const-string/jumbo v6, "camera_settings_v3"

    invoke-direct {p0, v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->updateSettingsFromCloudData(Ljava/lang/String;)V

    .line 148
    const-string/jumbo v6, "DataCloudMgr"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "updateSettingsFromCloudData device version "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 149
    const-string/jumbo v8, " -> "

    .line 148
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    invoke-static {v2}, Lcom/android/camera/data/cloud/DataCloudMgr;->setCloudDataDeviceVersion(Ljava/lang/String;)V

    .line 151
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "camera_settings_v3_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/camera/data/cloud/DataCloudMgr;->updateSettingsFromCloudData(Ljava/lang/String;)V

    .line 154
    :cond_2
    iget-object v6, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v6, v9}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->setReady(Z)V

    .line 155
    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v6

    invoke-interface {v6, v9}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->setReady(Z)V

    .line 156
    invoke-interface {v3, v9}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    .line 157
    invoke-interface {v0, v9}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    .line 158
    return-void
.end method

.method private static getCloudDataCommonVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 223
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "cloud_data_version"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getCloudDataDeviceVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 227
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "cloud_data_device_version"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getCloudDataLastUpdateTime()J
    .locals 4

    .prologue
    .line 239
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string/jumbo v1, "cloud_data_last_update"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private static final getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "moduleName"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Ljava/lang/String;

    .prologue
    .line 218
    const-string/jumbo v0, "getCloudDataString"
    
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    return-object p2
	
.end method

.method private static setCloudDataCommonVersion(Ljava/lang/String;)V
    .locals 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 231
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "cloud_data_version"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 232
    return-void
.end method

.method private static setCloudDataDeviceVersion(Ljava/lang/String;)V
    .locals 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 235
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "cloud_data_device_version"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 236
    return-void
.end method

.method private static setCloudDataLastUpdateTime(J)V
    .locals 2
    .param p0, "time"    # J

    .prologue
    .line 243
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string/jumbo v1, "cloud_data_last_update"

    invoke-interface {v0, v1, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 244
    return-void
.end method

.method private updateSettingsFromCloudData(Ljava/lang/String;)V
    .locals 14
    .param p1, "moduleName"    # Ljava/lang/String;

    .prologue
    .line 162
    :try_start_0
    const-string/jumbo v11, "content"

    const/4 v12, 0x0

    invoke-static {p1, v11, v12}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 163
    .local v2, "data":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_8

    .line 164
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 165
    .local v1, "content":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v6, v11, :cond_8

    .line 166
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    .line 167
    .local v0, "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 168
    .local v8, "setting":Lorg/json/JSONObject;
    const-string/jumbo v11, "type"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 169
    const-string/jumbo v11, "type"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 170
    .local v9, "type":Ljava/lang/String;
    const-string/jumbo v11, "front"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 171
    iget-object v11, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    .line 172
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v12

    .line 171
    invoke-virtual {v11, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    check-cast v0, Lcom/android/camera/data/cloud/DataCloudItemBase;

    .line 178
    .end local v9    # "type":Ljava/lang/String;
    .restart local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    :cond_0
    :goto_1
    const-string/jumbo v11, "key"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 182
    .local v7, "key":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/android/camera/data/cloud/DataCloudItemBase;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 183
    .local v4, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v11, "value"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 184
    .local v10, "value":Ljava/lang/Object;
    instance-of v11, v10, Ljava/lang/Boolean;

    if-eqz v11, :cond_2

    .line 185
    check-cast v10, Ljava/lang/Boolean;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    invoke-interface {v4, v7, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 197
    :goto_2
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 165
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 173
    .end local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v7    # "key":Ljava/lang/String;
    .restart local v9    # "type":Ljava/lang/String;
    :cond_1
    const-string/jumbo v11, "back"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 174
    iget-object v11, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    .line 175
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v12

    .line 174
    invoke-virtual {v11, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    check-cast v0, Lcom/android/camera/data/cloud/DataCloudItemBase;

    .restart local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    goto :goto_1

    .line 186
    .end local v9    # "type":Ljava/lang/String;
    .restart local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v7    # "key":Ljava/lang/String;
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v11, v10, Ljava/lang/Integer;

    if-eqz v11, :cond_4

    .line 187
    check-cast v10, Ljava/lang/Integer;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-interface {v4, v7, v11}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 211
    .end local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    .end local v1    # "content":Lorg/json/JSONArray;
    .end local v2    # "data":Ljava/lang/String;
    .end local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v6    # "i":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "setting":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    .line 212
    .local v3, "e":Lorg/json/JSONException;
    const-string/jumbo v11, "DataCloudMgr"

    const-string/jumbo v12, "JSONException when get camera settings !"

    invoke-static {v11, v12, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 214
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_3
    :goto_3
    return-void

    .line 188
    .restart local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    .restart local v1    # "content":Lorg/json/JSONArray;
    .restart local v2    # "data":Ljava/lang/String;
    .restart local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v6    # "i":I
    .restart local v7    # "key":Ljava/lang/String;
    .restart local v8    # "setting":Lorg/json/JSONObject;
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_4
    :try_start_1
    instance-of v11, v10, Ljava/lang/Long;

    if-eqz v11, :cond_5

    .line 189
    check-cast v10, Ljava/lang/Long;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    invoke-interface {v4, v7, v12, v13}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    .line 190
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v11, v10, Ljava/lang/Float;

    if-eqz v11, :cond_6

    .line 191
    check-cast v10, Ljava/lang/Float;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-interface {v4, v7, v11}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    .line 192
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_6
    instance-of v11, v10, Ljava/lang/String;

    if-eqz v11, :cond_7

    .line 193
    check-cast v10, Ljava/lang/String;

    .end local v10    # "value":Ljava/lang/Object;
    invoke-interface {v4, v7, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_2

    .line 195
    .restart local v10    # "value":Ljava/lang/Object;
    :cond_7
    const-string/jumbo v11, "DataCloudMgr"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Wrong camera setting type "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 201
    .end local v0    # "cloudItem":Lcom/android/camera/data/cloud/DataCloudItemBase;
    .end local v1    # "content":Lorg/json/JSONArray;
    .end local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v6    # "i":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "setting":Lorg/json/JSONObject;
    .end local v10    # "value":Ljava/lang/Object;
    :cond_8
    const-string/jumbo v11, "feature"

    const/4 v12, 0x0

    invoke-static {p1, v11, v12}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 202
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 203
    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v11

    invoke-interface {v11}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->editor()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 204
    .restart local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 205
    .restart local v1    # "content":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_4
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v6, v11, :cond_9

    .line 206
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 207
    .local v5, "feature":Lorg/json/JSONObject;
    const-string/jumbo v11, "key"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "value"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-interface {v4, v11, v12}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 205
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 209
    .end local v5    # "feature":Lorg/json/JSONObject;
    :cond_9
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3
.end method


# virtual methods
.method public DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lcom/android/camera/data/cloud/DataCloudFeatureController;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudFeatureController:Lcom/android/camera/data/cloud/DataCloudFeatureController;

    return-object v0
.end method

.method public fillCloudValues()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 97
    .local v2, "now":J
    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->checkLastUpdateTimeFormat()V

    .line 98
    invoke-static {}, Lcom/android/camera/data/cloud/DataCloudMgr;->getCloudDataLastUpdateTime()J

    move-result-wide v0

    .line 100
    .local v0, "lastUpdate":J
    sub-long v4, v2, v0

    const-wide/32 v6, 0x5265c00

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 101
    iget-object v4, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-virtual {v4, v8}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;->setReady(Z)V

    .line 102
    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudMgr;->DataCloudFeature()Lcom/android/camera/data/cloud/DataCloud$CloudFeature;

    move-result-object v4

    invoke-interface {v4, v8}, Lcom/android/camera/data/cloud/DataCloud$CloudFeature;->setReady(Z)V

    .line 103
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getFrontCameraId()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v4

    invoke-interface {v4, v8}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    .line 104
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/android/camera/data/cloud/DataCloudMgr;->provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    move-result-object v4

    invoke-interface {v4, v8}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->setReady(Z)V

    .line 105
    return-void

    .line 107
    :cond_0
    invoke-static {v2, v3}, Lcom/android/camera/data/cloud/DataCloudMgr;->setCloudDataLastUpdateTime(J)V

    .line 109
    new-instance v4, Lcom/android/camera/data/cloud/DataCloudMgr$1;

    invoke-direct {v4, p0}, Lcom/android/camera/data/cloud/DataCloudMgr$1;-><init>(Lcom/android/camera/data/cloud/DataCloudMgr;)V

    invoke-static {v4}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v4

    .line 114
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v5

    .line 109
    invoke-virtual {v4, v5}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v4

    .line 115
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v5

    .line 109
    invoke-virtual {v4, v5}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v4

    invoke-virtual {v4}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    .line 117
    return-void
.end method

.method public provideDataCloudConfig(I)Lcom/android/camera/data/cloud/DataCloud$CloudItem;
    .locals 2
    .param p1, "cameraId"    # I

    .prologue
    .line 57
    iget-object v1, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/cloud/DataCloudItemConfig;

    .line 58
    .local v0, "dataCloudItemConfig":Lcom/android/camera/data/cloud/DataCloudItemConfig;
    if-nez v0, :cond_0

    .line 59
    new-instance v0, Lcom/android/camera/data/cloud/DataCloudItemConfig;

    .end local v0    # "dataCloudItemConfig":Lcom/android/camera/data/cloud/DataCloudItemConfig;
    invoke-direct {v0, p1}, Lcom/android/camera/data/cloud/DataCloudItemConfig;-><init>(I)V

    .line 60
    .restart local v0    # "dataCloudItemConfig":Lcom/android/camera/data/cloud/DataCloudItemConfig;
    iget-object v1, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudItemConfigs:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 62
    :cond_0
    return-object v0
.end method

.method public provideDataCloudGlobal()Lcom/android/camera/data/cloud/DataCloud$CloudItem;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    invoke-direct {v0}, Lcom/android/camera/data/cloud/DataCloudItemGlobal;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudMgr;->mDataCloudGlobal:Lcom/android/camera/data/cloud/DataCloudItemGlobal;

    return-object v0
.end method
