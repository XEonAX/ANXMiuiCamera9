.class public Lcom/qualcomm/qti/Performance;
.super Ljava/lang/Object;
.source "Performance.java"


# static fields
.field public static final REQUEST_FAILED:I = -0x1

.field public static final REQUEST_SUCCEEDED:I = 0x0

.field private static final TAG:Ljava/lang/String; = "Perf"


# instance fields
.field private handle:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 19
    :try_start_0
    const-string/jumbo v1, "qti_performance"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_6} :catch_7

    .line 14
    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    :goto_6
    return-void

    .line 20
    .end local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    :catch_7
    move-exception v0

    .restart local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    goto :goto_6
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    .line 26
    return-void
.end method

.method private native native_perf_hint(ILjava/lang/String;II)I
.end method

.method private native native_perf_io_prefetch_start(ILjava/lang/String;Ljava/lang/String;)I
.end method

.method private native native_perf_io_prefetch_stop()I
.end method

.method private native native_perf_lock_acq(II[I)I
.end method

.method private native native_perf_lock_rel(I)I
.end method

.method private native native_perf_uxEngine_events(IILjava/lang/String;I)I
.end method

.method private native native_perf_uxEngine_trigger(I)Ljava/lang/String;
.end method


# virtual methods
.method public perfHint(ILjava/lang/String;II)I
    .registers 6
    .param p1, "hint"    # I
    .param p2, "userDataStr"    # Ljava/lang/String;
    .param p3, "userData1"    # I
    .param p4, "userData2"    # I

    .prologue
    .line 62
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/qualcomm/qti/Performance;->native_perf_hint(ILjava/lang/String;II)I

    move-result v0

    iput v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    .line 63
    iget v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    if-gtz v0, :cond_c

    .line 64
    const/4 v0, -0x1

    return v0

    .line 66
    :cond_c
    iget v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    return v0
.end method

.method public perfIOPrefetchStart(ILjava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p1, "PId"    # I
    .param p2, "Pkg_name"    # Ljava/lang/String;
    .param p3, "Code_path"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3}, Lcom/qualcomm/qti/Performance;->native_perf_io_prefetch_start(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public perfIOPrefetchStop()I
    .registers 2

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/qualcomm/qti/Performance;->native_perf_io_prefetch_stop()I

    move-result v0

    return v0
.end method

.method public varargs perfLockAcquire(I[I)I
    .registers 4
    .param p1, "duration"    # I
    .param p2, "list"    # [I

    .prologue
    .line 38
    iget v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    invoke-direct {p0, v0, p1, p2}, Lcom/qualcomm/qti/Performance;->native_perf_lock_acq(II[I)I

    move-result v0

    iput v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    .line 39
    iget v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    if-gtz v0, :cond_e

    .line 40
    const/4 v0, -0x1

    return v0

    .line 42
    :cond_e
    iget v0, p0, Lcom/qualcomm/qti/Performance;->handle:I

    return v0
.end method

.method public perfLockRelease()I
    .registers 3

    .prologue
    .line 47
    const/4 v0, 0x0

    .line 49
    .local v0, "retValue":I
    iget v1, p0, Lcom/qualcomm/qti/Performance;->handle:I

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/Performance;->native_perf_lock_rel(I)I

    move-result v0

    .line 50
    const/4 v1, 0x0

    iput v1, p0, Lcom/qualcomm/qti/Performance;->handle:I

    .line 51
    return v0
.end method

.method public perfLockReleaseHandler(I)I
    .registers 3
    .param p1, "_handle"    # I

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/Performance;->native_perf_lock_rel(I)I

    move-result v0

    return v0
.end method

.method public perfUXEngine_events(IILjava/lang/String;I)I
    .registers 6
    .param p1, "opcode"    # I
    .param p2, "pid"    # I
    .param p3, "pkg_name"    # Ljava/lang/String;
    .param p4, "lat"    # I

    .prologue
    .line 80
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/qualcomm/qti/Performance;->native_perf_uxEngine_events(IILjava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public perfUXEngine_trigger(I)Ljava/lang/String;
    .registers 3
    .param p1, "opcode"    # I

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/Performance;->native_perf_uxEngine_trigger(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
