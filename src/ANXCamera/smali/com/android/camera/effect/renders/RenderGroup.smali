.class public Lcom/android/camera/effect/renders/RenderGroup;
.super Lcom/android/camera/effect/renders/Render;
.source "RenderGroup.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mParentFrameBufferIdOld:I

.field private mPartRenders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/renders/Render;",
            ">;"
        }
    .end annotation
.end field

.field private mRenders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/renders/Render;",
            ">;"
        }
    .end annotation
.end field

.field private mRendersMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/android/camera/effect/renders/Render;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/android/camera/effect/renders/Render;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/RenderGroup;->TAG:Ljava/lang/String;

    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/Render;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    .line 20
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "id"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/Render;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    .line 20
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    .line 29
    return-void
.end method

.method private initOrientation(Lcom/android/camera/effect/renders/Render;)V
    .locals 1
    .param p1, "render"    # Lcom/android/camera/effect/renders/Render;

    .prologue
    .line 32
    if-eqz p1, :cond_0

    .line 33
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOrientation:I

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    .line 34
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mJpegOrientation:I

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    .line 35
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mShootRotation:F

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    .line 37
    :cond_0
    return-void
.end method

.method private recordRender(Lcom/android/camera/effect/renders/Render;)Z
    .locals 5
    .param p1, "render"    # Lcom/android/camera/effect/renders/Render;

    .prologue
    const/4 v4, 0x0

    .line 75
    if-nez p1, :cond_0

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    .line 76
    .local v0, "renderId":I
    :goto_0
    iget-object v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    if-gez v1, :cond_1

    .line 77
    iget-object v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 78
    const/4 v1, 0x1

    return v1

    .line 75
    .end local v0    # "renderId":I
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/Render;->getId()I

    move-result v0

    .restart local v0    # "renderId":I
    goto :goto_0

    .line 80
    :cond_1
    sget-object v1, Lcom/android/camera/effect/renders/RenderGroup;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "already added render with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v1, v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    return v4
.end method

.method private setSize(Lcom/android/camera/effect/renders/Render;)V
    .locals 2
    .param p1, "render"    # Lcom/android/camera/effect/renders/Render;

    .prologue
    .line 64
    if-eqz p1, :cond_3

    .line 65
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPreviewWidth:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPreviewHeight:I

    if-eqz v0, :cond_1

    .line 66
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPreviewWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPreviewHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    .line 68
    :cond_1
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportWidth:I

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportHeight:I

    if-eqz v0, :cond_3

    .line 69
    :cond_2
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setViewportSize(II)V

    .line 72
    :cond_3
    return-void
.end method


# virtual methods
.method public addPartRender(Lcom/android/camera/effect/renders/Render;)V
    .locals 1
    .param p1, "render"    # Lcom/android/camera/effect/renders/Render;

    .prologue
    .line 331
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 332
    return-void
.end method

.method public addRender(Lcom/android/camera/effect/renders/Render;)V
    .locals 1
    .param p1, "render"    # Lcom/android/camera/effect/renders/Render;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->recordRender(Lcom/android/camera/effect/renders/Render;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->setSize(Lcom/android/camera/effect/renders/Render;)V

    .line 43
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->initOrientation(Lcom/android/camera/effect/renders/Render;)V

    .line 45
    :cond_0
    return-void
.end method

.method public beginBindFrameBuffer(III)V
    .locals 1
    .param p1, "bufId"    # I
    .param p2, "bufWidth"    # I
    .param p3, "bufHeight"    # I

    .prologue
    .line 132
    const v0, 0x8d40

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 133
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 134
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->identityAllM()V

    .line 135
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportWidth:I

    iput v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOldViewportWidth:I

    .line 136
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportHeight:I

    iput v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOldViewportHeight:I

    .line 137
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mParentFrameBufferId:I

    iput v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mParentFrameBufferIdOld:I

    .line 138
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->setParentFrameBufferId(I)V

    .line 139
    invoke-virtual {p0, p2, p3}, Lcom/android/camera/effect/renders/RenderGroup;->setViewportSize(II)V

    .line 140
    return-void
