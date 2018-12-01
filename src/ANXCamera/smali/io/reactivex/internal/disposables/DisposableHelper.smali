.class public final enum Lio/reactivex/internal/disposables/DisposableHelper;
.super Ljava/lang/Enum;
.source "DisposableHelper.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/internal/disposables/DisposableHelper;",
        ">;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/internal/disposables/DisposableHelper;

.field public static final enum DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 31
    new-instance v0, Lio/reactivex/internal/disposables/DisposableHelper;

    const-string/jumbo v1, "DISPOSED"

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/disposables/DisposableHelper;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    .line 27
    const/4 v0, 0x1

    new-array v0, v0, [Lio/reactivex/internal/disposables/DisposableHelper;

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    aput-object v1, v0, v2

    sput-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->$VALUES:[Lio/reactivex/internal/disposables/DisposableHelper;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/disposables/Disposable;>;"
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 120
    .local v0, "current":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    .line 121
    .local v1, "d":Lio/reactivex/disposables/Disposable;
    if-ne v0, v1, :cond_1

    .line 130
    :cond_0
    const/4 v2, 0x0

    return v2

    .line 122
    :cond_1
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Lio/reactivex/disposables/Disposable;
    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 123
    .restart local v0    # "current":Lio/reactivex/disposables/Disposable;
    if-eq v0, v1, :cond_0

    .line 124
    if-nez v0, :cond_2

    .line 127
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 125
    :cond_2
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto :goto_0
.end method

.method public static isDisposed(Lio/reactivex/disposables/Disposable;)Z
    .locals 1
    .param p0, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 40
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq p0, v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static replace(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z
    .locals 3
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;",
            "Lio/reactivex/disposables/Disposable;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/disposables/Disposable;>;"
    const/4 v2, 0x0

    .line 100
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 101
    .local v0, "current":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v0, v1, :cond_1

    .line 107
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 108
    const/4 v1, 0x1

    return v1

    .line 102
    :cond_1
    if-nez p1, :cond_2

    .line 105
    :goto_0
    return v2

    .line 103
    :cond_2
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto :goto_0
.end method

.method public static reportDisposableSet()V
    .locals 2

    .prologue
    .line 157
    new-instance v0, Lio/reactivex/exceptions/ProtocolViolationException;

    const-string/jumbo v1, "Disposable already set!"

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/ProtocolViolationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 158
    return-void
.end method

.method public static setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z
    .locals 3
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;",
            "Lio/reactivex/disposables/Disposable;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lio/reactivex/disposables/Disposable;>;"
    const/4 v2, 0x0

    .line 79
    const-string/jumbo v0, "d is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    const/4 v0, 0x1

    return v0

    .line 81
    :cond_0
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 82
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_1

    .line 85
    :goto_0
    return v2

    .line 83
    :cond_1
    invoke-static {}, Lio/reactivex/internal/disposables/DisposableHelper;->reportDisposableSet()V

    goto :goto_0
.end method

.method public static validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z
    .locals 3
    .param p0, "current"    # Lio/reactivex/disposables/Disposable;
    .param p1, "next"    # Lio/reactivex/disposables/Disposable;

    .prologue
    const/4 v2, 0x0

    .line 141
    if-eqz p1, :cond_0

    .line 145
    if-nez p0, :cond_1

    .line 150
    const/4 v0, 0x1

    return v0

    .line 142
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "next is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 143
    return v2

    .line 146
    :cond_1
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 147
    invoke-static {}, Lio/reactivex/internal/disposables/DisposableHelper;->reportDisposableSet()V

    .line 148
    return v2
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/internal/disposables/DisposableHelper;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/disposables/DisposableHelper;

    return-object v0
.end method

.method public static values()[Lio/reactivex/internal/disposables/DisposableHelper;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lio/reactivex/internal/disposables/DisposableHelper;->$VALUES:[Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/disposables/DisposableHelper;

    return-object v0
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 180
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 184
    const/4 v0, 0x1

    return v0
.end method
