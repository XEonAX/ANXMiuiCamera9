.class public Lcom/android/camera/effect/EffectController;
.super Ljava/lang/Object;
.source "EffectController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/EffectController$EffectChangeType;,
        Lcom/android/camera/effect/EffectController$EffectChangedListener;,
        Lcom/android/camera/effect/EffectController$EffectRectAttribute;
    }
.end annotation


# static fields
.field private static final synthetic -com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

.field public static final EFFECT_ALL_CHANGE_TYPES:[I

.field private static final TAG:Ljava/lang/String;

.field private static sInstance:Lcom/android/camera/effect/EffectController;


# instance fields
.field private mBeautyEnable:Z

.field private mBeautyFrameReady:Z

.field private mBlur:Z

.field private mBlurStep:I

.field private mChangedListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/effect/EffectController$EffectChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentSticker:Ljava/lang/String;

.field private mDeviceRotation:F

.field private mDrawGradienter:Z

.field private mDrawPeaking:Z

.field private mDrawTilt:Z

.field private mEffectId:I

.field private mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

.field private mFilterInfoMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private mIsDrawMainFrame:Z

.field private mNeedDestroyMakeup:Z

.field private mOrientation:I

.field private mOverrideAiEffectIndex:I

.field private mOverrideEffectIndex:I

.field private mTiltShiftMaskAlpha:F


# direct methods
.method private static synthetic -getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/effect/EffectController;->-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/EffectController;->-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/filtersdk/filter/helper/FilterType;->values()[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A10_NIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1c

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_48

    :goto_0
    :try_start_1
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A11_SNOW:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1d

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_47

    :goto_1
    :try_start_2
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A12_SEA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1e

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_46

    :goto_2
    :try_start_3
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A13_AUTUMN:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1f

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_45

    :goto_3
    :try_start_4
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A14_CANDLELIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x20

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_44

    :goto_4
    :try_start_5
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A15_CAR:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x21

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_43

    :goto_5
    :try_start_6
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A16_GRASS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x22

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_42

    :goto_6
    :try_start_7
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A17_MAPLE_LEAVES:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x23

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_41

    :goto_7
    :try_start_8
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A18_SUCCULENT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x24

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_40

    :goto_8
    :try_start_9
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A19_BUILDING:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x25

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_3f

    :goto_9
    :try_start_a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A1_DOC:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x26

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3e

    :goto_a
    :try_start_b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A20_CITY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x27

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_3d

    :goto_b
    :try_start_c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A21_CLOUD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x28

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_3c

    :goto_c
    :try_start_d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A22_OVERCAST:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x29

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_3b

    :goto_d
    :try_start_e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A23_BACKLIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2a

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_3a

    :goto_e
    :try_start_f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A24_SILHOUETTE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2b

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_39

    :goto_f
    :try_start_10
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A25_HUMAN:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2c

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_38

    :goto_10
    :try_start_11
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A26_JEWELRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2d

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_37

    :goto_11
    :try_start_12
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A27_BUDDHA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2e

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_36

    :goto_12
    :try_start_13
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A28_COW:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2f

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_35

    :goto_13
    :try_start_14
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A29_CURRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x30

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_34

    :goto_14
    :try_start_15
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A2_FLOWER:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x31

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_33

    :goto_15
    :try_start_16
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A30_MOTORBIKE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x32

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_32

    :goto_16
    :try_start_17
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A31_TEMPLE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x33

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_31

    :goto_17
    :try_start_18
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A3_FOOD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x34

    aput v2, v0, v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_30

    :goto_18
    :try_start_19
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A4_PPT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x35

    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_2f

    :goto_19
    :try_start_1a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A5_SKY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x36

    aput v2, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_2e

    :goto_1a
    :try_start_1b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A6_SUNRISE_SUNSET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x37

    aput v2, v0, v1
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_1b} :catch_2d

    :goto_1b
    :try_start_1c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A7_CAT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x38

    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c .. :try_end_1c} :catch_2c

    :goto_1c
    :try_start_1d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A8_DOG:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x39

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_1d} :catch_2b

    :goto_1d
    :try_start_1e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A9_GREEN_PLANTS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3a

    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_1e} :catch_2a

    :goto_1e
    :try_start_1f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_MEMORY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3b

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_1f} :catch_29

    :goto_1f
    :try_start_20
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_MONO:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3c

    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_20 .. :try_end_20} :catch_28

    :goto_20
    :try_start_21
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_PINK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3d

    aput v2, v0, v1
    :try_end_21
    .catch Ljava/lang/NoSuchFieldError; {:try_start_21 .. :try_end_21} :catch_27

    :goto_21
    :try_start_22
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_PORTRAIT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3e

    aput v2, v0, v1
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_22} :catch_26

    :goto_22
    :try_start_23
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_RETRO:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3f

    aput v2, v0, v1
    :try_end_23
    .catch Ljava/lang/NoSuchFieldError; {:try_start_23 .. :try_end_23} :catch_25

    :goto_23
    :try_start_24
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_ROMANTIC:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x40

    aput v2, v0, v1
    :try_end_24
    .catch Ljava/lang/NoSuchFieldError; {:try_start_24 .. :try_end_24} :catch_24

    :goto_24
    :try_start_25
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_STRONG:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x41

    aput v2, v0, v1
    :try_end_25
    .catch Ljava/lang/NoSuchFieldError; {:try_start_25 .. :try_end_25} :catch_23

    :goto_25
    :try_start_26
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_SUNNY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x42

    aput v2, v0, v1
    :try_end_26
    .catch Ljava/lang/NoSuchFieldError; {:try_start_26 .. :try_end_26} :catch_22

    :goto_26
    :try_start_27
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_SWEET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x43

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_27} :catch_21

    :goto_27
    :try_start_28
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_WARM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x44

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_28} :catch_20

    :goto_28
    :try_start_29
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_YOUNG:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x45

    aput v2, v0, v1
    :try_end_29
    .catch Ljava/lang/NoSuchFieldError; {:try_start_29 .. :try_end_29} :catch_1f

    :goto_29
    :try_start_2a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_FAIRYTALE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_2a} :catch_1e

    :goto_2a
    :try_start_2b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_JAPANESE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2b .. :try_end_2b} :catch_1d

    :goto_2b
    :try_start_2c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MAZE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2c .. :try_end_2c} :catch_1c

    :goto_2c
    :try_start_2d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MINT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_2d} :catch_1b

    :goto_2d
    :try_start_2e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MOOD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_2e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2e .. :try_end_2e} :catch_1a

    :goto_2e
    :try_start_2f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MOVIE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x46

    aput v2, v0, v1
    :try_end_2f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2f .. :try_end_2f} :catch_19

    :goto_2f
    :try_start_30
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_NATURE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_30
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_30} :catch_18

    :goto_30
    :try_start_31
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_PINK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_31
    .catch Ljava/lang/NoSuchFieldError; {:try_start_31 .. :try_end_31} :catch_17

    :goto_31
    :try_start_32
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_RIDDLE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x47

    aput v2, v0, v1
    :try_end_32
    .catch Ljava/lang/NoSuchFieldError; {:try_start_32 .. :try_end_32} :catch_16

    :goto_32
    :try_start_33
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_ROMANCE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_33} :catch_15

    :goto_33
    :try_start_34
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_STORY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x48

    aput v2, v0, v1
    :try_end_34
    .catch Ljava/lang/NoSuchFieldError; {:try_start_34 .. :try_end_34} :catch_14

    :goto_34
    :try_start_35
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x49

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_35} :catch_13

    :goto_35
    :try_start_36
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_BERRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_36 .. :try_end_36} :catch_12

    :goto_36
    :try_start_37
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_COOKIE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_37
    .catch Ljava/lang/NoSuchFieldError; {:try_start_37 .. :try_end_37} :catch_11

    :goto_37
    :try_start_38
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_DELICACY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_38
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_38} :catch_10

    :goto_38
    :try_start_39
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FADE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_39} :catch_f

    :goto_39
    :try_start_3a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_3a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3a .. :try_end_3a} :catch_e

    :goto_3a
    :try_start_3b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_KOIZORA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_3b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3b .. :try_end_3b} :catch_d

    :goto_3b
    :try_start_3c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LATTE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_3c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3c .. :try_end_3c} :catch_c

    :goto_3c
    :try_start_3d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_3d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3d .. :try_end_3d} :catch_b

    :goto_3d
    :try_start_3e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIVELY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_3e} :catch_a

    :goto_3e
    :try_start_3f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_QUIET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_3f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3f .. :try_end_3f} :catch_9

    :goto_3f
    :try_start_40
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_SODA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_40} :catch_8

    :goto_40
    :try_start_41
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WARM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_41 .. :try_end_41} :catch_7

    :goto_41
    :try_start_42
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_42
    .catch Ljava/lang/NoSuchFieldError; {:try_start_42 .. :try_end_42} :catch_6

    :goto_42
    :try_start_43
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_BYGONE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_43
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_43} :catch_5

    :goto_43
    :try_start_44
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x17

    aput v2, v0, v1
    :try_end_44
    .catch Ljava/lang/NoSuchFieldError; {:try_start_44 .. :try_end_44} :catch_4

    :goto_44
    :try_start_45
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FOREST:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x18

    aput v2, v0, v1
    :try_end_45
    .catch Ljava/lang/NoSuchFieldError; {:try_start_45 .. :try_end_45} :catch_3

    :goto_45
    :try_start_46
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_POLAROID:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x19

    aput v2, v0, v1
    :try_end_46
    .catch Ljava/lang/NoSuchFieldError; {:try_start_46 .. :try_end_46} :catch_2

    :goto_46
    :try_start_47
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1a

    aput v2, v0, v1
    :try_end_47
    .catch Ljava/lang/NoSuchFieldError; {:try_start_47 .. :try_end_47} :catch_1

    :goto_47
    :try_start_48
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_YEARS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1b

    aput v2, v0, v1
    :try_end_48
    .catch Ljava/lang/NoSuchFieldError; {:try_start_48 .. :try_end_48} :catch_0

    :goto_48
    sput-object v0, Lcom/android/camera/effect/EffectController;->-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_48

    :catch_1
    move-exception v1

    goto :goto_47

    :catch_2
    move-exception v1

    goto :goto_46

    :catch_3
    move-exception v1

    goto :goto_45

    :catch_4
    move-exception v1

    goto :goto_44

    :catch_5
    move-exception v1

    goto :goto_43

    :catch_6
    move-exception v1

    goto :goto_42

    :catch_7
    move-exception v1

    goto :goto_41

    :catch_8
    move-exception v1

    goto :goto_40

    :catch_9
    move-exception v1

    goto :goto_3f

    :catch_a
    move-exception v1

    goto :goto_3e

    :catch_b
    move-exception v1

    goto/16 :goto_3d

    :catch_c
    move-exception v1

    goto/16 :goto_3c

    :catch_d
    move-exception v1

    goto/16 :goto_3b

    :catch_e
    move-exception v1

    goto/16 :goto_3a

    :catch_f
    move-exception v1

    goto/16 :goto_39

    :catch_10
    move-exception v1

    goto/16 :goto_38

    :catch_11
    move-exception v1

    goto/16 :goto_37

    :catch_12
    move-exception v1

    goto/16 :goto_36

    :catch_13
    move-exception v1

    goto/16 :goto_35

    :catch_14
    move-exception v1

    goto/16 :goto_34

    :catch_15
    move-exception v1

    goto/16 :goto_33

    :catch_16
    move-exception v1

    goto/16 :goto_32

    :catch_17
    move-exception v1

    goto/16 :goto_31

    :catch_18
    move-exception v1

    goto/16 :goto_30

    :catch_19
    move-exception v1

    goto/16 :goto_2f

    :catch_1a
    move-exception v1

    goto/16 :goto_2e

    :catch_1b
    move-exception v1

    goto/16 :goto_2d

    :catch_1c
    move-exception v1

    goto/16 :goto_2c

    :catch_1d
    move-exception v1

    goto/16 :goto_2b

    :catch_1e
    move-exception v1

    goto/16 :goto_2a

    :catch_1f
    move-exception v1

    goto/16 :goto_29

    :catch_20
    move-exception v1

    goto/16 :goto_28

    :catch_21
    move-exception v1

    goto/16 :goto_27

    :catch_22
    move-exception v1

    goto/16 :goto_26

    :catch_23
    move-exception v1

    goto/16 :goto_25

    :catch_24
    move-exception v1

    goto/16 :goto_24

    :catch_25
    move-exception v1

    goto/16 :goto_23

    :catch_26
    move-exception v1

    goto/16 :goto_22

    :catch_27
    move-exception v1

    goto/16 :goto_21

    :catch_28
    move-exception v1

    goto/16 :goto_20

    :catch_29
    move-exception v1

    goto/16 :goto_1f

    :catch_2a
    move-exception v1

    goto/16 :goto_1e

    :catch_2b
    move-exception v1

    goto/16 :goto_1d

    :catch_2c
    move-exception v1

    goto/16 :goto_1c

    :catch_2d
    move-exception v1

    goto/16 :goto_1b

    :catch_2e
    move-exception v1

    goto/16 :goto_1a

    :catch_2f
    move-exception v1

    goto/16 :goto_19

    :catch_30
    move-exception v1

    goto/16 :goto_18

    :catch_31
    move-exception v1

    goto/16 :goto_17

    :catch_32
    move-exception v1

    goto/16 :goto_16

    :catch_33
    move-exception v1

    goto/16 :goto_15

    :catch_34
    move-exception v1

    goto/16 :goto_14

    :catch_35
    move-exception v1

    goto/16 :goto_13

    :catch_36
    move-exception v1

    goto/16 :goto_12

    :catch_37
    move-exception v1

    goto/16 :goto_11

    :catch_38
    move-exception v1

    goto/16 :goto_10

    :catch_39
    move-exception v1

    goto/16 :goto_f

    :catch_3a
    move-exception v1

    goto/16 :goto_e

    :catch_3b
    move-exception v1

    goto/16 :goto_d

    :catch_3c
    move-exception v1

    goto/16 :goto_c

    :catch_3d
    move-exception v1

    goto/16 :goto_b

    :catch_3e
    move-exception v1

    goto/16 :goto_a

    :catch_3f
    move-exception v1

    goto/16 :goto_9

    :catch_40
    move-exception v1

    goto/16 :goto_8

    :catch_41
    move-exception v1

    goto/16 :goto_7

    :catch_42
    move-exception v1

    goto/16 :goto_6

    :catch_43
    move-exception v1

    goto/16 :goto_5

    :catch_44
    move-exception v1

    goto/16 :goto_4

    :catch_45
    move-exception v1

    goto/16 :goto_3

    :catch_46
    move-exception v1

    goto/16 :goto_2

    :catch_47
    move-exception v1

    goto/16 :goto_1

    :catch_48
    move-exception v1

    goto/16 :goto_0
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/android/camera/effect/EffectController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/EffectController;->TAG:Ljava/lang/String;

    .line 105
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 104
    sput-object v0, Lcom/android/camera/effect/EffectController;->EFFECT_ALL_CHANGE_TYPES:[I

    .line 51
    return-void

    .line 105
    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
    .end array-data
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideEffectIndex:I

    .line 64
    iput v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideAiEffectIndex:I

    .line 66
    iput v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    .line 67
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mBlur:Z

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mIsDrawMainFrame:Z

    .line 69
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    iput v0, p0, Lcom/android/camera/effect/EffectController;->mEffectId:I

    .line 73
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mBeautyEnable:Z

    .line 74
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mNeedDestroyMakeup:Z

    .line 75
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mBeautyFrameReady:Z

    .line 83
    new-instance v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-direct {v0, v2, v2}, Lcom/android/camera/effect/EffectController$EffectRectAttribute;-><init>(Lcom/android/camera/effect/EffectController$EffectRectAttribute;Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    iput-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/EffectController;->mChangedListeners:Ljava/util/List;

    .line 143
    invoke-direct {p0}, Lcom/android/camera/effect/EffectController;->initialize()V

    .line 144
    return-void
.end method

.method private convertToFilterScene(I)Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;
    .locals 1
    .param p1, "category"    # I

    .prologue
    .line 888
    packed-switch p1, :pswitch_data_0

    .line 898
    :pswitch_0
    sget-object v0, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->NONE:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    return-object v0

    .line 890
    :pswitch_1
    sget-object v0, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->NORMAL:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    return-object v0

    .line 892
    :pswitch_2
    sget-object v0, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    return-object v0

    .line 894
    :pswitch_3
    sget-object v0, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->STICKER:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    return-object v0

    .line 896
    :pswitch_4
    sget-object v0, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->AI:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    return-object v0

    .line 888
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method private getAiSceneRenderNew(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isWhole"    # Z
    .param p4, "isSnapshot"    # Z
    .param p5, "renderId"    # I

    .prologue
    .line 753
    if-eqz p3, :cond_0

    .line 754
    const/4 v0, 0x5

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/android/camera/effect/EffectController;->getRenderByCategory(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;IZ)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0

    .line 756
    :cond_0
    invoke-direct {p0, p1, p2, p4, p5}, Lcom/android/camera/effect/EffectController;->getRenderById(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0
.end method

.method private getBeautyRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 2
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isWhole"    # Z
    .param p4, "renderId"    # I

    .prologue
    const/4 v1, 0x0

    .line 771
    if-eqz p3, :cond_0

    .line 772
    const/4 v0, 0x2

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/camera/effect/EffectController;->getRenderByCategory(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;IZ)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0

    .line 774
    :cond_0
    invoke-direct {p0, p1, p2, v1, p4}, Lcom/android/camera/effect/EffectController;->getRenderById(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0
.end method

.method private getDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I
    .locals 5
    .param p1, "type"    # Lcom/miui/filtersdk/filter/helper/FilterType;

    .prologue
    const/16 v4, 0x50

    const/16 v3, 0x46

    const/16 v2, 0x3c

    .line 858
    invoke-static {}, Lcom/android/camera/effect/EffectController;->-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 883
    :pswitch_0
    const/16 v0, 0x64

    return v0

    .line 860
    :pswitch_1
    return v2

    .line 862
    :pswitch_2
    return v3

    .line 869
    :pswitch_3
    return v4

    .line 874
    :pswitch_4
    const/16 v0, 0x32

    return v0

    .line 877
    :pswitch_5
    return v2

    .line 879
    :pswitch_6
    return v3

    .line 881
    :pswitch_7
    return v4

    .line 858
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public static declared-synchronized getInstance()Lcom/android/camera/effect/EffectController;
    .locals 2

    .prologue
    const-class v1, Lcom/android/camera/effect/EffectController;

    monitor-enter v1

    .line 147
    :try_start_0
    sget-object v0, Lcom/android/camera/effect/EffectController;->sInstance:Lcom/android/camera/effect/EffectController;

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Lcom/android/camera/effect/EffectController;

    invoke-direct {v0}, Lcom/android/camera/effect/EffectController;-><init>()V

    sput-object v0, Lcom/android/camera/effect/EffectController;->sInstance:Lcom/android/camera/effect/EffectController;

    .line 150
    :cond_0
    sget-object v0, Lcom/android/camera/effect/EffectController;->sInstance:Lcom/android/camera/effect/EffectController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getMakeupRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 5
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;

    .prologue
    .line 788
    new-instance v1, Lcom/miui/filtersdk/filter/NewBeautificationFilter;

    invoke-direct {v1}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;-><init>()V

    .line 790
    .local v1, "filter":Lcom/miui/filtersdk/filter/NewBeautificationFilter;
    new-instance v0, Lcom/android/camera/effect/ArcsoftBeautyProcessor;

    invoke-direct {v0}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;-><init>()V

    .line 791
    .local v0, "beautyProcessor":Lcom/android/camera/effect/ArcsoftBeautyProcessor;
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v3, 0x10e

    :goto_0
    invoke-virtual {v0, v3}, Lcom/android/camera/effect/ArcsoftBeautyProcessor;->setRotation(I)V

    .line 792
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/android/camera/effect/BeautyParameters;->setMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V

    .line 793
    invoke-virtual {v1, v0}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->setBeautyProcessor(Lcom/miui/filtersdk/beauty/BeautyProcessor;)V

    .line 794
    sget v3, Lcom/android/camera/Util;->sWindowWidth:I

    sget v4, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v1, v3, v4}, Lcom/miui/filtersdk/filter/NewBeautificationFilter;->initBeautyProcessor(II)V

    .line 796
    new-instance v2, Lcom/android/camera/effect/renders/BeautificationWrapperRender;

    sget v3, Lcom/android/camera/effect/FilterInfo;->RENDER_ID_MAKEUP:I

    .line 797
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v4

    .line 796
    invoke-direct {v2, p1, v3, v1, v4}, Lcom/android/camera/effect/renders/BeautificationWrapperRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/miui/filtersdk/filter/base/GPUImageFilter;Z)V

    .line 799
    .local v2, "render":Lcom/android/camera/effect/renders/BeautificationWrapperRender;
    invoke-virtual {p2, v2}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 800
    return-object p2

    .line 791
    .end local v2    # "render":Lcom/android/camera/effect/renders/BeautificationWrapperRender;
    :cond_0
    const/16 v3, 0x5a

    goto :goto_0
.end method

.method private getNormalRenderNew(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 1
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isWhole"    # Z
    .param p4, "isSnapshot"    # Z
    .param p5, "renderId"    # I

    .prologue
    .line 762
    if-eqz p3, :cond_0

    .line 763
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/android/camera/effect/EffectController;->getRenderByCategory(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;IZ)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0

    .line 765
    :cond_0
    invoke-direct {p0, p1, p2, p4, p5}, Lcom/android/camera/effect/EffectController;->getRenderById(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0
.end method

.method private getPrivateRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 10
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isWhole"    # Z
    .param p4, "isSnapshot"    # Z
    .param p5, "id"    # I

    .prologue
    .line 656
    const/4 v6, 0x0

    .line 658
    .local v6, "initOne":Z
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_4

    .line 659
    if-nez p3, :cond_0

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    if-ne p5, v0, :cond_13

    .line 660
    :cond_0
    :goto_0
    if-nez p3, :cond_1

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    if-ne p5, v0, :cond_14

    .line 661
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 662
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    instance-of v7, v0, Lcom/android/camera/effect/renders/XBlurEffectRender;

    .line 663
    :goto_1
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 664
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    instance-of v8, v0, Lcom/android/camera/effect/renders/YBlurEffectRender;

    .line 666
    :goto_2
    new-instance v0, Lcom/android/camera/effect/renders/PipeRenderPair;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    .line 667
    if-eqz v7, :cond_17

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v3

    .line 668
    :goto_3
    if-eqz v8, :cond_18

    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 669
    :goto_4
    const/4 v5, 0x0

    move-object v1, p1

    .line 666
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/PipeRenderPair;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/renders/Render;Z)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 670
    if-nez v7, :cond_2

    if-eqz v8, :cond_3

    .line 671
    :cond_2
    invoke-virtual {p2}, Lcom/android/camera/effect/renders/RenderGroup;->clearPartRenders()V

    .line 678
    :cond_3
    :goto_5
    const/4 v6, 0x1

    .line 681
    :cond_4
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_6

    .line 682
    if-nez p3, :cond_5

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    if-ne p5, v0, :cond_1a

    .line 683
    :cond_5
    :goto_6
    if-eqz p4, :cond_1b

    .line 684
    new-instance v0, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {v0, p1, v1}, Lcom/android/camera/effect/renders/GradienterSnapshotEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 683
    :goto_7
    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 686
    const/4 v6, 0x1

    .line 689
    :cond_6
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_a

    .line 690
    invoke-static {}, Lcom/android/camera/Device;->isSupportedTiltShift()Z

    move-result v0

    .line 689
    if-eqz v0, :cond_a

    .line 691
    if-nez p3, :cond_7

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    if-ne p5, v0, :cond_1c

    .line 692
    :cond_7
    :goto_8
    if-nez p3, :cond_8

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    if-ne p5, v0, :cond_1d

    .line 693
    :cond_8
    new-instance v0, Lcom/android/camera/effect/renders/PipeRenderPair;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    .line 694
    new-instance v3, Lcom/android/camera/effect/renders/PipeRenderPair;

    .line 695
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_1e

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 696
    :goto_9
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    if-eqz v4, :cond_1f

    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 697
    :goto_a
    const/4 v5, 0x0

    .line 694
    invoke-direct {v3, p1, v1, v4, v5}, Lcom/android/camera/effect/renders/PipeRenderPair;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/renders/Render;Z)V

    .line 698
    const/4 v1, 0x2

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_20

    const/4 v1, 0x2

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 699
    :goto_b
    const/4 v5, 0x0

    move-object v1, p1

    .line 693
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/PipeRenderPair;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/renders/Render;Z)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 700
    invoke-virtual {p2}, Lcom/android/camera/effect/renders/RenderGroup;->clearPartRenders()V

    .line 708
    :cond_9
    :goto_c
    const/4 v6, 0x1

    .line 711
    :cond_a
    const-string/jumbo v0, "is_camera_replace_higher_cost_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_e

    .line 712
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_e

    .line 713
    if-nez p3, :cond_b

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    if-ne p5, v0, :cond_23

    .line 714
    :cond_b
    :goto_d
    if-nez p3, :cond_c

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    if-ne p5, v0, :cond_24

    .line 715
    :cond_c
    new-instance v0, Lcom/android/camera/effect/renders/PipeRenderPair;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    .line 716
    new-instance v3, Lcom/android/camera/effect/renders/PipeRenderPair;

    .line 717
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_25

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 718
    :goto_e
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    if-eqz v4, :cond_26

    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 719
    :goto_f
    const/4 v5, 0x0

    .line 716
    invoke-direct {v3, p1, v1, v4, v5}, Lcom/android/camera/effect/renders/PipeRenderPair;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/renders/Render;Z)V

    .line 720
    const/4 v1, 0x2

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_27

    const/4 v1, 0x2

    invoke-virtual {p2, v1}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    .line 721
    :goto_10
    const/4 v5, 0x0

    move-object v1, p1

    .line 715
    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/PipeRenderPair;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/renders/Render;Z)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 722
    invoke-virtual {p2}, Lcom/android/camera/effect/renders/RenderGroup;->clearPartRenders()V

    .line 730
    :cond_d
    :goto_11
    const/4 v6, 0x1

    .line 734
    :cond_e
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_PEAKINGMF:I

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_10

    .line 735
    invoke-static {}, Lcom/android/camera/Device;->isSupportedPeakingMF()Z

    move-result v0

    .line 734
    if-eqz v0, :cond_10

    .line 735
    xor-int/lit8 v0, p4, 0x1

    .line 734
    if-eqz v0, :cond_10

    .line 736
    if-nez p3, :cond_f

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_PEAKINGMF:I

    if-ne p5, v0, :cond_2a

    .line 737
    :cond_f
    :goto_12
    new-instance v0, Lcom/android/camera/effect/renders/FocusPeakingRender;

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_PEAKINGMF:I

    invoke-direct {v0, p1, v1}, Lcom/android/camera/effect/renders/FocusPeakingRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 740
    :cond_10
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_STICKER:I

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_12

    .line 741
    if-nez p3, :cond_11

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_STICKER:I

    if-ne p5, v0, :cond_2b

    .line 743
    :cond_11
    :goto_13
    new-instance v9, Lcom/android/camera/effect/renders/StickerRender;

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_STICKER:I

    invoke-virtual {p0}, Lcom/android/camera/effect/EffectController;->getCurrentSticker()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, p1, v0, v1}, Lcom/android/camera/effect/renders/StickerRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILjava/lang/String;)V

    .line 744
    .local v9, "render":Lcom/android/camera/effect/renders/StickerRender;
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v0

    invoke-virtual {v9}, Lcom/android/camera/effect/renders/StickerRender;->getMakeupProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/BeautyParameters;->setStickerMakeupProcessor(Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;)V

    .line 745
    invoke-virtual {p2, v9}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 748
    .end local v9    # "render":Lcom/android/camera/effect/renders/StickerRender;
    :cond_12
    return-object p2

    .line 659
    :cond_13
    if-gez p5, :cond_4

    goto/16 :goto_0

    .line 660
    :cond_14
    const/4 v0, 0x2

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->isPartComplete(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 673
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_19

    .line 674
    new-instance v0, Lcom/android/camera/effect/renders/XBlurEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/XBlurEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_5

    .line 661
    :cond_15
    const/4 v7, 0x0

    .local v7, "matchPartRender0":Z
    goto/16 :goto_1

    .line 663
    .end local v7    # "matchPartRender0":Z
    :cond_16
    const/4 v8, 0x0

    .local v8, "matchPartRender1":Z
    goto/16 :goto_2

    .line 667
    .end local v8    # "matchPartRender1":Z
    :cond_17
    new-instance v3, Lcom/android/camera/effect/renders/XBlurEffectRender;

    invoke-direct {v3, p1}, Lcom/android/camera/effect/renders/XBlurEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_3

    .line 668
    :cond_18
    new-instance v4, Lcom/android/camera/effect/renders/YBlurEffectRender;

    invoke-direct {v4, p1}, Lcom/android/camera/effect/renders/YBlurEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_4

    .line 675
    :cond_19
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_3

    .line 676
    new-instance v0, Lcom/android/camera/effect/renders/YBlurEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/YBlurEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_5

    .line 682
    :cond_1a
    if-gez p5, :cond_6

    xor-int/lit8 v0, v6, 0x1

    .line 681
    if-eqz v0, :cond_6

    goto/16 :goto_6

    .line 685
    :cond_1b
    new-instance v0, Lcom/android/camera/effect/renders/GradienterEffectRender;

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {v0, p1, v1}, Lcom/android/camera/effect/renders/GradienterEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    goto/16 :goto_7

    .line 691
    :cond_1c
    if-gez p5, :cond_a

    xor-int/lit8 v0, v6, 0x1

    .line 689
    if-eqz v0, :cond_a

    goto/16 :goto_8

    .line 692
    :cond_1d
    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->isPartComplete(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 701
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_21

    .line 702
    new-instance v0, Lcom/android/camera/effect/renders/XTiltShiftEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/XTiltShiftEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_c

    .line 695
    :cond_1e
    new-instance v1, Lcom/android/camera/effect/renders/XTiltShiftEffectRender;

    invoke-direct {v1, p1}, Lcom/android/camera/effect/renders/XTiltShiftEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_9

    .line 696
    :cond_1f
    new-instance v4, Lcom/android/camera/effect/renders/YTiltShiftEffectRender;

    invoke-direct {v4, p1}, Lcom/android/camera/effect/renders/YTiltShiftEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_a

    .line 698
    :cond_20
    new-instance v4, Lcom/android/camera/effect/renders/TiltShiftMaskEffectRender;

    invoke-direct {v4, p1}, Lcom/android/camera/effect/renders/TiltShiftMaskEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_b

    .line 703
    :cond_21
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_22

    .line 704
    new-instance v0, Lcom/android/camera/effect/renders/YTiltShiftEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/YTiltShiftEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_c

    .line 705
    :cond_22
    const/4 v0, 0x2

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_9

    .line 706
    new-instance v0, Lcom/android/camera/effect/renders/TiltShiftMaskEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/TiltShiftMaskEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_c

    .line 713
    :cond_23
    if-gez p5, :cond_e

    xor-int/lit8 v0, v6, 0x1

    .line 712
    if-eqz v0, :cond_e

    goto/16 :goto_d

    .line 714
    :cond_24
    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->isPartComplete(I)Z

    move-result v0

    if-nez v0, :cond_c

    .line 723
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_28

    .line 724
    new-instance v0, Lcom/android/camera/effect/renders/XGaussianEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/XGaussianEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_11

    .line 717
    :cond_25
    new-instance v1, Lcom/android/camera/effect/renders/XGaussianEffectRender;

    invoke-direct {v1, p1}, Lcom/android/camera/effect/renders/XGaussianEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_e

    .line 718
    :cond_26
    new-instance v4, Lcom/android/camera/effect/renders/YGaussianEffectRender;

    invoke-direct {v4, p1}, Lcom/android/camera/effect/renders/YGaussianEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_f

    .line 720
    :cond_27
    new-instance v4, Lcom/android/camera/effect/renders/GaussianMaskEffectRender;

    invoke-direct {v4, p1}, Lcom/android/camera/effect/renders/GaussianMaskEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto/16 :goto_10

    .line 725
    :cond_28
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_29

    .line 726
    new-instance v0, Lcom/android/camera/effect/renders/YGaussianEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/YGaussianEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_11

    .line 727
    :cond_29
    const/4 v0, 0x2

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->getPartRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v0

    if-nez v0, :cond_d

    .line 728
    new-instance v0, Lcom/android/camera/effect/renders/GaussianMaskEffectRender;

    invoke-direct {v0, p1}, Lcom/android/camera/effect/renders/GaussianMaskEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/renders/RenderGroup;->addPartRender(Lcom/android/camera/effect/renders/Render;)V

    goto/16 :goto_11

    .line 736
    :cond_2a
    if-gez p5, :cond_10

    xor-int/lit8 v0, v6, 0x1

    .line 734
    if-eqz v0, :cond_10

    goto/16 :goto_12

    .line 741
    :cond_2b
    if-gez p5, :cond_12

    xor-int/lit8 v0, v6, 0x1

    .line 740
    if-eqz v0, :cond_12

    goto/16 :goto_13
.end method

.method private getRenderByCategory(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;IZ)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 6
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "category"    # I
    .param p4, "isSnapshot"    # Z

    .prologue
    .line 806
    invoke-direct {p0, p3}, Lcom/android/camera/effect/EffectController;->convertToFilterScene(I)Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    move-result-object v4

    .line 807
    .local v4, "scene":Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;
    sget-object v5, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->NONE:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    if-ne v4, v5, :cond_0

    .line 808
    return-object p2

    .line 811
    :cond_0
    invoke-virtual {p0, p3}, Lcom/android/camera/effect/EffectController;->getFilterInfo(I)Ljava/util/ArrayList;

    move-result-object v2

    .line 812
    .local v2, "infoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    if-eqz v2, :cond_1

    .line 813
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "info$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/FilterInfo;

    .line 814
    .local v0, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v0}, Lcom/android/camera/effect/FilterInfo;->getId()I

    move-result v3

    .line 815
    .local v3, "renderId":I
    invoke-direct {p0, p1, p2, p4, v3}, Lcom/android/camera/effect/EffectController;->getRenderById(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 819
    .end local v0    # "info":Lcom/android/camera/effect/FilterInfo;
    .end local v1    # "info$iterator":Ljava/util/Iterator;
    .end local v3    # "renderId":I
    :cond_1
    return-object p2
.end method

.method private getRenderById(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 7
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isSnapshot"    # Z
    .param p4, "renderId"    # I

    .prologue
    const/4 v4, 0x0

    .line 824
    if-gez p4, :cond_0

    .line 825
    return-object p2

    .line 827
    :cond_0
    sget v5, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne p4, v5, :cond_2

    .line 828
    sget v5, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p2, v5}, Lcom/android/camera/effect/renders/RenderGroup;->isNeedInit(I)Z

    move-result v5

    .line 827
    if-eqz v5, :cond_2

    .line 830
    if-eqz p3, :cond_1

    new-instance v4, Lcom/android/camera/effect/renders/NoneEffectRender;

    sget v5, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-direct {v4, p1, v5}, Lcom/android/camera/effect/renders/NoneEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 829
    :cond_1
    invoke-virtual {p2, v4}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 831
    return-object p2

    .line 834
    :cond_2
    sget v5, Lcom/android/camera/effect/FilterInfo;->AI_SCENE_FILTER_ID_0_NONE:I

    if-ne p4, v5, :cond_4

    .line 835
    sget v5, Lcom/android/camera/effect/FilterInfo;->AI_SCENE_FILTER_ID_0_NONE:I

    invoke-virtual {p2, v5}, Lcom/android/camera/effect/renders/RenderGroup;->isNeedInit(I)Z

    move-result v5

    .line 834
    if-eqz v5, :cond_4

    .line 836
    if-eqz p3, :cond_3

    .line 837
    new-instance v4, Lcom/android/camera/effect/renders/NoneEffectRender;

    sget v5, Lcom/android/camera/effect/FilterInfo;->AI_SCENE_FILTER_ID_0_NONE:I

    invoke-direct {v4, p1, v5}, Lcom/android/camera/effect/renders/NoneEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    .line 836
    :cond_3
    invoke-virtual {p2, v4}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 838
    return-object p2

    .line 841
    :cond_4
    invoke-virtual {p2, p4}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v4

    if-nez v4, :cond_6

    .line 842
    invoke-static {p4}, Lcom/android/camera/effect/FilterInfo;->getIndex(I)I

    move-result v1

    .line 843
    .local v1, "index":I
    sget-object v4, Lcom/android/camera/effect/EffectController;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "getRenderById: index = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 844
    const/4 v4, -0x1

    if-le v1, v4, :cond_6

    invoke-static {}, Lcom/miui/filtersdk/filter/helper/FilterType;->values()[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v4

    array-length v4, v4

    if-ge v1, v4, :cond_6

    .line 845
    invoke-static {}, Lcom/miui/filtersdk/filter/helper/FilterType;->values()[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v4

    aget-object v3, v4, v1

    .line 846
    .local v3, "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    invoke-static {v3}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFilterByType(Lcom/miui/filtersdk/filter/helper/FilterType;)Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    move-result-object v0

    .line 847
    .local v0, "filter":Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
    if-eqz v0, :cond_5

    .line 848
    invoke-direct {p0, v3}, Lcom/android/camera/effect/EffectController;->getDegree(Lcom/miui/filtersdk/filter/helper/FilterType;)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->setDegree(I)V

    .line 850
    :cond_5
    new-instance v2, Lcom/android/camera/effect/renders/WrapperRender;

    invoke-direct {v2, p1, p4, v0}, Lcom/android/camera/effect/renders/WrapperRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;ILcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    .line 851
    .local v2, "render":Lcom/android/camera/effect/renders/WrapperRender;
    invoke-virtual {p2, v2}, Lcom/android/camera/effect/renders/RenderGroup;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 854
    .end local v0    # "filter":Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
    .end local v1    # "index":I
    .end local v2    # "render":Lcom/android/camera/effect/renders/WrapperRender;
    .end local v3    # "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    :cond_6
    return-object p2
.end method

.method private getStickerRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 2
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isWhole"    # Z
    .param p4, "renderId"    # I

    .prologue
    const/4 v1, 0x0

    .line 780
    if-eqz p3, :cond_0

    .line 781
    const/4 v0, 0x3

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/camera/effect/EffectController;->getRenderByCategory(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;IZ)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0

    .line 783
    :cond_0
    invoke-direct {p0, p1, p2, v1, p4}, Lcom/android/camera/effect/EffectController;->getRenderById(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    return-object v0
.end method

.method private initAiSceneFilterInfo()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 419
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v0, "filters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    sget-object v6, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->AI:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v6}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v4

    .line 421
    .local v4, "types":[Lcom/miui/filtersdk/filter/helper/FilterType;
    const/4 v1, 0x0

    .line 423
    .local v1, "order":I
    new-instance v6, Lcom/android/camera/effect/FilterInfo;

    sget v7, Lcom/android/camera/effect/FilterInfo;->AI_SCENE_FILTER_ID_0_NONE:I

    const/4 v1, 0x1

    invoke-direct {v6, v7, v5}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    array-length v6, v4

    move v2, v1

    .end local v1    # "order":I
    .local v2, "order":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v3, v4, v5

    .line 425
    .local v3, "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    new-instance v7, Lcom/android/camera/effect/FilterInfo;

    invoke-virtual {v3}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v8

    const/4 v9, 0x5

    invoke-static {v9, v8}, Lcom/android/camera/effect/FilterInfo;->getId(II)I

    move-result v8

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "order":I
    .restart local v1    # "order":I
    invoke-direct {v7, v8, v2}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    add-int/lit8 v5, v5, 0x1

    move v2, v1

    .end local v1    # "order":I
    .restart local v2    # "order":I
    goto :goto_0

    .line 427
    .end local v3    # "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    :cond_0
    return-object v0
.end method

.method private initNormalFilterInfoNew()Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 458
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 459
    .local v6, "filters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    const/4 v5, 0x0

    .line 461
    .local v5, "order":I
    new-instance v7, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    .line 462
    const v10, 0x7f0f005f

    .line 463
    const v11, 0x7f02001b

    .line 461
    invoke-direct {v7, v2, v10, v11, v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 465
    .local v7, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 466
    sget-object v2, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->NORMAL:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v2}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v9

    .line 467
    .local v9, "types":[Lcom/miui/filtersdk/filter/helper/FilterType;
    const/4 v3, 0x0

    .line 468
    .local v3, "nameResId":I
    const/4 v4, 0x0

    .line 469
    .local v4, "iconResId":I
    array-length v11, v9

    move v10, v1

    :goto_0
    if-ge v10, v11, :cond_1

    aget-object v8, v9, v10

    .line 470
    .local v8, "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    invoke-static {}, Lcom/android/camera/effect/EffectController;->-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 539
    :goto_1
    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    .line 540
    new-instance v0, Lcom/android/camera/effect/FilterInfo;

    .line 541
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    .line 540
    const/4 v1, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 542
    .local v0, "filter":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 543
    const/4 v3, 0x0

    .line 544
    const/4 v4, 0x0

    .line 469
    .end local v0    # "filter":Lcom/android/camera/effect/FilterInfo;
    :cond_0
    add-int/lit8 v1, v10, 0x1

    move v10, v1

    goto :goto_0

    .line 472
    :pswitch_0
    const/16 v5, 0xa

    .line 473
    const v3, 0x7f0f0060

    .line 474
    const v4, 0x7f02001e

    .line 475
    goto :goto_1

    .line 477
    :pswitch_1
    const/16 v5, 0x14

    .line 478
    const v3, 0x7f0f0061

    .line 479
    const v4, 0x7f020017

    .line 480
    goto :goto_1

    .line 482
    :pswitch_2
    const/16 v5, 0x1e

    .line 483
    const v3, 0x7f0f0062

    .line 484
    const v4, 0x7f020019

    .line 485
    goto :goto_1

    .line 487
    :pswitch_3
    const/16 v5, 0x28

    .line 488
    const v3, 0x7f0f0063

    .line 489
    const v4, 0x7f02001a

    .line 490
    goto :goto_1

    .line 492
    :pswitch_4
    const/16 v5, 0x32

    .line 493
    const v3, 0x7f0f0064

    .line 494
    const v4, 0x7f02001f

    .line 495
    goto :goto_1

    .line 497
    :pswitch_5
    const/16 v5, 0x3c

    .line 498
    const v3, 0x7f0f0065

    .line 499
    const v4, 0x7f020014

    .line 500
    goto :goto_1

    .line 502
    :pswitch_6
    const/16 v5, 0x46

    .line 503
    const v3, 0x7f0f0066

    .line 504
    const v4, 0x7f02001c

    .line 505
    goto :goto_1

    .line 507
    :pswitch_7
    const/16 v5, 0x50

    .line 508
    const v3, 0x7f0f0067

    .line 509
    const v4, 0x7f02001d

    .line 510
    goto :goto_1

    .line 512
    :pswitch_8
    const/16 v5, 0x5a

    .line 513
    const v3, 0x7f0f0068

    .line 514
    const v4, 0x7f020015

    .line 515
    goto :goto_1

    .line 517
    :pswitch_9
    const/16 v5, 0x64

    .line 518
    const v3, 0x7f0f0069

    .line 519
    const v4, 0x7f020018

    .line 520
    goto :goto_1

    .line 522
    :pswitch_a
    const/16 v5, 0x6e

    .line 523
    const v3, 0x7f0f006a

    .line 524
    const v4, 0x7f020012

    .line 525
    goto :goto_1

    .line 527
    :pswitch_b
    const/16 v5, 0x78

    .line 528
    const v3, 0x7f0f006b

    .line 529
    const v4, 0x7f020013

    .line 530
    goto/16 :goto_1

    .line 532
    :pswitch_c
    const/16 v5, 0x82

    .line 533
    const v3, 0x7f0f006c

    .line 534
    const v4, 0x7f020016

    .line 535
    goto/16 :goto_1

    .line 547
    .end local v8    # "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    :cond_1
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 548
    return-object v6

    .line 470
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_a
        :pswitch_5
        :pswitch_8
        :pswitch_c
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_9
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_4
        :pswitch_b
    .end packed-switch
.end method

.method private initPrivateFilterInfo()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 431
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 432
    .local v0, "filters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    const/4 v2, 0x0

    .line 434
    .local v2, "order":I
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    .line 432
    const/4 v5, 0x0

    .line 434
    const/4 v2, 0x1

    invoke-direct {v1, v4, v5}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    .line 435
    .local v1, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 437
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    .end local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "order":I
    .local v3, "order":I
    invoke-direct {v1, v4, v2}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    .line 438
    .restart local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 440
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    .end local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "order":I
    .restart local v2    # "order":I
    invoke-direct {v1, v4, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    .line 441
    .restart local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v1, v6}, Lcom/android/camera/effect/FilterInfo;->setNeedRect(Z)V

    .line 442
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    .end local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "order":I
    .restart local v3    # "order":I
    invoke-direct {v1, v4, v2}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    .line 445
    .restart local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v1, v6}, Lcom/android/camera/effect/FilterInfo;->setNeedRect(Z)V

    .line 446
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 448
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    .end local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_PEAKINGMF:I

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "order":I
    .restart local v2    # "order":I
    invoke-direct {v1, v4, v3}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    .line 449
    .restart local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    new-instance v1, Lcom/android/camera/effect/FilterInfo;

    .end local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    sget v4, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_STICKER:I

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "order":I
    .restart local v3    # "order":I
    invoke-direct {v1, v4, v2}, Lcom/android/camera/effect/FilterInfo;-><init>(II)V

    .line 452
    .restart local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 454
    return-object v0
.end method

.method private initStickerFilterInfo()Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 552
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 553
    .local v6, "filters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    const/4 v5, 0x0

    .line 555
    .local v5, "order":I
    new-instance v7, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    .line 556
    const v10, 0x7f0f005f

    .line 557
    const v11, 0x7f020145

    .line 555
    invoke-direct {v7, v2, v10, v11, v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 559
    .local v7, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 560
    sget-object v2, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->STICKER:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v2}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v9

    .line 561
    .local v9, "types":[Lcom/miui/filtersdk/filter/helper/FilterType;
    const/4 v3, 0x0

    .line 562
    .local v3, "nameResId":I
    const/4 v4, 0x0

    .line 563
    .local v4, "iconResId":I
    array-length v11, v9

    move v10, v1

    :goto_0
    if-ge v10, v11, :cond_1

    aget-object v8, v9, v10

    .line 564
    .local v8, "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    invoke-static {}, Lcom/android/camera/effect/EffectController;->-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 598
    :goto_1
    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    .line 599
    new-instance v0, Lcom/android/camera/effect/FilterInfo;

    .line 600
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    .line 599
    const/4 v1, 0x3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 601
    .local v0, "filter":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 602
    const/4 v3, 0x0

    .line 603
    const/4 v4, 0x0

    .line 563
    .end local v0    # "filter":Lcom/android/camera/effect/FilterInfo;
    :cond_0
    add-int/lit8 v1, v10, 0x1

    move v10, v1

    goto :goto_0

    .line 566
    :pswitch_0
    const/16 v5, 0xa

    .line 567
    const v3, 0x7f0f006d

    .line 568
    const v4, 0x7f020142

    .line 569
    goto :goto_1

    .line 571
    :pswitch_1
    const/16 v5, 0x14

    .line 572
    const v3, 0x7f0f006e

    .line 573
    const v4, 0x7f020144

    .line 574
    goto :goto_1

    .line 576
    :pswitch_2
    const/16 v5, 0x1e

    .line 577
    const v3, 0x7f0f006f

    .line 578
    const v4, 0x7f020146

    .line 579
    goto :goto_1

    .line 581
    :pswitch_3
    const/16 v5, 0x28

    .line 582
    const v3, 0x7f0f0070

    .line 583
    const v4, 0x7f020143

    .line 584
    goto :goto_1

    .line 586
    :pswitch_4
    const/16 v5, 0x2d

    .line 587
    const v3, 0x7f0f0072

    .line 588
    const v4, 0x7f020141

    .line 589
    goto :goto_1

    .line 591
    :pswitch_5
    const/16 v5, 0x32

    .line 592
    const v3, 0x7f0f0071

    .line 593
    const v4, 0x7f020140

    .line 594
    goto :goto_1

    .line 606
    .end local v8    # "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    :cond_1
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 607
    return-object v6

    .line 564
    nop

    :pswitch_data_0
    .packed-switch 0x16
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_1
    .end packed-switch
.end method

.method private initialize()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 404
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    .line 406
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-direct {p0}, Lcom/android/camera/effect/EffectController;->initAiSceneFilterInfo()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 407
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-direct {p0}, Lcom/android/camera/effect/EffectController;->initPrivateFilterInfo()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 408
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-direct {p0}, Lcom/android/camera/effect/EffectController;->initNormalFilterInfoNew()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 409
    invoke-static {}, Lcom/android/camera/Device;->isIndiaBeautyFilter()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 410
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-static {}, Lcom/android/camera/effect/BeautyInfoFactory;->initIndiaBeautyFilterInfo()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 414
    :goto_0
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-direct {p0}, Lcom/android/camera/effect/EffectController;->initStickerFilterInfo()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 415
    return-void

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-static {}, Lcom/android/camera/effect/BeautyInfoFactory;->initBeautyFilterInfo()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method private varargs postNotifyEffectChanged([I)V
    .locals 3
    .param p1, "changeType"    # [I

    .prologue
    .line 126
    iget-object v2, p0, Lcom/android/camera/effect/EffectController;->mChangedListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "listener$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/EffectController$EffectChangedListener;

    .line 127
    .local v0, "listener":Lcom/android/camera/effect/EffectController$EffectChangedListener;
    invoke-interface {v0, p1}, Lcom/android/camera/effect/EffectController$EffectChangedListener;->onEffectChanged([I)V

    goto :goto_0

    .line 129
    .end local v0    # "listener":Lcom/android/camera/effect/EffectController$EffectChangedListener;
    :cond_0
    return-void
.end method

.method public static declared-synchronized releaseInstance()V
    .locals 2

    .prologue
    const-class v1, Lcom/android/camera/effect/EffectController;

    monitor-enter v1

    .line 154
    :try_start_0
    sget-object v0, Lcom/android/camera/effect/EffectController;->sInstance:Lcom/android/camera/effect/EffectController;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/EffectController;->sInstance:Lcom/android/camera/effect/EffectController;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController;->mChangedListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 155
    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/effect/EffectController;->sInstance:Lcom/android/camera/effect/EffectController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 157
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addChangeListener(Lcom/android/camera/effect/EffectController$EffectChangedListener;)V
    .locals 1
    .param p1, "effectChangedListener"    # Lcom/android/camera/effect/EffectController$EffectChangedListener;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mChangedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    invoke-static {p1}, Lcom/android/camera/EffectChangedListenerController;->addEffectChangedListener(Lcom/android/camera/effect/EffectController$EffectChangedListener;)V

    .line 116
    return-void
.end method

.method public clearEffectAttribute()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 335
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 336
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint1:Landroid/graphics/PointF;

    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 337
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint2:Landroid/graphics/PointF;

    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 338
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iput v1, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRangeWidth:F

    .line 339
    return-void
.end method

.method public copyEffectRectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 346
    new-instance v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v1, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-direct {v0, v1, v2, v2}, Lcom/android/camera/effect/EffectController$EffectRectAttribute;-><init>(Lcom/android/camera/effect/EffectController$EffectRectAttribute;Lcom/android/camera/effect/EffectController$EffectRectAttribute;Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    return-object v0
.end method

.method public enableMakeup(Z)V
    .locals 3
    .param p1, "enable"    # Z

    .prologue
    const/4 v0, 0x1

    .line 255
    iput-boolean p1, p0, Lcom/android/camera/effect/EffectController;->mBeautyEnable:Z

    .line 256
    if-nez p1, :cond_0

    .line 257
    iput-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mNeedDestroyMakeup:Z

    .line 259
    :cond_0
    new-array v0, v0, [I

    const/4 v1, 0x3

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V

    .line 260
    return-void
.end method

.method public getBlurAnimationValue()I
    .locals 4

    .prologue
    const/4 v1, -0x1

    const/16 v3, 0x8

    .line 195
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    if-ltz v0, :cond_2

    iget v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    if-gt v0, v3, :cond_2

    .line 196
    iget v2, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mBlur:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    add-int/2addr v0, v2

    iput v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    .line 197
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    if-gt v3, v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mBlur:Z

    if-eqz v0, :cond_0

    .line 198
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    iput v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideEffectIndex:I

    .line 200
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    if-ltz v0, :cond_2

    iget v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    if-gt v0, v3, :cond_2

    .line 201
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mBlurStep:I

    mul-int/lit16 v0, v0, 0xd4

    div-int/lit8 v0, v0, 0x8

    return v0

    :cond_1
    move v0, v1

    .line 196
    goto :goto_0

    .line 204
    :cond_2
    return v1
.end method

.method public getCurrentSticker()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mCurrentSticker:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceRotation()F
    .locals 1

    .prologue
    .line 370
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mDeviceRotation:F

    return v0
.end method

.method public getEffect(Z)I
    .locals 3
    .param p1, "includeOverride"    # Z

    .prologue
    const/4 v2, -0x1

    .line 208
    monitor-enter p0

    .line 209
    if-eqz p1, :cond_0

    :try_start_0
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideEffectIndex:I

    if-eq v0, v2, :cond_0

    .line 210
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideEffectIndex:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 213
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mEffectId:I

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideAiEffectIndex:I

    if-eq v0, v2, :cond_1

    .line 214
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideAiEffectIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    .line 216
    :cond_1
    :try_start_2
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mEffectId:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    .line 208
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getEffectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    return-object v0
.end method

.method public getEffectCount(I)I
    .locals 2
    .param p1, "category"    # I

    .prologue
    .line 391
    iget-object v1, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 392
    .local v0, "infoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    if-nez v0, :cond_0

    .line 393
    const/4 v1, 0x0

    return v1

    .line 395
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    return v1
.end method

.method public getEffectGroup(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;
    .locals 4
    .param p1, "canvas"    # Lcom/android/gallery3d/ui/GLCanvas;
    .param p2, "renderGroup"    # Lcom/android/camera/effect/renders/RenderGroup;
    .param p3, "isWhole"    # Z
    .param p4, "isSnapshot"    # Z
    .param p5, "renderId"    # I

    .prologue
    .line 612
    invoke-static {}, Lcom/android/camera/Device;->isSupportedShaderEffect()Z

    move-result v1

    if-nez v1, :cond_0

    .line 613
    const/4 v1, 0x0

    return-object v1

    .line 616
    :cond_0
    if-nez p3, :cond_1

    invoke-virtual {p2, p5}, Lcom/android/camera/effect/renders/RenderGroup;->isNeedInit(I)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 617
    return-object p2

    .line 620
    :cond_1
    const/4 v0, 0x1

    .line 621
    .local v0, "category":I
    const/4 v1, -0x1

    if-le p5, v1, :cond_2

    .line 622
    invoke-static {p5}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v0

    .line 624
    :cond_2
    sget-object v1, Lcom/android/camera/effect/EffectController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getEffectGroup: renderId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    sget-object v1, Lcom/android/camera/effect/EffectController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getEffectGroup: category = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    packed-switch v0, :pswitch_data_0

    .line 647
    sget-object v1, Lcom/android/camera/effect/EffectController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "invalid renderId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    :goto_0
    return-object p2

    .line 628
    :pswitch_0
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/effect/EffectController;->getPrivateRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 632
    :pswitch_1
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/effect/EffectController;->getAiSceneRenderNew(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 635
    :pswitch_2
    invoke-direct/range {p0 .. p5}, Lcom/android/camera/effect/EffectController;->getNormalRenderNew(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZZI)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 638
    :pswitch_3
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/android/camera/effect/EffectController;->getBeautyRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 641
    :pswitch_4
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/android/camera/effect/EffectController;->getStickerRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;ZI)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 644
    :pswitch_5
    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/EffectController;->getMakeupRender(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/renders/RenderGroup;)Lcom/android/camera/effect/renders/RenderGroup;

    goto :goto_0

    .line 626
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_1
    .end packed-switch
.end method

.method public getEffectRectF()Landroid/graphics/RectF;
    .locals 2

    .prologue
    .line 342
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v1, v1, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRectF:Landroid/graphics/RectF;

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    return-object v0
.end method

.method public getFilterInfo(I)Ljava/util/ArrayList;
    .locals 1
    .param p1, "category"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/camera/effect/FilterInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 400
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public getInvertFlag()I
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mInvertFlag:I

    return v0
.end method

.method public getOrientation()I
    .locals 1

    .prologue
    .line 362
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mOrientation:I

    return v0
.end method

.method public getTiltShiftMaskAlpha()F
    .locals 1

    .prologue
    .line 320
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mTiltShiftMaskAlpha:F

    return v0
.end method

.method public hasEffect()Z
    .locals 2

    .prologue
    .line 294
    monitor-enter p0

    .line 295
    :try_start_0
    invoke-static {}, Lcom/android/camera/Device;->isSupportedShaderEffect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 296
    iget v0, p0, Lcom/android/camera/effect/EffectController;->mEffectId:I

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, v1, :cond_0

    .line 297
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    .line 296
    if-nez v0, :cond_0

    .line 298
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    .line 296
    if-nez v0, :cond_0

    .line 299
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit p0

    .line 295
    return v0

    .line 296
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 295
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 294
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isBackGroundBlur()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 374
    invoke-virtual {p0, v0}, Lcom/android/camera/effect/EffectController;->getEffect(Z)I

    move-result v1

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_BLUR:I

    if-ne v1, v2, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isBeautyFrameReady()Z
    .locals 1

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mBeautyFrameReady:Z

    return v0
.end method

.method public isDrawGradienter()Z
    .locals 1

    .prologue
    .line 281
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mDrawGradienter:Z

    return v0
.end method

.method public isDrawTilt()Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mDrawTilt:Z

    return v0
.end method

.method public isMainFrameDisplay()Z
    .locals 1

    .prologue
    .line 304
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mIsDrawMainFrame:Z

    return v0
.end method

.method public isMakeupEnable()Z
    .locals 1

    .prologue
    .line 234
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mBeautyEnable:Z

    return v0
.end method

.method public isNeedDrawPeaking()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mDrawPeaking:Z

    return v0
.end method

.method public isNeedRect(I)Z
    .locals 5
    .param p1, "renderId"    # I

    .prologue
    .line 378
    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v0

    .line 379
    .local v0, "category":I
    iget-object v4, p0, Lcom/android/camera/effect/EffectController;->mFilterInfoMap:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 380
    .local v3, "infoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    if-eqz v3, :cond_1

    .line 381
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "info$iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/effect/FilterInfo;

    .line 382
    .local v1, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v1}, Lcom/android/camera/effect/FilterInfo;->getId()I

    move-result v4

    if-ne v4, p1, :cond_0

    .line 383
    invoke-virtual {v1}, Lcom/android/camera/effect/FilterInfo;->isNeedRect()Z

    move-result v4

    return v4

    .line 387
    .end local v1    # "info":Lcom/android/camera/effect/FilterInfo;
    .end local v2    # "info$iterator":Ljava/util/Iterator;
    :cond_1
    const/4 v4, 0x0

    return v4
.end method

.method public isStickerEnable()Z
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mCurrentSticker:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public needDestroyMakeup()Z
    .locals 1

    .prologue
    .line 247
    iget-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mNeedDestroyMakeup:Z

    return v0
.end method

.method public removeChangeListener(Lcom/android/camera/effect/EffectController$EffectChangedListener;)Z
    .locals 1
    .param p1, "effectChangedListener"    # Lcom/android/camera/effect/EffectController$EffectChangedListener;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mChangedListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 120
    const/4 v0, 0x1

    return v0

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mChangedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 132
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mBeautyEnable:Z

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/effect/EffectController;->mNeedDestroyMakeup:Z

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/EffectController;->mCurrentSticker:Ljava/lang/String;

    .line 135
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mDrawPeaking:Z

    .line 136
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mDrawTilt:Z

    .line 137
    iput-boolean v1, p0, Lcom/android/camera/effect/EffectController;->mDrawGradienter:Z

    .line 138
    sget-object v0, Lcom/android/camera/effect/EffectController;->EFFECT_ALL_CHANGE_TYPES:[I

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V

    .line 139
    return-void
.end method

.method public setAiSceneEffect(I)V
    .locals 2
    .param p1, "effect"    # I

    .prologue
    .line 169
    invoke-static {p1}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 170
    iput p1, p0, Lcom/android/camera/effect/EffectController;->mOverrideAiEffectIndex:I

    .line 174
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 175
    return-void

    .line 171
    :cond_1
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne p1, v0, :cond_0

    .line 172
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/effect/EffectController;->mOverrideAiEffectIndex:I

    goto :goto_0
.end method

.method public setCurrentSticker(Ljava/lang/String;)V
    .locals 3
    .param p1, "sticker"    # Ljava/lang/String;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/android/camera/effect/EffectController;->mCurrentSticker:Ljava/lang/String;

    .line 222
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x2

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V

    .line 223
    return-void
.end method

.method public setDestroyMakeup(Z)V
    .locals 0
    .param p1, "destroyMakeup"    # Z

    .prologue
    .line 251
    iput-boolean p1, p0, Lcom/android/camera/effect/EffectController;->mNeedDestroyMakeup:Z

    .line 252
    return-void
.end method

.method public setDeviceRotation(ZF)V
    .locals 0
    .param p1, "isLying"    # Z
    .param p2, "rotation"    # F

    .prologue
    .line 366
    if-eqz p1, :cond_0

    const/high16 p2, -0x40800000    # -1.0f

    .end local p2    # "rotation":F
    :cond_0
    iput p2, p0, Lcom/android/camera/effect/EffectController;->mDeviceRotation:F

    .line 367
    return-void
.end method

.method public setDrawGradienter(Z)V
    .locals 3
    .param p1, "drawGradienter"    # Z

    .prologue
    .line 285
    iput-boolean p1, p0, Lcom/android/camera/effect/EffectController;->mDrawGradienter:Z

    .line 286
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x6

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V

    .line 287
    return-void
.end method

.method public setDrawPeaking(Z)V
    .locals 3
    .param p1, "drawPeaking"    # Z

    .prologue
    .line 263
    iput-boolean p1, p0, Lcom/android/camera/effect/EffectController;->mDrawPeaking:Z

    .line 264
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x4

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V

    .line 265
    return-void
.end method

.method public setDrawTilt(Z)V
    .locals 3
    .param p1, "drawTilt"    # Z

    .prologue
    .line 276
    iput-boolean p1, p0, Lcom/android/camera/effect/EffectController;->mDrawTilt:Z

    .line 277
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x5

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V

    .line 278
    return-void
.end method

.method public setEffect(I)V
    .locals 3
    .param p1, "effect"    # I

    .prologue
    .line 162
    monitor-enter p0

    .line 163
    :try_start_0
    iput p1, p0, Lcom/android/camera/effect/EffectController;->mEffectId:I

    .line 164
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x1

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-direct {p0, v0}, Lcom/android/camera/effect/EffectController;->postNotifyEffectChanged([I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 166
    return-void

    .line 162
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setEffectAttribute(Landroid/graphics/RectF;Landroid/graphics/PointF;Landroid/graphics/PointF;F)V
    .locals 1
    .param p1, "rectF"    # Landroid/graphics/RectF;
    .param p2, "point1"    # Landroid/graphics/PointF;
    .param p3, "point2"    # Landroid/graphics/PointF;
    .param p4, "range"    # F

    .prologue
    .line 324
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 325
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint1:Landroid/graphics/PointF;

    invoke-virtual {v0, p2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 326
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iget-object v0, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mPoint2:Landroid/graphics/PointF;

    invoke-virtual {v0, p3}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 327
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iput p4, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mRangeWidth:F

    .line 328
    return-void
.end method

.method public setInvertFlag(I)V
    .locals 1
    .param p1, "invert"    # I

    .prologue
    .line 350
    iget-object v0, p0, Lcom/android/camera/effect/EffectController;->mEffectRectAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    iput p1, v0, Lcom/android/camera/effect/EffectController$EffectRectAttribute;->mInvertFlag:I

    .line 351
    return-void
.end method

.method public setOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 358
    iput p1, p0, Lcom/android/camera/effect/EffectController;->mOrientation:I

    .line 359
    return-void
.end method

.method public setTiltShiftMaskAlpha(F)V
    .locals 0
    .param p1, "alpha"    # F

    .prologue
    .line 316
    iput p1, p0, Lcom/android/camera/effect/EffectController;->mTiltShiftMaskAlpha:F

    .line 317
    return-void
.end method
