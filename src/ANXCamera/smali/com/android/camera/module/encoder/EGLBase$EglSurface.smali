.class public Lcom/android/camera/module/encoder/EGLBase$EglSurface;
.super Ljava/lang/Object;
.source "EGLBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/encoder/EGLBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EglSurface"
.end annotation


# instance fields
.field private final mEgl:Lcom/android/camera/module/encoder/EGLBase;

.field private mEglSurface:Landroid/opengl/EGLSurface;

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method constructor <init>(Lcom/android/camera/module/encoder/EGLBase;Ljava/lang/Object;)V
    .locals 5
    .param p1, "egl"    # Lcom/android/camera/module/encoder/EGLBase;
    .param p2, "surface"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    .line 51
    invoke-static {}, Lcom/android/camera/module/encoder/EGLBase;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "EglSurface"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    instance-of v0, p2, Landroid/view/SurfaceView;

    if-nez v0, :cond_0

    .line 53
    instance-of v0, p2, Landroid/view/Surface;

    xor-int/lit8 v0, v0, 0x1

    .line 52
    if-eqz v0, :cond_0

    .line 54
    instance-of v0, p2, Landroid/view/SurfaceHolder;

    xor-int/lit8 v0, v0, 0x1

    .line 52
    if-eqz v0, :cond_0

    .line 55
    instance-of v0, p2, Landroid/graphics/SurfaceTexture;

    xor-int/lit8 v0, v0, 0x1

    .line 52
    if-eqz v0, :cond_0

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "unsupported surface"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    iput-object p1, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    .line 59
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    invoke-static {v0, p2}, Lcom/android/camera/module/encoder/EGLBase;->-wrap1(Lcom/android/camera/module/encoder/EGLBase;Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    .line 60
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    const/16 v2, 0x3057

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/encoder/EGLBase;->querySurface(Landroid/opengl/EGLSurface;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mWidth:I

    .line 61
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    const/16 v2, 0x3056

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/encoder/EGLBase;->querySurface(Landroid/opengl/EGLSurface;I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mHeight:I

    .line 62
    invoke-static {}, Lcom/android/camera/module/encoder/EGLBase;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "EglSurface: size(%d, %d)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mHeight:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    return-void
.end method


# virtual methods
.method public makeCurrent()V
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Lcom/android/camera/module/encoder/EGLBase;->-wrap2(Lcom/android/camera/module/encoder/EGLBase;Landroid/opengl/EGLSurface;)Z

    .line 75
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 86
    invoke-static {}, Lcom/android/camera/module/encoder/EGLBase;->-get0()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "EglSurface:release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    invoke-static {v0}, Lcom/android/camera/module/encoder/EGLBase;->-wrap5(Lcom/android/camera/module/encoder/EGLBase;)V

    .line 88
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Lcom/android/camera/module/encoder/EGLBase;->-wrap4(Lcom/android/camera/module/encoder/EGLBase;Landroid/opengl/EGLSurface;)V

    .line 89
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    .line 90
    return-void
.end method

.method public swap()V
    .locals 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->mEglSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Lcom/android/camera/module/encoder/EGLBase;->-wrap3(Lcom/android/camera/module/encoder/EGLBase;Landroid/opengl/EGLSurface;)I

    .line 79
    return-void
.end method
