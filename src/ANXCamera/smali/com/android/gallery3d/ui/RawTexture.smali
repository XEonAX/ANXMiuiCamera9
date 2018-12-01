.class public Lcom/android/gallery3d/ui/RawTexture;
.super Lcom/android/gallery3d/ui/BasicTexture;
.source "RawTexture.java"


# static fields
.field private static final sTextureId:[I


# instance fields
.field private final mOpaque:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lcom/android/gallery3d/ui/RawTexture;->sTextureId:[I

    .line 22
    return-void
.end method

.method public constructor <init>(IIZ)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "opaque"    # Z

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/android/gallery3d/ui/BasicTexture;-><init>()V

    .line 28
    iput-boolean p3, p0, Lcom/android/gallery3d/ui/RawTexture;->mOpaque:Z

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/android/gallery3d/ui/RawTexture;->setSize(II)V

    .line 30
    return-void
.end method


# virtual methods
.method public getTarget()I
    .locals 1

    .prologue
    .line 75
    const/16 v0, 0xde1

    return v0
.end method

.method public isOpaque()Z
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/android/gallery3d/ui/RawTexture;->mOpaque:Z

    return v0
.end method

.method public onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z
    .locals 2
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/RawTexture;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const/4 v0, 0x1

    return v0

    .line 64
    :cond_0
    const-string/jumbo v0, "RawTexture"

    const-string/jumbo v1, "lost the content due to context change"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method public prepare(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 10
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    const/16 v2, 0x1908

    const/4 v9, 0x1

    const v5, 0x46180400    # 9729.0f

    const/16 v0, 0xde1

    const/4 v1, 0x0

    .line 39
    sget-object v3, Lcom/android/gallery3d/ui/RawTexture;->sTextureId:[I

    invoke-static {v9, v3, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 40
    sget-object v3, Lcom/android/gallery3d/ui/RawTexture;->sTextureId:[I

    aget v3, v3, v1

    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 42
    const/16 v3, 0x2802

    const v4, 0x812f

    .line 41
    invoke-static {v0, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 44
    const/16 v3, 0x2803

    const v4, 0x812f

    .line 43
    invoke-static {v0, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 46
    const/16 v3, 0x2801

    .line 45
    invoke-static {v0, v3, v5}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 48
    const/16 v3, 0x2800

    .line 47
    invoke-static {v0, v3, v5}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 50
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/RawTexture;->getTextureWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/RawTexture;->getTextureHeight()I

    move-result v4

    .line 51
    const/16 v7, 0x1401

    const/4 v8, 0x0

    move v5, v1

    move v6, v2

    .line 49
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 52
    const-string/jumbo v0, "RawTexture"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "prepare textureSize="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/RawTexture;->getTextureWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/RawTexture;->getTextureHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 53
    const-string/jumbo v3, " id="

    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 53
    sget-object v3, Lcom/android/gallery3d/ui/RawTexture;->sTextureId:[I

    aget v3, v3, v1

    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    sget-object v0, Lcom/android/gallery3d/ui/RawTexture;->sTextureId:[I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/gallery3d/ui/RawTexture;->mId:I

    .line 55
    iput v9, p0, Lcom/android/gallery3d/ui/RawTexture;->mState:I

    .line 56
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/ui/RawTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 57
    return-void
.end method
