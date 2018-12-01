.class public abstract Lcom/android/camera/SurfaceTextureScreenNail;
.super Ljava/lang/Object;
.source "SurfaceTextureScreenNail.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# static fields
.field private static final MOVIE_SOLID_CROPPED_X:F

.field private static final MOVIE_SOLID_CROPPED_Y:F

.field private static sFrameListener:Landroid/os/HandlerThread;

.field private static sMaxHighPriorityFrameCount:I


# instance fields
.field private currentFrameCount:I

.field protected mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

.field protected mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

.field private mCameraHeight:I

.field private mCameraWidth:I

.field protected mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field protected mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

.field private mDisplayOrientation:I

.field private mDrawAttribute:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

.field protected mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

.field protected mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field private mHasTexture:Z

.field private mHeight:I

.field private mIsFullScreen:Z

.field private mIsRatio16_9:Z

.field protected mModuleSwitching:Z

.field private mNeedCropped:Z

.field private mRenderHeight:I

.field protected mRenderLayoutRect:Landroid/graphics/Rect;

.field private mRenderOffsetX:I

.field private mRenderOffsetY:I

.field private mRenderWidth:I

.field private mScaleX:F

.field private mScaleY:F

.field protected mSkipFirstFrame:Z

.field protected mSurfaceHeight:I

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field protected mSurfaceWidth:I

.field private mTargetRatio:I

.field protected mTheight:I

