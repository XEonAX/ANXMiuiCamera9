.class public Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;
.super Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.source "ExtraSlideFocusAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;


# static fields
.field private static final sTextActivatedColorState:[I

.field private static final sTextDefaultColorState:[I


# instance fields
.field private mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mCurrentMode:I

.field private mCurrentValue:Ljava/lang/String;

.field private mEntries:[Ljava/lang/CharSequence;

.field private mLineColorDefault:I

.field private mLineHalfHeight:F

.field private mLineLineGap:I

.field private mLineTextGap:I

.field private mLineWidth:I

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mTextColor:Landroid/content/res/ColorStateList;

.field private mTextSize:I

.field private mTrackedFocusPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 39
    new-array v0, v3, [I

    const v1, 0x10102fe

    aput v1, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextActivatedColorState:[I

    .line 40
    new-array v0, v3, [I

    aput v2, v0, v2

    sput-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextDefaultColorState:[I

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "componentData"    # Lcom/android/camera/data/data/ComponentData;
    .param p3, "currentMode"    # I
    .param p4, "manuallyListener"    # Lcom/android/camera/fragment/manually/ManuallyListener;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;-><init>()V

    .line 60
    iput-object p2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    .line 61
    iput p3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentMode:I

    .line 62
    iput-object p4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    .line 64
    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentMode:I

    invoke-virtual {p2, v4}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    .line 66
    :try_start_0
    iget-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->initStyle(Landroid/content/Context;)V

    .line 73
    const/16 v4, 0xb

    new-array v1, v4, [Ljava/lang/CharSequence;

    .line 74
    .local v1, "entries":[Ljava/lang/CharSequence;
    const/16 v2, 0xa

    .line 75
    .local v2, "gap":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    const/16 v4, 0xa

    if-gt v3, v4, :cond_0

    .line 76
    mul-int/lit8 v4, v3, 0xa

    invoke-direct {p0, p1, v4}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->getDisplayedFocusValue(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 75
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 67
    .end local v1    # "entries":[Ljava/lang/CharSequence;
    .end local v2    # "gap":I
    .end local v3    # "i":I
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/16 v4, 0x3e8

    iput v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I

    goto :goto_0

    .line 79
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "entries":[Ljava/lang/CharSequence;
    .restart local v2    # "gap":I
    .restart local v3    # "i":I
    :cond_0
    iput-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mEntries:[Ljava/lang/CharSequence;

    .line 85
    return-void
.end method

.method private drawText(ILandroid/graphics/Canvas;)V
    .locals 5
    .param p1, "index"    # I
    .param p2, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 118
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    move-result v1

    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    move-result v2

    add-float v0, v1, v2

    .line 119
    .local v0, "height":F
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mEntries:[Ljava/lang/CharSequence;

    aget-object v1, v1, p1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    neg-float v3, v0

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    const/high16 v4, 0x3f800000    # 1.0f

    add-float/2addr v3, v4

    iget-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p2, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 120
    return-void
.end method

.method private getDisplayedFocusValue(Landroid/content/Context;I)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "value"    # I

    .prologue
    .line 109
    if-nez p2, :cond_0

    .line 110
    const v0, 0x7f0f0047

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 112
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initStyle(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 88
    const v3, 0x1010095

    const v4, 0x1010098

    filled-new-array {v3, v4}, [I

    move-result-object v2

    .line 89
    .local v2, "textAttrs":[I
    const v3, 0x7f11000e

    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 90
    .local v1, "style":Landroid/content/res/TypedArray;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextSize:I

    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextSize:I

    .line 91
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    .line 92
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 94
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 95
    .local v0, "resources":Landroid/content/res/Resources;
    const v3, 0x7f090014

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineHalfHeight:F

    .line 96
    const v3, 0x7f090015

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineWidth:I

    .line 97
    const v3, 0x7f090016

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineLineGap:I

    .line 98
    const v3, 0x7f090017

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineTextGap:I

    .line 99
    const v3, 0x7f0d000f

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineColorDefault:I

    .line 101
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    .line 102
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 103
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineWidth:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 104
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextSize:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 105
    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 106
    return-void
.end method

.method private mapIndexToFocus(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 190
    mul-int/lit16 v0, p1, 0x3e8

    div-int/lit8 v0, v0, 0x64

    rsub-int v0, v0, 0x3e8

    return v0
.end method


# virtual methods
.method public draw(ILandroid/graphics/Canvas;Z)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "selected"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 124
    rem-int/lit8 v0, p1, 0xa

    if-nez v0, :cond_1

    .line 125
    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_0

    .line 126
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextActivatedColorState:[I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 125
    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 128
    div-int/lit8 v0, p1, 0xa

    invoke-direct {p0, v0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->drawText(ILandroid/graphics/Canvas;)V

    .line 135
    :goto_1
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v2, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextDefaultColorState:[I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    goto :goto_0

    .line 130
    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    if-eqz p3, :cond_2

    .line 131
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTextColor:Landroid/content/res/ColorStateList;

    sget-object v3, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->sTextActivatedColorState:[I

    invoke-virtual {v0, v3, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 130
    :goto_2
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 133
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineHalfHeight:F

    neg-float v2, v0

    iget v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineHalfHeight:F

    iget-object v5, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    move-object v0, p2

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 132
    :cond_2
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineColorDefault:I

    goto :goto_2
.end method

.method public getAlign(I)Landroid/graphics/Paint$Align;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 157
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 162
    const/16 v0, 0x65

    return v0
.end method

.method public mapFocusToIndex(I)I
    .locals 3
    .param p1, "focusPosition"    # I

    .prologue
    .line 184
    const/4 v1, 0x0

    const/16 v2, 0x3e8

    invoke-static {p1, v1, v2}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    .line 185
    const/16 v0, 0xa

    .line 186
    .local v0, "gap":I
    div-int/lit8 v1, p1, 0xa

    rsub-int/lit8 v1, v1, 0x64

    return v1
.end method

.method public measureGap(I)F
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 148
    rem-int/lit8 v0, p1, 0xa

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    rem-int/lit8 v0, v0, 0xa

    if-nez v0, :cond_1

    .line 149
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineTextGap:I

    int-to-float v0, v0

    return v0

    .line 151
    :cond_1
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineLineGap:I

    int-to-float v0, v0

    return v0
.end method

.method public measureWidth(I)F
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 139
    rem-int/lit8 v0, p1, 0xa

    if-nez v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mEntries:[Ljava/lang/CharSequence;

    div-int/lit8 v2, p1, 0xa

    aget-object v1, v1, v2

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    return v0

    .line 142
    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mLineWidth:I

    int-to-float v0, v0

    return v0
.end method

.method public onItemSelect(Lcom/android/camera/ui/HorizontalSlideView;I)V
    .locals 6
    .param p1, "view"    # Lcom/android/camera/ui/HorizontalSlideView;
    .param p2, "index"    # I

    .prologue
    .line 167
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mapIndexToFocus(I)I

    move-result v0

    .line 168
    .local v0, "focusPosition":I
    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalSlideView;->isScrolling()Z

    move-result v2

    if-nez v2, :cond_0

    iget v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I

    if-eq v2, v0, :cond_0

    .line 169
    iput v0, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mTrackedFocusPosition:I

    .line 170
    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackFocusPositionChanged(I)V

    .line 173
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "newValue":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 175
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentMode:I

    invoke-virtual {v2, v3, v1}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    .line 176
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    if-eqz v2, :cond_1

    .line 177
    iget-object v2, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    iget-object v3, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    iget-object v4, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-interface {v2, v3, v4, v1, v5}, Lcom/android/camera/fragment/manually/ManuallyListener;->onManuallyDataChanged(Lcom/android/camera/data/data/ComponentData;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 179
    :cond_1
    iput-object v1, p0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mCurrentValue:Ljava/lang/String;

    .line 181
    :cond_2
    return-void
.end method
