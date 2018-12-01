.class public Lcom/android/camera/network/net/GalleryCache;
.super Lcom/android/volley/toolbox/DiskBasedCache;
.source "GalleryCache.java"


# virtual methods
.method public declared-synchronized get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;
    .locals 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    monitor-enter p0

    .line 46
    :try_start_0
    invoke-super {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 47
    .local v0, "entry":Lcom/android/volley/Cache$Entry;
    if-eqz v0, :cond_0

    .line 48
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 49
    .local v1, "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "From-Cache"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    iput-object v1, v0, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    .line 51
    const-string/jumbo v2, "GalleryCache"

    const-string/jumbo v3, "get cache: key %s, isExpired: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v0}, Lcom/android/volley/Cache$Entry;->isExpired()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    invoke-virtual {v0}, Lcom/android/volley/Cache$Entry;->isExpired()Z

    move-result v2

    if-nez v2, :cond_0

    .line 53
    const-string/jumbo v2, "GalleryCache"

    const-string/jumbo v3, "cache hit."

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "headers":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    monitor-exit p0

    .line 56
    return-object v0

    .end local v0    # "entry":Lcom/android/volley/Cache$Entry;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized isCacheValid(Ljava/lang/String;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    monitor-enter p0

    .line 60
    :try_start_0
    invoke-super {p0, p1}, Lcom/android/volley/toolbox/DiskBasedCache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 61
    .local v0, "entry":Lcom/android/volley/Cache$Entry;
    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {v0}, Lcom/android/volley/Cache$Entry;->isExpired()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 63
    const/4 v1, 0x1

    monitor-exit p0

    return v1

    .line 66
    :cond_0
    const/4 v1, 0x0

    monitor-exit p0

    return v1

    .end local v0    # "entry":Lcom/android/volley/Cache$Entry;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "entry"    # Lcom/android/volley/Cache$Entry;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    monitor-enter p0

    monitor-exit p0

    .line 30
    return-void
.end method

.method public declared-synchronized put(Ljava/lang/String;[BJJ)V
    .locals 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "expires"    # J
    .param p5, "softTtl"    # J

    .prologue
    const/4 v1, 0x0

    monitor-enter p0

    .line 33
    :try_start_0
    new-instance v0, Lcom/android/volley/Cache$Entry;

    invoke-direct {v0}, Lcom/android/volley/Cache$Entry;-><init>()V

    .line 34
    .local v0, "entry":Lcom/android/volley/Cache$Entry;
    iput-object p2, v0, Lcom/android/volley/Cache$Entry;->data:[B

    .line 35
    iput-wide p3, v0, Lcom/android/volley/Cache$Entry;->ttl:J

    .line 36
    iput-wide p5, v0, Lcom/android/volley/Cache$Entry;->softTtl:J

    .line 37
    invoke-super {p0, p1, v0}, Lcom/android/volley/toolbox/DiskBasedCache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V

    .line 38
    const-string/jumbo v2, "GalleryCache"

    const-string/jumbo v3, "put cache. key %s size %s expires %s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 40
    if-nez p2, :cond_0

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v5, 0x1

    aput-object v1, v4, v5

    .line 41
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v5, 0x2

    aput-object v1, v4, v5

    .line 38
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 42
    return-void

    .line 40
    :cond_0
    :try_start_1
    array-length v1, p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "entry":Lcom/android/volley/Cache$Entry;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
