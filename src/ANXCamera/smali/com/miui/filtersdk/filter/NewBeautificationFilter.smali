.class public Lcom/miui/filtersdk/filter/NewBeautificationFilter;
.super Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;
.source "NewBeautificationFilter.java"


# instance fields
.field private mWindowHeight:I

.field private mWindowWidth:I

.field private mbGetValidTexureID:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mbGetValidTexureID:Z

    return-void
.end method

.method private initBeauty()V
    .locals 3

    .prologue
    .line 69
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    iget v1, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mWindowWidth:I

    iget v2, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/filtersdk/beauty/BeautyProcessor;->init(II)V

    .line 70
    return-void
.end method


# virtual methods
.method public init()V
    .locals 0

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->onInit()V

    .line 44
    invoke-direct {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->initBeauty()V

    .line 45
    return-void
.end method

.method public initBeautyProcessor(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    if-eqz v0, :cond_0

    .line 63
    iput p1, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mWindowWidth:I

    .line 64
    iput p2, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mWindowHeight:I

    .line 65
    return-void

    .line 60
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 227
    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;->onDestroy()V

    .line 228
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mTextureId:I

    .line 229
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mbGetValidTexureID:Z

    .line 230
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    invoke-virtual {v0}, Lcom/miui/filtersdk/beauty/BeautyProcessor;->release()V

    .line 231
    return-void
.end method

.method public onDisplaySizeChanged(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 203
    invoke-super {p0, p1, p2}, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;->onDisplaySizeChanged(II)V

    .line 204
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    invoke-virtual {v0, p1, p2}, Lcom/miui/filtersdk/beauty/BeautyProcessor;->onDisplaySizeChanged(II)V

    .line 205
    return-void
.end method

.method public onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 8
    .param p1, "textureId"    # I
    .param p2, "cubeBuffer"    # Ljava/nio/FloatBuffer;
    .param p3, "textureBuffer"    # Ljava/nio/FloatBuffer;

    .prologue
    const/16 v2, 0x1406

    const/16 v7, 0xde1

    const/4 v1, 0x2

    const/4 v6, -0x1

    const/4 v3, 0x0

    .line 74
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->runPendingOnDrawTasks()V

    .line 75
    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mIsInitialized:Z

    if-eqz v0, :cond_1

    .line 79
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLProgId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 80
    invoke-virtual {p2, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 81
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    move v4, v3

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 82
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 83
    invoke-virtual {p3, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    move v4, v3

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 86
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 88
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mTextureId:I

    if-ne v0, v6, :cond_2

    .line 93
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->onDrawArraysPre()V

    .line 94
    const/4 v0, 0x5

    const/4 v1, 0x4

    invoke-static {v0, v3, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 95
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 96
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 97
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->onDrawArraysAfter()V

    .line 98
    invoke-static {v7, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 99
    const/4 v0, 0x1

    return v0

    .line 76
    :cond_1
    return v6

    .line 88
    :cond_2
    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mbGetValidTexureID:Z

    if-eqz v0, :cond_0

    .line 89
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 90
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mTextureId:I

    invoke-static {v7, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 91
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLUniformTexture:I

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_0
.end method

.method public onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 8
    .param p1, "textureId"    # I
    .param p2, "cubeBuffer"    # Ljava/nio/FloatBuffer;
    .param p3, "textureBuffer"    # Ljava/nio/FloatBuffer;

    .prologue
    const/16 v2, 0x1406

    const/16 v7, 0xde1

    const/4 v1, 0x2

    const/4 v6, -0x1

    const/4 v3, 0x0

    .line 117
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mFrameBuffers:[I

    if-eqz v0, :cond_1

    .line 121
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->runPendingOnDrawTasks()V

    .line 123
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 127
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mTextureId:I

    if-ne v0, v6, :cond_3

    .line 128
    :cond_0
    return v6

    .line 118
    :cond_1
    return v6

    .line 124
    :cond_2
    return v6

    .line 127
    :cond_3
    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mbGetValidTexureID:Z

    if-eqz v0, :cond_0

    .line 131
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mFrameWidth:I

    iget v4, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mFrameHeight:I

    invoke-static {v3, v3, v0, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 132
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mFrameBuffers:[I

    aget v0, v0, v3

    const v4, 0x8d40

    invoke-static {v4, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 133
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLProgId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 143
    invoke-virtual {p2, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 144
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    move v4, v3

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 145
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 146
    invoke-virtual {p3, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 147
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    move v4, v3

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 148
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 150
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mTextureId:I

    if-ne v0, v6, :cond_5

    .line 156
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->onDrawArraysPre()V

    .line 157
    const/4 v0, 0x5

    const/4 v1, 0x4

    invoke-static {v0, v3, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 163
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 164
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 165
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->onDrawArraysAfter()V

    .line 166
    invoke-static {v7, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 167
    const v0, 0x8d40

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 169
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mOutputWidth:I

    iget v1, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mOutputHeight:I

    invoke-static {v3, v3, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 171
    iget-object v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mFrameBufferTextures:[I

    aget v0, v0, v3

    return v0

    .line 150
    :cond_5
    iget-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mbGetValidTexureID:Z

    if-eqz v0, :cond_4

    .line 151
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 152
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mTextureId:I

    invoke-static {v7, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 153
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLUniformTexture:I

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_0
.end method

.method protected onInit()V
    .locals 2

    .prologue
    .line 49
    const-string/jumbo v0, "attribute vec4 a_position;                         \nattribute vec2 a_texCoord;                         \nvarying vec2 v_texCoord;                           \nvoid main(){                                       \n   gl_Position = a_position;                       \n   v_texCoord = a_texCoord;                        \n}                                                  \n"

    const-string/jumbo v1, "precision highp float;                             \nvarying vec2 v_texCoord;                           \nuniform sampler2D texture;                         \nvoid main (void){                                  \n   vec3 rgb = texture2D(texture, v_texCoord).rgb;  \n   gl_FragColor = vec4(rgb, 1.0);                  \n}                                                  \n"

    invoke-static {v0, v1}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadProgram(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLProgId:I

    .line 50
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLProgId:I

    const-string/jumbo v1, "a_position"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribPosition:I

    .line 51
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLProgId:I

    const-string/jumbo v1, "a_texCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLAttribTextureCoordinate:I

    .line 52
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLProgId:I

    const-string/jumbo v1, "texture"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mGLUniformTexture:I

    .line 53
    iget v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mWindowWidth:I

    iget v1, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mWindowHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->initFrameBuffers(II)V

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->mIsInitialized:Z

    .line 55
    return-void
.end method
