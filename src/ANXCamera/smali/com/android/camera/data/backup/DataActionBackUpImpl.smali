.class public Lcom/android/camera/data/backup/DataActionBackUpImpl;
.super Ljava/lang/Object;
.source "DataActionBackUpImpl.java"

# interfaces
.implements Lcom/android/camera/data/backup/DataBackUp;


# instance fields
.field private mBackupArrays:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/util/SimpleArrayMap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public backupRunning(Lcom/android/camera/data/data/runing/DataItemRunning;IIZ)V
    .locals 3
    .param p1, "itemRunning"    # Lcom/android/camera/data/data/runing/DataItemRunning;
    .param p2, "key"    # I
    .param p3, "backupCameraId"    # I
    .param p4, "needClear"    # Z

    .prologue
    .line 44
    iget-object v2, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    if-nez v2, :cond_0

    .line 45
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iput-object v2, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    .line 48
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 49
    .local v0, "modeBackups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/util/SimpleArrayMap;>;"
    if-nez v0, :cond_1

    .line 50
    new-instance v0, Landroid/util/SparseArray;

    .end local v0    # "modeBackups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/util/SimpleArrayMap;>;"
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 52
    .restart local v0    # "modeBackups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/util/SimpleArrayMap;>;"
    :cond_1
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->cloneValues()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    .line 53
    .local v1, "values":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v0, p3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 54
    iget-object v2, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    invoke-virtual {v2, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 55
    if-eqz p4, :cond_2

    .line 56
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->resetAll()V

    .line 58
    :cond_2
    return-void
.end method

.method public clearBackUp()V
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 89
    :cond_0
    return-void
.end method

.method public getBackupFilter(II)Ljava/lang/String;
    .locals 4
    .param p1, "mode"    # I
    .param p2, "backupCameraId"    # I

    .prologue
    .line 160
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v1

    .line 162
    .local v1, "key":I
    invoke-virtual {p0, v1, p2}, Lcom/android/camera/data/backup/DataActionBackUpImpl;->getBackupRunning(II)Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v2

    .line 163
    .local v2, "simpleArrayMap":Landroid/support/v4/util/SimpleArrayMap;
    if-nez v2, :cond_0

    .line 164
    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 166
    :cond_0
    const-string/jumbo v3, "pref_camera_shader_coloreffect_key"

    invoke-virtual {v2, v3}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 168
    .local v0, "filter":Ljava/lang/String;
    if-nez v0, :cond_1

    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "filter":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public getBackupRunning(II)Landroid/support/v4/util/SimpleArrayMap;
    .locals 3
    .param p1, "key"    # I
    .param p2, "backupCameraId"    # I

    .prologue
    const/4 v2, 0x0

    .line 100
    iget-object v1, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    if-nez v1, :cond_0

    .line 101
    return-object v2

    .line 104
    :cond_0
    iget-object v1, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 106
    .local v0, "modeBackups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/util/SimpleArrayMap;>;"
    if-nez v0, :cond_1

    .line 107
    return-object v2

    .line 110
    :cond_1
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/util/SimpleArrayMap;

    return-object v1
.end method

.method public isLastVideoFastMotion()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 115
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const/16 v4, 0xa9

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v0

    .line 117
    .local v0, "key":I
    invoke-virtual {p0, v0, v5}, Lcom/android/camera/data/backup/DataActionBackUpImpl;->getBackupRunning(II)Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    .line 118
    .local v1, "simpleArrayMap":Landroid/support/v4/util/SimpleArrayMap;
    if-nez v1, :cond_0

    .line 119
    return v5

    .line 121
    :cond_0
    const-string/jumbo v3, "pref_video_speed_fast_key"

    invoke-virtual {v1, v3}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 122
    .local v2, "state":Ljava/lang/Boolean;
    if-nez v2, :cond_1

    .line 123
    return v5

    .line 125
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    return v3
.end method

.method public isLastVideoHFRMode()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 145
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const/16 v4, 0xaa

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v0

    .line 147
    .local v0, "key":I
    invoke-virtual {p0, v0, v5}, Lcom/android/camera/data/backup/DataActionBackUpImpl;->getBackupRunning(II)Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    .line 148
    .local v1, "simpleArrayMap":Landroid/support/v4/util/SimpleArrayMap;
    if-nez v1, :cond_0

    .line 149
    return v5

    .line 151
    :cond_0
    const-string/jumbo v3, "pref_video_speed_hfr_key"

    invoke-virtual {v1, v3}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 152
    .local v2, "state":Ljava/lang/Boolean;
    if-nez v2, :cond_1

    .line 153
    return v5

    .line 155
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    return v3
.end method

.method public isLastVideoSlowMotion()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 130
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const/16 v4, 0xa8

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v0

    .line 132
    .local v0, "key":I
    invoke-virtual {p0, v0, v5}, Lcom/android/camera/data/backup/DataActionBackUpImpl;->getBackupRunning(II)Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v1

    .line 133
    .local v1, "simpleArrayMap":Landroid/support/v4/util/SimpleArrayMap;
    if-nez v1, :cond_0

    .line 134
    return v5

    .line 136
    :cond_0
    const-string/jumbo v3, "pref_video_speed_slow_key"

    invoke-virtual {v1, v3}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 137
    .local v2, "state":Ljava/lang/Boolean;
    if-nez v2, :cond_1

    .line 138
    return v5

    .line 140
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    return v3
.end method

.method public revertRunning(Lcom/android/camera/data/data/runing/DataItemRunning;II)V
    .locals 3
    .param p1, "itemRunning"    # Lcom/android/camera/data/data/runing/DataItemRunning;
    .param p2, "key"    # I
    .param p3, "currentCameraId"    # I

    .prologue
    .line 62
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->resetAll()V

    .line 66
    iget-object v2, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    if-nez v2, :cond_0

    .line 67
    return-void

    .line 70
    :cond_0
    iget-object v2, p0, Lcom/android/camera/data/backup/DataActionBackUpImpl;->mBackupArrays:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/SparseArray;

    .line 72
    .local v1, "modeBackups":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/util/SimpleArrayMap;>;"
    if-eqz v1, :cond_1

    invoke-virtual {v1, p3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 73
    invoke-virtual {v1, p3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/util/SimpleArrayMap;

    .line 74
    .local v0, "backupValues":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getValues()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/util/SimpleArrayMap;->clear()V

    .line 75
    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getValues()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/util/SimpleArrayMap;->putAll(Landroid/support/v4/util/SimpleArrayMap;)V

    .line 82
    .end local v0    # "backupValues":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-void
.end method