.field private mTransform:[F

.field protected mTwidth:I

.field protected mTx:I

.field protected mTy:I

.field private mUncroppedRenderHeight:I

.field private mUncroppedRenderWidth:I

.field private mVideoEncoder:Lcom/android/camera/module/encoder/MediaVideoEncoder;

.field private mVideoStabilizationCropped:Z

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const v1, 0x3f666666    # 0.9f

    const v2, 0x3f4ccccd    # 0.8f

    .line 47
    invoke-static {}, Lcom/android/camera/Device;->isNvPlatform()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    sput v0, Lcom/android/camera/SurfaceTextureScreenNail;->MOVIE_SOLID_CROPPED_X:F

    .line 48
    invoke-static {}, Lcom/android/camera/Device;->isNvPlatform()Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    sput v1, Lcom/android/camera/SurfaceTextureScreenNail;->MOVIE_SOLID_CROPPED_Y:F

    .line 78
    const/16 v0, 0x8

    sput v0, Lcom/android/camera/SurfaceTextureScreenNail;->sMaxHighPriorityFrameCount:I

    .line 80
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "FrameListener"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    .line 44
    return-void

    :cond_0
    move v0, v2

    .line 47
    goto :goto_0

    :cond_1
    move v1, v2

    .line 48
    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderLayoutRect:Landroid/graphics/Rect;

    .line 69
    const/16 v0, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTransform:[F

    .line 70
    iput-boolean v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHasTexture:Z

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsRatio16_9:Z

    .line 73
    iput v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 74
    iput v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    .line 79
    iput v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    .line 81
    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    invoke-direct {v0}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>()V

    iput-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mDrawAttribute:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .line 84
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTargetRatio:I

    .line 90
    return-void
.end method

.method private checkThreadPriority()V
    .locals 2

    .prologue
    .line 195
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    sget v1, Lcom/android/camera/SurfaceTextureScreenNail;->sMaxHighPriorityFrameCount:I

    if-ne v0, v1, :cond_1

    .line 196
    const-string/jumbo v0, "STScreenNail"

    const-string/jumbo v1, "normalHandlerCapacity:set normal"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    sget-object v0, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/Process;->setThreadPriority(II)V

    .line 198
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 199
    :cond_1
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    sget v1, Lcom/android/camera/SurfaceTextureScreenNail;->sMaxHighPriorityFrameCount:I

    if-ge v0, v1, :cond_0

    .line 200
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I

    goto :goto_0
.end method

.method private computeRatio()V
    .locals 13

    .prologue
    const/high16 v12, 0x41100000    # 9.0f

    const/high16 v11, 0x3f400000    # 0.75f

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 236
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    invoke-static {v6, v7}, Lcom/android/camera/CameraSettings;->getStrictAspectRatio(II)I

    move-result v6

    const/4 v7, -0x1

    if-gt v6, v7, :cond_0

    .line 237
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    iget v8, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    iget v9, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    invoke-static {v6, v7, v8, v9}, Lcom/android/camera/CameraSettings;->isNearAspectRatio(IIII)Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    .line 236
    if-eqz v6, :cond_8

    .line 238
    :cond_0
    iget v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    .line 239
    .local v3, "width":I
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    .line 240
    .local v0, "height":I
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTargetRatio:I

    packed-switch v6, :pswitch_data_0

    .line 312
    :cond_1
    :goto_0
    iput v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    .line 313
    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    .line 340
    .end local v0    # "height":I
    .end local v3    # "width":I
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->updateRenderSize()V

    .line 341
    invoke-virtual {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->updateRenderRect()V

    .line 342
    return-void

    .line 242
    .restart local v0    # "height":I
    .restart local v3    # "width":I
    :pswitch_0
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsRatio16_9:Z

    .line 243
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    .line 244
    invoke-static {v3, v0}, Lcom/android/camera/CameraSettings;->isAspectRatio16_9(II)Z

    move-result v6

    if-nez v6, :cond_4

    .line 245
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 246
    mul-int/lit8 v6, v3, 0x10

    mul-int/lit8 v7, v0, 0x9

    if-le v6, v7, :cond_3

    .line 247
    move v2, v3

    .line 248
    .local v2, "oldWidth":I
    int-to-float v6, v0

    mul-float/2addr v6, v12

    const/high16 v7, 0x41800000    # 16.0f

    div-float/2addr v6, v7

    float-to-int v3, v6

    .line 249
    int-to-float v6, v3

    int-to-float v7, v2

    div-float/2addr v6, v7

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 260
    .end local v2    # "oldWidth":I
    :goto_2
    invoke-static {}, Lcom/android/camera/Device;->isPad()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 261
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsRatio16_9:Z

    .line 262
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 263
    int-to-float v4, v0

    mul-float/2addr v4, v11

    float-to-int v0, v4

    .line 264
    iget v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    mul-float/2addr v4, v11

    iput v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto :goto_0

    .line 251
    :cond_3
    move v1, v0

    .line 252
    .local v1, "oldHeight":I
    int-to-float v6, v3

    const/high16 v7, 0x41800000    # 16.0f

    mul-float/2addr v6, v7

    div-float/2addr v6, v12

    float-to-int v0, v6

    .line 253
    int-to-float v6, v0

    int-to-float v7, v1

    div-float/2addr v6, v7

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto :goto_2

    .line 256
    .end local v1    # "oldHeight":I
    :cond_4
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 257
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 258
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto :goto_2

    .line 268
    :pswitch_1
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    .line 269
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsRatio16_9:Z

    .line 270
    invoke-static {v3, v0}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v6

    if-nez v6, :cond_7

    .line 271
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 272
    mul-int/lit8 v5, v3, 0x4

    mul-int/lit8 v6, v0, 0x3

    if-le v5, v6, :cond_6

    .line 273
    move v2, v3

    .line 274
    .restart local v2    # "oldWidth":I
    int-to-float v5, v0

    mul-float/2addr v5, v11

    float-to-int v3, v5

    .line 275
    int-to-float v5, v3

    int-to-float v6, v2

    div-float/2addr v5, v6

    iput v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 287
    .end local v2    # "oldWidth":I
    :goto_3
    sget-boolean v5, Lcom/android/camera/CameraSettings;->sCroppedIfNeeded:Z

    if-eqz v5, :cond_5

    .line 288
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    .line 289
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 290
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsRatio16_9:Z

    .line 291
    int-to-float v5, v3

    const/high16 v6, 0x41800000    # 16.0f

    mul-float/2addr v5, v6

    div-float/2addr v5, v12

    float-to-int v0, v5

    .line 292
    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    mul-float/2addr v5, v11

    iput v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 295
    :cond_5
    invoke-static {}, Lcom/android/camera/Device;->isPad()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 296
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    goto/16 :goto_0

    .line 277
    :cond_6
    move v1, v0

    .line 278
    .restart local v1    # "oldHeight":I
    int-to-float v5, v3

    const/high16 v6, 0x40800000    # 4.0f

    mul-float/2addr v5, v6

    const/high16 v6, 0x40400000    # 3.0f

    div-float/2addr v5, v6

    float-to-int v0, v5

    .line 279
    int-to-float v5, v0

    int-to-float v6, v1

    div-float/2addr v5, v6

    iput v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto :goto_3

    .line 282
    .end local v1    # "oldHeight":I
    :cond_7
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 283
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 284
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto :goto_3

    .line 300
    :pswitch_2
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    .line 301
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsRatio16_9:Z

    .line 302
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 303
    if-eq v3, v0, :cond_1

    .line 304
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 305
    move v1, v0

    .line 306
    .restart local v1    # "oldHeight":I
    move v0, v3

    .line 307
    int-to-float v4, v3

    int-to-float v5, v1

    div-float/2addr v4, v5

    iput v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto/16 :goto_0

    .line 315
    .end local v0    # "height":I
    .end local v1    # "oldHeight":I
    .end local v3    # "width":I
    :cond_8
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    if-eqz v6, :cond_2

    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    if-eqz v6, :cond_2

    .line 316
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    if-eqz v6, :cond_a

    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    if-eqz v6, :cond_a

    .line 317
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    mul-int/2addr v6, v7

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    iget v8, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    mul-int/2addr v7, v8

    if-eq v6, v7, :cond_a

    .line 318
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 319
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    mul-int/2addr v6, v7

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    iget v8, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    mul-int/2addr v7, v8

    if-le v6, v7, :cond_9

    .line 320
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    .line 321
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    mul-int/2addr v6, v7

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    div-int/2addr v6, v7

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    .line 322
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    int-to-float v6, v6

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 323
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    .line 337
    :goto_4
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    int-to-float v6, v6

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    sget v7, Lcom/android/camera/Util;->sWindowHeight:I

    int-to-float v7, v7

    sget v8, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v8, v8

    div-float/2addr v7, v8

    sub-float/2addr v6, v7

    const v7, 0x3dcccccd    # 0.1f

    cmpg-float v6, v6, v7

    if-gez v6, :cond_b

    :goto_5
    iput-boolean v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    goto/16 :goto_1

    .line 325
    :cond_9
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    .line 326
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    mul-int/2addr v6, v7

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    div-int/2addr v6, v7

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    .line 327
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 328
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    int-to-float v6, v6

    iget v7, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    goto :goto_4

    .line 331
    :cond_a
    iput-boolean v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    .line 332
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    .line 333
    iput v10, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    .line 334
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    .line 335
    iget v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    iput v6, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    goto :goto_4

    :cond_b
    move v4, v5

    .line 337
    goto :goto_5

    .line 240
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private initializeTexture()V
    .locals 7

    .prologue
    const/16 v6, 0x15

    .line 120
    invoke-static {}, Lcom/android/camera/Device;->isSubThreadFrameListener()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 121
    sget-object v3, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v3

    if-nez v3, :cond_0

    .line 122
    sget-object v3, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 125
    :cond_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v6, :cond_1

    .line 127
    :try_start_0
    const-class v3, Landroid/graphics/SurfaceTexture;

    .line 128
    const-string/jumbo v4, "(ILandroid/os/Looper;)V"

    .line 127
    invoke-static {v3, v4}, Lmiui/reflect/Constructor;->of(Ljava/lang/Class;Ljava/lang/String;)Lmiui/reflect/Constructor;

    move-result-object v0

    .line 129
    .local v0, "con":Lmiui/reflect/Constructor;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/ExtTexture;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {v0, v3}, Lmiui/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/SurfaceTexture;

    iput-object v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 132
    const-string/jumbo v3, "STScreenNail"

    const-string/jumbo v4, "fullHandlerCapacity:set urgent display"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    sget-object v3, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getThreadId()I

    move-result v3

    const/4 v4, -0x8

    invoke-static {v3, v4}, Landroid/os/Process;->setThreadPriority(II)V

    .line 134
    const/4 v3, 0x0

    iput v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->currentFrameCount:I
    :try_end_0
    .catch Lmiui/reflect/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    .end local v0    # "con":Lmiui/reflect/Constructor;
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-nez v3, :cond_2

    .line 143
    new-instance v3, Landroid/graphics/SurfaceTexture;

    iget-object v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/ExtTexture;->getId()I

    move-result v4

    invoke-direct {v3, v4}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 146
    :cond_2
    const-string/jumbo v3, "STScreenNail"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "setDefaultBufferSize: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iget v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    invoke-virtual {v3, v4, v5}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 151
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_3

    .line 152
    invoke-static {}, Lcom/android/camera/Device;->isSubThreadFrameListener()Z

    move-result v3

    .line 151
    if-eqz v3, :cond_3

    .line 153
    iget-object v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 154
    new-instance v4, Landroid/os/Handler;

    sget-object v5, Lcom/android/camera/SurfaceTextureScreenNail;->sFrameListener:Landroid/os/HandlerThread;

    invoke-virtual {v5}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 153
    invoke-static {v3, p0, v4}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setSurfaceTextureOnFrameAvailableListener(Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 158
    :goto_1
    return-void

    .line 137
    :catch_0
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string/jumbo v3, "STScreenNail"

    const-string/jumbo v4, "SurfaceTexture Constructor IllegalArgumentException"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 135
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v2

    .line 136
    .local v2, "e":Lmiui/reflect/NoSuchMethodException;
    const-string/jumbo v3, "STScreenNail"

    const-string/jumbo v4, "SurfaceTexture Constructor NoSuchMethodException"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 156
    .end local v2    # "e":Lmiui/reflect/NoSuchMethodException;
    :cond_3
    iget-object v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v3, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    goto :goto_1
.end method

.method private notifyVideoEncoder(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 1
    .param p1, "ext"    # Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    .prologue
    .line 427
    monitor-enter p0

    .line 428
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaVideoEncoder;

    if-eqz v0, :cond_0

    .line 430
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaVideoEncoder;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->frameAvailableSoon(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 433
    return-void

    .line 427
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private updateRenderSize()V
    .locals 2

    .prologue
    .line 354
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTargetRatio:I

    const/4 v1, 0x2

    if-eq v1, v0, :cond_0

    .line 355
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mUncroppedRenderWidth:I

    .line 356
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mUncroppedRenderHeight:I

    .line 362
    :goto_0
    return-void

    .line 359
    :cond_0
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mUncroppedRenderWidth:I

    .line 360
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mUncroppedRenderHeight:I

    goto :goto_0
.end method


# virtual methods
.method public acquireSurfaceTexture()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x2d0

    const/4 v3, 0x1

    .line 98
    monitor-enter p0

    .line 99
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHasTexture:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    .line 101
    return-void

    :cond_0
    monitor-exit p0

    .line 104
    new-instance v0, Lcom/android/gallery3d/ui/ExtTexture;

    invoke-direct {v0}, Lcom/android/gallery3d/ui/ExtTexture;-><init>()V

    iput-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    .line 105
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/gallery3d/ui/ExtTexture;->setSize(II)V

    .line 106
    invoke-direct {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->initializeTexture()V

    .line 107
    new-instance v0, Lcom/android/gallery3d/ui/RawTexture;

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    div-int/lit8 v1, v1, 0x4

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    div-int/lit8 v2, v2, 0x4

    invoke-direct {v0, v1, v2, v3}, Lcom/android/gallery3d/ui/RawTexture;-><init>(IIZ)V

    iput-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    .line 108
    new-instance v0, Lcom/android/gallery3d/ui/RawTexture;

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    mul-int/lit16 v1, v1, 0x2d0

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    div-int/2addr v1, v2

    invoke-direct {v0, v4, v1, v3}, Lcom/android/gallery3d/ui/RawTexture;-><init>(IIZ)V

    iput-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    .line 109
    iput-object v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 110
    iput-object v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 111
    monitor-enter p0

    .line 112
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHasTexture:Z

    .line 113
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mModuleSwitching:Z

    .line 114
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSkipFirstFrame:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit p0

    .line 116
    return-void

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 111
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 6
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;

    .prologue
    const/4 v2, 0x0

    .line 383
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSkipFirstFrame:Z

    if-eqz v0, :cond_1

    .line 384
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSkipFirstFrame:Z

    if-eqz v0, :cond_0

    .line 385
    iput-boolean v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSkipFirstFrame:Z

    .line 386
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 388
    :cond_0
    return-void

    .line 391
    :cond_1
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->clearBuffer()V

    .line 392
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mIsFullScreen:Z

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/Device;->is18x9RatioScreen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_2

    .line 393
    iget v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceHeight:I

    move-object v0, p0

    move-object v1, p1

    move v3, v2

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    .line 397
    :goto_0
    return-void

    .line 395
    :cond_2
    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTx:I

    iget v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTy:I

    iget v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTwidth:I

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTheight:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    goto :goto_0
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 7
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 401
    monitor-enter p0

    .line 402
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHasTexture:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    .line 403
    return-void

    .line 405
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/android/camera/Device;->isSubThreadFrameListener()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 406
    invoke-direct {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->checkThreadPriority()V

    .line 410
    :cond_1
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    invoke-interface {p1, v0, v1}, Lcom/android/gallery3d/ui/GLCanvas;->setPreviewSize(II)V

    .line 411
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 412
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTransform:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 413
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 414
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTransform:[F

    invoke-virtual {p0, v0}, Lcom/android/camera/SurfaceTextureScreenNail;->updateTransformMatrix([F)V

    .line 416
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTransform:[F

    invoke-virtual {p0, v0}, Lcom/android/camera/SurfaceTextureScreenNail;->updateExtraTransformMatrix([F)V

    .line 418
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mDrawAttribute:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTransform:[F

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->init(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    .line 419
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 420
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mDrawAttribute:Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    invoke-direct {p0, v0}, Lcom/android/camera/SurfaceTextureScreenNail;->notifyVideoEncoder(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    .line 422
    :cond_2
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    .line 424
    return-void

    .line 401
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getExtTexture()Lcom/android/gallery3d/ui/ExtTexture;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 379
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHeight:I

    return v0
.end method

.method public getRenderHeight()I
    .locals 1

    .prologue
    .line 369
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mUncroppedRenderHeight:I

    return v0
.end method

.method public getRenderTargetRatio()I
    .locals 1

    .prologue
    .line 205
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTargetRatio:I

    return v0
.end method

.method public getRenderWidth()I
    .locals 1

    .prologue
    .line 365
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mUncroppedRenderWidth:I

    return v0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 374
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mWidth:I

    return v0
.end method

.method public abstract onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
.end method

.method public abstract releaseBitmapIfNeeded()V
.end method

.method public releaseSurfaceTexture()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 169
    monitor-enter p0

    .line 170
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mHasTexture:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 172
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/ExtTexture;->recycle()V

    .line 174
    iput-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_1

    .line 177
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 178
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 179
    iput-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-eqz v0, :cond_2

    .line 182
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/RawTexture;->recycle()V

    .line 183
    iput-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    .line 185
    :cond_2
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-eqz v0, :cond_3

    .line 186
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/RawTexture;->recycle()V

    .line 187
    iput-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    .line 189
    :cond_3
    iput-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 190
    iput-object v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 191
    invoke-virtual {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->releaseBitmapIfNeeded()V

    .line 192
    return-void

    .line 169
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setDisplayOrientation(I)V
    .locals 0
    .param p1, "displayOrientation"    # I

    .prologue
    .line 227
    iput p1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mDisplayOrientation:I

    .line 228
    return-void
.end method

.method public setPreviewSize(II)V
    .locals 3
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    .line 209
    if-le p1, p2, :cond_1

    .line 210
    iput p2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    .line 211
    iput p1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    .line 217
    :goto_0
    invoke-static {p1, p2}, Lcom/android/camera/CameraSettings;->getRenderAspectRatio(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTargetRatio:I

    .line 218
    invoke-direct {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->computeRatio()V

    .line 220
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    .line 221
    const-string/jumbo v0, "STScreenNail"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setDefaultBufferSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 224
    :cond_0
    return-void

    .line 213
    :cond_1
    iput p1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraWidth:I

    .line 214
    iput p2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mCameraHeight:I

    goto :goto_0
.end method

.method public setRenderArea(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 345
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetX:I

    .line 346
    iget v0, p1, Landroid/graphics/Rect;->top:I

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetY:I

    .line 347
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    .line 348
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    .line 350
    invoke-direct {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->computeRatio()V

    .line 351
    return-void
.end method

.method public setVideoEncoder(Lcom/android/camera/module/encoder/MediaVideoEncoder;)V
    .locals 1
    .param p1, "encoder"    # Lcom/android/camera/module/encoder/MediaVideoEncoder;

    .prologue
    .line 436
    monitor-enter p0

    .line 437
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mVideoEncoder:Lcom/android/camera/module/encoder/MediaVideoEncoder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 439
    return-void

    .line 436
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setVideoStabilizationCropped(Z)V
    .locals 1
    .param p1, "cropped"    # Z

    .prologue
    .line 447
    invoke-static {}, Lcom/android/camera/Device;->isSupportedMovieSolid()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 448
    iput-boolean p1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mVideoStabilizationCropped:Z

    .line 452
    :goto_0
    return-void

    .line 450
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mVideoStabilizationCropped:Z

    goto :goto_0
.end method

.method protected updateExtraTransformMatrix([F)V
    .locals 0
    .param p1, "matrix"    # [F

    .prologue
    .line 486
    return-void
.end method

.method protected updateRenderRect()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 489
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTargetRatio:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 490
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTx:I

    .line 491
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceHeight:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    sub-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x2

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    if-nez v2, :cond_1

    :goto_1
    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTy:I

    .line 492
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTwidth:I

    .line 493
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTheight:I

    .line 494
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderLayoutRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetX:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    iget v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetY:I

    add-int/2addr v2, v3

    .line 495
    iget v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    iget v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetX:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetY:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    add-int/2addr v4, v5

    .line 494
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 503
    :goto_2
    return-void

    .line 490
    :cond_0
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetX:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    mul-int/2addr v0, v2

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    div-int/2addr v0, v2

    goto :goto_0

    .line 491
    :cond_1
    iget v1, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetY:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceHeight:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    div-int/2addr v1, v2

    goto :goto_1

    .line 497
    :cond_2
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    if-nez v0, :cond_3

    move v0, v1

    :goto_3
    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTx:I

    .line 498
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    if-nez v0, :cond_4

    move v0, v1

    :goto_4
    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTy:I

    .line 499
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTwidth:I

    .line 500
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceHeight:I

    iput v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mTheight:I

    .line 501
    iget-object v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderLayoutRect:Landroid/graphics/Rect;

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    iget v3, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_2

    .line 497
    :cond_3
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetX:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceWidth:I

    mul-int/2addr v0, v2

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderWidth:I

    div-int/2addr v0, v2

    goto :goto_3

    .line 498
    :cond_4
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderOffsetY:I

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mSurfaceHeight:I

    mul-int/2addr v0, v2

    iget v2, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mRenderHeight:I

    div-int/2addr v0, v2

    goto :goto_4
.end method

.method protected updateTransformMatrix([F)V
    .locals 10
    .param p1, "matrix"    # [F

    .prologue
    const/high16 v2, 0x3f000000    # 0.5f

    const/high16 v9, -0x41000000    # -0.5f

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 455
    const/high16 v7, 0x3f800000    # 1.0f

    .line 456
    .local v7, "scaleX":F
    const/high16 v8, 0x3f800000    # 1.0f

    .line 457
    .local v8, "scaleY":F
    const/4 v6, 0x0

    .line 458
    .local v6, "change":Z
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mVideoStabilizationCropped:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 459
    sget v0, Lcom/android/camera/SurfaceTextureScreenNail;->MOVIE_SOLID_CROPPED_X:F

    mul-float v7, v5, v0

    .line 460
    sget v0, Lcom/android/camera/SurfaceTextureScreenNail;->MOVIE_SOLID_CROPPED_Y:F

    mul-float v8, v5, v0

    .line 461
    const/4 v6, 0x1

    .line 463
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mNeedCropped:Z

    if-eqz v0, :cond_1

    .line 464
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleX:F

    mul-float/2addr v7, v0

    .line 465
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mScaleY:F

    mul-float/2addr v8, v0

    .line 466
    const/4 v6, 0x1

    .line 469
    :cond_1
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mDisplayOrientation:I

    if-eqz v0, :cond_2

    .line 470
    const/4 v6, 0x1

    .line 475
    :cond_2
    if-eqz v6, :cond_3

    .line 476
    invoke-static {p1, v1, v2, v2, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 477
    iget v0, p0, Lcom/android/camera/SurfaceTextureScreenNail;->mDisplayOrientation:I

    int-to-float v2, v0

    move-object v0, p1

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 478
    invoke-static {p1, v1, v7, v8, v5}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 479
    invoke-static {p1, v1, v9, v9, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 482
    :cond_3
    return-void
.end method
