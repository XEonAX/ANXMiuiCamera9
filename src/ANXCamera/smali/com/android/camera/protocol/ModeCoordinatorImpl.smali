.class public Lcom/android/camera/protocol/ModeCoordinatorImpl;
.super Ljava/lang/Object;
.source "ModeCoordinatorImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$ModeCoordinator;


# static fields
.field private static sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;


# instance fields
.field private mHolderKey:I

.field private protocolSparseArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->protocolSparseArray:Landroid/util/SparseArray;

    .line 18
    return-void
.end method

.method public static create(I)V
    .locals 1
    .param p0, "holderKey"    # I

    .prologue
    .line 21
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    .line 22
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    iput p0, v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->mHolderKey:I

    .line 23
    return-void
.end method

.method public static destroyAll(I)V
    .locals 2
    .param p0, "holderKey"    # I

    .prologue
    const/4 v1, 0x0

    .line 89
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    iget v0, v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->mHolderKey:I

    if-eq v0, p0, :cond_1

    .line 90
    :cond_0
    return-void

    .line 92
    :cond_1
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    invoke-direct {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->destroyWorkspace()V

    .line 93
    sput-object v1, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    .line 94
    return-void
.end method

.method private destroyWorkspace()V
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->protocolSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 77
    return-void
.end method

.method public static forceDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 80
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    if-nez v0, :cond_0

    .line 81
    return-void

    .line 84
    :cond_0
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    invoke-direct {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->destroyWorkspace()V

    .line 85
    sput-object v1, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    .line 86
    return-void
.end method

.method public static getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;
    .locals 2

    .prologue
    .line 26
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    if-nez v0, :cond_1

    .line 27
    const-class v1, Lcom/android/camera/protocol/ModeCoordinatorImpl;

    monitor-enter v1

    .line 28
    :try_start_0
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;

    invoke-direct {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;-><init>()V

    sput-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 33
    :cond_1
    sget-object v0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    return-object v0

    .line 27
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static isAlive(I)Z
    .locals 2
    .param p0, "holderKey"    # I

    .prologue
    const/4 v0, 0x0

    .line 97
    sget-object v1, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/camera/protocol/ModeCoordinatorImpl;->sInstance:Lcom/android/camera/protocol/ModeCoordinatorImpl;

    iget v1, v1, Lcom/android/camera/protocol/ModeCoordinatorImpl;->mHolderKey:I

    if-ne v1, p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method


# virtual methods
.method public attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V
    .locals 1
    .param p1, "type"    # I
    .param p2    # Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">(ITP;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "newProtocol":Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;, "TP;"
    iget-object v0, p0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->protocolSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 47
    return-void
.end method

.method public detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V
    .locals 1
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">(ITP;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p2, "baseProtocol":Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;, "TP;"
    invoke-virtual {p0, p1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    if-ne v0, p2, :cond_0

    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 61
    :cond_0
    return-void
.end method

.method public getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;
    .locals 2
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P::",
            "Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;",
            ">(I)TP;"
        }
    .end annotation

    .prologue
    .line 52
    iget-object v1, p0, Lcom/android/camera/protocol/ModeCoordinatorImpl;->protocolSparseArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    .line 53
    .local v0, "protocol":Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;, "TP;"
    return-object v0
.end method
