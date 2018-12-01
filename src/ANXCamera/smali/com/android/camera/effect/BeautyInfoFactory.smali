.class public Lcom/android/camera/effect/BeautyInfoFactory;
.super Ljava/lang/Object;
.source "BeautyInfoFactory.java"


# static fields
.field private static final synthetic -com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I


# direct methods
.method private static synthetic -getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory;->-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/BeautyInfoFactory;->-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

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

    const/16 v2, 0x20

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_48

    :goto_0
    :try_start_1
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A11_SNOW:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x21

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_47

    :goto_1
    :try_start_2
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A12_SEA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x22

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_46

    :goto_2
    :try_start_3
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A13_AUTUMN:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x23

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_45

    :goto_3
    :try_start_4
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A14_CANDLELIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x24

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_44

    :goto_4
    :try_start_5
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A15_CAR:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x25

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_43

    :goto_5
    :try_start_6
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A16_GRASS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x26

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_42

    :goto_6
    :try_start_7
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A17_MAPLE_LEAVES:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x27

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_41

    :goto_7
    :try_start_8
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A18_SUCCULENT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x28

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_40

    :goto_8
    :try_start_9
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A19_BUILDING:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x29

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_3f

    :goto_9
    :try_start_a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A1_DOC:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2a

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3e

    :goto_a
    :try_start_b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A20_CITY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2b

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_3d

    :goto_b
    :try_start_c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A21_CLOUD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2c

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_3c

    :goto_c
    :try_start_d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A22_OVERCAST:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2d

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_3b

    :goto_d
    :try_start_e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A23_BACKLIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2e

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_3a

    :goto_e
    :try_start_f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A24_SILHOUETTE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x2f

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_39

    :goto_f
    :try_start_10
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A25_HUMAN:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x30

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_38

    :goto_10
    :try_start_11
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A26_JEWELRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x31

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_37

    :goto_11
    :try_start_12
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A27_BUDDHA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x32

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_36

    :goto_12
    :try_start_13
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A28_COW:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x33

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_35

    :goto_13
    :try_start_14
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A29_CURRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x34

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_34

    :goto_14
    :try_start_15
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A2_FLOWER:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x35

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_33

    :goto_15
    :try_start_16
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A30_MOTORBIKE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x36

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_32

    :goto_16
    :try_start_17
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A31_TEMPLE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x37

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_31

    :goto_17
    :try_start_18
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A3_FOOD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x38

    aput v2, v0, v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_30

    :goto_18
    :try_start_19
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A4_PPT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x39

    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_2f

    :goto_19
    :try_start_1a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A5_SKY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3a

    aput v2, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_2e

    :goto_1a
    :try_start_1b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A6_SUNRISE_SUNSET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3b

    aput v2, v0, v1
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_1b} :catch_2d

    :goto_1b
    :try_start_1c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A7_CAT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3c

    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c .. :try_end_1c} :catch_2c

    :goto_1c
    :try_start_1d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A8_DOG:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3d

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_1d} :catch_2b

    :goto_1d
    :try_start_1e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->A9_GREEN_PLANTS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3e

    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_1e} :catch_2a

    :goto_1e
    :try_start_1f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_MEMORY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_1f} :catch_29

    :goto_1f
    :try_start_20
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_MONO:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_20 .. :try_end_20} :catch_28

    :goto_20
    :try_start_21
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_PINK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_21
    .catch Ljava/lang/NoSuchFieldError; {:try_start_21 .. :try_end_21} :catch_27

    :goto_21
    :try_start_22
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_PORTRAIT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_22} :catch_26

    :goto_22
    :try_start_23
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_RETRO:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_23
    .catch Ljava/lang/NoSuchFieldError; {:try_start_23 .. :try_end_23} :catch_25

    :goto_23
    :try_start_24
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_ROMANTIC:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_24
    .catch Ljava/lang/NoSuchFieldError; {:try_start_24 .. :try_end_24} :catch_24

    :goto_24
    :try_start_25
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_STRONG:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_25
    .catch Ljava/lang/NoSuchFieldError; {:try_start_25 .. :try_end_25} :catch_23

    :goto_25
    :try_start_26
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_SUNNY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_26
    .catch Ljava/lang/NoSuchFieldError; {:try_start_26 .. :try_end_26} :catch_22

    :goto_26
    :try_start_27
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_SWEET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_27} :catch_21

    :goto_27
    :try_start_28
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_WARM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_28} :catch_20

    :goto_28
    :try_start_29
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->BI_YOUNG:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_29
    .catch Ljava/lang/NoSuchFieldError; {:try_start_29 .. :try_end_29} :catch_1f

    :goto_29
    :try_start_2a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_FAIRYTALE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_2a} :catch_1e

    :goto_2a
    :try_start_2b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_JAPANESE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2b .. :try_end_2b} :catch_1d

    :goto_2b
    :try_start_2c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MAZE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_2c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2c .. :try_end_2c} :catch_1c

    :goto_2c
    :try_start_2d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MINT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_2d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_2d} :catch_1b

    :goto_2d
    :try_start_2e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MOOD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_2e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2e .. :try_end_2e} :catch_1a

    :goto_2e
    :try_start_2f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MOVIE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_2f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2f .. :try_end_2f} :catch_19

    :goto_2f
    :try_start_30
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_NATURE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_30
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_30} :catch_18

    :goto_30
    :try_start_31
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_PINK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_31
    .catch Ljava/lang/NoSuchFieldError; {:try_start_31 .. :try_end_31} :catch_17

    :goto_31
    :try_start_32
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_RIDDLE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_32
    .catch Ljava/lang/NoSuchFieldError; {:try_start_32 .. :try_end_32} :catch_16

    :goto_32
    :try_start_33
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_ROMANCE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_33} :catch_15

    :goto_33
    :try_start_34
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_STORY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_34
    .catch Ljava/lang/NoSuchFieldError; {:try_start_34 .. :try_end_34} :catch_14

    :goto_34
    :try_start_35
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x17

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_35} :catch_13

    :goto_35
    :try_start_36
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_BERRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x18

    aput v2, v0, v1
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_36 .. :try_end_36} :catch_12

    :goto_36
    :try_start_37
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_COOKIE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x19

    aput v2, v0, v1
    :try_end_37
    .catch Ljava/lang/NoSuchFieldError; {:try_start_37 .. :try_end_37} :catch_11

    :goto_37
    :try_start_38
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_DELICACY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1a

    aput v2, v0, v1
    :try_end_38
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_38} :catch_10

    :goto_38
    :try_start_39
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FADE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x3f

    aput v2, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_39} :catch_f

    :goto_39
    :try_start_3a
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1b

    aput v2, v0, v1
    :try_end_3a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3a .. :try_end_3a} :catch_e

    :goto_3a
    :try_start_3b
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_KOIZORA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1c

    aput v2, v0, v1
    :try_end_3b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3b .. :try_end_3b} :catch_d

    :goto_3b
    :try_start_3c
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LATTE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x40

    aput v2, v0, v1
    :try_end_3c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3c .. :try_end_3c} :catch_c

    :goto_3c
    :try_start_3d
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x41

    aput v2, v0, v1
    :try_end_3d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3d .. :try_end_3d} :catch_b

    :goto_3d
    :try_start_3e
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIVELY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1d

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_3e} :catch_a

    :goto_3e
    :try_start_3f
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_QUIET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1e

    aput v2, v0, v1
    :try_end_3f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3f .. :try_end_3f} :catch_9

    :goto_3f
    :try_start_40
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_SODA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x1f

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_40} :catch_8

    :goto_40
    :try_start_41
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WARM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x42

    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_41 .. :try_end_41} :catch_7

    :goto_41
    :try_start_42
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x43

    aput v2, v0, v1
    :try_end_42
    .catch Ljava/lang/NoSuchFieldError; {:try_start_42 .. :try_end_42} :catch_6

    :goto_42
    :try_start_43
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_BYGONE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x44

    aput v2, v0, v1
    :try_end_43
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_43} :catch_5

    :goto_43
    :try_start_44
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x45

    aput v2, v0, v1
    :try_end_44
    .catch Ljava/lang/NoSuchFieldError; {:try_start_44 .. :try_end_44} :catch_4

    :goto_44
    :try_start_45
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FOREST:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x46

    aput v2, v0, v1
    :try_end_45
    .catch Ljava/lang/NoSuchFieldError; {:try_start_45 .. :try_end_45} :catch_3

    :goto_45
    :try_start_46
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_POLAROID:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x47

    aput v2, v0, v1
    :try_end_46
    .catch Ljava/lang/NoSuchFieldError; {:try_start_46 .. :try_end_46} :catch_2

    :goto_46
    :try_start_47
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x48

    aput v2, v0, v1
    :try_end_47
    .catch Ljava/lang/NoSuchFieldError; {:try_start_47 .. :try_end_47} :catch_1

    :goto_47
    :try_start_48
    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_YEARS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v1

    const/16 v2, 0x49

    aput v2, v0, v1
    :try_end_48
    .catch Ljava/lang/NoSuchFieldError; {:try_start_48 .. :try_end_48} :catch_0

    :goto_48
    sput-object v0, Lcom/android/camera/effect/BeautyInfoFactory;->-com-miui-filtersdk-filter-helper-FilterTypeSwitchesValues:[I

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

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initBeautyFilterInfo()Ljava/util/ArrayList;
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

    .line 16
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .local v6, "filters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    const/4 v5, 0x0

    .line 19
    .local v5, "order":I
    new-instance v7, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    .line 20
    const v10, 0x7f0f005f

    .line 21
    const v11, 0x7f02011e

    .line 19
    invoke-direct {v7, v2, v10, v11, v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 23
    .local v7, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    sget-object v2, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v2}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v9

    .line 25
    .local v9, "types":[Lcom/miui/filtersdk/filter/helper/FilterType;
    const/4 v3, 0x0

    .line 26
    .local v3, "nameResId":I
    const/4 v4, 0x0

    .line 27
    .local v4, "iconResId":I
    array-length v11, v9

    move v10, v1

    :goto_0
    if-ge v10, v11, :cond_1

    aget-object v8, v9, v10

    .line 28
    .local v8, "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    invoke-static {}, Lcom/android/camera/effect/BeautyInfoFactory;->-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 92
    :goto_1
    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    .line 93
    new-instance v0, Lcom/android/camera/effect/FilterInfo;

    .line 94
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    .line 93
    const/4 v1, 0x2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 95
    .local v0, "filter":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    const/4 v3, 0x0

    .line 97
    const/4 v4, 0x0

    .line 27
    .end local v0    # "filter":Lcom/android/camera/effect/FilterInfo;
    :cond_0
    add-int/lit8 v1, v10, 0x1

    move v10, v1

    goto :goto_0

    .line 30
    :pswitch_0
    const/16 v5, 0xa

    .line 31
    const v3, 0x7f0f0073

    .line 32
    const v4, 0x7f02011d

    .line 33
    goto :goto_1

    .line 35
    :pswitch_1
    const/16 v5, 0x14

    .line 36
    const v3, 0x7f0f0076

    .line 37
    const v4, 0x7f020119

    .line 38
    goto :goto_1

    .line 40
    :pswitch_2
    const/16 v5, 0x1e

    .line 41
    const v3, 0x7f0f0075

    .line 42
    const v4, 0x7f02011f

    .line 43
    goto :goto_1

    .line 45
    :pswitch_3
    const/16 v5, 0x28

    .line 46
    const v3, 0x7f0f007c

    .line 47
    const v4, 0x7f020122

    .line 48
    goto :goto_1

    .line 50
    :pswitch_4
    const/16 v5, 0x32

    .line 51
    const v3, 0x7f0f0074

    .line 52
    const v4, 0x7f020118

    .line 53
    goto :goto_1

    .line 55
    :pswitch_5
    const/16 v5, 0x3c

    .line 56
    const v3, 0x7f0f0077

    .line 57
    const v4, 0x7f02011b

    .line 58
    goto :goto_1

    .line 60
    :pswitch_6
    const/16 v5, 0x46

    .line 61
    const v3, 0x7f0f0078

    .line 62
    const v4, 0x7f020121

    .line 63
    goto :goto_1

    .line 65
    :pswitch_7
    const/16 v5, 0x50

    .line 66
    const v3, 0x7f0f0079

    .line 67
    const v4, 0x7f02011a

    .line 68
    goto :goto_1

    .line 70
    :pswitch_8
    const/16 v5, 0x5a

    .line 71
    const v3, 0x7f0f007a

    .line 72
    const v4, 0x7f020117

    .line 73
    goto :goto_1

    .line 75
    :pswitch_9
    const/16 v5, 0x64

    .line 76
    const v3, 0x7f0f007d

    .line 77
    const v4, 0x7f020120

    .line 78
    goto :goto_1

    .line 80
    :pswitch_a
    const/16 v5, 0x6e

    .line 81
    const v3, 0x7f0f007e

    .line 82
    const v4, 0x7f02011c

    .line 83
    goto :goto_1

    .line 85
    :pswitch_b
    const/16 v5, 0x78

    .line 86
    const v3, 0x7f0f007b

    .line 87
    const v4, 0x7f020116

    .line 88
    goto/16 :goto_1

    .line 100
    .end local v8    # "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    :cond_1
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 101
    return-object v6

    .line 28
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_4
        :pswitch_1
        :pswitch_7
        :pswitch_8
        :pswitch_5
        :pswitch_a
        :pswitch_0
        :pswitch_2
        :pswitch_9
        :pswitch_6
        :pswitch_3
        :pswitch_b
    .end packed-switch
.end method

.method public static initIndiaBeautyFilterInfo()Ljava/util/ArrayList;
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

    .line 105
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v6, "filters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/camera/effect/FilterInfo;>;"
    const/4 v5, 0x0

    .line 108
    .local v5, "order":I
    new-instance v7, Lcom/android/camera/effect/FilterInfo;

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    .line 109
    const v10, 0x7f0f005f

    .line 110
    const v11, 0x7f020126

    .line 108
    invoke-direct {v7, v2, v10, v11, v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIII)V

    .line 112
    .local v7, "info":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    sget-object v2, Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;->BEAUTY_INDIA:Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;

    invoke-static {v2}, Lcom/miui/filtersdk/filter/helper/FilterFactory;->getFiltersByScene(Lcom/miui/filtersdk/filter/helper/FilterFactory$FilterScene;)[Lcom/miui/filtersdk/filter/helper/FilterType;

    move-result-object v9

    .line 114
    .local v9, "types":[Lcom/miui/filtersdk/filter/helper/FilterType;
    const/4 v3, 0x0

    .line 115
    .local v3, "nameResId":I
    const/4 v4, 0x0

    .line 116
    .local v4, "iconResId":I
    array-length v11, v9

    move v10, v1

    :goto_0
    if-ge v10, v11, :cond_1

    aget-object v8, v9, v10

    .line 117
    .local v8, "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    invoke-static {}, Lcom/android/camera/effect/BeautyInfoFactory;->-getcom-miui-filtersdk-filter-helper-FilterTypeSwitchesValues()[I

    move-result-object v1

    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 176
    :goto_1
    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    .line 177
    new-instance v0, Lcom/android/camera/effect/FilterInfo;

    .line 178
    invoke-virtual {v8}, Lcom/miui/filtersdk/filter/helper/FilterType;->ordinal()I

    move-result v2

    .line 177
    const/4 v1, 0x2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/FilterInfo;-><init>(IIIII)V

    .line 179
    .local v0, "filter":Lcom/android/camera/effect/FilterInfo;
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    const/4 v3, 0x0

    .line 181
    const/4 v4, 0x0

    .line 116
    .end local v0    # "filter":Lcom/android/camera/effect/FilterInfo;
    :cond_0
    add-int/lit8 v1, v10, 0x1

    move v10, v1

    goto :goto_0

    .line 119
    :pswitch_0
    const/16 v5, 0xa

    .line 120
    const v3, 0x7f0f01d9

    .line 121
    const v4, 0x7f02012c

    .line 122
    goto :goto_1

    .line 124
    :pswitch_1
    const/16 v5, 0x14

    .line 125
    const v3, 0x7f0f01da

    .line 126
    const v4, 0x7f020127

    .line 127
    goto :goto_1

    .line 129
    :pswitch_2
    const/16 v5, 0x1e

    .line 130
    const v3, 0x7f0f01db

    .line 131
    const v4, 0x7f020124

    .line 132
    goto :goto_1

    .line 134
    :pswitch_3
    const/16 v5, 0x28

    .line 135
    const v3, 0x7f0f01dc

    .line 136
    const v4, 0x7f02012b

    .line 137
    goto :goto_1

    .line 139
    :pswitch_4
    const/16 v5, 0x32

    .line 140
    const v3, 0x7f0f01dd

    .line 141
    const v4, 0x7f02012e

    .line 142
    goto :goto_1

    .line 144
    :pswitch_5
    const/16 v5, 0x3c

    .line 145
    const v3, 0x7f0f01de

    .line 146
    const v4, 0x7f02012d

    .line 147
    goto :goto_1

    .line 149
    :pswitch_6
    const/16 v5, 0x46

    .line 150
    const v3, 0x7f0f01df

    .line 151
    const v4, 0x7f020128

    .line 152
    goto :goto_1

    .line 154
    :pswitch_7
    const/16 v5, 0x50

    .line 155
    const v3, 0x7f0f01e0

    .line 156
    const v4, 0x7f020129

    .line 157
    goto :goto_1

    .line 159
    :pswitch_8
    const/16 v5, 0x5a

    .line 160
    const v3, 0x7f0f01e1

    .line 161
    const v4, 0x7f02012f

    .line 162
    goto :goto_1

    .line 164
    :pswitch_9
    const/16 v5, 0x64

    .line 165
    const v3, 0x7f0f01e2

    .line 166
    const v4, 0x7f02012a

    .line 167
    goto :goto_1

    .line 169
    :pswitch_a
    const/16 v5, 0x6e

    .line 170
    const v3, 0x7f0f01e3

    .line 171
    const v4, 0x7f020125

    .line 172
    goto :goto_1

    .line 184
    .end local v8    # "type":Lcom/miui/filtersdk/filter/helper/FilterType;
    :cond_1
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 185
    return-object v6

    .line 117
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_a
        :pswitch_1
        :pswitch_6
        :pswitch_7
        :pswitch_9
        :pswitch_3
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_8
    .end packed-switch
.end method
