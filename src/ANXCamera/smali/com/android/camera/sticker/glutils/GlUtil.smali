.class public Lcom/android/camera/sticker/glutils/GlUtil;
.super Ljava/lang/Object;
.source "GlUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static checkGlError(Ljava/lang/String;)V
    .locals 4
    .param p0, "op"    # Ljava/lang/String;

    .prologue
    .line 140
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    .line 141
    .local v0, "error":I
    if-eqz v0, :cond_0

    .line 142
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": glError 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, "msg":Ljava/lang/String;
    const-string/jumbo v2, "GlDemoUtil"

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 146
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static initEffectTexture(II[II)I
    .locals 9
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "textureId"    # [I
    .param p3, "type"    # I

    .prologue
    const/16 v2, 0x1908

    const v4, 0x47012f00    # 33071.0f

    const v3, 0x46180400    # 9729.0f

    const/4 v1, 0x0

    .line 121
    const/4 v0, 0x1

    invoke-static {v0, p2, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 122
    aget v0, p2, v1

    invoke-static {p3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 124
    const/16 v0, 0x2800

    .line 123
    invoke-static {p3, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 126
    const/16 v0, 0x2801

    .line 125
    invoke-static {p3, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 128
    const/16 v0, 0x2802

    .line 127
    invoke-static {p3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 130
    const/16 v0, 0x2803

    .line 129
    invoke-static {p3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 132
    const/16 v7, 0x1401

    const/4 v8, 0x0

    move v0, p3

    move v3, p0

    move v4, p1

    move v5, v1

    move v6, v2

    .line 131
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 133
    aget v0, p2, v1

    return v0
.end method
