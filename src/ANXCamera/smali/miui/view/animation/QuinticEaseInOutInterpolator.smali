.class public Lmiui/view/animation/QuinticEaseInOutInterpolator;
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
    const/high16 v3, 0x3f000000    # 0.5f

    const/high16 v2, 0x40000000    # 2.0f

    .line 15
    mul-float v0, p1, v2

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v1, v0, v1

    if-gez v1, :cond_13

    .line 17
    mul-float v1, v3, v0

    mul-float/2addr v1, v0

    mul-float/2addr v1, v0

    mul-float/2addr v1, v0

    mul-float/2addr v0, v1

    return v0

    .line 19
    :cond_13
    sub-float/2addr v0, v2

    .line 20
    mul-float v1, v0, v0

    mul-float/2addr v1, v0

    mul-float/2addr v1, v0

    mul-float/2addr v0, v1

    add-float/2addr v0, v2

    mul-float/2addr v0, v3

    return v0
.end method