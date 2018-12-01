.class Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;
.super Ljava/lang/Object;
.source "GLCanvasState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/GLCanvasState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CanvasStateConfig"
.end annotation


# instance fields
.field mAlpha:F

.field mBlendAlpha:F

.field mModelMatrix:[F

.field mTexMatrix:[F

.field final synthetic this$0:Lcom/android/camera/effect/GLCanvasState;


# direct methods
.method public constructor <init>(Lcom/android/camera/effect/GLCanvasState;[F[FFF)V
    .locals 3
    .param p1, "this$0"    # Lcom/android/camera/effect/GLCanvasState;
    .param p2, "modelMatrix"    # [F
    .param p3, "texMatrix"    # [F
    .param p4, "alpha"    # F
    .param p5, "blendAlpha"    # F

    .prologue
    const/16 v2, 0x10

    const/4 v1, 0x0

    .line 39
    iput-object p1, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->this$0:Lcom/android/camera/effect/GLCanvasState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-array v0, v2, [F

    iput-object v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mModelMatrix:[F

    .line 35
    new-array v0, v2, [F

    iput-object v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mTexMatrix:[F

    .line 36
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mAlpha:F

    .line 37
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mBlendAlpha:F

    .line 40
    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mModelMatrix:[F

    invoke-static {p2, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy([FI[FII)V

    .line 41
    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mTexMatrix:[F

    invoke-static {p3, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy([FI[FII)V

    .line 43
    iput p4, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mAlpha:F

    .line 44
    iput p5, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mBlendAlpha:F

    .line 45
    return-void
.end method


# virtual methods
.method public getAlpha()F
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mAlpha:F

    return v0
.end method

.method public getBlendAlpha()F
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mBlendAlpha:F

    return v0
.end method

.method public getModelMatrix()[F
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mModelMatrix:[F

    return-object v0
.end method

.method public getTexMatrix()[F
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->mTexMatrix:[F

    return-object v0
.end method
