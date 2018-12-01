.class public final Lio/reactivex/disposables/CompositeDisposable;
.super Ljava/lang/Object;
.source "CompositeDisposable.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/internal/disposables/DisposableContainer;


# instance fields
.field volatile disposed:Z

.field resources:Lio/reactivex/internal/util/OpenHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/util/OpenHashSet",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method


# virtual methods
.method public add(Lio/reactivex/disposables/Disposable;)Z
    .locals 5
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 90
    const-string/jumbo v3, "d is null"

    invoke-static {p1, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    iget-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    if-eqz v3, :cond_0

    .line 104
    :goto_0
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 105
    return v4

    .line 92
    :cond_0
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 93
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    if-eqz v3, :cond_1

    .line 102
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v1

    .local v1, "-l_4_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 94
    .end local v1    # "-l_4_R":Ljava/lang/Object;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lio/reactivex/disposables/CompositeDisposable;->resources:Lio/reactivex/internal/util/OpenHashSet;

    .line 95
    .local v2, "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    if-eqz v2, :cond_2

    .line 99
    :goto_1
    invoke-virtual {v2, p1}, Lio/reactivex/internal/util/OpenHashSet;->add(Ljava/lang/Object;)Z

    .line 100
    monitor-exit p0

    const/4 v3, 0x1

    return v3

    .line 96
    :cond_2
    new-instance v2, Lio/reactivex/internal/util/OpenHashSet;

    .end local v2    # "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    invoke-direct {v2}, Lio/reactivex/internal/util/OpenHashSet;-><init>()V

    .line 97
    .restart local v2    # "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    iput-object v2, p0, Lio/reactivex/disposables/CompositeDisposable;->resources:Lio/reactivex/internal/util/OpenHashSet;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public delete(Lio/reactivex/disposables/Disposable;)Z
    .locals 5
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 149
    const-string/jumbo v3, "Disposable item is null"

    invoke-static {p1, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 150
    iget-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    if-nez v3, :cond_1

    .line 153
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 154
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    if-nez v3, :cond_2

    .line 158
    iget-object v2, p0, Lio/reactivex/disposables/CompositeDisposable;->resources:Lio/reactivex/internal/util/OpenHashSet;

    .line 159
    .local v2, "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    if-nez v2, :cond_3

    .line 160
    :cond_0
    monitor-exit p0

    return v4

    .line 151
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    .end local v2    # "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    :cond_1
    return v4

    .line 155
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_2
    monitor-exit p0

    return v4

    .line 159
    .restart local v2    # "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    :cond_3
    invoke-virtual {v2, p1}, Lio/reactivex/internal/util/OpenHashSet;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 162
    monitor-exit p0

    .line 163
    const/4 v3, 0x1

    return v3

    .line 162
    .end local v2    # "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    :catchall_0
    move-exception v1

    .local v1, "-l_4_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public dispose()V
    .locals 4

    .prologue
    .line 67
    iget-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    if-nez v3, :cond_0

    .line 71
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 72
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    if-nez v3, :cond_1

    .line 75
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    .line 76
    iget-object v2, p0, Lio/reactivex/disposables/CompositeDisposable;->resources:Lio/reactivex/internal/util/OpenHashSet;

    .line 77
    .local v2, "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lio/reactivex/disposables/CompositeDisposable;->resources:Lio/reactivex/internal/util/OpenHashSet;

    .line 78
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    invoke-virtual {p0, v2}, Lio/reactivex/disposables/CompositeDisposable;->dispose(Lio/reactivex/internal/util/OpenHashSet;)V

    .line 81
    return-void

    .line 68
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    .end local v2    # "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    :cond_0
    return-void

    .line 73
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_1
    :try_start_1
    monitor-exit p0

    return-void

    .line 78
    :catchall_0
    move-exception v1

    .local v1, "-l_3_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method dispose(Lio/reactivex/internal/util/OpenHashSet;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/util/OpenHashSet",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "set":Lio/reactivex/internal/util/OpenHashSet;, "Lio/reactivex/internal/util/OpenHashSet<Lio/reactivex/disposables/Disposable;>;"
    const/4 v9, 0x0

    .line 209
    if-eqz p1, :cond_0

    .line 212
    const/4 v4, 0x0

    .line 213
    .local v4, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p1}, Lio/reactivex/internal/util/OpenHashSet;->keys()[Ljava/lang/Object;

    move-result-object v3

    .line 214
    .local v3, "array":[Ljava/lang/Object;
    move-object v0, v3

    .local v0, "-l_4_R":Ljava/lang/Object;
    array-length v1, v3

    .local v1, "-l_5_I":I
    const/4 v2, 0x0

    .end local v4    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .local v2, "-l_6_I":I
    :goto_0
    if-lt v2, v1, :cond_1

    .line 227
    if-nez v4, :cond_4

    .line 233
    return-void

    .line 210
    .end local v0    # "-l_4_R":Ljava/lang/Object;
    .end local v1    # "-l_5_I":I
    .end local v2    # "-l_6_I":I
    .end local v3    # "array":[Ljava/lang/Object;
    :cond_0
    return-void

    .line 214
    .restart local v0    # "-l_4_R":Ljava/lang/Object;
    .restart local v1    # "-l_5_I":I
    .restart local v2    # "-l_6_I":I
    .restart local v3    # "array":[Ljava/lang/Object;
    :cond_1
    aget-object v6, v0, v2

    .line 215
    .local v6, "o":Ljava/lang/Object;
    instance-of v7, v6, Lio/reactivex/disposables/Disposable;

    if-nez v7, :cond_2

    .line 214
    .end local v6    # "o":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 217
    .restart local v6    # "o":Ljava/lang/Object;
    :cond_2
    :try_start_0
    check-cast v6, Lio/reactivex/disposables/Disposable;

    .end local v6    # "o":Ljava/lang/Object;
    invoke-interface {v6}, Lio/reactivex/disposables/Disposable;->dispose()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 218
    :catch_0
    move-exception v5

    .line 219
    .local v5, "ex":Ljava/lang/Throwable;
    invoke-static {v5}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 220
    if-eqz v4, :cond_3

    .line 223
    :goto_2
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 221
    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .restart local v4    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    goto :goto_2

    .line 228
    .end local v4    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v5    # "ex":Ljava/lang/Throwable;
    :cond_4
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-eq v7, v8, :cond_5

    .line 231
    new-instance v7, Lio/reactivex/exceptions/CompositeException;

    invoke-direct {v7, v4}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    throw v7

    .line 229
    :cond_5
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    invoke-static {v7}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 85
    iget-boolean v0, p0, Lio/reactivex/disposables/CompositeDisposable;->disposed:Z

    return v0
.end method

.method public remove(Lio/reactivex/disposables/Disposable;)Z
    .locals 2
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 140
    invoke-virtual {p0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 144
    return v1

    .line 141
    :cond_0
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 142
    const/4 v0, 0x1

    return v0
.end method
