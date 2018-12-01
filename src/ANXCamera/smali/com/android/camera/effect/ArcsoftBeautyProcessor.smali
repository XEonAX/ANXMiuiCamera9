.class public Lcom/android/camera/effect/ArcsoftBeautyProcessor;
.super Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
.source "ArcsoftBeautyProcessor.java"


# static fields
.field private static final synthetic -com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mEnlargeEyeRatio:I

.field private mShrinkFaceRatio:I

.field private mSmoothStrength:I

.field private mWhiteStrength:I


# direct methods
.method private static synthetic -getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->values()[Lcom/miui/filtersdk/beauty/BeautyParameterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->BRIGHT_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_d

    :goto_0
    :try_start_1
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->CONTRAST_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_c

    :goto_1
    :try_start_2
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEBLEMISH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_b

    :goto_2
    :try_start_3
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEPOUCH_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_a

    :goto_3
    :try_start_4
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_9

    :goto_4
    :try_start_5
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->IRIS_SHINE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_8

    :goto_5
    :try_start_6
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->LIP_BEAUTY_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_7

    :goto_6
    :try_start_7
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RELIGHTING_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_6

    :goto_7
    :try_start_8
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RUDDY_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_5

    :goto_8
    :try_start_9
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_4

    :goto_9
    :try_start_a
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_JAW_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3

    :goto_a
    :try_start_b
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_NOSE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_2

    :goto_b
    :try_start_c
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_1

    :goto_c
    :try_start_d
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_0

    :goto_d
    sput-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_d

    :catch_1
    move-exception v1

    goto :goto_c

    :catch_2
    move-exception v1

    goto :goto_b

    :catch_3
    move-exception v1

    goto :goto_a

    :catch_4
    move-exception v1

    goto :goto_9

    :catch_5
    move-exception v1

    goto :goto_8

    :catch_6
    move-exception v1

    goto :goto_7

    :catch_7
    move-exception v1

    goto :goto_6

    :catch_8
    move-exception v1

    goto :goto_5

    :catch_9
    move-exception v1

    goto :goto_4

    :catch_a
    move-exception v1

    goto :goto_3

    :catch_b
    move-exception v1

    goto/16 :goto_2

    :catch_c
    move-exception v1

    goto/16 :goto_1

    :catch_d
    move-exception v1

    goto/16 :goto_0
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-class v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->TAG:Ljava/lang/String;

    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 23
    invoke-direct {p0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;-><init>()V

    .line 24
    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {p0, v0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->setExtraSpan(F)V

    .line 25
    const/4 v0, 0x6

    new-array v0, v0, [[F

    .line 26
    new-array v1, v3, [F

    fill-array-data v1, :array_0

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 27
    new-array v1, v3, [F

    fill-array-data v1, :array_1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 28
    new-array v1, v3, [F

    fill-array-data v1, :array_2

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 29
    new-array v1, v3, [F

    fill-array-data v1, :array_3

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 30
    new-array v1, v3, [F

    fill-array-data v1, :array_4

    aput-object v1, v0, v3

    .line 31
    new-array v1, v3, [F

    fill-array-data v1, :array_5

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 25
    iput-object v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mLevelParameters:[[F

    .line 32
    return-void

    .line 26
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    .line 27
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 28
    :array_2
    .array-data 4
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
    .end array-data

    .line 29
    :array_3
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data

    .line 30
    :array_4
    .array-data 4
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
    .end array-data

    .line 31
    :array_5
    .array-data 4
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
    .end array-data
.end method

.method private dumpParams()V
    .locals 6

    .prologue
    .line 101
    sget-object v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 102
    const-string/jumbo v2, "beautyParams: shrinkFace=%d largeEye=%d whiteSkin=%d smoothSkin=%d"

    .line 101
    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    .line 103
    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mWhiteStrength:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget v4, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mSmoothStrength:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    .line 101
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    return-void
.end method

.method private getDegreeByValue(Lcom/miui/filtersdk/beauty/BeautyParameterType;F)I
    .locals 3
    .param p1, "beautyType"    # Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .param p2, "value"    # F

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F

    move-result-object v0

    .line 108
    .local v0, "degreeRange":[F
    array-length v1, v0

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 109
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1

    .line 112
    :cond_0
    const/4 v1, 0x0

    aget v1, v0, v1

    sub-float v1, p2, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x41200000    # 10.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1
.end method

.method private updateBeautyParameter(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V
    .locals 4
    .param p1, "type"    # Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .param p2, "param"    # Ljava/lang/Float;

    .prologue
    .line 80
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 81
    .local v1, "value":F
    :goto_0
    invoke-direct {p0, p1, v1}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->getDegreeByValue(Lcom/miui/filtersdk/beauty/BeautyParameterType;F)I

    move-result v0

    .line 82
    .local v0, "degree":I
    invoke-static {}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 98
    :goto_1
    return-void

    .line 80
    .end local v0    # "degree":I
    .end local v1    # "value":F
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "value":F
    goto :goto_0

    .line 84
    .restart local v0    # "degree":I
    :pswitch_0
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mSmoothStrength:I

    goto :goto_1

    .line 87
    :pswitch_1
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mWhiteStrength:I

    goto :goto_1

    .line 90
    :pswitch_2
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    goto :goto_1

    .line 93
    :pswitch_3
    iput v0, p0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    goto :goto_1

    .line 82
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public getSupportedBeautyParamTypes()[Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .locals 3

    .prologue
    .line 44
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 45
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 46
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 47
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 48
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 44
    return-object v0
.end method

.method public getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F
    .locals 2
    .param p1, "beautyParameterType"    # Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .prologue
    .line 54
    invoke-static {}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 61
    const/4 v0, 0x0

    new-array v0, v0, [F

    return-object v0

    .line 59
    :pswitch_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    return-object v0

    .line 54
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 59
    :array_0
    .array-data 4
        0x0
        0x41200000    # 10.0f
    .end array-data
.end method

.method public init(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 139
    return-void
.end method

.method public onDisplaySizeChanged(II)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 149
    return-void
.end method

.method public release()V
    .locals 0

    .prologue
    .line 144
    return-void
.end method

.method public setBeautyParamsDegree(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "entry$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 68
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-direct {p0, v2, v3}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->updateBeautyParameter(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V

    goto :goto_0

    .line 70
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->dumpParams()V

    .line 71
    return-void
.end method
