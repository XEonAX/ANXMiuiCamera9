.class public Lcom/android/camera/network/net/json/JsonObjectRequest;
.super Lcom/android/volley/Request;
.source "JsonObjectRequest.java"

# interfaces
.implements Lcom/android/camera/network/net/base/Cacheable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/volley/Request",
        "<",
        "Lorg/json/JSONObject;",
        ">;",
        "Lcom/android/camera/network/net/base/Cacheable;"
    }
.end annotation


# instance fields
.field private mCacheKey:Ljava/lang/String;

.field private volatile mData:[B

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mIsFromCache:Z

.field private mListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private mParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 2
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0, p1, p2, p4}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 22
    iput-object v1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mParams:Ljava/util/Map;

    .line 23
    iput-object v1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mHeaders:Ljava/util/Map;

    .line 27
    iput-object v1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mData:[B

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mIsFromCache:Z

    .line 29
    iput-object v1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mCacheKey:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mListener:Lcom/android/volley/Response$Listener;

    .line 34
    return-void
.end method

.method public static parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "defaultCharset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v4, "Content-Type"

    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 84
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 85
    const-string/jumbo v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 86
    .local v3, "params":[Ljava/lang/String;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v4, v3

    if-ge v1, v4, :cond_1

    .line 87
    aget-object v4, v3, v1

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 88
    .local v2, "pair":[Ljava/lang/String;
    array-length v4, v2

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 89
    const/4 v4, 0x0

    aget-object v4, v2, v4

    const-string/jumbo v5, "charset"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 90
    const/4 v4, 0x1

    aget-object v4, v2, v4

    return-object v4

    .line 86
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "i":I
    .end local v2    # "pair":[Ljava/lang/String;
    .end local v3    # "params":[Ljava/lang/String;
    :cond_1
    return-object p1
.end method


# virtual methods
.method protected bridge synthetic deliverResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 54
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/android/camera/network/net/json/JsonObjectRequest;->deliverResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected deliverResponse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mListener:Lcom/android/volley/Response$Listener;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mListener:Lcom/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    .line 58
    :cond_0
    return-void
.end method

.method public getCacheKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mCacheKey:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mCacheKey:Ljava/lang/String;

    goto :goto_0
.end method

.method public getData()[B
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mData:[B

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mHeaders:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mHeaders:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/android/volley/Request;->getHeaders()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mParams:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mParams:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/android/volley/Request;->getParams()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public isFromCache()Z
    .locals 1

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mIsFromCache:Z

    return v0
.end method

.method protected parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 6
    .param p1, "response"    # Lcom/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    iget-object v3, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    const-string/jumbo v4, "From-Cache"

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mIsFromCache:Z

    .line 64
    iget-object v3, p1, Lcom/android/volley/NetworkResponse;->data:[B

    iput-object v3, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mData:[B

    .line 65
    new-instance v0, Ljava/lang/String;

    iget-object v3, p1, Lcom/android/volley/NetworkResponse;->data:[B

    iget-object v4, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    const-string/jumbo v5, "utf-8"

    invoke-static {v4, v5}, Lcom/android/camera/network/net/json/JsonObjectRequest;->parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 66
    .local v0, "data":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    .line 69
    .end local v0    # "data":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 70
    .local v2, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/android/volley/ParseError;

    invoke-direct {v3, v2}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v3}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v3

    return-object v3

    .line 67
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 68
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lcom/android/volley/ParseError;

    invoke-direct {v3, v1}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v3}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v3

    return-object v3
.end method

.method public setCacheKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mCacheKey:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mHeaders:Ljava/util/Map;

    .line 47
    return-void
.end method

.method public setParams(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/android/camera/network/net/json/JsonObjectRequest;->mParams:Ljava/util/Map;

    .line 38
    return-void
.end method
