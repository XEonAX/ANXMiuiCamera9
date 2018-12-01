.class public Lcom/android/camera/module/encoder/EGLBase;
.super Ljava/lang/Object;
.source "EGLBase.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/encoder/EGLBase$EglSurface;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mDefaultContext:Landroid/opengl/EGLContext;

.field private mEglConfig:Landroid/opengl/EGLConfig;

.field private mEglContext:Landroid/opengl/EGLContext;

.field private mEglDisplay:Landroid/opengl/EGLDisplay;


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/camera/module/encoder/EGLBase;Ljava/lang/Object;)Landroid/opengl/EGLSurface;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/encoder/EGLBase;
    .param p1, "nativeWindow"    # Ljava/lang/Object;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/encoder/EGLBase;->createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap2(Lcom/android/camera/module/encoder/EGLBase;Landroid/opengl/EGLSurface;)Z
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/encoder/EGLBase;
    .param p1, "surface"    # Landroid/opengl/EGLSurface;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/encoder/EGLBase;->makeCurrent(Landroid/opengl/EGLSurface;)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap3(Lcom/android/camera/module/encoder/EGLBase;Landroid/opengl/EGLSurface;)I
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/module/encoder/EGLBase;
    .param p1, "surface"    # Landroid/opengl/EGLSurface;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/encoder/EGLBase;->swap(Landroid/opengl/EGLSurface;)I

    move-result v0

    return v0
.end method

.method static synthetic -wrap4(Lcom/android/camera/module/encoder/EGLBase;Landroid/opengl/EGLSurface;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/encoder/EGLBase;
    .param p1, "surface"    # Landroid/opengl/EGLSurface;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/module/encoder/EGLBase;->destroyWindowSurface(Landroid/opengl/EGLSurface;)V

    return-void
.end method

.method static synthetic -wrap5(Lcom/android/camera/module/encoder/EGLBase;)V
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/module/encoder/EGLBase;

    .prologue
    invoke-direct {p0}, Lcom/android/camera/module/encoder/EGLBase;->makeDefault()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/android/camera/module/encoder/EGLBase;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;ZZ)V
    .locals 2
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;
    .param p2, "withDepthBuffer"    # Z
    .param p3, "isRecordable"    # Z

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglConfig:Landroid/opengl/EGLConfig;

    .line 40
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    .line 41
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 42
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mDefaultContext:Landroid/opengl/EGLContext;

    .line 103
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "EGLBase"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/encoder/EGLBase;->init(Landroid/opengl/EGLContext;ZZ)V

    .line 105
    return-void
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 302
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    .local v0, "error":I
    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 303
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": EGL error: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 305
    :cond_0
    return-void
.end method

