.class public Lcom/android/camera/ui/CameraSnapView;
.super Landroid/view/View;
.source "CameraSnapView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/CameraSnapView$1;,
        Lcom/android/camera/ui/CameraSnapView$SnapListener;
    }
.end annotation


# instance fields
.field private cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

.field private mCurrentMode:I

.field private mExtraBitmap:Landroid/graphics/Bitmap;

.field private mExtraBitmapMatrix:Landroid/graphics/Matrix;

.field private mExtraBitmapPaint:Landroid/graphics/Paint;

.field private mHandler:Landroid/os/Handler;

.field private mHeight:I

.field private mMissTaken:Z

.field private mPressDownTime:J

.field private mPressUpTime:J

.field private mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

.field private mWidth:I


# direct methods
.method static synthetic -get0(Lcom/android/camera/ui/CameraSnapView;)Lcom/android/camera/ui/CameraSnapView$SnapListener;
    .locals 1
    .param p0, "-this"    # Lcom/android/camera/ui/CameraSnapView;

    .prologue
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

    return-object v0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 58
    new-instance v0, Lcom/android/camera/ui/CameraSnapView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/CameraSnapView$1;-><init>(Lcom/android/camera/ui/CameraSnapView;)V

    iput-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    .line 118
    invoke-direct {p0}, Lcom/android/camera/ui/CameraSnapView;->initView()V

    .line 119
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    new-instance v0, Lcom/android/camera/ui/CameraSnapView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/CameraSnapView$1;-><init>(Lcom/android/camera/ui/CameraSnapView;)V

    iput-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    .line 123
    invoke-direct {p0}, Lcom/android/camera/ui/CameraSnapView;->initView()V

    .line 124
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 127
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    new-instance v0, Lcom/android/camera/ui/CameraSnapView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/CameraSnapView$1;-><init>(Lcom/android/camera/ui/CameraSnapView;)V

    iput-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    .line 128
    invoke-direct {p0}, Lcom/android/camera/ui/CameraSnapView;->initView()V

    .line 129
    return-void
.end method

.method private inRegion(II)Z
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 352
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 353
    .local v0, "tempRect":Landroid/graphics/Rect;
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/CameraSnapView;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 354
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    return v1
.end method

.method private initView()V
    .locals 0

    .prologue
    .line 151
    return-void
.end method

.method private recycleBitmap()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 394
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 395
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 396
    iput-object v1, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmap:Landroid/graphics/Bitmap;

    .line 398
    :cond_0
    return-void
.end method

.method private setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 10
    .param p1, "baseBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v9, 0x1

    const/high16 v8, 0x40000000    # 2.0f

    const/high16 v6, 0x3f400000    # 0.75f

    .line 155
    iput-object p1, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmap:Landroid/graphics/Bitmap;

    .line 157
    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float v4, v5, v6

    .line 158
    .local v4, "selfWidth":F
    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float v3, v5, v6

    .line 160
    .local v3, "selfHeight":F
    div-float v2, v4, v3

    .line 161
    .local v2, "grid_scale":F
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float v1, v5, v6

    .line 163
    .local v1, "bitmap_scale":F
    const/high16 v0, 0x3f800000    # 1.0f

    .line 164
    .local v0, "baseScale":F
    cmpl-float v5, v2, v1

    if-lez v5, :cond_0

    .line 165
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float v0, v3, v5

    .line 170
    :goto_0
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    iput-object v5, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapMatrix:Landroid/graphics/Matrix;

    .line 171
    iget-object v5, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5, v0, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 172
    iget-object v5, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->getWidth()I

    move-result v6

    int-to-float v6, v6

    sub-float/2addr v6, v4

    div-float/2addr v6, v8

    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->getHeight()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v7, v3

    div-float/2addr v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 174
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    iput-object v5, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapPaint:Landroid/graphics/Paint;

    .line 175
    iget-object v5, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 176
    iget-object v5, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 177
    return-void

    .line 167
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v0, v4, v5

    goto :goto_0
.end method


