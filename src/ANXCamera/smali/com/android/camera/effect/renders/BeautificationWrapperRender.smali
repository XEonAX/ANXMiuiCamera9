.class public Lcom/android/camera/effect/renders/BeautificationWrapperRender;
.super Lcom/android/camera/effect/renders/WrapperRender;
.source "BeautificationWrapperRender.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->TAG:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/miui/filtersdk/filter/base/GPUImageFilter;Z)V
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "id"    # I
    .param p3, "filter"    # Lcom/miui/filtersdk/filter/base/GPUImageFilter;
    .param p4, "isFront"    # Z

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/effect/renders/WrapperRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    .line 23
    new-instance v0, Lcom/android/camera/effect/renders/NoneEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/NoneEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    .line 24
    invoke-virtual {p0, p4}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->adjustSize(Z)V

    .line 25
    return-void
.end method

.method private drawToFrameBuffer(IFFFF)V
    .locals 7
    .param p1, "texId"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "w"    # F
    .param p5, "h"    # F

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x0

    .line 70
    iget v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mParentFrameBufferId:I

    if-eqz v0, :cond_0

    .line 71
    iget v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mParentFrameBufferId:I

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 72
    invoke-static {v2, v2, v2, v2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/renders/NoneEffectRender;->drawTexture(IFFFFZ)V

    .line 75
    return-void
.end method


# virtual methods
.method public adjustSize(Z)V
    .locals 5
    .param p1, "isFront"    # Z

    .prologue
    const/4 v4, 0x0

    .line 28
    if-eqz p1, :cond_0

    .line 29
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    const/16 v2, 0x5a

    invoke-static {v2, v4, v4, v0, v1}, Lcom/miui/filtersdk/utils/TextureRotationUtil;->adjustSize(IZZLjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    .line 33
    :goto_0
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    const/16 v2, 0x10e

    const/4 v3, 0x1

    invoke-static {v2, v4, v3, v0, v1}, Lcom/miui/filtersdk/utils/TextureRotationUtil;->adjustSize(IZZLjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V

    goto :goto_0
.end method

.method protected drawTexture(IFFFF)V
    .locals 6
    .param p1, "textureId"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "w"    # F
    .param p5, "h"    # F

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget-object v2, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v3, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1, v2, v3}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result v1

    .line 59
    .local v1, "outTexId":I
    const/4 v0, -0x1

    if-ne v1, v0, :cond_0

    .line 60
    move v1, p1

    .line 63
    :cond_0
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 66
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->drawToFrameBuffer(IFFFF)V

    .line 67
    return-void
.end method

.method protected drawTexture(Lcom/android/gallery3d/ui/BasicTexture;FFFF)V
    .locals 6
    .param p1, "texture"    # Lcom/android/gallery3d/ui/BasicTexture;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "w"    # F
    .param p5, "h"    # F

    .prologue
    .line 44
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget-object v4, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mTexCoorBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v2, v3, v4}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result v1

    .line 45
    .local v1, "outTexId":I
    const/4 v0, -0x1

    if-ne v1, v0, :cond_0

    .line 46
    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v1

    .line 49
    :cond_0
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 52
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->drawToFrameBuffer(IFFFF)V

    .line 53
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 85
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/WrapperRender;->setPreviewSize(II)V

    .line 86
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/NoneEffectRender;->setPreviewSize(II)V

    .line 87
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDisplaySizeChanged(II)V

    .line 88
    return-void
.end method

.method public setViewportSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/WrapperRender;->setViewportSize(II)V

    .line 80
    iget-object v0, p0, Lcom/android/camera/effect/renders/BeautificationWrapperRender;->mSimpleRender:Lcom/android/camera/effect/renders/NoneEffectRender;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/NoneEffectRender;->setViewportSize(II)V

    .line 81
    return-void
.end method
