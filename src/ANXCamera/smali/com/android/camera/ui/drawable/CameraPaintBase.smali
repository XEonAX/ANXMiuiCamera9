.class public abstract Lcom/android/camera/ui/drawable/CameraPaintBase;
.super Ljava/lang/Object;
.source "CameraPaintBase.java"


# static fields
.field public static ALPHA_HINT:I

.field public static ALPHA_OPAQUE:I

.field public static ALPHA_OUTSTANDING:I


# instance fields
.field public isClockwise:Z

.field public isRecording:Z

.field public mBaseRadius:F

.field public mCurrentAlpha:I

.field public mCurrentColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public mCurrentStrokeWidth:F

.field public mCurrentWidthPercent:F

.field private mDstAlpha:I

.field private mDstColor:I

.field private mDstStrokeWidth:F

.field private mDstWidthPercent:F

.field public mMiddleX:F

.field public mMiddleY:F

.field public mPaint:Landroid/graphics/Paint;

.field public mSrcAlpha:I

.field public mSrcColor:I

.field public mSrcStrokeWidth:F

.field public mSrcWidthPercent:F

.field public needZero:Z

.field public timeAngle:F

.field public visible:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0xff

    .line 17
    const/16 v0, 0x66

    sput v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    .line 18
    sput v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    .line 19
    sput v1, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    .line 24
    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->needZero:Z

    .line 44
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    .line 65
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->initPaint(Landroid/content/Context;)V

    .line 66
    return-void
.end method


# virtual methods
.method protected abstract draw(Landroid/graphics/Canvas;)V
.end method

.method public drawCanvas(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->isHide()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    return-void

    .line 205
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->draw(Landroid/graphics/Canvas;)V

    .line 206
    return-void
.end method

.method public getVisible()I
    .locals 1

    .prologue
    .line 194
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->visible:I

    return v0
.end method

.method protected abstract initPaint(Landroid/content/Context;)V
.end method

.method protected isHide()Z
    .locals 2

    .prologue
    .line 198
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->visible:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public resetRecordingState()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->timeAngle:F

    .line 29
    iput-boolean v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isRecording:Z

    .line 31
    iput-boolean v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->needZero:Z

    .line 32
    return-void
.end method

.method public reverseClock()V
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    .line 36
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    if-eqz v0, :cond_0

    .line 37
    sget v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    .line 41
    :goto_0
    return-void

    .line 39
    :cond_0
    sget v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    goto :goto_0
.end method

.method public setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1
    .param p1, "currentAlpha"    # I

    .prologue
    .line 86
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    .line 87
    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 88
    return-object p0
.end method

.method public setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1
    .param p1, "currentColor"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    .line 81
    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    return-object p0
.end method

.method public setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 0
    .param p1, "currentWidthPercent"    # F

    .prologue
    .line 75
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    .line 76
    return-object p0
.end method

.method public setMiddle(FFF)V
    .locals 0
    .param p1, "middleX"    # F
    .param p2, "middleY"    # F
    .param p3, "maxRadius"    # F

    .prologue
    .line 69
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleX:F

    .line 70
    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleY:F

    .line 71
    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mBaseRadius:F

    .line 72
    return-void
.end method

.method public setResult()V
    .locals 2

    .prologue
    .line 174
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    .line 175
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    .line 176
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    .line 177
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    .line 179
    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 180
    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 181
    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 183
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    .line 184
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    .line 185
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    .line 186
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    .line 187
    return-void
.end method

.method public setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1
    .param p1, "dstAlpha"    # I

    .prologue
    .line 110
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    .line 111
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    .line 112
    return-object p0
.end method

.method public setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1
    .param p1, "dstColor"    # I

    .prologue
    .line 104
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    .line 105
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    .line 106
    return-object p0
.end method

.method public setTargetValues(FIIF)V
    .locals 1
    .param p1, "targetWidth"    # F
    .param p2, "targetColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p3, "targetAlpha"    # I
    .param p4, "targetStrokeWidth"    # F

    .prologue
    .line 133
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    .line 134
    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    .line 135
    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    .line 136
    iput p4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    .line 138
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    .line 139
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    .line 140
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    .line 141
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    .line 142
    return-void
.end method

.method public setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1
    .param p1, "dstWidthPercent"    # F

    .prologue
    .line 98
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    .line 99
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    .line 100
    return-object p0
.end method

.method public setVisible(I)V
    .locals 0
    .param p1, "visible"    # I

    .prologue
    .line 190
    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->visible:I

    .line 191
    return-void
.end method

.method public updateValue(F)V
    .locals 6
    .param p1, "interpolatorValue"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .prologue
    .line 145
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    sub-float v3, v4, v5

    .line 146
    .local v3, "widthDiffer":F
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    mul-float v5, v3, p1

    add-float/2addr v4, v5

    iput v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    .line 148
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    sub-float v2, v4, v5

    .line 149
    .local v2, "strokeWidthDiffer":F
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    mul-float v5, v2, p1

    add-float/2addr v4, v5

    iput v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    .line 150
    iget-object v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 152
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    if-eq v4, v5, :cond_0

    .line 154
    new-instance v1, Landroid/animation/ArgbEvaluator;

    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 156
    .local v1, "argbEvaluator":Landroid/animation/ArgbEvaluator;
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, p1, v4, v5}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    .line 157
    iget-object v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 160
    .end local v1    # "argbEvaluator":Landroid/animation/ArgbEvaluator;
    :cond_0
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    if-eq v4, v5, :cond_1

    .line 162
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    sub-int/2addr v4, v5

    int-to-float v0, v4

    .line 163
    .local v0, "alphaDiffer":F
    iget v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    int-to-float v4, v4

    mul-float v5, v0, p1

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iput v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    .line 164
    iget-object v4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 168
    .end local v0    # "alphaDiffer":F
    :cond_1
    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v4, p1, v4

    if-nez v4, :cond_2

    .line 169
    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setResult()V

    .line 171
    :cond_2
    return-void
.end method