# virtual methods
.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 243
    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->invalidate()V

    .line 244
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 384
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 385
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    if-eqz v0, :cond_0

    .line 386
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->cancelAnimation()V

    .line 387
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 390
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/CameraSnapView;->recycleBitmap()V

    .line 391
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 371
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 373
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    if-eqz v0, :cond_0

    .line 374
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 377
    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 378
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/CameraSnapView;->mExtraBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 380
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 133
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 144
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 135
    :pswitch_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/CameraSnapView;->mWidth:I

    .line 136
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/CameraSnapView;->mHeight:I

    .line 137
    iget v0, p0, Lcom/android/camera/ui/CameraSnapView;->mWidth:I

    iget v1, p0, Lcom/android/camera/ui/CameraSnapView;->mHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/ui/CameraSnapView;->setMeasuredDimension(II)V

    .line 139
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    iget v1, p0, Lcom/android/camera/ui/CameraSnapView;->mWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/ui/CameraSnapView;->mHeight:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->setWidthHeight(FF)V

    goto :goto_0

    .line 133
    :pswitch_data_0
    .packed-switch 0x40000000
        :pswitch_0
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const-wide/16 v12, 0x320

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 252
    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_0

    .line 253
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    return v4

    .line 256
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 348
    :goto_0
    :pswitch_0
    return v11

    .line 260
    :pswitch_1
    iget v4, p0, Lcom/android/camera/ui/CameraSnapView;->mCurrentMode:I

    packed-switch v4, :pswitch_data_1

    .line 274
    :pswitch_2
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

    invoke-interface {v4}, Lcom/android/camera/ui/CameraSnapView$SnapListener;->canSnap()Z

    move-result v4

    if-nez v4, :cond_2

    .line 275
    iget-boolean v4, p0, Lcom/android/camera/ui/CameraSnapView;->mMissTaken:Z

    if-nez v4, :cond_1

    .line 276
    iput-boolean v11, p0, Lcom/android/camera/ui/CameraSnapView;->mMissTaken:Z

    .line 277
    iget-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 278
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    sub-long/2addr v6, v8

    invoke-interface {v4, v6, v7}, Lcom/android/camera/ui/CameraSnapView$SnapListener;->onTrackSnapMissTaken(J)V

    .line 281
    :cond_1
    return v10

    .line 283
    :cond_2
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v4}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startScaleDownAnimation()V

    .line 287
    :pswitch_3
    iput-boolean v10, p0, Lcom/android/camera/ui/CameraSnapView;->mMissTaken:Z

    .line 288
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

    invoke-interface {v4}, Lcom/android/camera/ui/CameraSnapView$SnapListener;->onSnapPrepare()V

    .line 289
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressDownTime:J

    .line 290
    iget-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_3

    .line 291
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

    iget-wide v6, p0, Lcom/android/camera/ui/CameraSnapView;->mPressDownTime:J

    iget-wide v8, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    sub-long/2addr v6, v8

    invoke-interface {v4, v6, v7}, Lcom/android/camera/ui/CameraSnapView$SnapListener;->onTrackSnapTaken(J)V

    .line 293
    :cond_3
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x2

    invoke-virtual {v4, v5, v12, v13}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 298
    :pswitch_4
    return v10

    .line 301
    :pswitch_5
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v4, v8}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 303
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    .line 304
    iget-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    iget-wide v6, p0, Lcom/android/camera/ui/CameraSnapView;->mPressDownTime:J

    sub-long v2, v4, v6

    .line 306
    .local v2, "timeDiffer":J
    cmp-long v4, v2, v12

    if-gez v4, :cond_4

    .line 307
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    float-to-int v5, v5

    invoke-direct {p0, v4, v5}, Lcom/android/camera/ui/CameraSnapView;->inRegion(II)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 308
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v4, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 316
    .end local v2    # "timeDiffer":J
    :cond_4
    :pswitch_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    .line 317
    iget-wide v4, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    iget-wide v6, p0, Lcom/android/camera/ui/CameraSnapView;->mPressDownTime:J

    sub-long v2, v4, v6

    .line 318
    .restart local v2    # "timeDiffer":J
    cmp-long v4, v2, v12

    if-lez v4, :cond_5

    .line 319
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    float-to-int v5, v5

    invoke-direct {p0, v4, v5}, Lcom/android/camera/ui/CameraSnapView;->inRegion(II)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 320
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 326
    :cond_5
    :goto_1
    const-wide/16 v4, 0x78

    cmp-long v4, v2, v4

    if-lez v4, :cond_7

    const-wide/16 v0, 0x0

    .line 328
    .local v0, "animationDelayTime":J
    :goto_2
    iget v4, p0, Lcom/android/camera/ui/CameraSnapView;->mCurrentMode:I

    packed-switch v4, :pswitch_data_2

    .line 342
    :pswitch_7
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v4, v0, v1, v8}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startScaleUpAnimation(JLandroid/animation/Animator$AnimatorListener;)V

    goto/16 :goto_0

    .line 322
    .end local v0    # "animationDelayTime":J
    :cond_6
    iget-object v4, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1

    .line 326
    :cond_7
    const-wide/16 v4, 0x78

    sub-long v0, v4, v2

    .restart local v0    # "animationDelayTime":J
    goto :goto_2

    .line 256
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_6
    .end packed-switch

    .line 260
    :pswitch_data_1
    .packed-switch 0xa1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    .line 328
    :pswitch_data_2
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public pauseRecording()V
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->pauseRecording()V

    .line 235
    return-void
