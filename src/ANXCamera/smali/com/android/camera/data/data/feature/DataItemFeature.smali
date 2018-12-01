.class public Lcom/android/camera/data/data/feature/DataItemFeature;
.super Lcom/android/camera/data/data/DataItemBase;
.source "DataItemFeature.java"


# instance fields
.field private mHwc:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/android/camera/data/data/DataItemBase;-><init>()V

    .line 29
    invoke-virtual {p0}, Lcom/android/camera/data/data/feature/DataItemFeature;->parseJsonString()V

    .line 30
    return-void
.end method

.method private parseJson(Ljava/lang/String;)V
    .locals 5
    .param p1, "jsonString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 80
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 81
    .local v1, "jsonObject":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 82
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/android/camera/data/data/feature/DataItemFeature;->getValues()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v3

    .line 83
    .local v3, "values":Landroid/support/v4/util/SimpleArrayMap;, "Landroid/support/v4/util/SimpleArrayMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 85
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 87
    .end local v2    # "key":Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method public isIndiaDevice()Z
    .locals 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/camera/data/data/feature/DataItemFeature;->mHwc:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 101
    const-string/jumbo v0, "ro.boot.hwc"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/feature/DataItemFeature;->mHwc:Ljava/lang/String;

    .line 105
    :cond_0
    const-string/jumbo v0, "india"

    iget-object v1, p0, Lcom/android/camera/data/data/feature/DataItemFeature;->mHwc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "global"

    iget-object v1, p0, Lcom/android/camera/data/data/feature/DataItemFeature;->mHwc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected isMutable()Z
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public isTransient()Z
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x1

    return v0
.end method

.method public parseJsonString()V
    .locals 12

    .prologue
    .line 43
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    .line 44
    .local v2, "context":Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 45
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "feature_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/android/camera/Device;->BUILD_DEVICE:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 46
    const-string/jumbo v10, "raw"

    .line 47
    const-string/jumbo v11, "com.android.camera"

    .line 44
    invoke-virtual {v8, v9, v10, v11}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 50
    .local v5, "resId":I
    if-gtz v5, :cond_0

    .line 51
    const-string/jumbo v8, "DataFeature"

    const-string/jumbo v9, "feature list default"

    invoke-static {v8, v9}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    return-void

    .line 55
    :cond_0
    const/4 v0, 0x0

    .line 57
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v6, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .local v7, "str":Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 61
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 64
    .end local v7    # "str":Ljava/lang/String;
    :catch_0
    move-exception v3

    .local v3, "e":Ljava/io/IOException;
    move-object v0, v1

    .line 65
    .end local v1    # "br":Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    if-eqz v0, :cond_1

    .line 71
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 77
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    :goto_2
    return-void

    .line 63
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v7    # "str":Ljava/lang/String;
    :cond_2
    :try_start_4
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/camera/data/data/feature/DataItemFeature;->parseJson(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 69
    if-eqz v1, :cond_3

    .line 71
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    :cond_3
    :goto_3
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .local v0, "br":Ljava/io/BufferedReader;
    goto :goto_2

    .line 72
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_1
    move-exception v3

    .line 73
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 66
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v7    # "str":Ljava/lang/String;
    .local v0, "br":Ljava/io/BufferedReader;
    :catch_2
    move-exception v4

    .line 67
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v4, "e":Lorg/json/JSONException;
    :goto_4
    :try_start_6
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 69
    if-eqz v0, :cond_1

    .line 71
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_2

    .line 72
    :catch_3
    move-exception v3

    .line 73
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 72
    .end local v4    # "e":Lorg/json/JSONException;
    :catch_4
    move-exception v3

    .line 73
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 68
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    .line 69
    :goto_5
    if-eqz v0, :cond_4

    .line 71
    :try_start_8
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 68
    :cond_4
    :goto_6
    throw v8

    .line 72
    :catch_5
    move-exception v3

    .line 73
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 68
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v8

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .local v0, "br":Ljava/io/BufferedReader;
    goto :goto_5

    .line 64
    .local v0, "br":Ljava/io/BufferedReader;
    :catch_6
    move-exception v3

    .restart local v3    # "e":Ljava/io/IOException;
    goto :goto_1

    .line 66
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_7
    move-exception v4

    .restart local v4    # "e":Lorg/json/JSONException;
    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .local v0, "br":Ljava/io/BufferedReader;
    goto :goto_4
.end method

.method public provideKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method

.method public supportIndiaAi()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 109
    const-string/jumbo v1, "s_i_a"

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/data/data/feature/DataItemFeature;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/data/data/feature/DataItemFeature;->isIndiaDevice()Z

    move-result v0

    :cond_0
    return v0
.end method

.method public supportZoomMfnr()Z
    .locals 2

    .prologue
    .line 113
    const-string/jumbo v0, "s_z_m"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/feature/DataItemFeature;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
