.class public Lcom/android/camera/sticker/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyFileIfNeed(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)Z
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "file"    # Ljava/io/File;
    .param p2, "assetName"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 16
    if-eqz p1, :cond_8

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    xor-int/lit8 v7, v7, 0x1

    if-eqz v7, :cond_8

    .line 17
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 18
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 19
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 21
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_8

    .line 22
    const/4 v3, 0x0

    .line 23
    .local v3, "in":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 25
    .local v5, "out":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 26
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 28
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    invoke-virtual {v7, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 30
    .local v3, "in":Ljava/io/InputStream;
    if-nez v3, :cond_3

    .line 45
    if-eqz v3, :cond_2

    .line 47
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 31
    :cond_2
    :goto_0
    return v8

    .line 48
    :catch_0
    move-exception v2

    .line 49
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 33
    .end local v2    # "e":Ljava/io/IOException;
    :cond_3
    :try_start_2
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    .end local v5    # "out":Ljava/io/OutputStream;
    .local v6, "out":Ljava/io/OutputStream;
    const/16 v7, 0x1000

    :try_start_3
    new-array v0, v7, [B

    .line 36
    .local v0, "buffer":[B
    :goto_1
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "n":I
    if-lez v4, :cond_6

    .line 37
    const/4 v7, 0x0

    invoke-virtual {v6, v0, v7, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 41
    .end local v0    # "buffer":[B
    .end local v4    # "n":I
    :catch_1
    move-exception v2

    .restart local v2    # "e":Ljava/io/IOException;
    move-object v5, v6

    .line 42
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v6    # "out":Ljava/io/OutputStream;
    :goto_2
    :try_start_4
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 45
    if-eqz v3, :cond_4

    .line 47
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 52
    :cond_4
    :goto_3
    if-eqz v5, :cond_5

    .line 54
    :try_start_6
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 43
    :cond_5
    :goto_4
    return v8

    .line 39
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":[B
    .restart local v3    # "in":Ljava/io/InputStream;
    .restart local v4    # "n":I
    .restart local v6    # "out":Ljava/io/OutputStream;
    :cond_6
    :try_start_7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 40
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 45
    if-eqz v3, :cond_7

    .line 47
    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    .line 52
    :cond_7
    :goto_5
    if-eqz v6, :cond_8

    .line 54
    :try_start_9
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 62
    .end local v0    # "buffer":[B
    .end local v1    # "dir":Ljava/io/File;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "n":I
    .end local v6    # "out":Ljava/io/OutputStream;
    :cond_8
    :goto_6
    const/4 v7, 0x1

    return v7

    .line 48
    .restart local v0    # "buffer":[B
    .restart local v1    # "dir":Ljava/io/File;
    .restart local v3    # "in":Ljava/io/InputStream;
    .restart local v4    # "n":I
    .restart local v6    # "out":Ljava/io/OutputStream;
    :catch_2
    move-exception v2

    .line 49
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 55
    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v2

    .line 56
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6

    .line 48
    .end local v0    # "buffer":[B
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "n":I
    .end local v6    # "out":Ljava/io/OutputStream;
    :catch_4
    move-exception v2

    .line 49
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 55
    :catch_5
    move-exception v2

    .line 56
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 44
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 45
    :goto_7
    if-eqz v3, :cond_9

    .line 47
    :try_start_a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6

    .line 52
    :cond_9
    :goto_8
    if-eqz v5, :cond_a

    .line 54
    :try_start_b
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7

    .line 44
    :cond_a
    :goto_9
    throw v7

    .line 48
    :catch_6
    move-exception v2

    .line 49
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_8

    .line 55
    .end local v2    # "e":Ljava/io/IOException;
    :catch_7
    move-exception v2

    .line 56
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    .line 44
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "in":Ljava/io/InputStream;
    .restart local v6    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v7

    move-object v5, v6

    .end local v6    # "out":Ljava/io/OutputStream;
    .local v5, "out":Ljava/io/OutputStream;
    goto :goto_7

    .line 41
    .end local v3    # "in":Ljava/io/InputStream;
    .local v5, "out":Ljava/io/OutputStream;
    :catch_8
    move-exception v2

    .restart local v2    # "e":Ljava/io/IOException;
    goto :goto_2
.end method
