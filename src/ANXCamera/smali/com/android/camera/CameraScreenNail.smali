.class public Lcom/android/camera/CameraScreenNail;
.super Lcom/android/camera/SurfaceTextureScreenNail;
.source "CameraScreenNail.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/CameraScreenNail$NailListener;,
        Lcom/android/camera/CameraScreenNail$RequestRenderListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAnimState:I

.field private mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

.field private mDisableSwitchAnimationOnce:Z

.field private mFirstFrameArrived:Z

.field private mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mFrameNumber:I

.field private mLock:Ljava/lang/Object;

.field private mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

.field private mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

.field private mRequestRenderListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/CameraScreenNail$RequestRenderListener;",
            ">;"
        }
    .end annotation
.end field

.field private mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

.field private final mTextureTransformMatrix:[F

.field private mVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const-class v0, Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/CameraScreenNail$NailListener;Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V
    .locals 2
    .param p1, "nailListener"    # Lcom/android/camera/CameraScreenNail$NailListener;
    .param p2, "requestRenderListener"    # Lcom/android/camera/CameraScreenNail$RequestRenderListener;

    .prologue
    const/4 v1, 0x0

    .line 125
    invoke-direct {p0}, Lcom/android/camera/SurfaceTextureScreenNail;-><init>()V

    .line 82
    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    .line 88
    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    .line 91
    new-instance v0, Lcom/android/camera/CaptureAnimManager;

    invoke-direct {v0}, Lcom/android/camera/CaptureAnimManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    .line 92
    new-instance v0, Lcom/android/camera/SwitchAnimManager;

    invoke-direct {v0}, Lcom/android/camera/SwitchAnimManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    .line 93
    new-instance v0, Lcom/android/camera/SwitchAnimManager;

    invoke-direct {v0}, Lcom/android/camera/SwitchAnimManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    .line 94
    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 99
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    .line 110
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 126
    iput-object p1, p0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    .line 128
    invoke-virtual {p0, p2}, Lcom/android/camera/CameraScreenNail;->addRequestListener(Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V

    .line 129
    return-void
.end method

.method private copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V
    .locals 7
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "texture"    # Lcom/android/gallery3d/ui/RawTexture;
    .param p3, "frameBuffer"    # Lcom/android/camera/effect/FrameBuffer;

    .prologue
    const/4 v3, 0x0

    .line 501
    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v5

    .line 502
    .local v5, "width":I
    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v6

    .line 503
    .local v6, "height":I
    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 504
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraScreenNail;->updateTransformMatrix([F)V

    .line 505
    if-nez p3, :cond_0

    .line 506
    new-instance p3, Lcom/android/camera/effect/FrameBuffer;

    .end local p3    # "frameBuffer":Lcom/android/camera/effect/FrameBuffer;
    invoke-direct {p3, p1, p2, v3}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    .line 509
    .restart local p3    # "frameBuffer":Lcom/android/camera/effect/FrameBuffer;
    :cond_0
    invoke-interface {p1, p3}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    .line 510
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    move v4, v3

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 511
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    .line 512
    return-void
.end method

.method private notifyFrameAvailable(I)V
    .locals 2
    .param p1, "arrivedType"    # I

    .prologue
    .line 656
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 657
    return-void

    .line 659
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 660
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v0, p1}, Lcom/android/camera/CameraScreenNail$NailListener;->onFrameAvailable(I)V

    .line 661
    return-void
.end method

.method private postRequestListener()V
    .locals 3

    .prologue
    .line 144
    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "listener$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraScreenNail$RequestRenderListener;

    .line 145
    .local v0, "listener":Lcom/android/camera/CameraScreenNail$RequestRenderListener;
    invoke-interface {v0}, Lcom/android/camera/CameraScreenNail$RequestRenderListener;->requestRender()V

    goto :goto_0

    .line 147
    .end local v0    # "listener":Lcom/android/camera/CameraScreenNail$RequestRenderListener;
    :cond_0
    return-void
.end method

.method private readPreviewPixels(Lcom/android/gallery3d/ui/GLCanvas;II)[B
    .locals 10
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 486
    mul-int v0, p2, p3

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 488
    .local v9, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 489
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraScreenNail;->updateTransformMatrix([F)V

    .line 490
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez v0, :cond_0

    .line 491
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {v0, p1, v1, v3}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 493
    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    .line 494
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    move v4, v3

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 495
    const/16 v7, 0x1908

    const/16 v8, 0x1401

    move v4, v3

    move v5, p2

    move v6, p3

    invoke-static/range {v3 .. v9}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 496
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    .line 497
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method private renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)V
    .locals 6
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "texture"    # Lcom/android/gallery3d/ui/RawTexture;

    .prologue
    const/4 v2, 0x0

    .line 523
    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v4

    .line 524
    .local v4, "width":I
    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v5

    .line 526
    .local v5, "height":I
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez v0, :cond_0

    .line 527
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    invoke-direct {v0, p1, p2, v2}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 530
    :cond_0
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->prepareBlurRenders()V

    .line 531
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    .line 532
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    move-object v1, p2

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 533
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    .line 534
    return-void
.end method


# virtual methods
.method public acquireSurfaceTexture()V
    .locals 2

    .prologue
    .line 151
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "acquireSurfaceTexture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 153
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    .line 154
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    .line 155
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    .line 156
    invoke-super {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->acquireSurfaceTexture()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 158
    return-void

    .line 152
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public addRequestListener(Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V
    .locals 2
    .param p1, "requestRenderListener"    # Lcom/android/camera/CameraScreenNail$RequestRenderListener;

    .prologue
    .line 132
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 133
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 135
    return-void

    .line 132
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public animateCapture(I)V
    .locals 4
    .param p1, "animOrientation"    # I

    .prologue
    .line 257
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 258
    :try_start_0
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "animateCapture: state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/CaptureAnimManager;->animateHoldAndSlide()V

    .line 261
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    .line 262
    const/16 v0, 0xb

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 265
    return-void

    .line 257
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public animateModuleCopyTexture()V
    .locals 3

    .prologue
    .line 177
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 178
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    monitor-exit v1

    .line 179
    return-void

    .line 181
    :cond_0
    const/16 v0, 0x1f

    :try_start_1
    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 182
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    .line 183
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "state=MODULE_COPY_TEXTURE"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    .line 185
    return-void

    .line 177
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public clearAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 218
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eqz v0, :cond_0

    .line 219
    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 220
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->clearAnimation()V

    .line 221
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/CaptureAnimManager;->clearAnimation()V

    .line 222
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->clearAnimation()V

    .line 224
    :cond_0
    return-void
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 24
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    move-object/from16 v23, v0

    monitor-enter v23

    .line 341
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    if-nez v4, :cond_0

    .line 342
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    .line 344
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    if-eqz v4, :cond_3

    .line 345
    move/from16 v6, p2

    .line 346
    .local v6, "offsetX":I
    move/from16 v7, p3

    .line 347
    .local v7, "offsetY":I
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 348
    move/from16 v0, p4

    move/from16 v1, p5

    if-le v0, v1, :cond_2

    .line 349
    sub-int v4, p4, p5

    div-int/lit8 v4, v4, 0x2

    add-int v6, p2, v4

    .line 350
    move/from16 p4, p5

    .line 356
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    move-object/from16 v5, p1

    move/from16 v8, p4

    move/from16 v9, p5

    invoke-virtual/range {v4 .. v9}, Lcom/android/gallery3d/ui/BitmapTexture;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v23

    .line 357
    return-void

    .line 352
    :cond_2
    sub-int v4, p5, p4

    :try_start_1
    div-int/lit8 v4, v4, 0x2

    add-int v7, p3, v4

    .line 353
    move/from16 p5, p4

    goto :goto_0

    .line 359
    .end local v6    # "offsetX":I
    .end local v7    # "offsetY":I
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v20

    .line 360
    .local v20, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    if-eqz v20, :cond_4

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    if-nez v4, :cond_6

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v4, :cond_6

    .line 361
    :cond_4
    sget-object v4, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "draw: firstFrame="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v8, " surface="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    if-eqz v20, :cond_5

    .line 363
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_5
    monitor-exit v23

    .line 365
    return-void

    .line 368
    :cond_6
    :try_start_2
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sparse-switch v4, :sswitch_data_0

    .line 432
    :goto_1
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x17

    if-eq v4, v5, :cond_7

    .line 433
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x18

    if-ne v4, v5, :cond_b

    .line 436
    :cond_7
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 437
    const/16 v16, 0x0

    .line 439
    .local v16, "drawn":Z
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    if-eqz v4, :cond_c

    .line 440
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    invoke-virtual/range {v8 .. v14}, Lcom/android/camera/SwitchAnimManager;->drawPreview(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/gallery3d/ui/RawTexture;)Z

    .line 446
    .end local v16    # "drawn":Z
    :goto_2
    if-nez v16, :cond_8

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x19

    if-eq v4, v5, :cond_d

    .line 447
    :cond_8
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_9
    :goto_3
    monitor-exit v23

    .line 483
    return-void

    .line 370
    :sswitch_0
    :try_start_3
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 339
    .end local v20    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    :catchall_0
    move-exception v4

    monitor-exit v23

    throw v4

    .line 373
    .restart local v20    # "surfaceTexture":Landroid/graphics/SurfaceTexture;
    :sswitch_1
    :try_start_4
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 375
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v22

    .line 376
    .local v22, "textureWidth":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v21

    .line 379
    .local v21, "textureHeight":I
    mul-int v4, p4, v21

    mul-int v5, p5, v22

    if-le v4, v5, :cond_a

    .line 380
    move/from16 v19, v22

    .line 381
    .local v19, "previewWidth":I
    mul-int v4, p5, v22

    div-int v18, v4, p4

    .line 386
    .local v18, "previewHeight":I
    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    move/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/CameraScreenNail;->readPreviewPixels(Lcom/android/gallery3d/ui/GLCanvas;II)[B

    move-result-object v17

    .line 387
    .local v17, "pixels":[B
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 388
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v18

    invoke-interface {v4, v0, v1, v2}, Lcom/android/camera/CameraScreenNail$NailListener;->onPreviewPixelsRead([BII)V

    goto/16 :goto_1

    .line 383
    .end local v17    # "pixels":[B
    .end local v18    # "previewHeight":I
    .end local v19    # "previewWidth":I
    :cond_a
    mul-int v4, p4, v21

    div-int v19, v4, p5

    .line 384
    .restart local v19    # "previewWidth":I
    move/from16 v18, v21

    .restart local v18    # "previewHeight":I
    goto :goto_4

    .line 391
    .end local v18    # "previewHeight":I
    .end local v19    # "previewWidth":I
    .end local v21    # "textureHeight":I
    .end local v22    # "textureWidth":I
    :sswitch_2
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 392
    invoke-interface/range {p1 .. p1}, Lcom/android/gallery3d/ui/GLCanvas;->clearBuffer()V

    goto/16 :goto_1

    .line 395
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    .line 396
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/android/camera/SwitchAnimManager;->setReviewDrawingSize(IIII)V

    .line 397
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v4}, Lcom/android/camera/CameraScreenNail$NailListener;->onPreviewTextureCopied()V

    .line 398
    const/16 v4, 0x16

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 399
    sget-object v4, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "draw: state=SWITCH_DRAW_PREVIEW"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    :sswitch_4
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 406
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    invoke-virtual/range {v8 .. v14}, Lcom/android/camera/SwitchAnimManager;->drawPreview(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/gallery3d/ui/RawTexture;)Z

    goto/16 :goto_1

    .line 409
    :sswitch_5
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 410
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    .line 411
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/android/camera/CaptureAnimManager;->startAnimation(IIII)V

    .line 412
    const/16 v4, 0xc

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 413
    sget-object v4, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "draw: state=CAPTURE_RUNNING"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 416
    :sswitch_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v5}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    .line 417
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/android/camera/SwitchAnimManager;->setReviewDrawingSize(IIII)V

    .line 419
    sget-object v4, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "draw: state=MODULE_DRAW_PREVIEW"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    const/16 v4, 0x21

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 422
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v4}, Lcom/android/camera/SwitchAnimManager;->startAnimation()V

    .line 423
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    goto/16 :goto_1

    .line 434
    :cond_b
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x19

    if-eq v4, v5, :cond_7

    .line 455
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0xc

    if-ne v4, v5, :cond_f

    .line 456
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v5}, Lcom/android/camera/CaptureAnimManager;->drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result v16

    .line 458
    .local v16, "drawn":Z
    if-eqz v16, :cond_e

    .line 459
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    goto/16 :goto_3

    .line 442
    .local v16, "drawn":Z
    :cond_c
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    .line 443
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move-object/from16 v14, p0

    .line 442
    invoke-virtual/range {v8 .. v15}, Lcom/android/camera/SwitchAnimManager;->drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result v16

    .local v16, "drawn":Z
    goto/16 :goto_2

    .line 450
    .end local v16    # "drawn":Z
    :cond_d
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 451
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    .line 453
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    goto/16 :goto_3

    .line 462
    .restart local v16    # "drawn":Z
    :cond_e
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 463
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    goto/16 :goto_3

    .line 465
    .end local v16    # "drawn":Z
    :cond_f
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x21

    if-eq v4, v5, :cond_10

    .line 466
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x22

    if-ne v4, v5, :cond_12

    .line 469
    :cond_10
    :goto_5
    invoke-virtual/range {v20 .. v20}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 470
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    .line 471
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    move-object/from16 v14, p0

    .line 470
    invoke-virtual/range {v8 .. v15}, Lcom/android/camera/SwitchAnimManager;->drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result v16

    .line 473
    .restart local v16    # "drawn":Z
    if-nez v16, :cond_11

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x23

    if-eq v4, v5, :cond_13

    .line 474
    :cond_11
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    goto/16 :goto_3

    .line 467
    .end local v16    # "drawn":Z
    :cond_12
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v5, 0x23

    if-ne v4, v5, :cond_9

    goto :goto_5

    .line 477
    .restart local v16    # "drawn":Z
    :cond_13
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 479
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_3

    .line 368
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xb -> :sswitch_5
        0xd -> :sswitch_1
        0xe -> :sswitch_2
        0x15 -> :sswitch_3
        0x16 -> :sswitch_4
        0x1f -> :sswitch_6
    .end sparse-switch
.end method

.method public drawBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 6
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 515
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 516
    return-void
.end method

.method public getFrameAvailableFlag()Z
    .locals 1

    .prologue
    .line 652
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public getRenderRect()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 640
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mRenderLayoutRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public isAnimationRunning()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 304
    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 3
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 566
    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 567
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "onFrameAvailable: surface changed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    return-void

    .line 570
    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 571
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    if-nez v0, :cond_2

    .line 572
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "onFrameAvailable first frame arrived."

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    invoke-static {}, Lcom/android/camera/CameraSettings;->getSkipFrameNumber()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 575
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    .line 576
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 577
    return-void

    .line 580
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackAppLunchTimeEnd()V

    .line 581
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraEnd()V

    .line 582
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchModeEnd()V

    .line 583
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/CameraScreenNail;->notifyFrameAvailable(I)V

    .line 584
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    .line 587
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    .line 588
    iget-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    if-eqz v0, :cond_4

    .line 589
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x18

    if-ne v0, v2, :cond_5

    .line 590
    const/16 v0, 0x19

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 591
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "SWITCH_WAITING_FIRST_FRAME->SWITCH_RESUME"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->startResume()V

    .line 600
    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    .line 602
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/android/camera/CameraScreenNail;->notifyFrameAvailable(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_4
    monitor-exit v1

    .line 605
    return-void

    .line 593
    :cond_5
    :try_start_2
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x22

    if-ne v0, v2, :cond_3

    .line 594
    const/16 v0, 0x23

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 595
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "MODULE_WAITING_FIRST_FRAME->MODULE_RESUME"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->startResume()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 570
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public releaseBitmapIfNeeded()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 544
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v0}, Lcom/android/camera/CameraScreenNail$NailListener;->isKeptBitmapTexture()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 545
    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    .line 546
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    .line 548
    :cond_0
    return-void
.end method

.method public releaseSurfaceTexture()V
    .locals 3

    .prologue
    .line 162
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 163
    :try_start_0
    invoke-super {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->releaseSurfaceTexture()V

    .line 164
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 165
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "release: state=NONE"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    .line 167
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    .line 168
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mModuleSwitching:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 170
    return-void

    .line 162
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public renderBitmapToCanvas(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 537
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    .line 538
    new-instance v0, Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {v0, p1}, Lcom/android/gallery3d/ui/BitmapTexture;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    .line 539
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    .line 540
    return-void
.end method

.method public renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 519
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p0, p1, v0}, Lcom/android/camera/CameraScreenNail;->renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)V

    .line 520
    return-void
.end method

.method public requestAwaken()V
    .locals 3

    .prologue
    .line 277
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 278
    :try_start_0
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0xe

    if-ne v0, v2, :cond_0

    .line 279
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 280
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    .line 281
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 284
    return-void

    .line 277
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public requestHibernate()V
    .locals 2

    .prologue
    .line 268
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 269
    :try_start_0
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v0, :cond_0

    .line 270
    const/16 v0, 0xe

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 271
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 274
    return-void

    .line 268
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public requestReadPixels()V
    .locals 2

    .prologue
    .line 287
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 288
    :try_start_0
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v0, :cond_0

    .line 289
    const/16 v0, 0xd

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    .line 290
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 293
    return-void

    .line 287
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public resetFrameAvailableFlag()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 644
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 645
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 646
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    .line 647
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 649
    return-void

    .line 645
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public setPreviewFrameLayoutSize(II)V
    .locals 8
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/16 v0, 0x2d0

    .line 612
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 613
    :try_start_0
    sget-object v2, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v4, "setPreviewFrameLayoutSize: %dx%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    invoke-static {}, Lcom/android/camera/Device;->isSurfaceSizeLimited()Z

    move-result v2

    if-nez v2, :cond_0

    move v0, p1

    :cond_0
    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceWidth:I

    .line 615
    invoke-static {}, Lcom/android/camera/Device;->isSurfaceSizeLimited()Z

    move-result v0

    if-nez v0, :cond_1

    .end local p2    # "height":I
    :goto_0
    iput p2, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceHeight:I

    .line 618
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    iget v2, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceWidth:I

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceHeight:I

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/SwitchAnimManager;->setPreviewFrameLayoutSize(II)V

    .line 619
    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->updateRenderRect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 621
    return-void

    .line 616
    .restart local p2    # "height":I
    :cond_1
    mul-int/lit16 v0, p2, 0x2d0

    :try_start_1
    div-int p2, v0, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 612
    .end local p2    # "height":I
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected updateExtraTransformMatrix([F)V
    .locals 9
    .param p1, "matrix"    # [F

    .prologue
    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v7, 0x0

    const/high16 v6, -0x41000000    # -0.5f

    const/4 v5, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    .line 624
    const/high16 v0, 0x3f800000    # 1.0f

    .line 625
    .local v0, "scaleX":F
    const/high16 v1, 0x3f800000    # 1.0f

    .line 626
    .local v1, "scaleY":F
    iget v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v3, 0x17

    if-eq v2, v3, :cond_0

    .line 627
    iget v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v3, 0x18

    if-ne v2, v3, :cond_4

    .line 629
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v2}, Lcom/android/camera/SwitchAnimManager;->getExtScaleX()F

    move-result v0

    .line 630
    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v2}, Lcom/android/camera/SwitchAnimManager;->getExtScaleY()F

    move-result v1

    .line 632
    :cond_1
    cmpl-float v2, v0, v4

    if-nez v2, :cond_2

    cmpl-float v2, v1, v4

    if-eqz v2, :cond_3

    .line 633
    :cond_2
    invoke-static {p1, v5, v8, v8, v7}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 634
    invoke-static {p1, v5, v0, v1, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 635
    invoke-static {p1, v5, v6, v6, v7}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 637
    :cond_3
    return-void

    .line 628
    :cond_4
    iget v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v3, 0x19

    if-ne v2, v3, :cond_1

    goto :goto_0
.end method
