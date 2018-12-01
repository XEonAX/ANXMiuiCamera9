.class public final Lio/reactivex/exceptions/CompositeException;
.super Ljava/lang/RuntimeException;
.source "CompositeException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;,
        Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;,
        Lio/reactivex/exceptions/CompositeException$WrappedPrintStream;,
        Lio/reactivex/exceptions/CompositeException$WrappedPrintWriter;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x29ffcc6947b49592L


# instance fields
.field private cause:Ljava/lang/Throwable;

.field private final exceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 6
    .param p1    # Ljava/lang/Iterable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "errors":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 65
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 66
    .local v1, "deDupedExceptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v3, "localExceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    if-nez p1, :cond_1

    .line 79
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "errors was null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 81
    :cond_0
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .line 84
    invoke-interface {v3, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 85
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    .line 86
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " exceptions occurred. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lio/reactivex/exceptions/CompositeException;->message:Ljava/lang/String;

    .line 87
    return-void

    .line 68
    :cond_1
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "-l_4_R":Ljava/lang/Object;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 69
    .local v2, "ex":Ljava/lang/Throwable;
    instance-of v4, v2, Lio/reactivex/exceptions/CompositeException;

    if-nez v4, :cond_2

    .line 72
    if-nez v2, :cond_3

    .line 75
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "Throwable was null!"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 70
    :cond_2
    check-cast v2, Lio/reactivex/exceptions/CompositeException;

    .end local v2    # "ex":Ljava/lang/Throwable;
    invoke-virtual {v2}, Lio/reactivex/exceptions/CompositeException;->getExceptions()Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 73
    .restart local v2    # "ex":Ljava/lang/Throwable;
    :cond_3
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 82
    .end local v0    # "-l_4_R":Ljava/lang/Object;
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_4
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "errors is empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public varargs constructor <init>([Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "exceptions"    # [Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    .line 53
    if-eqz p1, :cond_0

    .line 54
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 53
    :goto_0
    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    .line 55
    return-void

    .line 53
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "exceptions was null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 54
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method private appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 6
    .param p1, "b"    # Ljava/lang/StringBuilder;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "prefix"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0xa

    .line 195
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "-l_4_R":Ljava/lang/Object;
    array-length v1, v0

    .local v1, "-l_5_I":I
    const/4 v2, 0x0

    .local v2, "-l_6_I":I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 199
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-nez v4, :cond_1

    .line 203
    :goto_1
    return-void

    .line 196
    :cond_0
    aget-object v3, v0, v2

    .line 197
    .local v3, "stackElement":Ljava/lang/StackTraceElement;
    const-string/jumbo v4, "\t\tat "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 200
    .end local v3    # "stackElement":Ljava/lang/StackTraceElement;
    :cond_1
    const-string/jumbo v4, "\tCaused by: "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-direct {p0, p1, v4, v5}, Lio/reactivex/exceptions/CompositeException;->appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private getListOfCauses(Ljava/lang/Throwable;)Ljava/util/List;
    .locals 3
    .param p1, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 250
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 251
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 252
    .local v2, "root":Ljava/lang/Throwable;
    if-nez v2, :cond_1

    .line 253
    :cond_0
    return-object v1

    .line 252
    :cond_1
    if-eq v2, p1, :cond_0

    .line 256
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 258
    .local v0, "cause":Ljava/lang/Throwable;
    if-nez v0, :cond_3

    .line 259
    :cond_2
    return-object v1

    .line 258
    :cond_3
    if-eq v0, v2, :cond_2

    .line 261
    move-object v2, v0

    goto :goto_0
.end method

.method private getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 282
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 283
    .local v1, "root":Ljava/lang/Throwable;
    if-nez v1, :cond_1

    .line 284
    :cond_0
    return-object p1

    .line 283
    :cond_1
    iget-object v2, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    if-eq v2, v1, :cond_0

    .line 287
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 288
    .local v0, "cause":Ljava/lang/Throwable;
    if-nez v0, :cond_3

    .line 289
    :cond_2
    return-object v1

    .line 288
    :cond_3
    if-eq v0, v1, :cond_2

    .line 291
    move-object v1, v0

    goto :goto_0
.end method

.method private printStackTrace(Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;)V
    .locals 10
    .param p1, "s"    # Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;

    .prologue
    const/16 v9, 0xa

    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v8, 0x80

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 181
    .local v4, "b":Ljava/lang/StringBuilder;
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 182
    invoke-virtual {p0}, Lio/reactivex/exceptions/CompositeException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "-l_3_R":Ljava/lang/Object;
    array-length v1, v0

    .local v1, "-l_4_I":I
    const/4 v3, 0x0

    .local v3, "-l_5_I":I
    :goto_0
    if-lt v3, v1, :cond_0

    .line 185
    const/4 v6, 0x1

    .line 186
    .local v6, "i":I
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "-l_4_R":Ljava/lang/Object;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_1

    .line 191
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;->println(Ljava/lang/Object;)V

    .line 192
    return-void

    .line 182
    .end local v2    # "-l_4_R":Ljava/lang/Object;
    .end local v6    # "i":I
    :cond_0
    aget-object v7, v0, v3

    .line 183
    .local v7, "myStackElement":Ljava/lang/StackTraceElement;
    const-string/jumbo v8, "\tat "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 182
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 186
    .end local v7    # "myStackElement":Ljava/lang/StackTraceElement;
    .restart local v2    # "-l_4_R":Ljava/lang/Object;
    .restart local v6    # "i":I
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Throwable;

    .line 187
    .local v5, "ex":Ljava/lang/Throwable;
    const-string/jumbo v8, "  ComposedException "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " :\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    const-string/jumbo v8, "\t"

    invoke-direct {p0, v4, v5, v8}, Lio/reactivex/exceptions/CompositeException;->appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 189
    add-int/lit8 v6, v6, 0x1

    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized getCause()Ljava/lang/Throwable;
    .locals 9
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    monitor-enter p0

    .line 108
    :try_start_0
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    if-eqz v8, :cond_0

    .line 144
    :goto_0
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v8

    .line 110
    :cond_0
    :try_start_1
    new-instance v6, Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;

    invoke-direct {v6}, Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;-><init>()V

    .line 111
    .local v6, "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 113
    .local v7, "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    move-object v2, v6

    .line 114
    .local v2, "chain":Ljava/lang/Throwable;
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "-l_4_R":Ljava/lang/Object;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_2

    .line 142
    iput-object v6, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .end local v0    # "-l_4_R":Ljava/lang/Object;
    .end local v2    # "chain":Ljava/lang/Throwable;
    .end local v6    # "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    .end local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 114
    .restart local v0    # "-l_4_R":Ljava/lang/Object;
    .restart local v2    # "chain":Ljava/lang/Throwable;
    .restart local v6    # "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    .restart local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :cond_2
    :try_start_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    .line 115
    .local v4, "e":Ljava/lang/Throwable;
    invoke-interface {v7, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 119
    invoke-interface {v7, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 121
    invoke-direct {p0, v4}, Lio/reactivex/exceptions/CompositeException;->getListOfCauses(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v5

    .line 123
    .local v5, "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "-l_7_R":Ljava/lang/Object;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v8

    if-nez v8, :cond_3

    .line 134
    :try_start_3
    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 140
    :goto_3
    :try_start_4
    invoke-direct {p0, v2}, Lio/reactivex/exceptions/CompositeException;->getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v2

    goto :goto_1

    .line 123
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    .line 124
    .local v3, "child":Ljava/lang/Throwable;
    invoke-interface {v7, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 129
    invoke-interface {v7, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 126
    :cond_4
    new-instance v4, Ljava/lang/RuntimeException;

    .end local v4    # "e":Ljava/lang/Throwable;
    const-string/jumbo v8, "Duplicate found in causal chain so cropping to prevent loop ..."

    invoke-direct {v4, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .restart local v4    # "e":Ljava/lang/Throwable;
    goto :goto_2

    .line 135
    .end local v3    # "child":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    goto :goto_3
.end method

.method public getExceptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lio/reactivex/exceptions/CompositeException;->message:Ljava/lang/String;

    return-object v0
.end method

.method public printStackTrace()V
    .locals 1

    .prologue
    .line 159
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lio/reactivex/exceptions/CompositeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 160
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintStream;

    .prologue
    .line 164
    new-instance v0, Lio/reactivex/exceptions/CompositeException$WrappedPrintStream;

    invoke-direct {v0, p1}, Lio/reactivex/exceptions/CompositeException$WrappedPrintStream;-><init>(Ljava/io/PrintStream;)V

    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;->printStackTrace(Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;)V

    .line 165
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintWriter;

    .prologue
    .line 169
    new-instance v0, Lio/reactivex/exceptions/CompositeException$WrappedPrintWriter;

    invoke-direct {v0, p1}, Lio/reactivex/exceptions/CompositeException$WrappedPrintWriter;-><init>(Ljava/io/PrintWriter;)V

    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;->printStackTrace(Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;)V

    .line 170
    return-void
.end method
