.class public final Lio/reactivex/internal/disposables/ListCompositeDisposable;
.super Ljava/lang/Object;
.source "ListCompositeDisposable.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/internal/disposables/DisposableContainer;


# instance fields
.field volatile disposed:Z

.field resources:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
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
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method


# virtual methods
.method public add(Lio/reactivex/disposables/Disposable;)Z
    .locals 5
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    const/4 v4, 0x0

    .line 77
    const-string/jumbo v3, "d is null"

    invoke-static {p1, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    iget-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v3, :cond_0

    .line 91
    :goto_0
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 92
    return v4

    .line 79
    :cond_0
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 80
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-eqz v3, :cond_1

    .line 89
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v1

    .local v1, "-l_4_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 81
    .end local v1    # "-l_4_R":Ljava/lang/Object;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 82
    .local v2, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    if-eqz v2, :cond_2

    .line 86
    :goto_1
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    monitor-exit p0

    const/4 v3, 0x1

    return v3

    .line 83
    :cond_2
    new-instance v2, Ljava/util/LinkedList;

    .end local v2    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 84
    .restart local v2    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    iput-object v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public delete(Lio/reactivex/disposables/Disposable;)Z
    .locals 5
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    const/4 v4, 0x0

    .line 130
    const-string/jumbo v3, "Disposable item is null"

    invoke-static {p1, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    iget-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v3, :cond_1

    .line 134
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 135
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v3, :cond_2

    .line 139
    iget-object v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 140
    .local v2, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    if-nez v2, :cond_3

    .line 141
    :cond_0
    monitor-exit p0

    return v4

    .line 132
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    .end local v2    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    :cond_1
    return v4

    .line 136
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_2
    monitor-exit p0

    return v4

    .line 140
    .restart local v2    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    :cond_3
    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 143
    monitor-exit p0

    .line 144
    const/4 v3, 0x1

    return v3

    .line 143
    .end local v2    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
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
    .line 54
    iget-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v3, :cond_0

    .line 58
    move-object v0, p0

    .local v0, "-l_2_R":Ljava/lang/Object;
    monitor-enter p0

    .line 59
    :try_start_0
    iget-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    if-nez v3, :cond_1

    .line 62
    const/4 v3, 0x1

    iput-boolean v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    .line 63
    iget-object v2, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 64
    .local v2, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->resources:Ljava/util/List;

    .line 65
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    invoke-virtual {p0, v2}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->dispose(Ljava/util/List;)V

    .line 68
    return-void

    .line 55
    .end local v0    # "-l_2_R":Ljava/lang/Object;
    .end local v2    # "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    :cond_0
    return-void

    .line 60
    .restart local v0    # "-l_2_R":Ljava/lang/Object;
    :cond_1
    :try_start_1
    monitor-exit p0

    return-void

    .line 65
    :catchall_0
    move-exception v1

    .local v1, "-l_3_R":Ljava/lang/Object;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method dispose(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "set":Ljava/util/List;, "Ljava/util/List<Lio/reactivex/disposables/Disposable;>;"
    const/4 v6, 0x0

    .line 165
    if-eqz p1, :cond_0

    .line 168
    const/4 v1, 0x0

    .line 169
    .local v1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .end local v1    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .local v0, "-l_3_R":Ljava/lang/Object;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 180
    if-nez v1, :cond_3

    .line 186
    return-void

    .line 166
    .end local v0    # "-l_3_R":Ljava/lang/Object;
    :cond_0
    return-void

    .line 169
    .restart local v0    # "-l_3_R":Ljava/lang/Object;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/disposables/Disposable;

    .line 171
    .local v3, "o":Lio/reactivex/disposables/Disposable;
    :try_start_0
    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 172
    :catch_0
    move-exception v2

    .line 173
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 174
    if-eqz v1, :cond_2

    .line 177
    :goto_1
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 175
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .restart local v1    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    goto :goto_1

    .line 181
    .end local v1    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v2    # "ex":Ljava/lang/Throwable;
    .end local v3    # "o":Lio/reactivex/disposables/Disposable;
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_4

    .line 184
    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    invoke-direct {v4, v1}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    throw v4

    .line 182
    :cond_4
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v4}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ListCompositeDisposable;->disposed:Z

    return v0
.end method

.method public remove(Lio/reactivex/disposables/Disposable;)Z
    .locals 2
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    const/4 v1, 0x0

    .line 121
    invoke-virtual {p0, p1}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 125
    return v1

    .line 122
    :cond_0
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 123
    const/4 v0, 0x1

    return v0
.end method
