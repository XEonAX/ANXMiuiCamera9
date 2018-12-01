.class public final Lio/reactivex/internal/operators/single/SingleCreate;
.super Lio/reactivex/Single;
.source "SingleCreate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/single/SingleCreate$Emitter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final source:Lio/reactivex/SingleOnSubscribe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleOnSubscribe",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/SingleOnSubscribe;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleOnSubscribe",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleCreate;, "Lio/reactivex/internal/operators/single/SingleCreate<TT;>;"
    .local p1, "source":Lio/reactivex/SingleOnSubscribe;, "Lio/reactivex/SingleOnSubscribe<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 30
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleCreate;->source:Lio/reactivex/SingleOnSubscribe;

    .line 31
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleCreate;, "Lio/reactivex/internal/operators/single/SingleCreate<TT;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/single/SingleCreate$Emitter;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/single/SingleCreate$Emitter;-><init>(Lio/reactivex/SingleObserver;)V

    .line 36
    .local v1, "parent":Lio/reactivex/internal/operators/single/SingleCreate$Emitter;, "Lio/reactivex/internal/operators/single/SingleCreate$Emitter<TT;>;"
    invoke-interface {p1, v1}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 39
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleCreate;->source:Lio/reactivex/SingleOnSubscribe;

    invoke-interface {v2, v1}, Lio/reactivex/SingleOnSubscribe;->subscribe(Lio/reactivex/SingleEmitter;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 42
    invoke-virtual {v1, v0}, Lio/reactivex/internal/operators/single/SingleCreate$Emitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
