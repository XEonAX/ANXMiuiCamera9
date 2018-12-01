.class public final Lio/reactivex/internal/schedulers/NewThreadScheduler;
.super Lio/reactivex/Scheduler;
.source "NewThreadScheduler.java"


# static fields
.field private static final THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;


# instance fields
.field final threadFactory:Ljava/util/concurrent/ThreadFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 38
    const/4 v1, 0x1

    const/16 v2, 0xa

    const-string/jumbo v3, "rx2.newthread-priority"

    const/4 v4, 0x5

    .line 39
    invoke-static {v3, v4}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 38
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 41
    .local v0, "priority":I
    new-instance v1, Lio/reactivex/internal/schedulers/RxThreadFactory;

    const-string/jumbo v2, "RxNewThreadScheduler"

    invoke-direct {v1, v2, v0}, Lio/reactivex/internal/schedulers/RxThreadFactory;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lio/reactivex/internal/schedulers/NewThreadScheduler;->THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;

    .line 42
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lio/reactivex/internal/schedulers/NewThreadScheduler;->THREAD_FACTORY:Lio/reactivex/internal/schedulers/RxThreadFactory;

    invoke-direct {p0, v0}, Lio/reactivex/internal/schedulers/NewThreadScheduler;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 0
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 48
    invoke-direct {p0}, Lio/reactivex/Scheduler;-><init>()V

    .line 49
    iput-object p1, p0, Lio/reactivex/internal/schedulers/NewThreadScheduler;->threadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 50
    return-void
.end method


# virtual methods
.method public createWorker()Lio/reactivex/Scheduler$Worker;
    .locals 2
    .annotation build Lio/reactivex/annotations/NonNull;
    .end annotation

    .prologue
    .line 55
    new-instance v0, Lio/reactivex/internal/schedulers/NewThreadWorker;

    iget-object v1, p0, Lio/reactivex/internal/schedulers/NewThreadScheduler;->threadFactory:Ljava/util/concurrent/ThreadFactory;

    invoke-direct {v0, v1}, Lio/reactivex/internal/schedulers/NewThreadWorker;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    return-object v0
.end method
