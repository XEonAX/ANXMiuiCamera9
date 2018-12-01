.class Landroid/support/v7/util/MessageThreadUtil$MessageQueue;
.super Ljava/lang/Object;
.source "MessageThreadUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/MessageThreadUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MessageQueue"
.end annotation


# instance fields
.field private mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized next()Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    .registers 4

    .prologue
    const/4 v2, 0x0

    monitor-enter p0

    .line 223
    :try_start_2
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v1, :cond_12

    .line 226
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 227
    .local v0, "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    invoke-static {v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_10
    .catchall {:try_start_2 .. :try_end_10} :catchall_14

    monitor-exit p0

    .line 228
    return-object v0

    .end local v0    # "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :cond_12
    monitor-exit p0

    .line 224
    return-object v2

    :catchall_14
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized removeMessages(I)V
    .registers 6
    .param p1, "what"    # I

    .prologue
    monitor-enter p0

    .line 249
    :goto_1
    :try_start_1
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-nez v3, :cond_b

    .line 254
    :cond_5
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1f

    if-nez v3, :cond_22

    :cond_9
    monitor-exit p0

    .line 268
    return-void

    .line 249
    :cond_b
    :try_start_b
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    iget v3, v3, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    if-ne v3, p1, :cond_5

    .line 250
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 251
    .local v0, "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    iget-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    invoke-static {v3}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 252
    invoke-virtual {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->recycle()V
    :try_end_1e
    .catchall {:try_start_b .. :try_end_1e} :catchall_1f

    goto :goto_1

    .end local v0    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :catchall_1f
    move-exception v3

    monitor-exit p0

    throw v3

    .line 255
    :cond_22
    :try_start_22
    iget-object v2, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 256
    .local v2, "prev":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    invoke-static {v2}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v0

    .line 257
    .restart local v0    # "item":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :goto_28
    if-eqz v0, :cond_9

    .line 258
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    .line 259
    .local v1, "next":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    iget v3, v0, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->what:I

    if-eq v3, p1, :cond_35

    .line 263
    move-object v2, v0

    .line 265
    :goto_33
    move-object v0, v1

    goto :goto_28

    .line 260
    :cond_35
    invoke-static {v2, v1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 261
    invoke-virtual {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->recycle()V
    :try_end_3b
    .catchall {:try_start_22 .. :try_end_3b} :catchall_1f

    goto :goto_33
.end method

.method declared-synchronized sendMessage(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)V
    .registers 4
    .param p1, "item"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .prologue
    monitor-enter p0

    .line 237
    :try_start_1
    iget-object v1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    if-eqz v1, :cond_12

    .line 241
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 242
    .local v0, "last":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :goto_7
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    move-result-object v1

    if-nez v1, :cond_16

    .line 245
    invoke-static {v0, p1}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_1b

    monitor-exit p0

    .line 246
    return-void

    .line 238
    .end local v0    # "last":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :cond_12
    :try_start_12
    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_14
    .catchall {:try_start_12 .. :try_end_14} :catchall_1b

    monitor-exit p0

    .line 239
    return-void

    .line 243
    .restart local v0    # "last":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :cond_16
    :try_start_16
    invoke-static {v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$200(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_1b

    move-result-object v0

    goto :goto_7

    .end local v0    # "last":Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :catchall_1b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized sendMessageAtFrontOfQueue(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .prologue
    monitor-enter p0

    .line 232
    :try_start_1
    iget-object v0, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    invoke-static {p1, v0}, Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;->access$202(Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;)Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;

    .line 233
    iput-object p1, p0, Landroid/support/v7/util/MessageThreadUtil$MessageQueue;->mRoot:Landroid/support/v7/util/MessageThreadUtil$SyncQueueItem;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    .line 234
    return-void

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method
