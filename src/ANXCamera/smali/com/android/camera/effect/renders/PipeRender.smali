.class public Lcom/android/camera/effect/renders/PipeRender;
.super Lcom/android/camera/effect/renders/RenderGroup;
.source "PipeRender.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBufferHeight:I

.field private mBufferWidth:I

.field private mFrameBufferTextures:[I

.field private mFrameBuffers:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 24
    return-void
.end method

.method private declared-synchronized destroyFrameBuffers()V
    .locals 3

    .prologue
    monitor-enter p0

    .line 148
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v0, :cond_1

    .line 153
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    .line 156
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized initFrameBuffers(III)V
    .locals 10
    .param p1, "count"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    monitor-enter p0

    .line 159
    if-gtz p1, :cond_0

    monitor-exit p0

    .line 160
    return-void

    .line 163
    :cond_0
    :try_start_0
    sget-object v0, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "initFrameBuffers: count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    .line 165
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    .line 166
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    if-ge v9, p1, :cond_1

    .line 167
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    const/4 v1, 0x1

    invoke-static {v1, v0, v9}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 168
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    const/4 v1, 0x1

    invoke-static {v1, v0, v9}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 169
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v0, v0, v9

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 170
    const/16 v0, 0xde1

    const/4 v1, 0x0

    const/16 v2, 0x1908

    const/4 v5, 0x0

    .line 171
    const/16 v6, 0x1908

    const/16 v7, 0x1401

    const/4 v8, 0x0

    move v3, p2

    move v4, p3

    .line 170
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 173
    const v0, 0x46180400    # 9729.0f

    .line 172
    const/16 v1, 0xde1

    .line 173
    const/16 v2, 0x2800

    .line 172
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 175
    const v0, 0x46180400    # 9729.0f

    .line 174
    const/16 v1, 0xde1

    .line 175
    const/16 v2, 0x2801

    .line 174
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 177
    const v0, 0x47012f00    # 33071.0f

    .line 176
    const/16 v1, 0xde1

    .line 177
    const/16 v2, 0x2802

    .line 176
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 179
    const v0, 0x47012f00    # 33071.0f

    .line 178
    const/16 v1, 0xde1

    .line 179
    const/16 v2, 0x2803

    .line 178
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 181
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v0, v0, v9

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 183
    iget-object v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v0, v0, v9

    .line 182
    const v1, 0x8d40

    const v2, 0x8ce0

    .line 183
    const/16 v3, 0xde1

    const/4 v4, 0x0

    .line 182
    invoke-static {v1, v2, v3, v0, v4}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 184
    sget-object v0, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v2, "fbo[%d]: %d %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    .line 185
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v4, v4, v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v4, v4, v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    .line 184
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const/16 v0, 0xde1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 188
    const v0, 0x8d40

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    :cond_1
    monitor-exit p0

    .line 190
    return-void

    .end local v9    # "i":I
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public addRender(Lcom/android/camera/effect/renders/Render;)V
    .locals 3
    .param p1, "render"    # Lcom/android/camera/effect/renders/Render;

    .prologue
    .line 126
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 127
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 128
    .local v0, "count":I
    iget-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    array-length v1, v1

    if-le v0, v1, :cond_1

    .line 129
    :cond_0
    iget v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    if-lez v1, :cond_1

    iget v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    if-lez v1, :cond_1

    .line 130
    iget v1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    iget v2, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    invoke-virtual {p0, v1, v2}, Lcom/android/camera/effect/renders/PipeRender;->reInitFrameBuffers(II)V

    .line 132
    :cond_1
    return-void
.end method

.method public deleteBuffer()V
    .locals 0

    .prologue
    .line 137
    invoke-super {p0}, Lcom/android/camera/effect/renders/RenderGroup;->deleteBuffer()V

    .line 138
    invoke-direct {p0}, Lcom/android/camera/effect/renders/PipeRender;->destroyFrameBuffers()V

    .line 139
    return-void
.end method

.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 28
    .param p1, "attr"    # Lcom/android/camera/effect/draw_mode/DrawAttribute;

    .prologue
    .line 32
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    if-nez v4, :cond_1

    .line 33
    :cond_0
    sget-object v4, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "framebuffer hasn\'t been initialized"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    const/4 v4, 0x0

    return v4

    .line 37
    :cond_1
    const/16 v26, 0x0

    .line 38
    .local v26, "x":I
    const/16 v27, 0x0

    .line 39
    .local v27, "y":I
    const/16 v25, 0x0

    .line 40
    .local v25, "width":I
    const/16 v17, 0x0

    .line 41
    .local v17, "height":I
    const/4 v3, 0x0

    .line 42
    .local v3, "textureId":I
    const/4 v8, 0x0

    .line 43
    .local v8, "isSnapshot":Z
    invoke-virtual/range {p1 .. p1}, Lcom/android/camera/effect/draw_mode/DrawAttribute;->getTarget()I

    move-result v23

    .line 44
    .local v23, "target":I
    packed-switch v23, :pswitch_data_0

    .line 64
    sget-object v4, Lcom/android/camera/effect/renders/PipeRender;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "unsupported target "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .end local v8    # "isSnapshot":Z
    :goto_0
    if-eqz v25, :cond_2

    if-nez v17, :cond_3

    .line 69
    :cond_2
    const/4 v4, 0x0

    return v4

    .restart local v8    # "isSnapshot":Z
    :pswitch_0
    move-object/from16 v16, p1

    .line 46
    check-cast v16, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    .line 47
    .local v16, "basic":Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mX:I

    move/from16 v26, v0

    .line 48
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mY:I

    move/from16 v27, v0

    .line 49
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mWidth:I

    move/from16 v25, v0

    .line 50
    move-object/from16 v0, v16

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mHeight:I

    move/from16 v17, v0

    .line 51
    move-object/from16 v0, v16

    iget-object v4, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v3

    .line 52
    move-object/from16 v0, v16

    iget-boolean v8, v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;->mIsSnapshot:Z

    .local v8, "isSnapshot":Z
    goto :goto_0

    .end local v16    # "basic":Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
    .local v8, "isSnapshot":Z
    :pswitch_1
    move-object/from16 v24, p1

    .line 55
    check-cast v24, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    .line 56
    .local v24, "texture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mX:I

    move/from16 v26, v0

    .line 57
    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mY:I

    move/from16 v27, v0

    .line 58
    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mWidth:I

    move/from16 v25, v0

    .line 59
    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mHeight:I

    move/from16 v17, v0

    .line 60
    move-object/from16 v0, v24

    iget v3, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mTexId:I

    .line 61
    move-object/from16 v0, v24

    iget-boolean v8, v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mIsSnapshot:Z

    .local v8, "isSnapshot":Z
    goto :goto_0

    .line 72
    .end local v8    # "isSnapshot":Z
    .end local v24    # "texture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    :cond_3
    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    .line 73
    .local v6, "bufWidth":I
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    .line 74
    .local v7, "bufHeight":I
    const/4 v2, 0x0

    .line 75
    .local v2, "inputTexture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenders()Ljava/util/ArrayList;

    move-result-object v21

    .line 76
    .local v21, "renders":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/effect/renders/Render;>;"
    if-eqz v21, :cond_a

    .line 77
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v22

    .line 78
    .local v22, "size":I
    const/16 v18, 0x0

    .end local v2    # "inputTexture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    .local v18, "i":I
    :goto_1
    move/from16 v0, v18

    move/from16 v1, v22

    if-ge v0, v1, :cond_a

    .line 79
    move-object/from16 v0, v21

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/android/camera/effect/renders/Render;

    .line 81
    .local v20, "render":Lcom/android/camera/effect/renders/Render;
    add-int/lit8 v4, v22, -0x1

    move/from16 v0, v18

    if-ge v0, v4, :cond_6

    const/16 v19, 0x1

    .line 82
    .local v19, "isNotLast":Z
    :goto_2
    if-eqz v19, :cond_4

    .line 83
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    aget v4, v4, v18

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v6, v7}, Lcom/android/camera/effect/renders/PipeRender;->beginBindFrameBuffer(III)V

    .line 86
    :cond_4
    if-nez v18, :cond_8

    .line 87
    if-eqz v19, :cond_7

    .line 88
    new-instance v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    .line 89
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 88
    invoke-direct/range {v2 .. v8}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    .line 90
    .local v2, "inputTexture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 105
    .end local v2    # "inputTexture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    :goto_3
    if-eqz v19, :cond_5

    .line 106
    new-instance v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    .line 107
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBufferTextures:[I

    aget v10, v4, v18

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v9, v2

    move v13, v6

    move v14, v7

    move v15, v8

    .line 106
    invoke-direct/range {v9 .. v15}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    .line 108
    .restart local v2    # "inputTexture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/effect/renders/PipeRender;->endBindFrameBuffer()V

    .line 78
    .end local v2    # "inputTexture":Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
    :cond_5
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 81
    .end local v19    # "isNotLast":Z
    :cond_6
    const/16 v19, 0x0

    .restart local v19    # "isNotLast":Z
    goto :goto_2

    .line 92
    :cond_7
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    goto :goto_3

    .line 95
    :cond_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/PipeRender;->mFrameBuffers:[I

    add-int/lit8 v5, v18, -0x1

    aget v4, v4, v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v6, v7}, Lcom/android/camera/effect/renders/Render;->setPreviousFrameBufferInfo(III)V

    .line 96
    if-nez v19, :cond_9

    .line 97
    move/from16 v0, v26

    iput v0, v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mX:I

    .line 98
    move/from16 v0, v27

    iput v0, v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mY:I

    .line 99
    move/from16 v0, v25

    iput v0, v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mWidth:I

    .line 100
    move/from16 v0, v17

    iput v0, v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mHeight:I

    .line 102
    :cond_9
    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    goto :goto_3

    .line 113
    .end local v18    # "i":I
    .end local v19    # "isNotLast":Z
    .end local v20    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v22    # "size":I
    :cond_a
    const/4 v4, 0x1

    return v4

    .line 44
    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public reInitFrameBuffers(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 142
    invoke-direct {p0}, Lcom/android/camera/effect/renders/PipeRender;->destroyFrameBuffers()V

    .line 143
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 144
    .local v0, "count":I
    invoke-direct {p0, v0, p1, p2}, Lcom/android/camera/effect/renders/PipeRender;->initFrameBuffers(III)V

    .line 145
    return-void
.end method

.method public setFrameBufferSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 117
    iget v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    if-eq v0, p2, :cond_1

    .line 118
    :cond_0
    iput p1, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferWidth:I

    .line 119
    iput p2, p0, Lcom/android/camera/effect/renders/PipeRender;->mBufferHeight:I

    .line 120
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/effect/renders/PipeRender;->reInitFrameBuffers(II)V

    .line 122
    :cond_1
    return-void
.end method
