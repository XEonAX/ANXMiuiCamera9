.class public Lcom/android/camera/effect/VideoRecorderCanvas;
.super Lcom/android/gallery3d/ui/BaseGLCanvas;
.source "VideoRecorderCanvas.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/android/gallery3d/ui/BaseGLCanvas;-><init>()V

    .line 12
    new-instance v0, Lcom/android/camera/effect/renders/RenderGroup;

    invoke-direct {v0, p0}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    .line 13
    new-instance v0, Lcom/android/camera/effect/renders/VideoRecorderRender;

    invoke-direct {v0, p0}, Lcom/android/camera/effect/renders/VideoRecorderRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    .line 14
    invoke-virtual {p0}, Lcom/android/camera/effect/VideoRecorderCanvas;->initialize()V

    .line 15
    return-void
.end method


# virtual methods
.method public setSize(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 19
    invoke-super {p0, p1, p2}, Lcom/android/gallery3d/ui/BaseGLCanvas;->setSize(II)V

    .line 20
    const-string/jumbo v0, "VideoRecorderCanvas"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setSize: size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 21
    const-string/jumbo v2, " modelMatrix="

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/android/camera/effect/VideoRecorderCanvas;->mState:Lcom/android/camera/effect/GLCanvasState;

    invoke-virtual {v2}, Lcom/android/camera/effect/GLCanvasState;->getModelMatrix()[F

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->dumpMatrix([F)Ljava/lang/String;

    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    return-void
.end method
