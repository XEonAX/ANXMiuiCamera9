.class public Lcom/android/camera/effect/BeautyValues;
.super Ljava/lang/Object;
.source "BeautyValues.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/BeautyValues$1;
    }
.end annotation


# static fields
.field private static final synthetic -com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/android/camera/effect/BeautyValues;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mBeautyChin:I

.field public mBeautyEnlargeEye:I

.field public mBeautyLevel:Ljava/lang/String;

.field public mBeautyLips:I

.field public mBeautyNeck:I

.field public mBeautyNose:I

.field public mBeautyRisorius:I

.field public mBeautySkinColor:I

.field public mBeautySkinSmooth:I

.field public mBeautySlimFace:I

.field public mBeautySlimNose:I

.field public mBeautySmile:I


# direct methods
.method private static synthetic -getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/android/camera/effect/BeautyValues;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/BeautyValues;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

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
    sput-object v0, Lcom/android/camera/effect/BeautyValues;->-com-android-camera-effect-BeautyParameters$TypeSwitchesValues:[I

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

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 142
    new-instance v0, Lcom/android/camera/effect/BeautyValues$1;

    invoke-direct {v0}, Lcom/android/camera/effect/BeautyValues$1;-><init>()V

    sput-object v0, Lcom/android/camera/effect/BeautyValues;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 95
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    .line 103
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    .line 104
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    .line 111
    :goto_0
    return-void

    .line 106
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    .line 108
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    .line 109
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    goto :goto_0
.end method

.method public constructor <init>(Lcom/android/camera/effect/BeautyValues;)V
    .locals 1
    .param p1, "other"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    if-eqz p1, :cond_0

    .line 76
    iget-object v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 77
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    .line 78
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    .line 79
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    .line 80
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    .line 82
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    .line 83
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    .line 84
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    .line 85
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    .line 86
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    .line 87
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    .line 88
    iget v0, p1, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    iput v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    .line 90
    :cond_0
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    return v0
.end method

.method public get(Lcom/android/camera/effect/BeautyParameters$Type;)I
    .locals 2
    .param p1, "type"    # Lcom/android/camera/effect/BeautyParameters$Type;

    .prologue
    .line 114
    invoke-static {}, Lcom/android/camera/effect/BeautyValues;->-getcom-android-camera-effect-BeautyParameters$TypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 138
    const/4 v0, 0x0

    return v0

    .line 116
    :pswitch_0
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    return v0

    .line 118
    :pswitch_1
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    return v0

    .line 120
    :pswitch_2
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    return v0

    .line 122
    :pswitch_3
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    return v0

    .line 124
    :pswitch_4
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    return v0

    .line 126
    :pswitch_5
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    return v0

    .line 128
    :pswitch_6
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    return v0

    .line 130
    :pswitch_7
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    return v0

    .line 132
    :pswitch_8
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    return v0

    .line 134
    :pswitch_9
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    return v0

    .line 136
    :pswitch_a
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    return v0

    .line 114
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_2
        :pswitch_6
        :pswitch_8
        :pswitch_4
        :pswitch_5
        :pswitch_1
        :pswitch_a
        :pswitch_9
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 32
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 33
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v1, "beauty level: %s | sc: %d | sf: %d | ss: %d | ee: %d "

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    .line 34
    iget-object v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    .line 33
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 36
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 37
    const-string/jumbo v1, "3d beauty level: %s | sf: %d | ee: %d | ns: %d | rs: %d | lp: %d | cn: %d | nk: %d | se: %d | sn: %d"

    .line 36
    const/16 v2, 0xa

    new-array v2, v2, [Ljava/lang/Object;

    .line 38
    iget-object v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    .line 39
    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x5

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x6

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x7

    aput-object v3, v2, v4

    .line 40
    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x8

    aput-object v3, v2, v4

    iget v3, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x9

    aput-object v3, v2, v4

    .line 36
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 51
    iget-object v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 53
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 55
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 56
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNose:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 57
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyRisorius:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 58
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyLips:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 59
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyChin:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 60
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyNeck:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 61
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySmile:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 62
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimNose:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    :goto_0
    return-void

    .line 64
    :cond_0
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 65
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 66
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 67
    iget v0, p0, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0
.end method
