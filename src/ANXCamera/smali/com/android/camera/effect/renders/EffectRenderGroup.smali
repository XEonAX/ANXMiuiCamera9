.class public Lcom/android/camera/effect/renders/EffectRenderGroup;
.super Lcom/android/camera/effect/renders/RenderGroup;
.source "EffectRenderGroup.java"

# interfaces
.implements Lcom/android/camera/effect/EffectController$EffectChangedListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mEffectId:I

.field private mFirstFrameDrawn:Z

.field private mIsFocusPeakEnabled:Z

.field private mIsGradienterEnabled:Z

.field private mIsMakeupEnabled:Z

.field private mIsStickerEnabled:Z

.field private mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

.field private mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

.field private mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

.field private mRenderChanged:Ljava/lang/Boolean;

.field private mTiltShiftMode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/android/camera/effect/renders/EffectRenderGroup;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/EffectRenderGroup;->TAG:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 2
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 25
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    iput v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I

    .line 37
    new-instance v0, Ljava/lang/Boolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Boolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderChanged:Ljava/lang/Boolean;

    .line 38
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getEffectRenderGroup()Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    .line 39
    new-instance v0, Lcom/android/camera/effect/renders/PipeRenderPair;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/PipeRenderPair;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    .line 40
    iget-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    new-instance v1, Lcom/android/camera/effect/renders/SurfaceTextureRender;

    invoke-direct {v1, p1}, Lcom/android/camera/effect/renders/SurfaceTextureRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRenderPair;->setFirstRender(Lcom/android/camera/effect/renders/Render;)V

    .line 41
    new-instance v0, Lcom/android/camera/effect/renders/PipeRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/PipeRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    .line 42
    iget-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/renders/EffectRenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 43
    return-void
.end method

