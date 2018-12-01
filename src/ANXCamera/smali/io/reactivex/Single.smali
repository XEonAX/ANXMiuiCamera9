.class public abstract Lio/reactivex/Single;
.super Ljava/lang/Object;
.source "Single.java"

# interfaces
.implements Lio/reactivex/SingleSource;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleSource",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/SingleOnSubscribe",
            "<TT;>;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 360
    .local p0, "source":Lio/reactivex/SingleOnSubscribe;, "Lio/reactivex/SingleOnSubscribe<TT;>;"
    const-string/jumbo v0, "source is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 361
    new-instance v0, Lio/reactivex/internal/operators/single/SingleCreate;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/single/SingleCreate;-><init>(Lio/reactivex/SingleOnSubscribe;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static error(Ljava/lang/Throwable;)Lio/reactivex/Single;
    .locals 1
    .param p0, "exception"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 422
    const-string/jumbo v0, "error is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 423
    invoke-static {p0}, Lio/reactivex/internal/functions/Functions;->justCallable(Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    move-result-object v0

    invoke-static {v0}, Lio/reactivex/Single;->error(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static error(Ljava/util/concurrent/Callable;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 397
    .local p0, "errorSupplier":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Ljava/lang/Throwable;>;"
    const-string/jumbo v0, "errorSupplier is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 398
    new-instance v0, Lio/reactivex/internal/operators/single/SingleError;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/single/SingleError;-><init>(Ljava/util/concurrent/Callable;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static just(Ljava/lang/Object;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 655
    .local p0, "item":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "value is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 656
    new-instance v0, Lio/reactivex/internal/operators/single/SingleJust;

    invoke-direct {v0, p0}, Lio/reactivex/internal/operators/single/SingleJust;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static zip(Lio/reactivex/SingleSource;Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/SingleSource",
            "<+TT1;>;",
            "Lio/reactivex/SingleSource",
            "<+TT2;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT1;-TT2;+TR;>;)",
            "Lio/reactivex/Single",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1341
    .local p0, "source1":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT1;>;"
    .local p1, "source2":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<+TT2;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT1;-TT2;+TR;>;"
    const-string/jumbo v0, "source1 is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1342
    const-string/jumbo v0, "source2 is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1343
    invoke-static {p2}, Lio/reactivex/internal/functions/Functions;->toFunction(Lio/reactivex/functions/BiFunction;)Lio/reactivex/functions/Function;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Lio/reactivex/SingleSource;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lio/reactivex/Single;->zipArray(Lio/reactivex/functions/Function;[Lio/reactivex/SingleSource;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public static varargs zipArray(Lio/reactivex/functions/Function;[Lio/reactivex/SingleSource;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;[",
            "Lio/reactivex/SingleSource",
            "<+TT;>;)",
            "Lio/reactivex/Single",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 1748
    .local p0, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    .local p1, "sources":[Lio/reactivex/SingleSource;, "[Lio/reactivex/SingleSource<+TT;>;"
    const-string/jumbo v0, "zipper is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1749
    const-string/jumbo v0, "sources is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1750
    array-length v0, p1

    if-eqz v0, :cond_0

    .line 1753
    new-instance v0, Lio/reactivex/internal/operators/single/SingleZipArray;

    invoke-direct {v0, p1, p0}, Lio/reactivex/internal/operators/single/SingleZipArray;-><init>([Lio/reactivex/SingleSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0

    .line 1751
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    invoke-static {v0}, Lio/reactivex/Single;->error(Ljava/lang/Throwable;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;)",
            "Lio/reactivex/Single",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 2538
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    const-string/jumbo v0, "mapper is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2539
    new-instance v0, Lio/reactivex/internal/operators/single/SingleMap;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/single/SingleMap;-><init>(Lio/reactivex/SingleSource;Lio/reactivex/functions/Function;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 2628
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2629
    new-instance v0, Lio/reactivex/internal/operators/single/SingleObserveOn;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/single/SingleObserveOn;-><init>(Lio/reactivex/SingleSource;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3053
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    .local p1, "onSuccess":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    sget-object v0, Lio/reactivex/internal/functions/Functions;->ON_ERROR_MISSING:Lio/reactivex/functions/Consumer;

    invoke-virtual {p0, p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lio/reactivex/disposables/Disposable;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3078
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    .local p1, "onSuccess":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p2, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    const-string/jumbo v1, "onSuccess is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3079
    const-string/jumbo v1, "onError is null"

    invoke-static {p2, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3081
    new-instance v0, Lio/reactivex/internal/observers/ConsumerSingleObserver;

    invoke-direct {v0, p1, p2}, Lio/reactivex/internal/observers/ConsumerSingleObserver;-><init>(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)V

    .line 3082
    .local v0, "s":Lio/reactivex/internal/observers/ConsumerSingleObserver;, "Lio/reactivex/internal/observers/ConsumerSingleObserver<TT;>;"
    invoke-virtual {p0, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 3083
    return-object v0
.end method

.method public final subscribe(Lio/reactivex/SingleObserver;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3089
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    .local p1, "subscriber":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    const-string/jumbo v3, "subscriber is null"

    invoke-static {p1, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3091
    invoke-static {p0, p1}, Lio/reactivex/plugins/RxJavaPlugins;->onSubscribe(Lio/reactivex/Single;Lio/reactivex/SingleObserver;)Lio/reactivex/SingleObserver;

    move-result-object p1

    .line 3093
    const-string/jumbo v3, "subscriber returned by the RxJavaPlugins hook is null"

    invoke-static {p1, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3096
    :try_start_0
    invoke-virtual {p0, p1}, Lio/reactivex/Single;->subscribeActual(Lio/reactivex/SingleObserver;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 3105
    return-void

    .line 3097
    :catch_0
    move-exception v0

    .line 3098
    .local v0, "ex":Ljava/lang/NullPointerException;
    throw v0

    .line 3099
    .end local v0    # "ex":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v1

    .line 3100
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 3101
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "subscribeActual failed"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 3102
    .local v2, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v2, v1}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 3103
    throw v2
.end method

.method protected abstract subscribeActual(Lio/reactivex/SingleObserver;)V
    .param p1    # Lio/reactivex/SingleObserver;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation
.end method

.method public final subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;
    .locals 1
    .param p1, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/Single",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "custom"
    .end annotation

    .prologue
    .line 3163
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    const-string/jumbo v0, "scheduler is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3164
    new-instance v0, Lio/reactivex/internal/operators/single/SingleSubscribeOn;

    invoke-direct {v0, p0, p1}, Lio/reactivex/internal/operators/single/SingleSubscribeOn;-><init>(Lio/reactivex/SingleSource;Lio/reactivex/Scheduler;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onAssembly(Lio/reactivex/Single;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/SingleSource",
            "<TU;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT;-TU;+TR;>;)",
            "Lio/reactivex/Single",
            "<TR;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .annotation runtime Lio/reactivex/annotations/SchedulerSupport;
        value = "none"
    .end annotation

    .prologue
    .line 3514
    .local p0, "this":Lio/reactivex/Single;, "Lio/reactivex/Single<TT;>;"
    .local p1, "other":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<TU;>;"
    .local p2, "zipper":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TT;-TU;+TR;>;"
    invoke-static {p0, p1, p2}, Lio/reactivex/Single;->zip(Lio/reactivex/SingleSource;Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method
