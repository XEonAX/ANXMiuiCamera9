.class public abstract Lcom/android/camera/data/data/DataItemBase;
.super Ljava/lang/Object;
.source "DataItemBase.java"

# interfaces
.implements Lcom/android/camera/data/provider/DataProvider$ProviderEvent;
.implements Lcom/android/camera/data/provider/DataProvider$ProviderEditor;


# instance fields
.field private mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

.field private mEditor:Landroid/content/SharedPreferences$Editor;

.field private final mLock:Ljava/lang/Object;

.field private mPreferences:Landroid/content/SharedPreferences;

.field private mValues:Landroid/support/v4/util/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SimpleArrayMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    .line 15
    new-instance v0, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    .line 11
    return-void
.end method

.method private getSharedPreferences()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 333
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 334
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->initPreferences()V

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method private initPreferences()V
    .locals 3

    .prologue
    .line 340
    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v0

    if-nez v0, :cond_0

    .line 341
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 342
    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->provideKey()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 341
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mPreferences:Landroid/content/SharedPreferences;

    .line 344
    :cond_0
    return-void
.end method


# virtual methods
.method public apply()V
    .locals 3

    .prologue
    .line 314
    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Transient data\uff01"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 319
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-nez v0, :cond_1

    .line 320
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Editor null\uff01"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 318
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 323
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    .line 325
    return-void
.end method

.method public clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2

    .prologue
    .line 293
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 294
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0}, Landroid/support/v4/util/SimpleArrayMap;->clear()V

    .line 295
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 298
    return-object p0

    .line 293
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public cloneValues()Landroid/support/v4/util/SimpleArrayMap;
    .locals 3

    .prologue
    .line 364
    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 365
    :try_start_0
    new-instance v0, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    .line 366
    .local v0, "cloneValues":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, v1}, Landroid/support/v4/util/SimpleArrayMap;->putAll(Landroid/support/v4/util/SimpleArrayMap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 367
    return-object v0

    .line 364
    .end local v0    # "cloneValues":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public commit()Z
    .locals 2

    .prologue
    .line 304
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 305
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    .line 308
    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    return v0

    .line 304
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 3

    .prologue
    .line 102
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 103
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isMutable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "not allowed to modify"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 106
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-nez v0, :cond_1

    .line 107
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit v1

    .line 109
    return-object p0
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Z

    .prologue
    .line 37
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    if-eqz v1, :cond_0

    .line 38
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    invoke-interface {v1, p1, p2}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->getCloudBooleanDefault(Ljava/lang/String;Z)Z

    move-result p2

    .line 41
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 42
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 43
    .local v0, "v":Ljava/lang/Boolean;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 44
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 46
    :cond_1
    if-nez v0, :cond_2

    .end local p2    # "defaultValue":Z
    :goto_0
    monitor-exit v2

    return p2

    .restart local p2    # "defaultValue":Z
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result p2

    goto :goto_0

    .line 41
    .end local v0    # "v":Ljava/lang/Boolean;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public getFloat(Ljava/lang/String;F)F
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # F

    .prologue
    .line 82
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    if-eqz v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    invoke-interface {v1, p1, p2}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->getCloudFloatDefault(Ljava/lang/String;F)F

    move-result p2

    .line 86
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 87
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 88
    .local v0, "v":Ljava/lang/Float;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 89
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 91
    :cond_1
    if-nez v0, :cond_2

    .end local p2    # "defaultValue":F
    :goto_0
    monitor-exit v2

    return p2

    .restart local p2    # "defaultValue":F
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result p2

    goto :goto_0

    .line 86
    .end local v0    # "v":Ljava/lang/Float;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 52
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    if-eqz v1, :cond_0

    .line 53
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    invoke-interface {v1, p1, p2}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->getCloudIntDefault(Ljava/lang/String;I)I

    move-result p2

    .line 56
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 57
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 58
    .local v0, "v":Ljava/lang/Integer;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 59
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 61
    :cond_1
    if-nez v0, :cond_2

    .end local p2    # "defaultValue":I
    :goto_0
    monitor-exit v2

    return p2

    .restart local p2    # "defaultValue":I
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result p2

    goto :goto_0

    .line 56
    .end local v0    # "v":Ljava/lang/Integer;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public getLong(Ljava/lang/String;J)J
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 67
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    if-eqz v1, :cond_0

    .line 68
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    invoke-interface {v1, p1, p2, p3}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->getCloudLongDefault(Ljava/lang/String;J)J

    move-result-wide p2

    .line 71
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 72
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 73
    .local v0, "v":Ljava/lang/Long;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 74
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 76
    :cond_1
    if-nez v0, :cond_2

    .end local p2    # "defaultValue":J
    :goto_0
    monitor-exit v2

    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide p2

    goto :goto_0

    .line 71
    .end local v0    # "v":Ljava/lang/Long;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 22
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    if-eqz v1, :cond_0

    .line 23
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    invoke-interface {v1, p1, p2}, Lcom/android/camera/data/cloud/DataCloud$CloudItem;->getCloudStringDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 26
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 27
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 28
    .local v0, "v":Ljava/lang/String;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/data/data/DataItemBase;->isTransient()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 29
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 31
    :cond_1
    if-nez v0, :cond_2

    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_0
    monitor-exit v2

    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_2
    move-object p2, v0

    goto :goto_0

    .line 26
    .end local v0    # "v":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public getValues()Landroid/support/v4/util/SimpleArrayMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/util/SimpleArrayMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 357
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 358
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 357
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public injectCloud(Lcom/android/camera/data/cloud/DataCloud$CloudItem;)V
    .locals 0
    .param p1, "dataCloudItem"    # Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    .prologue
    .line 373
    iput-object p1, p0, Lcom/android/camera/data/data/DataItemBase;->mDataCloudItem:Lcom/android/camera/data/cloud/DataCloud$CloudItem;

    .line 374
    return-void
.end method

.method protected isMutable()Z
    .locals 1

    .prologue
    .line 377
    const/4 v0, 0x1

    return v0
.end method

.method public putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 238
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 239
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 243
    return-object p0

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public putFloat(Ljava/lang/String;F)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 271
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 272
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 274
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 276
    return-object p0

    .line 271
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 249
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 250
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 254
    return-object p0

    .line 249
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 260
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 261
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 265
    return-object p0

    .line 260
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 227
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 228
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 232
    return-object p0

    .line 227
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 282
    iget-object v1, p0, Lcom/android/camera/data/data/DataItemBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 283
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mValues:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SimpleArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/android/camera/data/data/DataItemBase;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 287
    return-object p0

    .line 282
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
