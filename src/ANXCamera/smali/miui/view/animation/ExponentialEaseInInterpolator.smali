.class public Lmiui/view/animation/ExponentialEaseInInterpolator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 15
    cmpl-float v1, p1, v0

    if-nez v1, :cond_6

    :goto_5
    return v0

    :cond_6
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v2, p1, v2

    const/high16 v3, 0x41200000    # 10.0f

    mul-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    goto :goto_5
.end method
