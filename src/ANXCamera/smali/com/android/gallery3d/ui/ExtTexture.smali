.class public Lcom/android/gallery3d/ui/ExtTexture;
.super Lcom/android/gallery3d/ui/BasicTexture;
.source "ExtTexture.java"


# static fields
.field private static sTextureId:[I


# instance fields
.field private mTarget:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lcom/android/gallery3d/ui/ExtTexture;->sTextureId:[I

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 30
    invoke-direct {p0}, Lcom/android/gallery3d/ui/BasicTexture;-><init>()V

    .line 31
    sget-object v0, Lcom/android/gallery3d/ui/ExtTexture;->sTextureId:[I

    const/4 v1, 0x1

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 32
    sget-object v0, Lcom/android/gallery3d/ui/ExtTexture;->sTextureId:[I

    aget v0, v0, v2

    iput v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mId:I

    .line 33
    const-string/jumbo v0, "ExtTexture"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "texId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/gallery3d/ui/ExtTexture;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    const v0, 0x8d65

    iput v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    .line 35
    return-void
.end method

.method private uploadToCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 4
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    const v3, 0x812f

    const v2, 0x46180400    # 9729.0f

    .line 38
    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    iget v1, p0, Lcom/android/gallery3d/ui/ExtTexture;->mId:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 39
    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    .line 40
    const/16 v1, 0x2802

    .line 39
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 41
    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    .line 42
    const/16 v1, 0x2803

    .line 41
    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 43
    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    .line 44
    const/16 v1, 0x2801

    .line 43
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 45
    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    .line 46
    const/16 v1, 0x2800

    .line 45
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 48
    invoke-virtual {p0, p1}, Lcom/android/gallery3d/ui/ExtTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 49
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mState:I

    .line 50
    return-void
.end method


# virtual methods
.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 0
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    .line 64
    return-void
.end method

.method public getTarget()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    return v0
.end method

.method public isOpaque()Z
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x1

    return v0
.end method

.method public onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/android/gallery3d/ui/ExtTexture;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-direct {p0, p1}, Lcom/android/gallery3d/ui/ExtTexture;->uploadToCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 72
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
