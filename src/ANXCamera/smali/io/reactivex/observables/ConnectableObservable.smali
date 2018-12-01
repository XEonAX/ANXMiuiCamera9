.class public abstract Lio/reactivex/observables/ConnectableObservable;
.super Lio/reactivex/Observable;
.source "ConnectableObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    return-void
.end method


# virtual methods
.method public final connect()Lio/reactivex/disposables/Disposable;
    .locals 2

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/observables/ConnectableObservable;, "Lio/reactivex/observables/ConnectableObservable<TT;>;"
    new-instance v0, Lio/reactivex/internal/util/ConnectConsumer;

    invoke-direct {v0}, Lio/reactivex/internal/util/ConnectConsumer;-><init>()V

    .line 63
    .local v0, "cc":Lio/reactivex/internal/util/ConnectConsumer;
    invoke-virtual {p0, v0}, Lio/reactivex/observables/ConnectableObservable;->connect(Lio/reactivex/functions/Consumer;)V

    .line 64
    iget-object v1, v0, Lio/reactivex/internal/util/ConnectConsumer;->disposable:Lio/reactivex/disposables/Disposable;

    return-object v1
.end method

.method public abstract connect(Lio/reactivex/functions/Consumer;)V
    .param p1    # Lio/reactivex/functions/Consumer;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Lio/reactivex/disposables/Disposable;",
            ">;)V"
        }
    .end annotation
.end method