.end method

.method public beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V
    .locals 5
    .param p1, "frameBuffer"    # Lcom/android/camera/effect/FrameBuffer;

    .prologue
    const v4, 0x8d40

    .line 143
    invoke-virtual {p1}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v0

    invoke-static {v4, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 150
    invoke-virtual {p1}, Lcom/android/camera/effect/FrameBuffer;->getTexture()Lcom/android/gallery3d/ui/RawTexture;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v0

    .line 148
    const v1, 0x8ce0

    .line 149
    const/16 v2, 0xde1

    .line 151
    const/4 v3, 0x0

    .line 147
    invoke-static {v4, v1, v2, v0, v3}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 152
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 153
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->identityAllM()V

    .line 154
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportWidth:I

    iput v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOldViewportWidth:I

    .line 155
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mViewportHeight:I

    iput v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOldViewportHeight:I

    .line 156
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mParentFrameBufferId:I

    iput v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mParentFrameBufferIdOld:I

    .line 157
    invoke-virtual {p1}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/renders/RenderGroup;->setParentFrameBufferId(I)V

    .line 158
    invoke-virtual {p1}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/effect/renders/RenderGroup;->setViewportSize(II)V

    .line 159
    return-void
.end method

.method public clearPartRenders()V
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 336
    return-void
.end method

.method protected clearRenders()V
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 106
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 107
    return-void
.end method

.method public deleteBuffer()V
    .locals 3

    .prologue
    .line 206
    invoke-super {p0}, Lcom/android/camera/effect/renders/Render;->deleteBuffer()V

    .line 207
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 208
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 209
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 210
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/Render;->deleteBuffer()V

    goto :goto_0

    .line 214
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 3

    .prologue
    .line 123
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 124
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/Render;->destroy()V

    goto :goto_0

    .line 128
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/effect/renders/RenderGroup;->clearRenders()V

    .line 129
    return-void
.end method

.method public draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z
    .locals 4
    .param p1, "attr"    # Lcom/android/camera/effect/draw_mode/DrawAttribute;

    .prologue
    .line 111
    const/4 v2, 0x0

    .line 112
    .local v2, "result":Z
    iget-object v3, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 113
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 114
    const/4 v2, 0x1

    .line 118
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_1
    return v2
.end method

.method public endBindFrameBuffer()V
    .locals 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-interface {v0}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 163
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mParentFrameBufferIdOld:I

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 164
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOldViewportWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOldViewportHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/effect/renders/RenderGroup;->setViewportSize(II)V

    .line 165
    iget v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mParentFrameBufferIdOld:I

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/renders/RenderGroup;->setParentFrameBufferId(I)V

    .line 166
    return-void
.end method

.method public getPartRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 339
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 340
    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 342
    :cond_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    return-object v0
.end method

.method public getRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 3
    .param p1, "renderId"    # I

    .prologue
    .line 86
    if-gez p1, :cond_0

    .line 87
    sget-object v0, Lcom/android/camera/effect/renders/RenderGroup;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid render id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v0, v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    return-object v0
.end method

.method public getRenderByIndex(I)Lcom/android/camera/effect/renders/Render;
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 93
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_1

    .line 94
    :cond_0
    sget-object v0, Lcom/android/camera/effect/renders/RenderGroup;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "invalid render index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const/4 v0, 0x0

    return-object v0

    .line 97
    :cond_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    return-object v0
.end method

.method protected getRenderSize()I
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getRenders()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/renders/Render;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isNeedInit(I)Z
    .locals 3
    .param p1, "renderId"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 322
    const/4 v2, -0x1

    if-le p1, v2, :cond_1

    .line 323
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v2

    if-gez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    .line 325
    :cond_1
    return v0
.end method

.method public isPartComplete(I)Z
    .locals 1
    .param p1, "wholeSize"    # I

    .prologue
    .line 346
    iget-object v0, p0, Lcom/android/camera/effect/renders/RenderGroup;->mPartRenders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeRender(I)V
    .locals 2
    .param p1, "renderId"    # I

    .prologue
    .line 48
    iget-object v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_0

    .line 49
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    .line 50
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    iget-object v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 51
    iget-object v1, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRendersMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 52
    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/Render;->destroy()V

    .line 56
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_0
    return-void
.end method

.method public setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V
    .locals 3
    .param p1, "attribute"    # Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    .prologue
    .line 182
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    .line 183
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 184
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 185
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    goto :goto_0

    .line 190
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setJpegOrientation(I)V
    .locals 3
    .param p1, "orientation"    # I

    .prologue
    .line 233
    iget v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mJpegOrientation:I

    if-ne v2, p1, :cond_0

    .line 234
    return-void

    .line 236
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    .line 237
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 238
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 239
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_1

    .line 240
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    goto :goto_0

    .line 244
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method public setMirror(Z)V
    .locals 3
    .param p1, "mirror"    # Z

    .prologue
    .line 248
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    .line 249
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 250
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 251
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 252
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    goto :goto_0

    .line 256
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setOrientation(I)V
    .locals 3
    .param p1, "orientation"    # I

    .prologue
    .line 218
    iget v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mOrientation:I

    if-ne v2, p1, :cond_0

    .line 219
    return-void

    .line 221
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    .line 222
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 223
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 224
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_1

    .line 225
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    goto :goto_0

    .line 229
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method protected setParentFrameBufferId(I)V
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 284
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/Render;->setParentFrameBufferId(I)V

    .line 285
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 286
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "child$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 287
    .local v0, "child":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 288
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setParentFrameBufferId(I)V

    goto :goto_0

    .line 292
    .end local v0    # "child":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "child$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 194
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    .line 195
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 196
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 197
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 198
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    goto :goto_0

    .line 202
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setPreviousFrameBufferInfo(III)V
    .locals 3
    .param p1, "bufId"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    .line 314
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 315
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/camera/effect/renders/Render;->setPreviousFrameBufferInfo(III)V

    goto :goto_0

    .line 319
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_1
    return-void
.end method

.method public setShootRotation(F)V
    .locals 3
    .param p1, "shootRotation"    # F

    .prologue
    .line 260
    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    .line 261
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 262
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 263
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    goto :goto_0

    .line 268
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setSnapshotSize(II)V
    .locals 3
    .param p1, "snapshotWidth"    # I
    .param p2, "snapshotHeight"    # I

    .prologue
    .line 272
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    .line 273
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 274
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 275
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 276
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    goto :goto_0

    .line 280
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setSticker(Ljava/lang/String;)V
    .locals 3
    .param p1, "newSticker"    # Ljava/lang/String;

    .prologue
    .line 305
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 306
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/Render;->setSticker(Ljava/lang/String;)V

    goto :goto_0

    .line 310
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    :cond_1
    return-void
.end method

.method public setViewportSize(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 170
    invoke-super {p0, p1, p2}, Lcom/android/camera/effect/renders/Render;->setViewportSize(II)V

    .line 171
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 172
    iget-object v2, p0, Lcom/android/camera/effect/renders/RenderGroup;->mRenders:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "render$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/renders/Render;

    .line 173
    .local v0, "render":Lcom/android/camera/effect/renders/Render;
    if-eqz v0, :cond_0

    .line 174
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/effect/renders/Render;->setViewportSize(II)V

    goto :goto_0

    .line 178
    .end local v0    # "render":Lcom/android/camera/effect/renders/Render;
    .end local v1    # "render$iterator":Ljava/util/Iterator;
    :cond_1
    return-void
.end method
