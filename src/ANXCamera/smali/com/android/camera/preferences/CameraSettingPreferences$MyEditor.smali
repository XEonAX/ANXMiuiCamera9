.class Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;
.super Ljava/lang/Object;
.source "CameraSettingPreferences.java"

# interfaces
.implements Landroid/content/SharedPreferences$Editor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/preferences/CameraSettingPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyEditor"
.end annotation


# instance fields
.field private mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

.field private mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

.field private mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

.field final synthetic this$0:Lcom/android/camera/preferences/CameraSettingPreferences;


# direct methods
.method constructor <init>(Lcom/android/camera/preferences/CameraSettingPreferences;)V
    .locals 1
    .param p1, "this$0"    # Lcom/android/camera/preferences/CameraSettingPreferences;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->this$0:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 111
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 112
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 113
    return-void
.end method


# virtual methods
.method public apply()V
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 125
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 126
    return-void
.end method

.method public clear()Landroid/content/SharedPreferences$Editor;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 131
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 132
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 133
    return-object p0
.end method

.method public commit()Z
    .locals 3

    .prologue
    .line 117
    iget-object v2, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->commit()Z

    move-result v0

    .line 118
    .local v0, "result1":Z
    iget-object v2, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->commit()Z

    move-result v1

    .line 119
    .local v1, "result2":Z
    if-eqz v0, :cond_0

    .end local v1    # "result2":Z
    :goto_0
    return v1

    .restart local v1    # "result2":Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 194
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 201
    :goto_0
    return-object p0

    .line 196
    :cond_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 197
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 199
    :cond_1
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0
.end method

.method public putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 182
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putFloat(Ljava/lang/String;F)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 189
    :goto_0
    return-object p0

    .line 184
    :cond_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 185
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putFloat(Ljava/lang/String;F)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 187
    :cond_1
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putFloat(Ljava/lang/String;F)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0
.end method

.method public putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 158
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 165
    :goto_0
    return-object p0

    .line 160
    :cond_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 163
    :cond_1
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0
.end method

.method public putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 170
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 177
    :goto_0
    return-object p0

    .line 172
    :cond_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 173
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 175
    :cond_1
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0
.end method

.method public putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 146
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 153
    :goto_0
    return-object p0

    .line 148
    :cond_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 151
    :cond_1
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0
.end method

.method public putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/SharedPreferences$Editor;"
        }
    .end annotation

    .prologue
    .line 207
    .local p2, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorGlobal:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 139
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorConfig:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 140
    iget-object v0, p0, Lcom/android/camera/preferences/CameraSettingPreferences$MyEditor;->mEditorRunning:Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    invoke-interface {v0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 141
    return-object p0
.end method
