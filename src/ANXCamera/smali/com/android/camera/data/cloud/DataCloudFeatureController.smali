.class public Lcom/android/camera/data/cloud/DataCloudFeatureController;
.super Ljava/lang/Object;
.source "DataCloudFeatureController.java"

# interfaces
.implements Lcom/android/camera/data/cloud/DataCloud$CloudFeature;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mPreferences:Landroid/content/SharedPreferences;

.field private mReady:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/android/camera/data/cloud/DataCloudFeatureController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->TAG:Ljava/lang/String;

    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getSharedPreferences()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 27
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->initPreferences()V

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method private initPreferences()V
    .locals 3

    .prologue
    .line 33
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 34
    invoke-virtual {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->provideKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mPreferences:Landroid/content/SharedPreferences;

    .line 35
    return-void
.end method


# virtual methods
.method public editor()Landroid/content/SharedPreferences$Editor;
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    return-object v0
.end method

.method public filterFeature(Lcom/android/camera/data/data/config/SupportedConfigs;)Lcom/android/camera/data/data/config/SupportedConfigs;
    .locals 10
    .param p1, "configs"    # Lcom/android/camera/data/data/config/SupportedConfigs;

    .prologue
    .line 39
    iget-boolean v7, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mReady:Z

    if-nez v7, :cond_0

    .line 40
    return-object p1

    .line 43
    :cond_0
    new-instance v3, Lcom/android/camera/data/data/config/SupportedConfigs;

    invoke-direct {v3}, Lcom/android/camera/data/data/config/SupportedConfigs;-><init>()V

    .line 44
    .local v3, "filteredConfigs":Lcom/android/camera/data/data/config/SupportedConfigs;
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v6

    .line 45
    .local v6, "sharedPreferences":Landroid/content/SharedPreferences;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/config/SupportedConfigs;->getLength()I

    move-result v7

    if-ge v4, v7, :cond_2

    .line 46
    invoke-virtual {p1, v4}, Lcom/android/camera/data/data/config/SupportedConfigs;->getConfig(I)I

    move-result v0

    .line 47
    .local v0, "config":I
    const/4 v2, 0x1

    .line 49
    .local v2, "enable":Z
    :try_start_0
    invoke-static {v0}, Lcom/android/camera/data/data/config/SupportedConfigFactory;->getConfigKey(I)Ljava/lang/String;

    move-result-object v5

    .line 50
    .local v5, "key":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-interface {v6, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 54
    .end local v2    # "enable":Z
    .end local v5    # "key":Ljava/lang/String;
    :goto_1
    if-eqz v2, :cond_1

    .line 55
    invoke-virtual {v3, v0}, Lcom/android/camera/data/data/config/SupportedConfigs;->add(I)Lcom/android/camera/data/data/config/SupportedConfigs;

    .line 45
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 51
    .restart local v2    # "enable":Z
    :catch_0
    move-exception v1

    .line 52
    .local v1, "e":Ljava/lang/RuntimeException;
    sget-object v7, Lcom/android/camera/data/cloud/DataCloudFeatureController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "unknown config "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 59
    .end local v0    # "config":I
    .end local v1    # "e":Ljava/lang/RuntimeException;
    .end local v2    # "enable":Z
    :cond_2
    return-object v3
.end method

.method public getAllDisabledFeatures()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/android/camera/data/cloud/DataCloudFeatureController;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-string/jumbo v0, "cloud_feature"

    return-object v0
.end method

.method public setReady(Z)V
    .locals 0
    .param p1, "ready"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/android/camera/data/cloud/DataCloudFeatureController;->mReady:Z

    .line 75
    return-void
.end method