.method private drawAnimationMask(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V
    .locals 8
    .param p1, "attr"    # Lcom/android/camera/effect/draw_mode/DrawAttribute;

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x0

    .line 139
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->getBlurAnimationValue()I

    move-result v6

    .line 140
    .local v6, "alpha":I
    if-lez v6, :cond_0

    .line 141
    iget-object v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    new-instance v0, Lcom/android/camera/effect/draw_mode/FillRectAttribute;

    move-object v2, p1

    .line 142
    check-cast v2, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget v2, v2, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    int-to-float v3, v2

    .line 143
    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .end local p1    # "attr":Lcom/android/camera/effect/draw_mode/DrawAttribute;
    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    int-to-float v4, v2

    .line 144
    invoke-static {v6, v5, v5, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    move v2, v1

    .line 141
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/FillRectAttribute;-><init>(FFFFI)V

    invoke-interface {v7, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 146
    :cond_0
    return-void
.end method

.method private drawPreview(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 5
    .param p1, "attr"    # Lcom/android/camera/effect/draw_mode/DrawAttribute;

    .prologue
    const/4 v4, 0x1

    .line 115
    iget-boolean v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mFirstFrameDrawn:Z

    if-nez v2, :cond_0

    .line 116
    iput-boolean v4, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mFirstFrameDrawn:Z

    .line 117
    iget v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mViewportWidth:I

    iget v3, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mViewportHeight:I

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/effect/renders/EffectRenderGroup;->setViewportSize(II)V

    .line 118
    iget v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewWidth:I

    iget v3, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewHeight:I

    invoke-virtual {p0, v2, v3}, Lcom/android/camera/effect/renders/EffectRenderGroup;->setPreviewSize(II)V

    :cond_0
    move-object v0, p1

    .line 121
    check-cast v0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .line 122
    .local v0, "ext":Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;
    invoke-direct {p0}, Lcom/android/camera/effect/renders/EffectRenderGroup;->updatePreviewSecondRender()Z

    move-result v1

    .line 123
    .local v1, "renderChanged":Z
    if-eqz v1, :cond_1

    .line 124
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v2}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result v2

    if-nez v2, :cond_2

    .line 125
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/renders/PipeRenderPair;->setSecondRender(Lcom/android/camera/effect/renders/Render;)V

    .line 130
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/EffectController;->isBackGroundBlur()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/renders/PipeRenderPair;->setUsedMiddleBuffer(Z)V

    .line 131
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    invoke-virtual {v2, p1}, Lcom/android/camera/effect/renders/PipeRenderPair;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 133
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/EffectRenderGroup;->drawAnimationMask(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 134
    return v4

    .line 126
    :cond_2
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    invoke-virtual {v2}, Lcom/android/camera/effect/renders/PipeRenderPair;->getRenderSize()I

    move-result v2

    if-ne v2, v4, :cond_1

    .line 127
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    iget-object v3, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/renders/PipeRenderPair;->setSecondRender(Lcom/android/camera/effect/renders/Render;)V

    goto :goto_0
.end method

.method private fetchRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 3
    .param p1, "renderId"    # I

    .prologue
    .line 149
    iget-object v1, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v1, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 150
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-nez v0, :cond_0

    .line 151
    iget-object v1, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1}, Lcom/android/gallery3d/ui/GLCanvas;->prepareEffectRenders(ZI)V

    .line 152
    iget-object v1, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v1, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 154
    :cond_0
    return-object v0
.end method

.method private removeCache(I)V
    .locals 1
    .param p1, "renderId"    # I

    .prologue
    .line 158
    iget-object v0, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderCaches:Lcom/android/camera/effect/renders/RenderGroup;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->removeRender(I)V

    .line 159
    return-void
.end method

.method private updatePreviewSecondRender()Z
    .locals 10

    .prologue
    const/4 v7, 0x0

    .line 162
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderChanged:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_0

    .line 163
    return v7

    .line 171
    :cond_0
    iget-object v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderChanged:Ljava/lang/Boolean;

    monitor-enter v7

    .line 172
    const/4 v0, 0x0

    .line 173
    .local v0, "effectRender":Lcom/android/camera/effect/renders/Render;
    const/4 v4, 0x0

    .line 174
    .local v4, "stickerRender":Lcom/android/camera/effect/renders/Render;
    const/4 v3, 0x0

    .line 175
    .local v3, "makeupRender":Lcom/android/camera/effect/renders/Render;
    const/4 v1, 0x0

    .line 176
    .local v1, "focusPeakRender":Lcom/android/camera/effect/renders/Render;
    const/4 v5, 0x0

    .line 177
    .local v5, "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    const/4 v2, 0x0

    .line 179
    .local v2, "gradienterRender":Lcom/android/camera/effect/renders/Render;
    :try_start_0
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6}, Lcom/android/camera/effect/renders/PipeRender;->clearRenders()V

    .line 182
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/effect/EffectController;->needDestroyMakeup()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 183
    sget v6, Lcom/android/camera/effect/FilterInfo;->RENDER_ID_MAKEUP:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->removeCache(I)V

    .line 184
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lcom/android/camera/effect/EffectController;->setDestroyMakeup(Z)V

    .line 187
    :cond_1
    iget-boolean v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsStickerEnabled:Z

    if-eqz v6, :cond_4

    .line 188
    iget v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I

    sget v8, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v6, v8, :cond_2

    .line 189
    iget v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 190
    .local v0, "effectRender":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_2

    .line 191
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v0}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 194
    .end local v0    # "effectRender":Lcom/android/camera/effect/renders/Render;
    :cond_2
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_STICKER:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 195
    .local v4, "stickerRender":Lcom/android/camera/effect/renders/Render;
    if-eqz v4, :cond_3

    .line 196
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v4}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 235
    .end local v1    # "focusPeakRender":Lcom/android/camera/effect/renders/Render;
    .end local v2    # "gradienterRender":Lcom/android/camera/effect/renders/Render;
    .end local v3    # "makeupRender":Lcom/android/camera/effect/renders/Render;
    .end local v4    # "stickerRender":Lcom/android/camera/effect/renders/Render;
    .end local v5    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_3
    :goto_0
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    iget v8, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewWidth:I

    iget v9, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewHeight:I

    invoke-virtual {v6, v8, v9}, Lcom/android/camera/effect/renders/PipeRender;->setFrameBufferSize(II)V

    .line 237
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iput-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderChanged:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    const/4 v6, 0x1

    monitor-exit v7

    return v6

    .line 199
    .local v0, "effectRender":Lcom/android/camera/effect/renders/Render;
    .restart local v1    # "focusPeakRender":Lcom/android/camera/effect/renders/Render;
    .restart local v2    # "gradienterRender":Lcom/android/camera/effect/renders/Render;
    .restart local v3    # "makeupRender":Lcom/android/camera/effect/renders/Render;
    .local v4, "stickerRender":Lcom/android/camera/effect/renders/Render;
    .restart local v5    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_4
    :try_start_1
    iget-boolean v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsMakeupEnabled:Z

    if-eqz v6, :cond_5

    .line 200
    sget v6, Lcom/android/camera/effect/FilterInfo;->RENDER_ID_MAKEUP:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v3

    .line 202
    .end local v3    # "makeupRender":Lcom/android/camera/effect/renders/Render;
    :cond_5
    iget v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I

    sget v8, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v6, v8, :cond_6

    .line 203
    iget v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 205
    .end local v0    # "effectRender":Lcom/android/camera/effect/renders/Render;
    :cond_6
    iget-boolean v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsGradienterEnabled:Z

    if-eqz v6, :cond_7

    .line 206
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v2

    .line 208
    .end local v2    # "gradienterRender":Lcom/android/camera/effect/renders/Render;
    :cond_7
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mTiltShiftMode:Ljava/lang/String;

    if-eqz v6, :cond_8

    .line 210
    const v6, 0x7f0f012b

    .line 209
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 210
    iget-object v8, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mTiltShiftMode:Ljava/lang/String;

    .line 209
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 211
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v5

    .line 217
    .end local v5    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_8
    :goto_1
    iget-boolean v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsFocusPeakEnabled:Z

    if-eqz v6, :cond_9

    .line 218
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_PEAKINGMF:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 221
    .end local v1    # "focusPeakRender":Lcom/android/camera/effect/renders/Render;
    :cond_9
    if-eqz v3, :cond_a

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/effect/EffectController;->isBeautyFrameReady()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 222
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v3}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 224
    :cond_a
    if-eqz v0, :cond_b

    .line 225
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v0}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 227
    :cond_b
    if-eqz v2, :cond_d

    .line 228
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v2}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 171
    .end local v4    # "stickerRender":Lcom/android/camera/effect/renders/Render;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    .line 213
    .restart local v1    # "focusPeakRender":Lcom/android/camera/effect/renders/Render;
    .restart local v4    # "stickerRender":Lcom/android/camera/effect/renders/Render;
    .restart local v5    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_c
    const v6, 0x7f0f012c

    .line 212
    :try_start_2
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 213
    iget-object v8, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mTiltShiftMode:Ljava/lang/String;

    .line 212
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 214
    sget v6, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    invoke-direct {p0, v6}, Lcom/android/camera/effect/renders/EffectRenderGroup;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v5

    .local v5, "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    goto :goto_1

    .line 229
    .end local v1    # "focusPeakRender":Lcom/android/camera/effect/renders/Render;
    .end local v5    # "tiltShitRender":Lcom/android/camera/effect/renders/Render;
    :cond_d
    if-eqz v5, :cond_e

    .line 230
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v5}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_0

    .line 231
    :cond_e
    if-eqz v1, :cond_3

    .line 232
    iget-object v6, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewSecondRender:Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v6, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method


