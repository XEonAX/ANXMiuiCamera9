.class public Lcom/android/gallery3d/ui/GLCanvasImpl;
.super Lcom/android/gallery3d/ui/BaseGLCanvas;
.source "GLCanvasImpl.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/android/gallery3d/ui/BaseGLCanvas;-><init>()V

    .line 41
    new-instance v1, Lcom/android/camera/effect/renders/RenderGroup;

    invoke-direct {v1, p0}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v1, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    .line 42
    new-instance v1, Lcom/android/camera/effect/renders/RenderGroup;

    invoke-direct {v1, p0}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v1, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    .line 44
    new-instance v0, Lcom/android/camera/effect/renders/EffectRenderGroup;

    invoke-direct {v0, p0}, Lcom/android/camera/effect/renders/EffectRenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 45
    .local v0, "effectControlRenderGroup":Lcom/android/camera/effect/renders/EffectRenderGroup;
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->addChangeListener(Lcom/android/camera/effect/EffectController$EffectChangedListener;)V

    .line 47
    iget-object v1, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 48
    iget-object v1, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    new-instance v2, Lcom/android/camera/effect/renders/BasicRender;

    invoke-direct {v2, p0}, Lcom/android/camera/effect/renders/BasicRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 49
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/GLCanvasImpl;->initialize()V

    .line 50
    return-void
.end method


# virtual methods
.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V
    .locals 1
    .param p1, "attr"    # Lcom/android/camera/effect/draw_mode/DrawAttribute;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 74
    return-void
.end method

.method protected initialize()V
    .locals 1

    .prologue
    .line 54
    invoke-super {p0}, Lcom/android/gallery3d/ui/BaseGLCanvas;->initialize()V

    .line 55
    const/16 v0, 0xbd0

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 56
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Landroid/opengl/GLES20;->glLineWidth(F)V

    .line 57
    return-void
.end method

.method public prepareBlurRenders()V
    .locals 3

    .prologue
    .line 87
    iget-object v0, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_0

    .line 89
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/android/gallery3d/ui/GLCanvasImpl;->prepareEffectRenders(ZI)V

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    iget-object v1, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 93
    :cond_1
    return-void
.end method

.method public prepareEffectRenders(ZI)V
    .locals 6
    .param p1, "isWhole"    # Z
    .param p2, "renderId"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v0, p2}, Lcom/android/camera/effect/renders/RenderGroup;->isNeedInit(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    .line 81
    iget-object v2, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    const/4 v4, 0x0

    move-object v1, p0

    move v3, p1

    move v5, p2

    .line 80
    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/effect/EffectController;->getEffectGroup(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;

    .line 83
    :cond_0
    return-void
.end method

.method public setSize(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 61
    invoke-super {p0, p1, p2}, Lcom/android/gallery3d/ui/BaseGLCanvas;->setSize(II)V

    .line 62
    const-string/jumbo v0, "GLCanvasImpl"

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

    .line 63
    const-string/jumbo v2, " modelMatrix="

    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 63
    iget-object v2, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mState:Lcom/android/camera/effect/GLCanvasState;

    invoke-virtual {v2}, Lcom/android/camera/effect/GLCanvasState;->getModelMatrix()[F

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->dumpMatrix([F)Ljava/lang/String;

    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    return-void
.end method

.method public setSticker(Ljava/lang/String;)V
    .locals 1
    .param p1, "sticker"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/gallery3d/ui/GLCanvasImpl;->mRenderGroup:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->setSticker(Ljava/lang/String;)V

    .line 101
    return-void
.end method
