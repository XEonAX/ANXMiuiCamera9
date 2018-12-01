.class public final Lio/reactivex/exceptions/Exceptions;
.super Ljava/lang/Object;
.source "Exceptions.java"


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 46
    invoke-static {p0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static throwIfFatal(Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param

    .prologue
    .line 68
    instance-of v0, p0, Ljava/lang/VirtualMachineError;

    if-nez v0, :cond_0

    .line 70
    instance-of v0, p0, Ljava/lang/ThreadDeath;

    if-nez v0, :cond_1

    .line 72
    instance-of v0, p0, Ljava/lang/LinkageError;

    if-nez v0, :cond_2

    .line 75
    return-void

    .line 69
    :cond_0
    check-cast p0, Ljava/lang/VirtualMachineError;

    .end local p0    # "t":Ljava/lang/Throwable;
    throw p0

    .line 71
    .restart local p0    # "t":Ljava/lang/Throwable;
    :cond_1
    check-cast p0, Ljava/lang/ThreadDeath;

    .end local p0    # "t":Ljava/lang/Throwable;
    throw p0

    .line 73
    .restart local p0    # "t":Ljava/lang/Throwable;
    :cond_2
    check-cast p0, Ljava/lang/LinkageError;

    .end local p0    # "t":Ljava/lang/Throwable;
    throw p0
.end method
