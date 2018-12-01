.class public final enum Lio/reactivex/internal/subscriptions/SubscriptionHelper;
.super Ljava/lang/Enum;
.source "SubscriptionHelper.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/internal/subscriptions/SubscriptionHelper;",
        ">;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/internal/subscriptions/SubscriptionHelper;

.field public static final enum CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 33
    new-instance v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    const-string/jumbo v1, "CANCELLED"

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    .line 28
    const/4 v0, 0x1

    new-array v0, v0, [Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    aput-object v1, v0, v2

    sput-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->$VALUES:[Lio/reactivex/internal/subscriptions/SubscriptionHelper;

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
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 185
    .local v0, "current":Lorg/reactivestreams/Subscription;
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_1

    .line 194
    :cond_0
    const/4 v1, 0x0

    return v1

    .line 186
    :cond_1
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Lorg/reactivestreams/Subscription;
    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 187
    .restart local v0    # "current":Lorg/reactivestreams/Subscription;
    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-eq v0, v1, :cond_0

    .line 188
    if-nez v0, :cond_2

    .line 191
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 189
    :cond_2
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    goto :goto_0
.end method

.method public static reportSubscriptionSet()V
    .locals 2

    .prologue
    .line 71
    new-instance v0, Lio/reactivex/exceptions/ProtocolViolationException;

    const-string/jumbo v1, "Subscription already set!"

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/ProtocolViolationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 72
    return-void
.end method

.method public static setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z
    .locals 3
    .param p1, "s"    # Lorg/reactivestreams/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;",
            "Lorg/reactivestreams/Subscription;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Lorg/reactivestreams/Subscription;>;"
    const/4 v2, 0x0

    .line 140
    const-string/jumbo v0, "s is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    const/4 v0, 0x1

    return v0

    .line 142
    :cond_0
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 143
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->CANCELLED:Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    if-ne v0, v1, :cond_1

    .line 146
    :goto_0
    return v2

    .line 144
    :cond_1
    invoke-static {}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->reportSubscriptionSet()V

    goto :goto_0
.end method

.method public static validate(J)Z
    .locals 6
    .param p0, "n"    # J

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 80
    const-wide/16 v4, 0x0

    cmp-long v0, p0, v4

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    if-nez v0, :cond_1

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "n > 0 required but it was "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 82
    return v2

    :cond_0
    move v0, v2

    .line 80
    goto :goto_0

    .line 84
    :cond_1
    return v1
.end method

.method public static validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z
    .locals 3
    .param p0, "current"    # Lorg/reactivestreams/Subscription;
    .param p1, "next"    # Lorg/reactivestreams/Subscription;

    .prologue
    const/4 v2, 0x0

    .line 54
    if-eqz p1, :cond_0

    .line 58
    if-nez p0, :cond_1

    .line 63
    const/4 v0, 0x1

    return v0

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "next is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 56
    return v2

    .line 59
    :cond_1
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 60
    invoke-static {}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->reportSubscriptionSet()V

    .line 61
    return v2
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/internal/subscriptions/SubscriptionHelper;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    return-object v0
.end method

.method public static values()[Lio/reactivex/internal/subscriptions/SubscriptionHelper;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->$VALUES:[Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/subscriptions/SubscriptionHelper;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 44
    return-void
.end method

.method public request(J)V
    .locals 0
    .param p1, "n"    # J

    .prologue
    .line 39
    return-void
.end method
