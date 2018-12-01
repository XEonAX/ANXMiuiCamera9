.class public Lcom/android/camera/network/imageloader/ImageLoaderManager;
.super Ljava/lang/Object;
.source "ImageLoaderManager.java"


# static fields
.field private static sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;


# instance fields
.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static getInstance()Lcom/android/camera/network/imageloader/ImageLoaderManager;
    .locals 2

    .prologue
    .line 17
    sget-object v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    if-nez v0, :cond_1

    .line 18
    const-class v1, Lcom/android/camera/network/imageloader/ImageLoaderManager;

    monitor-enter v1

    .line 19
    :try_start_0
    sget-object v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;

    invoke-direct {v0}, Lcom/android/camera/network/imageloader/ImageLoaderManager;-><init>()V

    sput-object v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 24
    :cond_1
    sget-object v0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->sInstance:Lcom/android/camera/network/imageloader/ImageLoaderManager;

    return-object v0

    .line 18
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public initRequestQueue(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    .line 34
    .local v0, "requestQueue":Lcom/android/volley/RequestQueue;
    new-instance v1, Lcom/android/volley/toolbox/ImageLoader;

    new-instance v2, Lcom/android/camera/network/imageloader/LruImageCache;

    invoke-direct {v2}, Lcom/android/camera/network/imageloader/LruImageCache;-><init>()V

    invoke-direct {v1, v0, v2}, Lcom/android/volley/toolbox/ImageLoader;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/toolbox/ImageLoader$ImageCache;)V

    iput-object v1, p0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 35
    return-void
.end method

.method public loadImage(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 3
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 39
    iget-object v1, p0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    if-nez v1, :cond_0

    .line 40
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/camera/network/imageloader/ImageLoaderManager;->initRequestQueue(Landroid/content/Context;)V

    .line 43
    :cond_0
    invoke-static {p1, v2, v2}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v0

    .line 44
    .local v0, "listener":Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    iget-object v1, p0, Lcom/android/camera/network/imageloader/ImageLoaderManager;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    invoke-virtual {v1, p2, v0}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 45
    return-void
.end method
