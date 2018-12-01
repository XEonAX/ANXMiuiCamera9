.class public Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;
.super Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.source "LegacyMakeupParamsFragment.java"


# static fields
.field private static final synthetic -com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I


# direct methods
.method private static synthetic -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

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

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_a

    :goto_0
    :try_start_1
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_9

    :goto_1
    :try_start_2
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_8

    :goto_2
    :try_start_3
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_7

    :goto_3
    :try_start_4
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_6

    :goto_4
    :try_start_5
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :goto_5
    :try_start_6
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_4

    :goto_6
    :try_start_7
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_3

    :goto_7
    :try_start_8
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_2

    :goto_8
    :try_start_9
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_1

    :goto_9
    :try_start_a
    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_0

    :goto_a
    sput-object v0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

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

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected beautyTypetoPosition(Lcom/android/camera/effect/BeautyParameters$Type;)I
    .locals 3
    .param p1, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-static {}, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->-getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 79
    return v2

    .line 73
    :pswitch_0
    return v2

    .line 75
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 77
    :pswitch_2
    const/4 v0, 0x2

    return v0

    .line 71
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected initItems()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;>;"
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 25
    const v2, 0x7f020103

    const v3, 0x7f0f01ac

    .line 24
    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 27
    const v2, 0x7f020108

    const v3, 0x7f0f01a9

    .line 26
    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;

    .line 29
    const v2, 0x7f02010a

    const v3, 0x7f0f01aa

    .line 28
    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$MakeupItem;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    return-object v0
.end method

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;-><init>(Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;)V

    return-object v0
.end method

.method protected provideItemHorizontalMargin()I
    .locals 2

    .prologue
    .line 35
    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 36
    const v1, 0x7f09006c

    .line 35
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method
