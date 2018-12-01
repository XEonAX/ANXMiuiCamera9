.class Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;
.super Ljava/lang/Object;
.source "FragmentPanorama.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentPanorama;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StillPreviewRender"
.end annotation


# instance fields
.field private mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

.field mTransform:[F

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentPanorama;


# direct methods
.method private constructor <init>(Lcom/android/camera/fragment/FragmentPanorama;)V
    .locals 2
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentPanorama;

    .prologue
    .line 336
    iput-object p1, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 337
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .line 338
    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->mTransform:[F

    .line 336
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/fragment/FragmentPanorama;Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/camera/fragment/FragmentPanorama;
    .param p2, "-this1"    # Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;-><init>(Lcom/android/camera/fragment/FragmentPanorama;)V

    return-void
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 13
    .param p1, "gl10"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentPanorama;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v11

    .line 353
    .local v11, "screen":Lcom/android/camera/CameraScreenNail;
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-virtual {v0}, Lcom/android/camera/fragment/FragmentPanorama;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->getGLCanvas()Lcom/android/gallery3d/ui/GLCanvasImpl;

    move-result-object v7

    .line 354
    .local v7, "canvas":Lcom/android/gallery3d/ui/GLCanvas;
    if-eqz v11, :cond_0

    if-eqz v7, :cond_0

    .line 355
    monitor-enter v7

    .line 356
    :try_start_0
    invoke-interface {v7}, Lcom/android/gallery3d/ui/GLCanvas;->clearBuffer()V

    .line 358
    invoke-interface {v7}, Lcom/android/gallery3d/ui/GLCanvas;->getWidth()I

    move-result v10

    .line 359
    .local v10, "oldWidth":I
    invoke-interface {v7}, Lcom/android/gallery3d/ui/GLCanvas;->getHeight()I

    move-result v9

    .line 360
    .local v9, "oldHeight":I
    invoke-interface {v7}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 361
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentPanorama;->-get4(Lcom/android/camera/fragment/FragmentPanorama;)Lcom/android/camera/ui/GLTextureView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->getWidth()I

    move-result v12

    .line 362
    .local v12, "width":I
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentPanorama;->-get4(Lcom/android/camera/fragment/FragmentPanorama;)Lcom/android/camera/ui/GLTextureView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView;->getHeight()I

    move-result v8

    .line 363
    .local v8, "height":I
    invoke-interface {v7, v12, v8}, Lcom/android/gallery3d/ui/GLCanvas;->setSize(II)V

    .line 364
    invoke-virtual {v11}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->mTransform:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 365
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->mExtTexture:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    invoke-virtual {v11}, Lcom/android/camera/CameraScreenNail;->getExtTexture()Lcom/android/gallery3d/ui/ExtTexture;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->mTransform:[F

    .line 366
    iget-object v3, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v3}, Lcom/android/camera/fragment/FragmentPanorama;->-get6(Lcom/android/camera/fragment/FragmentPanorama;)I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v4}, Lcom/android/camera/fragment/FragmentPanorama;->-get7(Lcom/android/camera/fragment/FragmentPanorama;)I

    move-result v4

    .line 367
    iget-object v5, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v5}, Lcom/android/camera/fragment/FragmentPanorama;->-get8(Lcom/android/camera/fragment/FragmentPanorama;)I

    move-result v5

    iget-object v6, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v6}, Lcom/android/camera/fragment/FragmentPanorama;->-get5(Lcom/android/camera/fragment/FragmentPanorama;)I

    move-result v6

    .line 365
    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->init(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    move-result-object v0

    invoke-interface {v7, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 368
    invoke-interface {v7, v10, v9}, Lcom/android/gallery3d/ui/GLCanvas;->setSize(II)V

    .line 369
    invoke-interface {v7}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 371
    invoke-interface {v7}, Lcom/android/gallery3d/ui/GLCanvas;->recycledResources()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v7

    .line 373
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentPanorama;->-get9(Lcom/android/camera/fragment/FragmentPanorama;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 374
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentPanorama;->-set0(Lcom/android/camera/fragment/FragmentPanorama;Z)Z

    .line 375
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;->this$0:Lcom/android/camera/fragment/FragmentPanorama;

    invoke-static {v0}, Lcom/android/camera/fragment/FragmentPanorama;->-get0(Lcom/android/camera/fragment/FragmentPanorama;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender$1;-><init>(Lcom/android/camera/fragment/FragmentPanorama$StillPreviewRender;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 384
    .end local v8    # "height":I
    .end local v9    # "oldHeight":I
    .end local v10    # "oldWidth":I
    .end local v12    # "width":I
    :cond_0
    return-void

    .line 355
    :catchall_0
    move-exception v0

    monitor-exit v7

    throw v0
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0
    .param p1, "gl10"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 348
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0
    .param p1, "gl10"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "eglConfig"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 343
    return-void
.end method
