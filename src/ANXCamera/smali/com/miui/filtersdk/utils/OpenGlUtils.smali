.class public Lcom/miui/filtersdk/utils/OpenGlUtils;
.super Ljava/lang/Object;
.source "OpenGlUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getImageFromAssetsFile(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 196
    const/4 v3, 0x0

    .line 197
    .local v3, "image":Landroid/graphics/Bitmap;
    const/4 v4, 0x0

    .line 198
    .local v4, "is":Ljava/io/InputStream;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 200
    .local v1, "am":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 201
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 202
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    if-nez v4, :cond_1

    .line 215
    .end local v3    # "image":Landroid/graphics/Bitmap;
    .end local v4    # "is":Ljava/io/InputStream;
    :cond_0
    :goto_0
    return-object v3

    .line 208
    .restart local v3    # "image":Landroid/graphics/Bitmap;
    .restart local v4    # "is":Ljava/io/InputStream;
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 209
    :catch_0
    move-exception v2

    .line 210
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 203
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "image":Landroid/graphics/Bitmap;
    .end local v4    # "is":Ljava/io/InputStream;
    :catch_1
    move-exception v2

    .line 204
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 206
    if-eqz v4, :cond_0

    .line 208
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 209
    :catch_2
    move-exception v2

    .line 210
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 206
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v0

    .local v0, "-l_6_R":Ljava/lang/Object;
    if-nez v4, :cond_2

    .line 213
    :goto_1
    throw v0

    .line 208
    :cond_2
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    .line 209
    :catch_3
    move-exception v2

    .line 210
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public static loadProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .param p0, "strVSource"    # Ljava/lang/String;
    .param p1, "strFSource"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 222
    const/4 v4, 0x1

    new-array v3, v4, [I

    .line 223
    .local v3, "link":[I
    const v4, 0x8b31

    invoke-static {p0, v4}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadShader(Ljava/lang/String;I)I

    move-result v2

    .line 224
    .local v2, "iVShader":I
    if-eqz v2, :cond_0

    .line 228
    const v4, 0x8b30

    invoke-static {p1, v4}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadShader(Ljava/lang/String;I)I

    move-result v0

    .line 229
    .local v0, "iFShader":I
    if-eqz v0, :cond_1

    .line 234
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v1

    .line 235
    .local v1, "iProgId":I
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 236
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 237
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 238
    const v4, 0x8b82

    invoke-static {v1, v4, v3, v6}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 239
    aget v4, v3, v6

    if-lez v4, :cond_2

    .line 243
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 244
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 245
    return v1

    .line 225
    .end local v0    # "iFShader":I
    .end local v1    # "iProgId":I
    :cond_0
    const-string/jumbo v4, "Load Program"

    const-string/jumbo v5, "Vertex Shader Failed"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    return v6

    .line 230
    .restart local v0    # "iFShader":I
    :cond_1
    const-string/jumbo v4, "Load Program"

    const-string/jumbo v5, "Fragment Shader Failed"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    return v6

    .line 240
    .restart local v1    # "iProgId":I
    :cond_2
    const-string/jumbo v4, "Load Program"

    const-string/jumbo v5, "Linking Failed"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    return v6
.end method

.method private static loadShader(Ljava/lang/String;I)I
    .locals 5
    .param p0, "strSource"    # Ljava/lang/String;
    .param p1, "iType"    # I

    .prologue
    const/4 v4, 0x0

    .line 249
    const/4 v2, 0x1

    new-array v0, v2, [I

    .line 250
    .local v0, "compiled":[I
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v1

    .line 251
    .local v1, "iShader":I
    invoke-static {v1, p0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 252
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 253
    const v2, 0x8b81

    invoke-static {v1, v2, v0, v4}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 254
    aget v2, v0, v4

    if-eqz v2, :cond_0

    .line 258
    return v1

    .line 255
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Compilation\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "Load Shader Failed"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    return v4
.end method

.method public static loadTexture(Landroid/content/Context;Ljava/lang/String;)I
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const v7, 0x812f

    const/16 v6, 0x2601

    const/4 v5, 0x1

    const/16 v4, 0xde1

    const/4 v3, 0x0

    .line 108
    new-array v1, v5, [I

    .line 110
    .local v1, "textureHandle":[I
    invoke-static {v5, v1, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 112
    aget v2, v1, v3

    if-nez v2, :cond_0

    .line 132
    :goto_0
    aget v2, v1, v3

    if-eqz v2, :cond_1

    .line 137
    aget v2, v1, v3

    return v2

    .line 115
    :cond_0
    invoke-static {p0, p1}, Lcom/miui/filtersdk/utils/OpenGlUtils;->getImageFromAssetsFile(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 118
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    aget v2, v1, v3

    invoke-static {v4, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 121
    const/16 v2, 0x2800

    invoke-static {v4, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 122
    const/16 v2, 0x2801

    invoke-static {v4, v2, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 123
    const/16 v2, 0x2802

    invoke-static {v4, v2, v7}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 124
    const/16 v2, 0x2803

    invoke-static {v4, v2, v7}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 126
    invoke-static {v4, v3, v0, v3}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 129
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    .line 133
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1
    new-array v2, v5, [Ljava/lang/Object;

    aput-object p1, v2, v3

    const-string/jumbo v3, "loadTexture failed,path:%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "OpenGlUtils"

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    const/4 v2, -0x1

    return v2
.end method
