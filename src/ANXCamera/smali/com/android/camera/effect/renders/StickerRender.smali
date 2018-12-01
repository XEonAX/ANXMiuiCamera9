.class public Lcom/android/camera/effect/renders/StickerRender;
.super Lcom/android/camera/effect/renders/PixelEffectRender;
.source "StickerRender.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBeautifyTextureId:[I

.field private mCurrentSticker:Ljava/lang/String;

.field private mFrameBufferHeight:I

.field private mFrameBufferId:I

.field private mFrameBufferWidth:I

.field private mHumanActionHandleLock:Ljava/lang/Object;

.field private mHumanActionInitDone:Z

.field private mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

.field private mNeedBeautify:Z

.field private mRGBABuffer:Ljava/nio/ByteBuffer;

.field private mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

.field private mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

.field private mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

.field private mTextureOutId:[I


# direct methods
.method static synthetic -get0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/camera/effect/renders/StickerRender;)Ljava/lang/Object;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/StickerRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/camera/effect/renders/StickerRender;)Lcom/sensetime/stmobile/STMobileHumanActionNative;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/effect/renders/StickerRender;

    .prologue
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    return-object v0
.end method

.method static synthetic -set0(Lcom/android/camera/effect/renders/StickerRender;Z)Z
    .locals 0
    .param p0, "-this"    # Lcom/android/camera/effect/renders/StickerRender;
    .param p1, "-value"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionInitDone:Z

    return p1
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/android/camera/effect/renders/StickerRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;ILjava/lang/String;)V
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "id"    # I
    .param p3, "sticker"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/PixelEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 30
    new-instance v0, Lcom/sensetime/stmobile/STMobileStickerNative;

    invoke-direct {v0}, Lcom/sensetime/stmobile/STMobileStickerNative;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    .line 31
    new-instance v0, Lcom/sensetime/stmobile/STBeautifyNative;

    invoke-direct {v0}, Lcom/sensetime/stmobile/STBeautifyNative;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    .line 32
    new-instance v0, Lcom/sensetime/stmobile/STMobileHumanActionNative;

    invoke-direct {v0}, Lcom/sensetime/stmobile/STMobileHumanActionNative;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    .line 49
    iput-object p3, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->onInit()V

    .line 51
    return-void
.end method

.method private destroyGLResource()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 280
    iput-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    .line 281
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 283
    iput-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    .line 285
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    if-eqz v0, :cond_1

    .line 286
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 287
    iput-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    .line 289
    :cond_1
    return-void
.end method

.method private getRGBABuffer(II)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 214
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 215
    mul-int v0, p1, p2

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 218
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method private getRotateType()I
    .locals 2

    .prologue
    .line 199
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->getOrientation()I

    move-result v0

    .line 201
    .local v0, "orientation":I
    sparse-switch v0, :sswitch_data_0

    .line 209
    const/4 v1, 0x0

    return v1

    .line 203
    :sswitch_0
    const/4 v1, 0x1

    return v1

    .line 205
    :sswitch_1
    const/4 v1, 0x2

    return v1

    .line 207
    :sswitch_2
    const/4 v1, 0x3

    return v1

    .line 201
    nop

    :sswitch_data_0
    .sparse-switch
        0x5a -> :sswitch_0
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_2
    .end sparse-switch
.end method

