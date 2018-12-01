.class public final enum Lio/reactivex/internal/util/NotificationLite;
.super Ljava/lang/Enum;
.source "NotificationLite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/util/NotificationLite$ErrorNotification;,
        Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/internal/util/NotificationLite;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/internal/util/NotificationLite;

.field public static final enum COMPLETE:Lio/reactivex/internal/util/NotificationLite;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 27
    new-instance v0, Lio/reactivex/internal/util/NotificationLite;

    const-string/jumbo v1, "COMPLETE"

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/util/NotificationLite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    .line 26
    const/4 v0, 0x1

    new-array v0, v0, [Lio/reactivex/internal/util/NotificationLite;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    aput-object v1, v0, v2

    sput-object v0, Lio/reactivex/internal/util/NotificationLite;->$VALUES:[Lio/reactivex/internal/util/NotificationLite;

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
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static acceptFull(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 260
    sget-object v0, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-eq p0, v0, :cond_0

    .line 264
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    if-nez v0, :cond_1

    .line 268
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    if-nez v0, :cond_2

    .line 272
    invoke-interface {p1, p0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 273
    return v1

    .line 261
    :cond_0
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 262
    return v2

    .line 265
    :cond_1
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;->e:Ljava/lang/Throwable;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 266
    return v2

    .line 269
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_2
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 270
    return v1
.end method

.method public static complete()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 111
    sget-object v0, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    return-object v0
.end method

.method public static error(Ljava/lang/Throwable;)Ljava/lang/Object;
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 120
    new-instance v0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    invoke-direct {v0, p0}, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static next(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "value":Ljava/lang/Object;, "TT;"
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/internal/util/NotificationLite;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lio/reactivex/internal/util/NotificationLite;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/util/NotificationLite;

    return-object v0
.end method

.method public static values()[Lio/reactivex/internal/util/NotificationLite;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lio/reactivex/internal/util/NotificationLite;->$VALUES:[Lio/reactivex/internal/util/NotificationLite;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/util/NotificationLite;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 304
    const-string/jumbo v0, "NotificationLite.Complete"

    return-object v0
.end method