.end method

.method public performClick()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 402
    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 403
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    .line 404
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 405
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 406
    return v2

    .line 408
    :cond_0
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    return v0
.end method

.method public prepareRecording()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    iget v1, p0, Lcom/android/camera/ui/CameraSnapView;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->prepareRecording(I)V

    .line 231
    return-void
.end method

.method public resumeRecording()V
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->resumeRecording()V

    .line 239
    return-void
.end method

.method public setCurrentMode(IZ)V
    .locals 2
    .param p1, "currentMode"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 183
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/ui/CameraSnapView;->mPressUpTime:J

    .line 184
    iput p1, p0, Lcom/android/camera/ui/CameraSnapView;->mCurrentMode:I

    .line 190
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    if-nez v0, :cond_0

    .line 191
    new-instance v0, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    .line 192
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 193
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->initMode(I)V

    .line 202
    :goto_0
    return-void

    .line 195
    :cond_0
    if-eqz p2, :cond_1

    .line 196
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->initTargetValues(I)V

    .line 197
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startModeChangeAnimation()V

    goto :goto_0

    .line 199
    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->initMode(I)V

    goto :goto_0
.end method

.method public setSnapListener(Lcom/android/camera/ui/CameraSnapView$SnapListener;)V
    .locals 0
    .param p1, "snapListener"    # Lcom/android/camera/ui/CameraSnapView$SnapListener;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/android/camera/ui/CameraSnapView;->mSnapListener:Lcom/android/camera/ui/CameraSnapView$SnapListener;

    .line 109
    return-void
.end method

.method public startRing()V
    .locals 3

    .prologue
    .line 358
    invoke-virtual {p0}, Lcom/android/camera/ui/CameraSnapView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 359
    const v2, 0x7f02013b

    .line 358
    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 360
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-direct {p0, v0}, Lcom/android/camera/ui/CameraSnapView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 361
    iget-object v1, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startRingAnimation()V

    .line 362
    return-void
.end method

.method public stopRing()V
    .locals 1

    .prologue
    .line 365
    invoke-direct {p0}, Lcom/android/camera/ui/CameraSnapView;->recycleBitmap()V

    .line 366
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->stopRingAnimation()V

    .line 367
    return-void
.end method

.method public triggerAnimation(IZ)V
    .locals 1
    .param p1, "currentMode"    # I
    .param p2, "start"    # Z

    .prologue
    .line 205
    packed-switch p1, :pswitch_data_0

    .line 227
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 212
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    if-eqz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p2, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startRecordAnimation(ZI)V

    goto :goto_0

    .line 220
    :pswitch_2
    if-nez p2, :cond_0

    .line 221
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/android/camera/ui/CameraSnapView;->cameraSnapAnimateDrawable:Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;

    invoke-virtual {v0, p2, p1}, Lcom/android/camera/ui/drawable/snap/CameraSnapAnimateDrawable;->startRecordAnimation(ZI)V

    goto :goto_0

    .line 205
    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
