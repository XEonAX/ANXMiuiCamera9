.class public Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;
.super Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
.source "ColorLookupFilter4x4.java"


# instance fields
.field private mGLStrengthLocation:I

.field public mLookupSourceTexture:I

.field public mLookupTextureUniform:I

.field private mStrength:F

.field protected mTable:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "table"    # Ljava/lang/String;

    .prologue
    .line 58
    const-string/jumbo v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    const-string/jumbo v1, " precision mediump float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture;\n uniform sampler2D inputImageTexture2; // lookup texture\n uniform lowp float strength;\n \n void main()\n {\n     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);\n     \n     mediump float blueColor = textureColor.b * 15.0;\n     \n     mediump vec2 quad1;\n     quad1.y = floor(floor(blueColor) / 4.0);\n     quad1.x = floor(blueColor) - (quad1.y * 4.0);\n     \n     mediump vec2 quad2;\n     quad2.y = floor(ceil(blueColor) / 4.0);\n     quad2.x = ceil(blueColor) - (quad2.y * 4.0);\n     \n     highp vec2 texPos1;\n     texPos1.x = (quad1.x * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.r);\n     texPos1.y = (quad1.y * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.g);\n     \n     highp vec2 texPos2;\n     texPos2.x = (quad2.x * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.r);\n     texPos2.y = (quad2.y * 1.0/4.0) + 0.5/64.0 + ((1.0/4.0 - 1.0/64.0) * textureColor.g);\n     \n     lowp vec4 newColor1 = texture2D(inputImageTexture2, texPos1);\n     lowp vec4 newColor2 = texture2D(inputImageTexture2, texPos2);\n     \n     lowp vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n     gl_FragColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), strength);\n }"

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mStrength:F

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    .line 59
    iput-object p1, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mTable:Ljava/lang/String;

    .line 60
    return-void
.end method


# virtual methods
.method public isDegreeAdjustSupported()Z
    .locals 1

    .prologue
    .line 111
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 83
    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDestroy()V

    .line 84
    new-array v0, v3, [I

    iget v1, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    aput v1, v0, v2

    .line 85
    .local v0, "texture":[I
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 86
    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    .line 87
    return-void
.end method

.method protected onDrawArraysAfter()V
    .locals 2

    .prologue
    .line 90
    iget v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 95
    :goto_0
    return-void

    .line 91
    :cond_0
    const v0, 0x84c3

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 92
    const/16 v0, 0xde1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 93
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    goto :goto_0
.end method

.method protected onDrawArraysPre()V
    .locals 2

    .prologue
    .line 98
    iget v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 106
    :goto_0
    iget v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mGLStrengthLocation:I

    iget v1, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mStrength:F

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 107
    return-void

    .line 100
    :cond_0
    const v0, 0x84c3

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 102
    iget v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupSourceTexture:I

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 104
    iget v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupTextureUniform:I

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    goto :goto_0
.end method

.method protected onInit()V
    .locals 2

    .prologue
    .line 68
    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInit()V

    .line 69
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->getProgram()I

    move-result v0

    const-string/jumbo v1, "inputImageTexture2"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mLookupTextureUniform:I

    .line 70
    invoke-virtual {p0}, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->getProgram()I

    move-result v0

    const-string/jumbo v1, "strength"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mGLStrengthLocation:I

    .line 71
    return-void
.end method

.method protected onInitialized()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInitialized()V

    .line 75
    new-instance v0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4$1;

    invoke-direct {v0, p0}, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4$1;-><init>(Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;)V

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->runOnDraw(Ljava/lang/Runnable;)V

    .line 80
    return-void
.end method

.method public setDegree(I)V
    .locals 2
    .param p1, "degree"    # I

    .prologue
    .line 116
    int-to-float v0, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/miui/filtersdk/filter/base/ColorLookupFilter4x4;->mStrength:F

    .line 117
    return-void
.end method
