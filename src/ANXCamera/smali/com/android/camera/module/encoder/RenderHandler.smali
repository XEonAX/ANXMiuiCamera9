.class public final Lcom/android/camera/module/encoder/RenderHandler;
.super Ljava/lang/Object;
.source "RenderHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

.field private mEgl:Lcom/android/camera/module/encoder/EGLBase;

.field private mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

.field private mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

.field private mIsReady:Z

.field private mIsRecordable:Z

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mRequestDraw:I

.field private mRequestRelease:Z

.field private mRequestSetEglContext:Z

.field private mShardContext:Landroid/opengl/EGLContext;

.field private mSurface:Ljava/lang/Object;

.field private final mSync:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/android/camera/module/encoder/RenderHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    .line 34
    return-void
.end method

.method private constructor <init>(II)V
    .locals 1
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    .line 41
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    invoke-direct {v0}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .line 70
    iput p1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mPreviewWidth:I

    .line 71
    iput p2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mPreviewHeight:I

    .line 72
    return-void
.end method

.method public static final createHandler(Ljava/lang/String;II)Lcom/android/camera/module/encoder/RenderHandler;
    .locals 8
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    const/4 v7, 0x0

    .line 52
    sget-object v2, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v4, "init: previewSize=%dx%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    .line 52
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    new-instance v1, Lcom/android/camera/module/encoder/RenderHandler;

    invoke-direct {v1, p1, p2}, Lcom/android/camera/module/encoder/RenderHandler;-><init>(II)V

    .line 55
    .local v1, "handler":Lcom/android/camera/module/encoder/RenderHandler;
    iget-object v3, v1, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v3

    .line 56
    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, v1, Lcom/android/camera/module/encoder/RenderHandler;->mIsReady:Z

    .line 57
    new-instance v2, Ljava/lang/Thread;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object p0, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    .end local p0    # "name":Ljava/lang/String;
    :cond_0
    invoke-direct {v2, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 58
    iget-boolean v2, v1, Lcom/android/camera/module/encoder/RenderHandler;->mIsReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    .line 60
    :try_start_1
    iget-object v2, v1, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :goto_0
    monitor-exit v3

    .line 66
    return-object v1

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    sget-object v2, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 55
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method private final internalPrepare()V
    .locals 4

    .prologue
    .line 194
    sget-object v0, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "internalPrepare"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    invoke-direct {p0}, Lcom/android/camera/module/encoder/RenderHandler;->internalRelease()V

    .line 196
    new-instance v0, Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mShardContext:Landroid/opengl/EGLContext;

    iget-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mIsRecordable:Z

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/android/camera/module/encoder/EGLBase;-><init>(Landroid/opengl/EGLContext;ZZ)V

    iput-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    .line 197
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    iget-object v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSurface:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/encoder/EGLBase;->createFromSurface(Ljava/lang/Object;)Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    .line 198
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->makeCurrent()V

    .line 199
    new-instance v0, Lcom/android/camera/effect/VideoRecorderCanvas;

    invoke-direct {v0}, Lcom/android/camera/effect/VideoRecorderCanvas;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

    .line 200
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

    iget v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mPreviewWidth:I

    iget v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mPreviewHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/VideoRecorderCanvas;->setSize(II)V

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSurface:Ljava/lang/Object;

    .line 202
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 203
    return-void
.end method

.method private final internalRelease()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 206
    sget-object v0, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "internalRelease"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->release()V

    .line 209
    iput-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    .line 211
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

    if-eqz v0, :cond_1

    .line 212
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/VideoRecorderCanvas;->recycledResources()V

    .line 213
    iput-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

    .line 215
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    if-eqz v0, :cond_2

    .line 216
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/EGLBase;->release()V

    .line 217
    iput-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    .line 219
    :cond_2
    return-void
.end method


# virtual methods
.method public final draw(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 8
    .param p1, "ext"    # Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .prologue
    .line 100
    iget-object v7, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v7

    .line 101
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit v7

    .line 102
    return-void

    .line 104
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p1, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    iget v5, p0, Lcom/android/camera/module/encoder/RenderHandler;->mPreviewWidth:I

    iget v6, p0, Lcom/android/camera/module/encoder/RenderHandler;->mPreviewHeight:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->init(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .line 105
    iget v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestDraw:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestDraw:I

    .line 106
    iget-object v0, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v7

    .line 113
    return-void

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit v7

    throw v0
.end method

.method public final release()V
    .locals 4

    .prologue
    .line 122
    sget-object v1, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "release"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v2

    .line 124
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    monitor-exit v2

    .line 125
    return-void

    .line 127
    :cond_0
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z

    .line 128
    iget-object v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    :try_start_2
    iget-object v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit v2

    .line 135
    return-void

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v1, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 123
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public final run()V
    .locals 4

    .prologue
    .line 145
    sget-object v2, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "renderHandlerThread>>>"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v3, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v3

    .line 147
    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestSetEglContext:Z

    .line 148
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z

    .line 149
    const/4 v2, 0x0

    iput v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestDraw:I

    .line 150
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mIsReady:Z

    .line 151
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v3

    .line 155
    :cond_0
    :goto_1
    iget-object v3, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v3

    .line 156
    :try_start_1
    iget-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v2, :cond_1

    :goto_2
    monitor-exit v3

    .line 185
    iget-object v3, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v3

    .line 186
    const/4 v2, 0x1

    :try_start_2
    iput-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z

    .line 187
    invoke-direct {p0}, Lcom/android/camera/module/encoder/RenderHandler;->internalRelease()V

    .line 188
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    monitor-exit v3

    .line 190
    sget-object v2, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "renderHandlerThread<<<"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    return-void

    .line 146
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 159
    :cond_1
    :try_start_3
    iget-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestSetEglContext:Z

    if-eqz v2, :cond_2

    .line 160
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestSetEglContext:Z

    .line 161
    invoke-direct {p0}, Lcom/android/camera/module/encoder/RenderHandler;->internalPrepare()V

    .line 163
    :cond_2
    iget v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestDraw:I

    if-lez v2, :cond_4

    const/4 v1, 0x1

    .line 164
    .local v1, "localRequestDraw":Z
    :goto_3
    if-eqz v1, :cond_3

    .line 165
    iget v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestDraw:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestDraw:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_3
    monitor-exit v3

    .line 169
    if-eqz v1, :cond_5

    .line 170
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mEgl:Lcom/android/camera/module/encoder/EGLBase;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    if-eqz v2, :cond_0

    .line 171
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    invoke-virtual {v2}, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->makeCurrent()V

    .line 172
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mCanvas:Lcom/android/camera/effect/VideoRecorderCanvas;

    iget-object v3, p0, Lcom/android/camera/module/encoder/RenderHandler;->mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/VideoRecorderCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 173
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mInputSurface:Lcom/android/camera/module/encoder/EGLBase$EglSurface;

    invoke-virtual {v2}, Lcom/android/camera/module/encoder/EGLBase$EglSurface;->swap()V

    goto :goto_1

    .line 163
    .end local v1    # "localRequestDraw":Z
    :cond_4
    const/4 v1, 0x0

    .restart local v1    # "localRequestDraw":Z
    goto :goto_3

    .line 155
    .end local v1    # "localRequestDraw":Z
    :catchall_1
    move-exception v2

    monitor-exit v3

    throw v2

    .line 176
    .restart local v1    # "localRequestDraw":Z
    :cond_5
    iget-object v3, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v3

    .line 178
    :try_start_4
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_0

    .line 179
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/InterruptedException;
    goto :goto_2

    .line 176
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_2
    move-exception v2

    monitor-exit v3

    throw v2

    .line 185
    .end local v1    # "localRequestDraw":Z
    :catchall_3
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public final setEglContext(Landroid/opengl/EGLContext;Ljava/lang/Object;Z)V
    .locals 4
    .param p1, "sharedContext"    # Landroid/opengl/EGLContext;
    .param p2, "surface"    # Ljava/lang/Object;
    .param p3, "isRecordable"    # Z

    .prologue
    .line 77
    sget-object v1, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "setEglContext"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    instance-of v1, p2, Landroid/view/Surface;

    if-nez v1, :cond_0

    instance-of v1, p2, Landroid/graphics/SurfaceTexture;

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_0

    .line 79
    instance-of v1, p2, Landroid/view/SurfaceHolder;

    xor-int/lit8 v1, v1, 0x1

    .line 78
    if-eqz v1, :cond_0

    .line 80
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unsupported window type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 82
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    monitor-enter v2

    .line 83
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    monitor-exit v2

    .line 84
    return-void

    .line 86
    :cond_1
    :try_start_1
    iput-object p1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mShardContext:Landroid/opengl/EGLContext;

    .line 87
    iput-object p2, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSurface:Ljava/lang/Object;

    .line 88
    iput-boolean p3, p0, Lcom/android/camera/module/encoder/RenderHandler;->mIsRecordable:Z

    .line 89
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mRequestSetEglContext:Z

    .line 90
    iget-object v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    :try_start_2
    iget-object v1, p0, Lcom/android/camera/module/encoder/RenderHandler;->mSync:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit v2

    .line 97
    return-void

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v1, Lcom/android/camera/module/encoder/RenderHandler;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 82
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method
