.class public Lcom/android/camera/ui/V6CameraGLSurfaceView;
.super Landroid/opengl/GLSurfaceView;
.source "V6CameraGLSurfaceView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;
    }
.end annotation


# instance fields
.field private final mActivity:Lcom/android/camera/Camera;

.field private mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

.field private mCatchUnTapableEvent:Z

.field private mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private final mEglConfigChooser:Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;

.field private mFrameCount:I

.field private mFrameCountingStart:J

.field private mGL:Ljavax/microedition/khronos/opengles/GL11;

.field protected mHeight:I

.field private final mRenderLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private volatile mRenderRequested:Z

.field protected mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/16 v3, 0x2d0

    const/4 v2, 0x0

    .line 61
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    iput v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mFrameCount:I

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mFrameCountingStart:J

    .line 46
    iput-boolean v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderRequested:Z

    .line 47
    new-instance v0, Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;-><init>(Lcom/android/camera/ui/V6CameraGLSurfaceView;Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;)V

    iput-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mEglConfigChooser:Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;

    .line 49
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 62
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->setEGLContextClientVersion(I)V

    .line 63
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mEglConfigChooser:Lcom/android/camera/ui/V6CameraGLSurfaceView$MyEGLConfigChooser;

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 64
    invoke-virtual {p0, p0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 65
    invoke-virtual {p0, v2}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->setRenderMode(I)V

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->setPreserveEGLContextOnPause(Z)V

    .line 67
    invoke-virtual {p0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 68
    invoke-static {}, Lcom/android/camera/Device;->isSurfaceSizeLimited()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 70
    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    mul-int/lit16 v1, v1, 0x2d0

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v1, v2

    .line 69
    invoke-interface {v0, v3, v1}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 72
    :cond_0
    check-cast p1, Lcom/android/camera/Camera;

    .end local p1    # "context":Landroid/content/Context;
    iput-object p1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    .line 73
    return-void
.end method


# virtual methods
.method public getEGLContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object v0
.end method

.method public getGLCanvas()Lcom/android/gallery3d/ui/GLCanvasImpl;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    return-object v0
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 205
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/GLCanvasImpl;->recycledResources()V

    .line 208
    invoke-static {}, Lcom/android/gallery3d/ui/UploadedTexture;->resetUploadLimit()V

    .line 210
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderRequested:Z

    .line 212
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    monitor-enter v1

    .line 213
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/GLCanvasImpl;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 214
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-virtual {v0, v2}, Lcom/android/camera/CameraScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 215
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/GLCanvasImpl;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 218
    invoke-static {}, Lcom/android/gallery3d/ui/UploadedTexture;->uploadLimitReached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->requestRender()V

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/GLCanvasImpl;->recycledResources()V

    .line 223
    return-void

    .line 212
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 174
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onPause()V

    .line 175
    const-string/jumbo v0, "GLRootView"

    const-string/jumbo v1, "onPause"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->updateSurfaceState(I)V

    .line 179
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 183
    const-string/jumbo v0, "GLRootView"

    const-string/jumbo v1, "onResume"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onResume()V

    .line 185
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 5
    .param p1, "gl1"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 154
    const-string/jumbo v2, "GLRootView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "onSurfaceChanged: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 155
    const-string/jumbo v4, ", gl10: "

    .line 154
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 155
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 154
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const/4 v2, -0x4

    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V

    move-object v1, p1

    .line 157
    check-cast v1, Ljavax/microedition/khronos/opengles/GL11;

    .line 158
    .local v1, "gl":Ljavax/microedition/khronos/opengles/GL11;
    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mGL:Ljavax/microedition/khronos/opengles/GL11;

    if-ne v2, v1, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    .line 159
    iput p2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mWidth:I

    .line 160
    iput p3, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mHeight:I

    .line 161
    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-virtual {v2, p2, p3}, Lcom/android/gallery3d/ui/GLCanvasImpl;->setSize(II)V

    .line 163
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 164
    .local v0, "egl":Ljavax/microedition/khronos/egl/EGL10;
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetCurrentContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 166
    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    if-eqz v2, :cond_0

    .line 167
    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->acquireSurfaceTexture()V

    .line 168
    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/android/camera/Camera;->updateSurfaceState(I)V

    .line 170
    :cond_0
    return-void

    .line 158
    .end local v0    # "egl":Ljavax/microedition/khronos/egl/EGL10;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 4
    .param p1, "gl1"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 125
    const-string/jumbo v1, "GLRootView"

    const-string/jumbo v2, "onSurfaceCreated"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, p1

    .line 126
    check-cast v0, Ljavax/microedition/khronos/opengles/GL11;

    .line 127
    .local v0, "gl":Ljavax/microedition/khronos/opengles/GL11;
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mGL:Ljavax/microedition/khronos/opengles/GL11;

    if-eqz v1, :cond_0

    .line 129
    const-string/jumbo v1, "GLRootView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "GLObject has changed from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mGL:Ljavax/microedition/khronos/opengles/GL11;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 133
    :try_start_0
    iput-object v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mGL:Ljavax/microedition/khronos/opengles/GL11;

    .line 134
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-static {v1}, Lcom/android/gallery3d/ui/BasicTexture;->invalidateAllTextures(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 135
    new-instance v1, Lcom/android/gallery3d/ui/GLCanvasImpl;

    invoke-direct {v1}, Lcom/android/gallery3d/ui/GLCanvasImpl;-><init>()V

    iput-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCanvas:Lcom/android/gallery3d/ui/GLCanvasImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 143
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->setRenderMode(I)V

    .line 146
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    if-eqz v1, :cond_1

    .line 147
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->acquireSurfaceTexture()V

    .line 148
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera;->updateSurfaceState(I)V

    .line 150
    :cond_1
    return-void

    .line 136
    :catchall_0
    move-exception v1

    .line 137
    iget-object v2, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 136
    throw v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 103
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 104
    return v4

    .line 107
    :cond_0
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v1

    check-cast v1, Lcom/android/camera/module/BaseModule;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/BaseModule;->isInTapableRect(II)Z

    move-result v0

    .line 108
    .local v0, "isInTapableRect":Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-nez v1, :cond_3

    xor-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_3

    .line 109
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/android/camera/ui/V6GestureRecognizer;->setScaleDetectorEnable(Z)V

    .line 110
    iput-boolean v5, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCatchUnTapableEvent:Z

    .line 116
    :cond_1
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCatchUnTapableEvent:Z

    if-eqz v1, :cond_2

    .line 117
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 120
    :cond_2
    iget-boolean v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCatchUnTapableEvent:Z

    return v1

    .line 111
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-eq v1, v5, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 112
    :cond_4
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/android/camera/ui/V6GestureRecognizer;->setScaleDetectorEnable(Z)V

    .line 113
    iput-boolean v4, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mCatchUnTapableEvent:Z

    goto :goto_0
.end method

.method public requestRender()V
    .locals 1

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderRequested:Z

    if-eqz v0, :cond_0

    .line 83
    return-void

    .line 85
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mRenderRequested:Z

    .line 86
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->requestRender()V

    .line 87
    return-void
.end method

.method public setVideoEncoder(Lcom/android/camera/module/encoder/MediaVideoEncoder;)V
    .locals 2
    .param p1, "encoder"    # Lcom/android/camera/module/encoder/MediaVideoEncoder;

    .prologue
    .line 226
    iget-object v1, p0, Lcom/android/camera/ui/V6CameraGLSurfaceView;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    .line 227
    .local v0, "screenNail":Lcom/android/camera/CameraScreenNail;
    if-eqz v0, :cond_0

    .line 228
    new-instance v1, Lcom/android/camera/ui/V6CameraGLSurfaceView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/android/camera/ui/V6CameraGLSurfaceView$1;-><init>(Lcom/android/camera/ui/V6CameraGLSurfaceView;Lcom/android/camera/CameraScreenNail;Lcom/android/camera/module/encoder/MediaVideoEncoder;)V

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 240
    :cond_0
    return-void
.end method
