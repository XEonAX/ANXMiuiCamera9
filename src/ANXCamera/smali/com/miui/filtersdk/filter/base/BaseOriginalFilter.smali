.class public Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
.super Lcom/miui/filtersdk/filter/base/GPUImageFilter;
.source "BaseOriginalFilter.java"


# instance fields
.field protected mDegree:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;-><init>()V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "vertexShader"    # Ljava/lang/String;
    .param p2, "fragmentShader"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    return-void
.end method


# virtual methods
.method public isDegreeAdjustSupported()Z
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    return v0
.end method

.method public setDegree(I)V
    .locals 2
    .param p1, "degree"    # I

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->isDegreeAdjustSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    if-ltz p1, :cond_1

    .line 34
    :goto_0
    const/16 v0, 0x64

    if-gt p1, v0, :cond_2

    .line 38
    :goto_1
    iput p1, p0, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->mDegree:I

    .line 39
    return-void

    .line 27
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Degree adjustment of the filter is not supported!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 31
    :cond_1
    const/4 p1, 0x0

    goto :goto_0

    .line 35
    :cond_2
    const/16 p1, 0x64

    goto :goto_1
.end method