# virtual methods
.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 4
    .param p1, "attr"    # Lcom/android/camera/effect/draw_mode/DrawAttribute;

    .prologue
    .line 47
    iget v1, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I

    .line 48
    .local v1, "oldId":I
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/EffectController;->getEffect(Z)I

    move-result v0

    .line 49
    .local v0, "newId":I
    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isBackGroundBlur()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 50
    iget-object v2, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mPreviewPipeRender:Lcom/android/camera/effect/renders/PipeRenderPair;

    invoke-virtual {v2}, Lcom/android/camera/effect/renders/PipeRenderPair;->prepareCopyBlurTexture()V

    .line 52
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 58
    const/4 v2, 0x0

    return v2

    .line 54
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/EffectRenderGroup;->drawPreview(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    move-result v2

    return v2

    .line 52
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
    .end packed-switch
.end method

.method public varargs onEffectChanged([I)V
    .locals 8
    .param p1, "changeTypes"    # [I

    .prologue
    .line 69
    iget-object v5, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderChanged:Ljava/lang/Boolean;

    monitor-enter v5

    .line 70
    :try_start_0
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    .line 71
    .local v2, "effectController":Lcom/android/camera/effect/EffectController;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    .line 73
    .local v1, "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    const/4 v4, 0x0

    array-length v6, p1

    :goto_0
    if-ge v4, v6, :cond_1

    aget v0, p1, v4

    .line 74
    .local v0, "changeType":I
    packed-switch v0, :pswitch_data_0

    .line 73
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 76
    :pswitch_0
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Lcom/android/camera/effect/EffectController;->getEffect(Z)I

    move-result v7

    iput v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mEffectId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 69
    .end local v0    # "changeType":I
    .end local v1    # "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    .end local v2    # "effectController":Lcom/android/camera/effect/EffectController;
    :catchall_0
    move-exception v4

    monitor-exit v5

    throw v4

    .line 80
    .restart local v0    # "changeType":I
    .restart local v1    # "dataItemRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    .restart local v2    # "effectController":Lcom/android/camera/effect/EffectController;
    :pswitch_1
    :try_start_1
    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isStickerEnable()Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsStickerEnabled:Z

    goto :goto_1

    .line 84
    :pswitch_2
    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isMakeupEnable()Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsMakeupEnabled:Z

    goto :goto_1

    .line 88
    :pswitch_3
    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isNeedDrawPeaking()Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsFocusPeakEnabled:Z

    goto :goto_1

    .line 92
    :pswitch_4
    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isDrawTilt()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 94
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v3

    .line 95
    .local v3, "tiltValue":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    const/16 v7, 0xa0

    invoke-virtual {v3, v7}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mTiltShiftMode:Ljava/lang/String;

    goto :goto_1

    .line 97
    .end local v3    # "tiltValue":Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
    :cond_0
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mTiltShiftMode:Ljava/lang/String;

    goto :goto_1

    .line 102
    :pswitch_5
    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isDrawGradienter()Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mIsGradienterEnabled:Z

    goto :goto_1

    .line 110
    .end local v0    # "changeType":I
    :cond_1
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, p0, Lcom/android/camera/effect/renders/EffectRenderGroup;->mRenderChanged:Ljava/lang/Boolean;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v5

    .line 112
    return-void

    .line 74
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
