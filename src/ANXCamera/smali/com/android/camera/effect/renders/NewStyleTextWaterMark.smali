.class public Lcom/android/camera/effect/renders/NewStyleTextWaterMark;
.super Lcom/android/camera/effect/renders/WaterMark;
.source "NewStyleTextWaterMark.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCenterX:I

.field private mCenterY:I

.field private mCharMargin:I

.field private mHorizontalPadding:I

.field private mPadding:I

.field private mVerticalPadding:I

.field private mWaterHeight:I

.field private mWaterText:Ljava/lang/String;

.field private mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

.field private mWaterWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-class v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->TAG:Ljava/lang/String;

    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "orientation"    # I

    .prologue
    .line 27
    invoke-direct {p0, p2, p3, p4}, Lcom/android/camera/effect/renders/WaterMark;-><init>(III)V

    .line 29
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 30
    .local v1, "shotL":I
    int-to-float v2, v1

    const/high16 v3, 0x44870000    # 1080.0f

    div-float v0, v2, v3

    .line 32
    .local v0, "ratio":F
    iput-object p1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterText:Ljava/lang/String;

    .line 33
    iget-object v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterText:Ljava/lang/String;

    .line 34
    const v3, 0x41f0a2f9

    mul-float/2addr v3, v0

    const/4 v4, -0x1

    const/4 v5, 0x2

    .line 33
    invoke-static {v2, v3, v4, v5}, Lcom/android/gallery3d/ui/StringTexture;->newInstance(Ljava/lang/String;FII)Lcom/android/gallery3d/ui/StringTexture;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

    .line 37
    iget-object v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/BasicTexture;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    .line 38
    iget-object v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/BasicTexture;->getHeight()I

    move-result v2

    iput v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    .line 39
    float-to-double v2, v0

    const-wide v4, 0x4045d7efb3f3733bL    # 43.687002653

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPadding:I

    .line 40
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    int-to-float v2, v2

    const v3, 0x3e051eb8    # 0.13f

    mul-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCharMargin:I

    .line 42
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPadding:I

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mHorizontalPadding:I

    .line 43
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPadding:I

    iget v3, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCharMargin:I

    sub-int/2addr v2, v3

    and-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mVerticalPadding:I

    .line 45
    invoke-direct {p0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->calcCenterAxis()V

    .line 46
    sget-boolean v2, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v2, :cond_0

    .line 47
    invoke-direct {p0}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->print()V

    .line 49
    :cond_0
    return-void
.end method

.method private calcCenterAxis()V
    .locals 2

    .prologue
    .line 52
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mOrientation:I

    sparse-switch v0, :sswitch_data_0

    .line 70
    :goto_0
    return-void

    .line 54
    :sswitch_0
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mHorizontalPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterX:I

    .line 55
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mVerticalPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterY:I

    goto :goto_0

    .line 58
    :sswitch_1
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPictureWidth:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mVerticalPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterX:I

    .line 59
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mHorizontalPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterY:I

    goto :goto_0

    .line 62
    :sswitch_2
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mHorizontalPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterX:I

    .line 63
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mVerticalPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterY:I

    goto :goto_0

    .line 66
    :sswitch_3
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mVerticalPadding:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterX:I

    .line 67
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPictureHeight:I

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mHorizontalPadding:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterY:I

    goto :goto_0

    .line 52
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5a -> :sswitch_1
        0xb4 -> :sswitch_2
        0x10e -> :sswitch_3
    .end sparse-switch
.end method

.method private print()V
    .locals 3

    .prologue
    .line 98
    sget-object v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "WaterMark mPictureWidth="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 99
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPictureWidth:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 99
    const-string/jumbo v2, " mPictureHeight ="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 99
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPictureHeight:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 100
    const-string/jumbo v2, " mWaterText="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 100
    iget-object v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterText:Ljava/lang/String;

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 101
    const-string/jumbo v2, " mCenterX="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 101
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterX:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 101
    const-string/jumbo v2, " mCenterY="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 101
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterY:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 102
    const-string/jumbo v2, " mWaterWidth="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 102
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 102
    const-string/jumbo v2, " mWaterHeight="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 102
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 103
    const-string/jumbo v2, " mPadding="

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 103
    iget v2, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mPadding:I

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    return-void
.end method


# virtual methods
.method public getCenterX()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterX:I

    return v0
.end method

.method public getCenterY()I
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mCenterY:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 89
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterHeight:I

    return v0
.end method

.method public bridge synthetic getLeft()I
    .locals 1

    .prologue
    invoke-super {p0}, Lcom/android/camera/effect/renders/WaterMark;->getLeft()I

    move-result v0

    return v0
.end method

.method public getTexture()Lcom/android/gallery3d/ui/BasicTexture;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterTexture:Lcom/android/gallery3d/ui/BasicTexture;

    return-object v0
.end method

.method public bridge synthetic getTop()I
    .locals 1

    .prologue
    invoke-super {p0}, Lcom/android/camera/effect/renders/WaterMark;->getTop()I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;->mWaterWidth:I

    return v0
.end method
