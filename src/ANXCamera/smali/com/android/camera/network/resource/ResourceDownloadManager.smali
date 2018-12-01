.class public Lcom/android/camera/network/resource/ResourceDownloadManager;
.super Ljava/lang/Object;
.source "ResourceDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/network/resource/ResourceDownloadManager$1;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/android/camera/network/resource/ResourceDownloadManager;


# instance fields
.field private mDownloadState:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/network/resource/OnDownloadListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOnCompleteListener:Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

.field private object:Ljava/lang/Object;


# direct methods
.method static synthetic -get0(Lcom/android/camera/network/resource/ResourceDownloadManager;)Landroid/util/LongSparseArray;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/network/resource/ResourceDownloadManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mDownloadState:Landroid/util/LongSparseArray;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/network/resource/ResourceDownloadManager;)Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/network/resource/ResourceDownloadManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mOnCompleteListener:Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/network/resource/ResourceDownloadManager;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/network/resource/ResourceDownloadManager;

    .prologue
    iget-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->object:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/camera/network/resource/ResourceDownloadManager;JI)V
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/network/resource/ResourceDownloadManager;
    .param p1, "id"    # J
    .param p3, "state"    # I

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/network/resource/ResourceDownloadManager;->dispatchListener(JI)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mDownloadState:Landroid/util/LongSparseArray;

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->object:Ljava/lang/Object;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mListeners:Ljava/util/List;

    .line 114
    new-instance v0, Lcom/android/camera/network/resource/ResourceDownloadManager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/network/resource/ResourceDownloadManager$1;-><init>(Lcom/android/camera/network/resource/ResourceDownloadManager;)V

    iput-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mOnCompleteListener:Lcom/android/camera/network/download/GalleryDownloadManager$OnCompleteListener;

    .line 46
    return-void
.end method

.method private dispatchListener(JI)V
    .locals 3
    .param p1, "id"    # J
    .param p3, "state"    # I

    .prologue
    .line 109
    iget-object v2, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "listener$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/network/resource/OnDownloadListener;

    .line 110
    .local v0, "listener":Lcom/android/camera/network/resource/OnDownloadListener;
    invoke-interface {v0, p1, p2, p3}, Lcom/android/camera/network/resource/OnDownloadListener;->onFinish(JI)V

    goto :goto_0

    .line 112
    .end local v0    # "listener":Lcom/android/camera/network/resource/OnDownloadListener;
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/android/camera/network/resource/ResourceDownloadManager;
    .locals 2

    .prologue
    .line 35
    sget-object v0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mInstance:Lcom/android/camera/network/resource/ResourceDownloadManager;

    if-nez v0, :cond_1

    .line 36
    const-class v1, Lcom/android/camera/network/resource/ResourceDownloadManager;

    monitor-enter v1

    .line 37
    :try_start_0
    sget-object v0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mInstance:Lcom/android/camera/network/resource/ResourceDownloadManager;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lcom/android/camera/network/resource/ResourceDownloadManager;

    invoke-direct {v0}, Lcom/android/camera/network/resource/ResourceDownloadManager;-><init>()V

    sput-object v0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mInstance:Lcom/android/camera/network/resource/ResourceDownloadManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 42
    :cond_1
    sget-object v0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mInstance:Lcom/android/camera/network/resource/ResourceDownloadManager;

    return-object v0

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addDownloadListener(Lcom/android/camera/network/resource/OnDownloadListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/android/camera/network/resource/OnDownloadListener;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    return-void
.end method

.method public download(Lcom/android/camera/network/resource/Resource;Lcom/android/camera/network/resource/DownloadHelper;)V
    .locals 7
    .param p1, "resource"    # Lcom/android/camera/network/resource/Resource;
    .param p2, "downloadHelper"    # Lcom/android/camera/network/resource/DownloadHelper;

    .prologue
    .line 55
    iget-wide v2, p1, Lcom/android/camera/network/resource/Resource;->id:J

    .line 56
    .local v2, "id":J
    const-string/jumbo v4, "ResourceDownloadManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "downloading "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    new-instance v0, Ljava/io/File;

    invoke-interface {p2, p1}, Lcom/android/camera/network/resource/DownloadHelper;->getDownloadPath(Lcom/android/camera/network/resource/Resource;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 58
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 59
    const-string/jumbo v4, "ResourceDownloadManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "file downloaded "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    const/4 v4, 0x1

    invoke-direct {p0, v2, v3, v4}, Lcom/android/camera/network/resource/ResourceDownloadManager;->dispatchListener(JI)V

    .line 62
    :cond_0
    new-instance v1, Lcom/android/camera/network/net/BaseGalleryRequest;

    const-string/jumbo v4, "http://micloudweb.preview.n.xiaomi.com/gallery/public/resource/download"

    const/4 v5, 0x0

    invoke-direct {v1, v5, v4}, Lcom/android/camera/network/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    .line 63
    .local v1, "request":Lcom/android/camera/network/net/BaseGalleryRequest;
    const-string/jumbo v4, "id"

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/android/camera/network/net/BaseGalleryRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/network/net/base/BaseRequest;

    .line 64
    new-instance v4, Lcom/android/camera/network/resource/ResourceDownloadManager$2;

    invoke-direct {v4, p0, v2, v3, v0}, Lcom/android/camera/network/resource/ResourceDownloadManager$2;-><init>(Lcom/android/camera/network/resource/ResourceDownloadManager;JLjava/io/File;)V

    invoke-virtual {v1, v4}, Lcom/android/camera/network/net/BaseGalleryRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    .line 92
    return-void
.end method

.method public getDownloadState(J)I
    .locals 3
    .param p1, "id"    # J

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mDownloadState:Landroid/util/LongSparseArray;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Landroid/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public removeDownloadListener(Lcom/android/camera/network/resource/OnDownloadListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/android/camera/network/resource/OnDownloadListener;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/android/camera/network/resource/ResourceDownloadManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 100
    return-void
.end method
