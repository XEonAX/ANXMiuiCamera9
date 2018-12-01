.class Lcom/android/camera/effect/renders/ImageWaterMark;
.super Lcom/android/camera/effect/renders/WaterMark;
.source "ImageWaterMark.java"


# instance fields
.field private mCenterX:I

.field private mCenterY:I

.field private mHeight:I

.field private mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

.field private mPaddingX:I

.field private mPaddingY:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IIIFFF)V
    .locals 4
    .param p1, "image"    # Landroid/graphics/Bitmap;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "orientation"    # I
    .param p5, "sizeRatio"    # F
    .param p6, "paddingXRation"    # F
    .param p7, "padddingYRatio"    # F

    .prologue
    .line 19
    invoke-direct {p0, p2, p3, p4}, Lcom/android/camera/effect/renders/WaterMark;-><init>(III)V

    .line 21
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 22
    .local v1, "shotL":I
    int-to-float v2, v1

    const/high16 v3, 0x44870000    # 1080.0f

    div-float v0, v2, v3

    .line 23
    .local v0, "ratio":F
    mul-float v2, p5, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mHeight:I

    .line 24
    iget v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mHeight:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    mul-int/2addr v2, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    div-int/2addr v2, v3

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mWidth:I

    .line 25
    mul-float v2, p6, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    .line 26
    mul-float v2, p7, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    .line 28
    new-instance v2, Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {v2, p1}, Lcom/android/gallery3d/ui/BitmapTexture;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    .line 29
    iget-object v2, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/gallery3d/ui/BitmapTexture;->setOpaque(Z)V

    .line 30
    invoke-direct {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->calcCenterAxis()V

    .line 31
    return-void
.end method

.method private calcCenterAxis()V
    .locals 2

    .prologue
    .line 34
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mOrientation:I

    sparse-switch v0, :sswitch_data_0

    .line 52
    :goto_0
    return-void

    .line 36
    :sswitch_0
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    .line 37
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    .line 40
    :sswitch_1
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    .line 41
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    .line 44
    :sswitch_2
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    .line 45
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    .line 48
    :sswitch_3
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingY:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    .line 49
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mPaddingX:I

    invoke-virtual {p0}, Lcom/android/camera/effect/renders/ImageWaterMark;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    goto :goto_0

    .line 34
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5a -> :sswitch_1
        0xb4 -> :sswitch_2
        0x10e -> :sswitch_3
    .end sparse-switch
.end method


# virtual methods
.method public getCenterX()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterX:I

    return v0
.end method

.method public getCenterY()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mCenterY:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mHeight:I

    return v0
.end method

.method public getTexture()Lcom/android/gallery3d/ui/BasicTexture;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mImageTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/android/camera/effect/renders/ImageWaterMark;->mWidth:I

    return v0
.end method
