.class public Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;
.super Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.source "ExtraSlideZoomAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;


# static fields
.field private static final sTextActivatedColorState:[I

.field private static final sTextDefaultColorState:[I

.field private static sX:[F

.field private static sY:[F


# instance fields
.field private ENTRY_INDEX_TELE_REAL:I

.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mDotColorActivated:I

.field private mDotRadius:I

.field private mEnable:Z

.field private mEntries:[Ljava/lang/CharSequence;

.field private mEntryLayouts:[Landroid/text/StaticLayout;

.field private mEntryToZoomRatioSpline:Landroid/util/Spline;

.field private mLineColorDefault:I

.field private mLineDotYGap:I

.field private mLineHalfHeight:F

.field private mLineLineGap:I

.field private mLineTextGap:I

.field private mLineWidth:I

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field private mTextPaint:Landroid/text/TextPaint;

.field private mTextSize:I

.field private mXTextStyle:Landroid/text/style/TextAppearanceSpan;

.field private mZoomRatioMax:F

.field private mZoomRatioTele:I

.field private mZoomRatioToEntrySpline:Landroid/util/Spline;

.field private mZoomRatioWide:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0xa

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 58
    new-array v0, v3, [I

    const v1, 0x10102fe

    aput v1, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextActivatedColorState:[I

    .line 59
    new-array v0, v3, [I

    aput v2, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextDefaultColorState:[I

    .line 148
    new-array v0, v4, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sX:[F

    .line 149
    new-array v0, v4, [F

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sY:[F

    .line 33
    return-void

    .line 148
    :array_0
    .array-data 4
        0x0
        0x41200000    # 10.0f
        0x41400000    # 12.0f
        0x41a00000    # 20.0f
        0x41c80000    # 25.0f
        0x41d80000    # 27.0f
        0x41e80000    # 29.0f
        0x41f00000    # 30.0f
        0x42000000    # 32.0f
        0x420c0000    # 35.0f
    .end array-data

    .line 149
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
        0x400ccccd    # 2.2f
        0x406ccccd    # 3.7f
        0x40a33333    # 5.1f
        0x40b9999a    # 5.8f
        0x40d33333    # 6.6f
        0x40e00000    # 7.0f
        0x41000000    # 8.0f
        0x41200000    # 10.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p3, "currentMode"    # I
    .param p4, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 75
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;-><init>()V

    .line 40
    const/16 v2, 0xa

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->ENTRY_INDEX_TELE_REAL:I

    .line 78
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    .line 79
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentMode:I

    .line 80
    move-object/from16 v0, p4

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    .line 82
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentMode:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    move-object/from16 v2, p1

    .line 84
    check-cast v2, Lcom/android/camera/ActivityBase;

    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v13

    check-cast v13, Lcom/android/camera/module/BaseModule;

    .line 85
    .local v13, "module":Lcom/android/camera/module/BaseModule;
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    .line 86
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    .line 87
    invoke-virtual {v13}, Lcom/android/camera/module/BaseModule;->getZoomMaxRatio()F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioMax:F

    .line 89
    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sX:[F

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->convertSplineXToEntryX([F)[F

    move-result-object v14

    .line 90
    .local v14, "x":[F
    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sY:[F

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->convertSplineYToZoomRatioY([F)[F

    move-result-object v15

    .line 91
    .local v15, "y":[F
    invoke-static {v14, v15}, Landroid/util/Spline;->createMonotoneCubicSpline([F[F)Landroid/util/Spline;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryToZoomRatioSpline:Landroid/util/Spline;

    .line 92
    invoke-static {v15, v14}, Landroid/util/Spline;->createMonotoneCubicSpline([F[F)Landroid/util/Spline;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioToEntrySpline:Landroid/util/Spline;

    .line 94
    invoke-direct/range {p0 .. p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->initStyle(Landroid/content/Context;)V

    .line 97
    const/4 v2, 0x3

    new-array v11, v2, [Ljava/lang/CharSequence;

    .line 98
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getDisplayedZoomRatio(F)Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v11, v3

    .line 99
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getDisplayedZoomRatio(F)Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v11, v3

    .line 100
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioMax:F

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getDisplayedZoomRatio(F)Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v11, v3

    .line 102
    .local v11, "entries":[Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    .line 103
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    array-length v2, v2

    new-array v2, v2, [Landroid/text/StaticLayout;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    .line 104
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    array-length v2, v2

    if-ge v12, v2, :cond_0

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    move-object/from16 v17, v0

    new-instance v2, Landroid/text/StaticLayout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntries:[Ljava/lang/CharSequence;

    aget-object v3, v3, v12

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextPaint:Landroid/text/TextPaint;

    sget v5, Lcom/android/camera/Util;->sWindowWidth:I

    .line 106
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 105
    invoke-direct/range {v2 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    aput-object v2, v17, v12

    .line 104
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 109
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v10

    .line 110
    .local v10, "cc":Lcom/android/camera2/CameraCapabilities;
    invoke-virtual {v10}, Lcom/android/camera2/CameraCapabilities;->getZoomRatioTeleReal()I

    move-result v16

    .line 111
    .local v16, "zoomRatioTeleReal":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    mul-int/lit8 v2, v2, 0xa

    move/from16 v0, v16

    if-eq v0, v2, :cond_1

    .line 112
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    mul-int/lit8 v2, v2, 0xa

    move/from16 v0, v16

    if-le v0, v2, :cond_1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    mul-int/lit8 v2, v2, 0xa

    move/from16 v0, v16

    if-ge v0, v2, :cond_1

    .line 113
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioWide:I

    mul-int/lit8 v2, v2, 0xa

    sub-int v2, v16, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->ENTRY_INDEX_TELE_REAL:I

    .line 117
    :cond_1
    return-void
.end method

.method private convertSplineXToEntryX([F)[F
    .locals 6
    .param p1, "splineX"    # [F

    .prologue
    const/high16 v5, 0x41200000    # 10.0f

    .line 121
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aget v3, p1, v3

    sub-float/2addr v3, v5

    const/high16 v4, 0x3f800000    # 1.0f

    add-float/2addr v3, v4

    float-to-int v0, v3

    .line 122
    .local v0, "SPLINE_ENTRY_COUNT_2X_TO_MAX":I
    array-length v3, p1

    new-array v1, v3, [F

    .line 123
    .local v1, "entryX":[F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_1

    .line 124
    aget v3, p1, v2

    cmpg-float v3, v3, v5

    if-gtz v3, :cond_0

    .line 125
    aget v3, p1, v2

    aput v3, v1, v2

    .line 123
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 127
    :cond_0
    aget v3, p1, v2

    sub-float/2addr v3, v5

    add-int/lit8 v4, v0, -0x1

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 128
    const/high16 v4, 0x42140000    # 37.0f

    .line 127
    mul-float/2addr v3, v4

    add-float/2addr v3, v5

    aput v3, v1, v2

    goto :goto_1

    .line 131
    :cond_1
    return-object v1
.end method

.method private convertSplineYToZoomRatioY([F)[F
    .locals 6
    .param p1, "splineY"    # [F

    .prologue
    .line 135
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aget v3, p1, v3

    float-to-int v0, v3

    .line 136
    .local v0, "SPLINE_ZOOM_MAX":I
    array-length v3, p1

    new-array v2, v3, [F

    .line 137
    .local v2, "zoomRatioY":[F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p1

    if-ge v1, v3, :cond_1

    .line 138
    aget v3, p1, v1

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_0

    .line 139
    aget v3, p1, v1

    aput v3, v2, v1

    .line 137
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    :cond_0
    aget v3, p1, v1

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    sub-int v4, v0, v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 142
    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioMax:F

    iget v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    .line 141
    mul-float/2addr v3, v4

    .line 142
    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioTele:I

    int-to-float v4, v4

    .line 141
    add-float/2addr v3, v4

    aput v3, v2, v1

    goto :goto_1

    .line 145
    :cond_1
    return-object v2
.end method

.method private drawText(ILandroid/graphics/Canvas;)V
    .locals 4
    .param p1, "sectionIndex"    # I
    .param p2, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x0

    .line 204
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v1, v1, p1

    invoke-virtual {v1, v3}, Landroid/text/StaticLayout;->getLineAscent(I)I

    move-result v1

    .line 205
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v2, v2, p1

    invoke-virtual {v2, v3}, Landroid/text/StaticLayout;->getLineDescent(I)I

    move-result v2

    .line 204
    sub-int/2addr v1, v2

    int-to-float v0, v1

    .line 207
    .local v0, "height":F
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 208
    const/4 v1, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v0, v2

    invoke-virtual {p2, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 209
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    aget-object v1, v1, p1

    invoke-virtual {v1, p2}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 210
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 211
    return-void
.end method

.method private getDisplayedZoomRatio(F)Ljava/lang/CharSequence;
    .locals 4
    .param p1, "ratio"    # F

    .prologue
    const/16 v3, 0x21

    .line 183
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 185
    .local v0, "builder":Landroid/text/SpannableStringBuilder;
    float-to-int v1, p1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 187
    const-string/jumbo v1, "X"

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/Util;->appendInApi26(Landroid/text/SpannableStringBuilder;Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 189
    return-object v0
.end method

.method private indexToSection(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    const/4 v0, 0x0

    .line 193
    if-nez p1, :cond_0

    .line 194
    return v0

    .line 195
    :cond_0
    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 196
    const/4 v0, 0x1

    return v0

    .line 197
    :cond_1
    const/16 v0, 0x2f

    if-ne p1, v0, :cond_2

    .line 198
    const/4 v0, 0x2

    return v0

    .line 200
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method private initStyle(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 154
    const v3, 0x1010095

    const v4, 0x1010098

    filled-new-array {v3, v4}, [I

    move-result-object v2

    .line 155
    .local v2, "textAttrs":[I
    const v3, 0x7f11000e

    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 156
    .local v1, "style":Landroid/content/res/TypedArray;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextSize:I

    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextSize:I

    .line 157
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    .line 158
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 160
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 161
    .local v0, "resources":Landroid/content/res/Resources;
    const v3, 0x7f090014

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    .line 162
    const v3, 0x7f090015

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineWidth:I

    .line 163
    const v3, 0x7f090018

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotRadius:I

    .line 164
    const v3, 0x7f090016

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineLineGap:I

    .line 165
    const v3, 0x7f090017

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineTextGap:I

    .line 166
    const v3, 0x7f090019

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineDotYGap:I

    .line 167
    const v3, 0x7f0d0010

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineColorDefault:I

    .line 168
    const v3, 0x7f0d0011

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotColorActivated:I

    .line 170
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    .line 171
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 172
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineWidth:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 173
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextSize:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 174
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 176
    new-instance v3, Landroid/text/TextPaint;

    iget-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v3, v4}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextPaint:Landroid/text/TextPaint;

    .line 178
    new-instance v3, Landroid/text/style/TextAppearanceSpan;

    const v4, 0x7f110015

    invoke-direct {v3, p1, v4}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDigitsTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 179
    new-instance v3, Landroid/text/style/TextAppearanceSpan;

    const v4, 0x7f110016

    invoke-direct {v3, p1, v4}, Landroid/text/style/TextAppearanceSpan;-><init>(Landroid/content/Context;I)V

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mXTextStyle:Landroid/text/style/TextAppearanceSpan;

    .line 180
    return-void
.end method

.method private mapPositionToZoomRatio(F)F
    .locals 1
    .param p1, "position"    # F

    .prologue
    .line 290
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryToZoomRatioSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result v0

    return v0
.end method


# virtual methods
.method public draw(ILandroid/graphics/Canvas;Z)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "selected"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 215
    if-eqz p1, :cond_0

    const/16 v0, 0xa

    if-ne p1, v0, :cond_2

    .line 216
    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextPaint:Landroid/text/TextPaint;

    if-eqz p3, :cond_3

    .line 217
    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextActivatedColorState:[I

    .line 216
    :goto_0
    iput-object v0, v1, Landroid/text/TextPaint;->drawableState:[I

    .line 220
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->indexToSection(I)I

    move-result v0

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->drawText(ILandroid/graphics/Canvas;)V

    .line 232
    :cond_1
    :goto_1
    return-void

    .line 215
    :cond_2
    const/16 v0, 0x2f

    if-eq p1, v0, :cond_0

    .line 222
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_4

    .line 223
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v3, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextActivatedColorState:[I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 222
    :goto_2
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 225
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    neg-float v2, v0

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    iget-object v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    move-object v0, p2

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 227
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->ENTRY_INDEX_TELE_REAL:I

    if-ne p1, v0, :cond_1

    .line 228
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_5

    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotColorActivated:I

    :goto_3
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 229
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineHalfHeight:F

    neg-float v0, v0

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineDotYGap:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotRadius:I

    int-to-float v2, v2

    sub-float/2addr v0, v2

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mDotRadius:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 218
    :cond_3
    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->sTextDefaultColorState:[I

    goto :goto_0

    .line 224
    :cond_4
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineColorDefault:I

    goto :goto_2

    .line 228
    :cond_5
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineColorDefault:I

    goto :goto_3
.end method

.method public getAlign(I)Landroid/graphics/Paint$Align;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 254
    if-eqz p1, :cond_0

    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 255
    :cond_0
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    return-object v0

    .line 254
    :cond_1
    const/16 v0, 0x2f

    if-eq p1, v0, :cond_0

    .line 257
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 263
    const/16 v0, 0x30

    return v0
.end method

.method public mapZoomRatioToPosition(F)F
    .locals 1
    .param p1, "zoomRatio"    # F

    .prologue
    .line 286
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mZoomRatioToEntrySpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result v0

    return v0
.end method

.method public measureGap(I)F
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 245
    if-eqz p1, :cond_0

    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 246
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineTextGap:I

    int-to-float v0, v0

    return v0

    .line 245
    :cond_1
    const/16 v0, 0x2f

    if-eq p1, v0, :cond_0

    .line 248
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineLineGap:I

    int-to-float v0, v0

    return v0
.end method

.method public measureWidth(I)F
    .locals 3
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 236
    if-eqz p1, :cond_0

    const/16 v0, 0xa

    if-ne p1, v0, :cond_1

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEntryLayouts:[Landroid/text/StaticLayout;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->indexToSection(I)I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Landroid/text/StaticLayout;->getLineWidth(I)F

    move-result v0

    return v0

    .line 236
    :cond_1
    const/16 v0, 0x2f

    if-eq p1, v0, :cond_0

    .line 239
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mLineWidth:I

    int-to-float v0, v0

    return v0
.end method

.method public onPositionSelect(Lcom/android/camera/ui/HorizontalSlideView;F)V
    .locals 7
    .param p1, "view"    # Lcom/android/camera/ui/HorizontalSlideView;
    .param p2, "positionRatio"    # F

    .prologue
    .line 268
    iget-boolean v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEnable:Z

    if-nez v3, :cond_0

    .line 269
    return-void

    .line 271
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    mul-float v1, p2, v3

    .line 272
    .local v1, "position":F
    invoke-direct {p0, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mapPositionToZoomRatio(F)F

    move-result v2

    .line 273
    .local v2, "zoomValue":F
    invoke-static {v2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    .line 274
    .local v0, "newValue":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 275
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentMode:I

    invoke-virtual {v3, v4, v0}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 276
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz v3, :cond_1

    .line 277
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget-object v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-interface {v3, v4, v5, v0, v6}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 280
    :cond_1
    iput-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mCurrentValue:Ljava/lang/String;

    .line 283
    :cond_2
    return-void
.end method

.method public setEnable(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 294
    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideZoomAdapter;->mEnable:Z

    .line 295
    return-void
.end method