.method private hasSticker()Z
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private initBeauty()V
    .locals 4

    .prologue
    .line 250
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    iget v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mPreviewWidth:I

    iget v3, p0, Lcom/android/camera/effect/renders/StickerRender;->mPreviewHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->createInstance(II)I

    move-result v0

    .line 251
    .local v0, "result":I
    new-instance v1, Lcom/android/camera/sticker/beautyprocessor/StickerBeautyProcessor;

    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    invoke-direct {v1, v2}, Lcom/android/camera/sticker/beautyprocessor/StickerBeautyProcessor;-><init>(Lcom/sensetime/stmobile/STBeautifyNative;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 252
    sget-object v1, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "initBeautify: result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    if-nez v0, :cond_0

    .line 254
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v2, 0x1

    const v3, 0x3eb851ec    # 0.36f

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 255
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v2, 0x3

    const v3, 0x3f3d70a4    # 0.74f

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 256
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v2, 0x4

    const v3, 0x3ca3d70a    # 0.02f

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 257
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v2, 0x5

    const v3, 0x3e051eb8    # 0.13f

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 258
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v2, 0x6

    const v3, 0x3de147ae    # 0.11f

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 259
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    const/4 v2, 0x7

    const v3, 0x3dcccccd    # 0.1f

    invoke-virtual {v1, v2, v3}, Lcom/sensetime/stmobile/STBeautifyNative;->setParam(IF)I

    .line 261
    :cond_0
    return-void
.end method

.method private initHumanAction()V
    .locals 2

    .prologue
    .line 222
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/camera/effect/renders/StickerRender$1;

    invoke-direct {v1, p0}, Lcom/android/camera/effect/renders/StickerRender$1;-><init>(Lcom/android/camera/effect/renders/StickerRender;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 241
    return-void
.end method

.method private initSticker()V
    .locals 4

    .prologue
    .line 244
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/sensetime/stmobile/STMobileStickerNative;->createInstance(Ljava/lang/String;)I

    move-result v0

    .line 245
    .local v0, "result":I
    sget-object v1, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "initSticker: result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    return-void
.end method

.method private onDestroy()V
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    invoke-virtual {v0}, Lcom/sensetime/stmobile/STMobileHumanActionNative;->destroyInstance()V

    .line 294
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    invoke-virtual {v0}, Lcom/sensetime/stmobile/STMobileStickerNative;->destroyInstance()V

    .line 295
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    invoke-virtual {v0}, Lcom/sensetime/stmobile/STBeautifyNative;->destroyBeautify()V

    .line 297
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->destroyGLResource()V

    .line 299
    return-void
.end method

.method private onInit()V
    .locals 4

    .prologue
    .line 264
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->initHumanAction()V

    .line 265
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->initBeauty()V

    .line 266
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->initSticker()V

    .line 267
    iget-object v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    monitor-enter v2

    .line 268
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionInitDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 270
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/effect/renders/StickerRender;->mHumanActionHandleLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 271
    :catch_0
    move-exception v0

    .line 272
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    sget-object v1, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    monitor-exit v2

    .line 277
    return-void

    .line 267
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private processTexture(IIII)I
    .locals 29
    .param p1, "textureId"    # I
    .param p2, "bufferId"    # I
    .param p3, "inputWidth"    # I
    .param p4, "inputHeight"    # I

    .prologue
    .line 91
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    if-nez v4, :cond_0

    .line 92
    const/4 v4, 0x1

    new-array v4, v4, [I

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    .line 93
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    const/16 v5, 0xde1

    move/from16 v0, p3

    move/from16 v1, p4

    invoke-static {v0, v1, v4, v5}, Lcom/android/camera/sticker/glutils/GlUtil;->initEffectTexture(II[II)I

    .line 96
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    if-nez v4, :cond_1

    .line 97
    const/4 v4, 0x1

    new-array v4, v4, [I

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    .line 98
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/16 v5, 0xde1

    move/from16 v0, p3

    move/from16 v1, p4

    invoke-static {v0, v1, v4, v5}, Lcom/android/camera/sticker/glutils/GlUtil;->initEffectTexture(II[II)I

    .line 102
    :cond_1
    const v4, 0x8d40

    move/from16 v0, p2

    invoke-static {v4, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 103
    const-string/jumbo v4, "glBindFramebuffer"

    invoke-static {v4}, Lcom/android/camera/sticker/glutils/GlUtil;->checkGlError(Ljava/lang/String;)V

    .line 106
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/renders/StickerRender;->getRGBABuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 105
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v8, 0x1908

    .line 106
    const/16 v9, 0x1401

    move/from16 v6, p3

    move/from16 v7, p4

    .line 105
    invoke-static/range {v4 .. v10}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 108
    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mParentFrameBufferId:I

    const v5, 0x8d40

    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 110
    const/16 v28, -0x1

    .line 111
    .local v28, "result":I
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    if-nez v4, :cond_2

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/effect/renders/StickerRender;->hasSticker()Z

    move-result v4

    if-eqz v4, :cond_6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_6

    .line 112
    :cond_2
    const/4 v13, 0x0

    .local v13, "arrayFaces":[Lcom/sensetime/stmobile/model/STMobile106;
    const/4 v15, 0x0

    .line 113
    .local v15, "arrayOutFaces":[Lcom/sensetime/stmobile/model/STMobile106;
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/effect/renders/StickerRender;->getRotateType()I

    move-result v8

    .line 115
    .local v8, "orientation":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mSTHumanActionNative:Lcom/sensetime/stmobile/STMobileHumanActionNative;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/camera/effect/renders/StickerRender;->mRGBABuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    .line 116
    const/4 v6, 0x6

    .line 117
    const v7, 0x7d83f

    move/from16 v9, p3

    move/from16 v10, p4

    .line 115
    invoke-virtual/range {v4 .. v10}, Lcom/sensetime/stmobile/STMobileHumanActionNative;->humanActionDetect([BIIIII)Lcom/sensetime/stmobile/STHumanAction;

    move-result-object v18

    .line 121
    .local v18, "humanAction":Lcom/sensetime/stmobile/STHumanAction;
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mNeedBeautify:Z

    if-eqz v4, :cond_5

    .line 122
    if-eqz v18, :cond_3

    .line 123
    invoke-virtual/range {v18 .. v18}, Lcom/sensetime/stmobile/STHumanAction;->getMobileFaces()[Lcom/sensetime/stmobile/model/STMobile106;

    move-result-object v13

    .line 124
    .local v13, "arrayFaces":[Lcom/sensetime/stmobile/model/STMobile106;
    if-eqz v13, :cond_3

    array-length v4, v13

    if-lez v4, :cond_3

    .line 125
    array-length v4, v13

    new-array v15, v4, [Lcom/sensetime/stmobile/model/STMobile106;

    .line 128
    .end local v13    # "arrayFaces":[Lcom/sensetime/stmobile/model/STMobile106;
    .end local v15    # "arrayOutFaces":[Lcom/sensetime/stmobile/model/STMobile106;
    :cond_3
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/camera/effect/renders/StickerRender;->mStBeautifyNative:Lcom/sensetime/stmobile/STBeautifyNative;

    .line 129
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    const/4 v5, 0x0

    aget v14, v4, v5

    move/from16 v10, p1

    move/from16 v11, p3

    move/from16 v12, p4

    .line 128
    invoke-virtual/range {v9 .. v15}, Lcom/sensetime/stmobile/STBeautifyNative;->processTexture(III[Lcom/sensetime/stmobile/model/STMobile106;I[Lcom/sensetime/stmobile/model/STMobile106;)I

    move-result v28

    .line 130
    if-nez v28, :cond_4

    .line 131
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mBeautifyTextureId:[I

    const/4 v5, 0x0

    aget p1, v4, v5

    .line 133
    :cond_4
    if-eqz v15, :cond_5

    array-length v4, v15

    if-eqz v4, :cond_5

    if-eqz v18, :cond_5

    .line 134
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Lcom/sensetime/stmobile/STHumanAction;->replaceMobile106([Lcom/sensetime/stmobile/model/STMobile106;)Z

    .line 140
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/effect/renders/StickerRender;->getFrameBufferCallback()Lcom/android/camera/effect/renders/Render$FrameBufferCallback;

    move-result-object v26

    .line 141
    .local v26, "callback":Lcom/android/camera/effect/renders/Render$FrameBufferCallback;
    if-eqz v26, :cond_7

    .line 142
    mul-int v4, p3, p4

    mul-int/lit8 v4, v4, 0x4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v27

    .line 144
    .local v27, "outBuf":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    move-object/from16 v16, v0

    .line 145
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v5, 0x0

    aget v23, v4, v5

    .line 146
    invoke-virtual/range {v27 .. v27}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v25

    .line 145
    const/16 v22, 0x0

    .line 146
    const/16 v24, 0x6

    move/from16 v17, p1

    move/from16 v19, v8

    move/from16 v20, p3

    move/from16 v21, p4

    .line 144
    invoke-virtual/range {v16 .. v25}, Lcom/sensetime/stmobile/STMobileStickerNative;->processTextureAndOutputBuffer(ILcom/sensetime/stmobile/STHumanAction;IIIZII[B)I

    move-result v28

    .line 148
    if-nez v28, :cond_6

    .line 149
    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/effect/renders/Render$FrameBufferCallback;->onFrameBuffer(Ljava/nio/ByteBuffer;II)V

    .line 159
    .end local v8    # "orientation":I
    .end local v18    # "humanAction":Lcom/sensetime/stmobile/STHumanAction;
    .end local v26    # "callback":Lcom/android/camera/effect/renders/Render$FrameBufferCallback;
    .end local v27    # "outBuf":Ljava/nio/ByteBuffer;
    :cond_6
    :goto_0
    if-nez v28, :cond_8

    .line 160
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v5, 0x0

    aget p1, v4, v5

    .line 164
    :goto_1
    return p1

    .line 153
    .restart local v8    # "orientation":I
    .restart local v18    # "humanAction":Lcom/sensetime/stmobile/STHumanAction;
    .restart local v26    # "callback":Lcom/android/camera/effect/renders/Render$FrameBufferCallback;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    move-object/from16 v16, v0

    .line 154
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v5, 0x0

    aget v23, v4, v5

    const/16 v22, 0x0

    move/from16 v17, p1

    move/from16 v19, v8

    move/from16 v20, p3

    move/from16 v21, p4

    .line 153
    invoke-virtual/range {v16 .. v23}, Lcom/sensetime/stmobile/STMobileStickerNative;->processTexture(ILcom/sensetime/stmobile/STHumanAction;IIIZI)I

    move-result v28

    goto :goto_0

    .line 162
    .end local v8    # "orientation":I
    .end local v18    # "humanAction":Lcom/sensetime/stmobile/STHumanAction;
    .end local v26    # "callback":Lcom/android/camera/effect/renders/Render$FrameBufferCallback;
    :cond_8
    sget-object v4, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "processTexture: result="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v28

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " outTexId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/camera/effect/renders/StickerRender;->mTextureOutId:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method protected drawTexture(IFFFFZ)V
    .locals 7
    .param p1, "textureId"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "w"    # F
    .param p5, "h"    # F
    .param p6, "isSnapShot"    # Z

    .prologue
    .line 85
    iget v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferId:I

    iget v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    iget v3, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    invoke-direct {p0, p1, v0, v2, v3}, Lcom/android/camera/effect/renders/StickerRender;->processTexture(IIII)I

    move-result v1

    .local v1, "texId":I
    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 86
    invoke-super/range {v0 .. v6}, Lcom/android/camera/effect/renders/PixelEffectRender;->drawTexture(IFFFFZ)V

    .line 88
    return-void
.end method

.method protected drawTexture(Lcom/android/gallery3d/ui/BasicTexture;FFFFZ)V
    .locals 7
    .param p1, "texture"    # Lcom/android/gallery3d/ui/BasicTexture;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "w"    # F
    .param p5, "h"    # F
    .param p6, "isSnapShot"    # Z

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-virtual {p1, v0}, Lcom/android/gallery3d/ui/BasicTexture;->onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    sget-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "drawTexture: fail to bind texture "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    return-void

    .line 75
    :cond_0
    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result v0

    iget v2, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferId:I

    .line 76
    iget v3, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    iget v4, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    .line 75
    invoke-direct {p0, v0, v2, v3, v4}, Lcom/android/camera/effect/renders/StickerRender;->processTexture(IIII)I

    move-result v1

    .local v1, "texId":I
    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 77
    invoke-super/range {v0 .. v6}, Lcom/android/camera/effect/renders/PixelEffectRender;->drawTexture(IFFFFZ)V

    .line 79
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->onDestroy()V

    .line 61
    invoke-super {p0}, Lcom/android/camera/effect/renders/PixelEffectRender;->finalize()V

    .line 62
    return-void
.end method

.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const-string/jumbo v0, "uniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvoid main() \n{ \n    gl_FragColor = texture2D(sTexture, vTexCoord); \n}"

    return-object v0
.end method

.method public getMakeupProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
    .locals 1

    .prologue
    .line 302
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    return-object v0
.end method

.method public setPreviousFrameBufferInfo(III)V
    .locals 1
    .param p1, "bufId"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    .line 170
    iput p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferId:I

    .line 171
    iget v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    if-eq v0, p3, :cond_1

    .line 172
    :cond_0
    iput p2, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferWidth:I

    .line 173
    iput p3, p0, Lcom/android/camera/effect/renders/StickerRender;->mFrameBufferHeight:I

    .line 174
    invoke-direct {p0}, Lcom/android/camera/effect/renders/StickerRender;->destroyGLResource()V

    .line 176
    :cond_1
    return-void
.end method

.method public setSticker(Ljava/lang/String;)V
    .locals 3
    .param p1, "newSticker"    # Ljava/lang/String;

    .prologue
    .line 179
    sget-object v0, Lcom/android/camera/effect/renders/StickerRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setSticker: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/android/camera/effect/renders/StickerRender;->mStStickerNative:Lcom/sensetime/stmobile/STMobileStickerNative;

    invoke-virtual {v0, p1}, Lcom/sensetime/stmobile/STMobileStickerNative;->changeSticker(Ljava/lang/String;)I

    .line 183
    :cond_0
    iput-object p1, p0, Lcom/android/camera/effect/renders/StickerRender;->mCurrentSticker:Ljava/lang/String;

    .line 184
    return-void
.end method