.method private createContext(Landroid/opengl/EGLContext;)Landroid/opengl/EGLContext;
    .locals 5
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;

    .prologue
    .line 218
    sget-object v2, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "createContext"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    const/16 v2, 0x3098

    const/4 v3, 0x2

    .line 222
    const/16 v4, 0x3038

    .line 220
    filled-new-array {v2, v3, v4}, [I

    move-result-object v0

    .line 225
    .local v0, "attribList":[I
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglConfig:Landroid/opengl/EGLConfig;

    const/4 v4, 0x0

    invoke-static {v2, v3, p1, v0, v4}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v1

    .line 226
    .local v1, "context":Landroid/opengl/EGLContext;
    const-string/jumbo v2, "eglCreateContext"

    invoke-direct {p0, v2}, Lcom/android/camera/module/encoder/EGLBase;->checkEglError(Ljava/lang/String;)V

    .line 227
    return-object v1
.end method

.method private createWindowSurface(Ljava/lang/Object;)Landroid/opengl/EGLSurface;
    .locals 7
    .param p1, "nativeWindow"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    .line 249
    sget-object v3, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "createWindowSurface: nativeWindow="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    const/4 v3, 0x1

    new-array v2, v3, [I

    .line 252
    const/16 v3, 0x3038

    aput v3, v2, v6

    .line 254
    .local v2, "surfaceAttribs":[I
    const/4 v1, 0x0

    .line 257
    .local v1, "result":Landroid/opengl/EGLSurface;
    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v4, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglConfig:Landroid/opengl/EGLConfig;

    const/4 v5, 0x0

    .line 256
    invoke-static {v3, v4, p1, v2, v5}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 261
    .end local v1    # "result":Landroid/opengl/EGLSurface;
    :goto_0
    return-object v1

    .line 258
    .restart local v1    # "result":Landroid/opengl/EGLSurface;
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v3, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "eglCreateWindowSurface"

    invoke-static {v3, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private destroyContext()V
    .locals 3

    .prologue
    .line 231
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "destroyContext"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 234
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "destroyContext: display="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " context="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "destroyContext: err="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    .line 238
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mDefaultContext:Landroid/opengl/EGLContext;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-eq v0, v1, :cond_2

    .line 239
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase;->mDefaultContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 240
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "destroyDefaultContext: display="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 241
    const-string/jumbo v2, " context="

    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 241
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mDefaultContext:Landroid/opengl/EGLContext;

    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "destroyDefaultContext: err="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    :cond_1
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mDefaultContext:Landroid/opengl/EGLContext;

    .line 246
    :cond_2
    return-void
.end method

.method private destroyWindowSurface(Landroid/opengl/EGLSurface;)V
    .locals 4
    .param p1, "surface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 290
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "destroySurface>>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq p1, v0, :cond_0

    .line 292
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 293
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 292
    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 294
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0, p1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 296
    :cond_0
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 297
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "destroySurface<<<"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    return-void
.end method

.method private getConfig(ZZ)Landroid/opengl/EGLConfig;
    .locals 11
    .param p1, "withDepthBuffer"    # Z
    .param p2, "isRecordable"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 309
    const/16 v0, 0x11

    new-array v1, v0, [I

    .local v1, "attribList":[I
    fill-array-data v1, :array_0

    .line 321
    const/16 v9, 0xa

    .line 326
    .local v9, "offset":I
    if-eqz p1, :cond_3

    .line 321
    const/16 v0, 0xa

    .line 327
    const/16 v9, 0xb

    const/16 v4, 0x3025

    aput v4, v1, v0

    .line 328
    add-int/lit8 v10, v9, 0x1

    .end local v9    # "offset":I
    .local v10, "offset":I
    const/16 v0, 0x10

    aput v0, v1, v9

    .line 330
    :goto_0
    if-eqz p2, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x12

    if-lt v0, v4, :cond_0

    .line 331
    add-int/lit8 v9, v10, 0x1

    .end local v10    # "offset":I
    .restart local v9    # "offset":I
    const/16 v0, 0x3142

    aput v0, v1, v10

    .line 332
    add-int/lit8 v10, v9, 0x1

    .end local v9    # "offset":I
    .restart local v10    # "offset":I
    aput v5, v1, v9

    move v9, v10

    .line 334
    .end local v10    # "offset":I
    .restart local v9    # "offset":I
    :goto_1
    array-length v0, v1

    add-int/lit8 v8, v0, -0x1

    .local v8, "i":I
    :goto_2
    if-lt v8, v9, :cond_1

    .line 335
    const/16 v0, 0x3038

    aput v0, v1, v8

    .line 334
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .end local v8    # "i":I
    .end local v9    # "offset":I
    .restart local v10    # "offset":I
    :cond_0
    move v9, v10

    .line 330
    .end local v10    # "offset":I
    .restart local v9    # "offset":I
    goto :goto_1

    .line 337
    .restart local v8    # "i":I
    :cond_1
    new-array v3, v5, [Landroid/opengl/EGLConfig;

    .line 338
    .local v3, "configs":[Landroid/opengl/EGLConfig;
    new-array v6, v5, [I

    .line 340
    .local v6, "numConfigs":[I
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    array-length v5, v3

    move v4, v2

    move v7, v2

    .line 339
    invoke-static/range {v0 .. v7}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v0

    if-nez v0, :cond_2

    .line 342
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "unable to find RGBA8888 /  EGLConfig"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    const/4 v0, 0x0

    return-object v0

    .line 345
    :cond_2
    aget-object v0, v3, v2

    return-object v0

    .end local v3    # "configs":[Landroid/opengl/EGLConfig;
    .end local v6    # "numConfigs":[I
    .end local v8    # "i":I
    :cond_3
    move v10, v9

    .end local v9    # "offset":I
    .restart local v10    # "offset":I
    goto :goto_0

    .line 309
    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3038
        0x3038
        0x3038
        0x3038
        0x3038
        0x3038
        0x3038
    .end array-data
.end method

.method private init(Landroid/opengl/EGLContext;ZZ)V
    .locals 7
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;
    .param p2, "withDepthBuffer"    # Z
    .param p3, "isRecordable"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 143
    sget-object v2, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "init"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v2, v3, :cond_0

    .line 145
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "EGL already set up"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 148
    :cond_0
    invoke-static {v5}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 149
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v2, v3, :cond_1

    .line 150
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "eglGetDisplay failed"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 153
    :cond_1
    const/4 v2, 0x2

    new-array v1, v2, [I

    .line 154
    .local v1, "version":[I
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v2, v1, v5, v1, v6}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v2

    if-nez v2, :cond_2

    .line 155
    iput-object v4, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 156
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "eglInitialize failed"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 159
    :cond_2
    if-eqz p1, :cond_3

    .line 160
    :goto_0
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v2, v3, :cond_5

    .line 161
    invoke-direct {p0, p2, p3}, Lcom/android/camera/module/encoder/EGLBase;->getConfig(ZZ)Landroid/opengl/EGLConfig;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglConfig:Landroid/opengl/EGLConfig;

    .line 162
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglConfig:Landroid/opengl/EGLConfig;

    if-nez v2, :cond_4

    .line 163
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "chooseConfig failed"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 159
    :cond_3
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    goto :goto_0

    .line 166
    :cond_4
    invoke-direct {p0, p1}, Lcom/android/camera/module/encoder/EGLBase;->createContext(Landroid/opengl/EGLContext;)Landroid/opengl/EGLContext;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    .line 169
    :cond_5
    new-array v0, v6, [I

    .line 170
    .local v0, "values":[I
    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    const/16 v4, 0x3098

    invoke-static {v2, v3, v4, v0, v5}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 171
    sget-object v2, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "EGLContext created, client version "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v0, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-direct {p0}, Lcom/android/camera/module/encoder/EGLBase;->makeDefault()V

    .line 173
    return-void
.end method

.method private makeCurrent(Landroid/opengl/EGLSurface;)Z
    .locals 5
    .param p1, "surface"    # Landroid/opengl/EGLSurface;

    .prologue
    const/4 v4, 0x0

    .line 182
    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    if-nez v1, :cond_0

    .line 183
    sget-object v1, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "makeCurrent: eglDisplay not initialized"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    :cond_0
    if-eqz p1, :cond_1

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-ne p1, v1, :cond_3

    .line 186
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    .line 187
    .local v0, "error":I
    const/16 v1, 0x300b

    if-ne v0, v1, :cond_2

    .line 188
    sget-object v1, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "makeCurrent: returned EGL_BAD_NATIVE_WINDOW."

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    :cond_2
    return v4

    .line 193
    .end local v0    # "error":I
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    invoke-static {v1, p1, p1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 194
    sget-object v1, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "eglMakeCurrent: err="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    return v4

    .line 197
    :cond_4
    const/4 v1, 0x1

    return v1
.end method

.method private makeDefault()V
    .locals 4

    .prologue
    .line 201
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "makeDefault"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 203
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "makeDefault: err="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_0
    return-void
.end method

.method private swap(Landroid/opengl/EGLSurface;)I
    .locals 4
    .param p1, "surface"    # Landroid/opengl/EGLSurface;

    .prologue
    .line 209
    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v1, p1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 210
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    .line 211
    .local v0, "err":I
    sget-object v1, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "swap: err="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    return v0

    .line 214
    .end local v0    # "err":I
    :cond_0
    const/16 v1, 0x3000

    return v1
.end method


# virtual methods
.method public createFromSurface(Ljava/lang/Object;)Lcom/android/camera/module/encoder/EGLBase$EglSurface;
    .locals 3
    .param p1, "surface"    # Ljava/lang/Object;

    .prologue
    .line 119
    sget-object v1, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "createFromSurface"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    new-instance v0, Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/module/encoder/EGLBase$EglSurface;-><init>(Lcom/android/camera/module/encoder/EGLBase;Ljava/lang/Object;)V

    .line 121
    .local v0, "eglSurface":Lcom/android/camera/module/encoder/EGLBase$EglSurface;
    invoke-virtual {v0}, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->makeCurrent()V

    .line 122
    return-object v0
.end method

.method public querySurface(Landroid/opengl/EGLSurface;I)I
    .locals 3
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "what"    # I

    .prologue
    const/4 v2, 0x0

    .line 137
    const/4 v1, 0x1

    new-array v0, v1, [I

    .line 138
    .local v0, "value":[I
    iget-object v1, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v1, p1, p2, v0, v2}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 139
    aget v1, v0, v2

    return v1
.end method

.method public release()V
    .locals 2

    .prologue
    .line 108
    sget-object v0, Lcom/android/camera/module/encoder/EGLBase;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    .line 110
    invoke-direct {p0}, Lcom/android/camera/module/encoder/EGLBase;->destroyContext()V

    .line 111
    iget-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 112
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 114
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 115
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/module/encoder/EGLBase;->mEglContext:Landroid/opengl/EGLContext;

    .line 116
    return-void
.end method
