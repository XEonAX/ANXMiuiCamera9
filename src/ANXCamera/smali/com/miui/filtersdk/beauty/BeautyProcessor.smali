.class public abstract Lcom/miui/filtersdk/beauty/BeautyProcessor;
.super Ljava/lang/Object;
.source "BeautyProcessor.java"


# instance fields
.field protected mRotation:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getSupportedBeautyParamTypes()[Lcom/miui/filtersdk/beauty/BeautyParameterType;
.end method

.method public abstract getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F
.end method

.method public abstract init(II)V
.end method

.method public abstract onDisplaySizeChanged(II)V
.end method

.method public abstract release()V
.end method

.method public abstract setBeautyParamsDegree(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation
.end method

.method public setRotation(I)V
    .locals 0
    .param p1, "rotation"    # I

    .prologue
    .line 11
    iput p1, p0, Lcom/miui/filtersdk/beauty/BeautyProcessor;->mRotation:I

    .line 12
    return-void
.end method
