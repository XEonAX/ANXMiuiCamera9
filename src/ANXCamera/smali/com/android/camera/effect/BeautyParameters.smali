.class public Lcom/android/camera/effect/BeautyParameters;
.super Ljava/lang/Object;
.source "BeautyParameters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;,
        Lcom/android/camera/effect/BeautyParameters$Type;
    }
.end annotation


# static fields
.field private static final synthetic -com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

.field private static final synthetic -com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

.field private static final TAG:Ljava/lang/String;

.field private static final sAdjustableParamTypes:[Lcom/miui/filtersdk/beauty/BeautyParameterType;

.field private static final sAdjustableTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

.field private static sInstance:Lcom/android/camera/effect/BeautyParameters;


# instance fields
.field private mBeautyLevel:I

.field private mBeautyValueRange:[I

.field private mCameraLevelParameters:[[F

.field private mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

.field private mExtraTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/android/camera/effect/BeautyParameters$Type;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

.field private mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

.field private mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

.field private mSupportedTypes:[Lcom/android/camera/effect/BeautyParameters$Type;


# direct methods
.method private static synthetic -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters$Type;->values()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_a

    :goto_0
    :try_start_1
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_9

    :goto_1
    :try_start_2
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_8

    :goto_2
    :try_start_3
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_7

    :goto_3
    :try_start_4
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_6

    :goto_4
    :try_start_5
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :goto_5
    :try_start_6
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_4

    :goto_6
    :try_start_7
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_3

    :goto_7
    :try_start_8
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_2

    :goto_8
    :try_start_9
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_1

    :goto_9
    :try_start_a
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_0

    :goto_a
    sput-object v0, Lcom/android/camera/effect/BeautyParameters;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_a

    :catch_1
    move-exception v1

    goto :goto_9

    :catch_2
    move-exception v1

    goto :goto_8

    :catch_3
    move-exception v1

    goto :goto_7

    :catch_4
    move-exception v1

    goto :goto_6

    :catch_5
    move-exception v1

    goto :goto_5

    :catch_6
    move-exception v1

    goto :goto_4

    :catch_7
    move-exception v1

    goto :goto_3

    :catch_8
    move-exception v1

    goto :goto_2

    :catch_9
    move-exception v1

    goto :goto_1

    :catch_a
    move-exception v1

    goto :goto_0
.end method

.method private static synthetic -getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

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

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_d

    :goto_0
    :try_start_1
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->CONTRAST_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_c

    :goto_1
    :try_start_2
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEBLEMISH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_b

    :goto_2
    :try_start_3
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEPOUCH_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x13

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

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_8

    :goto_5
    :try_start_6
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->LIP_BEAUTY_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_7

    :goto_6
    :try_start_7
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RELIGHTING_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_6

    :goto_7
    :try_start_8
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RUDDY_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x17

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

    const/16 v2, 0x18

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3

    :goto_a
    :try_start_b
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_NOSE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    const/16 v2, 0x19

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
    sput-object v0, Lcom/android/camera/effect/BeautyParameters;->-com-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues:[I

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
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 20
    const-class v0, Lcom/android/camera/effect/BeautyParameters;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    .line 39
    new-array v0, v6, [Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 40
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    aput-object v1, v0, v2

    .line 41
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    aput-object v1, v0, v3

    .line 42
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    aput-object v1, v0, v4

    .line 43
    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    aput-object v1, v0, v5

    .line 38
    sput-object v0, Lcom/android/camera/effect/BeautyParameters;->sAdjustableParamTypes:[Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .line 45
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/android/camera/effect/BeautyParameters$Type;

    .line 47
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v3

    .line 48
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v5

    .line 49
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 50
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    .line 45
    :goto_0
    sput-object v0, Lcom/android/camera/effect/BeautyParameters;->sAdjustableTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    .line 19
    return-void

    .line 51
    :cond_0
    new-array v0, v6, [Lcom/android/camera/effect/BeautyParameters$Type;

    .line 52
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v3

    .line 53
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v1, v0, v5

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    const/4 v0, 0x6

    new-array v0, v0, [[F

    .line 68
    new-array v1, v3, [F

    fill-array-data v1, :array_0

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 69
    new-array v1, v3, [F

    fill-array-data v1, :array_1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 70
    new-array v1, v3, [F

    fill-array-data v1, :array_2

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 71
    new-array v1, v3, [F

    fill-array-data v1, :array_3

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 72
    new-array v1, v3, [F

    fill-array-data v1, :array_4

    aput-object v1, v0, v3

    .line 73
    new-array v1, v3, [F

    fill-array-data v1, :array_5

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 67
    iput-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mCameraLevelParameters:[[F

    .line 76
    sget-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    iput-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 77
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautifyValueRange()[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyValueRange:[I

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    .line 79
    return-void

    .line 68
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    .line 69
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 70
    :array_2
    .array-data 4
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
        0x40400000    # 3.0f
    .end array-data

    .line 71
    :array_3
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data

    .line 72
    :array_4
    .array-data 4
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
        0x40e00000    # 7.0f
    .end array-data

    .line 73
    :array_5
    .array-data 4
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
        0x41000000    # 8.0f
    .end array-data
.end method

.method private static convert(Lcom/miui/filtersdk/beauty/BeautyParameterType;)Lcom/android/camera/effect/BeautyParameters$Type;
    .locals 2
    .param p0, "type"    # Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .prologue
    .line 217
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->-getcom-miui-filtersdk-beauty-BeautyParameterTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 227
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 219
    :pswitch_0
    sget-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0

    .line 221
    :pswitch_1
    sget-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0

    .line 223
    :pswitch_2
    sget-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0

    .line 225
    :pswitch_3
    sget-object v0, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0

    .line 217
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static getFaceBeautyRatioKey(Lcom/android/camera/effect/BeautyParameters$Type;)Ljava/lang/String;
    .locals 2
    .param p0, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;

    .prologue
    .line 107
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->-getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 131
    const-string/jumbo v0, ""

    return-object v0

    .line 109
    :pswitch_0
    const-string/jumbo v0, "pref_beautify_skin_smooth_ratio_key"

    return-object v0

    .line 111
    :pswitch_1
    const-string/jumbo v0, "pref_beautify_skin_color_ratio_key"

    return-object v0

    .line 113
    :pswitch_2
    const-string/jumbo v0, "pref_beautify_enlarge_eye_ratio_key"

    return-object v0

    .line 115
    :pswitch_3
    const-string/jumbo v0, "pref_beautify_slim_face_ratio_key"

    return-object v0

    .line 117
    :pswitch_4
    const-string/jumbo v0, "pref_beautify_nose_ratio_key"

    return-object v0

    .line 119
    :pswitch_5
    const-string/jumbo v0, "pref_beautify_risorius_ratio_key"

    return-object v0

    .line 121
    :pswitch_6
    const-string/jumbo v0, "pref_beautify_lips_ratio_key"

    return-object v0

    .line 123
    :pswitch_7
    const-string/jumbo v0, "pref_beautify_chin_ratio_key"

    return-object v0

    .line 125
    :pswitch_8
    const-string/jumbo v0, "pref_beautify_neck_ratio_key"

    return-object v0

    .line 127
    :pswitch_9
    const-string/jumbo v0, "pref_beautify_smile_ratio_key"

    return-object v0

    .line 129
    :pswitch_a
    const-string/jumbo v0, "pref_beautify_slim_nose_ratio_key"

    return-object v0

    .line 107
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_2
        :pswitch_6
        :pswitch_8
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/effect/BeautyParameters;
    .locals 2

    .prologue
    const-class v1, Lcom/android/camera/effect/BeautyParameters;

    monitor-enter v1

    .line 100
    :try_start_0
    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->sInstance:Lcom/android/camera/effect/BeautyParameters;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Lcom/android/camera/effect/BeautyParameters;

    invoke-direct {v0}, Lcom/android/camera/effect/BeautyParameters;-><init>()V

    sput-object v0, Lcom/android/camera/effect/BeautyParameters;->sInstance:Lcom/android/camera/effect/BeautyParameters;

    .line 103
    :cond_0
    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->sInstance:Lcom/android/camera/effect/BeautyParameters;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;
    .locals 13
    .param p1, "processor"    # Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
    .param p2, "beautyLevel"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;",
            "I)",
            "Ljava/util/Map",
            "<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 327
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 328
    add-int/lit8 p2, p2, -0x1

    .line 330
    :cond_0
    invoke-virtual {p1, p2}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getIntelligentLevelParams(I)Ljava/util/Map;

    move-result-object v5

    .line 331
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getExtraSpan()F

    move-result v3

    .line 332
    .local v3, "extraSpan":F
    sget-object v9, Lcom/android/camera/effect/BeautyParameters;->sAdjustableParamTypes:[Lcom/miui/filtersdk/beauty/BeautyParameterType;

    array-length v10, v9

    move v7, v8

    :goto_0
    if-ge v7, v10, :cond_2

    aget-object v0, v9, v7

    .line 333
    .local v0, "beautyType":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    invoke-virtual {p1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F

    move-result-object v1

    .line 334
    .local v1, "degreeRange":[F
    array-length v6, v1

    const/4 v11, 0x2

    if-lt v6, v11, :cond_1

    .line 335
    iget-object v6, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    invoke-static {v0}, Lcom/android/camera/effect/BeautyParameters;->convert(Lcom/miui/filtersdk/beauty/BeautyParameterType;)Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v11

    invoke-interface {v6, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v3

    const/high16 v11, 0x42c80000    # 100.0f

    div-float v2, v6, v11

    .line 336
    .local v2, "extra":F
    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float v4, v6, v2

    .line 337
    .local v4, "newValue":F
    aget v6, v1, v8

    const/4 v11, 0x1

    aget v11, v1, v11

    invoke-static {v4, v6, v11}, Lcom/android/camera/Util;->clamp(FFF)F

    move-result v4

    .line 338
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-interface {v5, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    .end local v2    # "extra":F
    .end local v4    # "newValue":F
    :goto_1
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    goto :goto_0

    .line 340
    :cond_1
    sget-object v6, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " does not support type "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v6, v11}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 344
    .end local v0    # "beautyType":Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .end local v1    # "degreeRange":[F
    :cond_2
    return-object v5
.end method

.method private isMakeupStatusChanged()Z
    .locals 3

    .prologue
    .line 296
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/effect/EffectController;->isMakeupEnable()Z

    move-result v1

    .line 297
    .local v1, "currMakeupStatus":Z
    invoke-virtual {p0}, Lcom/android/camera/effect/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    .line 298
    .local v0, "currFaceBeautyOn":Z
    if-ne v1, v0, :cond_0

    .line 299
    const/4 v2, 0x0

    return v2

    .line 302
    :cond_0
    iget-object v2, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    if-eqz v2, :cond_1

    .line 303
    iget-object v2, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    invoke-interface {v2, v0}, Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;->onBeautyStatusChanged(Z)V

    .line 305
    :cond_1
    const/4 v2, 0x1

    return v2
.end method

.method private onBeautyLevelChanged(I)V
    .locals 3
    .param p1, "beautyLevel"    # I

    .prologue
    .line 348
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    .line 349
    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onBeautyLevelChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    iget-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    invoke-interface {v0}, Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;->onBeautyParameterChanged()V

    .line 353
    :cond_0
    return-void
.end method

.method private onBeautyParameterChanged(Lcom/android/camera/effect/BeautyParameters$Type;I)V
    .locals 4
    .param p1, "beautyType"    # Lcom/android/camera/effect/BeautyParameters$Type;
    .param p2, "progress"    # I

    .prologue
    .line 356
    invoke-static {p1}, Lcom/android/camera/effect/BeautyParameters;->getFaceBeautyRatioKey(Lcom/android/camera/effect/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v0

    .line 357
    .local v0, "key":Ljava/lang/String;
    invoke-static {v0, p2}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    .line 358
    sget-object v1, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "onBeautyParameterChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    if-eqz v1, :cond_0

    .line 360
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    invoke-interface {v1}, Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;->onBeautyParameterChanged()V

    .line 362
    :cond_0
    return-void
.end method

.method private setBeautyParameters()V
    .locals 3

    .prologue
    .line 309
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->isStickerEnable()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 310
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    if-eqz v1, :cond_0

    .line 312
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    iget v2, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    invoke-direct {p0, v1, v2}, Lcom/android/camera/effect/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    .line 313
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    .line 322
    .end local v0    # "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    :cond_0
    :goto_0
    return-void

    .line 316
    :cond_1
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    if-eqz v1, :cond_0

    .line 318
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    iget v2, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    invoke-direct {p0, v1, v2}, Lcom/android/camera/effect/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    .line 319
    .restart local v0    # "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V

    goto :goto_0
.end method

.method private updateExtraTable()V
    .locals 13

    .prologue
    const/4 v12, -0x1

    const/4 v6, 0x0

    .line 161
    invoke-virtual {p0}, Lcom/android/camera/effect/BeautyParameters;->getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v7

    array-length v8, v7

    move v5, v6

    :goto_0
    if-ge v5, v8, :cond_2

    aget-object v4, v7, v5

    .line 162
    .local v4, "type":Lcom/android/camera/effect/BeautyParameters$Type;
    const/4 v2, 0x0

    .line 163
    .local v2, "progress":I
    invoke-static {v4}, Lcom/android/camera/effect/BeautyParameters;->getFaceBeautyRatioKey(Lcom/android/camera/effect/BeautyParameters$Type;)Ljava/lang/String;

    move-result-object v1

    .line 164
    .local v1, "key":Ljava/lang/String;
    const-string/jumbo v9, ""

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 165
    invoke-static {v1, v12}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v2

    .line 166
    if-ne v2, v12, :cond_0

    .line 167
    iget-object v9, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyValueRange:[I

    const/4 v10, 0x1

    aget v9, v9, v10

    iget-object v10, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyValueRange:[I

    aget v10, v10, v6

    sub-int v3, v9, v10

    .line 168
    .local v3, "range":I
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v9

    if-eqz v9, :cond_1

    if-eqz v3, :cond_1

    .line 169
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getBeautifyDefaultValue(Ljava/lang/String;)I

    move-result v0

    .line 170
    .local v0, "defaultValue":I
    iget-object v9, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyValueRange:[I

    aget v9, v9, v6

    sub-int v9, v0, v9

    mul-int/lit8 v9, v9, 0x64

    div-int v2, v9, v3

    .line 171
    sget-object v9, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "updateExtraTable: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "%"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .end local v0    # "defaultValue":I
    .end local v3    # "range":I
    :cond_0
    :goto_1
    iget-object v9, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v9, v4, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 173
    .restart local v3    # "range":I
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 180
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "progress":I
    .end local v3    # "range":I
    .end local v4    # "type":Lcom/android/camera/effect/BeautyParameters$Type;
    :cond_2
    return-void
.end method

.method private updateParameters(Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 5
    .param p1, "configEditor"    # Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .prologue
    .line 82
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyDefaultValue()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "defaultBeauty":Ljava/lang/String;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v2

    const-string/jumbo v3, "pref_camera_face_beauty_key"

    invoke-virtual {v2, v3, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 90
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isFaceBeautyValid(Ljava/lang/String;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 91
    sget-object v2, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "reset invalid face beauty value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    move-object v1, v0

    .line 93
    const-string/jumbo v2, "pref_camera_face_beauty_key"

    invoke-interface {p1, v2, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 95
    :cond_0
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    .line 96
    invoke-direct {p0}, Lcom/android/camera/effect/BeautyParameters;->updateExtraTable()V

    .line 97
    return-void
.end method

.method private updateSupportedTypes(II)V
    .locals 8
    .param p1, "cameraId"    # I
    .param p2, "targetMode"    # I

    .prologue
    .line 365
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 367
    .local v0, "cc":Lcom/android/camera2/CameraCapabilities;
    new-instance v2, Ljava/util/ArrayList;

    sget-object v4, Lcom/android/camera/effect/BeautyParameters;->sAdjustableTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    array-length v4, v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 368
    .local v2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/BeautyParameters$Type;>;"
    if-nez v0, :cond_1

    .line 369
    sget-object v4, Lcom/android/camera/effect/BeautyParameters;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "updateSupportedTypes, but CameraCapabilities is null!"

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    :cond_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Lcom/android/camera/effect/BeautyParameters$Type;

    iput-object v4, p0, Lcom/android/camera/effect/BeautyParameters;->mSupportedTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    .line 379
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 380
    iget-object v5, p0, Lcom/android/camera/effect/BeautyParameters;->mSupportedTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/effect/BeautyParameters$Type;

    aput-object v4, v5, v1

    .line 379
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 371
    .end local v1    # "i":I
    :cond_1
    sget-object v5, Lcom/android/camera/effect/BeautyParameters;->sAdjustableTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    const/4 v4, 0x0

    array-length v6, v5

    :goto_1
    if-ge v4, v6, :cond_0

    aget-object v3, v5, v4

    .line 372
    .local v3, "type":Lcom/android/camera/effect/BeautyParameters$Type;
    invoke-virtual {v0, v3}, Lcom/android/camera2/CameraCapabilities;->isSupportBeautyType(Lcom/android/camera/effect/BeautyParameters$Type;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 373
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 382
    .end local v3    # "type":Lcom/android/camera/effect/BeautyParameters$Type;
    .restart local v1    # "i":I
    :cond_3
    return-void
.end method


# virtual methods
.method public getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;
    .locals 1

    .prologue
    .line 385
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 386
    iget-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mSupportedTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0

    .line 388
    :cond_0
    sget-object v0, Lcom/android/camera/effect/BeautyParameters;->sAdjustableTypes:[Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0
.end method

.method public getCurrentLevel()I
    .locals 1

    .prologue
    .line 213
    iget v0, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    return v0
.end method

.method public getCurrentProgress()I
    .locals 2

    .prologue
    .line 244
    iget-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 245
    const/4 v0, 0x0

    return v0

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getCurrentType()Lcom/android/camera/effect/BeautyParameters$Type;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    return-object v0
.end method

.method public initBeauty(IILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 1
    .param p1, "cameraId"    # I
    .param p2, "targetMode"    # I
    .param p3, "configEditor"    # Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .prologue
    .line 183
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    .line 184
    .local v0, "isFront":Z
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/BeautyParameters;->updateSupportedTypes(II)V

    .line 185
    if-eqz v0, :cond_0

    .line 186
    invoke-direct {p0, p3}, Lcom/android/camera/effect/BeautyParameters;->updateParameters(Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V

    .line 188
    :cond_0
    return-void

    .line 183
    .end local v0    # "isFront":Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "isFront":Z
    goto :goto_0
.end method

.method public isFaceBeautyOn()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 276
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 277
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAdvancedBeautyOn()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 278
    iget-object v2, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "entry$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 280
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/camera/effect/BeautyParameters$Type;Ljava/lang/Integer;>;"
    sget-object v2, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    if-eq v2, v5, :cond_0

    .line 281
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez v2, :cond_0

    .line 282
    return v3

    .line 286
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/camera/effect/BeautyParameters$Type;Ljava/lang/Integer;>;"
    :cond_1
    return v4

    .line 288
    .end local v1    # "entry$iterator":Ljava/util/Iterator;
    :cond_2
    iget v2, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    if-lez v2, :cond_3

    move v2, v3

    :goto_0
    return v2

    :cond_3
    move v2, v4

    goto :goto_0

    .line 291
    :cond_4
    iget v2, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    if-lez v2, :cond_5

    :goto_1
    return v3

    :cond_5
    move v3, v4

    goto :goto_1
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 206
    iput p1, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    .line 207
    invoke-direct {p0}, Lcom/android/camera/effect/BeautyParameters;->isMakeupStatusChanged()Z

    .line 208
    invoke-direct {p0, p1}, Lcom/android/camera/effect/BeautyParameters;->onBeautyLevelChanged(I)V

    .line 209
    invoke-direct {p0}, Lcom/android/camera/effect/BeautyParameters;->setBeautyParameters()V

    .line 210
    return-void
.end method

.method public setMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V
    .locals 2
    .param p1, "makeupProcessor"    # Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .prologue
    .line 136
    monitor-enter p0

    .line 137
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/effect/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 139
    iget v1, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/effect/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    .line 140
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 142
    return-void

    .line 136
    .end local v0    # "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setOnFaceBeautyChangedListener(Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/android/camera/effect/BeautyParameters;->mOnFaceBeautyChangedListener:Lcom/android/camera/effect/BeautyParameters$OnFaceBeautyChangedListener;

    .line 267
    return-void
.end method

.method public setProgress(I)V
    .locals 4
    .param p1, "progress"    # I

    .prologue
    .line 252
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 253
    const/4 v0, 0x0

    .line 257
    .local v0, "oldProgress":I
    :goto_0
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    invoke-direct {p0}, Lcom/android/camera/effect/BeautyParameters;->isMakeupStatusChanged()Z

    .line 259
    if-eq v0, p1, :cond_0

    .line 260
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-direct {p0, v1, p1}, Lcom/android/camera/effect/BeautyParameters;->onBeautyParameterChanged(Lcom/android/camera/effect/BeautyParameters$Type;I)V

    .line 262
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/effect/BeautyParameters;->setBeautyParameters()V

    .line 263
    return-void

    .line 255
    .end local v0    # "oldProgress":I
    :cond_1
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mExtraTable:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .restart local v0    # "oldProgress":I
    goto :goto_0
.end method

.method public setStickerMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V
    .locals 2
    .param p1, "stickerProcessor"    # Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .prologue
    .line 191
    monitor-enter p0

    .line 192
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/effect/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    .line 194
    iget v1, p0, Lcom/android/camera/effect/BeautyParameters;->mBeautyLevel:I

    invoke-direct {p0, p1, v1}, Lcom/android/camera/effect/BeautyParameters;->getProcessorBeautyParams(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;I)Ljava/util/Map;

    move-result-object v0

    .line 195
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    iget-object v1, p0, Lcom/android/camera/effect/BeautyParameters;->mStickerMakeupProcessor:Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->setBeautyParamsDegree(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 197
    return-void

    .line 191
    .end local v0    # "params":Ljava/util/Map;, "Ljava/util/Map<Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setType(Lcom/android/camera/effect/BeautyParameters$Type;)V
    .locals 0
    .param p1, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 237
    return-void
.end method

.method public setType(Lcom/miui/filtersdk/beauty/BeautyParameterType;)V
    .locals 1
    .param p1, "type"    # Lcom/miui/filtersdk/beauty/BeautyParameterType;

    .prologue
    .line 232
    invoke-static {p1}, Lcom/android/camera/effect/BeautyParameters;->convert(Lcom/miui/filtersdk/beauty/BeautyParameterType;)Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/BeautyParameters;->mCurrentType:Lcom/android/camera/effect/BeautyParameters$Type;

    .line 233
    return-void
.end method
